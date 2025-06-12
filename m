Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp3523808njc;
        Thu, 12 Jun 2025 06:25:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYcysja3FAcDzctvUOBPltQfo5VlGWQVz61Cp7zfMr6W7aitbEtTjP16TOLWugleiXRNTxLkEdKbMFxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHNRN0R9CsytsAvPYmHKWvUN61vWvU6OcPYMCdtRdPGwVWXBKSYAGNP9lRaPxyE+pdtA/it
X-Received: by 2002:a05:622a:598b:b0:4a5:882b:1681 with SMTP id d75a77b69052e-4a7228c36dbmr63285251cf.4.1749734738244;
        Thu, 12 Jun 2025 06:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749734738; cv=none;
        d=google.com; s=arc-20240605;
        b=fJ/JAZI1hTqXAJrmSnY+JaRWSjIiq5ZLRyrkUVN8xvHILzRA2IgGp8+G37Tzt9cEDN
         7e4yeXhu/zbWE891D9u8jWVd7ykKV62DrHngmPFPMvrnkAe4rck6zktQuHEQxfMpujUa
         0BCTec0e3VO0YP3jsMg3TzPUe6mwry+GIwiW0x/fxz0I6xzK3rQlhFb2oVUWYLg4SK+D
         3MpMsdU4gPy9ugYM0FDIs4Zp6UjwktjjFT42MlSy12RHC43/zDmKheAaiQSran/We73x
         iUY9ZOYNzpGwRBcX8JcoRD3B3rJ2Ycgg/Zr4w2P0l8hsalko5QEqpFY3RvLKgBwMqYNH
         Vezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=zDyhqaDEF4FCd/hQmc+D77zq2ZaFHqRDVzl9hrHfjLY=;
        fh=26iiJeMMewRrmKh6I1STVt+9kOcYRJpGEensehkt2Ic=;
        b=Vm7Td48koaG9SoGwhvWIgfzsE+xP+hUgVf2wX81Rw1Y89DYzA0IOrfb7rlpOqJn169
         Dy/kavFlKkS/AmJLz06mCrhbjIeQ3W9e53Gv3r0kWwBg7i8YsfucnFkXk6Qs6hQWXETT
         i6VE4NUExzdt2jbHE6jQgXi1AzfuUQgpAlfPmxqoYmm7vq1SAqnGXToYasIu7NGVYLgn
         E1wYlSUYK82xR4PinJBjPdwVXCgDrBZWgtBtwPGgZpXV+XvMMvl+AMkrZLmZF+KeHSzE
         TeLiIJbCU5UnGNawJFIzGEx3bcsipH2cCUDV97IaJ8GcXs2KW49YU8SkHtXzWmzTLLCr
         uZFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNC6fYuf;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d0f1si7365971cf.232.2025.06.12.06.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNC6fYuf;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749734737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDyhqaDEF4FCd/hQmc+D77zq2ZaFHqRDVzl9hrHfjLY=;
	b=FNC6fYufRYYBaEUaCLBWNk8JTo26q9Q2F2DAWt95rw2bQTypKreGoMnYWdzwGngMqfKNiF
	WVX6wbqbhJz649Aan+ywLWlc3StAfw2Uvgp14hTxzAqITjJ7HcIrxu2rXKa65vjoklaya4
	c2bWrKdzgL6MdwwuRsC4+tnwzRcqbQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-cndyXnyBMhuGls7uFLiSFA-1; Thu, 12 Jun 2025 09:25:36 -0400
X-MC-Unique: cndyXnyBMhuGls7uFLiSFA-1
X-Mimecast-MFC-AGG-ID: cndyXnyBMhuGls7uFLiSFA_1749734735
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d5600a54so7826845e9.2
        for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734735; x=1750339535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDyhqaDEF4FCd/hQmc+D77zq2ZaFHqRDVzl9hrHfjLY=;
        b=PPbnrEwac+ZButVBfQeh5jSiTK3hX0fRbFX9vVYNrXwFk0PVDck4Pf9ZOCvSg0XoQt
         Meyr+0mehJzsmnY8vo95+t/RTeNZr9U/L3AZTCAnMzzr0zhjUCww0F19K/boJSbSmyRV
         Bfw6tkYgq1eYkbUQS1ZVfOa1e/mIJwp4/p6H00jZupQOvjTQ+eIe6HCLEjx1wRiVJoOn
         hm8jsoh0mX8t9eeOL/UaOn1q0u+BYVMdKpIjjhh7ZhUzQWlhdzUNxXgZjclF+ws+TP8s
         qoYUnzPSQq6GG2EWVlisV4w5ho6+O8WSK2Xv9XmLODR5RcxTyHTiDViz0KW++1klGnOj
         02ZA==
X-Forwarded-Encrypted: i=1; AJvYcCV0bRs4EATncH+RC38SXCtFbiKo+Za3Tpr5DaMVFqL8QYV6DK5qm/l/z97zl4U8F4ezURMBhdF2enZjWQ==@linaro.org
X-Gm-Message-State: AOJu0Yyw7HursIxBlP3M9yOySwu6VxIBQpNJvrw+mzEwT4gDT3G+WSEb
	hb1Qeu46zWX5vVbS9wf9RuUualKB04FicRuvriuC1QUEWHqA8CV/ZLmT+Xgv0jSCGISHJw6zY/a
	ia32TxSQCHSW8F/MENf925eEGLLYdh19wXmdRtulSFumYPHOhvNXevQMFzg==
X-Gm-Gg: ASbGncsvsODbU/6U8etgiXxeD06i3jnYDlACuS3ZhqJwfa9w21S5DwLW1mLZlFELDXb
	09KPl4eNxLPB5PDGedfVX82QpPh5r2GSQgBtXM4K6r4vHQKbfgocvbQYlNNuogG7WoeQfwaVnQG
	4i1mW5ORK7dXs3nesAPzR3EUh/t1EEW/8Qa8iX61dsj3eG4q8QEauBY77N9w2hHEL+bV4wpRYBD
	OwLSBs2Fe9FJglTaFE/sNYQEyHiY4MbZT1Q2hSEZ8TTKQSF+bbn7QqDmLZ8kOK3rIMnhBQ+lZ7W
	2DDHBne6WNabGQUFswbNDmbDBIgjOgbBBGkV7LJQiRg=
X-Received: by 2002:a05:600c:a49:b0:450:d614:cb with SMTP id 5b1f17b1804b1-453248e2952mr66081655e9.33.1749734735470;
        Thu, 12 Jun 2025 06:25:35 -0700 (PDT)
X-Received: by 2002:a05:600c:a49:b0:450:d614:cb with SMTP id 5b1f17b1804b1-453248e2952mr66081375e9.33.1749734734976;
        Thu, 12 Jun 2025 06:25:34 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4bb0bsm1953501f8f.77.2025.06.12.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:25:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:25:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
Message-ID: <20250612152533.49fa5ab5@imammedo.users.ipa.redhat.com>
In-Reply-To: <72c84565-3879-4c08-a73c-15bc5543ee2b@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-7-eric.auger@redhat.com>
	<20250527143301.77f5bfd1@imammedo.users.ipa.redhat.com>
	<72c84565-3879-4c08-a73c-15bc5543ee2b@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vWGKgAhHAeI2LegIcIcSAy8FpPJrldHeOs7lFZ_Db64_1749734735
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: fXaa15mz7aN2

On Wed, 11 Jun 2025 11:00:02 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 5/27/25 2:33 PM, Igor Mammedov wrote:
> > On Tue, 27 May 2025 09:40:08 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> Propagate the type of pci hotplug mode downto the gpex
> >> acpi code. In case machine acpi_pcihp is unset we configure
> >> pci native hotplug on pci0. For expander bridges we keep
> >> legacy pci native hotplug, as done on x86 q35.  
> > this is not needed if done as suggested in 2/25  
> So since the property would be applied to the GED device we will still
> need a patch that retrieves the GED setting and propagate it to the GPEX
> device.

I don't see a need for propagating it to GPEX device itself for ACPI sake.

For ACPI code, what we do in q35 case is fetching
pm->pcihp_bridge_en from acpi_dev(whatever it is) and then
passing it down trough call-chain

  build_dsdt->build_q35_osc_method

the only hack that touches GPEX device model, is the need to
wire up root bus to GED, when GED is being created.
So that GED would be able to swap hotplug handler on
an acpi specific one when configured to do so.


> Thanks
> 
> Eric
> >  
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
[...]
> >> @@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >>      }
> >>      aml_append(dev, aml_name_decl("_CRS", rbuf));
> >>  
> >> -    acpi_dsdt_add_host_bridge_methods(dev, true);
> >> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);

also, having sufficiently forgotten this series context.
It might be better to abandon idea of consolidating osc and dsm methods
in acpi_dsdt_add_host_bridge_methods().

Just looking at above is confusing and forces one to re-rear previous
commits to figure out what acpi_dsdt_add_host_bridge_methods() is doing.

having here separate sequence of
  add_osc()
  add_dsm()
would be much more readable.
Lets drop acpi_dsdt_add_host_bridge_methods() helper.

> >>  
> >>      Aml *dev_res0 = aml_device("%s", "RES0");
> >>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));  
> >  
> 
