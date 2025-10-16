Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA0FCCD199
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RVM-0001Hg-1m; Thu, 16 Oct 2025 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RVC-0001BX-5U
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:11:00 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RV3-0003bj-IQ
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:10:56 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so985555b3a.1
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634646; x=1761239446; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4bG/CW24bkdpxwOsKcr0LjlYCeDV8qC5cwo2zwpHqrg=;
 b=mXv9HGB4G8IcIkBdC7BPguVH6bNJC0zGYMjHk2SdM5SyDMQfB0qi2H3gaDaYBWEqiv
 33otBntQXcFl68GzXO5UbrAaCXEKNhBuFUJ27E1yXb0rbE0ftGxNG1iuoUcI2Oz0FB2j
 XoafcMvi9hnCAWUmVZY6pqGdxbbD5xaF9Ajy18D5mEljxKSG+Y/Iiruc4WcAO5zQmVRM
 A8hOQ9E78f59izMciVmGion89Z6/IY4iacTyRy8C0QxMCwvM6Tqi0VzVoV2wSoPYlZ3g
 pXQr2tT6m770jaxqG04PuFOuQtXFeL77O0JWSrVH7dx4MatD9AMhsbH3LYYrlaGIxpDz
 e/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634646; x=1761239446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4bG/CW24bkdpxwOsKcr0LjlYCeDV8qC5cwo2zwpHqrg=;
 b=wfw9T5VFIKx2ZiWl6DU4ST660dVc78bFnVrco70ZJ6M+xoBKL2asNEQ3jHnVVVxDvn
 mmoxK42fPIS9cnTXF/YnBgJCdJdE7SlmaJFDYkXo62bYoFQXL6kqJwH3JZI8CJEu7Suz
 E3LlopRXpycHxB7UW0bNKdV+PiOOYL6QKV81QqwtkBBLS1ZJbvdOwmIMbDNx3gkJJkvt
 Jr5A/8cCk/+040xGx/I7G01GlsvL/F9/k+ZtQ/N70LtqC/LquR/4L8Im5+t2PFMKPqSz
 LUejBe2ruSdEyQqe8rK6qGuIuHGsv+DKmx8GGSZqb4wzaP67AdGDYvsKMFGqfGDuue0E
 oVBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAv8pVJtLe9TB1e/S7xhq0xXCB8vcw1cZ/uU+bttRBKH0YTZuNgLb/4FSD+i8MLK1tGFlmgSDIFg==@nongnu.org
X-Gm-Message-State: AOJu0YwhofHRJfT21Lyrgl50v18rIZilRmLnxiXK2VOKsRf90KwiOP5g
 L8o6OB1SGV2htwnXLJK/jv8FxOEosoRzPmVWA3sZIxkuAsHmEc318rFpJhdIp6JFb1E=
X-Gm-Gg: ASbGncvKHhZO77EtNfjW8IFR9S/V8JybtA/IJRJ3pmcr3Zu1+4FEXxKt8wcFvHG4z5o
 6V5NU/HowLXsUOsSpHKOGiET9zpHG7wQpE4Sy6jDpXuqGvK0VMKAvEED15Ar4YIX7PCOed559iu
 1m3FMTYto5IBZf3jXR26kHATfgJMMDxZKZ1579B7Kt6Vg1B6VvcpXzBSzPX/gzFCsyrCX1iarhK
 SA6wX5mO547BWUwxu1NIMIO6nDCi8ep2gdeRS0x/dmZNr3/24sBCtAe83Yv7yjlU30nDTAPGNkd
 Y1ycGy1SmvWr/aZlxtuJZFoqtpt0fb00ARnK/vpnRip9kT3h+2q66mfkP2HLj9ezh+0nAecfY0C
 KDtuflmOYLZY1Jptxu0RLyaoO8GSoA+XISGJjT3k3UEIxyPTj24nxttcEB/Zmseq/brxaYZnYva
 BRWpXQ5YOKfBmX
X-Google-Smtp-Source: AGHT+IFoML3KxKt6peZtjA99LF0wQnp97PYYwkoNppHByhoQa3+D2YD6/jKPVLmtFICCxoo+Jw1kOw==
X-Received: by 2002:a05:6a00:139e:b0:7a1:3b82:8d61 with SMTP id
 d2e1a72fcca58-7a21f9449f4mr1113465b3a.4.1760634645981; 
 Thu, 16 Oct 2025 10:10:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd854a2sm22883770b3a.76.2025.10.16.10.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:10:45 -0700 (PDT)
Message-ID: <68871362-029f-4927-9860-017d66fe055f@linaro.org>
Date: Thu, 16 Oct 2025 10:10:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/24] hw/arm: virt: cleanly fail on attempt to use the
 platform vGIC together with ITS
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-16-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-16-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
> Switch its to a tristate.
> 
> Windows Hypervisor Platform's vGIC doesn't support ITS.
> Deal with this by reporting to the user and exiting.
> 
> Regular configuration: GICv3 + ITS
> New default configuration with WHPX: GICv3 with GICv2m
> And its=off explicitly for the newest machine version: GICv3 + GICv2m
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt-acpi-build.c | 14 +++++------
>   hw/arm/virt.c            | 50 ++++++++++++++++++++++++++++++++--------
>   include/hw/arm/virt.h    |  4 +++-
>   3 files changed, 50 insertions(+), 18 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


