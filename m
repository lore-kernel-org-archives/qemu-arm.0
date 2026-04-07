Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D4DFF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABpF-00056m-U2; Tue, 07 Apr 2026 15:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABpC-00054r-8N
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABpA-0002qQ-R0
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43cfe71e5d3so4726089f8f.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589054; x=1776193854; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxGfp9hWtCVNZq+ooxKwN2pXkG74tC8/mmam00LC3tA=;
 b=CLC9hcLm+M2beS3BIqxqp8+d8lZi12vz8mbuR4Ms63YS25X/d3Y/HjFv4UxSqLk4Gp
 l6WZ9Hmu+9YROBmsrUXM9nqEgGKwhcxEPh9cvQl1NBvaOHF1ODNopfKg9m55DPlSIDH9
 6ZKIt1yruS/I+3p8er6tLkpQtnzVzvKjfltRzFB1f3p7tR3Aucva3I3xVkyAoe2Ybe3q
 /K5b4rrWI1h+SdHcLJ1E8Edix5erhZg3mmWYXOKzPkpWj1FWIrQDikt4ZEJ+CPAHxEfY
 7zCUoKi3oOIpqE7h+HoA+pPim/t75GWTqv5BSCAWU93db8fnAq46K9XIWotrY6rmUe7l
 wNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589054; x=1776193854;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mxGfp9hWtCVNZq+ooxKwN2pXkG74tC8/mmam00LC3tA=;
 b=KUKj5CFQS51XtklTael3Vb//VdqC43j18+i6u1kBA5WupSR3O6QW57KWhgphhkybFB
 KHABmbFCmSzVxgLMOPx7lzXGAv/zpsQcHLBCa1Gm+27iw4NngTSgWQhrmSUNYtnh4TOR
 Kan0wYemtUIrbMKfLOEMsxU966YQ0N0Ugm6hr9I+4PHzo+UMKyx2YEXaYZcYueDR8ZRe
 kZJ+yxTL/CKCTKfHmILWdw/DJSt0EWo4R5+sYnAO2IlQSCWzk13ge1hOVNdOaQD0mZZY
 +0IZejGqTZopjAY+XUQVHd6mjTwl1dScpomiIgKDp076GCNY/zyRxQBUChy8t6G5VZWn
 vFQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIL7U41E7yjF9ls/eOdZy1V8ZtGZ6wTZTYbk7kIzpN/R2T2JP2r3It6+iHBAkuvVg26Gi7rNPGMg==@nongnu.org
X-Gm-Message-State: AOJu0Yz9NlpSyE0xqXX+RkoTUT6USGxv4z453RkXP1QLy5+USmHrhARr
 ASQMIxUqXc3FSHVsXsU1seIqpG4Mwun1lLWCU+vlVA6zQ1LWlmJnRTlU4mL5j5qIZIA=
X-Gm-Gg: AeBDievpkSKVU7x/bns4lu79BhopezR7yIBPb3edxT/FPlQ8Zt4vTnYFb3uqhQz9Hti
 cYFs8RpaIDnEuNrA282GAfQ/AGOqIRJ1H8XMUDS2YoxGrjfrK3GabrBexgubSz27G9sEyvVTwZ6
 Pmzc5H3sGZRtCp0efW+vaJYluxMF+qP/bDXdws9NTOn1FJP1eWtxHtaR7T1T5cSNsEaFb2SI919
 0FB3GgZmEjuCZfF1eEZjpYCOBBLdytb/TttjR11R5dseGNmNcV32M2bqloDz9lPcF6C8Fm3An1s
 0SvRtjmnlHvj26acGjuHqioS29XN+LFsshKOdsru0Y5pv7dVHf1xWJHtJjwB4voDD1oTlmmuFaj
 4QI0iCE4lY9335h6P3kNvVFlNBtNYqLd/p6s7CfJn3JSoeJjQBG+2RuSrhjXhLGBW5N6NI7VnFb
 u6e+CH1x1MOlO3eqpm8U9C8m48hal9Le1JOkC4rRA9tPAZSMbnW+th0z5JlntTbcgDmw==
X-Received: by 2002:a05:6000:2586:b0:43c:f8ee:c630 with SMTP id
 ffacd0b85a97d-43d292db10emr25342824f8f.35.1775589054552; 
 Tue, 07 Apr 2026 12:10:54 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c60a2sm50512253f8f.10.2026.04.07.12.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:10:53 -0700 (PDT)
Message-ID: <e6121182-9213-46ba-9ebf-7cd72d1fa304@linaro.org>
Date: Tue, 7 Apr 2026 21:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/20] target/arm/tcg/gengvec.c: make compilation unit
 common
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-11-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

