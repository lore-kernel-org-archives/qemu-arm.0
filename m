Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp32550lfb;
        Fri, 7 Jan 2022 03:33:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx081bhzfyWpO4vknC1tIkKN4KcPY9EW9ahikQ5OOOvRmnrIu9twWxDVRIuXB/RZX3NR7XP
X-Received: by 2002:a05:6902:124e:: with SMTP id t14mr86791219ybu.65.1641555228995;
        Fri, 07 Jan 2022 03:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641555228; cv=none;
        d=google.com; s=arc-20160816;
        b=PtIm+aMBJ2kctPP14NNPYTL3NcWdf/Fy/rimR6+BHGO7I6Du18XDJ9Qr4VdIG7mkS5
         oBMKzzmTyvskyj4/6WMMmB/nJ0jniJKcCQta5N+eIDPUkF2ZiVrfjO9gh5A9aBTB+ccf
         jsb3yEgvNIQcdOprHZgPJeCWEvzBA5Ji1Ld5btb8/R6auQWOjZMvvFintIumV7CaR8uS
         1fboB+gw82VKcbAutKVato3+MiCk05pNfxtuirdP/nYVSUF67/l1G+n0L9sz9XnjVKvC
         a8jABMM6Eb/TYYUgeY4tpRqutk88AVJP8zXEl+uKwlWd+Css2gQqur2lWQOYqsaYpno2
         043A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
        b=G7DvU1M2bNvw1wxynduqJ8v4OZY5jIpw6DMm0IpMliGRVy8IFphn3bOmAl/fU4tBj1
         Zxsc/EO8pTYExoP32KbmHy2aeD4wbL75ddyTOAfE88h7R3euhf60/FRrpY7FN52jVEPs
         Hegtltx2cYInys0LImJiFi3pucn/a4MVpFT7pkpzG32+XuGQ38l6o5fkot4M2ljAVoiK
         AFL74NEHYX32aCl5m/L7FDQb1Uwqz7mf6HWGPaq4wkf04oZ6l9oAi9TWjm8KBFQNWfbb
         4TlvCrkUMuY9H9okL6NXiravAXDIW25b1XfG3RM2CnIAqQk0aRhaixweCzCrysSSwvof
         HLYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TUGGeoiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si3129013ybr.580.2022.01.07.03.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 03:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TUGGeoiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5nVE-0007Na-BM
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 06:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2u-0000gj-3i
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 06:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2q-0001uV-NV
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 06:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=TUGGeoiYJy/PnSiKujFQpQFvVtS+btILNK8EPqHOoZgJBt3apqtQVaP32EniXyFrdBL5Wu
 W6vqnv6CsDz3ISW52palMBbKBQ3J2+UlrpzA6LuDCLlIGr4r/IP1iXewDaXSKW5m5Os+pt
 Kyz3DP74tLUYhgO1hbghcFG0EeUqOG4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-uKKGqaBYNVOHTHqQgOkQQA-1; Fri, 07 Jan 2022 06:04:23 -0500
X-MC-Unique: uKKGqaBYNVOHTHqQgOkQQA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso2112046wrg.22
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 03:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=kToiKTGJK4oRm2WO1dM8ewmL9ED1KSzNHuM/3sNP5x82QnhYauf9QndMN1BEQPjzV1
 T6DbKZv4us5J4vloxsW7OQar7Rqn18UB+RS1oaQA7Iz2vWZwKX4YrO9kzITIn5ZY+77X
 v12lMo/NR1drsbvFpAmzJkIfOdQbX+ULaWVg32IIh1qrRk9f2ecAMCMWcKo2o4SewBR8
 t8J0L0BegH5uvo/FDTGSjSoLIo0iSS+KLanRV+qKr4Kh21YsuUHnZ+E9Vg3DBQ1ij1FK
 QYGywWcRfLt2d/IVi60XwnDUT/Qh/3VsB9VtxMY4T4OVdX4rWqxKU3bu6u6It1sJLFcC
 XGuw==
X-Gm-Message-State: AOAM533Att4OUn7zj4PldzsHsKyrHzMVxeVVh78jrf2zpLJiFNEABiQJ
 d2w6/SbLzKZDx+BwPpWgEAzKCs5ywn5xaQf2XafLF8vzyQWugKupFyb3yI8njsfb0X6KDdW/Jsp
 gFsAPWZNz/7UF
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr52749408wry.718.1641553461891; 
 Fri, 07 Jan 2022 03:04:21 -0800 (PST)
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr52749394wry.718.1641553461719; 
 Fri, 07 Jan 2022 03:04:21 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id t12sm5404450wrs.72.2022.01.07.03.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:21 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/55] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Message-ID: <20220107102526.39238-26-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7hT9LBfBsveh

From: Eduardo Habkost <ehabkost@redhat.com>

Rename the enums to match the naming style used by QAPI, and to
use "32" and "64" instead of "20" and "31".  This will allow us
to more easily move the enum to the QAPI schema later.

About the naming choice: "SMBIOS 2.1 entry point"/"SMBIOS 3.0
entry point" and "32-bit entry point"/"64-bit entry point" are
synonymous in the SMBIOS specification.  However, the phrases
"32-bit entry point" and "64-bit entry point" are used more often.

The new names also avoid confusion between the entry point format
and the actual SMBIOS version reported in the entry point
structure.  For example: currently the 32-bit entry point
actually report SMBIOS 2.8 support, not 2.1.

Based on portions of a patch submitted by Daniel P. Berrangé.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211026151100.1691925-2-ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/firmware/smbios.h | 4 ++--
 hw/arm/virt.c                | 2 +-
 hw/i386/pc_piix.c            | 2 +-
 hw/i386/pc_q35.c             | 2 +-
 hw/smbios/smbios.c           | 8 ++++----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 5a0dd0c8cf..d916baed6a 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -27,8 +27,8 @@ struct smbios_phys_mem_area {
  * SMBIOS spec defined tables
  */
 typedef enum SmbiosEntryPointType {
-    SMBIOS_ENTRY_POINT_21,
-    SMBIOS_ENTRY_POINT_30,
+    SMBIOS_ENTRY_POINT_TYPE_32,
+    SMBIOS_ENTRY_POINT_TYPE_64,
 } SmbiosEntryPointType;
 
 /* SMBIOS Entry Point
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4593fea1ce..b45b52c90e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1589,7 +1589,7 @@ static void virt_build_smbios(VirtMachineState *vms)
 
     smbios_set_defaults("QEMU", product,
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
-                        true, SMBIOS_ENTRY_POINT_30);
+                        true, SMBIOS_ENTRY_POINT_TYPE_64);
 
     smbios_get_tables(MACHINE(vms), NULL, 0,
                       &smbios_tables, &smbios_tables_len,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1999190276..25f918b609 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -177,7 +177,7 @@ static void pc_init1(MachineState *machine,
         smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_21);
+                            SMBIOS_ENTRY_POINT_TYPE_32);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2e981f436c..1103fbcd90 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -200,7 +200,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_21);
+                            SMBIOS_ENTRY_POINT_TYPE_32);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e56737..6013df1698 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -62,7 +62,7 @@ uint8_t *smbios_tables;
 size_t smbios_tables_len;
 unsigned smbios_table_max;
 unsigned smbios_table_cnt;
-static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_21;
+static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_32;
 
 static SmbiosEntryPoint ep;
 
@@ -432,7 +432,7 @@ static void smbios_validate_table(MachineState *ms)
         exit(1);
     }
 
-    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
+    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
         error_report("SMBIOS 2.1 table length %zu exceeds %d",
                      smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
@@ -927,7 +927,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
 static void smbios_entry_point_setup(void)
 {
     switch (smbios_ep_type) {
-    case SMBIOS_ENTRY_POINT_21:
+    case SMBIOS_ENTRY_POINT_TYPE_32:
         memcpy(ep.ep21.anchor_string, "_SM_", 4);
         memcpy(ep.ep21.intermediate_anchor_string, "_DMI_", 5);
         ep.ep21.length = sizeof(struct smbios_21_entry_point);
@@ -950,7 +950,7 @@ static void smbios_entry_point_setup(void)
         ep.ep21.structure_table_address = cpu_to_le32(0);
 
         break;
-    case SMBIOS_ENTRY_POINT_30:
+    case SMBIOS_ENTRY_POINT_TYPE_64:
         memcpy(ep.ep30.anchor_string, "_SM3_", 5);
         ep.ep30.length = sizeof(struct smbios_30_entry_point);
         ep.ep30.entry_point_revision = 1;
-- 
MST

