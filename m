Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5460515njc;
        Wed, 28 May 2025 06:02:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqqBeyd/T9IDr7IoUcd2aYgsJ85+4IERh+0fvQ0/IpiEdmqQUfBOqCGbEj1ZmUH0uQMobnBth0PYBVWw==@linaro.org
X-Google-Smtp-Source: AGHT+IGELE+wKwtlSTistUE3PC3jgyIBlhVfW22ooS50KPCVSZr/GW+gSo5JU0OlcyqVaLVaoWWZ
X-Received: by 2002:a2e:b8c5:0:b0:327:e0ac:bd8c with SMTP id 38308e7fff4ca-3295bb0959bmr50965101fa.37.1748437374972;
        Wed, 28 May 2025 06:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748437374; cv=none;
        d=google.com; s=arc-20240605;
        b=Mspluopxfh0DoqWimDD4krb4JRG5O0/GvFeDr87inHSYJmTClPb/RBWfVlVnlpdlgu
         xwfkYsYD66/v4aU/pja7gze4aI1PtRtyUcxIesH43ZccfwiBWun/0J2Ou/ZQwznIAH2H
         fqzsIpNwjpAFrkez9oPuiZjOih/meY0PoECY0PmkWLtQ+mIDH7jVSRhqSJd4TVema0ZY
         NiLS/h3i5IhOBZHXt8Y4i0aNEZwT5f4e/7cdnribvigMCHmMQYn2rF0mkv9TApKjOlsU
         nNAKY26USAE1j7TuGNicA3vLp1zk7aJ1cokJEQnM7+L+tFg/c/WPf1uWxLaHfyMsizhc
         zbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=2zTYLE6MSys4OmtzSZ6e/+XfZzBtahBlti+qgIKKXxs=;
        fh=Uur06pSNN8Peq/G727Fj0KKcxCyTX/OYM9RY3X5nX60=;
        b=cPrN/tTPKl/fnnIvL1N2HrRUMLLZ+pO/I7bQq6sG/iih5LipXwhdHcqdJOe6IZGglq
         88Q8B6WmnSdkAc104ji8xp61wwVxT/Ab39M6W3NiI6YPr5s0OTGzPvm5FQCNZUGTtNp9
         d3EzXi0j6+SrBLu1sE8EIksKSW2u5pg2ltmyVXsQval3IZMha8ZCv/jp9MZHEoylJR1Y
         CayPFiIkHKWSvssO5z8FJppISLqD+DZCvi6TmcX2kx2zEwgDLRu+dvL6y8RKoUzVQhyt
         MbRLtcAy8gJ++pV0b+oy2Tfc9wMCSPyj0Cb4pvlvp34kHQ2RnbOWt90bXJGoe2kXlv6d
         FKIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OOYMDMf0;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-32a79ec0383si4268351fa.156.2025.05.28.06.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OOYMDMf0;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748437372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zTYLE6MSys4OmtzSZ6e/+XfZzBtahBlti+qgIKKXxs=;
	b=OOYMDMf0ooHlseR1YwSnGZwQ0iNFLqSKCFWNi1Rjnu5Vh1C5FLYUpAT7Ytll4edqQK/v//
	6Gjym8gx8QbJ7hw/oW6MYgvhIwdLpQx3ePDx7zBsU0NeU/ALATe7+U/IG05iwO6JUb1luP
	sJTU91zdGn6EwXq6K/bd14rtzSIv3Wo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-xBf0PE3sPI29SKXC30RbJA-1; Wed, 28 May 2025 09:02:49 -0400
X-MC-Unique: xBf0PE3sPI29SKXC30RbJA-1
X-Mimecast-MFC-AGG-ID: xBf0PE3sPI29SKXC30RbJA_1748437366
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4d95f197dso2105849f8f.3
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 06:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437365; x=1749042165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zTYLE6MSys4OmtzSZ6e/+XfZzBtahBlti+qgIKKXxs=;
        b=UUE6E82Gln7lKgYmcGNDTxDYqDMmJXoOkQhdMEvfQ4jApObFIKRYGLXxGIROx+F0MJ
         GnbvtUxGT5bzgSOjFhS6EWGyiIFvxbBqDwMEZavYFbuwwYKzrjKeOWzqL65bIbMyxxh7
         u9Q+LDUy6kaOvoIdJN11OgPHLUhQRTUravRySby2yXtTrj/IvesSofgMcCdWIXUQFNjB
         whQ3Zdd61EHgkdbUVtc/VlBgaYPvEMP5OshrcSH8wVWwt+cyDGatnodKZwbBRsqkOPJC
         b4550O26uN0Ha7OAheA/h7XM3RT/nIUeNkKDgNknn2pCOOLodl7PxenDKNzoNmyIJoQN
         T9lg==
X-Forwarded-Encrypted: i=1; AJvYcCWq9kHXIQxLSgIn0Bo/HQun4RGFWmva1nGYEwRIOwKeURbFZnuaQs5LrTgXxvg2X2t0yIEfCrPpBF+r1w==@linaro.org
X-Gm-Message-State: AOJu0YwCLGleir75vPxNGBVP825WyE8G986yeOjEYq0Y0IoTwKmboNh3
	OVy5piUS2B7kMmTMvfd1PhDsSmqZiolbvjDxmpEGEUNBkMcFFodwY07NFJMXysISr3Kl9qp7ztO
	k45k+jV9G4uuMEDxb2puVvvEhhkPsIPKyw0o0sx8Ft3KhpRJcMIFV0Rdmaw==
X-Gm-Gg: ASbGnctfwxISiJtOCV7fjHRfGk4gElyFY24ZQRf/5tZQFRdgfnh813xBSJIpwxWaPmn
	nPNB7IMhZ4f0tTV/qo6+Ybb3CS/eFg+8AFNAcYEsSL2OLlUtZtTi0QcEMBG8qgYjIdrV87HEEwE
	MhIAnJl94ciNNaQ6f4NC2o1U427/yLgQxGeM0Xezkukh9fQLxXVP3sJFzi6zWdHsb+snruDLVZC
	v1mcvO2M0DeI4RkggDRu83jbH4dViPpcNpL7RaSf+cS+UgRY23Pl2SnnUzdb97D6sLTZeNwEJ1+
	g46r1VcE5sg09QEw6eaAtvhRQcsqBJAy
X-Received: by 2002:a05:6000:2dc1:b0:3a4:dfc1:ecb8 with SMTP id ffacd0b85a97d-3a4dfc1ed20mr7176334f8f.53.1748437363765;
        Wed, 28 May 2025 06:02:43 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc1:b0:3a4:dfc1:ecb8 with SMTP id ffacd0b85a97d-3a4dfc1ed20mr7176063f8f.53.1748437361535;
        Wed, 28 May 2025 06:02:41 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac6ed58sm1433023f8f.8.2025.05.28.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:02:41 -0700 (PDT)
Date: Wed, 28 May 2025 15:02:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
In-Reply-To: <375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
	<20250528113813.47086516@imammedo.users.ipa.redhat.com>
	<375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gxcAJAY1gZheZmNH2dBYIoYTLpocb30JVlIytFkVFkg_1748437366
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ZXrU3Gk4+gDT

On Wed, 28 May 2025 09:41:15 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
> 
> On 5/28/25 06:38, Igor Mammedov wrote:
> > On Tue, 27 May 2025 09:40:26 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> From: Gustavo Romero <gustavo.romero@linaro.org>
> >>
> >> ACPI PCI hotplug is now turned on by default so we need to change the
> >> existing tests to keep it off. However, even setting the ACPI PCI
> >> hotplug off in the existing tests, there will be changes in the ACPI
> >> tables because the _OSC method was modified, hence in the next patch of
> >> this series the blobs are updated accordingly.
> >>
> >> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> > 
> > it would be better to test whatever default we end up with.
> > (like x86)  
> 
> hmm maybe there is a confusion here, Igor. We are actually planning what you

perhaps, see my reply to Eric about my expectations wrt tests.
(i.e. default tests shouldn't have any explicit CLI options,
instead it should follow whitelist blobs/set new default patch/update blobs pattern)

> said. This patch and the other two in this series related to the bios-tables-test
> (i.e., patches 8/25 and 10/25) are for actually making the current (legacy) test pass,
> since the new default as per this series will be acpi-pcihp=on. That's why here we're
> adapting the current test here to have acpi-pcihp=off.
> 
> The new test that will test for acpi-pcihp=on (the new default) is not in this series
> and we decided to merge it separate. It's in the patch 4/5 and 5/5 of the follow series:
> 
> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
> 
> 
> Cheers,
> Gustavo
> 
> >>
> >> ---
> >>
> >> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
> >> ---
> >>   tests/qtest/bios-tables-test.c | 13 +++++++++----
> >>   1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> >> index 0a333ec435..6379dba714 100644
> >> --- a/tests/qtest/bios-tables-test.c
> >> +++ b/tests/qtest/bios-tables-test.c
> >> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
> >>       };
> >>   
> >>       data.variant = ".memhp";
> >> -    test_acpi_one(" -machine nvdimm=on"
> >> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
> >>                     " -cpu cortex-a57"
> >>                     " -m 256M,slots=3,maxmem=1G"
> >>                     " -object memory-backend-ram,id=ram0,size=128M"
> >> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
> >>       };
> >>   
> >>       data.variant = ".numamem";
> >> -    test_acpi_one(" -cpu cortex-a57"
> >> +    test_acpi_one(" -machine acpi-pcihp=off"
> >> +                  " -cpu cortex-a57"
> >>                     " -object memory-backend-ram,id=ram0,size=128M"
> >>                     " -numa node,memdev=ram0",
> >>                     &data);
> >> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
> >>        * to solve the conflicts.
> >>        */
> >>       data.variant = ".pxb";
> >> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
> >> +    test_acpi_one(" -machine acpi-pcihp=off"
> >> +                  " -device pcie-root-port,chassis=1,id=pci.1"
> >>                     " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
> >>                     " -drive file="
> >>                     "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> >> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
> >>   
> >>       data.variant = ".acpihmatvirt";
> >>   
> >> -    test_acpi_one(" -machine hmat=on"
> >> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
> >>                     " -cpu cortex-a57"
> >>                     " -smp 4,sockets=2"
> >>                     " -m 384M"
> >> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
> >>       data.smbios_cpu_max_speed = 2900;
> >>       data.smbios_cpu_curr_speed = 2700;
> >>       test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                     "-smbios type=4,max-speed=2900,current-speed=2700", &data);
> >>       free_test_data(&data);
> >>   }
> >> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
> >>       };
> >>   
> >>       test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                     "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
> >>       free_test_data(&data);
> >>   }
> >> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
> >>       };
> >>   
> >>       test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                     "-device virtio-iommu-pci", &data);
> >>       free_test_data(&data);
> >>   }  
> >   
> 
