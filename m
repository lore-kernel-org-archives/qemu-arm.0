Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1210332ejb;
        Sun, 23 Jul 2023 02:23:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFl/kHQcaRIkFNhQgjX/fzhuS8/Rc83JjijviY0RYjm+4giHPFW9sGYxA0MJmpiKnd/xMSe
X-Received: by 2002:a05:620a:244d:b0:767:e669:db83 with SMTP id h13-20020a05620a244d00b00767e669db83mr5126865qkn.36.1690104210861;
        Sun, 23 Jul 2023 02:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690104210; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6nVYgIzk0PIkSWY/nN594abqht8OayrZ1ao5M14dCBEThcF6lkQ91QvH3Ee7RzkCg
         pWhf75txrifmu232Zjl2XS9AnLwZ478Dtk8qKLVGjoTKKMtbIhk6CHnpYpst3T/xExIC
         knbIIzOCbTMhXlb2I/fQmVCvswSEq7IdNock4qNkMYKiIPehnR37VAV8MQkm1g51J/50
         JAaOOUGC46Ojd1jhnPkhY1L92bbuHYQ37QAsMPc6CP0tGHrG+UBMDyLi3ILntRuU2Um2
         O8KqOtBwYpRL27V+9f95XVOIVgJajEaoLIkFKBOIovO0wrZNsdxHa9vMV8SvuSUSIgEg
         0meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dBIRvDvbAAgiSOiksnDiyA9EKIfEkbYD6lzcO0sEd38=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=dnFXNOMo1TmDR6cNYy7Up/Jx/4ZR4bzbYYG5+2uOWlovbVDACYB/PtE+T2X+6qhIhB
         QvRVEPeg1uLTpPv7lyyiPXsXOR7xI92zerMT9Od7wRpRnfYX2Hl9aVhyk6MEIKpteFyQ
         zbOBHUXywOUbE6UAZPtQhMh4aB19KjnzZ22cfomViQQlrAsBDGQmDZXM0VDrtdpWcplO
         MMUrwRngn4ApZZiLajalJeVoyIgaghH/ljwqiQuGjVhQM3xhE404py6+bG2+0gUINsji
         T5ms57myCnxC1oOwMHfLFd2eYv/LE4UVhBiy3ImxFRylrqiSb3BHdOMnUElloEjKnbrt
         uaog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4Kf0LCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05620a439200b007681bb94366si3834791qkp.611.2023.07.23.02.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 02:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4Kf0LCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNVIi-0008TL-Vp; Sun, 23 Jul 2023 05:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVIa-0008SO-Ld
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:22:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVIT-0000ja-5T
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:22:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3159da54e95so2361018f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690104142; x=1690708942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dBIRvDvbAAgiSOiksnDiyA9EKIfEkbYD6lzcO0sEd38=;
 b=e4Kf0LCGaHlznWm2hBBqDIZXhmjU63dGW13mvpDVvX6vjVNf6aJyqRnSKvglMypt9u
 V2g5yVhQLaMxkJDMx0STlE0L5XxcU/bToSoNr6DqGmzgCTx53iz8fHyF5HJ5pwI87dmW
 N2m8zjQQROdbKRSh3QcoeZ+njZqe8nOJAB42zIgpKiMMBy2GkPxNW7iioWFEJR912TS9
 NCrTRWtrjOh4Scly0YyUJsnsElvKM2/qeMtbSdE2g3DSLH8Pg8gMWmk2nT3OIXSsqbsO
 gX6Syzm39X8015gvQlyd6n7/nOte5o3NqAoxoOiXzXLsaU4Vxq5q0saDComkQmprPjNo
 rfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104142; x=1690708942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dBIRvDvbAAgiSOiksnDiyA9EKIfEkbYD6lzcO0sEd38=;
 b=jAbF411geNmS9f2x1ibQMMjPFhXO3uv5z96tclnStZUfAsCdYFX8kEPAr+O7yt7/iT
 x3m4IrHeMIcaiiWAlJs70HqDF80JOzpnOT40fPMdegYEcwpTH45NhZgyC5sk0mh/JdwA
 HyJEoh8HCzl20ijeoOdwUnLGN8DqV4wkYvD5hk4B7YelOGmKhjTtVgqxaviLUOYAW8Gx
 IDGoYmMg83Rzl+RmywW/2CS+zbOab+CIiakKJmaO/Iz+psgrg4AST19Yl3OjhgJdSRUB
 pi7wcRrhtH9PovfGaQehS1+xSoWgqrC30ODbHiLmRJ2z9XxraOjPIw85ov9bssCfX4px
 lfKw==
X-Gm-Message-State: ABy/qLawbMYSwi0QsFdL3I8UsLniXyh1aRwBwN6KmydOjciDELN7Y2bt
 o9KzfYUR+GfZ86+WU9fFEPVg7w==
X-Received: by 2002:adf:dd85:0:b0:314:124f:12be with SMTP id
 x5-20020adfdd85000000b00314124f12bemr5648673wrl.3.1690104142067; 
 Sun, 23 Jul 2023 02:22:22 -0700 (PDT)
Received: from [172.20.2.226]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d58e6000000b00313f9085119sm9133419wrd.113.2023.07.23.02.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 02:22:21 -0700 (PDT)
Message-ID: <e9da711a-4c9e-594c-cf2a-88c8cd0a9af0@linaro.org>
Date: Sun, 23 Jul 2023 10:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/14] target/arm/ptw: Don't set fi->s1ptw for
 UnsuppAtomicUpdate fault
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: h1tcFO2D5W4k

On 7/14/23 16:46, Peter Maydell wrote:
> For an Unsupported Atomic Update fault where the stage 1 translation
> table descriptor update can't be done because it's to an unsupported
> memory type, this is a stage 1 abort (per the Arm ARM R_VSXXT).  This
> means we should not set fi->s1ptw, because this will cause the code
> in the get_phys_addr_lpae() error-exit path to mark it as stage 2.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 1 -
>   1 file changed, 1 deletion(-)

Confusingly named, but correctly documented.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
