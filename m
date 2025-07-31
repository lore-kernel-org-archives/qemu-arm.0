Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC6C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:29:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhap3-0008S6-S1; Thu, 31 Jul 2025 17:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaXl-0001z2-ES
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:10:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaXj-0004rV-9r
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:10:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-31eb40b050bso838657a91.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753996225; x=1754601025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0k2LYOTpondkh0QlH5cLHMu4xCBe2JvKaBoAdGyR0FY=;
 b=meNfrQxcvuo5gdrk6eKAQDaqwR1X7mBMHq0Y0QlCuIIRG5kFIEG8eqZrvgCfJ4mxnw
 Ets4+S3Ppo3cw8UL7BdzmUORUZs+F1ixclpUnSD2FjdLWI0i7krzIN6reQrP3LUdDYLC
 IAToJ6Xe8yXNPb7l5ICRC30ka5qtwMYUiuPIRzp3RQZQiYDFa0TKP0ukCF4VUL3k/pSN
 x/mpwQ7v7Aqfd3fr2flyl7OdZpxVg1L0kdejwcX5vLIBoCAZ28VfgSl2pJqKJKJxwvq6
 19DAI7HH3vXty2ZvPlc0P05xipgBYB81otGQ8SytnkkYsQVX2b5vwhJe6McKEVfquUBY
 Cn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753996225; x=1754601025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0k2LYOTpondkh0QlH5cLHMu4xCBe2JvKaBoAdGyR0FY=;
 b=aQrK5Qln7EefZ65jrCnBaZDbiEiovpwCNZzH7pqPSBsKG9WnIdn1rOxUGlC+NbpYcE
 iW5JXZwWMDEDzyr5wjbbtX/QgucPFYeKD+VGHiU1DVHH5FHTLuWPN4+1P4m9oh1XHQuN
 0wAQwRYWCBc4h4mo4eNtVu71TS5j6M1PipxLB8BWgQsC9S6kRMlA6YZXY4yEgjZxRINz
 dFhEWVtOApl/97Ai1RiCrM9WcGjSFv6LTfXxcZUsGJHMPqbI1gglhuD03m0K5/VKL/0W
 kWG6BgAVwSC97QzPWdNyDbtlUypI+Cs2iz0pHErUVl4/1pzkbVw1sNhx6qYWMvQUST2a
 1+Jw==
X-Gm-Message-State: AOJu0YznH0HdoLZVBvn+cPT6tEiqKO76XBiZcQw/qPe9AZcqfpR+QCln
 EmKPE1E0pAuA8HrORH0yO9X+PGShVsi+cgLII8RYSKCFEx3e6kyrHcsaaPfceTmyHBg=
X-Gm-Gg: ASbGnctQi1oIg1xVaMjnBCcNwWHb0kkxF/E7eaId6ysO8JIxjiUNMLirysDzKktNQ0C
 stdYZVyD5J3maAwl3v50KwdYd1NXqVM2Tm6lDB3pC9TgaaeyYWlVZ9G1b5V7S1erjUIohuNcStL
 PrrkCnq2dNlw1B+BRXOvmHJk53aOaGpsGvyLaqTiFfajenhw1gFB0L5dzbKf8hEFzh3FhLNwKPV
 xpocdYPsr4pac1OfDcULBgPxe9LLsLXnfcUSH6tfmPlpupwjF8e6xbSHdhB5Y3p/yLsEm2DrQEH
 KoHcWjA550FHkUbKG59wopWO4O8JupXLqwB8VJXkx8x3gA6u0tAj5M32VkGwka/toFi/UOtlJo8
 Jrs9EmvV0RwnsRH6luhdvF1bxnA3a/G3yUek=
X-Google-Smtp-Source: AGHT+IHBwiv0gB8Ke+iD146VL9sbyMOeqyopNmnibv4VYHmWOAV1v/FdgNipeXtECHKsUaIqLR7dyw==
X-Received: by 2002:a17:90b:3504:b0:31e:ff94:3fa6 with SMTP id
 98e67ed59e1d1-320fb75c126mr343748a91.1.1753996225394; 
 Thu, 31 Jul 2025 14:10:25 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f0b4b9sm5594545a91.27.2025.07.31.14.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:10:24 -0700 (PDT)
Message-ID: <ef306c22-ee21-4e39-9f6b-1e8ec58a98e7@linaro.org>
Date: Thu, 31 Jul 2025 14:10:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 52/82] target/arm: Emit HSTR trap exception out of line
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-53-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Use delay_exception_el to move the exception out of line.
> Use TCG_COND_TSTNE instead of separate AND+NE.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


