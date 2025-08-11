Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D12EC87FDB
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 12:47:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulRwE-0004IQ-6C; Mon, 11 Aug 2025 08:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulRw8-0004Dm-1k
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 08:47:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulRw5-0002rC-0N
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 08:47:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso27329965e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754916450; x=1755521250; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+0it3PRFknqa87QxWdbXVVc864hQHPUcywE1TrxI48=;
 b=CNE64plIchiUkAP8ql6C+v/HKFdj9FAbMD0FhUaKak+6InRbIi2GMs4eNrR27SykTH
 LeT6I3aDRAQ+GNrM7vBEGuTPrQ1cIVPlTOp8ZLT+y6yCwQex5P3uL63MgOKA+GWYuhOM
 lGi/DziEdfSB8LGJvPcfCdk4z45qXDcnaWY9xD133w16gtPyAoZFotB/8qy/2RINOooY
 7x+mO/Jer8aekSJ6tG+q++uZwjtXoNRblJoJHz5cjVOwxCS8VlS/LZiXcWKTLeNfYfqv
 geMauFghKqmzxfYSOCLRZmp6iR+x0LroVWdqtRYdN3Gu34+8/ed+y74cWQOJOUWVc4g+
 xE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754916450; x=1755521250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f+0it3PRFknqa87QxWdbXVVc864hQHPUcywE1TrxI48=;
 b=UM56WTrjliqibWCTTZGuvH9KYm3EO/2NJJo1mI8slDr2d+7syh12QV59mFzY20ZHwJ
 gtKejTw/H45AlmQT7itMy8CE5e4kNAHa+wWeZmRyCgm7ak+/krASfuQrNYYRnloGAt66
 somEBbOwsP8IW8kSqByHlArfZIkmZk6f+qawAXAbV9DbyWImX3rNsI77DO5mLarhogLL
 We+osd0STdhlBDrLOyetYPpmCi/wLw17qneCEqiSs4QCdTcignC5vjZBa3NRFBgIPiFy
 geFkWWXuM+VVZyfqNlDqFWaSPg1PbXQYQcmsLTaxMcAyRl1jq5fBm5hDonynMgMvGj7Z
 soZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI1Yw/ctwfSkyaudXTb8ihlOLT7xzosa2edfhDzbGoB5DCCR3XOnqhm/7GueCY15T05NfMgYPKPg==@nongnu.org
X-Gm-Message-State: AOJu0YwVvBQRpoXU8fF0zD7v2FcWRqPt/FhkJq8nJqARAwwMWbMdsuYU
 B0Qpy5n5QmROLvjIdLbwXtJQYuRbfm29LNWDR4WFUaZLovoR3SwfKJUSaeA4bY1Tm2MbBuAlF64
 /waoX
X-Gm-Gg: ASbGncs1mind/l6I6BuvBPbKrfjLlb4fsIQiliVaw9lTVS/Lxbnayq0L5XKJ7QBm3j8
 seHQS7alt88Z+O6e7J/rdk44Cu1puI2p4IZktweIH0oF/ZxirWooMiQOCQbQgl12ZnmSVidtptu
 evvbUe+cnkXrDUlSQdhQ2Yw6nfM7UViAjmCOxAk8mVWP6GQqv9PK9PIKlSC7lQkOYLNwkg9vwwg
 rBVpIAz4hdJ96sOlx4JPsIQRsD0fADzIlIvCsPCsYHeme93TUCak8Iq+XxP3PEpU3b0VlXnqVzO
 MOyJ4nMPkbNDiGPQVRVg5Ww2WwrEVTsBDnmVn8p/osuBAc3GyCmL83ACKQfNYs0bJo9q0XG4wgO
 3+Pq2jNgw5a4FypnvJ5Pho7vGgIWYMS7WOpikaX5IvprmfTad0VxwDrbQn0K8h/ZmJw==
X-Google-Smtp-Source: AGHT+IGdx1G3jmTk/qcCUXlDOCduhub/naiAJGMULT911TV9XaWRwchdaZlVR6qPsSry32bHFl5QQg==
X-Received: by 2002:a05:6000:1acc:b0:3b7:9a01:e4f7 with SMTP id
 ffacd0b85a97d-3b900b5777cmr10804708f8f.54.1754916450427; 
 Mon, 11 Aug 2025 05:47:30 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de0d4cf1sm317707685e9.13.2025.08.11.05.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 05:47:29 -0700 (PDT)
Message-ID: <7e1c5165-0395-43f5-9d53-25794cc7a4d7@linaro.org>
Date: Mon, 11 Aug 2025 14:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] hw/arm, target/arm: nested virtualisation on HVF
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Igor Mammedov <imammedo@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>
References: <20250808070137.48716-1-mohamed@unpredictable.fr>
 <20250808070137.48716-6-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250808070137.48716-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 8/8/25 09:01, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c         |  9 ++++++---
>   target/arm/hvf-stub.c | 15 +++++++++++++++
>   target/arm/hvf/hvf.c  | 41 +++++++++++++++++++++++++++++++++++++++--
>   target/arm/hvf_arm.h  |  3 +++
>   4 files changed, 63 insertions(+), 5 deletions(-)

I'm getting HV_UNSUPPORTED on Silicon M1, I suppose because this
method is not being called in this series (is there a patch missing?):

> +bool hvf_arm_el2_supported(void)
> +{
> +    bool is_nested_virt_supported;
> +    hv_return_t ret = hv_vm_config_get_el2_supported(&is_nested_virt_supported);
> +    assert_hvf_ok(ret);
> +    return is_nested_virt_supported;
> +}



