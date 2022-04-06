Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp716123lfu;
        Wed, 6 Apr 2022 06:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr27x4OZHX1eHdtouwzlWMC6ob4sjbc92/6Yixj7MMFWlsaymENZ6HOHwK0tf+oP9txN3L
X-Received: by 2002:a37:e307:0:b0:67d:374c:aba1 with SMTP id y7-20020a37e307000000b0067d374caba1mr5600290qki.752.1649253444897;
        Wed, 06 Apr 2022 06:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253444; cv=none;
        d=google.com; s=arc-20160816;
        b=c+BPzOXGXF42vw3eIC7HTAFD/EZ82YtCeuZxxHGO5jk0o+FSWy719BEoIqBMcJFlMx
         942N25XHLi87OGrdxHq//iWrOaANgzALBjnoAkTu3bL6CPuMK+TcPI9s+ZaxzHUa5WBk
         LGA2Gax6z1a5YKFG+I4Xh5GWgSivXCeN9Y0NZaSUV1rBaiPWk7711Ppa/ED+y19Ilbfp
         DLDbbVMrAEd5oHhiuzJR4Ct47gagAtpBpu6G3mgyZQX43sAB9z8KlwOVk+KdIM826cqr
         ZF76kYBaxN7O7IMW3v0WR1unEYtaH9pqxRRetiWtNoEI6xs7tgT+ZZr0AYQngH4X1JEG
         pSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=nl63IwxSb36AsL1HSm1GHnum+45yU/tgvjzAoQ79UC0=;
        b=YB7lChgPQ9boguS5BCdJN1FGzSIzozVjZnlvjlNoINEtCUCF8ejiNAdygUt/FZ6UcB
         PlQfwXla/OmIKoNqPzcdy52mGdZyQC1R8qTsR1m8SHmX6PpT2r7Nvb0RKSaVM/UDH0ow
         V4MBw2Lmlo2KQY1YgOGOIGDRDnKcUYi+cJI9SM3DUkUasbKyh/IPeGdxqY+PSQTTzRKY
         1sVQ9SCE9k8czeMh9ICfL5HA11aUHbOtDOg9AWe7ZIJUlDyl7RdUV6G6go0jpluuf/JC
         gk76RgwSC0ZFSYiW3xO8qBJnvea6Nk9sk+jgMgNqPc0Cnay8d9vpBr/Sf3IJwnzY9dNN
         qFxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bAcVzby4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn13-20020a056214094d00b00440ec52a99esi3273915qvb.215.2022.04.06.06.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bAcVzby4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6A0-00052J-CO
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc69Z-0004zz-O0
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:56:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc69R-0004x4-DJ
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:56:54 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-de48295467so2973210fac.2
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nl63IwxSb36AsL1HSm1GHnum+45yU/tgvjzAoQ79UC0=;
 b=bAcVzby4VbJNuATb8RK7Qn2YSfR0JkWG0xmk9Ib7OTq9amFT3aGZuoJIcT50aaIwII
 ExLPfJSPjhd7Yja1kQNV0kk2BmFzWclfBIwGLy2LtoB+HZ3wft6lQxXjfy8wgemcbpFz
 kaX9UQ3S1EcSh+U/sb7xbKUg8xpbL+FvYPnlw5G40pP3+w6gRQRoVkY8FgbMfVfID8mm
 4bdMSlH+Ra2X4llQHpLddchWX1YQkM6jFA3odM/qdFTHEY41I4i7i08plNnx3a6+wnTZ
 HBCS5HndtswB3VJmSvrynDXnA0FqI+OuRHUKe+1GIa8+Aw3oelher/FNFUfGwmSlBRgf
 XsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nl63IwxSb36AsL1HSm1GHnum+45yU/tgvjzAoQ79UC0=;
 b=gCH3hcMFPG0a18O8mEO3yoXk2n0q8vBLJLeATMhiZ9HN/BSZe37ZwHvuJO+VWtvO6b
 10HQP0dEjxleQiEf0jQBXyyuMuJP7FAzZx6b3t+6f34WHod3IVKOg2RCVuSyHOT7OavZ
 ccauc9fgzaV5DH4KkeUI2up2VMkgUFeuxYlxwh2OpId2C4Wefz43wf/PtWS1FKEhh9Bj
 0lichOijafqKpVNI468dNuq3TSAoskb7/TaOq+S/JaVWE9jUUTSLz7jTazB8CTe9x0M2
 YU9nVSuRXWTSw1AJhMb667QrOq2WRwBkkq/kTFdC+qT5AZ4t+T0tlIX8CKYJat0YOnmt
 jzNQ==
X-Gm-Message-State: AOAM532y/Yh+09wVTDubl4lfM9fzKtss8a/ZIAeuPFTklhZcKY5u82JF
 SKvyE0RBTD80kwBd5dcelRENtQ==
X-Received: by 2002:a05:6870:611e:b0:de:d210:9d2f with SMTP id
 s30-20020a056870611e00b000ded2109d2fmr4020873oae.141.1649253407878; 
 Wed, 06 Apr 2022 06:56:47 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 o64-20020acad743000000b002ef3b249b9esm6408992oig.58.2022.04.06.06.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:56:47 -0700 (PDT)
Message-ID: <df1ba1fe-257a-aa98-cec1-07a6e2554e86@linaro.org>
Date: Wed, 6 Apr 2022 08:56:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 13/18] hw/arm/exynos4210: Fill in irq_table[] for
 internal-combiner-only IRQ lines
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7e6KlMY6/Xzd

On 4/4/22 10:46, Peter Maydell wrote:
> In exynos4210_init_board_irqs(), the loop that handles IRQ lines that
> are in a range that applies to the internal combiner only creates a
> splitter for those interrupts which go to both the internal combiner
> and to the external GIC, but it does nothing at all for the
> interrupts which don't go to the external GIC, leaving the
> irq_table[] array element empty for those.  (This will result in
> those interrupts simply being lost, not in a QEMU crash.)
> 
> I don't have a reliable datasheet for this SoC, but since we do wire
> up one interrupt line in this category (the HDMI I2C device on
> interrupt 16,1), this seems like it must be a bug in the existing
> QEMU code.  Fill in the irq_table[] entries where we're not splitting
> the IRQ to both the internal combiner and the external GIC with the
> IRQ line of the internal combiner.  (That is, these IRQ lines go to
> just one device, not multiple.)
> 
> This bug didn't have any visible guest effects because the only
> implemented device that was affected was the HDMI I2C controller,
> and we never connect any I2C devices to that bus.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/exynos4210.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
