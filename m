Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4775081njc;
        Tue, 27 May 2025 05:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQJdmsSuI5hGuDXjmeB2Ez/fFv/4W66FTiyM100r8FNLbbieu7WHmPWBXGa30L/jGt1VKjEjMyEy91vA==@linaro.org
X-Google-Smtp-Source: AGHT+IHwWN5JZQVbd8EUAH5WeqvidYqI3cob4+bxcQPXifPrkvplaK4p45C+SQX1vc/ymF7BAauC
X-Received: by 2002:a05:620a:470b:b0:7ca:dac1:a2c3 with SMTP id af79cd13be357-7ceecbe7b7bmr1772053985a.27.1748348635572;
        Tue, 27 May 2025 05:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748348635; cv=none;
        d=google.com; s=arc-20240605;
        b=aMw+1cRv2MJtzwJUChLE5L/qIWHRHv4gDHZR2YZvOFuO5+AOHhbkWmkUn0FZnInU3B
         ImlovYWdRs+9v5Z4OK/nk47TFV66r9w2I2rteCNMnStyimu0MgO/8ckm5YvBegF0JFFs
         mBKghM9+T0h1RuvVmMk0TZJQ/aQKLe4nhNJOVH6sEuDrEXomWa1ARdz4pf2AjLb6070Y
         CRbiXIdgZZgVPDCRuaDk9YYX1mnx7bYFMUD8QCvmhBHQaDS4HwW3PMMui1di9kJi/UEb
         KA1mlFG4AHk0g7X2uRA85X0IejYcohS0cjBhgpigVhW+z1W+iGn0d6Q+f2CLDyV5V6Jz
         uc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=kPIl6huUN4xa4yyD+AofLyI8OZhnZGlbGJO+t6Xo75o=;
        fh=yGooHT1y1YP+7sR2rx6ybKFl2m4uDcC67RVbC7TnmsI=;
        b=V7o0AFWCFCzRPtZA04kpORboX7Ug27R2pAoYtPq7aUZJDVGw7N0SHXfDD6ZFfbwLQP
         KsJm8K8P90jkIC0ShyMdBWWwLIfozwvBIOp1kpa2CeP6O8KRfLRUEG/d9qmDf8BkQotq
         rrG/hVeltowfHrSmMrbB3NmXRuTywpV+1S6Er2U2/2t6csIKz7/YjEE8PMlrvwRlVxuO
         5XBZKSv2RtpBk7yK2dWRblxILb1+mrtxx9f0q4ujedCFMXnPINHXzVes5sJCbrMDLfKo
         93+dfF7qdId0qkNu1eZiu+7K8sInSZ0WdPKVwIKRWSRnsmEEtHx1B/3Lrq717NBx0sTX
         Dq1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DwUTiTZT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f31e0si2603677385a.628.2025.05.27.05.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DwUTiTZT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748348635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPIl6huUN4xa4yyD+AofLyI8OZhnZGlbGJO+t6Xo75o=;
	b=DwUTiTZTQiUuf9k1bPCTQRiKWt5DYaQOhaJC+qlbjfj+jRW0NRqbdCqw7nVdyXh57Y7YCR
	UyIEHcJjjm9gUSC/AqkHciLnsQD1TCKflU8ZX7Nb9bjiHYii9MgBvv0erUvjNpMoZLgIL9
	OnfJYR2jyfapnkq8TnJQdzDHk3ByRrE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-bFNZ2zCwP3qKNfZ6gugdfA-1; Tue, 27 May 2025 08:23:52 -0400
X-MC-Unique: bFNZ2zCwP3qKNfZ6gugdfA-1
X-Mimecast-MFC-AGG-ID: bFNZ2zCwP3qKNfZ6gugdfA_1748348631
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so18906035e9.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348631; x=1748953431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPIl6huUN4xa4yyD+AofLyI8OZhnZGlbGJO+t6Xo75o=;
        b=ixXuoFhHcDRs6RHDg4QKFCF2S8HFF7TiDfqcaI0Wzd79Zn86SiT7fHezg9LMjaJ45U
         M8UbJZCKJQfZa+dSqmn3UY0H0I7iRFZ4NG1qoPfon206euDu9uJnOaKYK9IMbNBJwiGX
         4XzdWe4/4gvjCWJBkriOftOaByri/U4g+peKyCh+FBr3nbKJOn5MBaW/blPhNTUOMsSj
         TFeCnlBFqcDFGs8sGkk9ZTpP9o76rPVpLaiD4E14FwmhdeNpxw6FEvX8oqq2xczNSCT+
         kgGJFusuwyRQw5UBiBb2e5S18iMLfC1p6I/tsmIdagiNllWmchzND8UM8r+u+4wyUdXX
         hc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3LZuMK4O3MPA58BVh9ynbMOAS1ACB2CkD7PzFBPel7ofIE+RzFjw3tvlSCGv42Gy8BDr0lzHwt2QzOg==@linaro.org
X-Gm-Message-State: AOJu0YzNApE27nws875jBe/D7AUZYvKXQu4R929VAOrV9uYgZnvTipz/
	DTu1401CinUyd+wc4STaSvjQr1S/ZIci1M90e43NCyNyhU8l49eE6TxyojcARYhrdLf+C1zAJxF
	oUzXbOlX4ObN/pajyrXokCVcOuaVIZ8fJ4zhvcDe+iVSDkEgOrTIYNt0pIg==
X-Gm-Gg: ASbGncu1oAjK8QKuBmLv2aLaQgHoxbz1B3YszmVy3en4kuKgq6BSrn95Ox9E0H6FWgj
	ajkYuE46rRXCR2i1kQprd+juTge//Fj/kD5GsuNLxhFTwSjK/wpuzpWQZHYLAEM779WbAHiGdtY
	mvrlWSq4HbweS6JGEczgJESuozc1uJ/PGoCPJBK0b6sfjGHVc8oeB7ymXXAWAdwoy8xuwyj8S+a
	LYNmUkYTBqz84QeLJcI1n2zoFHbBAJxdag6bXJMOYwLpyP2pflYR93q3rhTqHOfWpqvj0cnOcTl
	EOflkGxV42mYz51VI22mzUUiLthipn1t
X-Received: by 2002:a05:6000:2584:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4d0dc1c68mr7377875f8f.27.1748348630741;
        Tue, 27 May 2025 05:23:50 -0700 (PDT)
X-Received: by 2002:a05:6000:2584:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4d0dc1c68mr7377862f8f.27.1748348630376;
        Tue, 27 May 2025 05:23:50 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d90912d4sm5808116f8f.47.2025.05.27.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:23:50 -0700 (PDT)
Date: Tue, 27 May 2025 14:23:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 01/25] hw/i386/acpi-build: Make aml_pci_device_dsm()
 static
Message-ID: <20250527142348.1b4b721d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-2-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-2-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sa-_ZDzYSkVoCDcqm7_16EX24JxRfAb47I7QRDQE8yk_1748348631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dyerThFAGTIS

On Tue, 27 May 2025 09:40:03 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> No need to export aml_pci_device_dsm() as it is only used
> in hw/i386/acpi-build.c.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/pci.h | 1 -
>  hw/i386/acpi-build.c  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 6359d574fd..ab0187a894 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
> =20
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *in=
fo,
>                  const char *oem_id, const char *oem_table_id);
> -Aml *aml_pci_device_dsm(void);
> =20
>  void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>  void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 61851cc840..f59026524f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,7 +338,7 @@ build_facs(GArray *table_data)
>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
> =20
> -Aml *aml_pci_device_dsm(void)
> +static Aml *aml_pci_device_dsm(void)
>  {
>      Aml *method;
> =20
