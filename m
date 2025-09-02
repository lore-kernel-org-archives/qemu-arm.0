Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B3DCA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 10:48:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utOYt-00026X-Ag; Tue, 02 Sep 2025 06:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOYr-00025J-Dg
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:48:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOYp-0002pq-Fi
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:48:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b83ae1734so22001365e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756810102; x=1757414902; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bRBuAjwYyLGtEfDp5Hp+CEQZdw5DIkIx0+K9YfLsRd0=;
 b=lRl53/GpbmnFpvwXSoxPhjZuVvfUlF88Y/Bwx22+cAODuuVtXldY5Oq3wWY4/LMRD7
 ZDGH04eiZC2S0zt3u6nOeOtX1ubYQhoyB22adfOJ0ipuyhu5aYn27LyMjhGx54/TasEA
 HuQff7t9YzBb0o4Wvs6RS5wdLJ2la90zBo6NnYRgeWu11ii1T9oS9mweU82fzeDDvxcM
 m89Dqop0ztCwqkQqpnMps1vGbTT0PFgWxse78Wyyw4MMxvWMskliFct79SpUOFKXGv0s
 VTs0xVZsK3ETG5FdZJ1bhd63yOhlKBkXSkcwlcMXrQ4HdHCrD7GBDDay7B3sqjrI2LaP
 VaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756810102; x=1757414902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRBuAjwYyLGtEfDp5Hp+CEQZdw5DIkIx0+K9YfLsRd0=;
 b=gZ7X7rmPYgrpOUeQy2JFeYmcYL3Kp77e+c7p0Ox5YyPAMpG26rIVDT0vqF4MjLAY+P
 WpEXdETf10O/5J/RSKPqX6Bfy3ERCWhJCA/zRhxiOzPPbGRXDZywqK3/AHhDlviQLHw+
 LTT2Ncl6q6w4oJOUXbgBH4Hx7AYluhOGxg2Y5fAYK953luUJXB9jpz1dDM7YdcBD/oy0
 F0pdrPktgrvJtfLZi+xd9e7uMjE2Gp9jeOwpy/gwJi0hvOxs9B86yy3qdh2ocMIc8sNL
 Jl9fF6PVLCPxJWPpvDOuvOR32esVoE+OBDkPG8zLGM5F3S+G5/+nKJHKNFFy3tk5txxu
 C5yQ==
X-Gm-Message-State: AOJu0Yw+rgRerwLYfNGCor69fWZrG4y9n8uCs9B4Gj2/x7K7sYL0EVKu
 y9d4vGbu+tW02HTs80gkSM5Z4N9fkScOpErlSLEbXZRXyEsdoWSGuL7Ig3wlCW95jOM=
X-Gm-Gg: ASbGncsRtIXH/7jfHgXtCCPzkvHS35CXhYG/tFs208joaplq0ld5OgTtUTpJ7S5kn1M
 pe38AnoDNdDQYik43ubcxFZe2JTbyu1qkGhVLA7jFhfrh39RWZzcUwtXb4IAnIQBzLTAYqTsWUV
 YoUtgT9HNPdSkJoj2VTQmAEz/Tyj+VWvksqTFB5oz/ahYP9T9Rm9pQecPf5cIPZsQHvEh6+4EaV
 qvsaXtzL+S2F3LMMXDqPl37d2C95fjNoW7GzyoXiQDjn6XcCZ4B8poL/L0k7YWsBjs+dIBsECZa
 /nyNCY3vJNtBf5YdgmF6XUKNKNFQ6Pu9+n/gBU6W0DKM3j9yV0coHT+ZmrsRzQR5h7E2u3VGn5C
 KuXELinDJwwTyybhvS2dkDuFDIbMGE7kOl9DEYeGqkH0vLZZ4uTh9bGP+MOUGIR+z/g==
X-Google-Smtp-Source: AGHT+IHrge87uErL1nNilvWUBDgSNIEavZ3QoheCwWmOk02dOEiliSVm1iqjmnPlv+gWxw98lNdS+A==
X-Received: by 2002:a05:600c:4445:b0:456:13b6:4b18 with SMTP id
 5b1f17b1804b1-45b855b2bc3mr113833455e9.31.1756810101771; 
 Tue, 02 Sep 2025 03:48:21 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9ab7c7dbsm13426475e9.11.2025.09.02.03.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:48:21 -0700 (PDT)
Message-ID: <1da5c7f3-1b14-4cac-a2a1-bd132b521898@linaro.org>
Date: Tue, 2 Sep 2025 12:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] vfio: Remove 'vfio-platform'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250901064631.530723-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250901064631.530723-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 1/9/25 08:46, Cédric Le Goater wrote:

> Changes in v2:
> 
>   - Fixed 'system/system.h' include for the arm virt machine and a
>     couple more models
> 
> Cédric Le Goater (8):
>    hw/arm/virt: Include 'system/system.h'
>    hw/isa/superio: Include 'system/system.h'
>    hw/mips/loongson3_virt: Include 'system/system.h'
>    hw/mips/malta: Include 'system/system.h'

Patches 1-4 queued, thanks!

