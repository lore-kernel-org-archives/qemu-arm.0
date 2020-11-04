Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp133187lfb;
        Wed, 4 Nov 2020 09:58:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo1Yefx+QhyV1a/QKOmpguot93W0bHPFV7W/IkTuluwHIAPTEhy4YSQKYuc4v+Laee+G1T
X-Received: by 2002:a05:620a:13b8:: with SMTP id m24mr25572100qki.179.1604512702941;
        Wed, 04 Nov 2020 09:58:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604512702; cv=none;
        d=google.com; s=arc-20160816;
        b=MSrfrezZXLNH29/Fzqn0YBS7UoQ4yfDGK1P97YXiMUUXMVSiAuioYdxZCf1d3J/1cy
         25V69VKNBdq6xeGG1KB9KmyQhKXHwc+UI9yWgg/sB884RQU3wb4QwEotmGNgxCdMVNMt
         TzfR2FvVGtx7gqTHDlkpAeAvzdX8V6HYc/fbTcrbStA4spBaj5pZGpxuhPsOamtKuvMA
         hlplOtshC6t2KIetcniKjE+c5CFq/mSh4oxzo6PS0mHWUOjK9ZvqB5JXY3s+Gb65+Dny
         O6B6VzGn0QmAlXODKxwaSIce9Gv0li6EDwINfaSQvkIvv2igjyVOG+UTP4tB1O3MWfEQ
         3vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jKqnLeZ/soRP6JFVfVPo1dIj3et6wA0vrOMOsss4RRY=;
        b=tjvUA6ezLkBBkIsi7o6duk55JFBymgLxXnv7Tfks0lGXW99DhPRZHSr2unjECvx/du
         1nyOGHmp6PVN0b47Z56W4ggoRikXAG08OGhUCpKwAiP/FbwwwetrCcBPJzmCe8Ybz/zj
         Uwq8e0QuBC+iBPSdV38OYcfJBsGKQJhp2rc3yQGNSeJWow7CDL4drkFuJfbeSxTA1EKc
         XP916Q68CFG711eip5cdr4V6TaCO20Afj1D2li++M0qFEYsk0/WLRd2A4HfUN8VWnDX7
         wez38GCFHYmagmctT8U6eRO+MmkIykPZYcZHVN03mXvAEqxPHaYqxdwBcH9FbP4eoX9z
         gN3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=umPGdLgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si1719438qko.187.2020.11.04.09.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 09:58:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=umPGdLgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaN38-0005Y8-Cr
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 12:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN2k-0005Vz-TX
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 12:58:00 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN2i-0003oX-7g
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 12:57:58 -0500
Received: by mail-ed1-x543.google.com with SMTP id b9so13164144edu.10
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2020 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jKqnLeZ/soRP6JFVfVPo1dIj3et6wA0vrOMOsss4RRY=;
 b=umPGdLgIickMRNQC6uGq5q8ilGMPvj1OPXYT1re+FFoZkpIRrQLZVEYdfCNLbs6zeN
 anpsmpujcA7ZDNU2rPEqAWSEyxNfR08B6Blm68sWjZPsdJIQTT5VTJKUQfR4BV+4k5D4
 5BFzISDjSuvH6y2bWsHv9Ewyyy/s/eM6Z4oof0croVRfKuRueAinkRqf/Sh+Z/wp+QBo
 Q3W3CkKfkzUP1cxLKUWFV46W/tsY9HBRN7US/HO4T7ymG+Zg4REfccg1ZY8I9bhz1Q6y
 EtJRxDX2QEEm/XCHe18NHqmwvcmB6nRl1dCZgAw39NYu/xsjvFVJ0FA270OSsUWLU0gM
 rWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jKqnLeZ/soRP6JFVfVPo1dIj3et6wA0vrOMOsss4RRY=;
 b=tOowffd/6FwJs+64G5cW9K9VmjwgYSqHhXnHLpDnWuRHUwxkIuJCSKU9v8HKKApOUS
 Mp3UmfhKEUnlkmc512OAp9lzGNPCox4Mz4K8C6H2xr/nzBU6nuFg9QxwnA7nlizLzktm
 yXnj5J8udNu/wbLCLj54WD9xe+HW5s82BE5Gq/DgQsVxI9b6HuVShgmtoxMP7yBRzK2M
 ySiTcgwXOILJ313RDVPLGwozVgfVxdlWqXhC7Djgfwr/0OowXkD5JKUGGPMWARZjf7p7
 GpUoP1MTfg9GwvhjRrFv9tXh1M7BKFZLxVk1Y+FJkCOngKnqjLavTtUKBOjjN6Znn4Pv
 JSmw==
X-Gm-Message-State: AOAM5308olgIPWiSxL4xed+NbJ+hxHMcTCFjmJE7NN2QXZAHYMAeyxyC
 3ZbyvaCj4arUO1kAUZs1voQ13Wv6Yw2VEBxixwR23w==
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr28823057edw.204.1604512674444; 
 Wed, 04 Nov 2020 09:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20201104103343.30392-1-drjones@redhat.com>
 <612eaae4-6e05-568e-01cc-a191bbb7c835@redhat.com>
In-Reply-To: <612eaae4-6e05-568e-01cc-a191bbb7c835@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 17:57:43 +0000
Message-ID: <CAFEAcA93GCoVTSxW_64W_Fmut2O74UXZJGej4FE7g_atGa0VDw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/Kconfig: ARM_V7M depends on PTIMER
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AltEp64iIrSO

On Wed, 4 Nov 2020 at 10:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 11/4/20 11:33 AM, Andrew Jones wrote:
> > commit 32bd322a0134 ("hw/timer/armv7m_systick: Rewrite to use ptimers")
> > changed armv7m_systick to build on ptimers. Make sure we have ptimers
> > in the build when building armv7m_systick.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
