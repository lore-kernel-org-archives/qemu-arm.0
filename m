Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp312916qvb;
        Tue, 15 Dec 2020 08:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymaS2q8H2tYWmOlHCKDiOknk09VJDuSKNXcxwKsfB8lExRGtTEnsFSjT1mhh+pe15UeZvV
X-Received: by 2002:a05:6902:9:: with SMTP id l9mr20898396ybh.448.1608048982235;
        Tue, 15 Dec 2020 08:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608048982; cv=none;
        d=google.com; s=arc-20160816;
        b=aSxTqRFiF4XLIJfMdHO3bHvH9B3SvyMwFfkWlwNT20Z01Ok6ysg9EdThv5yY8mpX7j
         vfzgk0VW4/34q11XA4GcCmkLvOaFXtYFVs6r8u8skvS3Q9q9HQHWLlk0CutbZzy/8xmH
         tN55ub6rs/K/T2faoNupWeN6pnfh7xX8vYE9J0w2u5qVZFu0ZJbje8zUyW/v1kh5UdtX
         5+ADTFbI2KCpwJyVLsI5inuUk1Td4bxbSzgzcyjtGoIBoqi/IW1XQ2AMWwJbiVBIrc10
         xBOdvbJU7XT4P3kH9lfr4j2vmvTaQnhCt6/ypGh35RU/B14mK0tjNIWf8NZC8g6+gXVV
         OR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=QNlPjPULVq/oFouaUHUluECglka3x33Jk4QkXWdStb4=;
        b=cSgQbBnyJvq3JQpPKyZ0/AdIp9lbYm2yCck+jaKoQvt/FPAcMQnSWhR1tC9HHSvj7F
         WvgkS96Ppk+kGDDdIXmwy8pCuycykzjI3zM9Tud69w0Kz2qfypr+86RF5tH7yTezG0+q
         F9/6Hzs6F+CWs/zAKxF+Rcvl0QugNh4YgRytT8LmlwwDj7wSe0ArxgSLMfCL5pbSwqX6
         WF6XkkZoz6rXGoioYwzlDrez585j55B1GwCcz8Dud3KsP14vE2Q5/MticHiKPY7RCULy
         FSxvUyTy+X8WgwZvmU60H2GveTXGSrWJeqlZZ1s4AHkvDuda+f16rQvVHibp0snD+Ch6
         KWsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ocoo677O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u129si19723586ybb.111.2020.12.15.08.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 08:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ocoo677O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpCzt-0005K3-MP
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 11:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpCxu-0004O6-0T
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:14:18 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpCxp-00023n-2S
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:14:17 -0500
Received: by mail-wr1-x443.google.com with SMTP id a12so20403249wrv.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QNlPjPULVq/oFouaUHUluECglka3x33Jk4QkXWdStb4=;
 b=Ocoo677ORMx7J2bJqRg+ILUYBYrvoxwvCEZuwp8rhPBM57OW2Clf65ptyNsrqozd/G
 D/HDc/hCkCDiWmRgKzUvXtS9q/FwqcR/ttKrls8dOEXBGp1hI+mmwVRH3HI7jORDqroS
 b2jAmENWLmqMLQDDyGPfwCbaV+7dhC5xvV/ic9jhq/dEw8fLjM6unyKVbutD3REQiKVh
 VVfw96L/16dhQ6r10NnnKriDd7nPgS0ARkOc2qYxAYQbM/qG0q4Mq38WEwKtBnWeWrpF
 tlWg1yVIrflpw4aCHuwsfSjM4L/0UrctnbnjncOXCufaED0x2PFBZkY6oErgBAshSxdK
 myLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QNlPjPULVq/oFouaUHUluECglka3x33Jk4QkXWdStb4=;
 b=RBD+y0PRDnvo9V9f9Qg+tMGHx7q5LG7ycYXqbxCSDsbAp7u7+4gUEOZ4S6aZhJyMOb
 RAVXWKrtnT4wAoxsJ200rkFm6OTlsJs/uzYNIKizaFfocBjBeGA8kppsQNwKvt5f7Jeo
 Pc0RxE11Y8s8kejocltLDquFBmLt9yNpVdYa8B4XUbFq3aHyGMTisujmzD1WY3ZHyY4r
 1sNMgD3LXTkW9NMYdTaEN1wEcp7C2ORIMLANG0Asu6YdOtvql9klXvpj6Pu8On+hOj3c
 erlpnTEMpVpGwdkvLCXD+AEDw1D0m5NPBAkykFHDuqT3R6n4CWmhGYjXB63KzDkz/qTa
 4s7w==
X-Gm-Message-State: AOAM533JuUzBX4c8CixgphPa6PkfGAgzkDm9/RK4axxcDBG4zNEN9weF
 uj0Lozh8EfXVrdpRa9Ngjl20xw==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr3614746wru.66.1608048850727; 
 Tue, 15 Dec 2020 08:14:10 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id l8sm37416726wmf.35.2020.12.15.08.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:14:10 -0800 (PST)
Date: Tue, 15 Dec 2020 16:14:08 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/5] target/arm: various changes to cpu.h
Message-ID: <20201215161408.GX1664@vanye>
References: <20201215114828.18076-1-leif@nuviainc.com>
 <CAFEAcA8i6vAaOFPFRPPYjQgj6gnvS_GutH1HBq=trvrz-Ud-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8i6vAaOFPFRPPYjQgj6gnvS_GutH1HBq=trvrz-Ud-2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHi4I1colBy3

On Tue, Dec 15, 2020 at 12:11:43 +0000, Peter Maydell wrote:
> On Tue, 15 Dec 2020 at 11:48, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).
> >
> > Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
> > by the ARM ARM.
> >
> > Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
> > I was unsure of prefererred naming - Ttype7-Ttype1?).
> >
> > Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,
> >
> > Lastly, add all ID_ (aarch32) registers/fields.
> >
> > Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
> > submitting shortly, and some of those features also exist for aarch32.
> >
> > v1->v2:
> > - Correct CCSIDR_EL1 field sizes in 3/5.
> > - Rebase to current master.
> 
> What happened to the various Reviewed-by:s that people gave you for
> patches in the v1 series ?

Melted away in excessive multitasking, sigh.
Sorry, v3 coming up.

/
    Leif
