Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bfaabsm908545266b.181.2025.02.17.09.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B8EF05F936;
	Mon, 17 Feb 2025 17:00:16 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  "open
 list:Virt" <qemu-arm@nongnu.org>
Subject: Re: [PULL 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
In-Reply-To: <CAFEAcA8Kf4eF-nxEsxhPZnV3pwU+9kXLq1zXDi61ODQEQXaAYw@mail.gmail.com>
	(Peter Maydell's message of "Mon, 17 Feb 2025 16:30:22 +0000")
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
	<20250110131754.2769814-24-alex.bennee@linaro.org>
	<CAFEAcA8Kf4eF-nxEsxhPZnV3pwU+9kXLq1zXDi61ODQEQXaAYw@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 17:00:16 +0000
Message-ID: <875xl8ld5r.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CpwAHT5pCSO4

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Jan 2025 at 13:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> Now that we have virtio-gpu Vulkan support, let's add a test for it.
>> Currently this is using images build by buildroot:
>>
>>   https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.h=
tml
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>
>
> Hi; this test currently fails for me with a clang sanitizer
> build (ubuntu 24.04 host). It seems to run weston in the guest,
> which fails with:
>
> 2025-02-17 16:11:10,218: [16:11:10.672] Command line: weston -B
> headless --renderer gl --shell kiosk -- vkmark -b:duration=3D1.0
> 2025-02-17 16:11:10,224: [16:11:10.675] OS: Linux, 6.11.10, #2 SMP Thu
> Dec  5 16:27:12 GMT 2024, aarch64
> 2025-02-17 16:11:10,225: [16:11:10.680] Flight recorder: enabled
> 2025-02-17 16:11:10,226: [16:11:10.681] warning: XDG_RUNTIME_DIR
> "/tmp" is not configured
> 2025-02-17 16:11:10,226: correctly.  Unix access mode must be 0700
> (current mode is 0777),
> 2025-02-17 16:11:10,226: and must be owned by the user UID 0 (current
> owner is UID 0).
> 2025-02-17 16:11:10,227: Refer to your distribution on how to get it, or
> 2025-02-17 16:11:10,227:
> http://www.freedesktop.org/wiki/Specifications/basedir-spec
> 2025-02-17 16:11:10,228: on how to implement it.
> 2025-02-17 16:11:10,240: [16:11:10.695] Starting with no config file.
> 2025-02-17 16:11:10,253: [16:11:10.707] Output repaint window is 7 ms max=
imum.
> 2025-02-17 16:11:10,262: [16:11:10.716] Loading module
> '/usr/lib/libweston-14/headless-backend.so'
> 2025-02-17 16:11:10,313: [16:11:10.768] Loading module
> '/usr/lib/libweston-14/gl-renderer.so'
> 2025-02-17 16:11:21,858: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:21,959: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:22,023: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:22,032: [16:11:22.486] failed to initialize display
> 2025-02-17 16:11:22,033: [16:11:22.488] EGL error state:
> EGL_NOT_INITIALIZED (0x3001)
> 2025-02-17 16:11:22,036: [16:11:22.490] fatal: failed to create
> compositor backend

I guess we can catch that in the test case and fail the test.

>
> Then eventually the test framework times it ou and sends it
> a SIGTERM, and QEMU SEGVs inside libEGL trying to run an
> exit handler:
>
> qemu-system-aarch64: terminating on signal 15 from pid 242824
> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/py=
thon3)
> UndefinedBehaviorSanitizer:DEADLYSIGNAL
> =3D=3D243045=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addr=
ess
> 0x73fbfefe6a31 (pc 0x73fbba9788e9 bp 0x73fbbbe0af80 sp 0x7ffd676fbfe0
> T243045)
> =3D=3D243045=3D=3DThe signal is caused by a READ memory access.
>     #0 0x73fbba9788e9
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #1 0x73fbbaafc178
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16fc178)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #2 0x73fbba62564f
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x122564f)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #3 0x73fbbab067d7
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x17067d7)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #4 0x73fbba63b786
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x123b786)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #5 0x73fbba96290a
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x156290a)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #6 0x73fbba941c5c
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x1541c5c)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>     #7 0x73fbc2041f20
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f20) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #8 0x73fbc2041f68
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f68) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #9 0x73fbc2034ca9
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x34ca9) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #10 0x73fbc203ae90
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3ae90) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #11 0x73fbc203aeda
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3aeda) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #12 0x73fbc20a45f5
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa45f5) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #13 0x73fbc20a2bfc
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa2bfc) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>     #14 0x73fbd3047a75 in __run_exit_handlers stdlib/exit.c:108:8

Ok - interesting that we can corrupt the nVidia state so much it dies on
cleanup. I'll try and replicate with my intel setup.

>     #15 0x73fbd3047bbd in exit stdlib/exit.c:138:3
>     #16 0x5a5bab5e3fdb in qemu_default_main
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/m=
ain.c:52:5
>     #17 0x5a5bab5e3f9e in main
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/m=
ain.c:76:9
>     #18 0x73fbd302a1c9 in __libc_start_call_main
> csu/../sysdeps/nptl/libc_start_call_main.h:58:16
>     #19 0x73fbd302a28a in __libc_start_main csu/../csu/libc-start.c:360:3
>     #20 0x5a5ba9c5b554 in _start
> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-a=
arch64+0x15dc554)
> (BuildId: 8efda3601b42aa2644dde35d1d63f7b22b649a33)
>
> UndefinedBehaviorSanitizer can not provide additional info.
> SUMMARY: UndefinedBehaviorSanitizer: SEGV
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
> =3D=3D243045=3D=3DABORTING
>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
