Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3191850wru;
        Mon, 1 Jul 2019 17:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/joQWSAltPlpLXy/JMH5B/zQQTD8Uohssz8onXFeKD2FPWygXlY34NgCYPCLBE5eb46Dh
X-Received: by 2002:a50:a4ad:: with SMTP id w42mr31625385edb.230.1562026283214;
        Mon, 01 Jul 2019 17:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026283; cv=none;
        d=google.com; s=arc-20160816;
        b=xTz1Ia3NJpVo/IhwrRdL0Z16Oa+Rn94dfUXLhorbk6CLAOTaDoIcYh3Fe9sIZkVcsz
         eJRaiqnYxZpl0m4M46qWM7gooP+QncRb5S77MJFHCBeRch7iaPF7vDwCVvrfIKBySN4i
         7K7O9epuAU5QP5nSNLfR/6JiTg2HzHRBILBLUzPgcolDu3oCwBbgBGcmPV/1GVFZKgV3
         +QE6o+y/e0aftYIQyQjGTsOHMAdxr1/0cxgCmQ8CzYAHaFsqwG6bwM8EJk0v3VbmEr0q
         PzD3C8L+Uzk1p20iZ70UR/Hp9wmwRTxnQpbl+RhQdCTevrR2/nJhkxhLOqrV4LRSu5ht
         RMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=r//KTEG5DAhvwYFBTCLmyijNq18FbJoDajikMBX1evY=;
        b=wTdLEpJvz8QXGxfhisv+aet+bVYgGToCqZY3Gg0bvJjU3xLQxfg61tSGHlRj2HWLid
         rcoJBC2iU2RWnOgOBZ/WUoCXLkNiKAVUwGX094GfOEPYoi7nB4graeMk4olSBkL5K84M
         RDYNX4CPBZwupyGFO7YDtuBuV8Bx4zOckJE5SYWRYlRSAT6tVTDwrcNBx2TmAIcr9Bel
         Q+D/emfb5n8DoK0n9nkPXYIAbhqcsC2HWxWHYoG7RyrbmgvpKGgd938AEU3EVecgEoV1
         yZK6EmYkz1JOHS8ydarHUYSOHW8GLxbN74CNvNTAiVqnL+3/e99fT4GNnUFVnu/vRiyP
         CG+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KN22IN/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si10496230eda.247.2019.07.01.17.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 17:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KN22IN/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi6OI-0007YV-1z
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 20:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34925)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <leif.lindholm@linaro.org>) id 1hi3di-0004qb-Om
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <leif.lindholm@linaro.org>) id 1hi3df-0001xF-Rv
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:15:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45796)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <leif.lindholm@linaro.org>)
 id 1hi3dP-00017D-GI
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:14:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so15288569wre.12
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 14:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r//KTEG5DAhvwYFBTCLmyijNq18FbJoDajikMBX1evY=;
 b=KN22IN/iOPsTuk10q3naJITrrLvOky/+WFerjD4n6MswNFEHx1ew8wfRnfA4GjmzvL
 xD6s/J2Ud3oVKKVT/NjKGVgqieZu6TR1ptDisTDrGAIZJtCPOAPHH/wSVkB05FvuJQ7X
 orPeW5gg9Qwg7i/N1DPVyjrRaAwFs6a7w6XExykwS55MK92GFNm/HkJMIncbD5CFDmpG
 Z9TdkBWRoqFE1PcUNqVaipsZtF348fmCJ2SGNfNRGBAwyCbR/pn4OxvPzfWLnE3KAnSJ
 D54MjrkLrBnrSr2IOPe8kAm9Vd3SUmrJkHhJkPhiTy16zTivJMhu+EJb4p/yttv/u4Gu
 avNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r//KTEG5DAhvwYFBTCLmyijNq18FbJoDajikMBX1evY=;
 b=XWB9oLK9++dfd/jeKvEsayf0qZGPugBTeFaUNBnRExUOR3m+Af78gYy6sRAGWlvWxp
 B6j/++JyVEl83cc33e1YvdEio1qpM/OOr3tkIFRdkjtXvOnST2ansFy6Qkop4+nlzHQv
 4r830YwEy7ZezGRHbgG4BzX4TzFwlZD+PK3iulROH5STCI8NRmAmvzL4qli83+rmsBqe
 F1q3HNGme9HSj+VvfZ6+0w+jeY5Ji/Dc07AX8Zsmhrj2r2SZ1u2s7ihicFZXCQjNebxu
 y/ir12otVkY01C9wxXya5T02sDMalimtnnAyM38FseqJ2BYntjwMozroCpe7PiUuW739
 CeHQ==
X-Gm-Message-State: APjAAAVt1bs7CTjxpLM5Hs2HuPGylwADcKzJXYyKtRxiP+yXNpHIqny1
 8+CHsPoHv9eo+5MmZQQW4v5AGA0FaZs=
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr12932178wrm.100.1561997329047; 
 Mon, 01 Jul 2019 09:08:49 -0700 (PDT)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id q10sm11370665wrf.32.2019.07.01.09.08.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 01 Jul 2019 09:08:48 -0700 (PDT)
Date: Mon, 1 Jul 2019 17:08:46 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190701160846.fwjeco3zuobn3pgv@bivouac.eciton.net>
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58Jsd8JT1VKF

Hi Peter,

On Mon, Jul 01, 2019 at 03:54:24PM +0100, Peter Maydell wrote:
> I've pointed out a number of issues with these patches, but they
> all turn out to be very minor (mostly fixable by moving code between
> patch 1 and 2). The other thing we need is a MAINTAINERS section for
> the new board:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cad58b94879..0bf3739f06a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -728,6 +728,13 @@ F: include/hw/arm/fsl-imx6.h
>  F: include/hw/misc/imx6_*.h
>  F: include/hw/ssi/imx_spi.h
> 
> +SBSA-REF
> +M: Hongbo Zhang <hongbo.zhang@linaro.org>
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/sbsa-ref.c
> +

Sadly, Hongbo is no longer in Linaro (but has generously helped keep
working on this platform being upstreamed since he left). It is my
understanding that in his new role, Hongbo does not have the bandwidth
to keep maintaining this platform once it's in.

Unless I have misunderstood this (Hongbo, please confirm - we would
certainly love to have your help if you feel that you do have the
banwidth), could we please add Radek as a maintainer instead?:

M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>

If you think it could be useful, feel free to add me as a designated
reviewer:

R: Leif Lindholm <leif.lindholm@linaro.org>

(I would not be offended if you don't, I have plenty to keep me busy :)

>  Sharp SL-5500 (Collie) PDA
>  M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
> 
> 
> So rather than making you do another respin, I'm planning to
> make the fixes in my target-arm.next tree as I apply the patches.
> That way we can get this in before softfreeze (which is tomorrow).

Many thanks!

Best Regards,

Leif
