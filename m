Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2486320lfm;
        Tue, 16 Jun 2020 03:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe6539uBSMJVCHHxT/W0PNdCXZjbD/oDsrFb3+i5huIOL6TiqbbbIVbE8T5TfYFPWMXnpg
X-Received: by 2002:a5b:346:: with SMTP id q6mr3204320ybp.472.1592303286510;
        Tue, 16 Jun 2020 03:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592303286; cv=none;
        d=google.com; s=arc-20160816;
        b=xgDxCA/o9cTq/AvuIvTSxp4A3eUEPMe2RVjBnhGsAkul2IJECrANfN4uvIM45R7xAY
         5nIJx2rF/fXvFoYe2fEGDwkdcdoHKwXjDEAixsnBahHkuRUGiJ4DAmtB9ky/X+0N5N7h
         z23U/JWD03RnCJcs1YEzih6BmEA8hWBNas1UuFnBNC+MVdnzrR6rV/6WApuMZ4I7WdXC
         eP3jasLyoRBCXnqEqFA6NvY+zp+DjPdjtjcqp7nLHgcWegCWpO/VODOSl/mEvu8zXG+q
         1PqesyFhE/k4X5tIXJNRccFWyNLCQg+8V9cPsIxSJTTxdS83iATa/xFwSZa9hbaVNbEb
         nV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J0S2DQY2kWysa46WMF2r9WDjMSlrd1zDVgOKE135q88=;
        b=E0NwkWyvxb3uLE+sMOMw1oI7enJ7Nz43cSUrq8Q8relbP9HhWf2xZDclD0gSMMRCkX
         7aPsv2Igopx1+IDaHIV5jOXLIMSv46Jt7EQCj76nSeoCAaIpGhh9KyZTq6wA0Pi394S8
         t5n51Qtyq6UMR34UnApz+VHigEnWqCOApD0HMktGNgm/9ZcryZj2pGjeOBJ0o6htv45T
         fw2R4qzCEn/7o1KqaJRYQD5jOT6d5E7CEovR1DRSIuajgwKVEXdMhLO4Gi3hMYox5nW4
         gYU9zxOY2++1tU2j3MteDNtD9XOpU5UKEFobltvNSKUHl1NYzhCoA5NZeLU2vNkhU+R+
         YJew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HcHM+ccj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si16866908ybi.147.2020.06.16.03.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HcHM+ccj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8p3-0000uq-Uu
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8oP-0000Nn-27
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:27:25 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8oN-00014h-Fj
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:27:24 -0400
Received: by mail-oi1-x243.google.com with SMTP id t25so18773642oij.7
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J0S2DQY2kWysa46WMF2r9WDjMSlrd1zDVgOKE135q88=;
 b=HcHM+ccjwDDnZsiB9TNMAOM27OcVBg2No+yPfuasP1KdGpoQCKhA/3DC2xWdio0mEu
 RhoIdLLxte212lfUO1OMOV1bK4aXr7EyFIpCxCW/lVCF1PHYvLmdIVtg2tItgrTVZdMo
 z1HE/l5sCZ/yOrEON0lF9WztgjMCGkEBtFU7LTSZy3o4ru0JJneGkKRIexW/EwfZTWki
 A+kYl5sHOXS2efl+xVCIbgPZS/P1CGFfQBOMAJ+0ufxIZU/4PO0r0nr028U3dKJB5FuJ
 YLMHth2z4NB6Bu+TbYWrEKZ2GFZruWXVbMC5ES0Pj9T1Nh19ERFWg1IJ5/GIMqOXue/7
 wrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J0S2DQY2kWysa46WMF2r9WDjMSlrd1zDVgOKE135q88=;
 b=bWNrYlfUyCD3Ecl/cx3tMJgZoQ+73OxeBx/UgRfBzoAfcM1kE2JjVFQDcLF3EkDYC5
 I/ZmwiWjWdwpgeLuf1u0INZvSCRIzoRBiMVKf21zw7q38bObn84uY5GwRgrq3m8F7JSI
 G4mUdS5ArZcoHFL2Q8NgpJ5iddRM7POSxNFU59Q+3E+MC93excMKlgdXAV8qW1Bj76WT
 r6KQWX6GqDMYZ2mDq8arMgCUmQ3cz6M4EB/FCQBA+g0LcHdlgCLOvIvU0vJ9y5sH7+DM
 ZyHpvxp/U5+gAiFU+KWJF/Od2I7n3ehNVZtLsLKl6cNGZV/HWeKA5GHEDPr0ED6VQX5J
 odOg==
X-Gm-Message-State: AOAM530VzzGIJSJw5lLjf8dQtft2TboRYoI+nSgwBvtNJOVsLd54GRDc
 2lWRcRcBWeOk+zo0tjemDdJjKAIYLBBVemqxX9IuwQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2713469oia.163.1592303242280; 
 Tue, 16 Jun 2020 03:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-8-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:27:11 +0100
Message-ID: <CAFEAcA8c3QVD=PcfMOXn720E0ExSdV+mb3qoA61AFrFVstFHHw@mail.gmail.com>
Subject: Re: [PATCH 7/7] hw/misc/mps2-fpgaio: Implement push-buttons
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPHMrYh/ZNf8

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The FPGA system control block has 2 push-buttons labelled PB0/PB1.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

> @@ -249,6 +258,8 @@ static void mps2_fpgaio_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &mps2_fpgaio_ops, s,
>                            "mps2-fpgaio", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
> +
> +    qdev_init_gpio_in_named(DEVICE(s), mps2_fpgaio_push_button, "PB", 2)=
;
>  }

This change seems kind of pointless unless these GPIO lines are
actually wired up to something.

thanks
-- PMM
