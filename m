Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp416366ejq;
        Fri, 5 May 2023 06:25:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mc+NGG23y0+CqKmyuPkym9osnHXjbhJzDedU7eEEXf6OcAP2l+2Iozpq+R8rA+gCf9RSf
X-Received: by 2002:ac8:5788:0:b0:3bf:db0a:c105 with SMTP id v8-20020ac85788000000b003bfdb0ac105mr2452494qta.6.1683293142043;
        Fri, 05 May 2023 06:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683293142; cv=none;
        d=google.com; s=arc-20160816;
        b=FAtAq4fKPMWLDvZtgH7Lm69b1eZO9p4P74aVUAVEQjwtQt7gQKWptfHq/CKip/m3va
         2I4WgyExf4Y9sowSk7AtFxYeibxam1RN9JQuQq//zI2KxCDdhz+emwoMp8ZVYAewNhBd
         rOa4y9Y00BlKGOFHhHh57caN+fPO4Myom7EvvADJfUpGILL4hktYUlnXFJfXUmG6UvbM
         y6W8jEZr1D6To6r8MV6XpPkqWxnEoKtg3dtsUp6hJNPbs2OZZwaa0PQ4M9rTZFQ+FwZq
         4oDIzDrRL+99eoXDyDtWjjYIPPJLUfh/3bUR/3dh+b0zRrh4cd4Zkf+zPNgzbEqNkRso
         v6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jtuPnWYidREQNN7GB+JbveZnAWjmnlMhKTf5ncfRAs0=;
        b=Ge7KDkZsgS5T7LxAV2HwSYulzINJ/lBy82hbp01OZPeFTkFij+lhy5rrroWzsMjXDb
         j1aF5GngE70i3YY4Yb/cM94LhWkD8xPxF0ziARd+yKlkCbQ+4GfY2atM7Cbj2aHN6ZUW
         /Rpn/jNOcda8KLqGwnXmVAxZNrDDghH6hjQKuz6VS5gzvy0DsA4zSm6upfY2LPPl6GNe
         qNT4n8PNrI3le4phtaZJMGEkqOeOV+b3G/th2WrKhddhUQ3xMen4cFWID8u+q9IO7UMB
         wB4oLVE81bJL8J8XT4wbJjQJ6hqiAzlvqe3/BSXoUewGr/8Pg054S4QU42xUzf7i4ZnU
         9SPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen0n.name header.s=mail header.b=lMJJUbu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020ac85ad5000000b003e4d5f53fc9si559301qtd.217.2023.05.05.06.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen0n.name header.s=mail header.b=lMJJUbu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvR5-0005lc-0Z; Fri, 05 May 2023 09:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1puvQx-0005jA-JD; Fri, 05 May 2023 09:25:15 -0400
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1puvQt-0008Mo-EA; Fri, 05 May 2023 09:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1683293097; bh=STv0f+jHLckA1EHqwWSmMtjnliUbBLGUYPcp5gfNQEw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lMJJUbu0zk1czT20r6matTyZde1wO8JqeFf/1h1kfDnY8/RWmoyfPElAkbpQjoIvp
 hF3+B0Bwf6WWcu4I4x2YEgJ0swUpp9oh/GlOb5X/+OiLrhajIOupMWjRFb2BKxAQv8
 GMu/4t14PxtkX3osB7BaRoBjqavmd97OqK7wbvRo=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5FF1060103;
 Fri,  5 May 2023 21:24:57 +0800 (CST)
Message-ID: <fc71437e-3507-8d29-7b99-e4ba4f0ed7b0@xen0n.name>
Date: Fri, 5 May 2023 21:24:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports
 unaligned accesses
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-37-richard.henderson@linaro.org>
Content-Language: en-US
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230503070656.1746170-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: emc3BC35WdJs

Hi,

On 2023/5/3 15:06, Richard Henderson wrote:
> This should be true of all server class loongarch64.
And desktop-class (i.e. all Loongson-3 series).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index e651ec5c71..ccc13ffdb4 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -30,6 +30,7 @@
>    */
>   
>   #include "../tcg-ldst.c.inc"
> +#include <asm/hwcap.h>
>   
>   #ifdef CONFIG_DEBUG_TCG
>   static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
> @@ -1674,6 +1675,11 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>   
>   static void tcg_target_init(TCGContext *s)
>   {
> +    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
> +
> +    /* All server class loongarch have UAL; only embedded do not. */
> +    assert(hwcap & HWCAP_LOONGARCH_UAL);
> +
It is a bit worrying that a future SoC (the octa-core Loongson 2K3000) 
might get used for light desktop use cases (e.g. laptops) where QEMU is 
arguably relevant, but it's currently unclear whether its LA364 
micro-architecture will have UAL. The Loongson folks may have more to share.
>       tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
>       tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
>   
