Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB70CD98C6
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 16:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXM0T-0001Op-D4; Wed, 10 Jun 2026 12:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXM0P-0001Mh-4l
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:42:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXM0N-0007yt-DQ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:42:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84232e83ca9so3000410b3a.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781109734; x=1781714534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbEEwP0H4mkK+bO7Hn14Bf2KezuYMDkvzmrq8BHtmWw=;
 b=FPgbuiCpjsBedcQdFl0k0ps3ARNt7gprX1C8guj5I7pV/GLPg27LAf90bFCseAEp2m
 v0GP3yp05je60B/Sx2Uauq/+8XlB/1OnUwwvayh/kr51cEurcShZ4WOMCiUHWONt/PTW
 qfa7gxf4b0Erh3wF31XIujKxVd0mTd+mSorUQGBES4lrme49vW7UelEehX9/is5PCt1i
 5gVtdX3RPtEaHDgicbNw+sBjc295+DukL19hZxHjMo3fSuwCDRJIqLNG3HcUYqjjN5+e
 gWIxa2fgOfL1zKyG4dtUutpMrlQa5UZykB8HIcHHKPia514b40J3Kh6Va0cxif6+dvs/
 FTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781109734; x=1781714534;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbEEwP0H4mkK+bO7Hn14Bf2KezuYMDkvzmrq8BHtmWw=;
 b=GV6p9HZ/KQ7mv9snu4E/BwcBcfiHnePFaCeg1i1NyS1e8hhzUhk2sv9NVCj0oNailh
 pjZ3PbfD2If7bv3p7lPt2DnQnH5+oDVFe4SvuKzHrrohWIbXZXQpReL2ZEuV+NZeuokG
 tPBRhf9ELZ9YlFXqPH4oEEVfPq7FtqrbZ96vGc9qXNCMTZiF67wU3sti8k/4Fhh32UHh
 1urD2f25dSk2Wx2KeiGU8ASARJj8TgsbFisdBupONTDVRRa82kMiK7W11rs7u1wTON53
 ZcsoRDCUFi7AMmqLgbk/Er8P/K9hC9yxE7dNyMPeln7UvG2hFdNSVlRcWl1HKZ3mlC38
 qUBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/n8zZ/f2hZ3FgfvVCuEPU3BRVS+RmLen2S7l12s/Mb+jYGS6BZ1CRsdn5/y38FYCoEttYMe8AhMg==@nongnu.org
X-Gm-Message-State: AOJu0YzZfhfGal3qhkRqGVO8Ov1ibnIEcGHK6oFY9B0+2fQ8EVcYQ/p7
 OoTa6nBQQFbj1RYz/R8IxSrCPV4vugKMnf8og/3+ZAGHXrKRLMrz9337WOnLj3M6rDJYjQB5K+p
 nNmXrBBU=
X-Gm-Gg: Acq92OGMw+CkvjnPaCO09H/3P7p700/k+Zo8I31Vbi/IctP+XwAVshVTI6FnCcBNLq2
 X3CVmZDPsBolZyEgFeOmMv+cwWx/lliNi0Eho3cGUA8z++Nuwqy8oqdzLcCQJOCAnnVC3MS8YVT
 5WOn9/NHo39a4lH4i3IZPFlP0985OJ3CcfgNy7Vr2utGAxgrcLLDCEAJrYFQZxjGn0bUNrCqqBH
 Aw3DXc9w4Qo1TjlFYk8dYWBS7Y3u8t/zr1ekCB1vg+H0DXG1/5p5jQCLi8bi3xcrIWGJJn6zywh
 4tvlgWY3+LlDgYWVw+6EUvJ+Ye9HgWIqACdrRd614J5euBYzxFqHtikCTCAjzl8JBURGXQecTlB
 li+Hp8NoCVZArRDMSKMSAGfy5CQwr3pNxKZGEfS9Gwa398ltxBf5wZRB8xHsBnVcNGUpju1LWFN
 R/oowM4KhPzjywBKhRqBr/8VbF2vaB+U689fQTP/przapBMaI=
X-Received: by 2002:a05:6a00:a96:b0:82a:7893:e14b with SMTP id
 d2e1a72fcca58-84330bbf05dmr12177b3a.38.1781109733907; 
 Wed, 10 Jun 2026 09:42:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428221c3e4sm26042061b3a.5.2026.06.10.09.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 09:42:13 -0700 (PDT)
Message-ID: <0b1d2d05-bb83-4ee6-8a0a-cf831de4c54d@linaro.org>
Date: Wed, 10 Jun 2026 09:42:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] target/arm/cpu-features.h: x-rme now means GPC3
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
 <20260603-jmac-gpc3b-v2-4-115c51936962@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260603-jmac-gpc3b-v2-4-115c51936962@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 6/3/26 11:26, Jim MacArthur wrote:
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 1a4f50486d..2d87cc5668 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -159,8 +159,8 @@ static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
>   
> -    /* Enable FEAT_RME_GPC2 */
> -    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 2 : 0);
> +    /* Enable FEAT_RME_GPC3 */
> +    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 3 : 0);
>   }
>   
>   static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

