Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2029097lfk;
        Tue, 6 Jul 2021 03:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXzobrDUe1eNMybyx+PZANHW4dDA8r0VFT6cG2Gwtiu+lYBKKjcAm3hj2KD/MH/Eel2G06
X-Received: by 2002:a1f:c704:: with SMTP id x4mr12569901vkf.9.1625568423003;
        Tue, 06 Jul 2021 03:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625568423; cv=none;
        d=google.com; s=arc-20160816;
        b=DpCJSoLwxVoViffkFmCPu5Qsk7ldwokwA9FdsenXvNNdSGbhX1oE6W4BDpINQRJMOP
         bt/m77GBvtwRBNtrf9uMVk58QgoRzOpHMinuNR3SKWXhbgOkcTWm9jKp3TRJGWkVQo/h
         9yXwVA0NZI0/pJloK7d9y4ualWIXBCWrEq506eyZpE4AE6/VpIqcCq+tzf3b9XPLyVyb
         v+V0rjVsxCBbzRvViu65SD8JdbsQcRUyw2Y0jSh7D6OzyTftNjG0C2yu5/zqWYlRK0lM
         NCHvog1LI3C/keTdzwMt21xllMTHyZb4tSlrDCDppUSCAAgw2Tm53DRGaxsv6O2eGLll
         EVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOlb67vfGotO/7uzh0i1HEQgcMMLvcm6tP4ribZKyKw=;
        b=TMP3WOk+VZlKiN4VJdsfHhzfG+XY1Kk8JTWfmhdjqUhe/BGTC3ofqy9sJB//BYjhor
         4i3LddA5oSnZmdStNaRF3M0nftttgl7AtuMVZWY5DwtOX+4X5VyKFDllH4Vi7Ijiu+CE
         YPdR3vvLX2OoE8yk5XRByCS54JiGNWK9QwdV/XEm6a3DYg/mHoB2G4chW/BgMVTCpRB9
         wzme3EyyEP14bgAhaT1S5Y5J/74K7/5RLLZZtFrN2OtXKCk6UBx8KBPnr2jqcreXNeq6
         J90Hmo4aYU+s1TDL1Ro8Itons5Hw0hdaJV7wbfQT8jSWu+ax83KlUAuXm0VRf34T/Wxy
         hhBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eqmL6FYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si10934687vsk.25.2021.07.06.03.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 03:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eqmL6FYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0ibW-0004PK-1w
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 06:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hzt-0006f9-Kp
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 06:08:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hzp-0005l1-G3
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 06:08:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id o5so33307518ejy.7
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOlb67vfGotO/7uzh0i1HEQgcMMLvcm6tP4ribZKyKw=;
 b=eqmL6FYL+m0C/+k8EmssmUXCYsn1nDq1z5akwnynmj5EE8JJNL0K0HCIi+ndRlAZ38
 dv2LU6tNXCNPHvszSc9A0LiOp89Rs0WrSzBsqoM27P5Ks4MJY9CM4qVw8g+ytm3a/F3f
 3BrizI0lxyYS7FzOqtiU0NwL5gZmUvv6nvdR7mIy3Os1iM5UiCThQj6s6ixpgzpfXM4i
 VfhfVeirp3vMQhgF2plFMhIiuPVutc9iZvfPFcJZhjTrbIku42MhZrf8gXmsSpbO31Tx
 IfzsWrW8ONuebKZjFUdKMK0mJW54Qulm2zSiil6XqU4HfyW4CVTCg1cjtD5E0Dnczmii
 ULgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOlb67vfGotO/7uzh0i1HEQgcMMLvcm6tP4ribZKyKw=;
 b=ckitYAsOKRy3jz3m8VIDDAgThc93nDkjE05l2ztw8hMH1knRmW23RSahbBLGQ0B7SJ
 F6mYytgH+6l4T/e/zo1s5qk92GaF8XrHUiqLcu2UvDubXm1EzpD/8vlaBuzqP4Jkmtwb
 23WsuNM2isE/wkDJ1xDc7xZbqEF2izvNbHzt6nMBMCz7khmi2zMmLuswDDo+yrkEKCD7
 iI1fmbRjNgkNvFr+Iu7xJMZVUWroQ2KOJWyVnWAHFhurgWo1BPgWkbYE4qmkmbwyIFa9
 TdwfOvkKPb73L/U8K8FjGeiL3qRSF2eaIARNArEvJezrS0xTIB5UPRAFs4e9AQkItjK5
 yTbQ==
X-Gm-Message-State: AOAM530wOQt/7tZb6UQYls57QukyiXx0Ric5QyzYmWjIVbuDcaQnM/Cg
 qasAOp0kQCt6yjCJZYxDRcWXzURXsnnEP0taVzRobA==
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr6477968ejc.56.1625566083232; 
 Tue, 06 Jul 2021 03:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <7a9b8b4a-537d-c302-b7d1-40d26e95a8c5@redhat.com>
In-Reply-To: <7a9b8b4a-537d-c302-b7d1-40d26e95a8c5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 11:07:24 +0100
Message-ID: <CAFEAcA_T2TBaNhUHf+68NEHK-v93b6BxqOgzCi-OQxB-nvMB1Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Eric Auger <eauger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFfcRKRjosJZ

On Tue, 6 Jul 2021 at 11:04, Eric Auger <eauger@redhat.com> wrote:
>
> Hi Shashi, Peter,
>
> On 7/6/21 5:25 AM, shashi.mallela@linaro.org wrote:
> > On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
> >> On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> >>> I missed this the first time around, but I don't think this is
> >>> right.
> >>> Different CPUs could have different GICR_PROPBASER values, so
> >>> checking
> >>> against just one of them is wrong.
>
> "5.1.1 LPI configuration tables" says
>
> "
> It is IMPLEMENTATION DEFINED whether GICR_PROPBASER can be set to
> different values on different
> Redistributors. GICR_TYPER.CommonLPIAff indicates which Redistributors
> must have GICR_PROPBASER set
> to the same value whenever GICR_CTLR.EnableLPIs == 1.
> "
>
> So we can choose to set CommonLPIAff to 0 if we do not need to emulate
> everything. This is what KVM does

We could choose to do that, but as it happens we don't.
And as far as I can tell from the spec we should not be looking
at GICR_PROPBASER at all here anyway.

thanks
-- PMM
