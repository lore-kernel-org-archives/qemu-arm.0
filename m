Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp289641njn;
        Fri, 10 Jan 2025 08:57:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUz5NSRQ7nc3y8f1h5jKw028zMIJ8aLGq+sIKknf6lIIEn0O5CW56QpM4g6O0aAMiGThgJSezMNchkj9w==@linaro.org
X-Received: by 2002:a05:690c:6609:b0:6ef:59ef:f1cb with SMTP id 00721157ae682-6f5311ef279mr90705477b3.5.1736528231920;
        Fri, 10 Jan 2025 08:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736528231; cv=none;
        d=google.com; s=arc-20240605;
        b=BLbM2l6+Og2VxFJppg81Y8vDon+0WZh5VdzIvtCjIQVPcuYVvDML3b8yKJA8h38pl0
         JwzwNtv2naNIEUS8bVVkuE8MiiuVO+fvQHU4g9X9zZwKx2SPvPVVVy9qFbD5yPL8R0Zm
         ejDuMdxt5uLpS7B61AokMpKQIIQ3JBhtinszZVnDPs29kRCLvv/9YKMRFchZrXxRa0Hi
         bgbh39+8nWfnC6WEOaP1YxsuQndTW/iPfhagvaaXLiQYUDQ/9OFPO4npnk5eF5rHHEh7
         vMD9A+icILJt54D0YPpx0YwZt9z9jf0kbnPhsn2MwLOLrLEMGLLwzwH24JUdwfuKvMxi
         iBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJgMoYVZSw03vmr4yFxmrqvyqQ16V6vJJHIRbydgVd8=;
        fh=zGrybV5MkTDM1xdaOwB+c7EwQgdegOTkja2siUjJTK8=;
        b=EnNDMx2yyLph3kmsP9KeV9LAQtiSEoyyUk0JIIINebTbkytFlm6M+nxyRwKB/1IwI+
         6XnAHyX7iegAIGKShsMfe4BsQPgIr1kkRxjkWelFEi5MBtOVkurt4u7U38IJR3JbY3kj
         o5Sdpvy+He8y4KEZeOQtWpKyxwGql5IJ3tet5QFudJYNA2UZ7vlbmlFHfmSukPiE8zWq
         SunTlk1eDXeprluihi0Xf/TRsuOhOUB8le+h7Gg6B2Nsr2nhCp7NKm23tiO/Bi0F/12p
         /aA9cZ+FQO3Po4Qay4V6rB04Y219z7b16RqbhnFxtzhaj2Mo9O5s2usX3ShstK0tFByC
         87og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tskl1xtr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546a56db5sor25186627b3.0.2025.01.10.08.57.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 08:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tskl1xtr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736528231; x=1737133031; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJgMoYVZSw03vmr4yFxmrqvyqQ16V6vJJHIRbydgVd8=;
        b=Tskl1xtr77Y7yWChnxcdV+LMZHROOYrvqii0Kj2MXHZjjr+rc7hodRkw5xszrVsRjS
         JDWejAt+hGc/kUEQAnsq/IeXoUP+Dio3OVI1NmUE5d9X4J085/O3w3tM2SnZDTFQcqcV
         PGNh8LM0yMrtYQ9O0fUj3hA3Lx2/cFJyNhs+fWbMneXpLzX1LfffUtAyicVRiXmHg5Ga
         9MPgyQ4qhkaAZK7ioS+P7LsfQZOwmTGIRP6MOs1ZE74cA6coxsTTE+EUKwBdExzOZzmK
         KI1vrS3cm7+IyZc85mwhUdI+1zYa84MebLXK6QiwYT22EZY19DtDPsxjLmicjXNdjsKj
         LgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736528231; x=1737133031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJgMoYVZSw03vmr4yFxmrqvyqQ16V6vJJHIRbydgVd8=;
        b=pXgnfJdmIwveUAw9Fku4wM/F7ueJliw4Oy2ryWYlUGINJIkLMBWwR5EDNOtIxv47iE
         pmpmvd1FNGFQQz/6z6Ec7Ws8lCCsHT0L6JS9s/1r4ABnBi2CWOwIr41NYyoqnyvjiOg1
         YRoCwQLOImuTPXRAbLNPsCWM5E2yFulpwQs3VPHORsUzb+IFMeIt/k0KEFCG4NnP+tiU
         At/xrshhpfKU395xi5f4fySPjbqqYxg8F8TTH4GGCTRpt8O3yQKquq5/u/ko9SrM5HJb
         9eQme+UdPtlsu7zH/43JNuruHa8I4lHx02DLVcDx9DKrVpL1+iXP9Za+tn+QjXAH2w+A
         zNKg==
X-Forwarded-Encrypted: i=1; AJvYcCU8A967dICL/pJyXV42gs2bOWnE1aqLRxbc+W6Y8CaH/61czUQi7b6UD5gq4ewbJLRaNToNVtvHPIJ94Q==@linaro.org
X-Gm-Message-State: AOJu0YzZHhcHBOLC/RuozcZ5NaqI7CXrXMrolg7vis90Lg04ZV5Zt59g
	Os7i0x00Dr9Bbhg+X29DdeMjrzWTTeEc+2knSZQGDth1UDg9hPVyiyr0En+hP2gchjRc0dKC3eZ
	8Z3k7I8VM9QUh/SA+nYZF3O2MYD75jrdTIrcjZ7he
X-Gm-Gg: ASbGncvi/d32ht76Cn9HwgEKHIfOKrLZQ9NIjel8tTiPTky6p3THBwhuoi2X8SBM9rX
	vxoam1xYLt33s5pWPjaHRORfwNlM0NHqWG+oWBZA=
X-Google-Smtp-Source: AGHT+IE0AbRS6/Lx17cPdfKemuNfE+YcBfETH3IAk4MGIRsz+d9Sfs1xC0oIhdw/N3fZDEV9/mOdnvFtnO8MAmx7etM=
X-Received: by 2002:a05:690c:6609:b0:6ef:59ef:f1cb with SMTP id
 00721157ae682-6f5311ef279mr90704457b3.5.1736528229981; Fri, 10 Jan 2025
 08:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20250107192637.67683-1-philmd@linaro.org>
In-Reply-To: <20250107192637.67683-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 16:56:58 +0000
X-Gm-Features: AbW1kvaEHzcBrIKmA8BESXRSFOHUPDktKCrZCqaTwEMuygcjlAg_UzUFizw-ClA
Message-ID: <CAFEAcA-F6CCD_RQ3J5f8bvoZ=3wP=WtOsgHjgbwMcY76pub3Lg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest/stm32l4x5_usart: Avoid accessing NVIC via MMIO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
	Laurent Vivier <lvivier@redhat.com>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Samuel Tardieu <sam@rfc1149.net>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: TksVPz9PyoG4

On Tue, 7 Jan 2025 at 19:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> The STM32L4x5 SoC family use a ARM Cortex-M core. Such
> core is architecturally tied with a NVIC (interrupt controller),
> having the NVIC MMIO mapped in the core address space.
>
> When using the QTest accelerator, we don't emulate vCPU, only
> a dummy is created. For now, QTest is only supposed to access
> MMIO devices mapped on the main 'SysBus'. Thus it shouldn't
> be able to access a NVIC MMIO region, because such region is
> specific to a vCPU address space, which isn't available under
> QTest.

This doesn't seem quite right. We create vCPUs which should
have all their usual address spaces (e.g. in the arm code
the calls to cpu_address_space_init() are not guarded by
anything that says "don't do this if qtest"). They just
don't *execute* anything.

qtest's model of operation is "the qtest is doing accesses
as-if it was guest code running on the first CPU in the system".
So it should be fine for it to do accesses which access the
NVIC. (Indeed if we wanted a qtest of the NVIC itself that
should also be OK.)

In a more interesting heterogenous system you probably want
the qtest to be able to select the CPU that it is acting
as-if-it-were (though even then the first one in the system
is usually going to be sensible enough, assuming the
heterogenous board model did the usual thing of creating
the main application CPUs first and the BSP or other
minor processor last). Then you could have a qtest which is
"I'm testing a device that's accessible to the main
application processor" and also one which is "I'm testing
this device which is only accessible to the BSP".

> This patch is to fix the problem reported by Fabiano when
> removing the &first_cpu global in qtest, see analysis in:
> https://lore.kernel.org/qemu-devel/05820c9b-a683-4eb4-a836-e97aa708d5e5@l=
inaro.org/

Hmm, OK, so my idea of having qtest use address_space_memory
as a shortcut for getting rid of first_cpu doesn't work.

I'm not super-enthusiastic about this patch, since it's
basically adding an artificial restriction to what you can
do in a qtest. But maybe it's OK as a temporary thing to
avoid going too far down a rabbit hole in refactoring?

If we were going to have the qtest select "this is the
CPU I want to act like", what would it do? Pass a
QOM path to the relevant CPU? I feel like you would
still want to default to "pick the first CPU", because
99% of tests will be fine with that. But maybe we need
to locate the first CPU by some runtime thing rather
than by using the global. IDK...

-- PMM
