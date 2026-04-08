Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770E310F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:12:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYGn-0004R8-0u; Wed, 08 Apr 2026 15:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYF1-00031U-3v
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:07:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAOLg-0000x7-BI
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 04:33:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso46104515e9.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775637198; x=1776241998; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/BoHUOr4AEQmUaIeb+hWbsWsI7E5HqpljjzF1DjrcYI=;
 b=cQFqZ1/QV49EUqVp9NHRRWCdMKfjFi30MyjcxMXZvCuwmm5wWRu7reMrqU9hGfhICE
 rFtLcuKuYahuRpzCO/v18lcuHg9sV77HDsqiQui4Bm+X9Qdrbwp2EtLxDP3ANxYy89jC
 pEKmvqvTkEHtaaWLav+/GzpSrAm5ogpjPRY9HB4rSorB8aOune//txxZcTUjfQVDBkwt
 hzuFYv4ZcfzfX7AcjGOd8RFKs7I7ttqcW7TjP68FjUogjBbEnfQ/V2RF6j7V63iARWAV
 hATFBbDrvq5zcaXo7wDUcyMLyn8/w7g8YIT1oomr4NwnOrM6fEswU1+RmsLB2SvxbJw1
 7IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637198; x=1776241998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/BoHUOr4AEQmUaIeb+hWbsWsI7E5HqpljjzF1DjrcYI=;
 b=sKfc/uUeIbtYugbw2gG38neWYgOA9Y65/SwBEvcFJ12F7SWGEEgD5lrNfukWFKRvHx
 fkyXwuNiRsiBc74qV2BgBs1+p8ZlcTIDKbo8A2/IxFSevXQ/Vc76sn+tSFa+Ozx7R1gn
 3z7Vra2wdrc0l5j52UlY4XEF1J1FznWboi2PK7yrSFnGMP2jBrARvuYKMrpr1S2im+0m
 59RJpOFCSW7hH7StK1ih4plrjTVsKlK1CCKONaMU6388DSDdj1p78UV38voWWpX4z+Xl
 uup/gznypCRmnTBbaD6mPW1umcxJ9o8cBQv6neFn8H7XWjMLct7K6CXz2F8hYNiTcXiv
 kI4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNIkj+AaugadWBlw3Mm/cghQiutj2aruaOpVLmvYbQPSnp7OHviYEfc2MZmcYEwY+dgKdZkeQ1dQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz+1aYA20pOU2ckt+3+Vhbqix7j/3RtJyxt+OR0HDBAdqiFSkiX
 h7s4smmAfs9E7vNrG3i4IkvOWbrhNHGptHYoyeSWq5lTi/KF0xXbzGjmA4aC9vnElDc=
X-Gm-Gg: AeBDieswWwXONv5EVAgdS06XbMYjy81eVAkgq9+ekQ5lCjxCxLpOb42Eue7Qfv6aumb
 M23KO43kZO8S9pfNPEE9HaiamI27nmCOidZry3+JS/vXQH8n2NLhXs+Q/4ei8W41q/zsT57ya5u
 ALi+PJLuvTR7wjiQrwqSAKbEBY6VCrkeXrOMScWOkWBTCQS/wU0oecDMj9NRLhw9aiybh/8jOYb
 it5+HsoT9inn38bnNxJDi1lDHLR24KnyOvZI/e0T1v8E7BeNoa7UYpupOETnTTQDkdA8Lk6TA9D
 DzyruzggfLJuencOH8bIX94e420Ze7CqIOy+blDTn1l7NgQouElihk8A6kYFR1HaoEXxrZxTHga
 lfzvl1rvfuOKYzfEoObu0MmrbUdgECoA3f6ZFcb+OKcintqbT7aPEp/bs5wpssPjef2V060MMgZ
 VBzXnwPtR1RAtkJwzx7gkGlAf8ZcX6D13o0ZXZcLUHG4koFdM9cCtQkE1kK+qPpx469g==
X-Received: by 2002:a05:600c:4e86:b0:480:4a8f:2d5c with SMTP id
 5b1f17b1804b1-488997c9b69mr266074115e9.29.1775637198602; 
 Wed, 08 Apr 2026 01:33:18 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5325dd5sm22654365e9.2.2026.04.08.01.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 01:33:18 -0700 (PDT)
Message-ID: <d35edb3d-4fc7-4a77-b8b8-d2b662f55862@linaro.org>
Date: Wed, 8 Apr 2026 10:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/21] target/arm/tcg/translate.c: replace TCGv with
 TCGv_va
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
 <20260407222208.271838-16-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407222208.271838-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/4/26 00:22, Pierrick Bouvier wrote:
> We know this file is for 32-bit runtime target, so we can set
> TCG_ADDRESS_BITS. TCG_TYPE_VA is derived accordingly and is already
> passed to translator_loop.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

As per v10:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


