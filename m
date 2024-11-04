Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2011566njc;
        Mon, 4 Nov 2024 02:39:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJliYdExUA+mJi828tXDD5g4L5shlX8dCPlKSI7d2DeTQefLtPkWfbZs+j9CDutaNViQ7C2Z4UVCB5dw==@linaro.org
X-Google-Smtp-Source: AGHT+IEFBsLDrI/SpMta9bn+KRB/5hflGx6AQWoOgIW7Wsp8UDQ5Y9uQwUtGcATuQFfTa0cREtPo
X-Received: by 2002:a05:620a:25cc:b0:7a7:dd3a:a699 with SMTP id af79cd13be357-7b2f24c54c3mr2321961185a.11.1730716746207;
        Mon, 04 Nov 2024 02:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730716746; cv=none;
        d=google.com; s=arc-20240605;
        b=JjGlLU69gnTV2eRhTX8STQ3GCKYzoKOuXEOdNs6Dgd8KcR+kwJxGehRhfFQwBGkOWb
         Dqb2t52KxvaTu6VsLWWMkSj0gkTA/avuK/YWsjKg+JoS6mmC55FCpAmphi5g437h2lOt
         r0VeT5KGQHAkF87wR3rc25FhQfoAB2pV9MyONemnDp4QW0TwKtAsSCxa3h+ZcJjtNhfr
         fvOK+gcboA7t4Etx98v/WGOxeDUOvMdgnUdCTwckticH95VBwqr50m25x2FgqSlc6lB6
         hp1halwL6dhjqDkESAX9A9CXfvxBCsoSNWfon0LxRLfPnX6yOjNvu2qAaDQ6MXD3jlcT
         82Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:cc:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BWjaXwHTmoaE6GE1Y70H40jack2uC2pIAKECYf4fUCQ=;
        fh=LycEgnIiWN0ibExISziHl+AjR+yVXPrysLiuxVG9BFk=;
        b=eVRkrSyvpdxPt7lWZLiw48SI/4jqLdGHK1M96leb5NGgNPgkd+JXJIHaXgS2u3OAUL
         J0xfHhpVwcblTK/6IJIGSMgS1rPL0WwQDfG0B4Hr4JtjJ5q6O2oo/gL52WDMpQaACQ8D
         eiz0rKVCgcNMe0K291cjGEVaVlCZdCl7mBGeuCKUJM8Gq6R3pahYrU6PHAlxq8CzLWx6
         xneLqSXz8dsNpheHFLHO9RuqPBm1dqzmDdShg75+S8Z9my+jpRdG++g8O0FmwElzzqaK
         L6x6zdXV7FWNqSXtwFAvwPZG2nx6pLbv0ZdXO6MdMAhKLcAKPm3b2FuMbLKilyrChOkg
         EEFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CmeCochT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a83371si1038787385a.250.2024.11.04.02.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CmeCochT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uTT-0005Xn-PW; Mon, 04 Nov 2024 05:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7uTS-0005XI-MK
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7uTQ-0001gc-K7
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730716695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BWjaXwHTmoaE6GE1Y70H40jack2uC2pIAKECYf4fUCQ=;
 b=CmeCochTokMiJARU4/4RsKv1g7mJWqVZrc7UNfiPa9RMGMZ0Fi1+LJiccGWELbxIUCrI8y
 tvcUy9j1lNRFxZkKUc3aJFv+/LRhVU23Y24KPrR+dbRV3+2iDl6Yh4P5JL++fn4psS5giH
 YsjC0nPszsv2W+nlNDMRhzRxVHnb1t0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-DrPElQOrMW-W5FODNXv_cw-1; Mon, 04 Nov 2024 05:38:14 -0500
X-MC-Unique: DrPElQOrMW-W5FODNXv_cw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d67f4bf98so1838423f8f.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730716692; x=1731321492;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWjaXwHTmoaE6GE1Y70H40jack2uC2pIAKECYf4fUCQ=;
 b=LqpEepxV4lyD+JYuG5oG8hNp/7S07jm1+fhXGd0bmeNouoQ9sGBnLdIOK6XCxovp+Z
 vKPuAUO6wDbaqV3+AHOA1BoUEWU9KRcIrJGpYVLSaV+eJYTKLwGekS4QxClYr0M6H4yu
 lqJ5DGbrYD2hkJewAdiohTgoq12fAbYgz8/2ik1TUt+ZoPRheXxtd3JHVuGpFooVOD9s
 7xgUZLxsG/XAl4pFLAkVv3r8tqNoruI2vzU9OZP02/RHAbJKL9d/oIPFdngFvN940klG
 YSnXNZrpTOuaZDRa3qR5XFctuFeuiDHLsVvh7roBnrmgA77qGNa/3jZX/NFJtYMnBwBH
 k7Bw==
X-Gm-Message-State: AOJu0YyZtfodpU/IYwb3jzKw0P4exdMppTjrtKx1lB9qqqKoqaEwHARp
 gOtBpwFXaZ6+bMMQFOv37ivAbSd3iv1MaO/L4Ir/5AgPpsLlqOOtClpASEyaNIy2hvCAXIYmo0S
 RqggtJ1j3HLRqNZ25ZGmD77v0YtbCyvGZ8iZgLo0h/7FP4KZAsnCQyCSe8oD+li+WmPS28lxslz
 J9kHmvG7F05Eybi8aw4FJVd2jM0FQ=
X-Received: by 2002:a05:6000:e88:b0:374:c847:852 with SMTP id
 ffacd0b85a97d-3806115ac8fmr23239862f8f.29.1730716692046; 
 Mon, 04 Nov 2024 02:38:12 -0800 (PST)
X-Received: by 2002:a05:6000:e88:b0:374:c847:852 with SMTP id
 ffacd0b85a97d-3806115ac8fmr23239839f8f.29.1730716691564; 
 Mon, 04 Nov 2024 02:38:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:ecac:5b28:cd98:868a?
 ([2a01:e0a:280:24f0:ecac:5b28:cd98:868a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d2bsm12854100f8f.16.2024.11.04.02.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:38:10 -0800 (PST)
Message-ID: <d69c9a35-8044-4b04-ac8d-6d47223a961a@redhat.com>
Date: Mon, 4 Nov 2024 11:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/10] aspeed queue
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241104101501.2487001-1-clg@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gzuKxY+rXTgf

On 11/4/24 11:14, Cédric Le Goater wrote:
> The following changes since commit 92ec7805190313c9e628f8fc4eb4f932c15247bd:
> 
>    Merge tag 'pull-riscv-to-apply-20241031-1' of https://github.com/alistair23/qemu into staging (2024-10-31 16:34:25 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20241104
> 
> for you to fetch changes up to 8df5fd815e841bf33fb51e1e6e5be9c31d529b94:
> 
>    aspeed: Don't set always boot properties of the emmc device (2024-11-04 10:12:02 +0100)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fixed eMMC size calculation
> * Fixed IRQ definitions on AST2700
> * Added RTC support to AST2700
> * Fixed timer IRQ status on AST2600
> * Improved SDHCI model with new registers
> * Added -nodefaults support to AST1030
> * Provided a way to use an eMMC device without boot partitions
> 
> ----------------------------------------------------------------
> Cédric Le Goater (1):
>        aspeed: Don't set always boot properties of the emmc device
> 
> Jamin Lin (5):
>        aspeed/soc: Support RTC for AST2700
>        hw/timer/aspeed: Fix coding style
>        hw/timer/aspeed: Fix interrupt status does not be cleared for AST2600
>        hw/sd/aspeed_sdhci: Introduce Capabilities Register 2 for SD slot 0 and 1
>        aspeed: Support create flash devices via command line for AST1030
> 
> Jan Luebbe (1):
>        hw/sd/sdcard: Fix calculation of size when using eMMC boot partitions
> 
> Patrick Leis (1):
>        hw/arm: enable at24c with aspeed
> 
> Peter Maydell (2):
>        hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
>        hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ calculation
> 
>   hw/arm/aspeed.c         | 38 +++++++++++++++++++++++++-------------
>   hw/arm/aspeed_ast27x0.c | 33 ++++++++++++++++++++++-----------
>   hw/sd/aspeed_sdhci.c    | 40 +++++++++++++++++++++++++++++-----------
>   hw/sd/sd.c              |  4 +++-
>   hw/timer/aspeed_timer.c | 15 +++++++++------
>   hw/arm/Kconfig          |  1 +
>   6 files changed, 89 insertions(+), 42 deletions(-)
> 

I just did an update with Philippe's trailers. No code change.

Thanks,

C.


