Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2884305qvw;
        Tue, 1 Dec 2020 07:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLUqr1xzAIecgiJN5JGteU6fAdrKHClISpcoLyR9EP6sdGZjuqbg61vVTrOGpI4U+Ml/rh
X-Received: by 2002:a25:4143:: with SMTP id o64mr3924957yba.249.1606838152133;
        Tue, 01 Dec 2020 07:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606838152; cv=none;
        d=google.com; s=arc-20160816;
        b=cGAJWKA3DGc08TY6Pe/28YZtEzqLRtmNhUjdq+xh3QH/FLUc+3X5Xkj3HwsD/8Anz+
         J/LUy2R3dp4UHhRLhCkxRgV0HmtWRtaV2MT98e4wDQQiuFGBPvCYTGYN4SP2SevMDcSP
         +J6XOS+T/AacvmJbaSkxRVkGZ6dXvn5mr2kG3AnXtAkgB8jq9IH+b9SbTsOlO1rMsFmX
         R0MFdXX9STI/qE29WrcjDGqOOuqYhfI1pZOsVBEntFcTr6/sG92qVUMmJci9IvjKiP3P
         MpnqxyfDr1RSCSUDjFMrzabhsY8v+/5oGn9JLl9iKRVkD5xnBqiTFDKBSzsV6wxDsT/E
         Ks1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HneIVzRro4Qu9ShoRAcYnZlFxbEwFy4eWutfE9LxWJs=;
        b=IcZefNpevnPYvJBsAxfwyRxsAac8Hf6DCeXrqXhT/oKj05ycwMrtT9HodVGmbXFqJS
         zaKhLvM1b5oUIWeydCUvbk8nShrZ8PZMSccdKlnwOzQIgp9RgcGBW4hB7sa4foPJftwt
         L8vkZ5mGSILTH1mpQMxPyW0svVtGSok9o9Opz6Yml8hZ7whYAmWzZiyp97WajmfgvVdh
         8di1eUZjUeZHR4FmDPYp48sAH84DiedLVhhoIZacpfW8hybTDt9234Fzcwkl1OGX4nDe
         BW49kEfx28Wq0LUicRklW3RzZvsCTTGGJBFGXcLSmo/3e8XAdDJn9WkSixJLT0U7WjGk
         es9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGlk0M5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si108637ybg.430.2020.12.01.07.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGlk0M5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk80N-0001sk-IK
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk80F-0001rp-Jv
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:55:43 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk80E-0007AT-3j
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:55:43 -0500
Received: by mail-ed1-x530.google.com with SMTP id ck29so3943913edb.8
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HneIVzRro4Qu9ShoRAcYnZlFxbEwFy4eWutfE9LxWJs=;
 b=NGlk0M5N2JLWkKhrSB3m+JFAYhluE0WDAwXlpYTknd9NazRGbPElwP/4q23/FvO2N6
 ZyBAnaeP9nkqWHsaaL69A4dLQdGM/SPhdTRtza1m9dx3EQVrM520zvgIbAOaY2facel5
 1vXYRmJBFELn1Y/60Wx9ZBGfAlRKg+HfTq0F62xsQ2LQPmhEIOzpFyZQ/FB9G4xmvBPm
 sYT2OdCOOPqiA2otiYYS9uTjvFTUAj2bdskiLHU1KbpfUa15WdvXIxTIIGTJ8h1ln6Hz
 7Uqvt18RbswN1iRdGul/pHdhIWrFnI2O+CJfA0QHw0ud8JLs2GZ7rC49iboUV43SwXab
 XJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HneIVzRro4Qu9ShoRAcYnZlFxbEwFy4eWutfE9LxWJs=;
 b=TJzAT2pa4hUzcEsh7j7uh5GWGuoGs/hUvdL8DXLmL21tSRGXDZkx8sZMeZCTY0MGnO
 +pYGuU7PB0vo6c/ZI5eqEwy2Dbg7CFX6g4A+3m+AzsbefhfAeJgaOW/ePbprWOrI7wDR
 3S0ep1/AmPdkqKBn4LZzbtj/VTBvp5js3A0Gek8fapCQbG/PD4ACXdkitZCkX0B/vtns
 K71S9A7FSI9RAuxB5fpBuRtDCiHFzMZFGIFqDOwCJ/pTzpvPunoRosGH4Y58yY0x9oRI
 Rvp/bRPLXBn/lIboK2qG2vMeba4/XtjlsIE8TB7I9O5Je9q8OFo4BgkPWimJXW8vS+x4
 i7Og==
X-Gm-Message-State: AOAM533rpu5futubuAQx7HX7DgAkmy2MggG8LV8CifnYPVwbW4KGUotg
 kvEzNYaOoyyjzEOVrHqE/NoQ/Z88AZevfrvfP0YJXg==
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr3702358edb.100.1606838140246; 
 Tue, 01 Dec 2020 07:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 15:55:28 +0000
Message-ID: <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MfjFIOtE83eO

On Wed, 25 Nov 2020 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As reported in https://bugs.launchpad.net/bugs/1905356
>
> Not implementing SCTLR.A, but all of the other required
> alignment for SCTLR.A=0 in Table A3-1.

Something in this series breaks the 'make check-acceptance'
record-and-replay test:

 (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
PASS (9.14 s)
 (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
(90.19 s)

The log shows the "recording execution" apparently hanging,
with the last output from the guest
[    3.183662] Registering SWP/SWPB emulation handler

thanks
-- PMM
