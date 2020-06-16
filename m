Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2452565lfm;
        Tue, 16 Jun 2020 02:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH9s6uPHkY0QJbZnlAEYgzgbcXNRiNR2lUq7YeoAQvqKMHvBsa6meWlHYG9fHBRiJhBaaX
X-Received: by 2002:a5b:a89:: with SMTP id h9mr2825128ybq.93.1592300142079;
        Tue, 16 Jun 2020 02:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592300142; cv=none;
        d=google.com; s=arc-20160816;
        b=P1a8GFkPefiWK58M2TM5KDVDFpv4/opck0wFN8AVG+YC3jQ3c+G8DFffIc0haPDybI
         mgRKeIaeGLKIV3EHmKM/uaR8L1y8dCE53NpwaxyLqLamNDzoRW10Zxr4eY4eSMgxPDdd
         oJ6mQ+kWgoNjTqmbLte+VhUsNcGMSFgEhGjWE4aIlGT0b1KkVIHbiikusrpMQAZF1RRP
         CMGmkoL664InlXHZ41somzAsljJ/D1DqOqhaw/1kcavX0oRlNgErgQUl4wWY8SiYa56k
         ldixgIQkG/l5g34lRcphMeOUCFckuPwjyplS//NNpMe05Ps2Y8VY2Cnr3f0N0+jju6TD
         klLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8SGbUa5+kScoNVcRXTCB4YknzJMqgnTYIwn/VkDbm8Q=;
        b=MCrnYtWOcmynCRhjD48g8Ctp2EHG+L8r2zyEVBTlXbLwChCrRGHASgYDYDtOLqpwZP
         8Xf/bqSB0PTGauPqKLqTNnJ+dUyAmXA7XEQ/RD+nzClWzNqDAPmISneuOdYi/gRV3F0Y
         euK4mvtlXE2ksj6sqItSg+LDmLrmlFjn/Ffs4mg/CichYlXNYLREEu5RrvDSrkW3jOwk
         8ksk+f5YvnY9Txz0jnUZcV0JrG7uxEvJIcFLpf/EpcW4C+y00Eor4PnBOlV4F3bzG+IG
         D6+OBhea+M3YEl7NMOtpTY6l+rP2wCsf2tjeuYMygsCG4PNv9bud1S8N2TOY7IJboUov
         3nAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NaCD891c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v73si16466732ybv.195.2020.06.16.02.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NaCD891c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl80L-0000L7-Cn
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 05:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl803-0000Ix-Vv
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24243
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl801-0000EC-LD
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592300120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SGbUa5+kScoNVcRXTCB4YknzJMqgnTYIwn/VkDbm8Q=;
 b=NaCD891ccCGu8iy6iN8DKzs8tP31Xm3VKhXU83m3s0Aqvs6597z9CYwCUQp+4SthHtDXs5
 SVLLITlWjsghApyVlHyHP9BBqzcb6CFYR8JyFV2Fa5jBy5hSZuMZW5rVfgIOs2zSdcGZYF
 4TZwS28TrabVlX5Ydm1Kl/JfBrupHOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-4pCK9rG8MZGnD88is5yC_g-1; Tue, 16 Jun 2020 05:35:18 -0400
X-MC-Unique: 4pCK9rG8MZGnD88is5yC_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8973687342B;
 Tue, 16 Jun 2020 09:35:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 470DC5C1BD;
 Tue, 16 Jun 2020 09:35:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 1/3] acpi: Some build_tpm2() code reshape
Date: Tue, 16 Jun 2020 11:34:55 +0200
Message-Id: <20200616093457.24709-2-eric.auger@redhat.com>
In-Reply-To: <20200616093457.24709-1-eric.auger@redhat.com>
References: <20200616093457.24709-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +G14A9bZPbrT

Remove any reference to Acpi20TPM2 and adopt an implementation
similar to build_ghes_v2().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2cb7b991ef..6e2d7d19f9 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1880,46 +1880,53 @@ build_hdr:
 
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
-    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
-    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
-    unsigned log_addr_offset =
-        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
     uint8_t start_method_params[12] = {};
+    unsigned log_addr_offset, tpm2_start;
+    uint64_t control_area_start_address;
     TPMIf *tpmif = tpm_find();
+    uint32_t start_method;
+    void *tpm2_ptr;
 
-    /* platform class */
+    tpm2_start = table_data->len;
+    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
-    /* reserved */
+    /* Reserved */
     build_append_int_noprefix(table_data, 0, 2);
     if (TPM_IS_TIS_ISA(tpmif) || TPM_IS_TIS_SYSBUS(tpmif)) {
-        /* address of control area */
-        build_append_int_noprefix(table_data, 0, 8);
-        /* start method */
-        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO, 4);
+        control_area_start_address = 0;
+        start_method = TPM2_START_METHOD_MMIO;
     } else if (TPM_IS_CRB(tpmif)) {
-        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
-        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
+        control_area_start_address = TPM_CRB_ADDR_CTRL;
+        start_method = TPM2_START_METHOD_CRB;
     } else {
-        g_warn_if_reached();
+        g_assert_not_reached();
     }
+    /* Address of Control Area */
+    build_append_int_noprefix(table_data, control_area_start_address, 8);
+    /* Start Method */
+    build_append_int_noprefix(table_data, start_method, 4);
 
-    /* platform specific parameters */
-    g_array_append_vals(table_data, &start_method_params, 12);
+    /* Platform Specific Parameters */
+    g_array_append_vals(table_data, &start_method_params,
+                        ARRAY_SIZE(start_method_params));
 
-    /* log area minimum length */
+    /* Log Area Minimum Length */
     build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
 
     acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false);
 
-    /* log area start address to be filled by Guest linker */
+    log_addr_offset = table_data->len;
     build_append_int_noprefix(table_data, 0, 8);
+    /* Log Area Start Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   log_addr_offset, log_addr_size,
+                                   log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
-                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
+                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
 }
 
 /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
-- 
2.20.1

