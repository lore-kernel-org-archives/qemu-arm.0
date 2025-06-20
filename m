Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp849321njc;
        Fri, 20 Jun 2025 05:20:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCTQLCuzJKLp0UzsPjKdjjh3oQEjo2g+9yARQ++L+sGBYZAZ5Ml919vas57QgWKJrAIGQHSAojn4qBsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHpYZAULW+9zWSolMfcH8hUYgZLzTtXhRoAF67eOhlFpn0pTp3t2RbSrfJoTad6JbrOwgmX
X-Received: by 2002:a05:6214:2627:b0:6fa:c0ca:c75c with SMTP id 6a1803df08f44-6fd0a5fff0fmr47858786d6.42.1750422058203;
        Fri, 20 Jun 2025 05:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750422058; cv=none;
        d=google.com; s=arc-20240605;
        b=ETbEXDpnnEczxxu7+8xJIqaO+feMDjBvcTyy+fwUCCKloihWBqij3wqwCuEKKJxRva
         5y5s7IfveCuYJrDb7FbcRPo6AsyOxIBNilF4ZB1UC0bcAak3TMpNgq4B6FtXrd0yUak5
         3K+uYGPhbLrn6BHL8XLZXmpAjRo2VwE//J3Zg87R1jrXUnXTVyclTSv0c5mFrXqFaZ1I
         3KBeHaKyqfk2ML8B3HIXUKW+HrPWsibvTPZbsl7a29ym4SHqwEgVr6J3XXincFJJxrCt
         nPzxyDTexpqmlm0WPsQ/ady1t1qE9RmDiuQLEpTInpmuAjj/qKVFkuLjXbR73Q3wUpxA
         2zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=gCDuPbcz51+r9EY5thnNhRDzl+s2DLdA7Mhax7aDjbM=;
        fh=w+XfDObRpXyPCxFVv2XbEaoJEMvD0MdHpvEmmuXuIWo=;
        b=dNvm+Xh6urkooByh8YMm+pJxC/wI/98NhXyvUo8l88q64owQoKhtFpuLERDcl0PVCK
         Zyk5lAN2DoJjpVkCinGw8jIvo/wEfKT95MEvqTQjOq3xChZL3KarvNMixkRmbGCtB8fi
         n5YH5tloJec4x4Z59Ey7GieRGVEsik3ZaObFIT+EMqCjvi6RRzTL19yFYlf/EP7y54Wx
         a1+TQ/yUuPNMnsqxicH78K1zdMWkvQryqy80DipVK/m6x7wtoUZG9iZnZDRlqwIJ/sml
         6kfi/WfkcD4+CKp7zXKR0G4cLD+dD0l/fIj+Jc4MEl0+709z9bX2bP2q/svbwVapOtCB
         1R0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i8IbxwVa;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd093dee3csi20395446d6.32.2025.06.20.05.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:20:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i8IbxwVa;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750422057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCDuPbcz51+r9EY5thnNhRDzl+s2DLdA7Mhax7aDjbM=;
	b=i8IbxwVa3/DkxSYjrqcP23XGedoWUHD1yOcL1Z2wgwok08BYzT4/OoKBcNJjrVP7pFxNR6
	osDWjw9dMeZzxJTVcx7FI9YI4poKEtO4ga9JS5E8Kmyz0axIxnJdGUY2dK+A6pEiGM/+/7
	6k9CjcvryUPbwJK/OdHQptWZWyIL+3Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-1paoutTdO-6fFG6g13bc7w-1; Fri, 20 Jun 2025 08:20:56 -0400
X-MC-Unique: 1paoutTdO-6fFG6g13bc7w-1
X-Mimecast-MFC-AGG-ID: 1paoutTdO-6fFG6g13bc7w_1750422055
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1010832f8f.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422055; x=1751026855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCDuPbcz51+r9EY5thnNhRDzl+s2DLdA7Mhax7aDjbM=;
        b=CHJBNDpDAJgcugj8FUym50lSu4y0bGuL4SLcOBSoDechGzElbl/AKcQ6OIpilJgYT2
         1pjhBrvrxyYC0T6xfedogXOyaP8dBuRaf9chq5FosJxivTpGkAzUNztdpSdICgSQNfb3
         BLzIgrgYcs/aZMpF2QO5H80kuEXlMCxCIrNnJUfA6WbB4+HhVmJCSGph2SPDwGOgh2Lm
         4xsbceJpRD8zg36WLRq9cGpP6pwU8F3hpwVVJT+B1h5CmCQ2ZCAjJVcd5hxGqoYqVQZY
         c6AvHZBE3xYkgKmLQeTONAmuSj9IPtumvxHzQ7oeI4Ixf1o0Fn5CwqcwTDn5KtOSD//x
         0rhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVetUxSedEab5I7xSPfWslM8XtbcRYLswoS7VBWP7gYQLGuNIdXwxVC512X2FkBZWpf+UzyUSfexmuFCA==@linaro.org
X-Gm-Message-State: AOJu0YxuMHyovqPTubgtjW+i01GcmiMw3n5xZwLbOxnrPbIJr+3T0B7i
	fylMITbztknMo3Q0XiowmRGhnusGBkImmQjQeY81hNOwE4mnoN5QZil1KFRUyjT9QYtqSbBp9t0
	L1q21R4BvTBWm73upS78YhutHyvBEfS/tk2ufpTkOUgMONBqH+zE6RsZ+lQ==
X-Gm-Gg: ASbGncuhwn+yoYpiSQxfYiXIH/u8t78LgSm4gfqHONtfdy3KeYpC2QYkMEKsW22EEMY
	U7gPR+AMdbkD1jweDny+RS3CCGTuOGBkreYJqyPa+8c9Win06GOVdyyTiISmSo21QDkvan4ITo1
	z2qR4yPGsX8HHtZuljem8a8BvKp5UDuRYjzjSQLjE7fkcSSveFVdofUpoOAKeVbgE2KcwJ1JF6n
	2Ae3RoHrNv0d+bGTlCZlv+SqfMbKSr1/uzSEKHkO+GkFHWbVljwiZhd2qszB/sHCUsPfjuJhtc5
	5eKd6EJqGh6o
X-Received: by 2002:a05:6000:65c:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a6d12dbe56mr2141490f8f.4.1750422055279;
        Fri, 20 Jun 2025 05:20:55 -0700 (PDT)
X-Received: by 2002:a05:6000:65c:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a6d12dbe56mr2141466f8f.4.1750422054881;
        Fri, 20 Jun 2025 05:20:54 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45366181aebsm7966475e9.3.2025.06.20.05.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:20:54 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:20:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 15/29] hw/i386/acpi-build: Use AcpiPciHpState::root
 in acpi_set_pci_info
Message-ID: <20250620142053.3a32333e@fedora>
In-Reply-To: <20250616094903.885753-16-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-16-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qqf3L2MfyFvEXvYjpyWojMTC5-2-hcXNoDL8k_02Yno_1750422055
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: EeGQr5rAEVOX

On Mon, 16 Jun 2025 11:46:44 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> pcihp acpi_set_pci_info() generic code currently uses
> acpi_get_i386_pci_host() to retrieve the pci host bridge.
> 
> To make it work also on ARM we get rid of that call and
> directly use AcpiPciHpState::root.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> v2 -> v3:
> - Use AcpiPciHpState::root
> 
> v1 -> v2
> - described the fact we changed the implementation of
>   acpi_get_pci_host() in the commit msg.
> ---
>  hw/acpi/pcihp.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 236e175b69..e79a24b821 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -99,10 +99,10 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>      return info;
>  }
>  
> -static void acpi_set_pci_info(bool has_bridge_hotplug)
> +static void acpi_set_pci_info(AcpiPciHpState *s)
>  {
>      static bool bsel_is_set;
> -    Object *host = acpi_get_i386_pci_host();
> +    bool has_bridge_hotplug = s->use_acpi_hotplug_bridge;
>      PCIBus *bus;
>      BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
>                        .has_bridge_hotplug = has_bridge_hotplug };
> @@ -112,11 +112,8 @@ static void acpi_set_pci_info(bool has_bridge_hotplug)
>      }
>      bsel_is_set = true;
>  
> -    if (!host) {
> -        return;
> -    }
>  
> -    bus = PCI_HOST_BRIDGE(host)->bus;
> +    bus = s->root;
>      if (bus) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug. */
>          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &info);
> @@ -266,7 +263,7 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
>  
>  void acpi_pcihp_reset(AcpiPciHpState *s)
>  {
> -    acpi_set_pci_info(s->use_acpi_hotplug_bridge);
> +    acpi_set_pci_info(s);
>      acpi_pcihp_update(s);
>  }
>  
