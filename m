Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp615094njc;
        Tue, 25 Jun 2024 01:43:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf0g7uCldqudxFCLPDyDoo6jJ+z/v/ZBU48SlJyVmBRSH7TT9F9mOZGs1cxRYotCxKp8bbBJKg2sggleXL62p7RrpOrAbV
X-Google-Smtp-Source: AGHT+IFVPmRSRDMZeF4zJ7sj/VlvbWVm8wrfpv8pXGjQJpt8Vt7eAfRtYZuflOtOeN7SF+uivmHz
X-Received: by 2002:a0d:c504:0:b0:644:548a:758d with SMTP id 00721157ae682-644548a75bcmr47506747b3.49.1719305009216;
        Tue, 25 Jun 2024 01:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719305009; cv=none;
        d=google.com; s=arc-20160816;
        b=lg7qGViaDkDNI7AQpIWDR0eHtvNcwyT2k04NNsdxaikrgJSMBslV8vSZ2hUep5KxOD
         lfJ80rQUPxflDWDQNC4Tqb4K76SWSCJdrkhab6QnypQI7f7hCnu7bYkga3GhqpmTLzhC
         umBu3ZP1G4NBHfTYcfQsyXpt4kI1qB58f5dqA/HfEalXzz+leeR7m7AWf4iJ91Ost0KT
         /WXj9+LRCzrKrObYyKxVHRWb8M/8tdodWqqv3Gvnt0+UlyzFG3aEddqV1vLtxQrNc5/c
         enOW/2Fr2eU9fM7nDtkYV7QagunW1rwpnkK2GC0GEJHQjJD7OdrTdV5Py+dKD1mJ8DIN
         e18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=08qKOr8cHlB7UBSUb30uitrrrKzkUWBWOKCvsLF8vlY=;
        fh=eD8cno7KkbqfHr3MB0Tkp07aOQcSzm81uwufsLyoyw0=;
        b=jcAzL43o0BIqcMhkp8atGrTTHkPWI2HL/Zz3m+bmzBS2wwZdMCJwb0YPxu7O2FS6dv
         qoHZTcibj8Rsv0UPQ1oht+qLCglBPB4h4xIhZkZG5xv5KCYf00yKolYx0+rM5gRmmejP
         CPdsTN0j4/jSpOv22L7BeZz8S1/rvUUP/HfMPpP3tO6SMo04dVdGyR6dlBBJcUMrngVO
         S6nog7lAVfdaE/ro5kdK1Xx6yP0Upa4gJ8UwX+ZZUWlKWQHKxx3HJJ8upOiLafBRQ21k
         GpQIcLhEVE65LWMi4WI8j9ioUfys4mX2hfPSbS9ZvZRLfbWCErq57hnSG5izgrBpOwVU
         gNDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2UiMT8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c0863fsi98666351cf.315.2024.06.25.01.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 01:43:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2UiMT8z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM1lR-0007gz-NM; Tue, 25 Jun 2024 04:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM1lR-0007gT-9G
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 04:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM1lO-00080j-Ag
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 04:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719304973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08qKOr8cHlB7UBSUb30uitrrrKzkUWBWOKCvsLF8vlY=;
 b=P2UiMT8zOtC5uziXZjt6F1fyVxHBTcQS2WioWT5GYkSkQKK2cjuOee8n2aZAY9S6poeS27
 zBJwrhLsJVPO2AJVH0Pxw81Invr05amxGuaxQ5mtO+5UbBth8BdY8FhXmNLGcDsbPu1SA7
 96LKbWjmZedQfm+b3yYen1MnDSJWtKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-9wHKhsNpNlKRWhyKmBKbuQ-1; Tue, 25 Jun 2024 04:42:50 -0400
X-MC-Unique: 9wHKhsNpNlKRWhyKmBKbuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4249f8e4db7so2005655e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 01:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719304969; x=1719909769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08qKOr8cHlB7UBSUb30uitrrrKzkUWBWOKCvsLF8vlY=;
 b=KngLxTqiN0UVNnLVQyEtEucwz1ZLEvhlokJzZIFa0zYtZPblukIQ+b+ZaGtUQ6kuys
 w7QoT6QtGiZ1nYmsl5m8Cbe1KPZVe7D4cQyVP/4RkExU06tcPD5dv41SUqUlxjscEswn
 vvSkC5/jMCgkweFjQ2hiWAdnU5S7AHRr9Ih0kLQ3d7A3Op5U/6VnO8lfOgl9/74KqRjj
 GujAwL/Z0mn3JgQL/sQgB+v/UoP3A1FYLpRJuKyVIM+/C2ZuKC9NXGsrZQUYm3X3Oksp
 TjhAAUZYyyAJ8vJaHy8kXFSxp74fPRQZUHX/ca8gz5qRzh97ooy2tJ60VweWq74YA/yV
 7LIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxUpELwz6T1jX3vXBHJPTuQWfRRW6VrC74JgxAa0ek1LCfDDh9beGzqThV9zHGRCg9jOcvNpCgQyW/QzbxBUMJczSL
X-Gm-Message-State: AOJu0YzIkJ3IEsrwZa2J4tAUhvdGSOc7iaCMeqhwYnj/6HS7EF3VXI64
 NHZTHbj4pOhOeVuhZYRLY7dSxahePujCC8udI3pkw1alcTsSBBWqGU+HFhs5b7qA0aa5KTB0Hmd
 LIhFSxpeVJgjjSa9At9NDuUt3uJAMTrDAn3eCBNLKBnO/jLYWuQ==
X-Received: by 2002:a05:600c:1604:b0:424:7443:e6d8 with SMTP id
 5b1f17b1804b1-424895dad6dmr70386275e9.9.1719304969128; 
 Tue, 25 Jun 2024 01:42:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1604:b0:424:7443:e6d8 with SMTP id
 5b1f17b1804b1-424895dad6dmr70385965e9.9.1719304968705; 
 Tue, 25 Jun 2024 01:42:48 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817b5554sm167960325e9.26.2024.06.25.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:42:48 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:42:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 02/15] uefi-test-tools: Add support for python based
 build script
Message-ID: <20240625104247.54ea00ab@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-3-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-3-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: TnuwLAsMmH29

On Fri, 21 Jun 2024 17:28:53 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> edk2-funcs.sh which is used in this Makefile, was removed in the commit
> c28a2891f3 ("edk2: update build script"). It is replaced with a python
> based script. So, update the Makefile and add the configuration file as
> required to support the python based build script.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/uefi-test-tools/Makefile               | 19 +++----
>  tests/uefi-test-tools/uefi-test-build.config | 52 ++++++++++++++++++++
>  2 files changed, 59 insertions(+), 12 deletions(-)
>  create mode 100644 tests/uefi-test-tools/uefi-test-build.config
> 
> diff --git a/tests/uefi-test-tools/Makefile b/tests/uefi-test-tools/Makefile
> index 0c003f2877..f4eaebd8ff 100644
> --- a/tests/uefi-test-tools/Makefile
> +++ b/tests/uefi-test-tools/Makefile
> @@ -12,7 +12,7 @@
>  
>  edk2_dir              := ../../roms/edk2
>  images_dir            := ../data/uefi-boot-images
> -emulation_targets     := arm aarch64 i386 x86_64
> +emulation_targets     := arm aarch64 i386 x86_64 riscv64
>  uefi_binaries         := bios-tables-test
>  intermediate_suffixes := .efi .fat .iso.raw
>  
> @@ -56,7 +56,8 @@ Build/%.iso.raw: Build/%.fat
>  # stripped from, the argument.
>  map_arm_to_uefi     = $(subst arm,ARM,$(1))
>  map_aarch64_to_uefi = $(subst aarch64,AA64,$(call map_arm_to_uefi,$(1)))
> -map_i386_to_uefi    = $(subst i386,IA32,$(call map_aarch64_to_uefi,$(1)))
> +map_riscv64_to_uefi = $(subst riscv64,RISCV64,$(call map_aarch64_to_uefi,$(1)))
> +map_i386_to_uefi    = $(subst i386,IA32,$(call map_riscv64_to_uefi,$(1)))
>  map_x86_64_to_uefi  = $(subst x86_64,X64,$(call map_i386_to_uefi,$(1)))
>  map_to_uefi         = $(subst .,,$(call map_x86_64_to_uefi,$(1)))
>  
> @@ -70,7 +71,7 @@ Build/%.fat: Build/%.efi
>  	uefi_bin_b=$$(stat --format=%s -- $<) && \
>  		uefi_fat_kb=$$(( (uefi_bin_b * 11 / 10 + 1023) / 1024 )) && \
>  		uefi_fat_kb=$$(( uefi_fat_kb >= 64 ? uefi_fat_kb : 64 )) && \
> -		mkdosfs -C $@ -n $(basename $(@F)) -- $$uefi_fat_kb
> +		mkdosfs -C $@ -n "bios-test" -- $$uefi_fat_kb
>  	MTOOLS_SKIP_CHECK=1 mmd -i $@ ::EFI
>  	MTOOLS_SKIP_CHECK=1 mmd -i $@ ::EFI/BOOT
>  	MTOOLS_SKIP_CHECK=1 mcopy -i $@ -- $< \
> @@ -95,15 +96,9 @@ Build/%.fat: Build/%.efi
>  # we must mark the recipe manually as recursive, by using the "+" indicator.
>  # This way, when the inner "make" starts a parallel build of the target edk2
>  # module, it can communicate with the outer "make"'s job server.
> -Build/bios-tables-test.%.efi: build-edk2-tools
> -	+./build.sh $(edk2_dir) BiosTablesTest $* $@
> -
> -build-edk2-tools:
> -	cd $(edk2_dir)/BaseTools && git submodule update --init --force
> -	$(MAKE) -C $(edk2_dir)/BaseTools \
> -		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
> -		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
> -		EXTRA_LDFLAGS='$(EDK2_BASETOOLS_LDFLAGS)'
> +Build/bios-tables-test.%.efi:
> +	$(PYTHON) ../../roms/edk2-build.py --config uefi-test-build.config \
> +		--match $*
>  
>  clean:
>  	rm -rf Build Conf log
> diff --git a/tests/uefi-test-tools/uefi-test-build.config b/tests/uefi-test-tools/uefi-test-build.config
> new file mode 100644
> index 0000000000..1f389ae541
> --- /dev/null
> +++ b/tests/uefi-test-tools/uefi-test-build.config
> @@ -0,0 +1,52 @@
> +[global]
> +core = ../../roms/edk2
> +
> +####################################################################################
> +# arm
> +
> +[build.arm]
> +conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +plat = UefiTestTools
> +dest = ./Build
> +arch = ARM
> +cpy1 = ARM/BiosTablesTest.efi  bios-tables-test.arm.efi
> +
> +####################################################################################
> +# aarch64
> +
> +[build.aarch64]
> +conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +plat = UefiTestTools
> +dest = ./Build
> +arch = AARCH64
> +cpy1 = AARCH64/BiosTablesTest.efi  bios-tables-test.aarch64.efi
> +
> +####################################################################################
> +# riscv64
> +
> +[build.riscv]
> +conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +plat = UefiTestTools
> +dest = ./Build
> +arch = RISCV64
> +cpy1 = RISCV64/BiosTablesTest.efi  bios-tables-test.riscv64.efi
> +
> +####################################################################################
> +# ia32
> +
> +[build.ia32]
> +conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +plat = UefiTestTools
> +dest = ./Build
> +arch = IA32
> +cpy1 = IA32/BiosTablesTest.efi  bios-tables-test.i386.efi
> +
> +####################################################################################
> +# x64
> +
> +[build.x64]
> +conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
> +plat = UefiTestTools
> +dest = ./Build
> +arch = X64
> +cpy1 = X64/BiosTablesTest.efi  bios-tables-test.x86_64.efi

