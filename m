Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4106669ejx;
        Wed, 23 Nov 2022 03:59:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ZW8braamFtAhFEo0xvqcSa+NSDRzatAA+Gh/iaOMzENhz5Il/S0KLBS9KuHz+pWfLjSP1
X-Received: by 2002:a0c:8043:0:b0:4c6:97e3:5c4 with SMTP id 61-20020a0c8043000000b004c697e305c4mr21181367qva.53.1669204791360;
        Wed, 23 Nov 2022 03:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669204791; cv=none;
        d=google.com; s=arc-20160816;
        b=sLP2EioUnXCLRdLWTegDHywZzaid+aLlgDu3dh4PBldIMJzChD1wtK/LbKLjL22qdg
         xnWddB5cK1C6hHcChIMktn2cpl59oDp0H7MNcC9KJHsOHbZ7eIsfDWLjX6q+z+WeesDF
         Iwpbjteqh8Ge+VFLaLdRypCM7Q7dpmTAUHZiDXNfHEqMyMGye4HxlcTO5USvwjck3tvk
         UK8JAItJWEEMYgC02vMyHoWu60b4R9MlziVEXlKkWOAYqlC6NR+RGGtROi/CoAEPCiNC
         fiH6vjit8pwozkh+lC/H+nlJIIs0E/66F3p0gv8d000jkCFurKqQZiV4WX1de8jHVtuK
         EqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HASg6FGjF4AWSODFZwZUHQgxm6DkhRHvDVB0aynntmE=;
        b=Zylgt431foVsRQ1B69s9a5ipslXoW754lW456d9CQmQdQCsmfdhTmqES6QjkMn/wlS
         jVxDR7+rd8Brt4tz+NyBBCRPN3NglIlumlfx5jWBsrZgaLPBMcsymmCXMjXMlKQikv4m
         5CjWvf1yhCrPo49iSxQ9NemjiEDC1B70RkswwSJOtPQllY3moL4CrAphQLnGIchchVMf
         z2d8iaraKp1eAXrvE1dThprhimiP4/rIchnoCYwlLAdduEwqudU2ywR3WXrslM4WcfQ3
         O1JDaAi4is89OMNQW21Zhoz0M39ZuU6QsYsgqbX4WtVy60JCGiZgpzQuFC7bxLno4jUZ
         xjYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YroJeawY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl14-20020ad45e8e000000b004bb6b995982si9551715qvb.581.2022.11.23.03.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Nov 2022 03:59:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YroJeawY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxoPk-0006dA-Rf; Wed, 23 Nov 2022 06:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxoPk-0006cu-4u
 for qemu-arm@nongnu.org; Wed, 23 Nov 2022 06:59:40 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxoPi-0002Ub-Gy
 for qemu-arm@nongnu.org; Wed, 23 Nov 2022 06:59:39 -0500
Received: by mail-pj1-x102c.google.com with SMTP id mv18so8051038pjb.0
 for <qemu-arm@nongnu.org>; Wed, 23 Nov 2022 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HASg6FGjF4AWSODFZwZUHQgxm6DkhRHvDVB0aynntmE=;
 b=YroJeawY8Y+XWxFehXHqXxQoe7qciR5UChNmrVcQExv/egWdDg1LqZWXoJ+eZsppKK
 FjjJomJBPg8jLz2Ht0IJWHvTV1Xp11/CbFysv1kUqZ+3LcmHAm6IdreeAX4zdqPl4Vc9
 ugyaEoLL/lPSHSyHx8iX/Wp+XjuiSS/f5Epb9I6glIFFBg/WWmjDPI3HPcr3mqw2V81O
 7lZW3KJk6bLMbUKtEk5HC7zOn8aFDfS2mgG0H0kS1v6VK69nFh5XteIQoQs8g1dpQMzB
 XE7wsXj9GmrPn4KHxBE+rgaGeMJ1D/s30pc00hN/T8gwYvus63Nvl1r2cPiOP0wQ5kwH
 knSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HASg6FGjF4AWSODFZwZUHQgxm6DkhRHvDVB0aynntmE=;
 b=6G7BSCx7CwaNIEEfFD9iWm5r1OMulJjYafLiw67gw7F4w5hiYR8GMX06ohEFVM+VaA
 69ZL8Gbep2RmJdrxB4u5LHpjgQ3RjohVbi4gwCFin96DiO79N2r695A7ZpFOGF/gLfNe
 YdbUh+lrU9tofOtzAmn23i+Y0KZ1dXDBtqjqqiPSf1o8PW6h2NQsbZlTh1OR0Zpc32eH
 8hsXP+1+6laSG0ppFhZ5btiZM+X79qME3Eo3sT0/0oCNWl9CLZd6wsMqTaxiQ473VhCe
 kzHaD0hPQ7Y714LTd6uJqEvkggWgL4i2WBUmD4H3IvLi38KPm9A8N3C1Mm4ssULLTqKT
 94pw==
X-Gm-Message-State: ANoB5pmss7YUsLz1c6KJEpAj++ThXKhks+Je9C3zFp+RaDXuPi/DvHjn
 9XqjILolOVLkDaeQVD44I6GKyF/GhXjMbadH8NxgRA==
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr24941049pjk.221.1669204776677; Wed, 23
 Nov 2022 03:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124033802.meuiphlcskwu3aty@M910t>
In-Reply-To: <20221124033802.meuiphlcskwu3aty@M910t>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Nov 2022 11:59:25 +0000
Message-ID: <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
Subject: Re: arm: gdb-stub is broken by FEAT_HAFDBS
To: Changbin Du <changbin.du@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, liyang <liyang281@huawei.com>, 
 Hui Wang <hw.huiwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y1T/qUbulPoS

On Wed, 23 Nov 2022 at 11:38, Changbin Du <changbin.du@huawei.com> wrote:
>
> Hello, Richard,
> We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
> ("target/arm: Plumb debug into S1Translate").
>
> (gdb) target remote :1234
> Remote debugging using :1234
> 0x000000000e1716d0 in ?? ()
> => 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0

Hi -- is this fixed by commit 26ba00cf58e9f21b08f (just landed
upstream last night) ?

thanks
-- PMM
