Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp223824njb;
        Thu, 30 Jan 2025 11:40:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8elDDL86u1+6R0TRd615KAQEL08Giv8xUV+JBoiOU/q9SvEmO8ERwCftE3gsX42B6j3umbYs6wcQ+vA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVfc1VobWMYxRlUzFhLpjEQXYz8qUCWKV65bCgJ1pDZZdbOW5R4KA5bxe9Xm4m4mlb8VPy
X-Received: by 2002:a05:622a:410:b0:46c:79a4:5574 with SMTP id d75a77b69052e-46fd0a7fdb4mr120150151cf.4.1738266005427;
        Thu, 30 Jan 2025 11:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738266005; cv=none;
        d=google.com; s=arc-20240605;
        b=j8AgGO3pjpLTx36U+tot/gLGM1xkWwyPnBIQG23ikDTIMO085tKPIVOzyIBrbFPfN2
         56XJvrIvwoSGVwKlxfuBu81Tp9u9btK0jw8/YGbX8P4TEExbq/mM+/oJkLo+HgFsQ+Uk
         A174OFqIHPPqVhbGoXpBZufks/8LaJcmZwimgsMlq9kyCz4n6QM68afrJbQyzK+Vmgko
         jYqIEiuVSGdL9z8FOG3aqCYX9AVGzrRWXDq9/V5bL9OmhaLfLaR3WYydDQPwTn3wgYNL
         EXwjbX2y+RWRRQY6tGGTfNnHkYr5tAxD8dbhiJV6XBgRs0o0U6ryNq4tg8QI+Yqf0pPG
         fbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J1PxNw5hGSUL2fGaja8I+hNFWdNicgYAu3pXwQKprDU=;
        fh=Ci2AiaWBDRMl3HmD4JWc2vCqYB9Ogno4qECIzoOVW/c=;
        b=TmvMzPS30NuTZnWKg/i5fqcE/FLD19KIvTF40Q/qS0C9QqrtrwXE+l8WXOuzVGJLzU
         0r3eF7Wy7glFuhdAPpt20kQWWY4Woekhq8yHatZN+mxrxV/cadWnGuBBsOHJenWVnERc
         4JCVNWlEPPrWwAfupMCmFTe1fv/aRUZCnYHLWlPMv4uEOq/2oOAsFj6LfvmCVXHwF/4/
         z871PADUCiptW8UkycwFaiICLGZCb/DhINh6Sz9R1/ISTlLmn8YaCpKJlG9cDUz5T/U0
         FlYx6UTKXmi7Skkuyfat3/rTV5MU9Sr3d6sLYSr04F7GxrF8vYP6uB8kH6+KTzSwh3ON
         1C/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHCPRdUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab79bsi22436691cf.3.2025.01.30.11.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 11:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHCPRdUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdaO8-00054U-7J; Thu, 30 Jan 2025 14:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdaNv-00052q-3P
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 14:39:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdaNt-0000kd-BI
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 14:39:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso8832945e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738265967; x=1738870767; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J1PxNw5hGSUL2fGaja8I+hNFWdNicgYAu3pXwQKprDU=;
 b=gHCPRdUl0JNu/Fp8U7JxGKzrVRBulNZfL1NPQjI3dOt+dkr0rFptQ/9XoQUl4HN6qY
 mXrQ/zvF0+fAibk2xRBkujsnlgaVff0iSIVbKAH2nXFCk06HYtvrSWFaDCprMcB5tM1c
 zp1j/IbAC4jw4vK3iAtLogfOmcoFQ8WP1TFRleTy1bS+uFVdBNOgZWRKcTBCSLmj+Moj
 k5G2myOgGPtM39O0Bi7xDI4lVh/MYjNH0ayuE0pPd67Sr46XsiTKeGAdsm9CX6ZZ+bfk
 msOKNnngdiFwcmarnRcNofUVYNCx7i5tJGzrxqdffcoOzeyXIu8VWWiwQvNpEAB9Qrdm
 r3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738265967; x=1738870767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J1PxNw5hGSUL2fGaja8I+hNFWdNicgYAu3pXwQKprDU=;
 b=P2RUANROIoi2ze1ZzTnUl1gSnV2cH0uT0QdW9yQoge114C5dWA+ctKV47kwv92QQWd
 hzL3+hkv9SABWArmsp5CpoGllKrmMqUiT6mKIVTj38Dym7OrKoHuUoJzg04I3/C5a3kX
 sfFllPvqc9aAyvtgPgpIS+eoC242lM2Q8JqDDQlh89yVpQUuonemQKNIPcurwlYY7mMf
 lL6SZV9apy37M3Fq6tHbSskoiobU0KiBwXZaQfb7eZDKSInU25/BJDSacvIMI+anH+JY
 zJzBycKVLkmcVzgmsDqI3QK7vALIUXsrpPyFPpHgJiSo3vD0Cxu39Kf23JsbpS+9e5kP
 M36g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ACYjMqH02OVAP8zUznVoDdV7vucCO6FZx0gvZ2xmCaKfoBjf+QW77SPS4YHs1214TXZT6byfbA==@nongnu.org
X-Gm-Message-State: AOJu0Yxs7ptMumoC31MZGzQ1bMeupuE4T4E9luNMwVQkwSL8l7fLmyeS
 2Buoq0mMBN/U9M3Hn6b3umgiKGU4E7zkp22QlkITludc7wLKKCe3n4rSrA7nnD0=
X-Gm-Gg: ASbGncuIoEWxddHL3GEUzngGQ1saJQ6GcKVJ52bAbgU1nPcNhApekWYG94SRyU92FpA
 IJEmBN2memrWCbEMZkYMfz5M2SyX2UDuUfulQHiYJD4OJn3R1lesBq2RUh7cd+1P2Y7M1HFBvft
 1r3O/nmDd9uczK5C395wp4AYOrBdkBeyDe/c632yfIbj0akubYUL21X7A5nauRKPIMDxi8i5Ya9
 zTPfXtH95RhNhJ57cIjaAPmqjK3TI8wqRu9S6U7SAp0lRcvoa+NITkbwHjnVeJd3mT177gAY0Lw
 gPTSRy6jif8uvVkqH9wsRZwobZIS5fCO5ZZh5a6Yfuo7ccuepugH0qWPm3o=
X-Received: by 2002:adf:f382:0:b0:38a:41a3:218 with SMTP id
 ffacd0b85a97d-38c51e92ab1mr5386243f8f.36.1738265967294; 
 Thu, 30 Jan 2025 11:39:27 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244ecd6sm33900525e9.28.2025.01.30.11.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 11:39:26 -0800 (PST)
Message-ID: <6aaf2d43-a52f-4392-93af-ef2173493be7@linaro.org>
Date: Thu, 30 Jan 2025 20:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] hw/arm/exynos4210: Explicit number of GIC external
 IRQs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-3-philmd@linaro.org>
 <CAFEAcA__VjxHZpFqhnYYU+gV2hg7V-pwq_2ZZSVBQDheSmTvDw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA__VjxHZpFqhnYYU+gV2hg7V-pwq_2ZZSVBQDheSmTvDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: /j7TiawDfJdH

On 30/1/25 19:30, Peter Maydell wrote:
> On Thu, 30 Jan 2025 at 18:25, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When not specified, Cortex-A9MP configures its GIC with 64 external
>> IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
>> configurable"). Add the GIC_EXT_IRQS definition (with a comment)
>> to make that explicit.
>>
>> Except explicitly setting a property value to its same implicit
>> value, there is no logical change intended.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/exynos4210.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
>> index 99b05a175d6..75d6e4d1ab9 100644
>> --- a/hw/arm/exynos4210.c
>> +++ b/hw/arm/exynos4210.c
>> @@ -103,6 +103,14 @@
>>   #define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
>>   #define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
>>
>> +/*
>> + * The Cortex-A9MP may have anything from 0 to 224 external interrupt
>> + * IRQ lines (with another 32 internal). We default to 64+32, which
>> + * is the number provided by the Cortex-A9MP test chip in the
>> + * Realview PBX-A9 and Versatile Express A9 development boards.
>> + */
> 
> This isn't the A9MP test chip or the vexpress or realview
> board, though. We should be setting this to whatever the
> exynos4210's GIC is actually configured with, or else saying
> we don't know what the right value is but this is the
> one QEMU has always used (i.e. probably a TODO comment). Those
> Arm devboards are irrelevant either way.

Historically this is how this board ended using this value though.

I'll reword the comment appropriately.

Regards,

Phil.

> 
>> +#define GIC_EXT_IRQS 64


