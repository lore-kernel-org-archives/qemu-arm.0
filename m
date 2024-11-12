Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7388100njc;
        Tue, 12 Nov 2024 06:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWF8HyOJxN8aXNtZlIUqHqhxlKKxVplR4JFkjvveURRYQ58mxjGiD/frbAtZzqk9yblEDYYPv/gPP3wpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFu6nYFbxRJKNgkKDQ3wkNzZ2qyJ3qtVv9RHilLynZl8hJNdZUPM3u9WYv8e79yd10hMg1l
X-Received: by 2002:a05:622a:588:b0:460:8d5c:34bd with SMTP id d75a77b69052e-46309322da6mr251071531cf.17.1731423405397;
        Tue, 12 Nov 2024 06:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731423405; cv=none;
        d=google.com; s=arc-20240605;
        b=W4VpnChkTH/hZZvohenqXHSVchEFBLhLFkFybvwi4qCxLckQsJPmZL2qLzqJ869ocN
         iXgy6u8zI9IcD7D2Wvl17ioC7rz93uijFo50BMAthXCQj9JHJhiVQ2p4jBRUUkWBeyBd
         tassQAD6Cvkk1PJSj/ED+CLml+HActdHtEXAUxuZXSvv+T83SKQnsc/Wh6Rx+z9U/Cyf
         p8dk22dognOKZo8nr6uOHP9sCCZWmwdnyWtW1gI+7Kr48kSepZlRJKCBLAB/StJLKREW
         H2rUKDP00eZvbxE/fzdw2KyGWMSq+pmS8Kf7y1DdwVtiagj680hJbBz/s+Hg8VuSJrru
         P+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=cak0kjyUXbQdy9/hjEftzuifGBo1JMvsZsExyP0teuw=;
        fh=1jzCk2Xwg7TtSt5uuGBxX9SnqeQlu46r3cHsvsIbiPQ=;
        b=Gadb52EBKaEU9Z0VGS7Ycqvi6TikfyMtlhuQxuAd0uq3QQIMiYNeeAVN6WEY1SDF7K
         ECzqDORMfrllbVj9Fa6tHUAxO00zL54cMiNs/eCaz26HAsqdPAfTjaGKieg0wwhGmbaU
         hSw+Ke101JOaWnIaysH8oHowsmbeD/UP9ViNHPwhJ3LF+BuixU7lQx1sZwt40ls+OHHY
         Sdo6Iu65Ut3k05PGmR/KGwUN7qRfvD3DWB98OHsteOH9uQkWd6+XL16drmo13J4QFmq1
         f0BaENoB3Uo7F+LLUZjQCq9Ogw+FMB0wEumarOGLiMwpVEP91EBDOBSZKoO2pRBPB/ad
         r3Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eNexm47M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff625a7esi143741471cf.493.2024.11.12.06.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 06:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eNexm47M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAsJR-0006PF-Ny; Tue, 12 Nov 2024 09:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAsJP-0006Oc-Ha; Tue, 12 Nov 2024 09:56:11 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAsJM-0002aV-8L; Tue, 12 Nov 2024 09:56:11 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D0FC2A41D04;
 Tue, 12 Nov 2024 14:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD57BC4CECD;
 Tue, 12 Nov 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731423363;
 bh=oU0WT5/i3G7DgaZFfeTwlebnKhTrhz/oUuWCQQ+C2zI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eNexm47MHFR9yA3McgFEbNtXfHkqJp+LW94rfLh6BILY48emzUcmNfFWVcpNH7zez
 6NKIYByZvzTBJ+8pY7FLgs1xOuAgRtyjE2RBcBBBYHd3XuSDFZFmw9zU3d2oYOm8HG
 hGyjXJm28pSRCH3bsBxpFTplq1ps5LIhb3AWrlKLnMPo7DuPfDzWZ/+agynXHo3NZe
 pmlpc2/xkjRKJfxJGfFylVAEw/E6Fyte1/mXBrFTKV5AF3+7P9zGiq0oMkB2zVwqny
 KynplvKzCsjbVDip1YMwapktTmtkAHXCtaCOQegwJZqDwuxEi2Yy6Vpccl/AjABxPU
 nNGRZ30mw5mgg==
Date: Tue, 12 Nov 2024 15:55:57 +0100
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
Message-ID: <20241112155557.728e9d68@foz.lan>
In-Reply-To: <20241003162728.1de6fc62@imammedo.users.ipa.redhat.com>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
 <176693e011a411db92be9e912bfc4a9da0e664b7.1727782588.git.mchehab+huawei@kernel.org>
 <20241003162728.1de6fc62@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2wT55o587CLG

Em Thu, 3 Oct 2024 16:27:28 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +++ b/hw/acpi/ghes.c
> > @@ -513,7 +513,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >      }
> >      ags = &acpi_ged_state->ghes_state;
> >  
> > -    if (!ags->hest_addr_le) {
> > +    if (!ags->hest_lookup) {
> >          get_ghes_offsets(le64_to_cpu(ags->hw_error_le),
> >                           &cper_addr, &read_ack_register_addr);  
> 
> just fencing off lookup is not enough,
> to be compatible with qemu-9.1 (virt-9.1) we also should not publish hest_addr fwcfg.

I tried this:

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 201e72516608..6bb962d3c449 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -402,8 +402,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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

But with such change, boot fails:

EFI stub: Booting Linux Kernel...
UpdateRegionMappingRecursive(0): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(1): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(2): C0000000 - 100000000 set 6000000000070C clr 0
UpdateRegionMappingRecursive(2): DF100000 - E1B90000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(3): DF000000 - DF200000 set 6000000000070C clr 0
UpdateRegionMappingRecursive(3): DF100000 - DF200000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(3): E1A00000 - E1C00000 set 6000000000070C clr 0
UpdateRegionMappingRecursive(3): E1A00000 - E1B90000 set 400 clr FF9F000000000B3F
EFI stub: Generating empty DTB
EFI stub: Exiting boot services...
UpdateRegionMappingRecursive(0): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(1): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(2): 139AC1000 - 139CD0000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(3): 139A00000 - 139C00000 set 6000000000070C clr 0
UpdateRegionMappingRecursive(3): 139AC1000 - 139C00000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(3): 139C00000 - 139CD0000 set 400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(0): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(1): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(2): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
UpdateRegionMappingRecursive(3): 139AC1000 - 139AD0000 set 60000000000400 clr FF9F000000000B3F
SetUefiImageMemoryAttributes - 0x000000013FE60000 - 0x0000000000040000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13FE60000 - 13FEA0000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13FE60000 - 13FEA0000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13FE60000 - 13FEA0000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13FE60000 - 13FEA0000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013CAF0000 - 0x0000000000040000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13CAF0000 - 13CB30000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13CAF0000 - 13CB30000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13CAF0000 - 13CB30000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13CAF0000 - 13CB30000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013CAA0000 - 0x0000000000040000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13CAA0000 - 13CAE0000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13CAA0000 - 13CAE0000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13CAA0000 - 13CAE0000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13CAA0000 - 13CAE0000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013CA50000 - 0x0000000000040000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13CA50000 - 13CA90000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13CA50000 - 13CA90000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13CA50000 - 13CA90000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13CA50000 - 13CA90000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013C960000 - 0x0000000000040000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13C960000 - 13C9A0000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13C960000 - 13C9A0000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13C960000 - 13C9A0000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13C960000 - 13C9A0000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013FE20000 - 0x0000000000030000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13FE20000 - 13FE50000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13FE20000 - 13FE50000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13FE20000 - 13FE50000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13FE20000 - 13FE50000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013C7B0000 - 0x0000000000030000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13C7B0000 - 13C7E0000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13C7B0000 - 13C7E0000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13C7B0000 - 13C7E0000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13C7B0000 - 13C7E0000 set 70C clr 0
SetUefiImageMemoryAttributes - 0x000000013C770000 - 0x0000000000030000 (0x0000000000000008)
UpdateRegionMappingRecursive(0): 13C770000 - 13C7A0000 set 70C clr 0
UpdateRegionMappingRecursive(1): 13C770000 - 13C7A0000 set 70C clr 0
UpdateRegionMappingRecursive(2): 13C770000 - 13C7A0000 set 70C clr 0
UpdateRegionMappingRecursive(3): 13C770000 - 13C7A0000 set 70C clr 0

At this point, nothing else appears, and bios doesn't boot OSPM. 

(I'm using an arm64 BIOS with debug enabled)

Thanks,
Mauro
