Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9373C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhaqv-0004wx-Oa; Thu, 31 Jul 2025 17:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaah-0005yF-61
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:13:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaae-0005CV-TO
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:13:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-23fd3fe0d81so9274025ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753996407; x=1754601207; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uJXW1Eq8Tj+zNzSdOZYt2lyqQhSub7BZreGuAHChbqA=;
 b=H1k7mpuEHR7yZY2k+s9T+0kSVdQ3nSvkzn+ORZnEIQssZBkY5S7tsVeSoQExDe12xq
 6k0NearMYRTcR2qMg1QrAzsbsf3diUEUPuvKqrd+reYuRvfAi/V/KKSPwcpBP8TGY+gC
 9JCttqCM6z9ZTkiNzQ1l8kSpjIOlXAU/u2QcM346JK81jm6hfBTpfQbeNwtfdu5d0s5k
 bQX+mNLlcbsIQZ1jr3enRU22kur6JxqJ9SdnKVRHPDeoaq3iZherUqws1KU/oqBi2VUw
 gKM7BAvxS7R5sZdAfsC+7Zibnf5yWoG8NxfV6K4pmW7QOgxWkQ6oZ0rOE5gAv3d9wwH7
 V8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753996407; x=1754601207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uJXW1Eq8Tj+zNzSdOZYt2lyqQhSub7BZreGuAHChbqA=;
 b=nuBpYk3fJPBpQsGR35iRFHZxa+XNaZ75ACooyMPjTagBk/XRyOS6TMMto7XcfOybCT
 xPfHzCtoo9Wa2qOs5FQgjB4sB/noEb9Txnx9imItUatlpagTIte3GDmhSGHCDAN+6P4C
 ZSkgbmdLvTU82chB9FV+FkrseiCZjmWLSjkiq6GEuZTJowKbEDISeLg9EWjlkML9arWe
 lo6/AL758nbWXiCsHxA2Kyscga+sUIEplkjZ0PZVx0Z7gOH7WULNWdUX8REXXBQvOzHi
 NVGqqU/1ri9O2sCWbTJLugpxN/iuc/1q8huXsKhzrrDwc5mCQZfs0KNhSQSKRZPXFg6j
 zWQQ==
X-Gm-Message-State: AOJu0Yw59pSvrFnNNAZUlNdWaQKirYO2/ewGk/XFUbqToxgIC9sPAERz
 tKnDRmhBAAnwpvbJAPQpnm8PHgnabL+y3W8uHPyEwldgXeKOytO+yCF1ZrCX8XsKeTg=
X-Gm-Gg: ASbGncurpeu7boHzmQgR0rspR2UNeRoQNs6Jt3B3tAOUi/hloHBITlkJNYfjI3hbtVc
 wzhOj04ZEG/i63CRIMwpIsTB/rVSD36HSjpYi5jy0GiNukO0qGuSN9YnZ4hn+76nhJFpygz/CWq
 Xdn4ELphcfoXKh2E2wuuKM1CboBJWOT8Cdo9OBLhHsVxF4M5BmF7Cusbv6/2kxng6J2SUldHC1Z
 +WVMUc73Z/ZjgjAax8hg/rtSPIO+x6I7XqvNsaUKrIKrVueoX41LvPC1q7WE35PtYwETwmAWM6x
 Xzq6UqB16tFmNtognzoCFQbHAo3XyKtULcNzwzYVAuOyvRe8S5rRfTEw47/9/LJnyomOCxlz7bb
 mOmNGyXeo67HiugsSIzOnRZz3HNs3r8hQJY4=
X-Google-Smtp-Source: AGHT+IFDOlYCvxsS5P1o13PSFcDw+Yd6tToodxD+QGIEsTzGYuV5/WcWEz3N5XbdnUtsQwXKsIAP3A==
X-Received: by 2002:a17:902:cec7:b0:240:9006:1523 with SMTP id
 d9443c01a7336-2422a4313c7mr2391905ad.10.1753996406818; 
 Thu, 31 Jul 2025 14:13:26 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67aesm26267915ad.6.2025.07.31.14.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:13:26 -0700 (PDT)
Message-ID: <a41aabcc-039b-4ab9-bfd8-f5571db3fafc@linaro.org>
Date: Thu, 31 Jul 2025 14:13:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/82] target/arm: Implement get_S2prot_indirect
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-18-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Move the stage2 permissions for normal accesses to
> GetPhysAddrResult.s2prot.  Put the stage2 permissions
> for page table walking in CPUTLBEntryFull.prot.
> This allows the permission checks in S1_ptw_translate
> and arm_casq_ptw to see the right permission.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  7 ++++
>   target/arm/ptw.c       | 81 +++++++++++++++++++++++++++++++-----------
>   2 files changed, 68 insertions(+), 20 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


