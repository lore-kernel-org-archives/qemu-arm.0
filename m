Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D8C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 23:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhci4-0000Kw-5x; Thu, 31 Jul 2025 19:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhci2-0000I7-7s
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:29:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhchz-00011O-La
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:29:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76858e9e48aso882817b3a.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 16:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004547; x=1754609347; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sdjEZ9slcM++BFYLU7laFQNr4veY1GlPSOXXS/wGY0E=;
 b=rTn6QggycWFDOCe6SXfypPg3PQBEAPbenJgU9AGoatFvrOovqvEFuO6Ln7IXP1Cohm
 9ilMlIDb92FDbzSYTuSa+TrFCyiRyYsM7RVvYUosE6hIQgFPNc8CTzfnq/TvZe7DkQ/R
 q9L+hV9eanuDOeJ+D6r8jmb0IGbARI76x8JNKTjfuO34rJAdpdX205JWH9h2Q9sQ9CVc
 A5nIVrRCH92PM6k2jUu8FSpnPj4iXBqAhFC0o9WY1jC8y7myrxQzU6Y9zQg3450bu5a4
 7g/kFLOIdENLE3ou06zqQHslUuK+6hrt9ZvZlQC6LAU/bKq99IGXaAqKavf2QuWsC2jW
 qa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004547; x=1754609347;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sdjEZ9slcM++BFYLU7laFQNr4veY1GlPSOXXS/wGY0E=;
 b=b5SiiJOj80dRsqsgCBtV+EVh/V2WjVkQq2VtbfLtZsr749h5YdMLhDKSOilMnL6wqh
 bH84K824aztf0uTLdpl9m4KhKrzsqSfPAiA7ssEsBRgFwn8vTEjJX4kdUiIaMK2wkNaO
 D4lsghk9l9pOGN3ntDygSpVtRx+PYVp9h6YXhcg1QhJn1LqMWw+qWxT8bngk7ymQ7Iiv
 sjcDmP0n6i8THLOIIi2tRvkaOb4lOWwj/NEeOES281m67yMpxnu0sjnNh0kmdxxiPmh4
 HXUjuAw8479+bRKTUP24xd/84ZxRNSYLhsDfxXNl0YR86MBpELA1BQgOoTZ/t5Triduc
 uSfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqh6pEW6f8Ht/ti/S8NaLHRGqwTEXK40Jf7Czw2L+MRQwZHwNxwRTJ8g2jDG8BBztQl+HkDqF0OA==@nongnu.org
X-Gm-Message-State: AOJu0YyHJGlm2AlMWfDJSpuWzYuIAkRKJnlOYiBv1Fm6Hm8hFTc5+sHK
 a6yyIB1FbjUaFcHiQJbF97r+HJa0Vxy5fCjEItSawMLvDwzhl3sYC7w5UlN0q82s/pg=
X-Gm-Gg: ASbGncsTJSLSftkX3xX+Zy6vr7I8CvCb4fv0WCiv2vj4lkEfbCaj7X41oKLZoq0aBtI
 3kerrIdIoDmzy4+QREiZekBiosadNZGIeVy84KU7L+FW7UMprAt/i0FDjZOOV5dzshX1SFhCHl+
 7mkYd+KM3hb7OoiREsEgXGKIW18fyCoh3dm1nwYajEduf8rh5+K7AO4rH/e/P+7DiviyWFU/a3y
 pGEiPPozKWs5WjUxMOzIY0PJLAmJaW91wdVLEgSiZWE7HSNjzVsSt3ILmODBlph56IatmzZZ90/
 c1oNRIOaO3Vc31WjNoyigX5vSR+AohPQZMwz1vuJ1Sx4Bf3L0MiER6NNK3V1tzmfjztZ1cOJKJo
 ZibdOt8kCzX1PBOexGXJDCXFQmHoxoV7NJCoJhbyL
X-Google-Smtp-Source: AGHT+IEEZzSacknaXTABZ2KItV7zNzAyBJqlSB4WNUVdwwOQyM7U+gp13B3JO9jS3722wCGDy8+erw==
X-Received: by 2002:a05:6a00:2e0e:b0:749:4fd7:3513 with SMTP id
 d2e1a72fcca58-76ab3096e9dmr11415310b3a.16.1754004547347; 
 Thu, 31 Jul 2025 16:29:07 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f30bsm2597471b3a.16.2025.07.31.16.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:29:06 -0700 (PDT)
Message-ID: <17ca7cee-4aec-41ca-a653-ccf6383f3c04@linaro.org>
Date: Fri, 1 Aug 2025 09:28:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-7-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> No semantic change.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 5a04ce55ca9..e5a665d604b 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -787,7 +787,7 @@ void do_common_semihosting(CPUState *cs)
>   
>       case TARGET_SYS_ELAPSED:
>           elapsed = get_clock() - clock_start;
> -        if (sizeof(target_ulong) == 8) {
> +        if (is_64bit_semihosting(env)) {
>               if (SET_ARG(0, elapsed)) {
>                   goto do_fault;
>               }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

