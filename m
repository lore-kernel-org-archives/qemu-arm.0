Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp880607njc;
        Fri, 20 Jun 2025 06:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6Wtsp9y+mslRxh4jhTq9EgzxJGFIv5cBBoQwrdCcyc8n2LGNawtYjsbWNe4YrKWiocgVbOgcjqku0oA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6Lm8PT1jLldwOnItSeG4U1B5eygc6oExW+S2eQNTF9Wy81Mu/HVzxZy9xCa4ZzuMVZcH1
X-Received: by 2002:a05:6214:1947:b0:6fa:cce8:3bdd with SMTP id 6a1803df08f44-6fd0a5abf01mr52046056d6.36.1750425104685;
        Fri, 20 Jun 2025 06:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750425104; cv=none;
        d=google.com; s=arc-20240605;
        b=IenFnOS99rBRQoY0Qk1CUu0rActc49umQ4ExyRPxsJ0j7Yv4YVSGSmOX/ZHCdUb9Nl
         Cq7iiob6Rzi6023zpMp0hTX//lHFVS5LUN3nCfbkd1ZjRJN4uo3aZ15ud7ZxnJfURTjc
         lv257/AtMTNl0qhEngnvuPuqL0myYIDGG2rnn7ZWEqXTzH2Njolo3QjjnOv9WLvY5Zou
         oDfM+RhpcW0AygTwurl/NxD7dDjUEgtKzVSNiaww0LSyNJvvkzLoZVWvLnhOeYKIS7Kz
         WVFAVtym/fDk5Onmpdj/7ZUk2gd9OEoA/QkC5s6c/nfZf9CTc+CyBH74RWSuu1uD+yLc
         EHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=dJe2HBRJ/IQUNIxBb2aBkefCTkrhJFGgYNypf7axFYo=;
        fh=SZvu/nb/hYfjUugPL9iIJULPW/mI4zoEMaVOjhpLcrU=;
        b=S7LtgS3wsel3LP1NDQNvYuoMYJqpvQ7SBEY9rLigZhitUTaDteEpS6w255nVhU07mm
         D3d0kSxe5YHYad2HeXh7pNPQUCUaHtm6rNDF9K9eTYNObuyHFelC9gS17QzCyXef/Neh
         nGyqne5vsvllv+ZE+J+wdoLiYHo+9jmBgjy22OE6Tnxz+rGpO/aBn9NQgKBO0QNETz81
         9nIqNMLGnXdtyrYQbW6uY6DZxG3cxmLOsjuBI0z9en/zMmCi7DQfLCzgAPR5PG96+8jA
         Mjtc2feWhAJW/ebSUf8998ms8d1HP3kWpu0OYK6odC1vaNddJ+G56YJXbrwzqagrbQry
         FgFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e50NGf5Y;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd093e0766si20886896d6.48.2025.06.20.06.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e50NGf5Y;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750425104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJe2HBRJ/IQUNIxBb2aBkefCTkrhJFGgYNypf7axFYo=;
	b=e50NGf5YiwbKk7hIArRvbI+v9kv8F+rXfsWwc2fYhjVoMYkz7Vesnwgz2pMIM6XCJNi/D7
	TEOrksqfidtE1regsjsRmzYO8Ox8wD6UARoeBu40W3WnyHPmYFZxPFGkaxVXFeFBMju25r
	njSgBqgB44kpjLKf0nlLY6KxwBeR9z4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-eqHmatNANLmsjNXjUrQVIA-1; Fri, 20 Jun 2025 09:11:41 -0400
X-MC-Unique: eqHmatNANLmsjNXjUrQVIA-1
X-Mimecast-MFC-AGG-ID: eqHmatNANLmsjNXjUrQVIA_1750425100
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532514dee8so14033115e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425100; x=1751029900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJe2HBRJ/IQUNIxBb2aBkefCTkrhJFGgYNypf7axFYo=;
        b=HILaaWcnm8sz059eDDzSWitUpMy5ey8Jf7uCuJC68SpptKYuRDN+2CIHw1roe6hPLD
         EFUKtAuOimvN2jzUFh15IufNsgFjR55ZYxEk9Z8SfkEAQmSROy8zy3qkxQdlllc7GYXp
         y4zrbeXlmNqNTmPO7LbcyD3opCWADXknkuHBB0HaKlGKctgDQzGW7X8yQvH/4ddh+qQt
         zKjv+FgqtNcQNlfyFc+A/6x/nv9KgLKgwHif3Ms0dDkYHeLKKa36vWr8LWlO+7Yi9JzH
         ISV7sOKRcv1j9bhX1sKUseUakty2q1cTgNwbuSPJ/GXUoMWevmPZjdvyjw6TtQxdnXfT
         XUNg==
X-Forwarded-Encrypted: i=1; AJvYcCUfmiOPrsLX58O6a99dCxlHVtIBdOb3Z70rHRMrU4HLD98tx12RkQTNC5ycTgX3OF3LT97MvVRWN07ogw==@linaro.org
X-Gm-Message-State: AOJu0Yza3zJ3vzghQr19vC0v3IS8wWPqG0GiK0TyehfDbh9R0x3ZRS6c
	uKYRvXH0cjtto2wxiefT8/rcjdxjefDu+f2NTksP8GI8+wPUgqZlpGhIKBgY7+qRNiFe/Q5VQ1C
	dUeNHMSHwCFve5gZ7U/xf8uiX0rYMcsfd5XQm7BGvENbMB71M8d9k5ZuQRg==
X-Gm-Gg: ASbGncstgiVq6UEF2fKtakMHhQfe6ifGIEGJtnchUvSl3FXZe/rOxVCj/xACukDfwE6
	r/jp6MXF5Dj92Nri7HOcs4SXsNjeYPGAHU5ZxwnlF+iqxTbFzQ/tahgOK7TcJXgL3sks4tikB3W
	/mE6uZ1Kg6BL7TeeCossGSIey0kZMY48TUa7zz5aBMQP+LPHa0aRMt+nuKmFWbZPXNca6NYUG6x
	fIJ8Ak+pC7+kiiQ1M4hEfiNaDuFSX7LFRZjyx9j9BSiJWZHKiEzXFpf6cO0OIsoFun9/TeCEvVA
	YZjY3FpnSyyL
X-Received: by 2002:a05:600c:a111:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45365c0678dmr21001315e9.4.1750425099821;
        Fri, 20 Jun 2025 06:11:39 -0700 (PDT)
X-Received: by 2002:a05:600c:a111:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45365c0678dmr21001015e9.4.1750425099451;
        Fri, 20 Jun 2025 06:11:39 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647070cesm24972035e9.33.2025.06.20.06.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:11:39 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:11:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 27/29] tests/qtest/bios-tables-test: Prepare for
 addition of acpi pci hp tests
Message-ID: <20250620151138.01364280@fedora>
In-Reply-To: <20250620113138.00007531@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-28-eric.auger@redhat.com>
	<20250620113138.00007531@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9vtsvAgL1RYc9TIXYxSWGBKs6rvNPIjsLe9wix3T0x4_1750425100
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: fyKjzQhmGEFo

On Fri, 20 Jun 2025 11:31:38 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 16 Jun 2025 11:46:56 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > From: Gustavo Romero <gustavo.romero@linaro.org>
> > 
> > Soon we will introduce a new test related to ACPI PCI hotplug that
> > will use a new reference blob:
> > 
> > tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>  
> 
> Unusual sign off chain.  Eric is signing off as handling Gustavo's patch?
> I'd expect Eric's sign off to be second.  Looks good in the next patch fo
> instance.  With that fixed.
>  
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
> >  tests/data/acpi/aarch64/virt/DSDT.acpipcihp | 0
> >  2 files changed, 1 insertion(+)
> >  create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..dc3ab24d05 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,2 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
> > diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> > new file mode 100644
> > index 0000000000..e69de29bb2  
> 
