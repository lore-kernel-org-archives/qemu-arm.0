Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5388935njc;
        Wed, 28 May 2025 03:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR0vBF5gvpxR3mrkX1VTTXqZG681bJeLd11txfNgtXjRzyUFGinLgx4GgXU2U+bkYa+uLzVg0UQguk6g==@linaro.org
X-Google-Smtp-Source: AGHT+IH3s0Y2XJngC55Noqe/48Gam+NmtbMiIvm3gm40LEtlAps3KEtdzyG9axn5ugLN8vU/20lu
X-Received: by 2002:a17:903:2f4c:b0:22e:3e0e:5945 with SMTP id d9443c01a7336-23414fe7012mr227674405ad.50.1748429388653;
        Wed, 28 May 2025 03:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748429388; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/a9h7GzbC8YgEsRHXjCrDyNiqipHE0HOzfcGKD81Ifke3yuYGI2qTp7W6QaSzT74R
         INI2k5+gDZmBc0cMu7pHUBpXuFB/JKmSlRgvsD8VyLmjtM5JezeM7dQfL6ns/hScqLLq
         3IC4HhDVI1DNfadEcRQKE928GJX4bKPFIYbpzu+SFUbe0+Gttu+3lepRkdcopmUlilXO
         VpHTnqB0zcHvgiOnnxSbxI+jbI7QcOP9V+JNqG2x4lmJGNvqhfv7pw+/0P6TCH6KWht3
         g581vTaggPvtIJ09ayHCqS+uzjEssi9zC3vXp8gu79stvUD68uxqWufxU2UJ3p8ABIjN
         UcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=eo7JgcWIfIt948do3LlLVcHxwolSgQoURAGIxncUInI=;
        fh=tA95gfHqbpEgC6DzmiVRE3g8ylafq/g+10uwkEyYwrI=;
        b=XX50w2HGimg2IiPIFG1TlgsQ68DkN4rjc6JWHOXkotfYFcfsgUBf9LlCqX5U4zmJhD
         t/WWfiJ3rCim2pMTLp1MpxpPrTzoigDoSFO1xJyrwMpdaV3cN6QATb4x6lNmUyDSzDF2
         0dHKCYR6a3vIG5IOIuyGfQYNmgq2PfIupDdOe9cSyLICdylSHYbgirvD1BYSEn2p2hcQ
         Ynw2bS+7Gp+eDXAdVZR26ChSCARBi39llMZJ7ydZfnGGFW6MbvOROQQiHgDry1wrhwSj
         euPM2ARxhs5AFXYOmKF/YNQS2LVnim2vq1AVO4efn7bwJzUmLPdaW1OmXqlJwE5JB9Kd
         TQag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiCS8yRS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b2d99ecc332si1455092a12.304.2025.05.28.03.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiCS8yRS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748429387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eo7JgcWIfIt948do3LlLVcHxwolSgQoURAGIxncUInI=;
	b=QiCS8yRSlaTgdhxlC393TesYV+eTDvddjfhM3GFHpDbzLua7qtcJVfHWR+JDrjj4Vag2NK
	5Gazx2CcOpEz8DcXC7aKV9AkBKy+m4Ey1LTwsIg4WbQgiBj6g0O/nh/hugod9T90pDr/pi
	m0mTwgHBrBPDsoOXNlJzpvEQwXwmBcI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-JbcAN81JOoS0n130kh0FSw-1; Wed, 28 May 2025 06:49:46 -0400
X-MC-Unique: JbcAN81JOoS0n130kh0FSw-1
X-Mimecast-MFC-AGG-ID: JbcAN81JOoS0n130kh0FSw_1748429385
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so316914f8f.0
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 03:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429385; x=1749034185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo7JgcWIfIt948do3LlLVcHxwolSgQoURAGIxncUInI=;
        b=OVYVArBHab5nodKGi3hclw4iqM9l9xKZfevFoH8+NdD0xGuAjkRZ0OfLinVwK6hieP
         GuL/KtVhulxiyb0DHzGXVWthosrJIc05KeA1pMer/Q+ylg96MkR/LQ4J5AeN4qIZPpX9
         a2cVIt3j1tS8dd5DsRpZoRQci+wIJK1ptQPZRJioU+ESprc7xYXAm+EzW8kZcFPJJ4CD
         O2rC7r3+xM/iUQQdXsggEE7840L+UR0DzVVb8lQq4m+tW37HTmV+hYNWJLQYPmWi9Cpk
         Y4f6F9C1PNp/E6wEG6MT4wju77FVHM+NoHzuIpG5Cy99qXioTfPOcmIXdxFAYejUYblz
         2SVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWiZ+7JQ/7HvzC35tPeUZC7JOrps0cc+PfuCP2DxwrEVv6nPE7j/+jZNTH1eoP6kND4QWoZWuzQmqBgw==@linaro.org
X-Gm-Message-State: AOJu0Yx0Y3Nim4Xsn1N9yWxTsFwj+RhQsARGOpcXhZ50RjCPGMM1eiyE
	RkNjDvz5vWGhqgqogYer9II+YYTY4S2F5att+8DmwiAW6HDExOT2+95hbYLmyaPIjeptFt3ZVT3
	PoovM2Qz3A8H7M9cL7LMrcaWDk4IKlrQSosFCBhzbZcc82+k83rvOBnK4mw==
X-Gm-Gg: ASbGncvqaq271I5MTxSg9sM0DQM2UmnBdnvNXSUzDdmUsuGpx0sKbj3VQLib83sC7Yd
	Oe/1+JGGy6s2VOotU5/wJJbujb6MvRNqtXdmMHZP6r7tbIvZDP4HdKFthJAdMhRRQNDy0zTK7fT
	mDxmuSOnlrDA30/1kQVUcjsnLPvPnhEvAAUopMLQzuJzTTLAdG8J+vH5jXsXIqpOqZ5jCRFrnhF
	EkEeqlRl/uU//LFn02P1Gb9+GWSRzRdYp9c1FUB/pIopmM65nq23iPjVSpLUeK2N7GGXz+hEuC1
	GELr+3HVsskWWxf2+JI/BY68zWsDb/9F
X-Received: by 2002:a05:6000:18ad:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a4d994bfa2mr10275459f8f.1.1748429385184;
        Wed, 28 May 2025 03:49:45 -0700 (PDT)
X-Received: by 2002:a05:6000:18ad:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a4d994bfa2mr10275431f8f.1.1748429384773;
        Wed, 28 May 2025 03:49:44 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a133csm17695005e9.11.2025.05.28.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:49:44 -0700 (PDT)
Date: Wed, 28 May 2025 12:49:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250528124943.45ee502e@imammedo.users.ipa.redhat.com>
In-Reply-To: <fd44ef37-ef02-4e60-817d-1362c76433b0@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
	<20250528113813.47086516@imammedo.users.ipa.redhat.com>
	<fd44ef37-ef02-4e60-817d-1362c76433b0@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OIC7-o3Bj9BnQ1UyD1J6kkY8XsyFleDLS_dvoY0aYeE_1748429385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 7WcBW5zmtpWi

On Wed, 28 May 2025 11:48:20 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 5/28/25 11:38 AM, Igor Mammedov wrote:
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
> > it would be better to test whatever default we end up with.
> > (like x86)  
> 
> See my question on patch 2's comment. We intended to have tests for both
> modes (legacy and acpi pcihp). Gustavo added some new tests for the new
> default, namely acpi pcihp. Now I did not really understand your point
> about keeping legacy mode as a default.

default legacy wrt tests are orthogonal things.
Just decide what default should be in #2 and then make sure existing tests
work with that.
Default (majority) tests shouldn't include CLI option a for a feature 'acpi-pcihp',
only legacy tests should have it.

Given bios-tables-test is heavy load on CI for x86 we have only few
test cases to check no pcihp (legacy), the same should be done for ARM.


Then on top add a few acpi hotplug tests to snapshot DSDT with
hotplug hierarchy built in.

ex: test_acpi_piix4_tcg_bridge or test_acpi_piix4_no_acpi_pci_hotplug.
 
> 
> Thanks
> 
> Eric
> >  
> >> ---
> >>
> >> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
> >> ---
> >>  tests/qtest/bios-tables-test.c | 13 +++++++++----
> >>  1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> >> index 0a333ec435..6379dba714 100644
> >> --- a/tests/qtest/bios-tables-test.c
> >> +++ b/tests/qtest/bios-tables-test.c
> >> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
> >>      };
> >>  
> >>      data.variant = ".memhp";
> >> -    test_acpi_one(" -machine nvdimm=on"
> >> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
> >>                    " -cpu cortex-a57"
> >>                    " -m 256M,slots=3,maxmem=1G"
> >>                    " -object memory-backend-ram,id=ram0,size=128M"
> >> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
> >>      };
> >>  
> >>      data.variant = ".numamem";
> >> -    test_acpi_one(" -cpu cortex-a57"
> >> +    test_acpi_one(" -machine acpi-pcihp=off"
> >> +                  " -cpu cortex-a57"
> >>                    " -object memory-backend-ram,id=ram0,size=128M"
> >>                    " -numa node,memdev=ram0",
> >>                    &data);
> >> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
> >>       * to solve the conflicts.
> >>       */
> >>      data.variant = ".pxb";
> >> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
> >> +    test_acpi_one(" -machine acpi-pcihp=off"
> >> +                  " -device pcie-root-port,chassis=1,id=pci.1"
> >>                    " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
> >>                    " -drive file="
> >>                    "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> >> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
> >>  
> >>      data.variant = ".acpihmatvirt";
> >>  
> >> -    test_acpi_one(" -machine hmat=on"
> >> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
> >>                    " -cpu cortex-a57"
> >>                    " -smp 4,sockets=2"
> >>                    " -m 384M"
> >> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
> >>      data.smbios_cpu_max_speed = 2900;
> >>      data.smbios_cpu_curr_speed = 2700;
> >>      test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                    "-smbios type=4,max-speed=2900,current-speed=2700", &data);
> >>      free_test_data(&data);
> >>  }
> >> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
> >>      };
> >>  
> >>      test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
> >>      free_test_data(&data);
> >>  }
> >> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
> >>      };
> >>  
> >>      test_acpi_one("-cpu cortex-a57 "
> >> +                  "-machine acpi-pcihp=off "
> >>                    "-device virtio-iommu-pci", &data);
> >>      free_test_data(&data);
> >>  }  
> 
