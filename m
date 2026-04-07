Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FD5FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABXT-0000E2-DA; Tue, 07 Apr 2026 14:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wABUB-0002o3-PZ
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 14:49:15 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wA0NP-00027n-Mb
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 02:57:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-35d90833cacso2749922a91.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775545050; x=1776149850; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HoxtkziDSsDEBcMEdXayqBcHErSHKUlZdvFRHjsNyzs=;
 b=VJFnPxZV2P/XV5pr7zY6KiUmo1Tu2yHlac5CaNkZnENDzjrM7sonZc5uvNisZSaL3/
 tbfGYd56ILexKRPqzhbZPpxV4jV0CQBazCAq9fQhjnd+Sn2oUPgyfZWwD/lgUVxoRg5e
 g5xZ6XZEn9pnossxuj8/9e5oTImn8XeuLn+D+Ew6MfJJ39a4s3wk2iYxlxuc8n+KXZa9
 wu/7/lB4WgNBjSWdHA02KozVoJm9ZCz9H/ZIp+B+pBGaBdIGbu7z+d3zTNakgj1o3oQo
 8DN9qjaypR3MKPeR0XwoaDaGMpmC2gr672UDGWe+jcJlScFnipVkeSi5+m721TrYbRN+
 Q9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775545050; x=1776149850;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HoxtkziDSsDEBcMEdXayqBcHErSHKUlZdvFRHjsNyzs=;
 b=ihaTY8L7vdaQQAWyzBiEDS/MbT6h1kIT02HzhfNJxJq+joyqH2CnVMSyO/CQ/KKbg/
 XXCxZFJO8pzZlPNvBBoJ6WxHoMLtJ0N0ey3/FnCnBilGUDMVbG3UeYxTV8cLyEqzb/eu
 +RMnJIR47+DCh0WCe5kVGuTPXGbONuGdufnSeejKcA3JtcV2fC190ko7Td4bKVwx2PMd
 UECMvpKmO2chZsvTIZ1yEVrhZGrZ6VJMIeJ7tqP95Sga/rgqfXAZqRKp/PH2Uacs01nf
 TlQKTIzBsyE7ZU6C1GGVhNJ3WUtz3MrdCpzWV9GrZ/n8MeLINnij31wRUcm2e7KKS6fl
 fAYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDCypdmQIWdqXz7uAGuJP7mOHqfe6RU176FHI5h5+zY/BKyXpMOxghIvCq1VH+sBUB7Kl0wF5WOg==@nongnu.org
X-Gm-Message-State: AOJu0Ywnj6keqRqJXrrKXH1bkqP/GGxf4a5uDMjCdE9mJoI1Ah/t12IQ
 D6NvB3Puv+mLtaaoseBWhiqBnSN2f84X0t6rKDLnHMYEGQok4hXrWvUAWq3q9QfYlD4=
X-Gm-Gg: AeBDieueD5BNtsYQepBU5K2qm/SRuyu3x7ICpunD8BxAvrCJfFV/7jE7i1JNTKPirIT
 9oPsZ513FT2hvP03BMzu55hc50T024E9t/lKTW2h4l7sE/fVvCh4NntgRKSRI2eoStLSXW0wzTF
 fWnerwlu6ec7TaW4occ18L94ZDsJikU3jwbjLjNGLarZ2wEQEyFt9cW37F9JwVlutlWyZGS37/K
 khnp//nxuxiJLDklxwHnvlFFD1s2oXJBmKYWOTzrCzHKW459dLW+8n13v03bGVaRF82VNZYTkVP
 wF6i8UufHRbtoplN3fobFxW/yONy84z2gu4D5K5Eg+EIiFNjEEliVfmT913IkEZUN/7xybV0Qb2
 SuKXa3aN5AJMZH637XlY/oCwsvchg5vs9QBNguvhNu7OB45O65tL86+41MAygkqYXwsSQRdsfqF
 y9c+8wZXPVXxVohazx+mtkKoKFP2cS+zTF4OdmoT6C+nU/1vWqtxvxI6ScejqR3/DfwfY=
X-Received: by 2002:a17:902:da83:b0:2b2:5314:e96a with SMTP id
 d9443c01a7336-2b2818de2c2mr161053525ad.34.1775545049741; 
 Mon, 06 Apr 2026 23:57:29 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749cada2sm156529995ad.71.2026.04.06.23.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:57:29 -0700 (PDT)
Message-ID: <38b693f3-621a-4af9-8d46-7f8976d60037@linaro.org>
Date: Tue, 7 Apr 2026 16:57:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/20] tcg/translator: add parameter to translator_loop
 for current addr type
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-15-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260407022748.57629-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/7/26 12:27, Pierrick Bouvier wrote:
> With TCG_ADDRESS_BITS mechanism, it's now possible to specify which
> variant every source file is written for. Compared to before, it means
> that addr_type will now vary per tb translation, where it was constant
> for a given target previously.
> 
> Thus, we add new a parameter to translator_loop().
> This will allow us to convert targets one by one.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/translator.h        | 4 +++-
>   accel/tcg/translate-all.c        | 1 -
>   accel/tcg/translator.c           | 4 +++-
>   target/alpha/translate.c         | 3 ++-
>   target/arm/tcg/translate-a64.c   | 3 ++-
>   target/arm/tcg/translate.c       | 2 +-
>   target/avr/translate.c           | 3 ++-
>   target/hexagon/translate.c       | 3 ++-
>   target/hppa/translate.c          | 3 ++-
>   target/i386/tcg/translate.c      | 3 ++-
>   target/loongarch/tcg/translate.c | 3 ++-
>   target/m68k/translate.c          | 3 ++-
>   target/microblaze/translate.c    | 3 ++-
>   target/mips/tcg/translate.c      | 3 ++-
>   target/or1k/translate.c          | 3 ++-
>   target/ppc/translate.c           | 3 ++-
>   target/riscv/translate.c         | 3 ++-
>   target/rx/translate.c            | 3 ++-
>   target/s390x/tcg/translate.c     | 3 ++-
>   target/sh4/translate.c           | 3 ++-
>   target/sparc/translate.c         | 3 ++-
>   target/tricore/translate.c       | 3 ++-
>   target/xtensa/translate.c        | 3 ++-
>   23 files changed, 45 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

