Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp887966njc;
        Fri, 20 Jun 2025 06:22:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWce3ERdZD5tc5yPZZew+QoaVFN3yHvVbruuv69zIspRYqBt/+ghTy6NMHI7XiLBcTtKBsT2PLDFj4/FQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFj1YpcsbSMkz+d+Gj+o/qwMj1OhwKtQ/skUa6yyRxAuiOAvsUfIUGNi1AuwW0yA8RWlJNY
X-Received: by 2002:a05:620a:1a85:b0:7d3:8f51:a5a5 with SMTP id af79cd13be357-7d3f994adfamr471485785a.51.1750425757072;
        Fri, 20 Jun 2025 06:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750425757; cv=none;
        d=google.com; s=arc-20240605;
        b=BtNQS1u54QoCAdpWTl2Ku9AIEh5I77ckvWy1vqnyy4NCVGgq6muSk3yOdRK25K7kfY
         NlfQC41m6LBC2V91mDdfiS0EzwcLUN7wO5IhbL321geV2wpQCFAseIjBfa3blwOCMByE
         19sMKC3001BGHCBlwzaaelbOAxjbGpqUt9YYFEukhU9DM6dk/ULJWtgBZoT1ofGWNkuK
         Is9V5GnmvouE10czAqyLelGp4X3u7R8/tOtqLElh9WnaLOZyEsN3t5Kv2i3m09muk6CR
         wrZT01C+E+PBJ24ICa6q6oqOBcVu4YxVfeoD7Siyaf40wsOV06/Ni5OgLUeWBjEsThVQ
         gMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=1TrY03pQabW/7U+H8CdQTgK6FVk4MRFPxv/zbddqFY8=;
        fh=wEfXsPz6h2IVULjKorgNrZB8oEfQ1RvJoEW11h2EC6U=;
        b=jdIUn0/oFjWzFJpBXr67eOECxIwYl0iLBRnZ4uxhzpWjY8/NybLgopg8YJZP0pH/lG
         9su64FuIe3rvxLdC/OKtiGLkcs7LclXsAx0h2JJ9xaRKJfc994JImT5MtyGynGg4U299
         6Kfsa7/kwxQYWEdZSYjcBjyAadfNqeRX7e8tmvjvSNh2L1JXtD+y96bswsZbu4c8p1kV
         yZ1NKbddkJfsMLBSwQqO8HFoPl+NZZ+kEdnVryUT1W5PMyhuWdDvN710z9OKmaJvhNuW
         PeU+EQnjtCOsK/UFDcW3We3zurFgtZdL3nuCfvSaRUuhWEBBH7me747gsCGFoPpt6Fbt
         GxOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WV4LR8Qy;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a1f8b8si166958185a.570.2025.06.20.06.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WV4LR8Qy;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750425756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TrY03pQabW/7U+H8CdQTgK6FVk4MRFPxv/zbddqFY8=;
	b=WV4LR8QyN4KFvBlXrxcuhjatkLinfHkuK45rUHDubv3i9HBADmDQKxh++iNLBwuGCFP1AY
	dY6EM5aoH7XinQ+MoLjlEEya6Q12AF5q6PpUU5+njjNISB65AfLzpac0viTWVYXU/ptExV
	1Xtw8GDFFa1kxJZ3YK2jsHgp/vDBziU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-_lN7FJy1OVqfm4HujtKJVw-1; Fri, 20 Jun 2025 09:22:35 -0400
X-MC-Unique: _lN7FJy1OVqfm4HujtKJVw-1
X-Mimecast-MFC-AGG-ID: _lN7FJy1OVqfm4HujtKJVw_1750425754
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450de98b28eso14197665e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425754; x=1751030554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TrY03pQabW/7U+H8CdQTgK6FVk4MRFPxv/zbddqFY8=;
        b=YumgielDX+K4+B2BHG3SsNvXthWwZztLwtudD77Rck3y2PhugmWajeJdBBpfrS+VvH
         QIwDM1yEU6FMtXy29AS8G83k7GdvwSC10Wwsg1EdMf2N7x0rPvBvc2oC4p7K71IJ8sdy
         4mbH3RfIOr5DEUBdI8qibwDYVcZDqTkiwnuNZB2f53IVaJhByNcjZK2EoXSBX24fmH2I
         f9ZOjaMaRN4AbOqgpjmq4uLzQrsNPrw5DsdYxE7MaE1ygHhtpQg8MAwwdyYDusFlWvES
         N8luLEvk2qZcNvOr6Qe3SJY+pXuqTg8Bf4twstoLErJInM1Qf91UQ5UIABgkSi/Kk2Xx
         qL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcSj/vunMicSfcGJwCuxo2Lm+StCtPASVkMbnTrMQtjhyxMUyCKqoqB7pvmmAwjnK+NR/MEMP7CLUwow==@linaro.org
X-Gm-Message-State: AOJu0YxmKus4jnQ39Q571+nCaOrLKTtWNKodODhD1ADhim4mCy8wM8UX
	twcGg4+jWrrVWK/uUAoqT0n4Jrh0gj2Q4XSDIei01tkHTNVRtDJKPLUkFCXu8PuHk9JsUJwviIU
	7/6sjWfBHwPWNaOl2KsH2Q617FQLpvOhj/I83QVFYidSN7iqE96VwbPlSMA==
X-Gm-Gg: ASbGncuozFRIJOPjAu0xgNdj92VtW2FNkvt2ahjPRslhNdEb8v8a7InGz8n+t3z6PT2
	MBbDZUMsTG/QVC4oBbGVcbPWRcUewMCYEZ6XvXsovJBXi4x9qlAbT2G7LO/BsYbTv7okg418kUY
	2zDbKT+V7gklbwkzB3VaFvTZA3EnR38UJds0UKyawTl0PoXOt+GNtYoUP3QpM3A3FwBDNq7E0f2
	y+MtcZSmeehNd8pLorppIS/KY4deaJXfwognEuRazIb0HBVfnQLQ+C/eW/qIdpU6c8qL7WuIUh1
	FB52PPLZPuoi
X-Received: by 2002:a5d:588e:0:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3a6d2802f51mr1924606f8f.29.1750425754126;
        Fri, 20 Jun 2025 06:22:34 -0700 (PDT)
X-Received: by 2002:a5d:588e:0:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3a6d2802f51mr1924579f8f.29.1750425753731;
        Fri, 20 Jun 2025 06:22:33 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm58965995e9.3.2025.06.20.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:22:33 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:22:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 28/29] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
Message-ID: <20250620152232.36683ffc@fedora>
In-Reply-To: <20250620114029.00005a94@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-29-eric.auger@redhat.com>
	<20250620114029.00005a94@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hsEAlWnLxZcApVn4--LebOeRkBTFxmAk0Uq9K-T7pnk_1750425754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 22JlWAYUQn/p

On Fri, 20 Jun 2025 11:40:29 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 16 Jun 2025 11:46:57 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > From: Gustavo Romero <gustavo.romero@linaro.org>
> > 
> > The test uses -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
> > to force the usage of ACPI PCI hotplug.
> > 
> > Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> 
> Could we add the necessary (I'm not quite sure what) to trigger the _DSM
> creation so EDSM gets used?  I'm not keen on that being dead code
> wrt to tests on ARM.

relevant x86 example:

        " -device pcie-root-port,id=nohprp,port=0x0,chassis=2,hotplug=off,"      
                                 "addr=7.0"                                      
        " -device pci-testdev,bus=nohprp,acpi-index=501"  
> 
> Jonathan
> 
> 
> 
> > ---
> >  tests/qtest/bios-tables-test.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 0b2bdf9d0d..4b9e391eaf 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1643,6 +1643,38 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
> >  
> >  }
> >  
> > +static void test_acpi_aarch64_virt_acpi_pci_hotplug(void)
> > +{
> > +    test_data data = {
> > +        .machine = "virt",
> > +        .arch = "aarch64",
> > +        .tcg_only = true,
> > +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> > +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> > +        .ram_start = 0x40000000ULL,
> > +        .scan_len = 256ULL * MiB,
> > +        .variant = ".acpipcihp",
> > +    };
> > +
> > +   /* Use ACPI PCI Hotplug */
> > +   test_acpi_one(" -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on"
> > +                 " -cpu cortex-a57"
> > +                 /*
> > +                  * We just pick address=0x04 for the root port to avoid
> > +                  * collisions with other PCI devices on the root bus (pcie.0).
> > +                  * It could be any other value that doesn't collide.
> > +                  *
> > +                  * The 'chassis' and 'slot' options equal to 1 have no special
> > +                  * meaning here, could be any integer, but we set them to known
> > +                  * values to keep the test consistent.
> > +                  */
> > +                 " -device pcie-root-port,bus=pcie.0,chassis=1,slot=1,addr=0x04.0x00",
> > +                 &data);
> > +
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_microvm_prepare(test_data *data)
> >  {
> >      data->machine = "microvm";
> > @@ -2580,6 +2612,8 @@ int main(int argc, char *argv[])
> >              qtest_add_func("acpi/virt/numamem",
> >                             test_acpi_aarch64_virt_tcg_numamem);
> >              qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
> > +            qtest_add_func("acpi/virt/acpipcihp",
> > +                           test_acpi_aarch64_virt_acpi_pci_hotplug);
> >              qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
> >              qtest_add_func("acpi/virt/oem-fields",
> >                             test_acpi_aarch64_virt_oem_fields);  
> 
