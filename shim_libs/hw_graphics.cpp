/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "SurfaceControl"

#include <stdint.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <android/native_window.h>

#include <utils/Errors.h>
#include <utils/Log.h>
#include <utils/threads.h>

#include <binder/IPCThreadState.h>

#include <ui/DisplayInfo.h>
#include <ui/GraphicBuffer.h>
#include <ui/Rect.h>

#include <gui/ISurfaceComposer.h>
#include <gui/Surface.h>
#include <gui/SurfaceComposerClient.h>
#include <gui/SurfaceControl.h> 
 
namespace android {
// ----------------------------------------------------------------------------

 status_t SurfaceControl::setBlur(float blur) {
    status_t err = validate();
    if (err < 0) return err;
    return mClient->setBlur(mHandle, blur);
}
status_t SurfaceControl::setBlurMaskSurface(const sp<SurfaceControl>& maskSurface) {
    status_t err = validate();
    if (err < 0) return err;
    return mClient->setBlurMaskSurface(mHandle, maskSurface != 0 ? maskSurface->mHandle : 0);
}
status_t SurfaceControl::setBlurMaskSampling(uint32_t blurMaskSampling) {
    status_t err = validate();
    if (err < 0) return err;
    return mClient->setBlurMaskSampling(mHandle, blurMaskSampling);
}
status_t SurfaceControl::setBlurMaskAlphaThreshold(float alpha) {
    status_t err = validate();
    if (err < 0) return err;
    return mClient->setBlurMaskAlphaThreshold(mHandle, alpha);
}
// ----------------------------------------------------------------------------
}; // namespace android
