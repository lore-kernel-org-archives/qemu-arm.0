Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1152796ejb;
        Thu, 7 Mar 2024 05:51:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZF6QAKEjs5om5ob9MYMVzbrlvzpPMdW/URo14TJpjK61/96QlYKyEIHOjkA5Yjmp5Q3ljEx8KxW6Atn2d62uLmYJGK2K8
X-Google-Smtp-Source: AGHT+IFWA/oaRWPXQlIu+prTpfW+MyPh9vMel+EPMLHSDjY3o3Yt1dBLbpHZtPdKZ5zmzmxiUKMA
X-Received: by 2002:a05:622a:1450:b0:42e:ec0a:3ea2 with SMTP id v16-20020a05622a145000b0042eec0a3ea2mr6249163qtx.4.1709819505635;
        Thu, 07 Mar 2024 05:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819505; cv=none;
        d=google.com; s=arc-20160816;
        b=qY/etzNZul1HsKtFq00PtYWBaR6/X7aHhSSBEJugd5b+GOefY4R93OySXVLRNpwdW4
         scaII+uVdoyDRu7TIudiJgTcji+qYKQnOdaUtD42cWbxxZ5Fpu+/Uk1Qs/5a6MLLHdvp
         p3HYTBmdaA81uoXOzF2SDycI2U79lI5WRx1EOpElSmyp0fY+G20AoKnji8m8uV4mz+Ss
         l/fWTuKvQri0fOFHUfJbw/IO7zaOYFU+cYuzKSV2iS5rMRH/LpeACdDN2D6FoI1SOgOJ
         mRNHhUEogeI2PBRlXCPoyC9tojpuyDqNRNRWk5B7P7HA0wXLvFcjgbsNTh0WBBueXcnV
         gjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=chKv2cBabJOJEUIJJ5A4r+Q2wAgq0Jq23Cv/UF3W8pk=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=WsXK6qihXUXWRFV9VrlwpPllfodt30t06eCj5bOy5kOUmEQnjeknbMhpaQAKfw+QkU
         ezK/Q3HaYtyhloEjChTdNRwm/WUhHSAInEL4hV2NfqgWv92i/6FhzrkSiNzikuGBh7yg
         DHLavyNBtH+L+tfps7w6P/Co2on69UmBhnIiXlp6ZSuxfzH69U2u9pqqr6eaD2rubALc
         JFnoFXySlzCFVpjvbVUII2wSG3JtPgKuADyqJWFJSSb19Ckx5qJbDcoKm1HB+GdTXCyh
         awdmMmHhSsuXrygrRhJ4VEm6RyFoGgqfvbTGzxmuyTLOuTCjzfiTmj/bjCY21G6HmOXG
         D/8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cKxsxfNK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a190b00b0042eb3d46ac2si3409296qtc.775.2024.03.07.05.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:51:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cKxsxfNK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riE7H-0006n4-T9; Thu, 07 Mar 2024 08:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4g-0005Bu-TA
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4C-0007M8-VS
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chKv2cBabJOJEUIJJ5A4r+Q2wAgq0Jq23Cv/UF3W8pk=;
 b=cKxsxfNKJONRMMwVQCIB5Pqd7MCZSEy/tCM8aylOR2Gkzws/nfoCYwCEw2bBRC2Kw6EBR0
 8H6f9pfcbILxRxgwAMb2BIy/S8dgWTiu13eTkaxgy7ZWm/20hM1jaPQBW7R8QVPj0yQo7v
 24AO6sNXuCf8Wl0MlqVz6NBaPZDeJ10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-AwK_PLSFO-adyOL0ev9Hzw-1; Thu, 07 Mar 2024 08:45:23 -0500
X-MC-Unique: AwK_PLSFO-adyOL0ev9Hzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13FA28F4781;
 Thu,  7 Mar 2024 13:45:22 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3C417AA5;
 Thu,  7 Mar 2024 13:45:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 8/9] hw/arm/virt: Set virtio-iommu aw-bits default value to
 48
Date: Thu,  7 Mar 2024 14:43:09 +0100
Message-ID: <20240307134445.92296-9-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gMpuyYQRqWoL

On ARM we set 48b as a default (matching SMMUv3 SMMU_IDR5.VAX == 0).

hw_compat_8_2 is used to handle the compatibility for machine types
before 9.0 (default was 64 bits).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <Zhenzhong.duan@intel.com>

---

v6 -> v7
turn arm_virt_compat and arm_virt_compat_len static
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..e5cd935232 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,11 +85,28 @@
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
 
+static GlobalProperty arm_virt_compat[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
+};
+static const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
+
+/*
+ * This cannot be called from the virt_machine_class_init() because
+ * TYPE_VIRT_MACHINE is abstract and mc->compat_props g_ptr_array_new()
+ * only is called on virt non abstract class init.
+ */
+static void arm_virt_compat_set(MachineClass *mc)
+{
+    compat_props_add(mc->compat_props, arm_virt_compat,
+                     arm_virt_compat_len);
+}
+
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
                                                     void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
+        arm_virt_compat_set(mc); \
         virt_machine_##major##_##minor##_options(mc); \
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
         if (latest) { \
-- 
2.41.0

