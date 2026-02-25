Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B19EFD45F6
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 21:59:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMuX-0000gN-Mi; Wed, 25 Feb 2026 16:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMuW-0000gB-UM
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:59:12 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMuU-0006us-Es
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:59:12 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c70e27e2b74so48391a12.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 13:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772056749; x=1772661549; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KKI+XFmJIc8/YpgiWkYMFqbl4rqYuwGkumg1fGtGGwU=;
 b=xwAKz7JVJ1aH0obsGXDgLMLoPCBEHVnmMZOIegzxHqJg/gNLYG4A/KhJ8+PjzvIF00
 FDo7uiAbJKLy/TjpxdSaH3nG8dGB1cJ6O7sP7U9CJuWIiRh0jBpuYBEiVBXwVsVSkT+E
 gGqHDxRDn8KkirupQ+6OP27e2AMGYtTQb5MODBKsIUUQLXVEaAQJkLCcNf2ikbyk08cz
 yYQTz2/VPgbTN3EZGHLRX8wyQBna/vdcXqghEzo8jjxorJQ+cTm66OgMYOyBOrS5e93T
 UIU5VkBPdDAQZTE/26wpSHcGRR/4OhwP4sBn4QDN0m42TcscVDBgCke6kxAfuqkJc/ns
 0T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772056749; x=1772661549;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKI+XFmJIc8/YpgiWkYMFqbl4rqYuwGkumg1fGtGGwU=;
 b=kVRJ5E7zRI4QyGbVMkrfl2BsB/B7PRUsLTNK/YFtKQIwHUpOeCPlCONLBdwv2J6Jr1
 PzKUEz2Ic5EpQxd/bcRV54h9St6hzOgDFP3lZkZtA+Awv3BO1uYcdFrVZioNcUd/5rMG
 cUcag3E9DrBlI4H8d8ajORVIAHdvaENZYhXCKux5kN0hN2uDHZmnDqo4ZxhtzCBL6WtR
 4Dj2C5qk1oVErfPwrwsmjYHXVydcJFQKbscDuwFYaQ/SdHWsgDiMrNIAN4NYTR+IdxQY
 jq3+992Aisb4kjaTyUw/RFeR5dy7C+/UAYx3heV8JrRn//Dua9nj0GJbwjD+44/XfEBv
 olTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuYoaRs6z0NOWbF3ZvTl7tu1NQ/GzGXe7TIKgcC7Bn8HzJMBj3z+RqmSY0nN6eXKqEf0F2lCWiWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/JCcNGUCvEYTUu3WehjCQIHydK5aX/0ualpueVTxStXuIvwMA
 pw2330VtJafoTK76NOBxcu80x82qa1UBmTNbrRxwDIw+OxZQOPBoamyljGK1MkO/IUU=
X-Gm-Gg: ATEYQzwzLAYjxYqihTd6ubP3/art7jmegcp8fNfCrJCg2RxC82LWah8MXLuYsPBObHR
 fOTIwhDCgD9aJHYw7oTbhOqZh4A84GAWqzE6iJoohUs7oGPTPikGoVepGxAxGTCL3Z5GENxTpNx
 CExNQpGAC5yvRNCujxaIUXQq+ukqo0RVh8m363Oh0lBBZSkWmstlXCQoqWdRkit0WXAJzySh5bA
 l0nBW11y0HAWWT9uO/jV+FNZTTROIGgnQVyUASk5Ig8O7ZUwHluO7YIE0JHPiSXS3bUELCKA7nJ
 G8By0ZedgxTkSl2GCrFiqk4i12GkBshUiJ0uj1rjK4A0yibOSTVpI3IjNQBXuIgalYzE826hy8z
 w/CdTWT1ZcAZlImjSyLuSN1I/6DmHY9cOv9smSeWNF3GsSnskKrx/ucwOeZEyxPIWHzm8XGmHt0
 qFCVKPfwNkNenXdNhVX5vbRv59mod3EiswTKtIfwstRq6DOtfJfg5sJagBN4tG1WHmBRdJ
X-Received: by 2002:a17:90b:58cf:b0:354:bda7:8827 with SMTP id
 98e67ed59e1d1-358ae7c364cmr14485727a91.2.1772056748730; 
 Wed, 25 Feb 2026 13:59:08 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359018838b2sm3816964a91.5.2026.02.25.13.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 13:59:08 -0800 (PST)
Message-ID: <eeaf6ae9-23e0-4413-985f-dcff03737dbb@linaro.org>
Date: Wed, 25 Feb 2026 13:59:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 23/31] hw/arm/smmuv3: Add access checks for CMDQ and
 EVENTQ registers
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
 <20260221101823.2996302-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101823.2996302-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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

On 2/21/26 2:18 AM, Tao Tang wrote:
> Add access control for command queue and event queue related registers
> to ensure they can only be modified under proper conditions.
> 
> For command queue (CMDQ):
> - smmu_cmdq_disabled_stable(): checks CMDQ bit in CR0/CR0ACK
> - smmu_cmdq_base_writable(): checks IDR1.QUEUES_PRESET==0 and CMDQ disabled
> 
> For event queue (EVTQ):
> - smmu_eventq_disabled_stable(): checks EVTQ bit in CR0/CR0ACK
> - smmu_eventq_base_writable():checks IDR1.QUEUES_PRESET==0 and EVTQ disabled
> - smmu_eventq_irq_cfg_writable(): checks MSI support and EVENTQ_IRQEN state
> 
> Additionally, mask reserved bits on writes using SMMU_QUEUE_BASE_RESERVED
> for queue base registers and SMMU_EVENTQ_IRQ_CFG0_RESERVED for
> EVENTQ_IRQ_CFG0.
> 
> Fixes: fae4be38b35d ("hw/arm/smmuv3: Implement MMIO write operations")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 154 insertions(+), 3 deletions(-)
> 

It seems like we use the same pattern a lot of time for various SMMU 
registers, and makes me wonder if we could not introduce proper register 
definitions with callbacks similar to Arm *_reginfo.

That said, it's definitely out of the scope for this series:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

