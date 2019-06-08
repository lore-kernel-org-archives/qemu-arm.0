Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1548999wrg;
        Sat, 8 Jun 2019 12:39:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye986VQmgh6roRxXXE8bDvDW1mhn3i2dlWlWmsgixWWpQDGt/AbOUHNE+je3UXW36lz3Wr
X-Received: by 2002:a0c:816c:: with SMTP id 99mr28191196qvc.165.1560022743058;
        Sat, 08 Jun 2019 12:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022743; cv=none;
        d=google.com; s=arc-20160816;
        b=kUuUb0BXDbVLi63Dz94TEv0j5+SNZ0JiQKLB5ubLllAH4RAEfQTDfxHlumdkBTtxAr
         2J3+l+pNJMcbQb4mCIispLQGzGLUun6NRuVTJDwdtsCcA6YOP33SkgG73po8McVVT7au
         6eMsqVQVo8FN5f5FaBZVo08yBb955kFx3zRQhExNmc6QHPSK78I7nXZD1z4ZlwaeJI5s
         O3Z77Mj9SPfOdsgiEBoAQ0b4fCbVjq7BH8NuvmNKkAIjg/b1JmTV8feibYA79vm+N24+
         OvxZviQxyDC12DuSoLVPr5OTWFVrhGrbwNk//Mvi3wxRq9oBFz49GlJZH1c5uUkCrMjt
         KoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=YZ4oxGbsUfYDMglYHvCwSjOkhVYTctKCxCwRbC/jYQM=;
        b=RYiO6OL+JTAAS4AF2J15GRmA1QYKkkZW8ItG9flrLPnKKQmFe7Wr+M/hz8fp+wij6D
         fXhb6ZG7bc4+/r/bXlUMPHGoqnUUUd4VspbLXVUN9nn6YoxM2vU7G5eKzneLxRAw+BiQ
         GTtqj8ZLR993cT9R2fJNPwi95mZTCRHuJkNZBYIZhN3vrXRhSuxO39w1KFIWJ7sdZAxY
         IJbwQQ+qfpIpkJzgbmxC1i+LGmxgG3on1Xxo68dwUaSTcavY2Q7RN/FgADNkvvnBuxLm
         veVbBIZEBcRcBK9/MBKt545jXTbVSf2V79EczHQS0OjVZQdZmauKCxw4Zgx1G2f8Yeh1
         /bzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r1VbWNin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m68si3518782qkb.239.2019.06.08.12.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r1VbWNin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhB8-0007AP-KH
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37943)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2H-0007kh-5p
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2G-0007xm-7m
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:53 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh2G-0007xQ-3K
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:52 -0400
Received: by mail-oi1-x243.google.com with SMTP id 203so3686803oid.13
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YZ4oxGbsUfYDMglYHvCwSjOkhVYTctKCxCwRbC/jYQM=;
 b=r1VbWNinMYx5Ook6KKSE602bJo4Euiccf5VHCuq0t3cpfPUGg3YzcqlIij/blsywoz
 uboEtyU2sZ42E5w9c/7UIVYgGx/EGKMQUGxM+Mo3d/6Zd66Hi5gopXDz+QK4VvzDLeYk
 GBfutXkNXgLPyqbqM57n6uPoOOe5FtARXqdKVNdtZi/WK2hWmvS0IyGqkq074DOOOXwq
 9bvkb9DwfcIK7ktqu8o2uC5OxVJTuVInWSq00RSiEPOw5QsCIvs/gcoJbf2Pad2Ryhs8
 yasuFmDLVZPjWQCUb+cV3bY1yL0WsC6Cc6okre75KkwWy7iRdoC6qf7TIecrX1gnCsJG
 iJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZ4oxGbsUfYDMglYHvCwSjOkhVYTctKCxCwRbC/jYQM=;
 b=CvFoxSmGGqbDkYnWInyMuewnBoWmSHHKqw049uqtFOhIt5BZEkDxP5dMFiJ6yd5aVw
 Jboc06uW9LoSIv2yntVGua0Zs68KRtsx01C3Chnp1D4+Y9bnCjmIm4gBJXJjg2oIlxQN
 ZkUbDnH21GkFnsbvp+WyB/pSQCDIDCcAjZzUinz1YUbKyOrg8ALk/+Vdd3AseDmgs3J6
 nu640nQaZ0kuQHFRARf0iRBE20yoA8fcn/PGKxmysxVlEW02ENMq4oSKrnp2GcaTERCb
 JtwUZqs2GGqVIXWUkVblrCCDFk+mpuqLzZv6sXeNR3irF6cvXTvDbdU2rgryqfTQqmzl
 Ep4w==
X-Gm-Message-State: APjAAAUxESKpo8e7Jzb6zRVsDshi5sd7o1mO9ywPOs3GEH1/J+zaGO+K
 tfL7GX63fpgGsp/8VTt3Bs5BdffFPT0mXQ==
X-Received: by 2002:aca:3011:: with SMTP id w17mr200599oiw.150.1560022191161; 
 Sat, 08 Jun 2019 12:29:51 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id m17sm2070530otl.38.2019.06.08.12.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49bc9d4a-4d59-f8d1-ab6c-5873123330d1@linaro.org>
Date: Sat, 8 Jun 2019 14:02:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 33/42] target/arm: Convert VFP comparison
 insns to decodetree
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z/KzPKYGJ0+D

On 6/6/19 12:46 PM, Peter Maydell wrote:
> +    vd = tcg_temp_new_i32();
> +    vm = tcg_temp_new_i32();
> +
> +    neon_load_reg32(vd, a->vd);
> +    if (a->z) {
> +        tcg_gen_movi_i32(vm, 0);
> +    } else {
> +        neon_load_reg32(vm, a->vm);
> +    }
> +
> +    if (a->e) {
> +        gen_helper_vfp_cmpes(vd, vm, cpu_env);
> +    } else {
> +        gen_helper_vfp_cmps(vd, vm, cpu_env);
> +    }
> +    return true;

Missing the temp frees, again in the dp version.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
