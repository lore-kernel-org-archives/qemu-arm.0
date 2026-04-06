Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A32FB5175
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:25:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9sNM-0004Ve-FM; Mon, 06 Apr 2026 18:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sNL-0004ST-FY
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:24:55 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sNJ-0007r2-TU
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:24:55 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso1950156b3a.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775514292; x=1776119092; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6lciqJHhtCqsiSVE/OGhsgpeVxIed/vEA11CKzs+d7g=;
 b=REsKWHhq4xFxibVn3lVxN3iZ4h+8RKIzk7gx0cXpq+l7ns5p9GbRGvDlZJhJkJhvMJ
 uivXkXNKgXyHljHa8LulIgELFJ3u4hzG0l4jZ98OGi1do1Rv98iEDKGPSGrFyai4YO+p
 N6ZCtQnZ2mBtK14UTtM6r1ieLended1s9Fw7EDZNnFDn7R9qo2ejqWAmL6YhjVNfvcA8
 dFXnHB5w8Dx0ZhN16vBg++SidxnRGVJtKqwuBCtN/UL74eW9uEddLJN1mIEhbYQ7yUyb
 S3JcqD18WPOKU8X0YgPO77DNUmQAW2S/wTqpTlE9YZOJpX/gkA1KvdkA7eYuF4QtXqcN
 +QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775514292; x=1776119092;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6lciqJHhtCqsiSVE/OGhsgpeVxIed/vEA11CKzs+d7g=;
 b=cS06wG0AmU5AVyr8XTnUtmmrJA4y3cqtlqG8XM47/LUEYDxjV9uuKiPu/F3BNYvybY
 oPb4yqCD/IrzfZVLJ4YvJ6iLYVj0vuE6F3lppA/cEqq80ikWGJ1P0oWqcq/r572Ry2zT
 sbcqmGt9mFsBCFZRz4BC/PcLRc1Kk+XJCD6dSooOsS0joTDt8sBcQVCM+Wo+crHl6zip
 KHrSL09CDmHovoB4e/f/1CiEg3fwHp5ZS3GHydmfgPjemHUiBxZFZjF9NZb8KdCZyLHZ
 Zotty4e4NBQ+4zUYGaIXskxHGQxQl5KXXG1xGlr1HzimG0wZnwkHps1IfxFz0sSpGSED
 uInQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT4CpGg8EwIBdCJUqPqwLv7/StU982EltceTHZw4pbeHBwFneFpZy3HR1nj5g2gM2XJxQQc0vddQ==@nongnu.org
X-Gm-Message-State: AOJu0YxHUdrWPjW1VNN91679TonAe2L9G65vPhYGBee3TXpXIARAuAQc
 0NK4G5Ntnbu3RoeoNG9e6dGM7bo+Tz9BpGM8dnaOjaO+e1qrxj/Uy6yzISGZgggCxA4=
X-Gm-Gg: AeBDieuJIPG8b0SSJ8yHhKn+xznYeIhcNSFHb3LZrPpWv01sPMK706L77Yo8qmZKhoY
 /X99x3dGVOos8gFRSTbiHlah2bfkaV2fLts/phZ0RQfilcE+MkzzzcGwQwoeAgm07ojLl8arKlF
 YXLb4uJLd/xMs/WUYBm2pIDmw3Krxpby8r31MJSRSNOP1aHVP83g7cRTVyEJy4NdkbBvPozkkro
 mK7/es/aeovCgxUgivcQ2PBDaQw2MBWyjge/8JCHkbXHnC/kwVonPHTSGlFb9MG+lOfZXOLAUQl
 WM1iqYcZS8mBmmV821Lp/smmNO7WHftqBgvESgJQrPuT83EEkHQoEkDcKfcoASliYNmEJh419uz
 vH7n2S8vCrl1kJFZg8NyoGGsUNCI8y7GpIjAPXfXFOVUgv87kkFY6f5a7r9D2jFQYGxEgJjkLuM
 JBcFk8qGwvvpQCb3CJXNW0PTSpiLfGqFqWWXTTCe+w+WS7aAwk3T06lV6hutYqp5hilGA=
X-Received: by 2002:a05:6a00:301f:b0:824:a1c9:8a30 with SMTP id
 d2e1a72fcca58-82d0da8f3f1mr14316858b3a.23.1775514292223; 
 Mon, 06 Apr 2026 15:24:52 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9c4126bsm14882233b3a.36.2026.04.06.15.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:24:51 -0700 (PDT)
Message-ID: <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
Date: Tue, 7 Apr 2026 08:24:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-18-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 4/7/26 04:26, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 7fcf0656630..68f050746d4 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6279,6 +6279,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>       }
>   }
>   
> +static MemOp arm_memop_endian_swap(bool sctlr_b)
> +{
> +    MemOp t = target_big_endian() ? MO_BE : MO_LE;
> +    bool do_swap = bswap_code(sctlr_b);
> +    return t ^ (do_swap * MO_BSWAP);
> +}

This and bswap_code can be vastly simplified.

The complications date to when code access could only be done matching TARGET_BIG_ENDIAN. 
Now, of course, we can directly specify the endianness, so we should.

This should be as simple as "sctlr_b ? MO_BE : MO_LE".

I think there should be no need for CONFIG_USER_ONLY tests.  I'm not sure what's still 
different between user and system modes there.  Unfortunately, testing of BE32 might be 
impossible at this point due to armv4be dropping off support lists.


r~

