Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6318745njd;
        Mon, 7 Apr 2025 05:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCoeSAC0ZBgGiYPoDB+3EEj/LCGeFefWTKnkxF5xqGm24PwMAC6bZ8gLnVXLZDvgHxzjDdwZbrFQgnyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFm7feadCeQaIGfuxCjrkIV0bUrnZ7n50r2ltuzo6liv9o0aWsvWW9h5v8v1oYiF38CBDKU
X-Received: by 2002:a05:690c:6b07:b0:6fe:b701:6403 with SMTP id 00721157ae682-703e154ef06mr239539927b3.11.1744027546318;
        Mon, 07 Apr 2025 05:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744027546; cv=none;
        d=google.com; s=arc-20240605;
        b=JcUSoQQFkRHcUTeimSUg77ThBvvz6tj6G4SQC1GA6uG3Pz42Vu38QDubpe6qPSVruw
         iAKHb9N66eCZegLUHlD4YJ304iUComG8HOcsMl7k36SESCeGqmw4NR7eVK6IIlnX3EQC
         RcQ6OXlqcnLesFqVhR4uPz5HzQ+QluD7GPeZEeC3TyY0P7GBXEXRwBSEsNjmzr/Mw+vu
         2MaBn8WPU2WUQdqqkryk8F4fjNc+jld6C+qugjDiY4fn6/oFegkT/mQ+LJcpo3ROwHnj
         dodYw8pVHzU84YobDnj1251SAG/YOv+hSn4Qs5yxDs7wVqQhcKyrIbTDgM2Y7r6S9+ZZ
         QPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nvQUcEsgAl0wseJe4hxDdxpZFF+u6HEU4sgyJ3AAZis=;
        fh=29b6xraWjhiPvpCGVjyBJjNekJtXCMAP8jDsy6eW9ZQ=;
        b=EKcOJsPT4QWohnRoTZ8CrrHm0kyqN6QDyGzD5KAhZdbz9GkQ7luTHDW4HjQ4eg2mzx
         JgEAtZVNKQukq08i+ns3Bm0mgzdJwiDU3WQwHL2sl6ZqhryKqt49F1xkbBI4l9U13R8F
         kok/fdv7C5chyV1TR7KXHQRawN50P5RohQD5kfzV5rCwR55qcTukezUx+W7MPAe/13oB
         bGSHoJvBiwvCYdFEUkwCNTJcDhOgV/Tdyqk4BcCmN0BSHXm+AnC8NbIUDeqmLZu0sI3m
         q6fUfLNdbpFxMPR5BGKmEzuRmtDyW5m6s1UmYSvVPKkK0gl5xkJkqeBJaaMfM6sKdkbe
         GWtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIBK2qCS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-703d1f9b714si142139067b3.275.2025.04.07.05.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIBK2qCS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027545;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvQUcEsgAl0wseJe4hxDdxpZFF+u6HEU4sgyJ3AAZis=;
	b=dIBK2qCS8Z562of3P3NkPvyxNyMnLxQJkHpCvAKB5in3tUjdWRcPfiWJbTJ01CuGve+xa1
	Z8yTMhVBRecSJpfNtIJz88KApJxtj189QaslKljgnABJYm2xRM7JWR9s/xBP1vTu66RlY1
	xiAdd5XGIFVnPSXJ86B2Ju4zYiusgfo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-35ibqFijOqeSH5EOo8NE_A-1; Mon, 07 Apr 2025 08:05:39 -0400
X-MC-Unique: 35ibqFijOqeSH5EOo8NE_A-1
X-Mimecast-MFC-AGG-ID: 35ibqFijOqeSH5EOo8NE_A_1744027538
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c30f26e31so2845174f8f.3
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 05:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027537; x=1744632337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvQUcEsgAl0wseJe4hxDdxpZFF+u6HEU4sgyJ3AAZis=;
        b=f3/jiuEbULiMDBx4PT15GpVTsL9muW8WV3eD9N5uyX2nMpmDHDb6jSOovFZWRncHWf
         FYnP5lBdy8xwLlijtUJ74r+ArNoGrqgz1q0ZQnwOxqWom7sGH5wns2gL3ZgwNNFpPhJ/
         ij+HkKEbsSB3QEjtmAtaMXyUm2du0kDF3kY/5jkuDw4CHGTifk+r42ss6sqanyFrmS7T
         79fVfS644SUQbdVcvkiybpKpKQiVCqxZc2ZNdnhd0O5L5GSwcbQh/3zaJ2BsogU05SXp
         LskrgQYpJh6TRxlQyrtfg8VeCVOWs2OJ//qPPYzxcmxnonGPuvidlC25130gg3N3uGpn
         faJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIRf3U5Szij+bGyP00LCw/h1gcB0Wqlh8XYRjy4MQW6jkopSB7uBEwKWaNRWT8HZ8qBKC65iUc1vgHrw==@linaro.org
X-Gm-Message-State: AOJu0Yy0OuHakVI3TIm5CUFukFGndF42CHtRuDXCKdCVKDGBB3HB0YWi
	zq1VbKaBPUX590MxXIBo+iHYvJPNyVqCC7tJflRvYyfGzPOLoxTltsA/+fGT1EW4ouoc+k6MdXc
	NIF28dg9+ExyVjor3ffMKpg/Jx9YCpztuJCwLeS2dnUtKr9U+GiUv8AiBSLIWyc34
X-Gm-Gg: ASbGncscvqF+WIAPCHWqip/AXTZRlf38V1zK3Lxv6WYA54m2XWJz4jJxH4AqPpXnoru
	yDNIK0TJNScAZXZ9JPhp2k9iHSf1vmxPngEnp3ivSCzSF/pLyp8rNujcxuVGhu1i6pPa8vj0i+o
	+eVCaigTB68rfLJdZ9ObdxSnxC7b4fVA3zDZLJDQiKGIb/BcNATzRX8cceJTEa/0Bu3vKR86vv2
	GQIEi45Whm/Xi+YCUYw+bFSQp8dI83dc4ML2ja5JzvrAJPtxsG5l+o88GqNDJ3Vb0IkrKbl5ahu
	FLSgp71gl9wy+Yi+C5vn/UuU4MzzeB+E6dOOYjyoF5j3D7reotAXsFMKvYt3w/8=
X-Received: by 2002:a05:6000:430c:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39cba93382fmr10231751f8f.23.1744027537116;
        Mon, 07 Apr 2025 05:05:37 -0700 (PDT)
X-Received: by 2002:a05:6000:430c:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39cba93382fmr10231702f8f.23.1744027536673;
        Mon, 07 Apr 2025 05:05:36 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm130839775e9.9.2025.04.07.05.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 05:05:35 -0700 (PDT)
Message-ID: <3cb05082-cc4b-4de2-aceb-40c3c6166a62@redhat.com>
Date: Mon, 7 Apr 2025 14:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 3/9] hw/arm/virt: Simplify create_its()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-4-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250403204029.47958-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ExOCtxrNDlXH0LtZCZB9F2Nwr0nPDdnFeLZhqQiFhfA_1744027538
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gy80rhfDApw3



On 4/3/25 10:40 PM, Philippe Mathieu-Daudé wrote:
> No need to strstr() check the class name when we can
> use kvm_irqchip_in_kernel().
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 177e9e0eadb..326986deb16 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -711,21 +711,15 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>  static void create_its(VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> -    const char *itsclass = its_class_name();
>      DeviceState *dev;
>  
> -    if (!strcmp(itsclass, "arm-gicv3-its")) {
> -        if (vmc->no_tcg_its) {
> -            itsclass = NULL;
> -        }
> -    }
> -
> -    if (!itsclass) {
> +    assert(!vmc->no_its);
> +    if (!kvm_irqchip_in_kernel() && vmc->no_tcg_its) {
>          /* Do nothing if not supported */
>          return;
>      }
>  
> -    dev = qdev_new(itsclass);
> +    dev = qdev_new(its_class_name());
>  
>      object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
>                               &error_abort);
