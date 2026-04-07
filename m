Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAE310F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:30:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYPO-0001fe-OA; Wed, 08 Apr 2026 15:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYNq-0007wL-BQ
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:16:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wADjR-0004Ps-36
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:13:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so3466222f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775596387; x=1776201187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Up7WhY+LCYbcKJ0K74j1UEt8KwkQXoAV2z+yJ8hMwbI=;
 b=KBsFd4IOKGv6EoVhmOMHIB9DAyYbvNZtF0WE9YY6vR3OLHXihFmba1cZHqTHArAwJN
 jk5eLAMzp7iX32/d4M2nUQvqfbWq0eIomb/4iTfEsCd1C+/3Ywtcf5Bcel5zSMnX5kGo
 zfFh9k0vsUQskuwAZteMJwnUoMkVHCFgT0WsRoEsXP8zS0O0/RG977tCHvjvL8jECauE
 uEEje282D4q2a5CbV6NdreuSA55Sa4q34XlDcSXCcUZ/+pB3MewLT9wBMZ7k2T0fckSh
 ZakSS5dKpD/LYk/6mingGjALBW7aBwkA5LHL8k9JNbx+ocB/Tf4iIH8/rZ3UWtgTQq21
 vByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775596387; x=1776201187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Up7WhY+LCYbcKJ0K74j1UEt8KwkQXoAV2z+yJ8hMwbI=;
 b=e5yzhsgi2ZWW1145TOq/rm1wqJWoWRLOu38eqXwSe98Ic6D/sS8J2mTJhYIkTTpTXT
 3kWbFIZnujvwhST+Sqy6u6gAJWJZ7V88+PSMo6hzje6u21uZuUJUOb9xwMahXO9+hZPC
 gNasjkwKqpQ2G1ONpZZD0iqKGyzY2VMS0bQEd2QSMt7hlcnB4CT8rI979sYD2ft1pfPy
 8AxqLBa2AdRLA33ZNLMgQvnMGEtHzGcCk585NKQSV44wvygFLYr3LJNvxdQyXMlDxRSG
 oJD8YZ8iKyPMT7I8LsawN03wXZWOOXF60+eMEbs4FCctq76dVwa5We02orE0WhJJH9qU
 yx/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHiDnmxP1LJj9Oq6ywFIgXm71GEYfuw3/VepJDfnpBimfKYDbzEOUBJymLmGHDDAMLuoZK2Uoi2Q==@nongnu.org
X-Gm-Message-State: AOJu0YzTmGT7JEyxWj9SRx6xEoba+BFWpE8bP0vsT8vhlVj6ahFJ7Tih
 LZyBiWzXV+vOG9GCfjhoZBvoKOdY7KC50Hi989VcAfEks/I2uTrUMAhsC9LZ1jx4VJo=
X-Gm-Gg: AeBDieumyvTvcRxHnCY3inmb+w8hJHqeWP7yWQcORynvwxsNEQJHsjtU/o/k41DEPeC
 BwiP+sIEYksUn9kcNANyZro59tO8UYSuKrOBXxl5c4lXpJ/cNJCrCMhJI1Yq5B1FA1AO3CGf7VV
 oi/b+TVHBnRZPhxH1i9S/5vYL7KNvP+saMEKL5kuORHtp5atHo4mWZ4PUYO0QUE26ar0L1X18rb
 4uxp3OqdtXakCTG0ORr8CqlVSXiFUiqk1qithPywSe8K9wxkIA0t+pv+rQ7I/ZzuvDWE2Vcx8Ao
 AmCZj6VpcW59/oIN3vcfJxhHOp4YGHeWE3EGGOjByOlIGoAoLZXcNotByUhqeVjZDxqDcW3Sqmp
 9fRcTEiCtf+B38QMwJe6Ak2yZXfans+abHiGNvk3fMirAAN6IvXsNWJgWP7Pwl4uHBuf/iJKAK0
 TwwGZkaq+Ht36eKFTwVVJUJWS60KKTy4TOoJWFxT1bYxzMxrUXtXfTYvs9BPsYJMB1bg==
X-Received: by 2002:a05:6000:1447:b0:43c:fd4d:2409 with SMTP id
 ffacd0b85a97d-43d2930fb8bmr28666913f8f.46.1775596387401; 
 Tue, 07 Apr 2026 14:13:07 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f843dsm50916582f8f.37.2026.04.07.14.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:13:06 -0700 (PDT)
Message-ID: <2f06fe63-c594-4d78-9193-22bd780ec7e0@linaro.org>
Date: Tue, 7 Apr 2026 23:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 19/21] target/arm/cpu.c: simplify endianness handling
 in arm_disas_set_info
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-20-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

:~)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

