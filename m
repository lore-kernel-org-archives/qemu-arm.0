Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1940444njb;
        Thu, 20 Feb 2025 03:29:45 -0800 (PST)
X-Received: by 2002:a05:6902:2309:b0:e5b:4651:b5c6 with SMTP id 3f1490d57ef6-e5e1925ad68mr2407727276.23.1740050985613;
        Thu, 20 Feb 2025 03:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740050985; cv=none;
        d=google.com; s=arc-20240605;
        b=OPB3V/uDUA+Y/MMVBG5bcpCHU6zz2Vo45Je5VrqHKQzsoT2z/W+9NkxvXk3i/xxPz7
         1GSbwYsG2+5Jd/+84OR10HP3BlwBYq5NN8RUuD+kEEdlfjwkVJpwF2qRr3rBqC/XMiEt
         glsIaXrX2/y6OJjzNgSqUnWZK1KEACvbYVVUjElpcnXdBXhoNZo7Zlmj/aWiWUDtGtth
         Q44gyxALert0wSR8cNK5giHLVgWZJd8vApUQNPZTBwVYRxx/e1ICgk8cmoUt2hwA1376
         Mb5Oyc+1MJKxT2caBcwe6uZaSB4PnxrveoUKfIC/ntRJNP8oVaUecJH+7UPp2Sfyf6iG
         uUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FYvtCaOUilZxoVI3teCxdE3xc/8dUrS1U5eBBCdYFeM=;
        fh=Wpa46SpZDMN78hZs0lGDVz32mDHT0NNZcNlwn+8G+j4=;
        b=Q8yMQZaTsoBqU5dZgYTlBpSjEyzCDOQ9fiHiu9CTQ6ESL2a3F1VPYCikM2uAeMGnuc
         xbUjFKjnSZHayjb6HV0QTjRu8wLyG2JUHiu7j8/gXWcFmsXcFjS3uU6rfo7VLYMQnbAy
         3jF7SiygW8VNiwz2r3gR4vzVCUig0nfg6Hw6SFH1ISUGYjE8AtyTrSK9NyOpVzDoasQi
         tEFTias232Ak/nfUTOiqkV4CXy17z0UMn7hEnPJWq00GPtA/2hR0hU1GddMGoRA8TZuT
         EK2R9MOaXEYYCeCnTlIxEI/8rj1opT6F+4sMvh63mNY+cWYq0f3dFUDHcw2GcXDJK9I6
         bPuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkMbbCiF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dadb69c85sor7805371276.0.2025.02.20.03.29.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 03:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkMbbCiF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740050985; x=1740655785; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYvtCaOUilZxoVI3teCxdE3xc/8dUrS1U5eBBCdYFeM=;
        b=dkMbbCiF2ShAmuCAeTTCETIz8J/Wv5Oiv2vk+yh/bwmwcdJUiisa2dnYVxpkgHdz1l
         m0JhUKlkhsrf50lXjlsBcJKYszTkJ38H4YMNrY8oqB+I3zBXsuiGFiaJ+10/W10OTqYH
         PxEwVVCZBhilQZhI3CdRfkhmJhbQd6O7UfjJWuxGwSC/N8a1ZtFwxhFc6/stnPtwzKRm
         EkXORuYRIh+niezFQEkhLxF2JGXVGamhwilN517Lh6DlRuzkVw7hmeHBd/X8WI3cFpeY
         /ObBAacTjXx4pBfyj5pzTzcLGzAFuCCm3cSsyJ2KI+9pHE6QOFdTCU5pl+HysYyfoj8e
         JZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740050985; x=1740655785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYvtCaOUilZxoVI3teCxdE3xc/8dUrS1U5eBBCdYFeM=;
        b=Ob9l3ZO+qSUvZ3iw7FfDlWjoi/v/SwDiJhXzKClyUb3EmgRPfQ2wZ6o9lOh1fhqiu4
         6Db+jpSpDor4xHi5b4xm3ROrQbqvikeGfdgwZ8cxlWQWFm1F7j7/JqjOJVirnBqlvNOr
         O6oedVgGJMhM8PLMli7bMNvyFgeSdu6COb6H9D9Q+1qUXyL2JqrZLmybrvlxZpwkd18Z
         hqJaehsGyQpSgkjQ8tsU+ECesV9r9GjJd29ZbfbIqmT1EI6kBS5rHwDQvSfL1eyKnFDW
         XKcXF61Wb0hejZvhgO0c4sOqGXRaMjURbyH+rBAlPWvS3e01pzCetVzV8g/utMxhEGd/
         xSJA==
X-Gm-Message-State: AOJu0YxcG3yKzF0fDjGKfC3I8wVvYvrKJEIfENVSmqeWds8UF9ybkMCr
	q21QLEG/pn7fA1t5TnfBsIg1PPVUNqL8LUlTRvN6Rt5rFF1bvxk9IG5HZ/IbSPnWOWBNKbSfpti
	WvTs4AIupgZ0sIoTXmY0LipmhSd+Ja2b7VcL6TAeZ2K9BxSMcKAo=
X-Gm-Gg: ASbGncuxnfA1RV3AMbJgL4ixjrnCVEL5La++DvfXQgL4Ord966BGi9lS8qanBEA3TRv
	Nt9mAo+7Dr5Ddqlx+ywgw/0slR/yfjbF/FVKzAalLpH711ji57DUc8pRWSjYs5ovTS14AoCrP2Q
	==
X-Google-Smtp-Source: AGHT+IESlkncuzTlienwxRqWW4diDBsaPjX/9Vu+FcyHLyQ28vIIJtEZje/zJZXHYM/ULJUqLgmjiG2k1j13TfdiYp0=
X-Received: by 2002:a05:6902:11c9:b0:e5b:4760:f567 with SMTP id
 3f1490d57ef6-e5e19238f9cmr2630244276.16.1740050985049; Thu, 20 Feb 2025
 03:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20250219150009.1662688-1-alex.bennee@linaro.org>
In-Reply-To: <20250219150009.1662688-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 11:29:33 +0000
X-Gm-Features: AWEUYZlJQq5UYfSpdZ4s4yzZg7uTgnEiAbwjQkyXmV_eWCTtQYW95nUnEt0fT-A
Message-ID: <CAFEAcA_TJhgrcfZ-9JY74OvkiGXPuYHJF16=_3Y+=r6+JfXMGA@mail.gmail.com>
Subject: Re: [PATCH 0/4] testing/next (aarch64 virt gpu tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uudKyMGi/gjk

On Wed, 19 Feb 2025 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi,
>
> As I was looking at the native context patches I realised our existing
> GPU testing is a little sparse. I took the opportunity to split the
> test from the main virt test and then extend it to exercise the 3
> current display modes (virgl, virgl+blobs, vulkan).
>
> I've added some additional validation to ensure we have the devices we
> expect before we start. It doesn't currently address the reported
> clang issues but hopefully it will help narrow down what fails and
> what works.

Running on my setup with a clang sanitizer build I get

ok 1 test_aarch64_virt_gpu.Aarch64VirtGPUMachine.test_aarch64_virt_with_vir=
gl_blobs_gpu
ok 2 test_aarch64_virt_gpu.Aarch64VirtGPUMachine.test_aarch64_virt_with_vir=
gl_gpu

and then the third test timed out.

For the timing out case, the console prints


2025-02-20 11:12:55,208: # weston -B headless --renderer gl --shell
kiosk -- vkmark -b:duration=3D1.0
2025-02-20 11:12:55,288: Date: 2025-02-20 UTC
2025-02-20 11:12:55,288: [11:12:54.841] weston 14.0.0
2025-02-20 11:12:55,289: https://wayland.freedesktop.org
2025-02-20 11:12:55,289: Bug reports to:
https://gitlab.freedesktop.org/wayland/weston/issues/
2025-02-20 11:12:55,289: Build: 14.0.0
2025-02-20 11:12:55,291: [11:12:54.847] Command line: weston -B
headless --renderer gl --shell kiosk -- vkmark -b:duration=3D1.0
2025-02-20 11:12:55,298: [11:12:54.850] OS: Linux, 6.11.10, #2 SMP Thu
Dec  5 16:27:12 GMT 2024, aarch64
2025-02-20 11:12:55,299: [11:12:54.855] Flight recorder: enabled
2025-02-20 11:12:55,300: [11:12:54.857] warning: XDG_RUNTIME_DIR
"/tmp" is not configured
2025-02-20 11:12:55,301: correctly.  Unix access mode must be 0700
(current mode is 0777),
2025-02-20 11:12:55,301: and must be owned by the user UID 0 (current
owner is UID 0).
2025-02-20 11:12:55,302: Refer to your distribution on how to get it, or
2025-02-20 11:12:55,302:
http://www.freedesktop.org/wiki/Specifications/basedir-spec
2025-02-20 11:12:55,302: on how to implement it.
2025-02-20 11:12:55,308: [11:12:54.865] Starting with no config file.
2025-02-20 11:12:55,322: [11:12:54.879] Output repaint window is 7 ms maxim=
um.
2025-02-20 11:12:55,333: [11:12:54.890] Loading module
'/usr/lib/libweston-14/headless-backend.so'
2025-02-20 11:12:55,407: [11:12:54.963] Loading module
'/usr/lib/libweston-14/gl-renderer.so'
2025-02-20 11:13:06,936: [11:13:06.491] Using rendering device:
/dev/dri/renderD128
2025-02-20 11:13:07,083: [11:13:06.640] EGL version: 1.5
2025-02-20 11:13:07,084: [11:13:06.641] EGL vendor: Mesa Project
2025-02-20 11:13:07,085: [11:13:06.641] EGL client APIs: OpenGL OpenGL_ES
2025-02-20 11:13:07,088: [11:13:06.645] EGL features:
2025-02-20 11:13:07,089: EGL Wayland extension: yes
2025-02-20 11:13:07,089: context priority: no
2025-02-20 11:13:07,089: buffer age: no
2025-02-20 11:13:07,089: partial update: no
2025-02-20 11:13:07,090: swap buffers with damage: no
2025-02-20 11:13:07,090: configless context: yes
2025-02-20 11:13:07,090: surfaceless context: yes
2025-02-20 11:13:07,090: dmabuf support: modifiers
2025-02-20 11:13:07,206: [11:13:06.763] GL version: OpenGL ES 3.2 Mesa 24.3=
.0
2025-02-20 11:13:07,207: [11:13:06.764] GLSL version: OpenGL ES GLSL ES 3.2=
0
2025-02-20 11:13:07,207: [11:13:06.764] GL vendor: Mesa
2025-02-20 11:13:07,208: [11:13:06.764] GL renderer: virgl (Quadro
P400/PCIe/SSE2)
2025-02-20 11:13:08,201: [11:13:07.757] GL ES 3.2 - renderer features:
2025-02-20 11:13:08,202: read-back format: ARGB8888
2025-02-20 11:13:08,203: glReadPixels supports y-flip: yes
2025-02-20 11:13:08,203: glReadPixels supports PBO: yes
2025-02-20 11:13:08,204: wl_shm 10 bpc formats: yes
2025-02-20 11:13:08,204: wl_shm 16 bpc formats: yes
2025-02-20 11:13:08,205: wl_shm half-float formats: yes
2025-02-20 11:13:08,206: internal R and RG formats: yes
2025-02-20 11:13:08,209: OES_EGL_image_external: yes
2025-02-20 11:13:08,210: [11:13:07.767] Using GL renderer
2025-02-20 11:13:08,211: [11:13:07.768] Registered plugin API
'weston_windowed_output_api_headless_v2' of size 16
2025-02-20 11:13:08,215: [11:13:07.772] Color manager: no-op
2025-02-20 11:13:08,216: protocol support: no
2025-02-20 11:13:08,226: [11:13:07.782] Output 'headless' attempts
EOTF mode SDR and colorimetry mode default.
2025-02-20 11:13:08,227: [11:13:07.784] Output 'headless' using color
profile: stock sRGB color profile

and that's the last thing it outputs.

The sanitizer reports that when the framework sends the SIGTERM
because of the timeout we get a write to a NULL pointer (but
interesting not this time in an atexit callback):

UndefinedBehaviorSanitizer:DEADLYSIGNAL
=3D=3D471863=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addres=
s
0x000000000000 (pc 0x7a18ceaafe80 bp 0x000000000000 sp 0x7ffe8e3ff6d0
T471863)
=3D=3D471863=3D=3DThe signal is caused by a WRITE memory access.
=3D=3D471863=3D=3DHint: address points to the zero page.
    #0 0x7a18ceaafe80
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16afe80)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #1 0x7a18ce9e72c0
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15e72c0)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #2 0x7a18ce9f11bb
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15f11bb)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #3 0x7a18ce6dc9d1
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x12dc9d1)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #4 0x7a18e7d15326 in vrend_renderer_create_fence
/usr/src/virglrenderer-1.0.0-1ubuntu2/obj-x86_64-linux-gnu/../src/vrend_ren=
derer.c:10883:26
    #5 0x55bfb6621871 in virtio_gpu_virgl_process_cmd
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display=
/virtio-gpu-virgl.c:973:5
    #6 0x55bfb66086ba in virtio_gpu_process_cmdq
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display=
/virtio-gpu.c:1048:9
    #7 0x55bfb661b69b in virtio_gpu_gl_handle_ctrl
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display=
/virtio-gpu-gl.c:100:5
    #8 0x55bfb74a7782 in aio_bh_call
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async=
.c:172:5
    #9 0x55bfb74a7b58 in aio_bh_poll
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async=
.c:219:13
    #10 0x55bfb74625ea in aio_dispatch
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/aio-p=
osix.c:424:5
    #11 0x55bfb74aaaea in aio_ctx_dispatch
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async=
.c:361:5
    #12 0x7a18e8dc15b4 in g_main_dispatch
/usr/src/glib2.0-2.80.0-6ubuntu3.2/debian/build/deb/../../../glib/gmain.c:3=
344:28
    #13 0x7a18e8dc16ff in g_main_context_dispatch_unlocked
/usr/src/glib2.0-2.80.0-6ubuntu3.2/debian/build/deb/../../../glib/gmain.c:4=
152:7
    #14 0x7a18e8dc16ff in g_main_context_dispatch
/usr/src/glib2.0-2.80.0-6ubuntu3.2/debian/build/deb/../../../glib/gmain.c:4=
140:3
    #15 0x55bfb74ab96b in glib_pollfds_poll
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-=
loop.c:287:9
    #16 0x55bfb74ab96b in os_host_main_loop_wait
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-=
loop.c:310:5
    #17 0x55bfb74ab96b in main_loop_wait
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-=
loop.c:589:11
    #18 0x55bfb64799e6 in qemu_main_loop
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/run=
state.c:835:9
    #19 0x55bfb7340356 in qemu_default_main
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mai=
n.c:48:14
    #20 0x55bfb734032e in main
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mai=
n.c:76:9
    #21 0x7a18e6a2a1c9 in __libc_start_call_main
csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #22 0x7a18e6a2a28a in __libc_start_main csu/../csu/libc-start.c:360:3
    #23 0x55bfb59b6554 in _start
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aar=
ch64+0x15dd554)
(BuildId: df0d680785eeda685de951dbbbbd220f5c9e773d)

UndefinedBehaviorSanitizer can not provide additional info.
SUMMARY: UndefinedBehaviorSanitizer: SEGV
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16afe80)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
=3D=3D471863=3D=3DABORTING



-- PMM
