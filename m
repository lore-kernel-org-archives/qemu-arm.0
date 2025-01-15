Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3232416njn;
        Wed, 15 Jan 2025 09:33:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5LADpWR5mA0Vfn1zUEUeQGjhZ4ktanublpO2/VwG0mfApE1N1I55PAwKqeJ1XpRJKwk+5zQ5YiCTWRg==@linaro.org
X-Google-Smtp-Source: AGHT+IGlW7kyUpIvssCCJPUx6FoJvOyI1YGp0+LpZNivpmIupy360iUUyexhE3mJDdFG+UfySj+4
X-Received: by 2002:a05:6102:32cc:b0:4b1:130f:9fd5 with SMTP id ada2fe7eead31-4b3d0e8d56dmr27357273137.19.1736962382393;
        Wed, 15 Jan 2025 09:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736962382; cv=none;
        d=google.com; s=arc-20240605;
        b=enj7s1pRXfo2U+mxzlDsTy3e94tZGNszKy6eLkpDJ1+rVZ41VNROqjJNtC6HI83v5/
         qTFOLoU8lblV9ff0zWIe1zJ2fJ5F9A2xacjTAVC7y9OI3WE9/PFlZ7Sa7UB+Q3foLz74
         4m5ziMGleGhofAlzTUXgJANvPtEO02V+qOQsI2ul9fvZ22SPgVUii278rJPLqkrSp9aB
         wo/RrMlZat/zE8Ri9RfczY3WvJLgCJLN0d19+5ZNIt0NMPWoMhDktrkuYCGsDrI5SBsg
         DtktX7dbqOLeRwm7xbtz7qg3a/r0z9jwASqY1aDqAAXL1mArCKWQzDSVpV+hKymLfzCt
         lAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+Ft5U8VVuaEsimzlFboErHIb6kBB7IDbWnNaumaMfhc=;
        fh=rHG+1CGCO44c9R0RRI8m6fjImDW7Bi3oimYwHzKCSB0=;
        b=ZZ3RxHYrBkdC9YqgiPDRoPSdv1qoWZS7cXCoinro+cjVL5iHqjyut7fnydpeHDwheX
         5gnCDZYq/MfE+VwURezFY7Or2RBwD/jlgge1hkOyhNxo0d4DxT10YfXdeGRf4Law7fwa
         ldNZffVqdXEG57Y7nfZz4QeNVWAYeTdB5fqcowdd/uNX6Xl/MAIaXfTs5iDtDPS7CG/v
         oInX0z32vl9BLHTlB9oTYUmGu795y77kNQWttHaNSvS1Fug97j1J4RgG51b3YNFkPXac
         +cmohPDBSaGyX9nyAbsBzuXajH2grnHnksfFNNhivq/2T7phyGq++wwgVZHXnnniFuOR
         CkIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rii7OQfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b608fb2f41si4287204137.140.2025.01.15.09.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:33:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rii7OQfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7Fb-0006F5-TP; Wed, 15 Jan 2025 12:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY7FZ-0006Dp-Qi
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:32:18 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY7FY-0001RZ-5p
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:32:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso7390295e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736962334; x=1737567134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Ft5U8VVuaEsimzlFboErHIb6kBB7IDbWnNaumaMfhc=;
 b=rii7OQfmTqLo+7YZT+mIFHJsPv5tGF/aM2wkEV1JEBqpueHa0rtNoooRnWRCvbrHvi
 7ma/SrAWyX9f4tkAzExopKDM3mp/lz6vYPTZJnFGQ+Y9frvNl90wjmzPa/taV1I+dZ1w
 3q/aZrwNyBM2r/ywhuJkmApW10jZh7TcNSLATHWXLtSvAQpdL25IePKY9iBo6EwIpBaK
 8VL4ig5AKMMRjhkXNCj9aE7y20EmDskPLvorzjq2lynv7pZEko2EogF9Va1v7eoSJ2xG
 7Il4BJyONIIyBqLk+kNw5X+NyqnchEWhxl20HuTdAMJR2EBGJ6LBcUuVWFIhv7x1sGm9
 yHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736962334; x=1737567134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ft5U8VVuaEsimzlFboErHIb6kBB7IDbWnNaumaMfhc=;
 b=fTh76TNDPCT6VVBllXhNSFYE96DruPul/AD5Jg35nek4TQiqvMGQ6KPWOARHFLVvAU
 g9tIETffoDgBnjx02nI01I13gKfM7jrx5za/zhn93fsn44++mlAinhQX588+cIrabZgL
 NybDiiwHju4Gz7kCAGShdzM/bkCTN/RTBPEWiiOQS8riq/siqg5W8Zuj35zWro1HYOGm
 ZUVEr0sSw4Tom4k2Ebta+RShdkQ3/GlrPRjQwP6o5dLPoKOV70lUmERnAJ7asu5a4r4E
 AXntrnoErwNtP32hLyCc458AR9sS8IMFS/1hS0RFT4AC1OUr7lTmOj6/vHVhyB5a+rFh
 quzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSZRvznFBX962pK9rDSg/HlgQfjjrjd0qKjzheIQV1id9Bni2dY5QrdU+jt0+sF4dWS8wVTEKNgQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOxMK2dbtbqZE3oU95kLF9U4g24rgiLJYhhyPKOsuUueLWlSbZ
 DDvEKVVPCBYO8C7DIW26VTYk4/C86heOW4sDMEvoAyab1mlcvy/Gsfx1ojhTjJ0=
X-Gm-Gg: ASbGncu0p0w1gr4UouMs99zP2AbB/gLH5Faed/OHl/QQTsDf8P8awKba7BHmMDwT7Ys
 XRyOeMEXESHKNSbSBOjaARHxswUcTzAwRbaBe7WLZtIwsRABpBMQAjEwU87hYkHfk5E+GnCsTCl
 GPMukgFZeZMs0QF/uzJ96Zw8ozC+i3jZtGeFGNF4jcBl+HzeE7WgZvkKF/90CJwnjEJ4a/3JPB7
 C6aMoi/TmgLbpzMdnd792BTGV88JBn7B8PRrpju0uEOkqV2e5X5IAV9F2aCx6eaXOikzHm61U1j
 rlM7onFpQm0ySX4LL/NQ3maBsos=
X-Received: by 2002:a05:6000:154f:b0:386:32ca:7b5e with SMTP id
 ffacd0b85a97d-38a8b0e5092mr21285131f8f.16.1736962334461; 
 Wed, 15 Jan 2025 09:32:14 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3838a3sm18290886f8f.33.2025.01.15.09.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 09:32:13 -0800 (PST)
Message-ID: <8e61492c-e293-4bea-a0e0-e41d815d8b47@linaro.org>
Date: Wed, 15 Jan 2025 18:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] hw/sd/sd: Allow for inverting polarities of
 presence and write-protect GPIOs
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Peter Maydell
 <peter.maydell@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-8-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250111183711.2338-8-shentey@gmail.com>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VByP/iSUSZWx

On 11/1/25 19:37, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sd.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

See question on v1:
https://lore.kernel.org/qemu-devel/e202623e-eac7-4ed3-87fb-002491ddf745@linaro.org/
