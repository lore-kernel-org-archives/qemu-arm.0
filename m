Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4460060lfb;
        Tue, 7 Sep 2021 00:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8eqpQTRFnJPmcI9kC4qkAlVgp2Iu2kaEvCuljo8VFjjNpwqmKmd7wd0GJj9Hy+FDAyO4e
X-Received: by 2002:a0c:9c8a:: with SMTP id i10mr7793318qvf.59.1630999315172;
        Tue, 07 Sep 2021 00:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630999315; cv=none;
        d=google.com; s=arc-20160816;
        b=HjtTKNrspiSFZpninY8h3ROCm5xAaP3f2Da5wmNVwSHM8NAnowLAUzdz4b39OLWXpD
         IFB05gXRy1GwD2pCHqY/s5c0viYweXdOmMSrPkF/H/PJSXkOkWnJmpsWFKVFYhBUow4W
         hZbF9X61iQvAkfvyO/0mEbk+1ozQDPuwmGaobnUKSnC4Q0fEqIWJiXvFtljuwwpy2do9
         Hdig7DHxe+t4s/l24uK7t+5xp/5N1LRP32GyEpZRe/82HLqWViLC7tfkYV+yjVOP61Ox
         2oAPgtjtobTQSfxbW57hcFrXLgzmQBWQISvFGm+kCL8hU1h7+ttUN8JZBoOhQtlsfbnj
         2rYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PZj0im5PH/Bv5JBSbV1XWtSUufMLS62Seec99EmTY0U=;
        b=bvls2aPgHbIg/ksCnBWl6HAhGsZ9CuulO2f0i87H1xU42+u6o2Zxc//P9YtZXPBRGd
         BKqiQVXPbKvpFUi3vzNICwbyu9xy/1l12p86GRleMxGfsRJ2bPP9k2NPI1RCQOxVLwto
         Rn9huEuXrZn4FD9r2v9G1aIm4K9ct5iG/a+VrkqgaE7coWZc3dm4JeJgMjp72inxwhP/
         64gTOxOkO4Eh4t4TYands1YY5Eh1+wGpUwUGytwjBLQMhnSCsAaqvnlgKDuesxixpHiR
         Tx5QTKY9CXe6nbJEW67o2JyBJevDKUbIqxWOB+x+zRIrfiQcRY5fF9zcNcWZm5aHL8pL
         LZsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pffmksZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec13si6241695qvb.202.2021.09.07.00.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pffmksZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVQY-00069r-Ip
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVPL-0004zQ-TH; Tue, 07 Sep 2021 03:20:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVPK-0002R0-Hj; Tue, 07 Sep 2021 03:20:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so12875304wrv.13;
 Tue, 07 Sep 2021 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PZj0im5PH/Bv5JBSbV1XWtSUufMLS62Seec99EmTY0U=;
 b=pffmksZNhlJt0cBMr0fmVYeGeSoUqz0joZ8Y9HlqnzFM0u5YbObbvdWQTSnm6IEsoW
 dot5D5BnzAyLy4UeMD+gmdFIwxn3OwhiYwy5aNs7bvSE1cdO15IDfNaMTpGsr6MKthzT
 HIo3kfpFPfTFvr83+nQ66Wk67ZBCQVaYBXcgqCVZxet4PhZazjPtkMZ+3o/WKTSHsK4q
 b57g7omMKPjjMsKvbq5q6pY2cadSacboBeBbNNtuaVxtkbZd0G6MCKt6ssK4rVgwKU+e
 Om5dOu3PRSaflmm4X4Ir+ROaEqpFHwu75tht9sUfDkK2iahjZcpS/8QX2RpNxMyzu3Xd
 Fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZj0im5PH/Bv5JBSbV1XWtSUufMLS62Seec99EmTY0U=;
 b=S+ZxdjzQD4/g3F0G2KNYBqe7V14FeRPqw2imkoj/fvgBUeJ4FTE9CYffF5sAyRTU/A
 DX9WDBkM+E+iYiA73TOXhY9fP/BcxW2eJXP7MvcuCp/Vgb8wczx8vpIMHmQjNzV+b7Ku
 fHTD3kiVdgDLiaTqaw8KYZkZUO9PmxRs4gOz+a+zjFmajqV2S1ak8xIM48IZZ5KiseIm
 fuXecJv3y4q+F2YfXwG1F+fTEAPICCOHpQUuOXRqH7OZkdR6Tra4u+65F4oopZZdLath
 vvIvqHcMcmjeTQAVViwr/RI5dpEo2WFl8dvpte+xmJW3R+IDJV28/Gc0RBM4xb/0H1Sq
 csrw==
X-Gm-Message-State: AOAM530V+ZMClyl8BEkOMjW+r4154XQJMK1An87OATh7Nf33pqPLhWSG
 n2nF933B4n5hGV7mlTnlqw9ClQ1i/tE=
X-Received: by 2002:adf:ed47:: with SMTP id u7mr17260339wro.309.1630999236290; 
 Tue, 07 Sep 2021 00:20:36 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r15sm1823754wmh.27.2021.09.07.00.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:20:35 -0700 (PDT)
Subject: Re: [PATCH 06/10] aspeed/smc: Remove the 'size' attribute from
 AspeedSMCFlash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-7-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e3f5d94c-8d21-3fc4-9839-f2393d188241@amsat.org>
Date: Tue, 7 Sep 2021 09:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfqeKvxkb2jI

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> It's only useful to compute the initial size of the boot_rom region.

"AspeedSMCFlash::size is only used to compute the initial size
 of the boot_rom region. Not very useful, so directly call
 memory_region_size() instead."?

> Use memory_region_size() instead.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 1 -
>  hw/arm/aspeed.c             | 7 ++++---
>  hw/ssi/aspeed_smc.c         | 5 ++---
>  3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
