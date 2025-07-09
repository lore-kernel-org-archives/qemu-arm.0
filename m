Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F86C83F0A
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 20:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZbSM-0000yJ-SI; Wed, 09 Jul 2025 16:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZbRg-0000NX-2e
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 16:31:12 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZbRe-0008Pt-D3
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 16:31:11 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2da3c572a0bso262400fac.3
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752093069; x=1752697869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rzavvfaVQGb9jqhok54sG5RRyj6EcxYrQTocJX4ceSM=;
 b=g2s9TNFcZKae5cHvWEkjoQexx4B0+wJbKWfA+RisFFpaNXvpVXOVP2gAx7IYQTFnGt
 nYC477OvrmTAp6z2MSMmy8lxoZEwnS9xqq2AWs8Ueo/bvD/doFtSPvjiaRgATjJjjItq
 XBwAL5xZTTtRlcuVgYDhPLsSDwEUxb8TAQdo+WMricIXOB1vgWtIQEZOqtX+mbOk52HS
 3qRhsCi/INte34pUWG1qyAZBRgx1xBDI5dama8gSuNlAOEW/APNLOKfjy3cr/k0TNMka
 CA6OAfMPpFQ0IeW0vBWJkvm6eNAos7CIp8fd8R/lchvbMEJBT1VwJarGSFY1KLOxoi16
 0OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752093069; x=1752697869;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rzavvfaVQGb9jqhok54sG5RRyj6EcxYrQTocJX4ceSM=;
 b=o4mfVNxAvBG4n6Ip/1H/Xgs4C0RCAVnuO+UeAb6CgOO5Q1bxyenZabSGxYB7IQ1w9e
 z3yCBeaan1RPTG4p94BCMdQBZSz4/5/qNCWE08VQfykxMpkIqW0sESUfwxX6nrMkkp53
 6gCpx//dP91gj65F+hCAgq50Vs/CBq5AVkLiXgAVTs5ZFzalPZKwRS8hoTsg7VmWs5+R
 305ZbAuXE/o36FH3KNtldSFhqg+bUJE7tWUWYa/voUvls5KYkbJKF/NX2CyFUkaKaJ6F
 3dsmEjMMoHJRpCxghWulVZdKdP3J9kKXNCADGh08lmALL3+0Kei9Lw+JqbMvZmCiMp+U
 3E0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS2lP73X5tKKaUrk5YSgcFFxuMdJL8zugRpT/oe2JslvRgtnk54GbVAOvm9bO+VPE8IE1veyYYHg==@nongnu.org
X-Gm-Message-State: AOJu0Yy6GUpv8qpIJOGASDZwbouKn7+2ymV/5zOLkFfFoBRi1jRy9mBr
 zwtTbQlNaNeuw2CbpmXzLRQcSO3SuPrZ59VhUJtBZWjSzVMia2gCil87aZt8SUwMWes=
X-Gm-Gg: ASbGnctF6+FX3k9cyWZnHOE9d3hvav2EOwRrAYhtN/EOQjlbqv44NAnW9tslYA7pjoF
 FNV9ZllN0Jek7WVm39wdLSpdl9juh+02UPey1wkx5x+gPLlfZ0Ic4uw9EOBcQmxaE1G0HOCeA1z
 2yAzGEcRw7zcUZp3kQ5qvWgBdtNY2bGk5pI+Erjpl0qJkZfWx24XI3kDMsDTEnH8SQ+3nzhgiT9
 YoBQHqtE+YYhgQ7MElTSQCS+Sg2qVrvXw4TdjAtj8wU3h6Y4Rkd+UyuO5xHOoWd9JKm+3y0mTHq
 9+lJd1oaLfTM+qggK8v06fTRBymw0GFm1SnBbq+LJsiaJ73CaY52eo0KwUoYQGoYgrtoqOVDJM2
 dpaM=
X-Google-Smtp-Source: AGHT+IGadVhhjFnNmggwywXQzF3OSv/OIWsl7VjQXYSVntI+ztmrFVEeLpxRP1YwuTVznj4Wd4CBzw==
X-Received: by 2002:a05:6870:e24b:b0:2d5:d5c:a851 with SMTP id
 586e51a60fabf-2fef848f00emr2789304fac.6.1752093069089; 
 Wed, 09 Jul 2025 13:31:09 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f7901a35cesm3667267fac.32.2025.07.09.13.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 13:31:08 -0700 (PDT)
Message-ID: <463a3082-aa22-4298-a5e9-f54e6848b1f5@linaro.org>
Date: Wed, 9 Jul 2025 14:31:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] target/arm: Add FEAT_SCTLR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250709180326.1079826-1-gustavo.romero@linaro.org>
 <20250709180326.1079826-4-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250709180326.1079826-4-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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

On 7/9/25 12:03, Gustavo Romero wrote:
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 552d8757b7..44d6b655a9 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -416,6 +416,11 @@ static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
>       return FIELD_EX64_IDREG(id, ID_AA64ISAR0, RDM) != 0;
>   }
>   
> +static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, SCTLRX) != 0;
> +}

Should be sorted just below the ID_AA64MMFR2 tests.

r~

