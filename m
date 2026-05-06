Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF112CD343B
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 13:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKcWI-0003Xl-UT; Wed, 06 May 2026 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcWG-0003Wp-43
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:42:32 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcWD-0000xS-9E
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:42:31 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651c7ddf514so6641951d50.1
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778074948; x=1778679748; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bgf0tKyrU/TaQq+fGJgyiCU13s+/MpaMDLyqMyVzsi4=;
 b=cUYmRPOLvvTw0H5lD+F2tsR7JhOm4v+dlVtnGp9zv9cQmJeUju//V02DNLcQm1qVBm
 /11IrrlarM0B7DNbiuFZAE+1U5qfi+toSxZqmRHTh4RuCixiJ8qFNlqkM/vEw+x0Bwpa
 gsmR9MrT4jGltqCNPFJlwsF9OOCC1rzFkVNfAkraP7W5xk2UHx5moukfVke3fk/5q97X
 +nMzD8Lh17EQMYPyC2tLDu4u7whZ2Xwuc4p25W6pt7GiWXZaBRTEiLQUW+dvqCWVRyrF
 nv/IBj3tQ5nHrJPrgqCBlXVoDplH1tWeuGb0Ekq0oZfvBEj7a5LJbOTkgBXqo3Dg1Et+
 xW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778074948; x=1778679748;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgf0tKyrU/TaQq+fGJgyiCU13s+/MpaMDLyqMyVzsi4=;
 b=c6AKANljSkVWmGBi7SExzhqPCxSpRuKmpDle0prVAB8HtzG0u6CVCIbef+ZfopUqQU
 eiVO68zRD4JxkYs5yTtiBUvCu1tdRIki+cQ9l2ZZVuqpzQ7yj4jFT0OgWSNJj7zNNU4W
 3BK1uHIJeXtFXttUkDjbfLyQ6Ykeu7NNnZG1Q1Tw26mFXJ/u+docqcGVQ+VO5sAMwjGM
 3APQ3OKj+kAV/s8mDmxMlS0ExiYP9E1E3udAR7D8fVfTTjCmcdE6OU+xKnvS3ddzuDoL
 lbLpYSBSeiSmXjlZS/UBhcAr2ZctWJv0ELpCG5HxFk39S/UdEjkZ/g49GxjLhWYSzKDD
 zvhw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pS+rZoxkITyY6tZ6dRsUs4w/hQeAGnZJpwCr+mYlludXBCECNIKej5G8sbxzj8TFnf4CmdsCn8w==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Bh8W7JktnVRcIG8lyOZVtgIQuJl/mTrs0OtSwPm8l7OMntK1
 HZ0QKtJUtdOU5Akir1kQvpxDenkRBaBe+eDjC56ilIGw+Y4dPkSxZGgK9nBddRojXIQ=
X-Gm-Gg: AeBDieuh2KD99m72tWKBqFkWyMfpdSNmctrtSoaM+nMNhZoi5I4FEpkV8VXh5D8mkO6
 Zbt9W0PgZhijxGdEkz4cUkGwTl20lOFZXDM4QUrg9gyQgQk9sK0xwTk+dRKIEccPiA1QjgsQDMW
 EbC91/LddWPtwQ9g8Rxs9/F4MSHZQvvCuSiBrrHdqhTxpXFkXteZpYhshjoUqWt5i7/8qRmscyJ
 n/Hj8M4OBCrcGPmdmn5woU40GQA+jQ4WFHlI2Bn/wLdK9ONg0DNyfE4/Kjo06YYthLTTN9eU72j
 zdwsnwPB1gq05x0Jx6XIwfQBHFJcCnM/hM20OHkzGsweZeeB0xx/lYjSPqQY+DzOG4rG1nCszB8
 LFIxXEqAfrh9w15grg1ngW0imO39EFxIsQ7YKPxMT2OBCWImUKuVtV/mc97haJBjj1M6/2pH4Iq
 TaRp/356+jHbJJHuhlUNJzgnlNPfb0DF3yG958vBWqAPgHnFDz8bLKCJSOzEz6V6B3KFS7qrzt5
 VGgk9n/dcdu+dFqJJ6D
X-Received: by 2002:a05:690e:1403:b0:650:a6d:d6bf with SMTP id
 956f58d0204a3-65c79ee4068mr3545342d50.51.1778074947754; 
 Wed, 06 May 2026 06:42:27 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-65c7aff6d80sm1017280d50.18.2026.05.06.06.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:42:27 -0700 (PDT)
Message-ID: <93406cbe-cd86-481c-8357-5178d46e7340@linaro.org>
Date: Wed, 6 May 2026 08:42:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] target/arm: add MTX to MTEDESC and DisasContext
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-6-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-6-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=richard.henderson@linaro.org; helo=mail-yx1-xb133.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> index e753124c4c..40a934a8af 100644
> --- a/target/arm/tcg/hflags.c
> +++ b/target/arm/tcg/hflags.c
> @@ -460,6 +460,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>           }
>           /* Cache TCMA as well as TBI. */
>           DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
> +        /* Cache MTX. */
> +        if (cpu_isar_feature(aa64_mte_mtx, env_archcpu(env))) {
> +            DP_TBFLAG_A64(flags, MTX, mtx);
> +        }
>       }

Actually, in the previous patch, where you compute mtx, is where you should have the 
feature test.  If the feature is unset, then mtx == 0 throughout the rest of the function 
and the store here.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

