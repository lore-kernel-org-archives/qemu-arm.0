Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2266042lfk;
        Mon, 31 Jan 2022 06:09:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYYfF2PCczErh0Ph32fKkCazDg29poVbVtWIpig664osoLHj8DIvd5R0dCxscoYlU0ssuI
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr18135590oib.40.1643638175505;
        Mon, 31 Jan 2022 06:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643638175; cv=none;
        d=google.com; s=arc-20160816;
        b=lQ+ZwL6X195uIWEVZ2XH/Ygtx+gEbCy96Rb+VFH2j8FPxfcH9eX72NjQQjY+867/z2
         voL5YQm6NU2SCa9IlrN2x2li5F+sAK68kjUqkGe+eElDopcvxYwXURKxl7wetqEIqjT2
         NMrHguUoy1zrVFIfFUdXz9h2GqKBRvtoHadlKdsPAOO63YJwHhK8zq+ZcbXv/1FjBAA0
         cmfFiRKqcqqRLqQYmS/1vnQvmTS2r+OBP2J8ahDztDzr8SPrPYLATAimClA6ectOigqQ
         dT5DVFuEt55NSvHdDMO56i1tA01IPpzN2eCZ4BOU2v4f60zY5QuUL39BrvJScb36Uobg
         RU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=fx23SND8V1sz634UVepTS3wV09PRCsMKeba8kwWDipw=;
        b=eT7ezX139obhs6s7jPhCIYr6fL1m76BF7pbMI1VD5Jo+MmQGoBv2pX4uuq7enJmASe
         Yw1HniC6XVtDUqc29dqSoYmh9HKQnQXZcuIGb28hAzRtwlcSyPoeYza1XVf841N8e96+
         43cpzOJD9soGtvNY10U/xJ3LuE2EvZ9H8D7w/oT8uH490t1iN4wYBU/YRMCsLMsZ8XQa
         IfuCmhRY9N1e3eUGdx/NUCefSWnpKA3wBq+mhGMVhkTCIaY4XP+f3lKHCNf613H7sP/B
         1vUAiE8Zi/RZP6dslzRvqe/Brmw6eOcv6bDmRtYOo5EnTQC8ZDQLUoBhGguLr/Z1LTTX
         Q19A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z4mb+qVP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si10816682otu.269.2022.01.31.06.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 06:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z4mb+qVP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEXN7-0005uG-EF
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 09:09:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEVcd-0003og-0k; Mon, 31 Jan 2022 07:17:31 -0500
Received: from [2a00:1450:4864:20::233] (port=38747
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEVcb-0007r4-FN; Mon, 31 Jan 2022 07:17:26 -0500
Received: by mail-lj1-x233.google.com with SMTP id e17so19153146ljk.5;
 Mon, 31 Jan 2022 04:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fx23SND8V1sz634UVepTS3wV09PRCsMKeba8kwWDipw=;
 b=Z4mb+qVPH4E1bBUQoWaff1w7UOjslrxZIjDiX/QydsRgyZr/hiFaMZlcdN9AqTpkV8
 8W5vD5gJcKnQ2xZPpUzF2aYYkTPb6Z9Zv9YADb9HUdiIxBTj2n5uhqu1obQjCVQi5zo6
 ncFc8N2a7xXuZvLrC0Oxfb/WiW2SQ0brneshbXAHXA6naNzy5oFhCuHexL70yteu3yJR
 8mifIskWoeYKcIMfBa3RhCxvxHsCynWpPYnwzTpMB1ZNeYyGS2CH/fBZQriYSijd0C6T
 oIM0FPDL9ULwHbVM0U1cHYJM9RtzfZEzIvfEl8PX5AYNzCd8bTvzDg1VAHBoM/zIuByH
 a9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fx23SND8V1sz634UVepTS3wV09PRCsMKeba8kwWDipw=;
 b=BdRewiM9MW5t1gmD0JEVG//3Kj3dzLM30bpprNii3UmYQnKKDTwoSWJ5s6/366U1Uu
 5knngt9zlnMUYjQ6+6azqi1UBtSc0YujAWAAgpcJ7M70S/skI8Ms+XKZq8FE235fe0fx
 naq6Qe+NMsqM9+Uq0D7cvZ0oE5ftOcblurrvWgAlr5uw/N+mELZZwlr2s+5NSBXWNQ7K
 erN9MELBn/IilTs2F4+aA84litPWpvqrxQJvpsVO3eWJkeY6MwmMYRzjdzFNJi6y3/TB
 cGlR+zuMgLLchCEaKbrY4g8uTb1qJFi9pO/c5jMzSyDWdyIkFtWbFtVAlUCyA5SQAAbI
 CCCA==
X-Gm-Message-State: AOAM530M68peY6rhGosK2CVeB6T7cxYDHTlNZE4q023a4rNDbkAZjHed
 CfEcL+hIy3xOgu1Zu11+Ibg=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr12870082ljg.95.1643631441809; 
 Mon, 31 Jan 2022 04:17:21 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j2sm16165lfc.174.2022.01.31.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 04:17:21 -0800 (PST)
Date: Mon, 31 Jan 2022 13:17:20 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Message-ID: <20220131121720.GS3586016@toto>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
 <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kbDJ/CwxEc9J

On Mon, Jan 31, 2022 at 12:35:54AM +0100, Philippe Mathieu-Daudé wrote:
> On 31/1/22 00:12, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > 
> > Add a model of the Xilinx ZynqMP APU Control.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >   include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
> >   hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
> >   hw/misc/meson.build                    |   1 +
> >   3 files changed, 349 insertions(+)
> >   create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> >   create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
> > 
> > diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> > new file mode 100644
> > index 0000000000..44bf264cef
> > --- /dev/null
> > +++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> > @@ -0,0 +1,91 @@
> > +/*
> > + * QEMU model of ZynqMP APU Control.
> > + *
> > + * Copyright (c) 2013-2022 Xilinx Inc
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
> > + * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > + *
> > + */
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/register.h"
> > +#include "target/arm/cpu.h"
> > +
> > +#define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
> > +
> > +#define XLNX_ZYNQMP_APU(obj) \
> > +     OBJECT_CHECK(XlnxZynqMPAPUCtrl, (obj), TYPE_XLNX_ZYNQMP_APU_CTRL)
> ...
> 
> > +#define APU_R_MAX ((R_PWRSTAT) + 1)
> > +
> > +#define NUM_CPUS 4
> 
> Hmm isn't it APU_MAX_CPU?
> 


Thanks Philippe. Yes, this was a little confusing. The values happen to be the
same but they belong to different models. For example, the apu-ctrl model will be
reused in Versal.

Anyways, for v2 I've renamed the macros to CRF_MAX_CPU and APU_MAX_CPU respectevly.
I hope that makes things clearer.

Thanks,
Edgar
