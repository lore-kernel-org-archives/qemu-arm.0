Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp647883lfq;
        Sat, 9 Apr 2022 13:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD7mzGbDPpP1xRQxtaW0GaUHmamqOoHKJpNar/KqeUOsz2etLDsl8VzcWqvF+LLOHh4R/l
X-Received: by 2002:ac8:7142:0:b0:2ed:10b9:239c with SMTP id h2-20020ac87142000000b002ed10b9239cmr2610653qtp.225.1649536355176;
        Sat, 09 Apr 2022 13:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649536355; cv=none;
        d=google.com; s=arc-20160816;
        b=Ij6BdmK2cTAgvhk96zA3BFBMuIegh81CJwDZvNOEask+6sPt8F+qOcE4zCZG9MaX3O
         Fla2U4qcSvwJ+7jU7e6VWE+vDUS2qsB+boHwSGRHHj94tslCDMtkB4st6XKxd7Ik5GCE
         +plMtpmm7zLGgrIw0ivzHONhQeuYrTa/rJ4ou7CZtwzoIxjV4dezWtx3Yp3XiZVD6Di6
         MKwZN+W69UzrBaz6blk7uLB9mWsxR8e3uJMK345DWSbLHTkYW5ljxPnM9ZIYZ3f5kbZB
         CV6Z9RBnybUsJJ5AGG8h+F8f4glYD8yrsoip2IoZV+ZRWEtQIBUq6AlfqDJcDVaOj701
         DWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YUdq7AuAx6RE1moO/IQCqS2arBxXNMwukd1fD21BErA=;
        b=R06M3in7OPDYflAcIV6nY/zspGzG2Pzz+Esp+vXKKgAxLCjds9gR2ww6+JmjzSzfBW
         em+KQX4iv1wxuvvbR1PkK0hnEs/n7VQfE760qa49L9+/il0Sl/BSZR3xey/MdAm6BLSS
         3bfHFOIPTWfiFA9IGemNGI/Ot1NUUk5aU/Q+uiuQ/AaIhJ7QwDcMqMHaBbYbW1M+Pmpu
         Ln2uNfd9YG2mlwvPvVCBgFUqiECM3DJscORVoOmcc+g63i/mvF4fX/9+mJ3yEx0xfgyj
         uZ84OY3Yih4UuYlm/yyejXwSEy1C+RwAId5X/PUQnOyxwTi6sIMM5SN9G5e8QTPAwi23
         vQIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svvCp7aL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ac87d48000000b002ebafcd02e3si2730361qtb.165.2022.04.09.13.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svvCp7aL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHl4-0007tK-Gv
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHko-0007sx-Mo
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:32:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHkn-0002fg-4Y
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:32:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso14851423pju.1
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YUdq7AuAx6RE1moO/IQCqS2arBxXNMwukd1fD21BErA=;
 b=svvCp7aLDgSj4/cp0MO5VFepz9dMVU0KRzyNPoP+dUyFJeyLhFO9GRtrPAC/6KSiP8
 r6HesDsElUCYxO3PWkmWEayK/A0qFMYwcntMGGgMXPFwZPhUd1gkLR6COa/9pjTbq+E0
 NGXVpuSUIjCYGAs5m8ZCE88tVNBSVOXyhoNgIlIgUfxGN1klkAZMy19x6zPDhtSFJ+mu
 uX1lr0nDwJMLmm0P/FZ/Fex41CssJGUC5FVzxDfav662O4D0XsjlKtdWDvaREeFPioQS
 jQNT7U1Wfn+f0gNW3sJkvh0etfLQKoKr7fBCbM1AFwr2mT4HmqnSgHPfUEI45qFnPG4J
 +Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YUdq7AuAx6RE1moO/IQCqS2arBxXNMwukd1fD21BErA=;
 b=N4dVG3kTsANprewV18iJlmfQ5UZ/ULPFf4Gzca7nPqVfUZ5UcPexQWhht/07QrHqSh
 po/wGcoVeqM1iytCtYl0a6BOnjVvVhjPN+X3uXnnRPAZtqMiS1yzcC66j7Y5tsGmbpf6
 ggTIm1t9LvGdjb6sfM1FXd1gmMcHkCfrQrwMVkTJMl4qC5xg6PBIEXUnsLQGQioAn2vM
 +Y8hC1/U7BzD43U2/pfV7LTKck6nBdLFpxkiZf/cyvljVOiEOT8x2Uv1jIw4I1poDDc9
 E8ztdyLxBaxjb8UAtZ14af+uxZ6zjRGocEGoELpbX6WETIP0Nx7XZRD3SdUgvSPbosPM
 siBw==
X-Gm-Message-State: AOAM53177T78okuyLUSxADmtbpXsWjyMjKD+Q8vONwEiH59B83kypYMJ
 i/h+/oh0f+Js2Cm3Pda8jEGD7w==
X-Received: by 2002:a17:90a:4982:b0:1cb:5c8f:e3be with SMTP id
 d2-20020a17090a498200b001cb5c8fe3bemr6513698pjh.108.1649536335667; 
 Sat, 09 Apr 2022 13:32:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056a00239500b004fb02a7a45bsm30706233pfc.214.2022.04.09.13.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:32:15 -0700 (PDT)
Message-ID: <ca73a8a2-745e-b1a2-ac21-55cdd1574760@linaro.org>
Date: Sat, 9 Apr 2022 13:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 32/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vlpi_pending()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3br+Os64TMv

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the function gicv3_redist_vlpi_pending(), which was
> previously left as a stub.  This is the function that is called by
> the CPU interface when it changes the state of a vLPI.  It's similar
> to gicv3_redist_process_vlpi(), but we know that the vCPU is
> definitely resident on the redistributor and the irq is in range, so
> it is a bit simpler.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index be36978b45c..eadf5e8265e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -1009,9 +1009,28 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
>   void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
>   {
>       /*
> -     * The redistributor handling for changing the pending state
> -     * of a vLPI will be added in a subsequent commit.
> +     * Change the pending state of the specified vLPI.
> +     * Unlike gicv3_redist_process_vlpi(), we know here that the
> +     * vCPU is definitely resident on this redistributor, and that
> +     * the irq is in range.
>        */
> +    uint64_t vptbase, ctbase;
> +
> +    vptbase = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, PHYADDR) << 16;
> +
> +    if (set_pending_table_bit(cs, vptbase, irq, level)) {
> +        if (level) {
> +            /* Check whether this vLPI is now the best */
> +            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
> +            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
> +            gicv3_cpuif_virt_irq_fiq_update(cs);
> +        } else {
> +            /* Only need to recalculate if this was previously the best vLPI */
> +            if (irq == cs->hppvlpi.irq) {
> +                gicv3_redist_update_vlpi(cs);
> +            }
> +        }
> +    }

I'll note that looks a lot like the previous patch, modulo "resident".
Perhaps this could be better factored?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
