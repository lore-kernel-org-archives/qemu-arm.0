Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp517175lfb;
        Fri, 7 Jan 2022 17:45:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzg6qro2ddqGZNn60mt+qtMcuaBv/gwfp1yIhwhjF3+KMDBxN17E0vJUCUJQBynlcOY6L89
X-Received: by 2002:a5b:b10:: with SMTP id z16mr3660907ybp.537.1641606348927;
        Fri, 07 Jan 2022 17:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641606348; cv=none;
        d=google.com; s=arc-20160816;
        b=YqrU4nprEEV8+26ABznqGRB+lVhpzDXHaNOrU2+Y6etp9I1ThmZs2aAg1YjRLYbI0Y
         onlhujHu9+fDIiUn2m3Ulotg04i/qnw9a5nKYWpxTIlN8CqmaLRvWiFWXDi/E0am34G+
         NExTvf1blSvc+hxmQBFoEUYxZGxYd/jSy0LlCRvt9LlqBvvBetMo9xScvsD2wrwLFZoD
         aItC3V+jAgUhaebqra1uxryFscB8RctqawcZXT+7I0hiA/N9gezauROSB8z+8STQJh0/
         HsrhSVmo0c13e5gYpekrERGmr8m48eLe1ypLmbzj2A/WImFJ6GoZcN+IGm4X0/IvUBZ2
         6teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
        b=cVrVnB3dzspydvKS3ykKo1BKl1szkvnnSETwPYN2RIvIJ5RpydQQiHjJtyvj5lF8QS
         Hl2kN9vQMfDncI47Pn5ZILA96di8nmJsI4G7w1RkFuSe+OWybeQJmzXD0PsNkXQz/Yz2
         9KUmXMA/IfucIk/6/5xSdxSMFkTzVZDg01o2PYe55Xo0pC0+GzOFmrdQR+mm29HdQ+9M
         YqCaj21oLMA1cHQ7htRIWoOR39uJB4wpiHo+eIR+NcFxnAhwIn45rvJwrlvPaB6ChWSa
         ZZ0WE35S/ZaaEWlNfP0LX+ZXan+g9umV9/u3LZhHLYuGdx75lGHORp4A0gmuU5UnjXSC
         Qflg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eHM9slhF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si270275ybp.305.2022.01.07.17.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 17:45:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eHM9slhF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n60nk-0001h8-9j
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 20:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AE-0004WZ-Dc
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AB-0002P0-Sg
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=eHM9slhFfUQNn3nNemNWsAb3z9Gf0QW+D/IaRLcEKImfyhajB/zuUNBR/rCXqau6N6Aqn0
 GNi9CBC1dIGcc7wOryozu6PRIhzpRfiUH0QLtb1YRu/nHfcYBiy8X0up6rIbFtr5eMJYzF
 Nv6ak88Rf7K3dYjjLI1yQmNtk+AW7vA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-ph9aAUEMMIOaOU_EfQb8KQ-1; Fri, 07 Jan 2022 20:04:54 -0500
X-MC-Unique: ph9aAUEMMIOaOU_EfQb8KQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b9-20020a7bc249000000b00347c5699809so1587088wmj.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=I+msvpR9NQc1ZGpAQaWzjPY7BHTsNRDNYY52EFhmDuZmuyzRh2suM2fX7GkcZx2O1o
 ugOyHtavtzJoRZDqqWTP6c60ETMXrzBCb6z8mDQpE3Snckc2nB0U13kKaMJJQcfHX3Yt
 p2qZazMVx+XNkMOUV7AUAkxJghb4+v8IzpgIxiwfifzDMTyX+8pSzlUyYt8wnXMu4sKe
 GvG8/VbAMy2kSOgb6yU0jzmpMALVvWVMYDr3Oo6SBR7+L2k3s/1J3vX48dBNKUfrJGna
 D3F4vebwA5z31bVMsTcR3Qd97piJadTfp+vNl0QhRS39//qgW65Cp/7WrSGE9vba68Kd
 0iwg==
X-Gm-Message-State: AOAM531Z6xPHM24KAsv6b0o8t2XgQEWmeTGLVKuWhMbZ0zjx/XAVPUNs
 bcuR40uDaMdjUK1XJGB4g8kwhU3Z4Vraf1MA+yp5LFav8ftp7z9gJvhvUw0AUr7V3bXWuggruFu
 WRwNKN/CzGxW6KIIds4oZXrvGb5TPrhAtvg5s2jqWqRzBKHAOePqNcj9S0MTO
X-Received: by 2002:a5d:6b8b:: with SMTP id n11mr7155863wrx.296.1641603892742; 
 Fri, 07 Jan 2022 17:04:52 -0800 (PST)
X-Received: by 2002:a5d:6b8b:: with SMTP id n11mr7155846wrx.296.1641603892530; 
 Fri, 07 Jan 2022 17:04:52 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id p13sm251104wrs.54.2022.01.07.17.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:52 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 25/55] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Message-ID: <20220108003423.15830-26-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBtDxWY2X3p3

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

