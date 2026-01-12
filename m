Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947FCD25041
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 16:33:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfKh8-0003uR-9B; Mon, 12 Jan 2026 11:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vfKfq-0003Yw-7r
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 11:21:48 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vfKfo-00088i-NP
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 11:21:46 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-81e7477828bso1521025b3a.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 08:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768234903; x=1768839703; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlkIiqSZlMDBvce3juhwVe0pZE4IZJdrPBREhvrFg9Y=;
 b=kajoJkZQN4ZbzV9psUDdFqMztujzFS+tSIg6KGJCti+dKhpLW9yH8EzpqDBSba6ENE
 cQbt6/2HOqfbs7ThrOlq5kX/XhipnO5XBbHa8KsUMr+NMqv2Cbz1bAlkA+D4KJg/oAKE
 IGsLYgboiqAH6JOIE2FdLNaKf7CM2rtkuYOcwEj7JNI/tR8GsKf0P/1cNi047YhLwoRo
 UfzdoKgLD8DpncP61ZAwk98oy1FtNmdHwZ5ZxRZpDFItzbOSJC1zbIcmO5VAYNtbjOOB
 FHs3UaJ5Wu1WMOmHyT509aH1/yvWyakWUCrq2dg5dx7fXRuVeu78S2ZmifdPRMU9HqrH
 ym0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768234903; x=1768839703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlkIiqSZlMDBvce3juhwVe0pZE4IZJdrPBREhvrFg9Y=;
 b=amZyZkq0JgK1k7bCEvyzyLZhZT7A90/evt+N6xuhpoo8yxIE3YZE5B/OyN9RbfvJFB
 Oy0qQux1H+fRjFHsiXQw5j3ZnpQpOGk8zbOtk+oGSy5EhHCa0p9WE6FXXtbBYLNgfpjC
 /zeSENVH5GT+wxmE1d8+x88+9a8regaIGCQaupRtvI07XsDpJs9pPP5K36rWy8o636El
 mdLctxqT5YtVwOtHqcCyrd6E/x9Jynf8iQGxajRxBXDr0Rwxe9azmlebeomSO49Fs+hE
 5lbZDu70xPjo6HK3Ab9C0+6VEylzbbXpPJi8gQ02++uTGTNTIY1fdpbvqM9NAt1Uswn0
 xstQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSgmfIUE9+OHQb2k1masOeNxG8qBeem6TEvvlWJBN3RScp0LAtkDBiOYvt6Rep2XBjPBSaPxKd3Q==@nongnu.org
X-Gm-Message-State: AOJu0YwzFfIUrks56pzPHtKSb2QBqurPUiI8DfFEw3rsQ1Q2GGvbKpCX
 eBPVO+UgttN1MJSpnZmAVvvVexiZbPxOGvMtJ1iWSUPuy2gIAuxivp5PBpOREZ4G3SQ=
X-Gm-Gg: AY/fxX4Pk9kLNQUk+4mAGkwFeSYW6XofFqN1CaYOGYBX0xmiDtOMvT6fWfOyGxluJR7
 jnKH3Pyh+QbRNsitdDgcobfYiraHKYVmQKNKUHQVeVf6btGs1ilhEA2T3sH8s+rSuhBgy5paDBi
 R5sootKRUAjRDOOg3kTiBhfgWbdboWPm1DCMFyEoo+fU15FiZqAsnDC9tk/nhOfPQgpWuf18eqc
 nn6dNdUouL5eYlHfVnirKoLqG/HfzgCeVBQ02ezTXM4TaSBAjKuxPxLZFgIvALvmGC5y/jLchDE
 GsAoQ7WTreYaK5FE8f/SJTkO+Txb4/7Yg0D8NwjPtRlIK8tZkpS8AseMCt42kWq5gMY6wn/LHiM
 LcxMAKtLpInKNd5hC9nDjPktVoZFDZyzTs8U7Pxk71TO0Rr9WmzT19M9+nqlgnDHUhxOrycb54b
 MJXeKsY5UIg7nawxzmFb2DUsYrbg5UW3TFIpDMoTdGzhpgNz36zJLeAdUvU0LsG+q/7rY=
X-Google-Smtp-Source: AGHT+IHJ8bRZuqmFgbPVPBltyIHJGwivpcTtezTUqOJ1M5Qy5nFpGXH5sxvyr8IxaEuVTjxAAX3zeQ==
X-Received: by 2002:a05:6a00:8c10:b0:818:1e8c:a513 with SMTP id
 d2e1a72fcca58-81b77eea322mr17038321b3a.17.1768234902818; 
 Mon, 12 Jan 2026 08:21:42 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f32ccb4aesm7443647b3a.9.2026.01.12.08.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:21:41 -0800 (PST)
Message-ID: <82940e3b-f9a7-4172-8ae7-680bc1a5785b@linaro.org>
Date: Mon, 12 Jan 2026 08:21:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 tangtao1634@phytium.com.cn, richard.henderson@linaro.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
 <08c42104-d7c5-4df8-b25f-7138ddc94a94@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <08c42104-d7c5-4df8-b25f-7138ddc94a94@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

On 1/12/26 1:58 AM, Eric Auger wrote:
> 
> 
> On 1/8/26 10:04 PM, Pierrick Bouvier wrote:
>> This will be used to access non-secure and secure memory. Secure support
>> and Granule Protection Check (for RME) for SMMU need to access secure
>> memory.
>>
>> As well, it allows to remove usage of global address_space_memory,
>> allowing different SMMU instances to have a specific view of memory.
>>
>> User creatable SMMU are handled as well for virt machine,
>> by setting the memory properties when device is plugged in.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric

Would you be ok to pull this patch, or would you prefer someone else to 
do it?

Regards,
Pierrick

