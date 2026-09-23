Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1763C98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:53:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Ty6-0008H0-Ci; Wed, 23 Sep 2026 16:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Ty3-0008F6-GP
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:53:27 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Ty1-0006vJ-R7
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:53:27 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2db22383fe8so6565145ad.2
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196804; x=1790801604; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CHy1VLFHOQRUzgi9M34jWG7yjVB5sBh8F33ParmNj8w=;
 b=AxRGv6PXF6XGcmp6T+tq+0pRIs8ob12/ADaOgVMrtYpz6KmRYofamHZ1EmiiPlTeKZ
 A7N8o61iaVcgN39+6bfsn8FWhnptEB/NT2cSU2lhXZ95uwWYRybh0ecFoIWtZaE37q6Q
 KQsL8g3Nccfl+CfCdLfbzZgnH/wftlUJoZDSMFAEm1LYzq8fjDHjWfqUOniGZsKyZwiQ
 qY3AluBAblCf6Gb3KJ3Opcm09d7jMeYw7PXIXjVvsXJaEAV+gHdhix/CU4GQSxICMI3z
 qn3NKAR1W9avy34Ez4/bhKygV8ct7z9pL3LFCjq2yJlrFkkmPZXR1raE9OpGmoHGAuDg
 DYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196804; x=1790801604;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CHy1VLFHOQRUzgi9M34jWG7yjVB5sBh8F33ParmNj8w=;
 b=U5buC4NICDzOBVeLaDvp1qiFwa3K11Sf0Ea+nnJqmFvkBVlaznBHPJlra5Qpy8bNJ/
 Fry+4xBf5at6ZaAL3Opn/aGk+fW730TwjBa7z0j+eLiywKJzyGQ4glD/DozWU8gqyRPf
 rUT9Pldsuztr27AfHJ6PeF59EdANy0KLvoGYn0q9Ez28IZXC1X29qztobU+bGgaRkxu7
 7rK5PCEvK6QGGlybOcQrLwxnQXs0r/lDRdg7tz3MzL8ZOhYvuTg/wwxQNGquUPWV61fP
 XrwZOu5eUteiz+dP51sEOYZw7jT2/H5xypASiQQc1221mIxplGJDjX6nbPkOt/ZLHob2
 3A2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZlqUBQ5LMBWfiGQah/JjVbQ8wFIdhLaUChBn64UGkxf+HBojUlMQU6rXpFqlVbRk5zIGDnpWyZA==@nongnu.org
X-Gm-Message-State: AFuF++kO6zJmLRpbKtm+5StxTohVGFS8MO2fEPe3hH4spNeDpShDWrQl
 niCr+y29oMDtEMVWnfj4bShue4UAElaxzF8O2F1ItUigkNGSVt2VNvOaufE4XQpxbS0=
X-Gm-Gg: AYBFou2cLwJ4fmPZocUTklIvQao4YM/37Sleu9CY048PM0ufzw9KzqG2YeojFKzSFAg
 g3AMkJYnacFjtwItMxUbPhekUp4ts+qX+Bp45yvLhnrIoRn++S7cYcEnP3XuHcvThzxx18Nd8fA
 8pw/0FJipqalSR66A96H9V6MICphSMWaLyNqul9upXewZE1VS75ihP02BomeU4fv9CQQp/McPfg
 ZdVboj0PjpwxHLqd4RwazWpR82C7JwYPpDPmh5oC7haZ6eIWtLawwE4SQnFanq9WN1RcQqFZTA4
 x0CINkX6Vl127MGcjTa/IhZdeSpGaGNLFWX4kIDhG2B2MUb5LWMhI6EWLHpuB/Tim6s8DufPS0i
 1xTW0iQwnuCm4FxWYQg3VhSJkhEd1EsdRoCQG1JYZA/l668691GXGXVVSIJ1K2htZmAQiePNsnO
 CfjQZiDzcKIpwNhv56A9v9vLWlFf9TspbcVAPXAnkNO+MB3fky1wGtoI62lgKWTlJt3aqYawsL5
 J6IoRSPWVO1tHaDnnwE7qr7wYgC0pk133KI1yjA
X-Received: by 2002:a17:902:c40e:b0:2dd:c0ff:e72e with SMTP id
 d9443c01a7336-2df7e0069ecmr2072105ad.64.1790196803818; 
 Wed, 23 Sep 2026 13:53:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5c7d82sm16422855ad.46.2026.09.23.13.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:53:23 -0700 (PDT)
Message-ID: <4ca64731-2491-410c-b746-72f928630742@linaro.org>
Date: Wed, 23 Sep 2026 13:53:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: Drop uses of reset_ignore for banked
 AArch32 registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/7/26 06:02, Peter Maydell wrote:
> Some banked AArch32 cpregs set up a resetfn of arm_cp_reset_ignore.
> This is presumably in an expectation that some other AArch64
> register will handle resetting the underlying state. However
> this isn't true for some of them:
> 
>   * TPIDRURO's S bank is in cp15.tpidruro_s and this isn't shared
>     with any AArch64 register
>   * TPIDRURW's S bank similarly is in cp15.tpidrurw_s, not shared
>     with any AArch64 register
> 
> Remove the use of arm_cp_reset_ignore here; this means that the state
> for the NS versions of these registers will be reset twice, but that
> is fine because it will always be to the same value (and the
> cp_reg_check_reset() code will assert if we introduce a bug where the
> AArch64 and AArch32 regs disagree about the reset value).
> 
> For the MAIR0 and MAIR1 banked registers, doing nothing on reset is
> OK because they are backed by state that is always covered by the
> MAIR_EL1 and MAIR_EL3 AArch64 registers that will always be present
> if the AArch32 registers are.  But it's not consistent with how we
> handle all the other banked regs, so drop it here too.  Again, the
> cp_reg_check_reset() checks will catch any mismatches in what the
> reset value should be.
> 
> The lack of reset-to-zero for the S banked versions of TPIDRURO and
> TPIDRURW is very unlikely to have had any guest visible consquences,
> because these registers are architecturally UNKNOWN at reset and so
> guest code should be initializing them itself regardless.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

