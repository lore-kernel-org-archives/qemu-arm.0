Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F4AFD45EF
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 20:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvLPs-0000F9-Hp; Wed, 25 Feb 2026 15:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLPj-0000E2-Ed
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:23:21 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLPh-00019b-6I
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:23:19 -0500
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2a7d98c1879so357445ad.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772050995; x=1772655795; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+SWxE0wlcamI/82K0jfVKWTdtEvw0zG256qxPiu9qI=;
 b=vCl0KmcZBjHfRHNjj7MT3GQD8J6D8w6TNozC4kBAGJuVeLbgkiMAC/XzqMv2KiSy02
 CkE17Njc5UudWilvOL+apfLxvSGeMtq1Z8F/HUrwPfHM6LdcV3hAGj0eWnLHDJukXPGs
 bPeiXWmjvwFLoJFdPlhmRVYc9RAiTApirx80Jb0zA9R8WzvB3MrAxpRCe4RkxC17q0cd
 WHvx18RoN3cbm0jWsa2naBEtQkFSFMMPQvxFwfc7/u4zRobe2CSQOJVLIyi3aBIO5zMu
 56XK+TZCAPkvQCKwosSllFJUcoFJKjcnwIp2qxRe2eS+UO7hiO930SBgL1jagYJNJ3Cr
 xsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772050995; x=1772655795;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z+SWxE0wlcamI/82K0jfVKWTdtEvw0zG256qxPiu9qI=;
 b=cOLsjKMX0+blG8HGFfVyG0CIPMU3rH4pqW08l+rVgyIPEWf2ioulSQfsL0RzHcdBtT
 Bqs/FvudDQsYwc6ftXRmpAirNKzBm/rWCbDRCCWfhF7j3QvZ7gzwPdJRbKGuqgaETpv2
 ENVnz0AiT8z/XlRQWqQAx2Tox2WrLseBu3gZ0/QnVITv6DPJNjO7DaYt8bYuxvpq0Dw7
 mF00HDlt8Ig1z7gkQNghnT+lRsDpcXooKPhTDG7dHoIzsMWL77hLckQ18e+VUcgFGkcp
 sLcAAKkrrPzqw6jyGO6TBVmF7o6pr3a74dkB+n3Vqj/GQqRS/bVhY6Hv4GJElv6sW5fG
 /jbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF4hFkA3h5ljJkLq+V26wvkGEZDq6jltK6NjCxaYU42/NLRqTLEqwDNcdql27J0NhmF9elg+8b+g==@nongnu.org
X-Gm-Message-State: AOJu0YxbTX/i3YgXZwBj8r6CAY2bw/bp75pGslRrTUqQmrwcK3EsR7YE
 99m3wX5aOy3I4tRyMtRWDquxryLL5Gc17qEPM5NH4P/RrMXKQd4tPqHGFxW6l6dmRco=
X-Gm-Gg: ATEYQzyqn0ecenixCFpcgwLW8ecSSOO3kXwuSPN0MsV2S184iRu7EmQ0aububXEeCPT
 tFaInNfliaDKSztdg/KRI4pKssG3ihha4AtTXAL4kEXgrzB9laNiLJhYOPB57fjwAY8GBFdZhj9
 uhuHSQ/bjSg7ZDCFpLl2XvY6WfRZt9IPW/wn0mZ7OEY1+xuRaKqsJ+fPGTxqGxwDqM9S5U2jEx6
 n/39YsCKV/kjRpW839BTulniCDcUktDEftLOgjC/sFba5Pj8rvMpBvAPp4VA8vShvIcJN7jYPvK
 R/mfkn2P3qcDIASQZXEnq1YAHkhx6uU9D6pdEc/zKquHomd8F1O/1IMdSCeEYCHKTv8Nl9wjgBK
 2Sh2NlROLKnNih/LJezrWqQsmXVrT79Fn1rC3p35ClwgOmvEPfqnU378aAmPGJ/5Cj/VR/4f9Zx
 3e6y5nAH6qqkM3LLaAW3oMvT6AdJXkBzawE0Pa5dwfQzA/c1dXmN8eoIsvuuvfM1UUZgg1
X-Received: by 2002:a17:902:d48d:b0:2ad:fb6d:f647 with SMTP id
 d9443c01a7336-2adfb6dfa76mr1419315ad.3.1772050994950; 
 Wed, 25 Feb 2026 12:23:14 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6c87a9sm604185ad.71.2026.02.25.12.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 12:23:14 -0800 (PST)
Message-ID: <1a0fb6c5-8afe-4f28-ac68-4e1ce968fabe@linaro.org>
Date: Wed, 25 Feb 2026 12:23:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 03/31] hw/arm/smmuv3: Introduce secure registers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-4-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221100250.2976287-4-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x642.google.com
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

On 2/21/26 2:02 AM, Tao Tang wrote:
> The Arm SMMUv3 architecture defines a set of registers for managing
> secure transactions and context.
> 
> This patch introduces the definitions for these secure registers within
> the SMMUv3 device model internal header.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/759ec110-365f-488b-802d-c7bb1efe30bc@redhat.com/
> ---
>   include/hw/arm/smmuv3-common.h | 70 +++++++++++++++++++++++++++++++++-
>   1 file changed, 69 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

