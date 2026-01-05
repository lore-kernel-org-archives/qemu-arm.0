Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1417BC79FA7
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 16:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcn7H-00016q-C2; Mon, 05 Jan 2026 11:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vcn75-0000d5-BV
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 11:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vcn72-00028B-VB
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 11:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767629239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GWvc0xeXQt25In2slS15dV8A6RI6XJwCVMMzgTQUAo=;
 b=WDCHvNZFTIj6waocWiQXjqM7zuyQRuQTtLXZowdDbY+ls+lKpxV0A5kMmBKtiZ9NOV1jks
 eC1t00HRaZNlQ0W8nourawW+5htTnpD94XJzEZPUFJqwYDLoa209IlEUqvmQ4Gs2YiUGmt
 AgsaTgOmTvaTVx6XY2kDf8w4xOYyHtY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-Emxj72O3OfKqqvu5ciT7iQ-1; Mon, 05 Jan 2026 11:07:17 -0500
X-MC-Unique: Emxj72O3OfKqqvu5ciT7iQ-1
X-Mimecast-MFC-AGG-ID: Emxj72O3OfKqqvu5ciT7iQ_1767629236
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d28e7960fso926805e9.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 08:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767629236; x=1768234036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GWvc0xeXQt25In2slS15dV8A6RI6XJwCVMMzgTQUAo=;
 b=lXEShv+MIVZKLMNOU5E4SM0GgKr1O2CpI4ydDNYbwFNP1EvZIwBJMwxDrB+AMkcxdk
 hvWBNw4ZqUnEyvTL1kUCc9OL+jcBjPu6JnPu/RSNM89Zf0g4CIza78Az7h2SBtls7aVG
 JgUgUnfGQdn0AKXr3sJVhTaN8BrJU6pmfMIzAZuPmu7NnIAiEZLTO8mksVkjCByYrbMO
 ZmJHMKpRYszCPs+3GCARvqg7DySwFDI5wL76nmFMMdCF6FW8G+wlPTJ84RWkKL/KPzJL
 7psCFBMLKP+49ty+ddLI+io43CF2VEae7ofAogavOKt+ndXv098PylauVvP45wH4zH49
 /chA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFaWEF71++6nqK9fXjxUI6Nh4S95zs4r5lDN/Kc01cVMXTqskvqDhlKZRIE6hfmua5NZsSN6oC+w==@nongnu.org
X-Gm-Message-State: AOJu0Yyo/MA63qm+qRo2tmU7VSoelVNIyO2UWG6ZY1wA20FXNezT9iuw
 MhU2Ku6A1ZediBFTkKfFsWtLNPxUggt0AjJLPaliAmtbOr5JIWXB6lMPdvoS/hIwOe4bYpeozEM
 m32+xg08F9pZdMVq6DUrLZjhwWa2sO7geem1ATyW4PFZlJF56/yjaJw==
X-Gm-Gg: AY/fxX5fk3yBJaG70/RS+PrNc6Bm0LMG+1qS1A2gRvK40yA/2iBbqejEVJRbd8nCyMo
 zB5snaOZ4hjczAL7yH+rZRkn8HucTXVoycaL7VVoUZWMR4GayTxkH2w+d3MNlI66Pnc/Q04Izrf
 ZvUry08RCVe2QxzN5KBRD1OKRTd+Ql8cXeHkoPNEtU/P/Hw/Q5RiZX7pROiBlpSa6FCsNyeXAyI
 gfR19OjW/UmJ9pGZ7n70VE/4fESLTHURRPN9tIOMnx4axeNM7Dqi2y7DbFJyMEodL5qPA8F2R21
 baOZuGGaMBe6g+NSUJvPZTkqrREKSdJWkf5uCDxWoBmJZrePetovMg2szWrfZlBCvQteUg2qL3u
 eCDbblrZaSrWBdG8pdrmNLY8iXlhjpt6yQFEbBB+nkP+PTdts1oAjkk/bmQ==
X-Received: by 2002:a05:600c:8b06:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-47d3b011b03mr444117375e9.19.1767629235933; 
 Mon, 05 Jan 2026 08:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6Ue7USFcKW8MKs3iBSEssrvpcBKLu2iCVLHa1rn3Fy3HK7OPf8D0BCNvbeM6MDibWE1zBDA==
X-Received: by 2002:a05:600c:8b06:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-47d3b011b03mr444117045e9.19.1767629235478; 
 Mon, 05 Jan 2026 08:07:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7ee2a3efsm1310465e9.7.2026.01.05.08.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:07:15 -0800 (PST)
Message-ID: <c2e28896-a3af-4dd2-8723-9add5f1b2a78@redhat.com>
Date: Mon, 5 Jan 2026 17:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/28] hw: arm: virt: rework MSI-X configuration
To: Tao Tang <tangtao1634@phytium.com.cn>, mohamed@unpredictable.fr
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <c6eafd44-3187-4c63-97b9-bd4bf96595c0@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c6eafd44-3187-4c63-97b9-bd4bf96595c0@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gnRtVDYzs0PcwYzr3e-51sklWJLLaxQ8BFQWAVgXuO8_1767629236
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 1/3/26 6:21 AM, Tao Tang wrote:
> Hi all,
>
>> Introduce a -M msi= argument to be able to control MSI-X support
>> independently
>> from ITS, as part of supporting GICv3 + GICv2m platforms.
>>
>> Remove vms->its as it's no longer needed after that change.
>>
>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c |   3 +-
>>   hw/arm/virt.c            | 110 ++++++++++++++++++++++++++++++++-------
>>   include/hw/arm/virt.h    |   4 +-
>>   3 files changed, 94 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 86024a1a73..f3adb95cfe 100644
>
> I’m trying to clarify the current status of ITS under TCG for the virt
> machine.(may be a stupid question...)
>
> The virt documentation states: "Note that ITS is not modeled in TCG
> mode." [1] 
this is outdated. I think ITS TCG support was introduced in 6.2.0

https://www.qemu.org/2021/12/14/qemu-6-2-0/

You can have a look at the emulaation code in hw/intc/arm_gicv3_its.c

Thanks

Eric


>
> However, when looking at hw/arm/virt.c, I don’t immediately see a hard
> prohibition of ITS under TCG; for example, the MSI/ITS logic appears
> to allow ITS depending on machine/version settings, and the series
> also keeps tcg_its.[2] [3]
>
>
> Could you please confirm the intended behavior today: is ITS expected
> to be modeled under TCG for the latest virt machine?
>
>
> [1]: https://github.com/qemu/qemu/blob/master/docs/system/arm/virt.rst?plain=1#L46
>
>
> [2]: https://github.com/qemu/qemu/blob/master/hw/arm/virt.c#L3490
>
> [3]: https://github.com/qemu/qemu/blob/master/hw/arm/virt.c#L3656
>
>
> Also, Mohamed’s recent work to support "GICv3 + GICv2m" (and to
> control MSI independently from ITS via -M msi=) looks like a very
> practical workaround for environments where GICv3 is needed but ITS is
> unavailable.
>
>
> Best regards,
>
> Tao
>


