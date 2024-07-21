Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307386njc;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0O4joGZ1OQcazhYTp1HMaiTSxbcOieJCeYBbOQHyTeuO25JnikeBaeBI1FKHKC1Ns5YQBC8vv91T0cxBwgtvGOIIG6Edl
X-Google-Smtp-Source: AGHT+IEG/V7AK6nMA+ORGGD+zr3AK3pu595MT8ELUsBM3yYSRuAt05huTyy5As5a1tazMtSYDJ2A
X-Received: by 2002:ad4:5f86:0:b0:6b2:cab4:4ccf with SMTP id 6a1803df08f44-6b95a5d41f8mr69085626d6.26.1721549720164;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549720; cv=none;
        d=google.com; s=arc-20160816;
        b=s6HkdPCAM9tC2JhtAGKYILRWeujUK1FSogTLxn1pWsk7zVgP04hFo49qxujNygJlAl
         Z1NwE7h+1kUyXHqxj/6DwGx6SQjkyyyv7R3VOl8JH4rcW6v2BrzYbUxwcsQAf5onhbwl
         oHO5iO/RWMFOMhbXawJmnm1xb144Q2HzLU+LZjmvA8MX1l5RYxxRKLKRp/tCqnym2aSH
         +pPqvMok09kkLCHhwizk1e7JjmNr0bKv1IibGaFRk2h4usyMRI4H8XNNI+AjrjTt+WFy
         MWsyzqKCVYdhAT5KU2ao9mFOpFI00piA30Ev3H56evuabKeV2O26w06lIFTY+NPeH35O
         sLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SoWDEWeRyafczy0kRlUFdzJpMXl9mD6SFtZDtXyCWmY=;
        fh=LlOmBw4GbUlDF52fQ9hCMPVPTJOoo92XRnaOjjrcWE0=;
        b=oOUbu/s3uxd4JnFagdjLXKnVTZD0PFoKR7w9BLzG1umAwQT3X96pFtPkuCHg7ia3UM
         VQQ+73aLuT1jQdH833H6GAnO9UirS3/aziHf28Y4qub+CEKqgvyXigJGveH0EqKDNeHU
         gzW6lX2hkThnBPJheUXWDY2Ajd4gxRxMqw6TlIt6cxihpRPXgp/nzSMekTOedibH3Iju
         I52poK7Zcle6XlWiGSJw8enbQFu4XHnsucHddZ1DyY5q9S6WyfeLG3GH6/Se6sY8QCZr
         +yJKSToEp8zwSkKXRUI/1eY131HPFWGVbCpDGCxi/mFCDzmzHRLxQ6sfbvOwkE1XlvRC
         b6Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kp5a7RDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acb0f2desi55791666d6.545.2024.07.21.01.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kp5a7RDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiS-00017B-8U; Sun, 21 Jul 2024 04:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiD-0000pi-My
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiC-0001QK-3m
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoWDEWeRyafczy0kRlUFdzJpMXl9mD6SFtZDtXyCWmY=;
 b=Kp5a7RDhnpOwtV5bTKpMJMFNGrx+5lt8EzOYlDUb+pIgMo6fP9mP8ma1G+rPww9KMUyInJ
 Q67CJSQBQ2k7Rm3kvF33rN/WV93WhITQWgtnwl2BB/7fZyZkqlzOQXEd5P+Nkcrws+Rz90
 dfMw2xs9dbtpom+NcVGmDk7oFdtKqlg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-e7F6L2NqOOCXkccqVi28dQ-1; Sun,
 21 Jul 2024 04:14:28 -0400
X-MC-Unique: e7F6L2NqOOCXkccqVi28dQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 20EAE1955D42; Sun, 21 Jul 2024 08:14:27 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 156A51955D4D; Sun, 21 Jul 2024 08:14:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/15] aspeed: Introduce a 'boot-emmc' machine option
Date: Sun, 21 Jul 2024 10:13:55 +0200
Message-ID: <20240721081401.425588-10-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: d+aGPa9wEnou

From: Cédric Le Goater <clg@kaod.org>

The default behavior of some Aspeed machines is to boot from the eMMC
device, like the rainier-bmc. Others like ast2600-evb could also boot
from eMMC if the HW strapping boot-from-eMMC bit was set. Add a
property to set or unset this bit. This is useful to test boot images.

For now, only activate this property on the ast2600-evb and rainier-bmc
machines for which eMMC images are available or can be built.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/arm/aspeed.rst |  2 ++
 hw/arm/aspeed.c            | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cd9559e3e291..6733ffd2b941 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -123,6 +123,8 @@ To boot the machine from the flash image, use an MTD drive :
 
 Options specific to Aspeed machines are :
 
+ * ``boot-emmc`` to set or unset boot from eMMC (AST2600).
+
  * ``execute-in-place`` which emulates the boot from the CE0 flash
    device by using the FMC controller to load the instructions, and
    not simply from RAM. This takes a little longer.
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9939559f6dd0..5cdef873a5fc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1178,6 +1178,34 @@ static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
     mc->valid_cpu_types = sc->valid_cpu_types;
 }
 
+static bool aspeed_machine_ast2600_get_boot_from_emmc(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    return !!(bmc->hw_strap1 & SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC);
+}
+
+static void aspeed_machine_ast2600_set_boot_from_emmc(Object *obj, bool value,
+                                                      Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    if (value) {
+        bmc->hw_strap1 |= SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC;
+    } else {
+        bmc->hw_strap1 &= ~SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC;
+    }
+}
+
+static void aspeed_machine_ast2600_class_emmc_init(ObjectClass *oc)
+{
+    object_class_property_add_bool(oc, "boot-emmc",
+                                   aspeed_machine_ast2600_get_boot_from_emmc,
+                                   aspeed_machine_ast2600_set_boot_from_emmc);
+    object_class_property_set_description(oc, "boot-emmc",
+                                          "Set or unset boot from EMMC");
+}
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1377,6 +1405,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
+    aspeed_machine_ast2600_class_emmc_init(oc);
 };
 
 static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
@@ -1449,6 +1478,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     amc->i2c_init  = rainier_bmc_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
+    aspeed_machine_ast2600_class_emmc_init(oc);
 };
 
 #define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
-- 
2.45.2

