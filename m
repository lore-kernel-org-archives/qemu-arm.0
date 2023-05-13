Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5278773ejq;
        Sat, 13 May 2023 00:27:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tOzLNynQY6oiTuoEZHj4jK3BrTV4h37GH+lBHg3uLmWxBXEicfpNrb2/3j8stxbQHeUqa
X-Received: by 2002:a05:622a:198d:b0:3f2:1778:813c with SMTP id u13-20020a05622a198d00b003f21778813cmr45396633qtc.31.1683962826724;
        Sat, 13 May 2023 00:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683962826; cv=none;
        d=google.com; s=arc-20160816;
        b=cf55vT4badq3LLhxoMgEQEkDYgzi3cWAV858Jf7vnle17xKHzr7xsw69Eus36ZCEcV
         Yh1iwvgClvu4Itzl8nyczBEAX72F4SVkgbdcHPDfNdr3DtzaBzpFjmydYqYVa80nzj0A
         59/3QUJ/qjhxsRnKGH8ofecxODUAsjmDtQsuQRytEkdt0yShIqrT0kcEuKe0Jpw4Dpcp
         WZZyhOlM/caKA1uuwE1GnWigF3fEdMr4sXtdgqC97l0AOYG9J2a8LfuWaJSVinzu9JrC
         tcXKdecHmmOMhLrPXZDm1IbHmSQ4EHC9CPfnphCQYTbI3m9D8x3YwiYGPpbmVyYbU+YX
         M3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=38vAQsS9Pg104C4fhaluIxHULL7vICvxFQPaDzfZwsc=;
        b=Spj/CmlvyoyzGEJ5/TKrFacpaosjr6Knp2E6inJwkKs9DF80jCCkAlJNHBuTGC35KB
         /c0UnR594loVamMWztcdue/eNU+EPx3GPD1MHHa4QTLaL02yhCcohGLWHRJXlnlDUEFF
         a9DOAkNY0ZsQC9JDxX10GhDQsiXZpvvfQYAVTEQqQ1QOXX2HHWylpv/4LQ5xF9v9w4xw
         eBuEKID/Og6bb8dezk3Aavq25qHA+51Suo7Cx70DaPxUvgz+zG5Uw+xrxDKGMzhVIfG8
         vdBPLuFnWnb6xWt1tDf3k7t09AyAvmjkAFdzJ5MPZDiMqLFa2OBmQcrhQV93M4Tv4XC8
         or/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGwkR9hP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27-20020a05620a075b00b007468facb63dsi9732312qki.613.2023.05.13.00.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGwkR9hP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxjeL-0000PA-J4; Sat, 13 May 2023 03:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjeK-0000Of-61
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:26:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjeI-0005ft-Mt
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:26:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso36754685e9.3
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962797; x=1686554797;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38vAQsS9Pg104C4fhaluIxHULL7vICvxFQPaDzfZwsc=;
 b=VGwkR9hPizwAKrmDOZu09d/ztkcnZHcq3S2TNZdxINJ+PfpHQ9BD1tZaWNIdVlOOZG
 Ty7zn+8W4/O5YpM93WOHrCKprQJgRlK6jAbpcDU6OZH0xe/WcAaNf1z7fc9L3hCPabiN
 Qb9oN+wDpByiVIs/tgKiIXEda3buYPXijZQIvZXUh4GDp8vnJ8waKOBl0/pfNKTCEHss
 Sat8/r0sm0wBYVFsX6VeE+/g09Bx1qrPXdUID09rfIBJjNgwJaMiA7LnQqkt9uwl9QWY
 in/iEqvV4tPVlmiSeSmpqcTcZB57jhHDKtMgVCSLa00E4uiWfi30Ux5JPyPjD9rlJdoU
 xMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962797; x=1686554797;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38vAQsS9Pg104C4fhaluIxHULL7vICvxFQPaDzfZwsc=;
 b=Vjca0OxU+SjdlcP0RmMCbwKZ4JZAtyONtb1djWB1TmOFQjDyiLoKszVTe1ancL+rZL
 hXUJVj5iBBnibu8i8omGWjjS/xHWTznPrGA4ANFzYUsmDi1Vudcgl7Z7yA9HYHVIvBZK
 Xz53Lr935xklddXN+G8LHuiKThPcKvhjz+NHExN2GWi2DoB891PPgfT4OLHCsVb4el78
 WhCL3HlfDZtITh/JQGD+j3eOTRe4gbw6VxE/fjLQi+kteum1wFZzZSJ09mw0FTMpYm6w
 1P4GAh7je29XtfG5IfTQkuYCINgCo6+67GARIiXcDPPoQDkLLNBCRFN0S8xVddDRDcs+
 6Lag==
X-Gm-Message-State: AC+VfDyLp3MzJM9uEH73uhgjzlAq0zbmyUAVYvFhehYM3SV+wMcj/+/x
 rU1Q/hvqtyts9Ab21cLAdKUHEaw6kKRLXNczvp9L3g==
X-Received: by 2002:a7b:ce09:0:b0:3f4:ec32:6a00 with SMTP id
 m9-20020a7bce09000000b003f4ec326a00mr5426612wmc.6.1683962796897; 
 Sat, 13 May 2023 00:26:36 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm5186754wmg.20.2023.05.13.00.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:26:36 -0700 (PDT)
Message-ID: <5f92c292-8c33-b9c2-4c0f-709b554ab1cd@linaro.org>
Date: Sat, 13 May 2023 08:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/20] target/arm: Convert CBZ, CBNZ to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: McO4keV3K6ip

On 5/12/23 15:41, Peter Maydell wrote:
> +@cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
> +
> +CBZ             . 011010 . ................... ..... @cbz

Similarly re the single-use @format.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
