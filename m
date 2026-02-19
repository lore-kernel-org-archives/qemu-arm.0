Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50231C531CC
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 21:05:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtBDU-0004rv-5N; Thu, 19 Feb 2026 16:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vtBDJ-0004q2-29
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 16:05:33 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vtBDH-0003Fg-ER
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 16:05:32 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso1398568d50.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 13:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771535130; cv=none;
 d=google.com; s=arc-20240605;
 b=kiVuxtenncTEMYiA1ECawOIVT6f5LtmwdG4xns8C1YUY7ss/4UNksl8a+en3qhKXeY
 xEZH6jiaxP2jrhTHgDVLuh1McCjPGWLJeV/BMO82Ha3BLUcnpQdiyXzL7q5iDr01pSOu
 Gg7KmNaGJIByBE103EDHzoax7dWkCxihfFZxtEVJcKJAZQPJSPMYZO+l5y2AJgeCumZU
 Aya+jFphWg54SrMb7SwXkhCs4PznyGeL/m9b27T4kj/xkf5mBkDbTN3wbm7JQYcKi6Ag
 cQv+rvqfKoT6us4W1O4jqlyqkIm0vJXiTLDrtU5iuqZ8lVqskTkIhM3zd/NnSwkwvqdJ
 wBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mjsZeNUE6utCAoJ6rRPvb+/LBMI/kL4awRqrCximn3k=;
 fh=Cg0r7Shj/Ri/kawVaVpkQgXjzYug1eB4leWIQeusR2A=;
 b=HgoqxcmRBedNjzSyaPRitX3kaH+DPh9TscAIwVbYL2YjHgIR4ots64l6waW3eAMIA/
 G6+4KMDcloyqJqdH+kdVu4NjbFR8rT4XrnFy4hIiHPb9UGbdHeqESjQ+5w+zNEeWhpPu
 m8iclVW+CDyeyPUQvzQsvLSA3DA5XuUAQ/4sqa9uWTc9ksxsj0JMMFDq3j4zmycrF8QH
 dGJj1th2quayBn5M24YTbA8P2dC6jAfd8fNlJE65ikTlwsO/3lFoM4yjep8bsLHudzk8
 zTXMZOtVA8HKn016f6/zkv055IfSs8e1NdNygpAPKbBQJK4FtGZ6Ir2OWtdGhZSoX3/M
 vCtw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771535130; x=1772139930; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjsZeNUE6utCAoJ6rRPvb+/LBMI/kL4awRqrCximn3k=;
 b=qz8YYrwWJxQaLu2cfdn3iznDLIIzJ7mlARoNceB2m53g2mlkLC6+JZe2g/gQ/Ukw+z
 GF9vTFnXKuOuWotW+5x1NQ6T3AgkpTJHTPlrqpOkVmQfZRmRLiLXoOKSvI5w2vdtCH0H
 8oB0Bs1+opTLMgi9V77gQfirwmhAzhLWOXsCymdHnKzR3twba9gR6dVmo5MbuOwCAGBq
 8IubnTb01VfTUQHSFWl5u4LkgcSdLO656hzPSH5E7VkstBYTNQ9fsA8eoaOAu3W3BMsv
 nnupt5eRZy46l7Z5888PNNuWO0v36HRHPy19TPJvHF+mXMEOFkhZSrWhu5pjTKgAri9L
 O7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771535130; x=1772139930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mjsZeNUE6utCAoJ6rRPvb+/LBMI/kL4awRqrCximn3k=;
 b=UHU1iIVsAql6flJrabwIZhhguuiNDCOtZcgdFe7YMMbW/PJS8B0fOduNYfUrVoQ0L2
 apQiIhhovTceiUv1EU+9rasIoPB1SfHMBYwJ1bBiJdwkCyoLJFuMfqjRI4IFcRU2uxIw
 UwwlKX0b9lX22Y7IjfP7dVIb80A1SiAPUBh1MorA4JcDRDfQA0I/CjMUdwzqKEK1Qrd0
 UuhPKBGt1jfXGEU2B+sZx1QvldGFoXqL/CvyNghLx+fwOgALADB8cPkuTt5qx9dDVtYA
 +7KQKu7KThK82dsZDHnCVxyFyjulrIyZDeJezmiqx43b9WpsPpyK1F95znO8GQz8YZrd
 ZPag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiAWlea/JbXP7JBnQYUHSjhIFSCdmoqOwv9KDVLF0C6IheGQf4dkT2T4zhd8o8/AETEbVTaanEgA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+MVZVCvCOGxX66z6EfCy3M5qFfCz4ifAe6CzBwaDdE1rYoxG+
 P3I2rlrm9SNflsB4spVYCvuAfVSwzMv8tnuwPA0yxYkH5CWQNzg8jruGYCyxacHn6p162k2tptN
 W1iDriyS3whtGD6gz+92qmw1rrh9E6GtlcqrAj2Uhbg==
X-Gm-Gg: AZuq6aJuDo2j7AWXSItLyFhqm7PK7l0KR3fxlSM9JD645eJUSqa1cq5jhtMNltqtW1u
 KATgr/dd4TwALl42G6/ADshA6O4LWA6lqon16ir5GanokShVB/eob/BvMl8vca/FmQzfjWk2Id8
 9/0MWVPyR7ijt7pVgF68/ZJX8zjPrAjGEcjXZomipic19bT/AKOIvH27TUH1TBA7Z8EDHqErBA4
 zCFtkCNzlD2Dww82EvjOt4+TFNUoyKT0bB6S7Lc2tVrGYYBXQJT2PTzUSqky2GohWwey8o6PsHz
 AsRQ3z7FH8b/3+HTWnxAzRr/wy73c5+tJD1NDT3YTmk4fjjwAs3DHayx6J/Xc6J8Xww=
X-Received: by 2002:a05:690e:b47:b0:64a:d80f:5c8 with SMTP id
 956f58d0204a3-64c55575bd5mr5310498d50.21.1771535130235; Thu, 19 Feb 2026
 13:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-3-alex.bennee@linaro.org>
In-Reply-To: <20260219171810.602667-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 21:05:18 +0000
X-Gm-Features: AZwV_Qh_3KVqBCLw5JQu6aAArlbk_cvqkTL4D3E4ryLGHiZx0muX6MWwuyzaacg
Message-ID: <CAFEAcA85HV7GzbrCM2bTzd3SfTfYGuE4ghdQXSMHfgje5utFGg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] target/m68k: initialise pc/sp vector during
 reset
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 19 Feb 2026 at 17:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> All 68k chips should be able to follow the architectural behaviour on
> reset which is to load the initial sp/pc from the first 8 bytes of the
> address space.
>
> To avoid any potential issues with un-reset memory controllers we
> punt the final setting of the register to the exit phase when
> everything else is guaranteed to have been through the hold phase.

Unfortunately we can't guarantee that the exit-phase of a CPU's
reset happens after everybody else's hold phase, because at the
moment CPUs are still reset separately to the rest of the system:
typically some bit of board code calls cpu_reset() on the CPU(s)
out of a qemu_register_reset() hook. qemu_register_reset() hooks
get called during the "hold" phase of system reset, and if they
call cpu_reset() that causes all 3 phases of the CPU object
reset to happen immediately, one after the other.

This is why the Arm M-profile handling of "read the PC and SP
from memory" is still being done with special case handling for
"maybe there's a ROM blob here which hasn't yet been copied
into guest RAM" -- look for "Load the initial SP and PC" in
target/arm/cpu.c.

I keep meaning to have another look at this for the Arm case,
but haven't got round to it yet. This could be done without
opening the entire reset can of worms by switching the arm
use of qemu_register_reset() to qemu_register_resettable(),
which would let you get called back separately for each phase
so you could invoke exactly the right CPU object reset phase.
(It might be sufficient to pass the CPU object itself to
qemu_register_resettable() before calling qemu_register_reset()
and rely on resettables being invoked in order.)

thanks
-- PMM

