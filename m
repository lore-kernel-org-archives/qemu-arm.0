Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp151324njb;
        Mon, 17 Feb 2025 08:30:34 -0800 (PST)
X-Received: by 2002:a05:6902:1a42:b0:e5b:3b7a:fcb4 with SMTP id 3f1490d57ef6-e5dc97f5be8mr7500402276.1.1739809834505;
        Mon, 17 Feb 2025 08:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739809834; cv=none;
        d=google.com; s=arc-20240605;
        b=F/MhStP36cASb0z5WTWU0Ym8ALx8m3i+h07LQQmBTAyWrAy9vulDu572fLFO6xBu8R
         7i3SuJ+S6sx3PQ6qVSpeKJn/1ggutTxwz7r32TqZO8SfP40c5rVLHv8z4r21mHm+M086
         HVFw1osN8d1pWzI6fe3iYePDBrAaVyuAX+pw4fEpdOTsqgaBJeCygMYJdR1MRVrjWYPZ
         Fth4/UgtAqqHReAny6Axh3haL5cpeAVjHy9oA5ooj1DKD5GTM3VnppWfXNL0RhdSBr/m
         JVYtOV3WciLMZI72s1t29oydqvWhQhFqsFtuCZqqhnRrlX3KSjpy7Wm84pZMztTVqINW
         JcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6j7y5fwAj/00iKVpT6Y8e40xdu1PrDltjUFeJ8hW3Zk=;
        fh=ym5IroJ5AoYTLclnw1VcKHqE7MvkQGikcIM26uagIvE=;
        b=eyJn4kj8m06ygtiAYeWrF6xhDYkt/3nE/cOHf6K8MmQ4GjiKMehXhtaYau46ka+7FN
         O1/c7L7aL7m1K2yFlHNWJLFzPdyYX2JVPJyR3Atu0ctffUjH29MKS2LLlJNINSsRDamL
         HO07rvbDxX2Izmwt925aTsMIfemDmyhj01beFDwMC8rExvpzviZCBjIqQD4bsgjqTqpC
         373tXEVY7M+E+zs81JODGL2n3x+whQ7PT9gmKOKM1bAKs97lyHkDBtKxOosIUO0kFETH
         3RtWwmZ/x+9l8WQCWR0pc5JrQkj5oEiuFcUPzlLmJCjtJv1R91JqlWra4PDYvAbTJ1if
         a8Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0VBIpsa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5da0a2014fsor5678644276.4.2025.02.17.08.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 08:30:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0VBIpsa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739809834; x=1740414634; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j7y5fwAj/00iKVpT6Y8e40xdu1PrDltjUFeJ8hW3Zk=;
        b=e0VBIpsaeBu1eOAWCHR3qujw94IWpJD8rpaGsjY8j62BRBbKvvBwRm0J9Km+j+YBr0
         t4bIry0TuYldWT7d5n60Fsj3NgROwdBEdZWY+/9YkZ5BzEuTsMGsX23LPAWo6FAL+c+V
         3hZhh6et5EAcwccZMPhmOo6/vZtEgBA8Q3OLwIm646SFXzvQcY4D82mp3BqBKeKfwO9G
         Fy1HGZF/dGuHRzoiWkA2upPyo0Juvp3d3p8fylfELP6SImEhRwCAyWLEVxOAh7lfZiJW
         j+dktbyiGL65iCfDIFhjNiO2RDV/659Qj23OJjMS9qybQ0/QnbJ3S4AMjnIPPATeD+Uz
         kYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809834; x=1740414634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j7y5fwAj/00iKVpT6Y8e40xdu1PrDltjUFeJ8hW3Zk=;
        b=uCwyuYmGzsRIEoMZqhpOQ5MmdA061+Gku1WXxa2gueZj/n33pEtmjzisRuogvuTjYb
         83/UaZ3hPhi1Fm81A6DnaktX4+3rBqhb3Am5KnZOf3TMVu/BvQFUVrm5r/xAA3DYrY9L
         MlIOuKHHqPruxYkp6m7SqAIgJdpsGOdP3P9n9T1Wu4a0/SeRRqazB/qPb20P0b4/mSr7
         ErCE/XtBhGrg7Eq03JPId6mZEOs1h4sHNpbuMn5Cwl+H97d5KlaGbgyr3/gwI35BEdYQ
         Bbz3kDuow0T/8mHW45Uixs0UEIhQs8rjimwLQV1bcbft5PCxUDKjZEduVnFNiEOzBDme
         gQcQ==
X-Gm-Message-State: AOJu0Yxr8tsIKLd5pla0BPB7Tg8XDxMAxMgE1URDsMGY1lBenKRRUvxa
	AXWwBUBmTqEN7a7l5zTqlM65v0BER6HJCbmgjbml1QHt/s4qld2lsGx3L8/JXpwko1zeyCNzQC0
	3mThWNuad9BWb0mkh0cu1oTC+ol51OyRcQ4iN4Bgt92fEgvb4ifA=
X-Gm-Gg: ASbGncuPivh+NG8XRomaL1BYMugR0LOfkoekM/oKs4W1eWDKpKAJiZE4sWBVRzT4NDj
	90V+Bjm4y8cjWHEhb3+wHylHGPBeqwlZfEKgvHLhHqMXWZ19l2jmAh9yMLBlyvlaQ1+CCOIPAFw
	==
X-Google-Smtp-Source: AGHT+IF15qdRadTGJh11kJIS86k+95RCNcRPRtQYr+RMTXewIvhn61qZ/iY4776tM2DfO4KRNNW+UvpMHjUbxu657rw=
X-Received: by 2002:a05:6902:3408:b0:e58:36ad:a1ba with SMTP id
 3f1490d57ef6-e5dc98b2a49mr7287514276.16.1739809833930; Mon, 17 Feb 2025
 08:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20250110131754.2769814-1-alex.bennee@linaro.org> <20250110131754.2769814-24-alex.bennee@linaro.org>
In-Reply-To: <20250110131754.2769814-24-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 16:30:22 +0000
X-Gm-Features: AWEUYZnJJhE-eSMqEP6pcLauS0o1XaV6wHO-47q30QTnWliK5Hx-6pnCF8tc6hA
Message-ID: <CAFEAcA8Kf4eF-nxEsxhPZnV3pwU+9kXLq1zXDi61ODQEQXaAYw@mail.gmail.com>
Subject: Re: [PULL 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	"open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: UkpjnY/jVpB+

On Fri, 10 Jan 2025 at 13:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Now that we have virtio-gpu Vulkan support, let's add a test for it.
> Currently this is using images build by buildroot:
>
>   https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.ht=
ml
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>

Hi; this test currently fails for me with a clang sanitizer
build (ubuntu 24.04 host). It seems to run weston in the guest,
which fails with:

2025-02-17 16:11:10,218: [16:11:10.672] Command line: weston -B
headless --renderer gl --shell kiosk -- vkmark -b:duration=3D1.0
2025-02-17 16:11:10,224: [16:11:10.675] OS: Linux, 6.11.10, #2 SMP Thu
Dec  5 16:27:12 GMT 2024, aarch64
2025-02-17 16:11:10,225: [16:11:10.680] Flight recorder: enabled
2025-02-17 16:11:10,226: [16:11:10.681] warning: XDG_RUNTIME_DIR
"/tmp" is not configured
2025-02-17 16:11:10,226: correctly.  Unix access mode must be 0700
(current mode is 0777),
2025-02-17 16:11:10,226: and must be owned by the user UID 0 (current
owner is UID 0).
2025-02-17 16:11:10,227: Refer to your distribution on how to get it, or
2025-02-17 16:11:10,227:
http://www.freedesktop.org/wiki/Specifications/basedir-spec
2025-02-17 16:11:10,228: on how to implement it.
2025-02-17 16:11:10,240: [16:11:10.695] Starting with no config file.
2025-02-17 16:11:10,253: [16:11:10.707] Output repaint window is 7 ms maxim=
um.
2025-02-17 16:11:10,262: [16:11:10.716] Loading module
'/usr/lib/libweston-14/headless-backend.so'
2025-02-17 16:11:10,313: [16:11:10.768] Loading module
'/usr/lib/libweston-14/gl-renderer.so'
2025-02-17 16:11:21,858: libEGL warning: egl: failed to create dri2 screen
2025-02-17 16:11:21,959: libEGL warning: egl: failed to create dri2 screen
2025-02-17 16:11:22,023: libEGL warning: egl: failed to create dri2 screen
2025-02-17 16:11:22,032: [16:11:22.486] failed to initialize display
2025-02-17 16:11:22,033: [16:11:22.488] EGL error state:
EGL_NOT_INITIALIZED (0x3001)
2025-02-17 16:11:22,036: [16:11:22.490] fatal: failed to create
compositor backend

Then eventually the test framework times it ou and sends it
a SIGTERM, and QEMU SEGVs inside libEGL trying to run an
exit handler:

qemu-system-aarch64: terminating on signal 15 from pid 242824
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/pyth=
on3)
UndefinedBehaviorSanitizer:DEADLYSIGNAL
=3D=3D243045=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addres=
s
0x73fbfefe6a31 (pc 0x73fbba9788e9 bp 0x73fbbbe0af80 sp 0x7ffd676fbfe0
T243045)
=3D=3D243045=3D=3DThe signal is caused by a READ memory access.
    #0 0x73fbba9788e9
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #1 0x73fbbaafc178
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16fc178)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #2 0x73fbba62564f
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x122564f)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #3 0x73fbbab067d7
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x17067d7)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #4 0x73fbba63b786
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x123b786)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #5 0x73fbba96290a
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x156290a)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #6 0x73fbba941c5c
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x1541c5c)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
    #7 0x73fbc2041f20
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f20) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #8 0x73fbc2041f68
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f68) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #9 0x73fbc2034ca9
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x34ca9) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #10 0x73fbc203ae90
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3ae90) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #11 0x73fbc203aeda
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3aeda) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #12 0x73fbc20a45f5
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa45f5) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #13 0x73fbc20a2bfc
(/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa2bfc) (BuildId:
6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
    #14 0x73fbd3047a75 in __run_exit_handlers stdlib/exit.c:108:8
    #15 0x73fbd3047bbd in exit stdlib/exit.c:138:3
    #16 0x5a5bab5e3fdb in qemu_default_main
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mai=
n.c:52:5
    #17 0x5a5bab5e3f9e in main
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/mai=
n.c:76:9
    #18 0x73fbd302a1c9 in __libc_start_call_main
csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #19 0x73fbd302a28a in __libc_start_main csu/../csu/libc-start.c:360:3
    #20 0x5a5ba9c5b554 in _start
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aar=
ch64+0x15dc554)
(BuildId: 8efda3601b42aa2644dde35d1d63f7b22b649a33)

UndefinedBehaviorSanitizer can not provide additional info.
SUMMARY: UndefinedBehaviorSanitizer: SEGV
(/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
(BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
=3D=3D243045=3D=3DABORTING

thanks
-- PMM
