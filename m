Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86CFF99C6D
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 00:11:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDtGq-0000rj-1I; Fri, 17 Apr 2026 20:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtGo-0000rL-7l
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:10:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtGm-0006UM-NH
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:10:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3614826eca4so555531a91.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776471043; x=1777075843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EVpSqqubsVXSRRzeOpPlJKLYWdiJNnOqvaVFXBoOq4Q=;
 b=ngBEoYTRgJlgiuIHg7Ntal2hmPSQAj9nJqCJA7cq7X5GrULXP67i4e4BYL/NVpTSFp
 t37MLHHElmo3Aexd1DdolMfvdAxUgJMiQvKSZlGTn+Tm/YIlqecCSJFcFlJQmidm/iHx
 haAtAo5BXSqcH2tu3bbB+6ww8mmqgeqr5pBvqQ2Ib+FkQBC6/uRVTOWz1iEfryXAHzhv
 lyXiq4n01Ytd+ITEFxNqb2pOIrV0FxxnnR8rbqWY0hyL4c/arsj13BExmRvih0XYNICq
 wcTHpCSLK4BGzfoyQfiOkwnFz5sXmv0HrBRZVSMcip2sSMlIt6y0Wfcct0FT3fLmblaK
 GRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776471043; x=1777075843;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EVpSqqubsVXSRRzeOpPlJKLYWdiJNnOqvaVFXBoOq4Q=;
 b=IpQqSeYtnhgFOt0zmRcwhbL1asmrw4PqC6WttrFWRW8XO6zMl5O9wOOv9Qy+gh5unW
 svYGil0B6380Ub/nywTKzlRFHFpiqbEcTPbt0HWeiVzRLm3kD1roFlzpEo0G4x6FKSvj
 DZIew693h1nVaQFQ8Mfn5nwGyuU6H7TkS8d0rnnY8H6z8GW57ItStGaQLIHQXFzZWHLU
 JQGJ0hX691kWO6kt8/Y+VAZXoU/Fos09Wsp2ifiDqsHLJf71ISwwSEGmaiBMgN3KmqXe
 AIxt0kwSoXAnQ+/P/M/PeY2irT7yH1M96Ze97WaxE9HOg7qui+0BqMRvo4mwLbHIh6kb
 VYWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MxYm4LwH7baj7UFqWp1fwcbPMMeg71T2IEL04ewjio1SUTpt436xQ0ynKzu9y7BQGqWdtfFTaKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzke/sIQhyvNnln+YUdDfHbxWe+5wGDfr6PhXEDZyPRPHvCrYhY
 Yi6+Y7YhtgkK5ugTYyRnDZmD1CxWg2a1H00F2fHRCHPhRDGuL0TX2y1DUXqn949x9x5z+JkHRO6
 RE0sp1gU=
X-Gm-Gg: AeBDieuWPSLRBpG6fYlbmJv+1iAwgyoCkWbbnrn6Wdo5zog+ddCgfmbTccqfpcJtKoM
 l2qrui5q3DILUT1DRJMXsxRwR+zfhdYN9xBLCQjwFF9K2sZaG6BlWwntIXQAj7aHItwPmAMnBFV
 pKASSf4j+Kudl6thif17771qjFsUCtlAHQ0Fq6pSS56s7chQKZ558Aufi9ph3jyvXArFBGLkDN7
 UwtTU93BaD7nqeMYPm5WWiEO+leeLcmLklbQSToHhHMfN/gW4DjCr8G3o4BeP2xbMDd2d54I4uV
 /82Z7gGAkqmAlyER1R1iicO8RuqtEKtwubXYPcuD7r9WSaCNVuhXO0KLkQJrZCwF1bTRCAmM/w3
 7vD94WdO7COUh0P7g9Sk1MzcilZY5R+FLkqszSMyDSm2nWF4Fa8Juao+479cG8PYR2GjRmUFeEt
 TZvBRjQdtaeLJ2e2tqY6nMekdjpQpIkii+UgA5JWaejbTAxlpS/9gKZAgXPP+39WGeEGjEPf9mg
 jxRmBHUoRXXtSIyGuyPL8l73dfOH/+Ssw8aCOfOEq56/Hm2G/lEaOLz5/wi/i+r6Q==
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id
 98e67ed59e1d1-36140464842mr4435573a91.16.1776471042858; 
 Fri, 17 Apr 2026 17:10:42 -0700 (PDT)
Received: from ?IPV6:2401:d002:dc0f:2100:742f:8dfc:5be0:dc23?
 (bg30dhzyct7sk57q2zln.ip6.superloop.au.
 [2401:d002:dc0f:2100:742f:8dfc:5be0:dc23])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab4cc47sm32729265ad.82.2026.04.17.17.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 17:10:42 -0700 (PDT)
Message-ID: <aba8b166-ba1e-4906-b648-34950bd4b674@linaro.org>
Date: Sat, 18 Apr 2026 10:10:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] target/arm/cpu.h: New GPCCR fields
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
 <20260417-jmac-feat_rme_gdi-v2-2-7cf5131aeb60@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417-jmac-feat_rme_gdi-v2-2-7cf5131aeb60@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/17/26 21:02, Jim MacArthur wrote:
> Add SA, NSP, NA6, NA7 for GDI and GPCBW for good measure.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/cpu.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20..1cfef02dc0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2089,6 +2089,11 @@ FIELD(GPCCR, TBGPCD, 18, 1)
>   FIELD(GPCCR, NSO, 19, 1)
>   FIELD(GPCCR, L0GPTSZ, 20, 4)
>   FIELD(GPCCR, APPSAA, 24, 1)
> +FIELD(GPCCR, SA, 25, 1)
> +FIELD(GPCCR, NSP, 26, 1)
> +FIELD(GPCCR, NA6, 27, 1)
> +FIELD(GPCCR, NA7, 28, 1)
> +FIELD(GPCCR, GPCBW, 29, 1)
>   
>   FIELD(MFAR, FPA, 12, 40)
>   FIELD(MFAR, NSE, 62, 1)
> 


