Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6393703lfp;
        Tue, 18 Feb 2020 10:17:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSPsxLSgkKS2HyTHV2q+F/xrwPuNRrW5LWoHwYYWvxjiCBgUILHqx5FK9MK/i26ko+WoYM
X-Received: by 2002:a37:806:: with SMTP id 6mr261202qki.75.1582049843404;
        Tue, 18 Feb 2020 10:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582049843; cv=none;
        d=google.com; s=arc-20160816;
        b=0qM1oI7yN6kNqNENRdan/5e0cx/QYLXjM2BaFPpPrLbh8B9zFR1dN3PEbrlMMA/Sza
         g4hrGQ01N97JQy83WyjbaG0u711LfdJd+YWsE0YUogBrv8Pu9kVZbJklZxYwOEFpBq+T
         N0d0DT5KjsKx1jIcjOdbKtTU3E3YJNTcj7SFomx8TJCJc8EfOIJhGkPvcKuFx4LRLSzx
         GsIPpNn3TVifSrd7ttU8N3l+wMTht9ZWQ07hozk7Xmwf5E7goS6Vn9jlO0DloRK3/c/2
         TF3IfuRo/YeBASna/dmtOLahBr26DyTSCuvhpg/hmikilI1iKGy6nS8vBHg9fZPR5SJq
         4rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IU1z/lDGDjqG+SqTPFK48+J0dlcBWNFWyaGTdTIn+Y=;
        b=L4x26zwncCEEnH/E/U0SrrbZF67fC/z5wxFtDrcaHDnnfmUXSjnH1yf1FKKatbc1Cf
         zJjzLnwEHZk9/tiuMvr/erQ74MYF4lkKptTO9AlTV5Ve8bXmK3xSISqm320kU+T0ikwG
         DfaHPmIVXrKsnv5Y2Lz0DkDZpcY6Hwc3VvfUgerOfnu1kbsgxj5qTlXKiJIW/ixLH+nw
         z2IJ4nw9bn8rhrhGqu4d4dzpby2sOLJOn67nPrDy8MrO6/iqbm5Mb49h1BEINE4O0MhZ
         3OM6itSrrYwI9j8SZgtTOxLX0Gne6yTpaLSaxV2JrSAeBGLY1oXivRCdmg06LZ101tOg
         k3tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IMOEfXBW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si2051465qvr.108.2020.02.18.10.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 10:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IMOEfXBW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j47Qw-0001A2-Rb
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 13:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j47Qk-00018z-LL
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:17:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j47Qj-0002Rl-Cw
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:17:10 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j47Qj-0002Pf-70
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:17:09 -0500
Received: by mail-ot1-x343.google.com with SMTP id w6so11254532otk.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1IU1z/lDGDjqG+SqTPFK48+J0dlcBWNFWyaGTdTIn+Y=;
 b=IMOEfXBW1/AymufZSCU0E1TJjvP0pdJN27cX/ER8cmeSJ+CYBHawcV4vzfJoSfZcq+
 aFurAGQETH0gKjeRXc8/B0d/DDRFTLu/kgEbTamL9RqmdasgGmRyf6rLyc48wx/TtBV9
 8Ungr/8xETk8h+YAiJYKP24ie4x7hiPsQsGHDQVs1HhU1kL1KM5aSB7L77bShp8alAsh
 4Quxkq3gZfYElzk2H6eklOCcLWOoKt9uNY9ifqUWr0tyAOLApEqkFRUHU98+WqHoCjsy
 /Bs/mOzeKK9dUxnKsZ32yj2zxQUyr8QHi3UDqbq8WzNnQCmjMi5DbCP6yWeJSpH+ISmP
 Tb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1IU1z/lDGDjqG+SqTPFK48+J0dlcBWNFWyaGTdTIn+Y=;
 b=g4yxUoz2XhQZoAWCNYQzYJF8yBl+Mwm7XCROzgAL+XgklYwrzVzvP+kQ5b3Zw9onkG
 d68JOzsXqKttzLfTO3SzY5LjjsLUomDkZzTKK6qPuAQeWv7GGYWJlMleyCjOoOUzlCRy
 mOpuKKFLHbDT1PkWMO6nKnKNn44MUNc9vSAlki35amFkHVPboyaByqv2/swv5Fg/Ctd+
 foP9l1PeUcjmTWxfU3ErZSqIopce+JtFsQknFXEOU2BBNMhjHlR6j/QGFycy5/QdlKdP
 A4v1Tv0KeYDdhiFna/G/7kfNSJZ53O33jNlLKxg7WDihImkXSLSj8mvfA9oomALmQfmF
 o/VA==
X-Gm-Message-State: APjAAAUMg2jFKOPftkcjpiXaSXahnTJY0YQ4XgCexGsCJ3uRDKpvdMtB
 VGWManP6Hql5ZHgTfqEjfQJu6dCAeJFVcTZlcIGYqA==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr15946114otq.221.1582049827603; 
 Tue, 18 Feb 2020 10:17:07 -0800 (PST)
MIME-Version: 1.0
References: <1581686212-9625-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1581686212-9625-3-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1581686212-9625-3-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 18:16:56 +0000
Message-ID: <CAFEAcA9Bs9VuZNstbpF6Q2=MhVDN_HHMnUdwfOJSf7Qm9to2nw@mail.gmail.com>
Subject: Re: [PATCH 2/3] cpu/a9mpcore: Add num priority bits property
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 60EQuy9E7Qa8

On Fri, 14 Feb 2020 at 13:21, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Set number of priority bits property of gic as guided by machine
> configuration.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/cpu/a9mpcore.c         | 2 ++
>  include/hw/cpu/a9mpcore.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> index 1f8bc8a..eb1e752 100644
> --- a/hw/cpu/a9mpcore.c
> +++ b/hw/cpu/a9mpcore.c
> @@ -68,6 +68,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>      gicdev = DEVICE(&s->gic);
>      qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
>      qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
> +    qdev_prop_set_uint32(gicdev, "num-prio-bits", s->n_prio_bits);
>
>      /* Make the GIC's TZ support match the CPUs. We assume that
>       * either all the CPUs have TZ, or none do.
> @@ -167,6 +168,7 @@ static Property a9mp_priv_properties[] = {
>       * Other boards may differ and should set this property appropriately.
>       */
>      DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 96),
> +    DEFINE_PROP_UINT32("num-priority-bits", A9MPPrivState, n_prio_bits, 8),
>      DEFINE_PROP_END_OF_LIST(),

You should be able to just directly pass through the property
from the GIC object by calling
    object_property_add_alias(obj, "num-priority-bits", OBJECT(&s->gic),
                              "num-priority-bits", &error_abort);
at the end of a9mp_priv_initfn().

Then you don't need to have a DEFINE_PROP* for it, or a field in
the state struct, or manually pass the value on in realize.

(We don't do this for the existing num-irq and num-cpu properties
because in those cases this device itself needs to know the
values, as well as passing them on to other devices under it.)

thanks
-- PMM
