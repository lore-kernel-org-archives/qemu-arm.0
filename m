Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2757341ejf;
        Tue, 27 Feb 2024 07:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW83Ayz/cu02xSKjXct9+OJGxI/l725gkOWVp8b/Igp0C9EwRaRnTFVnGRdEfXhJt6tDCLtAFaedJkYX3tI/WNqk/TWd+H6
X-Google-Smtp-Source: AGHT+IGjO2XzSLevGQBKgOxBR7rrDGlcuXCvgcLwBq3miIzQeFM6smU5sHV+LlUiG4yk+bDd/KS8
X-Received: by 2002:a05:620a:89a:b0:787:8545:80c2 with SMTP id b26-20020a05620a089a00b00787854580c2mr2230677qka.69.1709049149919;
        Tue, 27 Feb 2024 07:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049149; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCSixOeU+mBbKm3xluoJ3pcHxPq0Nv5dINdfhO1AD3/we/0X7fIjCbm9TM0OiXT8XM
         4M5/ctir5Yi/nW7GvYWS61WEJdK+yuWC6AH1lTccWxD2ghjbs+5m5vfi0r8/uT85e704
         y33QQOqyMI0GR/DMPg3hh5I1SeRnu85SRgYEQZeBn3JKeUy2Kxha+6EUUAbFAOnrMacu
         lvbK/AlkC9L8SS8t+trSJd5pmFrX15LosgB/UfqmWCxjSlQZ2shHgutfKxqA5/HPkbge
         hxENdxhmdZDnyde/NfTOci0YjrKqrRQvScLzwcZuyGj7HCtrcliEE8N7R38k0yGSlH5M
         GavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mkrYl/L2qewinMkdi46s9dPukuho+AuaXC5gtN/W/YI=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=Gsy7RDBV6AOpeoktj5U2yMCtwmTPFAxkEqX2+8vpLrrm/xOEbERr5p74qoe/uUFm80
         XGNW+yLuhjM+GkX8QKM76S4DDUkEoUwWv2ZPsPLm184OY3EGx8+c7oThgqtAVDNNg1uz
         EnkAVG2mwOWjPrwnTfBJSrnulSIGoq6V7rRu3+kVoLXetG5zWXdx+aavaQ6xGo0ImDtB
         U1PV4crylO65dHU/hBlKr1yLAT868nAO8NZivXmlqBZUXm3dwm7P4vH5SZFexLuql1Df
         wAmcyI6ylwgRcA2bZlpfH3rUsL7Db8IVzui1U/0/CP4RRI6sXnlFaQ3GuRnlcK1BMfOW
         rVRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IjAoH8iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a13ea00b00787722a2a36si7434955qkl.183.2024.02.27.07.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:52:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IjAoH8iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rezh4-0005gj-Fn; Tue, 27 Feb 2024 10:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezh2-0005eo-Gt
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 10:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgy-0008RG-T4
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 10:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkrYl/L2qewinMkdi46s9dPukuho+AuaXC5gtN/W/YI=;
 b=IjAoH8iDZtBw6OKF135WN1FwkWlww5nLcTgc7UAAnwJywArpYd7EzUchMeKEj60Q/fFUxF
 6o8BjpmgaNyq9XNvDBKKxv6Sku88mUp7Qpqn0WqryZMzW6H1eKHV6PzWjOn3tKsPWX0eHq
 Q9j5EaXyH2kmHiud3SE354i74hg1Xt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-rhUv_VVwMva4olEgfeqEnQ-1; Tue, 27 Feb 2024 10:48:24 -0500
X-MC-Unique: rhUv_VVwMva4olEgfeqEnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DBE383DE32;
 Tue, 27 Feb 2024 15:48:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC7CC2166AE1;
 Tue, 27 Feb 2024 15:48:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 08/19] smbios: don't check type4 structures in legacy mode
Date: Tue, 27 Feb 2024 16:47:38 +0100
Message-Id: <20240227154749.1818189-9-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hGjsUJlvaU++

legacy mode doesn't support structures of type 2 and more,
and CLI has a check for '-smbios type' option, however it's
still possible to sneak in type4 as a blob with '-smbios file'
option. However doing the later makes SMBIOS tables broken
since SeaBIOS doesn't expect that.

Rather than trying to add support for type4 to legacy code
(both QEMU and SeaBIOS), simplify smbios_get_table_legacy()
by dropping not relevant check in legacy code and error out
on type4 blob.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 * The issue affects 'isapc' and pc-i440fx-2.0. the later is
   in deprecated state and to be dropped in near future
 * possibly the same issue applies to other SMBIOS types above type 1
   but I haven't tested that, and well tables that aren't
   generated by SeaBIOS can get be added just fine
   (tested type11 blob). So I went with a minimal change
   to fixup type4 only that I'm touching. Leaving the rest
   for other time or when someone complains about it, which is
   very unlikely given it's really only remaining isapc machine.

   I'd very much prefer to deprecate 'isapc' and then drop
   all legacy related code (it will benefit not only SMBIOS
   but other code as well).
   BTW: 'isapc' is in semi-dead, I cna't boot RHEL6 on it
   with KVM enabled anymore (RHEL9 host), TCG still boots though.
   One more reason to get deprecate it.
---
 include/hw/firmware/smbios.h |  2 +-
 hw/i386/fw_cfg.c             |  3 +--
 hw/smbios/smbios.c           | 18 ++++++++++++++----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 0818184834..1fbff3c55f 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -296,7 +296,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version,
                          bool uuid_encoded, SmbiosEntryPointType ep_type);
 void smbios_set_default_processor_family(uint16_t processor_family);
-uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length);
+uint8_t *smbios_get_table_legacy(size_t *length);
 void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index c1e9c0fd9c..d1281066f4 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -71,8 +71,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
 
     if (pcmc->smbios_legacy_mode) {
-        smbios_tables = smbios_get_table_legacy(ms->smp.cpus,
-                                                &smbios_tables_len);
+        smbios_tables = smbios_get_table_legacy(&smbios_tables_len);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
                          smbios_tables, smbios_tables_len);
         return;
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index aa2cc5bdbd..97cf762228 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -482,14 +482,17 @@ opts_init(smbios_register_config);
  */
 #define SMBIOS_21_MAX_TABLES_LEN 0xffff
 
-static void smbios_validate_table(uint32_t expected_t4_count)
+static void smbios_check_type4_count(uint32_t expected_t4_count)
 {
     if (smbios_type4_count && smbios_type4_count != expected_t4_count) {
         error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
                      expected_t4_count, smbios_type4_count);
         exit(1);
     }
+}
 
+static void smbios_validate_table(void)
+{
     if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
         error_report("SMBIOS 2.1 table length %zu exceeds %d",
@@ -574,7 +577,7 @@ static void smbios_build_type_1_fields(void)
     }
 }
 
-uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
+uint8_t *smbios_get_table_legacy(size_t *length)
 {
     int i;
     size_t usr_offset;
@@ -587,6 +590,12 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
         exit(1);
     }
 
+    if (test_bit(4, have_binfile_bitmap)) {
+        error_report("can't process table for smbios "
+                     "type 4 on machine versions < 2.1!");
+        exit(1);
+    }
+
     g_free(smbios_entries);
     smbios_entries_len = sizeof(uint16_t);
     smbios_entries = g_malloc0(smbios_entries_len);
@@ -613,7 +622,7 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
 
     smbios_build_type_0_fields();
     smbios_build_type_1_fields();
-    smbios_validate_table(expected_t4_count);
+    smbios_validate_table();
     *length = smbios_entries_len;
     return smbios_entries;
 }
@@ -1180,7 +1189,8 @@ void smbios_get_tables(MachineState *ms,
     smbios_build_type_41_table(errp);
     smbios_build_type_127_table();
 
-    smbios_validate_table(ms->smp.sockets);
+    smbios_check_type4_count(ms->smp.sockets);
+    smbios_validate_table();
     smbios_entry_point_setup();
 
     /* return tables blob and entry point (anchor), and their sizes */
-- 
2.39.3

