Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp467933lfc;
        Wed, 14 Jul 2021 01:50:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaUxvXYu/tCBbOcV9p83brO8KT5GWKlVXVmSBdAg7h1FDRNz+8XKr9DGJhXnHnPUXFpz42
X-Received: by 2002:ac8:5cd6:: with SMTP id s22mr8244622qta.15.1626252619425;
        Wed, 14 Jul 2021 01:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626252619; cv=none;
        d=google.com; s=arc-20160816;
        b=dW8O5spY2cIJFrbB5heyzSvQy59OpI9KMr2XpZHpZpIAR1zfTSr8rLxDqLpYndMo5T
         OexfO0orlRg7YjAJKi6tz4xEWT4aQCAf7aSaY2xpShmzqCpmxedjkOpno2zJcDgtjlCG
         cI33XI/mmeQ4Td8tMM0rSXctHklhBFfdSz+k8gZLpA1GrxAlkPNEj3W4r3R+/uwU3D5Y
         NCW5WwAPq/yWNeOREnKmjbxDl2FHake1B5a/CPuSEdbUpTWerUpKXqrozkqtw8GPfmpq
         +Wz4whohUq01GyrPoNkcgm1RLyTpZZWBhKGZSo4l1XVT67sGUR4+PKOA8gsXlxFyOlEQ
         Srvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EBoYLTMMazQsFvsfSyQdAund92zd0UNLfovFnVT+TrQ=;
        b=fp3qnIlI+b19GKJtluqnnEnHt8f7TrHBHZqAZXNRG0zzkVR2Pi7hIQ8ZrzoanI8KrZ
         lmvvvkNH+pk8J+IO/wgSHIfQJhm+FpyUuzHNIU54WfhHjL6+/wUwJLoelPk4HoYLPF20
         TQDtj5LBCGasiZLlzJcjUY8ZdUt9ANI8VcXG8dMK2vQCpH/2fhMmMxUOh/7ydWXwkpY5
         Af0ITWgoD8o87TYppDcUdxLfXT7d8TOipuHuLMw3+WKDUAQsgScJVISX5j4LUKGAIpFm
         jISby8P8WwqFTyTWht4QJYtOlnM7b9wihrzkkhAFW6H7g7kioJmCBiS37eTlnqkusnpp
         b8rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjv9+T8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si1507568qke.163.2021.07.14.01.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 01:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjv9+T8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3aaw-0006DC-PQ
	for alex.bennee@linaro.org; Wed, 14 Jul 2021 04:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3aaT-0006D2-LY
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 04:49:49 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3aaS-0005dK-2r
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 04:49:49 -0400
Received: by mail-ed1-x533.google.com with SMTP id ee25so2067079edb.5
 for <qemu-arm@nongnu.org>; Wed, 14 Jul 2021 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EBoYLTMMazQsFvsfSyQdAund92zd0UNLfovFnVT+TrQ=;
 b=hjv9+T8BqbNpIdtJKcoXaKNCxXQVaVJPM72JzwNNNrosehJFPQzmBxi+gT+i0asW9C
 3LxVFzxkxJE4gKBNGhCm1QDw0FZCWBM8YllKeAn9nxZWoYaCIni9s0i9ZfikCXyhrXBo
 9YBcyuFrOy563i1q0lgu5ODfabqFbwhrM+u41AJ7irLzBAzAbriZ0CatRpUBZYzJLH44
 QnZ2imOnnEd5nXB7OoLDgUgJBC0PsZ7zHwaDKD47DI4OHU6U/sy5c+KZBOkaRDG39YV9
 reCcJ6ynJEIgoyIBnozrgUlh9c+P6tAKZkdMHx5yOwmnn1S1yPE1CZtNAq0XhkmPmi2C
 5h8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EBoYLTMMazQsFvsfSyQdAund92zd0UNLfovFnVT+TrQ=;
 b=P7BNyeF3HChgiyqso5H6jKRDkuwEYEq9F3QRun3zuhiGGrKiFchlYbL8UTJN462TVC
 AnzSq627hc6GDEbBTH6ZBsYZCSsfiiOyMqY1hHXTx5nSNRszL0Edo+ZPGbxDCtt4j0iZ
 o0t4bS3lp/GUkF5aEYaTg5zV+eChKFHT4r/SfdZ1Cw97row64P2qjTRA/O+Z8gOPIs9X
 5aN4+7qXiQyEosvKa8Ca3tYYKwF8mlPeuT0pDsUGApPnFkKPa8UOkX1l9FSejj4HsEIg
 +6NbzKRPoB52r1WdKrz5c8VoGdOhCiW2EqUrLNaqy606x/lPR/zD7uyxvzRTRuftVWxD
 JSbw==
X-Gm-Message-State: AOAM531gh3REMV/MGtyNDtvBEyprStVU2lYaY6xYrrfqStjvGq92QA2x
 a5vp1VGkPhqijZpmo7XeYdKrWO6UDcZGDZTkH8a31CldccQyDA==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr11954508edy.44.1626252586804; 
 Wed, 14 Jul 2021 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR17MB43209B366B72FCFFC1BADD50C0139@SJ0PR17MB4320.namprd17.prod.outlook.com>
In-Reply-To: <SJ0PR17MB43209B366B72FCFFC1BADD50C0139@SJ0PR17MB4320.namprd17.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 09:49:07 +0100
Message-ID: <CAFEAcA-Tj+FZz2crOtyA-nB2fZCixdD1_BBOYjKBR=eoZRY_6w@mail.gmail.com>
Subject: Re: qemu-6.0.0: Assertion 'p_rcu_reader->depth != 0' failed
To: Aileen Honess <aileen@brekersystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 77xlA0+z3S5C

On Wed, 14 Jul 2021 at 01:44, Aileen Honess <aileen@brekersystems.com> wrot=
e:
> I=E2=80=99m attempting to run multicore bare-metal tests on the qemu-6.0.=
0 release, built from the downloaded tar file.  The tests themselves are ge=
nerated, but are a mix of C and ASM, compiled into an ELF. I=E2=80=99m migr=
ating to the current QEMU release from version 4.1.0 or so.
>
>
>
> My command line (with or without =E2=80=9C-s -S=E2=80=9D) is:
>
>
>
> %> /tools/gnu/qemu-6.0.0/bin/qemu-system-aarch64 \
>
>      -machine virt-6.0,secure=3Don,virtualization=3Don,gic-version=3D3 \
>
>      -s -S \
>
>     -m 1024M \
>
>     -cpu max \
>
>     -smp 4 \
>
>      -nographic \
>
>     -semihosting \
>
>     -bios pssTop.elf \
>
>     -device loader,file=3DpssTop.elf,addr=3D0 \
>
>     -device loader,addr=3D0x40100000,cpu-num=3D0 \
>
>      -device loader,addr=3D0x40100000,cpu-num=3D1 \
>
>      -device loader,addr=3D0x40100000,cpu-num=3D2 \
>
>      -device loader,addr=3D0x40100000,cpu-num=3D3;
>
>
>
> This will run and produce expected results (through the UART) for a bit. =
 The amount of output varies from run to run.
>
> However, it will consistently die with this error, for which I find littl=
e help:
>
>
>
> qemu-system-aarch64: /home/aileen/Downloads/qemu-6.0.0/include/qemu/rcu.h=
:93: rcu_read_unlock: Assertion `p_rcu_reader->depth !=3D 0' failed.

If QEMU asserts this is generally a bug. Could you provide the test
binary that reproduces this crash, please ?

Side note: why are you loading the 'pssTop.elf' both in -bios and
then again via the -device loader? I think the -bios option is
unnecessary here.

thanks
-- PMM
