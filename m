Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb843451b1sm978564666b.42.2025.02.20.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:47:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2BEE85F8AC;
	Thu, 20 Feb 2025 15:47:05 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-s390x@nongnu.org,  qemu-arm@nongnu.org,
  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] testing/next (aarch64 virt gpu tests)
In-Reply-To: <CAFEAcA8Tz97tUBLXD00XkzrbWu3ncOS7tciwkY_Pjq2-jCtBpw@mail.gmail.com>
	(Peter Maydell's message of "Thu, 20 Feb 2025 13:37:35 +0000")
References: <20250219150009.1662688-1-alex.bennee@linaro.org>
	<CAFEAcA8Tz97tUBLXD00XkzrbWu3ncOS7tciwkY_Pjq2-jCtBpw@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 20 Feb 2025 15:47:05 +0000
Message-ID: <871pvsk492.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /3A4W07AFbb1

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 19 Feb 2025 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Hi,
>>
>> As I was looking at the native context patches I realised our existing
>> GPU testing is a little sparse. I took the opportunity to split the
>> test from the main virt test and then extend it to exercise the 3
>> current display modes (virgl, virgl+blobs, vulkan).
>>
>> I've added some additional validation to ensure we have the devices we
>> expect before we start. It doesn't currently address the reported
>> clang issues but hopefully it will help narrow down what fails and
>> what works.
>>
>> Once I've built some new buildroot images I'll re-spin with a while
>> bunch of additional test binaries available.
>
> Running on a non-sanitizer debug build, I found that
> aarch64_virt_with_virgl_gpu hit the timeout. Looking at the
> output the last thing printed is
> 2025-02-20 11:46:36,864: [shadow] <default>: FPS: 45 FrameTime: 22.585 ms
> That timestamp is 4 minutes into the test run, and the same
> [shadow] test takes over 2 minutes on the with_virgil_blobs_gpu
> test, so it looks like it just hit the 360s timeout and might
> well have finished OK if it had been allowed to keep running.

On my system it takes ~43s to run the plain virgl_gpu test. About 2.5s
to boot the kernel and setup the env and approx 40s to run through each
test. The -b:duration=3D1.0 limits each of the 33 scenes to 1s of runtime.

I'm guessing something in your setup is stalling the scene and instead
of reaching its time limit it stalls and takes more than 1s to recover.

> Actually I'm surprised the other one didn't hit a timeout,
> because its log timestamps show it running from 11:35:03,896
> to 11:42:26,468 which is definitely more than 360s.
>
> Is there a less time-intensive test of the virgl code
> we can use? check-functional already has way too many
> tests that take minutes to run...

I am building a newer rootfs with more testing tools on it so we could
preface with simpler tests and bail early if say the drm device node
can't be seen.

That said I worked quite hard on keeping the runtime bellow 60s and the
benefit of the glmark/vkmark tests is they run through a number of
different scenarios so hopefully exercise a range of the API. It also
has the benefit easily detecting the end from stdout whereas the simpler
tests tend to draw a triangle and then loop forever until you hit
Ctrl-C.


>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
