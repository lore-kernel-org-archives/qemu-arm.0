Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3990184njn;
        Thu, 16 Jan 2025 11:40:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcEY7N+X11ANLfh+7nfroYXF2pR3b4ZTi6oAHkleoGwmlsyC5QJAfzEt5FYF/EjaFxAUMt0+l8FHVCUA==@linaro.org
X-Google-Smtp-Source: AGHT+IEhb17cPVG+NWbEZLsWpuZrr80+ZA4bWlV3A8KtkZjjBUi5Bp4z4/9h/nSv/Q0Pcur7odnz
X-Received: by 2002:a05:620a:43a6:b0:7b7:142d:53d2 with SMTP id af79cd13be357-7be63248004mr12120985a.41.1737056447896;
        Thu, 16 Jan 2025 11:40:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737056447; cv=none;
        d=google.com; s=arc-20240605;
        b=W3X2EqFt/H9Cld3vCthFZqvCAv5T4sX6sjauJOY8vwoAfvR71mRA9pvBVrbnC7eed4
         qHTEj3HmFQlP4eia/RRTTuiINF7dYLuacl9bfh2xsStqIIWReak5bl/Nc6GJI0gdUqjw
         iX7sRZgTNlSYasrdJtKmhNPh3oLJs2AeXJVQu7qxjk+tamqHKR1TxJrC3zQopmAzNaka
         r9tQ8Ms2NnNp3dlatIMxFIHJ/ebSk3W96vb+ugtYJmSBtlMziJRqRlWTIf+sphSFWslZ
         OBmaPRqeogttLVHwZyBtkmZkbn9Mpfra2RxYfYeMih2UgYmVjMGxFsd7YaTsL/A6otH/
         Ka9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5Pb7Smwf6seMA4zYHwQOaOR5Jyh/xvxp55nq1H31t8M=;
        fh=k3yrumXYqYKCAIAaC2IZE4cBfr5Oag/0W9LDvd1f+ds=;
        b=cieXihz8GMfC4S4VV/e78HgKA/bZzUy1vRcXNddTZ1To/W4nJAmGbxP6iBZzm+G11J
         iMfVmDGzngM12afUl2iYJ7Rp2NnhTKefiAMVM8SBChJZoJpcyaXfNk1Fqza2/5XR7oiv
         x7YRpp0F3r38zvZ2UkOOAbQwMLy072Mo/vjJx94mjqPtIXT58FR6Y1Is+A/yo86y2nW+
         /kelRYk/+9X3HBvl36MYdwyDIDjkFm8Y8QWmL8pqjrxPuzdHL8jcF1iF6bbByGdtzP6O
         +fRl8yPHjAEeRW6QLjOPjN430f5M6yZ9DZ87n9ubZv7RvgUBMDWYwsaO0dFsVjqqctEQ
         Mnwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cxdBAyGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614ee493si71766085a.501.2025.01.16.11.40.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 11:40:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cxdBAyGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYVjK-0001hv-4m; Thu, 16 Jan 2025 14:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVjH-0001fd-79
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVjF-0004K5-LM
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737056433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5Pb7Smwf6seMA4zYHwQOaOR5Jyh/xvxp55nq1H31t8M=;
 b=cxdBAyGmA+BdNUw4ga152qakfaEDPpXOWsi5nqVr3CqJDgbJ4mL3XOLNMnWrJu4UsAUswB
 lvfQbsEHCnTUDzs1p6JMYI0qXOoXGQBxudU1pmVmg/2BTWJQaln01k6f3m8QKlfljg3U/t
 QI8u2bygLw89mOYqmS+QcGJC6cgYYq4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-5hiIINbAP1WRek0gSE8M9g-1; Thu, 16 Jan 2025 14:40:31 -0500
X-MC-Unique: 5hiIINbAP1WRek0gSE8M9g-1
X-Mimecast-MFC-AGG-ID: 5hiIINbAP1WRek0gSE8M9g
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so3981365e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 11:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056430; x=1737661230;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Pb7Smwf6seMA4zYHwQOaOR5Jyh/xvxp55nq1H31t8M=;
 b=TWpoAa4TlyHpOgWOW1HlBkVznPItfv0GKTeNi6nzLI/dfRywdDknr9ff4Zwu9QeJ/p
 DAFR6IDEDFebv8c1qq4nmY1T9aC9PlITulng6XcNLm1qgxsj7jK8pRlJPQlyELNKiqbr
 +NQGh/zpPwPmwrhgG6jAJ1m2QhYHJeb4y/pWWQg6bWAxlFk7TKUi9HAujrjO7avBIzRh
 2D5FNPtfmk+Eykj74teIGW4PO1isSQ72G07ism8G8SYNmB3DXKxUDdVFasJ9lwxQEZkv
 Ii6/1GTPQ7pykubSHnd0sJE3r1WHibrK4Kn+gbZ75w6MJ4Y8iWoM1n07Xzh3++9DIpTu
 e5XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGB2U6ZsX4YNBm0Caj4vzpE2OiJAwdQzFgBsa1/Hbmda7IoxAT8EC8JR1j7fkm5qpCSiUCgTxEvg==@nongnu.org
X-Gm-Message-State: AOJu0Yw3YrIMNjLH8CEMkhNGe4lI+oG5e2Rd+X4JzhWe79cGw3ZZ9VOx
 Q2SrXKYKELg40KI6ZNxFE/xwQ2ohkwE2JNkhRNPQHfoCp6+sRptny07iXeqd/uhQpwqPhaFVvsI
 3WH2gD3iEvmJ3dB3s2s/qfk594SecwDTzTSx6tashx6dCr1uTvA==
X-Gm-Gg: ASbGncstJZppcJAGZMhS0q5xK3WeioSbYhgOKFM1RL4F3/KaJfpxBIIQO4NgmtzKKno
 JPKPPxYnngrN9q4ncO+f8e5LW5xOmKs8x7Q1hhlwH4MPitfSTk7KkJu4ofdQZJpwSTqWuaUrqz4
 DT0/CKJZzV1cGf+XlCblUgbo6iKxQg2x8CwoW9eo/K5ODKG0rhVU7CgWMo8fyogcrftHPIqAEyW
 Z+FGSuF1HkR5pZkKV5JCUjogcYRvRVBL250QflDwzAUWt8/Iu/9m+RMm8zfVRGOjN9PXUmRhgx7
 +sbGSIo9ekTz
X-Received: by 2002:a05:6000:1864:b0:38a:8b34:76b0 with SMTP id
 ffacd0b85a97d-38bec5489aamr3745343f8f.27.1737056430665; 
 Thu, 16 Jan 2025 11:40:30 -0800 (PST)
X-Received: by 2002:a05:6000:1864:b0:38a:8b34:76b0 with SMTP id
 ffacd0b85a97d-38bec5489aamr3745324f8f.27.1737056430349; 
 Thu, 16 Jan 2025 11:40:30 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c1664e8dsm68858015e9.1.2025.01.16.11.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 11:40:29 -0800 (PST)
Message-ID: <7369b3cb-e0ad-44ca-95bb-887ed000c563@redhat.com>
Date: Thu, 16 Jan 2025 20:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 08/13] hw/arm/virt: Remove deprecated virt-2.9
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250116145944.38028-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -dctViFM7kUPsfvv0sZ3S2nL_nCE9h7Hj4zy5YqFJFM_1737056431
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: DxAYwjg69bz+

On 16/01/2025 15.59, Philippe Mathieu-Daudé wrote:
> This machine has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

