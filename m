Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB1FDEE20
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 16:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFwdg-000655-4i; Thu, 23 Apr 2026 12:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFwdZ-000617-J4
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:10:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFwdS-0002R9-Fi
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:10:44 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso44642905e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776960635; x=1777565435; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rZomkcSuXAVvR0XckoEl3jABL42gMlPgD2LRjbMRVuM=;
 b=E6sXMHqQGmsg9VSEtbeWnnCOG+PEuknElAIXP7NEm+hvfsk9N1Y1K21WieyYCIfHqk
 iIjqkxwnjcSV4K4qSoWo05trjDdAz9WGITO4SMIBi9Gc1wDpxNTdk0gJI0P+q1a3c7Yt
 +YU/djYRcW5shd7LVWYC3oqoFP4yxNeEMwjWNGnr3R4Mk7pfq9TbrKTPF8TsICM+Dnb9
 VEgrnVXTa+lPAKgnxN53WFdLUS5D+dbqk8kCyh8Ys6IVmjv09t/glaBQnEx+0qdaB23f
 dfm7b3CFow5xaKxYqk0PB0UpoAjeMsur2gpgx3WJJNGLgURKXi1GKp5AFdrp8OtEa0vY
 XZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776960635; x=1777565435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZomkcSuXAVvR0XckoEl3jABL42gMlPgD2LRjbMRVuM=;
 b=aFsdrnfPvaHoBUllY3Tt7cXaYWjKVBVFrS9S10A0MDYfXDc4vpxIgcHdER6xGf9mdu
 3qmo2ClqkJMojDorm2FCMv2CRvh2HyT6+0dg+/1gi83DSr1jswd2rOWY3SMjLYeG4u09
 bEd/U9QgQWb3BAqxkA/IugDf4rzE2Yp/QtbyETaQ8r/rW5mSSjcKG5nzHSRCgY84GJ/9
 jcPiICDPLalwhh+z9XoIPpvmohiu3eQ8EPSU7xN+jrfdEDDhDQSPa4DQj15mJFp6RlNi
 ss4E71a5EcIjccxtEpkKb4aNk3EjHkexa8hCzfC334vMkCaOIqhfxvPRjkEjMgNs3Rb/
 dkAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Ugyzhoe0rl/hqNMqQrLCh4ZVHaPzUc9AQVZSdzf/iMhLgkCHFNL6IThq1ET0XoPhRkaUemtoXNg==@nongnu.org
X-Gm-Message-State: AOJu0YzMZkjKSag7o2fROA2L6OBkG5CkYPnpbfheJh/EVOrwiwUk/GXX
 rlnidqQezlfUH4+97T4d0Jmm+jAkLeh3anRCGzdCb4LjpK9qgYjO16iKPeUQWF9tr9A=
X-Gm-Gg: AeBDievuu2CsR7l7JOSvbmWg6ByaeVeXG6xEj017/vjncizRU4uaFU7dhSpWIO2RDV3
 oLdX7ZxYkE/rxWyQmkolullyD1XziiOIIxmhZENGu1gPV2zNKLVAPLQNMIXkxGNYkYkEwVOOJac
 Q759CvuVS8RUhDfkC4Ai0KcqRESXEX+FMCSsS0rrjeZ8BXHkZUqopYV8/wCdIHJIK9x5UCnP4/C
 asVlSI5j5F5NpFqwe8uOyDQNF1J/YVHCz+A5B5VBkmuzVznN383c/CD2NHZ7hOJ89A22+yMXi/q
 txBFna1IxxUQgR31HJBPlLRdMgChsxdWF10KYKZWoqHp+YBGY/sXq3QCFuS47jxVYKUbLD28CAe
 773vUP9h/8EeeDGX370pkAB2nMZEKKz+NVpJ4A/Y+rVPsIbRiz8BYKA6R5yOVA20oYp11F8zuAG
 b5wilFYhRS/bXIAXZ3k2KY04g2TEGotnS8Y+7cYTIPuMSPbl+N97lapQywCGd0Q/r1lXrtTrnp+
 k9R
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id
 5b1f17b1804b1-488fb785b7emr291382445e9.26.1776960635240; 
 Thu, 23 Apr 2026 09:10:35 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cc7b2efsm184867565e9.0.2026.04.23.09.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 09:10:34 -0700 (PDT)
Message-ID: <07560d55-25cf-4abc-8c58-b386306546b9@linaro.org>
Date: Thu, 23 Apr 2026 18:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 03/15] accel, hw/arm, include/system/hvf:
 infrastructure changes for HVF vGIC
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260316130642.13246-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 16/3/26 14:06, Mohamed Mediouni wrote:
> Misc changes needed for HVF vGIC enablement.
> 
> Note: x86_64 macOS exposes interrupt controller virtualisation since macOS 12.
> Keeping an #ifdef here in case we end up supporting that...
> 
> However, given that x86_64 macOS is on its way out, it'll probably (?) not be supported in Qemu.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/hvf/hvf-all.c        | 46 ++++++++++++++++++++++++++++++++++++++
>   accel/stubs/hvf-stub.c     |  1 +
>   hw/arm/virt.c              | 23 +++++++++++++++----
>   hw/intc/arm_gicv3_common.c |  3 +++
>   include/system/hvf.h       |  3 +++
>   system/vl.c                |  2 ++
>   6 files changed, 74 insertions(+), 4 deletions(-)


> diff --git a/accel/stubs/hvf-stub.c b/accel/stubs/hvf-stub.c
> index 42eadc5ca9..6bd08759ba 100644
> --- a/accel/stubs/hvf-stub.c
> +++ b/accel/stubs/hvf-stub.c
> @@ -10,3 +10,4 @@
>   #include "system/hvf.h"
>   
>   bool hvf_allowed;
> +bool hvf_kernel_irqchip;

This (along with hvf_nested_virt and
hvf_kernel_irqchip_override you add later)
should go in HVFState.


