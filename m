Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3537780dlj;
        Wed, 15 Jan 2025 23:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWObg6rBgfh8CLwJ7fJEPORL9cB8Pf+7Pb4KKipHyv9uepYBXYp7R7Q1oFTRuo+DkJ6hmcx2yENnxH/w==@linaro.org
X-Google-Smtp-Source: AGHT+IHbsCCquBJKLTLzBYDa38cLlpBNcQV17HI5SEUoXhbqbpSYUf43cBa0CUiYeAI0Oq6OO5m5
X-Received: by 2002:a05:6214:4303:b0:6dd:3c07:ae48 with SMTP id 6a1803df08f44-6df9b2fef4dmr558763136d6.37.1737011450049;
        Wed, 15 Jan 2025 23:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737011450; cv=none;
        d=google.com; s=arc-20240605;
        b=JWNSyfnDb67VnwYOutadPOqs+ut9GG7weyz0UjG8rN3PRCM+Au5A0w7dbUv7+k+PCb
         2q8Bwmyzwjdg/fIB4YNkJWUImC8mT2Pf0FMAzCgyCS+yCiwgm3uFqD16To3BxA+w8NO8
         u3uEKGl4AN4DhvQK94YM+pQQK9wRYiRCjBVEyBuonOK4dvkLOfllUnR5fJeVDB5axwtc
         bYeBsGNqoPhyKTSWZHYfwOHEB5bxtkMNDmObzMZr8v+37gw4TIEBOtUQRyLJ1Z0BsTak
         dM6f1Y8XtvHZlotqePyvb88hNEau+9vdPupxLaxEfoOEq4K9LSam7VEBBZloziiudQd6
         DE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=QbmzBs804OfYFy4D3zJiKtNLjooHXoDjwfYM1/+0Oa4=;
        fh=fAjVRsJCZX/2R23UXYARK+A7ryhXXNCzUZpvUI4EH9Q=;
        b=ATtHRuwGdh+ZZrN/yp5suNMhYKmdVILtBJ31OLgMHsV61Lg8rP/qA1/RJyMFL5U/Sy
         AA4A8FkaJYkg4PwhZ/850nJ9i4pCsqDpKBK0ynbk+6oexZ4guINWdaiGDYvnGBvRGI+V
         GaMMcTt3jdeGPA32GzeRb+Us4OtfbbrvVs8GTRv8UOY9piz+qxdUpo5MK6QHLKKkSRXt
         9Q0LWH9Ny0Vl15UQ+Vni25G4CY1f8jPpPOzMqNrQruDrJeQ+hVatY/yfjagP/Ls662sU
         MucucefSc1rbSLqsGr9Rc2P18drgMiEWLvQK/hrodavhGlhEJKiJI/3Hqoa4vyGY0z0D
         E4kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e1ruDc1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e4ac1si163684401cf.316.2025.01.15.23.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 23:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e1ruDc1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYK1S-0006Up-Co; Thu, 16 Jan 2025 02:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYK1M-0006SG-Fp
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 02:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYK1K-0007Fm-Me
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 02:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737011424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QbmzBs804OfYFy4D3zJiKtNLjooHXoDjwfYM1/+0Oa4=;
 b=e1ruDc1CyyDjkpYQ6ms5jPbhfscE3DKTUIwoedgZY11z9ufUIS9F5ue8TWwnPa4SgW3cxf
 f6LsKkNmbLzZJWIlA17NIl21nfX4gHI5EL9OCCODHundAcLqR3i+VKnZKTFrOQoQdsSghh
 eVRl/8HtlPHD28TWnc9WqBaZFX8gyDA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-KAcrrmV1M_K6vef6c-YX-A-1; Thu, 16 Jan 2025 02:10:23 -0500
X-MC-Unique: KAcrrmV1M_K6vef6c-YX-A-1
X-Mimecast-MFC-AGG-ID: KAcrrmV1M_K6vef6c-YX-A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-436219070b4so2100915e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 23:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737011422; x=1737616222;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QbmzBs804OfYFy4D3zJiKtNLjooHXoDjwfYM1/+0Oa4=;
 b=oXfkysnMlTCV52IXbR8gDey/i5OwGB4vF61iCZfTD1dB/iS616JVwhcEgfujU1epS8
 HfTUPgdNqUGzRr94k1REIF2+BuikdCKl2Gc65pUt+VIjxQX6cn8WJ0A6ca7l7t+IQGrn
 rXC3nmonES7nQHhYGVA06rY17Y+1Qaz9MZkJVboDZm1xM8AFmEpalo/8xS8zwpRmQneZ
 CoTfy2+BDieHmgbifHsFyzTUf/YwcXUh5o5pnvfOLIHREvGB0RkFujk72a9v85K9+D/8
 zqapanklZaEQoNd5U1VKhZi1puftlynqoe5IuqMFigppsSAOA2sW8AjnV39L+aeEv9CA
 QV8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWtb3W4jTjNlF2tXvGIWa0uiopqmvD4OxY1XU2o2eqVbGHljNR67Om9zXAK6N+ivVusahXJxjyxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw0lG4V5bVA1uhLr9DSZdn1XnmzsYYOTjI0O3MxZgsRy1+/Sn/R
 ccD+KoYYaRJlcMuc+y15T1c+VAO619FYMJ904Cok1XjMuB/47MSlVF3eA5aAjmXgKalYpG+IIbV
 ETbkEwygMBHY08LfZBTftarOL++s+YMGKEEndLfjlXIRRKUKhTg==
X-Gm-Gg: ASbGncsKY9MuA4r7OYQHcn0GZMWI+uG0Gpu0alimp2Abz3AgluoivTbhBKxuiNBiNzN
 JG7zMceGPHrIhwKonGF7B6/1EZHLdemtJkMMzYuA0SuYSkTSdV/BOl7QjU0oO14LWxio5osfVIv
 0dEP9vpAdSsJNXVj01rIqtUBn8j/gaWsee769n9/JFx7uzjx78YNDVy7EsmQ2o27jkupYqTdLyF
 18uGI9R82tlX41Udf1YlOdrVrkM3hRp8LRZ3J8dmQKehX9Sr/ZVLpZBCBxyGAS2Y7puLA+9FfxI
 Zy9sbfvMO71w
X-Received: by 2002:a5d:47c4:0:b0:38a:41f8:8abf with SMTP id
 ffacd0b85a97d-38a87312917mr30444009f8f.31.1737011421826; 
 Wed, 15 Jan 2025 23:10:21 -0800 (PST)
X-Received: by 2002:a5d:47c4:0:b0:38a:41f8:8abf with SMTP id
 ffacd0b85a97d-38a87312917mr30443988f8f.31.1737011421531; 
 Wed, 15 Jan 2025 23:10:21 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bebd72582sm1226819f8f.7.2025.01.15.23.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 23:10:21 -0800 (PST)
Message-ID: <10a885e8-2faf-46c3-8b4a-3483aef91a74@redhat.com>
Date: Thu, 16 Jan 2025 08:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] hw/arm/virt: Remove VirtMachineClass::no_its field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <20250115171009.19302-1-philmd@linaro.org>
 <20250115171009.19302-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250115171009.19302-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WCRhobj6bwzHOd08dCUjAHY5FW8Kh0R1in2jMeehl8w_1737011422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.793,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: EUCYgOeC2PRs

On 15/01/2025 18.10, Philippe Mathieu-Daudé wrote:
> The VirtMachineClass::no_its field was only used by
> virt-2.7 machine, which got removed. Remove it and
> simplify virt_instance_init() and virt_acpi_build().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/virt.h    |  1 -
>   hw/arm/virt-acpi-build.c |  5 ++---
>   hw/arm/virt.c            | 16 ++++++----------
>   3 files changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

