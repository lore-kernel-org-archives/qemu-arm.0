Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572711ejd;
        Tue, 16 Apr 2024 12:01:47 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUDaBzFWINbTwMNPq/FIlHqA+K4L6T/BnWWv+s5n8mwkcJguAvxbpprAIkIsc/HKxjfu7EfxHcH0B/4S9CbN1sAD3iLCTTe
X-Google-Smtp-Source: AGHT+IFVs9hFZ+yoEyqzJyJx+Mri2ljvi2ovSOWbxTwqEDjRwZZ3yEvwpt58BBGsoVAx00U6p5ve
X-Received: by 2002:a50:8d19:0:b0:570:1161:111f with SMTP id s25-20020a508d19000000b005701161111fmr9394482eds.15.1713294107309;
        Tue, 16 Apr 2024 12:01:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294107; cv=pass;
        d=google.com; s=arc-20160816;
        b=fbsLW3sq3v7q8NHxpXzriCw2W8JoRB5sNXStr2MlxZlom3IOzIeIuKz0WinSBcd7TB
         PyObPqeSYNdl3gydqXB4D/tmOZpeUhtbYCH6GE3MiYany7d3N0M9YkBZzJDk0Ykbw4rc
         I2sNeUBUSmWTEd1PXOidTTtAvgGBCTQh33qk/Mde8Szr3/pxaznv+guPlsOQHASfNrYu
         iaC1wXlwLx8GNgkFMHU8dRXkKS6L2BUu7JQXLqcZAZ3D9U6bO/bMBplN/aFEZUIvGFBK
         QbgHl9iwN2DmThy8uSnhxnTEjo5HugzQ9BibS8HPgSOIseVR5UXEkM0r+DVZ1MWlk6Mc
         KlQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=M+KMTbrbI+PCZ7l2nXt22iBk719lD5OjaX/6s+DU33I=;
        fh=2o7M+5lPSl9NUTnFdM37Cn4GnsEQFM0/uwaXGRev4f4=;
        b=I+cE7ps3uzJSF8Dwwts1nDla+tMF3c/fNiaUcZN5eg7o0s93ltp1jhcmF0brjUcD0Q
         R2bu10aVNjF9ak2dVf4DIs6SfCdkn4Usqr/J2H4V107V2Ua/T15LDsZ7ghAx1QgWITAs
         E8N/IbBqSv3pQV6Fe6IzkIKCgIgPovp/ULoR1bk93Zl1mra1q/YxZs4laAPrY9g8Knkn
         bG6cTwSH3OgwoHlHOvFrky8ESrpYjgfkLGLHd6Akb/Y+TUusRKx1QAxXwwhEU5tz3spF
         VI8ylLNWNQctQYfe4U7RwRX0/020PYHoiobKgwfL8QpWfHTCAzb7qs0umsFo9V/nolum
         meJg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dSy/GEGj";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id t8-20020a508d48000000b0056e5174f4f0si5900293edt.181.2024.04.16.12.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dSy/GEGj";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-14867-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2EFE1F21215
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BB5136995;
	Tue, 16 Apr 2024 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSy/GEGj"
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6B13473F
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294104; cv=none; b=amOkiVIHoFj8nN0aZYzd5DNvH8VobrWHVW2Vugn/PR9QgQpf9U2dNVzZj210zuFQ6CR7CaTwP4A9K71aaTytTbugKR3kukk7qxTNxW1+bertX7cqwxOH9Ah7ure7C2DJrgIZRYFwE5zJucj37bdcZtk9k/lgOxdyneMcPWQurns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294104; c=relaxed/simple;
	bh=fraBTz31yqncmzNgbezaajd4THrS+JlG00TaDOUqfoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oxTwO8TeZ98DkjGZ5p3sVQo4gA8ByWdULY0EhOdCLbchy4pPGVyQ0VVDeriZRkaQCvK+7VqDOgf2LlJ3iJH34k3zdiqYqpbPXBoWxM6AgUay46BCB30xX4wdOi/CEgRNyQASgfgkgkQtjXI/XH9E7MWQrhUAJ1EmIJvF6SFCPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSy/GEGj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so7415654a12.2
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294101; x=1713898901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+KMTbrbI+PCZ7l2nXt22iBk719lD5OjaX/6s+DU33I=;
        b=dSy/GEGjCWqHMwl29nUKaAoF7javvue/eqHBGf+sHbBKqLG7hljeQhAmgAkYw6xJFO
         DaInz2tx4zrocunu2WO9oj8wPaINSnUeSjOEnwPakE18tbZsM7g85oAWW72+AW4igGGM
         LU5uvYG3sI+KGnC/FYWGEWQKB0+r051p6LgDmtuBcbSykFEto3TZrwEWRZbpUEHKrBIU
         Id7c0dUD78FSkWO8OQUbLaSR24P4ZuOuSyis4+8caWyJJYYJfWkVEgBNCSj3/lWbCTBn
         wSw/4Wf/CFMM0/6/ca9biDLsPn4fnJ6abwyrI7B2pfUUKu0XtYL9xKthVNKXV/fapPmP
         Ox8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294101; x=1713898901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+KMTbrbI+PCZ7l2nXt22iBk719lD5OjaX/6s+DU33I=;
        b=ItbzOsz5b61asLNBuTa99/Fg4/EWbi73i+0/Wr8fMyXD3PXQ3WFBPbwvO7474H3UC+
         25o44DlQUCSv/KEEpPAi8cHtJXkRV+FfYyxLuDd8KLdkxsqSfsy6+ChWpiMlT8tNuMCX
         nGPD3P35XhApZo6rRW9mZPBiySBxSl8mwE9utC+ukBWivwKNka3v955YhoaCF0X2hZgU
         SHT9XGh8Q29HU5Mfqr1DEmybH1T3pM9Zf8BmcROWn7lRW/Lcic6tieRFh7Ms5mLwpDeC
         8Nw5K2ep+NrO0mAtVYzPdnfs/kxipqvRhghIOvNQfDnXQS5We0qj05l8D9Zqc3tUnP7K
         YC4A==
X-Forwarded-Encrypted: i=1; AJvYcCXcdYFwM3pUCEvB46Zk/inrV9hjWdLSCgvpQkgJHFfN9fkw4sIuYaVykWBDY2xhHO1z5Gf9H/TBcOr0pe6nRtXpZS4X
X-Gm-Message-State: AOJu0YwdgmSR3p/XkcUopmuQK6Zr/D1HK3HfH8szr6KkbfbCrdetHuHz
	ZgB+eGk8wJBmGCBFsoXNQbCnixp7RpiVJWhSxaCeZxOhIuymb7jNmbimoMJB41Q=
X-Received: by 2002:a17:907:72c9:b0:a52:53f3:af3c with SMTP id du9-20020a17090772c900b00a5253f3af3cmr8756708ejc.10.1713294101517;
        Tue, 16 Apr 2024 12:01:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id cw4-20020a170906c78400b00a4e58c74c9fsm7141780ejb.6.2024.04.16.12.01.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:01:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Ani Sinha <anisinha@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v4 18/22] hw/i386/pc: Remove PCMachineClass::rsdp_in_ram
Date: Tue, 16 Apr 2024 20:59:34 +0200
Message-ID: <20240416185939.37984-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rXaR9jNAF5L9

PCMachineClass::rsdp_in_ram was only used by the
pc-i440fx-2.2 machine, which got removed. It is
now always true. Remove it, simplifying acpi_setup().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/i386/pc.h |  1 -
 hw/i386/acpi-build.c | 35 ++++-------------------------------
 hw/i386/pc.c         |  1 -
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 10a8ffa0de..96ccb4583f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -100,7 +100,6 @@ struct PCMachineClass {
 
     /* ACPI compat: */
     bool has_acpi_build;
-    bool rsdp_in_ram;
     unsigned acpi_data_size;
     int pci_root_uid;
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ab2d4d8dcb..ed0adb0e82 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2495,7 +2495,6 @@ static
 void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 {
     PCMachineState *pcms = PC_MACHINE(machine);
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
     DeviceState *iommu = pcms->iommu;
     GArray *table_offsets;
@@ -2667,16 +2666,6 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             .rsdt_tbl_offset = &rsdt,
         };
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
-        if (!pcmc->rsdp_in_ram) {
-            /* We used to allocate some extra space for RSDP revision 2 but
-             * only used the RSDP revision 0 space. The extra bytes were
-             * zeroed out and not used.
-             * Here we continue wasting those extra 16 bytes to make sure we
-             * don't break migration for machine types 2.2 and older due to
-             * RSDP blob size mismatch.
-             */
-            build_append_int_noprefix(tables->rsdp, 0, 16);
-        }
     }
 
     /* We'll expose it all to Guest so we want to reduce
@@ -2755,7 +2744,6 @@ static const VMStateDescription vmstate_acpi_build = {
 void acpi_setup(void)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -2817,25 +2805,10 @@ void acpi_setup(void)
                            tables.vmgenid);
     }
 
-    if (!pcmc->rsdp_in_ram) {
-        /*
-         * Keep for compatibility with old machine types.
-         * Though RSDP is small, its contents isn't immutable, so
-         * we'll update it along with the rest of tables on guest access.
-         */
-        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
-
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
-        fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
-                                 acpi_build_update, NULL, build_state,
-                                 build_state->rsdp, rsdp_size, true);
-        build_state->rsdp_mr = NULL;
-    } else {
-        build_state->rsdp = NULL;
-        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
-                                                 build_state, tables.rsdp,
-                                                 ACPI_BUILD_RSDP_FILE);
-    }
+    build_state->rsdp = NULL;
+    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE);
 
     qemu_register_reset(acpi_build_reset, build_state);
     acpi_build_reset(build_state);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c4a7885a3b..a1b0e94523 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1745,7 +1745,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     pcmc->pci_enabled = true;
     pcmc->has_acpi_build = true;
-    pcmc->rsdp_in_ram = true;
     pcmc->smbios_defaults = true;
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
-- 
2.41.0

