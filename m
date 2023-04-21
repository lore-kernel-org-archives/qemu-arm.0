Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1441988ejm;
        Fri, 21 Apr 2023 15:15:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZiyO96tO832yW/7u4N2HsseCeVOE2HnySfO0gmJRrLH44rwNQ8EE5TZauYRnfmeF2oHxL1
X-Received: by 2002:a05:6214:1c08:b0:577:5ffe:e0ce with SMTP id u8-20020a0562141c0800b005775ffee0cemr12770771qvc.25.1682115344223;
        Fri, 21 Apr 2023 15:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682115344; cv=none;
        d=google.com; s=arc-20160816;
        b=zZvkV7C9glSwZqMdjfMkHEXFadL3AGrg6PgE+OuPs3rUKiK8dKu9z/AkU1r5xh+OAV
         xEfWHrXvR8FOXFVF3IUre5SSR2khKGRvDqRw4zr1arbQz7MUCnL1nT7unFW0Pktbr+0Z
         1hhREsT8uofmg4w3BEr0DN+XKvuCCfHf1O9gl/AVa92nQBhnWJ8W5pxZ6M6631HEskKM
         JqB540OEPER10YrLd94Yemdtaheo05oWoO2Ox+t5t4u6jHtvY9GtDxpf2omy0pEtt/KY
         1UmsBjnUMMPDPpmkJ71Sfneyz0GDc8+TBaOqPhaj2RZPhI8MAwCifpl5nkm2QaNS/sX+
         O9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xq3F9Yl1mWqXHaoBsdwT39XxG/T+7w5RJ/3RWYE3Aik=;
        b=g3bGHIqCt21wxQFiE9vo5QIUrktLq5OaPCTA5CZXwW+ndcjAuKGNJhnCFsHVF0pytx
         /KUhPaljZA714qUVsI9JULz7gLB0mnVlRoRBPfm4hIqIHGW1e5gRea0BcxudT+B8LZw3
         JmdRhz45mqVmEUDpbBO0Z59dBcfHcddmUmdLJGuCz1IR+1wUqdooacp4/qVlhQemUrFK
         wEt5m4zlppSOZH0jPA/FTCP1An3tb8agJNDw+ExJPk0rrIf665es7+7gc3FyZUUj28pM
         rLI0Woivtsnml5hd7Q5/lYmCX0L4O8oL55GiFR0IROwLMKwZZUK0j65FvN2nABw/ZUbA
         7yRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKcgdObY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx12-20020a0562142b0c00b005e3d15f61e3si3929240qvb.341.2023.04.21.15.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKcgdObY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppz2C-0002pD-5J; Fri, 21 Apr 2023 18:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz2A-0002me-MJ
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:15:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz27-0002mL-QW
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:15:14 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so5304515e9.1
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115310; x=1684707310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xq3F9Yl1mWqXHaoBsdwT39XxG/T+7w5RJ/3RWYE3Aik=;
 b=zKcgdObYL73f/3tiBqshgX230CdyyFG56uQtsfDUro/waopYOPSXNQXqAO+6SCSTqO
 DqsAB1OYN5v4j08YOpplPEMy8fajk9FEztGlCQN+spTfhQN6KPI7IdrsMY0AAcBAGfUy
 nO19i2b5esIJJZj4RCEgtE15TEwQVEunM7cLfJwI+MuqKxbAMGRDN+Sg0qtbygElXCEJ
 hg3F5WTUB7EIdecDK25pnDM5AeoPVqEZ4a7/1PqohPlI4dTHrfewqJWQGHCMn2dqIakD
 r3KtgYxJteLNLXxsjvhyimz15ouKB1KVMY92cMjzc1OeTKj4wJ6wNA9Pn1xpRIEOMTMC
 q9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115310; x=1684707310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xq3F9Yl1mWqXHaoBsdwT39XxG/T+7w5RJ/3RWYE3Aik=;
 b=Lr1QjssN11ppeI0OQGtIuna6WG1b648EtBPdWbA9VXGH/CydB/dY213QzL2NLrdVmj
 swKr9KCW3T0a266oYOt/Rhv+QwDjqTR2ENayC23zeJVZ8QHDjAQRTDHoBhzjFd2wUkhz
 E5FJUyegwqxeM83Lx3f2l9eVjUrneJj2/Z5NY5I9EB+6jA5PmZi+qn1qg9jWpEYTjTEg
 sWJ+0OFLEoP3i1VqHKoV+Z39HufNhbai3c6bEZ+0+h6SRpU8XFv7wrkSzu3srsifxe9T
 VAMYEzgZ1juIgm2I7tve9k4E05rYYy0tC/4dX6KgAIU7+voHylhrTHRs53kfLUdy+8WV
 em0A==
X-Gm-Message-State: AAQBX9cGlekFovQJAcaSzfIIsXs76J3V12ycO6fckyqbZ5V33jgN3Kxm
 2hP8kpDbm+NUXoHyS17aj1sMGA==
X-Received: by 2002:a05:600c:2145:b0:3f1:9879:5015 with SMTP id
 v5-20020a05600c214500b003f198795015mr360753wml.36.1682115310195; 
 Fri, 21 Apr 2023 15:15:10 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee63fe5203sm5881584wma.36.2023.04.21.15.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:15:09 -0700 (PDT)
Message-ID: <7ee63566-e6fa-6d2c-a943-22c2b288b590@linaro.org>
Date: Sat, 22 Apr 2023 00:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 26/54] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: D4veFru71M7b

On 11/4/23 03:04, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)


> @@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,

s/1/true/

> +                        s->code_ptr, label_ptr);
>   #else
>       TCGReg index_reg;
>       tcg_target_long disp;
> @@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   }
>   
>   static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi)
> +                            MemOpIdx oi, TCGType data_type)
>   {
>       MemOp opc = get_memop(oi);
>   #ifdef CONFIG_SOFTMMU
> @@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,

s/0/false/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

