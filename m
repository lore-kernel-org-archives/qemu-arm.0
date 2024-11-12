Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7411518njc;
        Tue, 12 Nov 2024 07:23:05 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUGiSRJ6x2NdeKxC8FjhQ2k88uUhDxtC3WSt1swsn9kTlIsVLZQN9s7YyFFauDU1DST4/+XxaKYX0DJjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFW/+c88XMl+rqLMv9mpOT53zkVQyky/b9sb0hRFXRjDJ+FL24dr2W5dj3gRhJTtRSWgyi4
X-Received: by 2002:a17:90b:1c8d:b0:2e0:8719:5f00 with SMTP id 98e67ed59e1d1-2e9b173c3admr25281160a91.22.1731424984819;
        Tue, 12 Nov 2024 07:23:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731424984; cv=pass;
        d=google.com; s=arc-20240605;
        b=PIB1MIz6Kan5FtrvbSez2eKb+sSGlwq02ZQuEpoN1GOjvdyrcPgrXz5CJ4DuYB+au5
         lx3RqIzQcX/eEx/RLRRQyI0v4TLoOMJUxLzpMq/ZI9ZDBRUsidThtyLSaQBsOFalF5WY
         sBJBokKWFOquShB0p8BOGQW9z+jAHzvO3TRXAvwYhgFR4CKLNZYZyT060b7GKyaQuDOW
         jAbDO8/JOHN87OWEq1HW6n2FOmnwV5pc2NOjjO261vXWMp9+mLun8AHTeJmkPwRd80X/
         XQSnXG89+04HHlK1/DMyBDUdITsawXxzUgQoR95/o7gzz0FjChfLTJTezybcr8oDgY3V
         RE2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Z9gwMYRicuAM90Mr25QHfksSGvcWxAQLl4W8piJgJ60=;
        fh=1jzCk2Xwg7TtSt5uuGBxX9SnqeQlu46r3cHsvsIbiPQ=;
        b=DJhAc2ddpPiBTKgBe+xZYQbtMLbfTCMmnjLU8H2Y0eoZtrU1LbDM8I6lMMrNO5hFLg
         dBB9tDju0X3zZ2TSs9m8QigvwFMhxCzEIsWFOJ7jv61jNcB9R7KSlQmXIZ90Tr016xVw
         Kw+N4FSaUpGHkAa/Cu8FAY1F9OsAhb/6j4qrRVesKWCiiLCwy14W6b0bS905imKjRNf8
         sZEQ3OzPZ+BKruYCeizNu7TpiXGtn/oLdKpI2f9I+wucbAtma0ELrFevaH+U9sjtaTCy
         rU5ru4ca16BZl0Qs2qyC86Wm56caOPv16KxCJ9+1IMECwSgeO2/mcL5dYuyutNDKMA3q
         Di6A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EDkeT8Yk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e9a5f5bf35si15047165a91.69.2024.11.12.07.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 07:23:04 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EDkeT8Yk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-406181-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0432878C8
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793232003CB;
	Tue, 12 Nov 2024 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDkeT8Yk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F70B1FC7FF
	for <linux-kernel@vger.kernel.org>; Tue, 12 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424980; cv=none; b=grQ0Wx6oy/D57wA0S8z/vnAWwvtkvlftWlHBAIjpfBo7YN9oW73vzP269FrbTfbHC+Mil1ENrm1DI/CAd56kZIlWBDwmEzQoi8wFrqVvma9Tb59aCqWnzE0RTFI9rVoqMP01GXznEKjPNUBZWPLfdJLV1dZ1Dwiw8tWpLLISCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424980; c=relaxed/simple;
	bh=ygmiDec5oZDSySVozuUuRvuYRB9Cjy50S5yr7boJjtg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsesyLK+CgkID1E5v0qna3MeIqR+3HHYIGhzWQl60YhNdVw3I6svVA4a5WHpyQzgwgdX1a05HEYCL2ECvEyplyxPr9oQ7YAh0jjKysAPLX+RFFkQcI3tKpiEEiV5CjEPP/wSWFF6z+khz7jRnsxjxNs7cxYsjLBPNn191F67wLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDkeT8Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAC6C4CECD;
	Tue, 12 Nov 2024 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424979;
	bh=ygmiDec5oZDSySVozuUuRvuYRB9Cjy50S5yr7boJjtg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EDkeT8Ykv6F+Cv5+aRlUN6E5pI0wm6BtmuxfT5EtZvxeIyXsEZ1XuXN83ALX+JO2Q
	 7WvfpoJES3dV30Uveev/lUWY4TILE4YzHsQx6UjLNbs3qNrTFKyyJhuQVvqt79F2Hh
	 X6kInZryDZWaBqztAq9xgwoTxR135P8sny5eLX3tG+L8p03EM5nEeGwcU4+ZAsztWh
	 WNhiwxzE7XAO0fjDgsGZRw/S6wJAMPYZmcE/5TcrL7BXKaQU++uR5hthjm/WVaTsjr
	 O3SyVgFhW6y25E6R0SrSGQsOeVfWGjRNXt6/+tEpM583VXUyCtUVxt57J6GoiopJWN
	 sEPdQtrTEuJgw==
Date: Tue, 12 Nov 2024 16:22:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, linux-kernel@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 4/5] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20241112162254.65cc3efc@foz.lan>
In-Reply-To: <20241112155557.728e9d68@foz.lan>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
	<176693e011a411db92be9e912bfc4a9da0e664b7.1727782588.git.mchehab+huawei@kernel.org>
	<20241003162728.1de6fc62@imammedo.users.ipa.redhat.com>
	<20241112155557.728e9d68@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: jmuub6q49iZ8

Em Tue, 12 Nov 2024 15:55:57 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Thu, 3 Oct 2024 16:27:28 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > > +++ b/hw/acpi/ghes.c
> > > @@ -513,7 +513,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> > >      }
> > >      ags = &acpi_ged_state->ghes_state;
> > >  
> > > -    if (!ags->hest_addr_le) {
> > > +    if (!ags->hest_lookup) {
> > >          get_ghes_offsets(le64_to_cpu(ags->hw_error_le),
> > >                           &cper_addr, &read_ack_register_addr);    
> > 
> > just fencing off lookup is not enough,
> > to be compatible with qemu-9.1 (virt-9.1) we also should not publish hest_addr fwcfg.  
> 
> I tried this:
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 201e72516608..6bb962d3c449 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -402,8 +402,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    if (ags->hest_lookup) {
> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    }
>  
>      ags->present = true;
>  }
> 
> But with such change, boot fails:
> 
> EFI stub: Booting Linux Kernel...
> UpdateRegionMappingRecursive(0): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(1): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(2): C0000000 - 100000000 set 6000000000070C clr 0
> UpdateRegionMappingRecursive(2): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(3): DF000000 - DF200000 set 6000000000070C clr 0
> UpdateRegionMappingRecursive(3): DF100000 - DF200000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(3): E1A00000 - E1C00000 set 6000000000070C clr 0
> UpdateRegionMappingRecursive(3): E1A00000 - E1B90000 set 400 clr FF9F000000000B3F
> EFI stub: Generating empty DTB
> EFI stub: Exiting boot services...
> UpdateRegionMappingRecursive(0): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(1): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(2): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(3): 139A00000 - 139C00000 set 6000000000070C clr 0
> UpdateRegionMappingRecursive(3): 139AC1000 - 139C00000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(3): 139C00000 - 139CD0000 set 400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(0): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(1): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(2): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
> UpdateRegionMappingRecursive(3): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
> SetUefiImageMemoryAttributes - 0x000000013FE60000 - 0x0000000000040000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13FE60000 - 13FEA0000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13FE60000 - 13FEA0000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13FE60000 - 13FEA0000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13FE60000 - 13FEA0000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013CAF0000 - 0x0000000000040000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13CAF0000 - 13CB30000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13CAF0000 - 13CB30000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13CAF0000 - 13CB30000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13CAF0000 - 13CB30000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013CAA0000 - 0x0000000000040000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13CAA0000 - 13CAE0000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13CAA0000 - 13CAE0000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13CAA0000 - 13CAE0000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13CAA0000 - 13CAE0000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013CA50000 - 0x0000000000040000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13CA50000 - 13CA90000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13CA50000 - 13CA90000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13CA50000 - 13CA90000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13CA50000 - 13CA90000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013C960000 - 0x0000000000040000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13C960000 - 13C9A0000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13C960000 - 13C9A0000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13C960000 - 13C9A0000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13C960000 - 13C9A0000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013FE20000 - 0x0000000000030000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13FE20000 - 13FE50000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13FE20000 - 13FE50000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13FE20000 - 13FE50000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13FE20000 - 13FE50000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013C7B0000 - 0x0000000000030000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13C7B0000 - 13C7E0000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13C7B0000 - 13C7E0000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13C7B0000 - 13C7E0000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13C7B0000 - 13C7E0000 set 70C clr 0
> SetUefiImageMemoryAttributes - 0x000000013C770000 - 0x0000000000030000 (0x0000000000000008)
> UpdateRegionMappingRecursive(0): 13C770000 - 13C7A0000 set 70C clr 0
> UpdateRegionMappingRecursive(1): 13C770000 - 13C7A0000 set 70C clr 0
> UpdateRegionMappingRecursive(2): 13C770000 - 13C7A0000 set 70C clr 0
> UpdateRegionMappingRecursive(3): 13C770000 - 13C7A0000 set 70C clr 0
> 
> At this point, nothing else appears, and bios doesn't boot OSPM. 
> 
> (I'm using an arm64 BIOS with debug enabled)
> 
> Thanks,
> Mauro

Got it. In order to be able to remove a call to 
fw_cfg_add_file_callback(), no calls to bios_linker_loader_write_pointer()
can happen.

That basically explains why we can't do:

	if (!ags->hest_lookup) {
	     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
        	 NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
	}

We need the BIOS file callback to solve all the pointers that
were created between HEST table and the hardware error table.

This hunk worked:


diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 201e72516608..245efde75a8f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -385,10 +385,12 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
      * tell firmware to write into GPA the address of HEST via fw_cfg,
      * once initialized.
      */
-    bios_linker_loader_write_pointer(linker,
-                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
-                                     sizeof(uint64_t),
-                                     ACPI_BUILD_TABLE_FILE, hest_offset);
+    if (ags->hest_lookup) {
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -402,8 +404,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
-    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    if (ags->hest_lookup) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    }
 
     ags->present = true;
 }

Thanks,
Mauro
