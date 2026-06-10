Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A344CD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 21:34:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXQYE-0003W3-Me; Wed, 10 Jun 2026 17:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXQY8-0003VT-MQ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:33:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXQY5-0002bq-HG
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:33:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2bf22d29dabso48585045ad.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781127199; x=1781731999; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VbqsXvGw3ygt3HBfsQWgFkBivVvb3LCoMLUpfPoOBPI=;
 b=eCt8cNNGEJAAt2oBROyybdTXjl4kwyDOlJSqvu4UIjW3T4mgiQxVqFn1IbVYp52Opd
 SfcvRwp+G7KjtPoWaPrmqgtVYpCzf5Rtm97n3P2J3TQ8wcgunxueufppRw/ZZM57yRel
 OW8SwRVN6yTM8X/dxLDda6bO7gIjGKj5hcz0Q/+Dd/SOLj07eTzKES9vT0a+JlSLrBY4
 Ns2H4k9rbBL0/Qs+gCKFmaFqF1NT6wL0RiOptddSpzBfVmNll5272juLwAgF8c+xKekf
 3+utwmO9RktEUBDCT2UmbFgx7T35f2WSUl7vIhFNCaurgzXZjBLckxcMqs5Jrw8N3yOW
 +x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781127199; x=1781731999;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VbqsXvGw3ygt3HBfsQWgFkBivVvb3LCoMLUpfPoOBPI=;
 b=PxFSlCMNUxKl/HYF6CBBuSdSoLDsVnr7UpEKN+LpMQEHIFRCJFdTejt8BlSn5ldtoJ
 cQjTxxDUyQwqVl0t+fwoGQloWpj+WES8uL7RtVJzZFpfO9NUAP9F+lzezaylTxboSno+
 kaqU0X08uEJ0Bl3Qb2Zf7kO/+HDpgnZKa53NrOa2gmzvk4LUPrHRX+evYtIrvi2zIfeg
 C/RojeT9a8G3+8yGGF/XrRptwowko3VmNC0b8ZxYAwsHZTZZP7aSX+MZtZD7xwrTAxTB
 vTPUh8ZzP3sC62bMccOfUL1tADSz/LCs7VStcPuKwHjz6NqF3CJgacj7xhtG2oB5W0yn
 k4gg==
X-Gm-Message-State: AOJu0Yy+UsbY+zurjy/TzmqTYlSXQ65M7xMqTppeB+0Amt7GMigC2OD3
 hzfy4ZwoM/c+1N8gCPGgc3r+QJ3WGiPserL3OAyGJO8C2vcuHkeYJqkJV74HYCVrVPY=
X-Gm-Gg: Acq92OGTcWXWVJ6jChJvms0RlYfKFI68MHQyBXh5zgamYwaTgYkdUuucqOJXJTLe/P5
 7jqRwIIXUtzm4IPKmyf91glAutUNcl+MEpu4y2/8QQLgu/+6k66CVm2ssSBxgbjbEGA8r3FNSrq
 H3HO/pvPy/dooBdYEKCkiU37Ym+wvy2KMzeATCaZRx9ldaUgm8zt6ijMGdIrK5GXpVriRegqGiq
 T0z/y9mZKadHCyJyEZ/y/Ylr8CcsVjfOMZ96rT9W/VtDY+mOh3lcTTugglgQoFUcsyJ6HsnkAw0
 bRl+x8DU3DAJkm8y5vuYa6URY+zwxt7hGp+VC2CD1r54gclU0rP9/T+c1FJoZTVmpmR2BpJ+qWS
 JePhE8g2Rjx0Uyekka8GcnWlhuLLsCXq+1wlHNjoaM4wXZ4CN/MwVu3PFOcetOgJUaMFqtHojWB
 uQ7XW/JSna9MapOJZTArfuPZXI9PLGM88JoVGV582GpJ/WJ0/ctP5iJfmgcg==
X-Received: by 2002:a17:902:c40e:b0:2c1:e9f8:758d with SMTP id
 d9443c01a7336-2c2a1c65e95mr113500655ad.22.1781127199547; 
 Wed, 10 Jun 2026 14:33:19 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f6d2bbsm272273095ad.1.2026.06.10.14.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 14:33:19 -0700 (PDT)
Message-ID: <27ef2bdc-0502-4920-b3ef-168f4db82fef@linaro.org>
Date: Wed, 10 Jun 2026 14:33:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] target/arm: gate check on scr_el3 behind
 ARM_FEATURE_EL3 check
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260610204322.828645-1-alex.bennee@linaro.org>
 <20260610204322.828645-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260610204322.828645-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 6/10/26 13:43, Alex Bennée wrote:
> We shouldn't be reading SCR_EL3 unless ARM_FEATURE_EL3 is enabled for
> this system. If it is not there cannot be any offset so just return 0.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 22f5117ee54..8946d2aad28 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1413,6 +1413,10 @@ void gt_rme_post_el_change(ARMCPU *cpu, void *ignored)
>   
>   static uint64_t gt_phys_raw_cnt_offset(CPUARMState *env)
>   {
> +    if (!arm_feature(env, ARM_FEATURE_EL3)) {
> +        return 0;
> +    }
> +
>       if ((env->cp15.scr_el3 & SCR_ECVEN) &&
>           FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV) &&
>           arm_is_el2_enabled(env) &&

No, like this:

     if ((!arm_feature(env, ARM_FEATURE_EL3) || (env->cp15.scr_el3 & SCR_ECVEN))
         && FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV)
         && arm_is_el2_enabled(env)
         ...


r~

