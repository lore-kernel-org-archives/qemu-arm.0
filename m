Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A71C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 10:00:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfagY-0000El-14; Fri, 03 Jul 2026 05:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfagX-0000EZ-Lm
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:59:49 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfagW-0006o1-BR
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:59:49 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664b84118d5so584277d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783072787; cv=none;
 d=google.com; s=arc-20260327;
 b=FzJOJ+arYzEpYH7G3I/aAik+aHjerCKwYeYbP002pYUS1zVtYs9SYV/ih2/oON8gcF
 jW2pG/wuPO+KiugCKogROw+e7q6fAo5E4pOqYhmbN/IjUFdb9X+t0w0sbz4a7DXv/Xjh
 tAr975Ae3Jc6xsZtEJG3NmvH9vySDaq45DEQmoZfZ+Di9Zqppi8oETW8VX/k2WajBOSm
 7Klv1sW/aow0SzBe3iZNm7SHy8Bv4J6CN7WcYLqOFmcIA8emJR2qEdyG5nkWn9iZHv/N
 /JvePR+bz+uyJY3D7iYpWZ0bwEu/FlsdARSeRaZG01L0qlEShqS8lpRZOLHvRJSNpsMr
 vmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=a3P3Tr5cp7+7D8TJqnA3Mjf9GQDMQvB2MGmfRIaPWhg=;
 fh=qd7ImpYAjoBgJ2QKCb1gDjYSrnG97lVW1IfDoqFmJXU=;
 b=Lrs0H0FpHc6PhS7r9X0SlRrdxt62k+WkvCEnSHVsve1bO2OFKhXtPunsvosK0qNH++
 uAfeThOiK8QZaZ5Ikby8Boo9s1So5PkX1RsI74UiBzxZ1hYs69HEj38GOoikWj1ZHril
 MmL1k4mhKRB5FZ1a1DCRhehZtJwSH3MvoAu/yE2GaypK+IHZVJRygWAoz0eFt3xLQpU8
 paHi3233KkSMvoP1BXwf+0aE0a5K+7rmgdG71+9Z426O6BbpYcczDfla8lgZMx1ucgPC
 QSOlDaQj5uBXbF5uVWqoeOPQDGl04RAwdoPOmJxisd23vhZtry4JX0vMsABthYf+FaYO
 KeNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783072787; x=1783677587; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3P3Tr5cp7+7D8TJqnA3Mjf9GQDMQvB2MGmfRIaPWhg=;
 b=l2Fk68kQDLVnHSc/htFBJbGbs2Qrnp0rBdSb34f4Jvj3DO6QS+mI6WdEIQwym0+nil
 cdu7vWJmtce1Wy9jA5CfNTS83tHYEyi2niqlFv4Iv9VUw9wX3oO9lwKo3Q3J5WccocNR
 lIrcqidXYIfOGuMhFqer72E2avMD+pxizJxxgpCRFQxCP/e0cwefazZtXcTnXvhVZbjK
 CN/pTYpkJUATqdNkguHS7wxBa6/0h1CBsVNYyNIbPuNdBwRnO1ypWMdpDKmHY48YerxK
 /5pAPsaQufWB6lIkR7jEOStWI8dwHVxUgTAzfwlBFPEMtScId5tS0CabhrOBUY3Uflh0
 x3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783072787; x=1783677587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a3P3Tr5cp7+7D8TJqnA3Mjf9GQDMQvB2MGmfRIaPWhg=;
 b=srBppofSPUDTbI/aQkl7OaOZn3s9LJIt4U1sl8PG7kVNA7A7d7AHid85HO3Be2TbtD
 qUTt6blmDGG3kzXkcb7n7v+WWMF4CE+hw4UfaWtjofe5ARQbluWhFIpSOkeNGdpD5HH2
 cOi4PYBTFA4EMde8v0ZCUQNVEyn/F0DJKMWXzJxapjwgrGmqSW2si63iYdn6Jkq+hWIy
 hF533OQTuJD/qCP/OXe6Blg5DW/SLLKF3Gv9Y0bbXs+31gxq0H5ClJeNdneyDO/Rt++n
 L7Kaz3XBp1vqWi5NBfrX6rl6hQ/DrTO7rgZNS3HF1k3uqnA924GG21TToc2TfEqSm7Lf
 xt7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUFEtwTD7lW3LoegnSojsSP7qx1y7IF10T0K6jwjogjAXfNdE7odPIFb3oalx+v5I/vWmk4XzCMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzdZhyzZsKTPIfo+dp/vSOnm6gLivfr30Q4iLLRtgE8OQvJsIfQ
 bHP5JMTKnuC+T8JRMkHb15z/Zr0EE7pFoLqlc1BMLk2jV6XHNL45vT45IYOOmv8J06YEsjxjytN
 51iStwaWopkLZDAQzmwkz+C4roub+3DFrs4Wwcfvetw==
X-Gm-Gg: AfdE7ckaowMxZ71dqY+1GzFpcWgPpHPwHAhDGFuC8+K7cVGHpZJNhlAGIHpmi1x2bnp
 yNSdESUeQUZqouCaBBcn82u8BBC1Jrfo8R0tiQ/m0GJYX7aFWZqtH5+fMDeV5TKFgrsdItjcTV/
 XcM2vHCZdRzl7N8SG8E3GAql5z6ZdVSyVnTM+OviFpefa17wkG15/jMbFELwgpuws0ivGGZ4OQ4
 dEe9HhwCes5P3tJFcbiwDvo6xBZDskhi4gMOPCy0/ljTCgj0o7DvEa4WIqWFX+GfiuIeNrJu/wL
 tjtC3A1jH2Q+48jX2VFRqnISIPQEa27zBG41uc5IiglWFvHUgVn2CO7a
X-Received: by 2002:a05:690e:4188:b0:664:b5a9:eef1 with SMTP id
 956f58d0204a3-66521b3a729mr8538474d50.64.1783072786955; Fri, 03 Jul 2026
 02:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260624103049.884930-1-alex.bennee@linaro.org>
In-Reply-To: <20260624103049.884930-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:59:35 +0100
X-Gm-Features: AVVi8Cc0-9na2SVpfaB0sZbkOU-6Sk1x4LYlRjdp1IEN46Q2BYvTDWcdA-jULA4
Message-ID: <CAFEAcA-JmvT-S8q4F65+E1Ghf+DrUtB+WMqjpBF1xd9hcN5Bag@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] target/arm: fully model WFxT instructions for
 A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Troy Lee <leetroy@gmail.com>, 
 Hao Wu <wuhaotsh@google.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 24 Jun 2026 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This series fully models the behaviour of WFxT instructions. We
> already had support for WFE for M-profile but we left off A-profile as
> it has more potential sources of wake-ups. The main one is the event
> stream which includes events from significant bits of the timer
> ticking over.
>
> The refactoring from the previous iterations of the patch have now
> been merged.
>
> I've dropped trying to fully model the global monitor in favour of
> taking advantage of the architectural flexibility to have an IMPDEF
> event wake up for any reason. We treat the setting of exclusive_addr
> as such a reason because it indicates the current vCPU is in a ldstx
> exclusive region and we don't want the guest to deadlock. This does mean
> the system won't sleep on WFE enabled locks but people shouldn't be
> relying on QEMU to model real world sleep patterns anyway given the
> efficiency of emulation compared to real HW.
>



Applied to target-arm.next, thanks.

-- PMM

