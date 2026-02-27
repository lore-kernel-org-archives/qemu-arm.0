Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DCDFD9E26
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 00:55:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvm8Y-0000qH-Cq; Thu, 26 Feb 2026 19:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vvm8X-0000pv-1f
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 19:55:21 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vvm8V-0004rY-ET
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 19:55:20 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-82746ed8cb1so505707b3a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 16:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772153717; x=1772758517; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6k8lxjhfwtbrlz/Id6T7YRNU3IZwy1XnayAk/Z5iVk=;
 b=KhlH4qd0Vmf95xYVrL+6yN5ewzkJPmgLJcH4pmBgwyDIx3N4dEININgtbFcsMr7+Ak
 H7POWohjMQJ2HxVW7dRrmmIl2jnB03n1IgjCF1BHA3CDxN5PEq+JyJiW3VN8739zX0WT
 rpE6S9phwVudpsl0xqymHnaiVC+NriMWwmu9FUGqCnq7iYBXWxd9yG8PZyw0snthFDxg
 fcI/63hMKvLxb46LNOostmItfANxHpp4JG1ET+FKyYpJvfU53B4OAT1geyuewoLmemmm
 pjH0FSPQByBKDV+AuPYXVda1DjeAP8DUHdd6TXzocZDrPFWot6zlj86IjJFvHMKVtLNU
 FBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772153717; x=1772758517;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6k8lxjhfwtbrlz/Id6T7YRNU3IZwy1XnayAk/Z5iVk=;
 b=bvniOkV854eMO6qo/oUHWPY5nC4FE1pAFwZh5KpJHnF9Duya4uOjNA1UKvqVBXs5eh
 Z4NeA5YxfMN87o5XWbigRr1tr3VxW28w8ORckk+JroINIg8EAoPbXn6wt4R2AWFWfAJZ
 XPVOUzRqcNaxE7Xem2peS9gWVqcRps+wDsQtqnrTiH9Wd3tkPAYbZcvSIXUI3XhZS6qv
 sudKBPSRKWiCYRNy+oBa0P4uFawXOGSEmhftXegRlNFB3bWSIZa+KW1119joRbpQSHEu
 h77TUPiIkVIqCuRrxm2wZ11V37TioSAJP8kWtukwpxOtNPOehLLjoCc5p40XkG2Jqit/
 kWnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUReeEzm8IKbDLnDhPt08FrRHQRHJm4eJ0N07JH4hicVR0i2miZVS+yRbNeEOQ7fvJTmFcxVXLWkg==@nongnu.org
X-Gm-Message-State: AOJu0Yw5zWUWXDmywz0EGrwDiok31so3wpgTo942PM8iJ5YkmFam/jDX
 p7x8uzUOzBU1sBw9EQMqUcVQv1fF+ORI3df2p+2/VlmOJhYiT2m9oqKZn0WsOXLmEuE=
X-Gm-Gg: ATEYQzx4JPk8a54WRkRTI8xzuuTlMra2Y0x+XSZtAr0dKsttq6PXAPamf2muPjNZEYg
 g7xtGZvmK6nVy3aPlY14VHeLsI9ZbXF7F2BWah2DHy8JCgbRxK8aY2h3ntQ3bvKh54Z8NroDO1h
 tvfAYEkoqMZmbxdryLK+1/lhXNGEV9vjjOUkFWPQYgI0EQpPff8qLdvSf5eCXb75mNL1UGizkSP
 hVzCrdl+20r2Pc0VHN3Gn07GyJeJfH25fM/JUnfQQ88Cun1MevdrRKJ5TjNaeeCA0VDjJ8uCWe2
 Wp2oM8TqUIn9CZbkJ0bzFM9pQ/695oU2YBDJeeIVA+wXSWfkCEgVNSmurSziVml7jyhXF6mA/G7
 npGoElPHoGYnKYFf6zZ5G+JMDd6gfXzcN0VnJxfMFn6Zp3aOVHCQs4rUNOBuGwGrvM7vHjXoJvT
 MkR0W2JgaazxCaEULkfgSVUfAmAr4kHmD//LwvhS4hcQf9UStrxfnJu54tzBSOkw==
X-Received: by 2002:a05:6a00:194b:b0:823:d04:deef with SMTP id
 d2e1a72fcca58-8274d9f5a87mr1089085b3a.35.1772153717477; 
 Thu, 26 Feb 2026 16:55:17 -0800 (PST)
Received: from [192.168.1.105] (61-68-87-122.tpgi.com.au. [61.68.87.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d4dc6dsm3417329b3a.6.2026.02.26.16.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 16:55:17 -0800 (PST)
Message-ID: <0eb7c279-ee2b-471b-9798-f9078c6e3ed8@linaro.org>
Date: Fri, 27 Feb 2026 11:55:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hvf/arm: expose FEAT_SME2 to guest if available
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260226-sme2-hvf-v3-0-ea5763dbeba2@linaro.org>
 <20260226-sme2-hvf-v3-2-ea5763dbeba2@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260226-sme2-hvf-v3-2-ea5763dbeba2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 2/26/26 18:25, Manos Pitsidianakis wrote:
> Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2.
> 
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/arm/cpu64.c   | 13 ++++++++++++-
>   target/arm/hvf/hvf.c | 25 +++++++++++++------------
>   2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index dec430c48b92a8bf6bb8a9d247c23d5e7edb9c2b..c9991881f2e6cc39c9f3884efafae11bd210ed61 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -340,9 +340,20 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>   {
>       uint32_t vq_map = cpu->sme_vq.map;
>       uint32_t vq_init = cpu->sme_vq.init;
> -    uint32_t vq_supported = cpu->sme_vq.supported;
> +    uint32_t vq_supported;
>       uint32_t vq;
>   
> +    if (hvf_enabled()) {
> +        if (hvf_arm_sme2_supported()) {
> +            vq_supported = hvf_arm_sme2_get_svl();
> +        } else {
> +            assert(!cpu_isar_feature(aa64_sme, cpu));
> +            vq_supported = 0;
> +        }
> +    } else {
> +        vq_supported = cpu->sme_vq.supported;
> +    }

After the cleanup just merged to master, you should now set cpu->sme_vq.supported in 
hvf_arm_set_cpu_features_from_host.

Compare commit 5b3feb36aec for kvm+svm.


r~

