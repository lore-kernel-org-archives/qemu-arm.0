Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DBECD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZ3Z-0000pe-Gt; Fri, 19 Jun 2026 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZ3X-0000pJ-T3
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:14:47 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZ3W-0006EI-F0
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:14:47 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66043ecf6b3so2007325d50.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874885; cv=none;
 d=google.com; s=arc-20240605;
 b=kGvfQTrqw6Q5vhs5dFLcTYZe02nUzerZrGNKY3D2QP8FdYmN1yEipecwf1cX1I5gPk
 w++BfQvHAWdogTcMy/rUO3mXgHMzdLI5kbih+f7nNsPFUlIEtlNN0nukzbZETQvJPd8W
 xNFFePIxVSwcqC87ikv+y+RrgUuFcbClzGzed3G/QigMr+QM9haV/1g5UvNgt76PTPUs
 mDYwshQ/SbLsZnq6VTmZ66D8lrxENgTEMjVkyAjAWvidQ3ZkK8/v6O5YMCL3BsIvA7tO
 mrZCvFEkBYcnJsaw7W6usdgAJlW+CYBfs9MLAvdzkSWWc7SKtxNkWkId3A3QR9k1jwGX
 DmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JjEqOBx4XBRQmpZWps6rk9/oRg3CowveChr0GB1L2fs=;
 fh=pr4V3O/Ab5uust353YR+HfUVWC79I6XwId88S/IJfes=;
 b=cQ+LduhcnJB5FfzRLrOHK5g8jet6uNp8PrjSJVWvU/cipe2aSIrLeX7QAdd1W7gCk9
 qcOQ3MvGFBccppqSg3N9OxhE1UFQ6SMQFTAScxHmBGY8uRt9xdKKZpiA8jGL/2o7+yJE
 njUX7JKbNXvdC5FPkENnCy3uHj9VyoxG2UQSEgoU2CMyK3eyeeH1sq8DM4ZJl4L6QSZY
 srg8ddzcvF+OiN2aqfqgjNDvSWZ9Tuld3dh+Zy0vdLzvXvblB4wN+mvEozYPMDkOTsFB
 k0lbetYvmtYJZgfCc54SsFVENMBX/hJdTuKeP1u9kjuzJGg17Krw3E54v50gPX4wZXfy
 UIFw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874885; x=1782479685; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjEqOBx4XBRQmpZWps6rk9/oRg3CowveChr0GB1L2fs=;
 b=nb6qDi81L2pKt+RpRRHOyyuXyag1X/eE3yPmormzyelk7xWigNUNahq0SUOX8A/xbr
 lWaYC8mi7PdZ1ushPqjQPj2S0GN0yhslH99EJtZOMCaCw+EYdcHcVh97VyMXKZ5OLd9f
 tpdPMOfYZc9aqoyztUewJ2NnPOsbiazLoCuxGqe9Y+G1vUaknHDQZMG6OWbQVqE0fbzR
 5+WBPyktFBGHKynlBo/yPmtRTJ6binpty5Jdwq0E5vzGTKaithQwX7gbjyIuy42y9G1o
 J7TL7s8Xxp+3GUg/PBugS2wN6XvGbYHYxpE632+jOyaAd8lPluh0yF4y7m8BLlRrU5Ka
 W5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874885; x=1782479685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JjEqOBx4XBRQmpZWps6rk9/oRg3CowveChr0GB1L2fs=;
 b=pZIqORgMrVeZweYMQRtT0vV6hzc7Th0aPpZn7x63Kpv2ARjL1Q/KNpct3bicBm81FZ
 bAqHSqzGxIJcRq+KgHJT4C0lrZ3X8JTWvL4QbTVAybU88iTfKFKsdVdShebsrevveCIJ
 2gv96QHUp15BfrSgNRuQiAaKa460lTtJw/6GnFs3DhxWHkQN5ox4iXzgzxTszuw95orX
 LnRDJgF1PLOexkICllMifX18HXyIW1gtXSa/RVQPNkQBcHr9T03Ig4SY25zWjRejEvp9
 wo0KxiEp6iIon+szCJHx9Mal38HA9/CHnJwi9wTqN1KWbi7fEgJtSe73dLVSuuXswOTi
 0PLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hD0OVu/CKQi4L9SwGtvaDY40daAFiPG0mTRpIEfHWxP+vhWJUOBDiPfSYUu2Difr6GjnMpzTKYA==@nongnu.org
X-Gm-Message-State: AOJu0YwK8QurryQSqFP96YUzD89a2wEvyIgcCu0zAyaWFPxdSNtaJecq
 4Yp9EhpJZPmnkt/NLTd6L4cen9aahLDz4Q0iZ8Uv1i2MailCGgOlLQcAQbyel5Jv6yl0mTeJJOn
 WncmtmVLl8QoRmGiKFtt6P4C2YJhhQCIIjA6iMprDfA==
X-Gm-Gg: AfdE7cmmHmKhcZv2RGkl2n+hnheG3HAbyvsLNvCSuBbQz6E4XYCYX0UISu21AB8ylpf
 1OhU8IBsqMQ5hdLoxuogHuhHaWkytBD8g7mJJMXMG0mKqe65nM4Ltvx/jHtm43dOXih0bhkovov
 EnDij3ZO06kewOnrC3pRtw0123/RWMtMF19apcy3d1XOxyQOBIQLe2tcINp5IVNW2JgkmxfClan
 +DKAlV5hUIHArpYjXBi6JLvSjhk6NRCNbOQgYrsxQeZl0V24fQUoKMQe5MjUPYT6Skq72uyfvVK
 W36a71rhQFjbMb1LsOTbccKvjpXJFGWMU3FUuqKMoYeE/qrWqVET8EiE
X-Received: by 2002:a05:690e:12c9:b0:660:4090:90e8 with SMTP id
 956f58d0204a3-663030d63cdmr1999344d50.29.1781874885105; Fri, 19 Jun 2026
 06:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130537.820184-1-alex.bennee@linaro.org>
 <20260619130537.820184-4-alex.bennee@linaro.org>
In-Reply-To: <20260619130537.820184-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:14:32 +0100
X-Gm-Features: AVVi8Cdq18FzEkc_gHexW-klQUyn9uNvwzjyRrER_rbWwczZhnhBDP5u_klSlxY
Message-ID: <CAFEAcA_rnV3Fq0Qp_XfNRn9p970iAXzeNMD9VJiE3sW+PQ6vVA@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] target/arm: do not clear halting reason in
 has_work helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 kvm@vger.kernel.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 19 Jun 2026 at 14:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The helper will be called multiple times as we exit a loop and until
> we actually restart (via arm_cpu_exec_halt) we should leave the
> condition the same.
>
> Fixes: 6fd2fcdc61b (target/arm: teach arm_cpu_has_work about halting reas=
ons)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/hw/core/sysemu-cpu-ops.h | 3 +++
>  target/arm/cpu.c                 | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

