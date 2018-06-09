Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2089273wrq;
        Sat, 9 Jun 2018 07:23:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLVwUN+JjFjJMYNaxzUkaXE4BmFgeslK6PvcZooRV+6kaXnZbjFtaiumpnMDqZsSWP7eFWB
X-Received: by 2002:ac8:440a:: with SMTP id j10-v6mr10181066qtn.113.1528554220878;
        Sat, 09 Jun 2018 07:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528554220; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0e414SPeiHojFNwfKq5KGwBKHlJf10YBBRF5vuSHRexYdqInmfgJy6j9e/pOYMLhY
         UmonR1bwiZsBTbYXoEELD0jnWj7n7XsKv+nrQizkGsHRzbzDUuRF9VyycA/2YxKAx8Gy
         HOiCdsaqHwhJQf8RTi3b565UFHJgQZV6TMSTdFOBlC82Sama0v2oTGg2A8BD8o2+rJC9
         dotcyIjpbxdPSPKC89McgGSkN7KVBXavV+BxykSJkIe88fupTMRc1DIY8eBlJw4+wW6W
         OTkffvQu6SmnS0SaoDpa4UPN9ZvIo+obb+N21h+xTRybrs4Wea5LMba9GCfSMQd5i+yW
         Gkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+2OUyOX7K5A17lbpsSAuCpprM8+OUUvtoUylggX4kPA=;
        b=BJHbhsQWG7wa6oT56uHX+yXwQ2xqLnXvZ4SxIES8mFWjApuVFI6l228Ogtbtd4vxBz
         rMlw4htGBLL4ckcQqA782Ar9QuE7Oiwpril0ydDMdYi1xXTOKnmGRhHH4wih8uxcUGJ5
         ZbF/sb91D5knAoxjlPEu43cbpz3jA8IW8rH4S3maTjuzd7mznny/1yoYufuQHp5ZrVtk
         kBOSZ6Enw1v/F6p3jIGjnOfiePojJ4oyJxjWg1TUZBMiRBUZx+EPEBU3+GRJhiJ+5dme
         n3QRKgHNYgOe/KnzPEtDi51NBbAZ3NGcHk3tROLFWgFKjaN0038jRyY59cNMUJshZGIF
         fXwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8-v6si3223375qvm.265.2018.06.09.07.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jun 2018 07:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRemK-0007fF-Bc
	for alex.bennee@linaro.org; Sat, 09 Jun 2018 10:23:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem4-0007e4-U4
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem1-0004MU-RU
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57030 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fRem1-0004Lv-LY; Sat, 09 Jun 2018 10:23:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B35FF80125D6;
	Sat,  9 Jun 2018 14:23:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2AE5217B409;
	Sat,  9 Jun 2018 14:23:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  9 Jun 2018 16:23:13 +0200
Message-Id: <1528554193-27270-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 09 Jun 2018 14:23:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 09 Jun 2018 14:23:20 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BUMpy6XkEO4o

When running dtc on the guest /proc/device-tree we get the
following warning: Warning (unit_address_vs_reg): Node /memory
has a reg or ranges property, but no unit name".

Let's fix that by adding the unit address to the node name. We also
don't create the /memory node anymore in create_fdt(). We directly
create it in load_dtb. /chosen still needs to be created in create_fdt
as the uart needs it. In case the user provided his own dtb, either
the bank is added to the existing /memory node or if this latter is
not found we create a new separate memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 20 ++++++++++++++------
 hw/arm/virt.c |  6 ------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e2be20..2054670 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
             g_free(nodename);
         }
     } else {
+        char *nodename = g_strdup("/memory");
         Error *err = NULL;
 
-        rc = fdt_path_offset(fdt, "/memory");
+        /* If there is an existing /memory node (user provided dtb), we add the
+         * new bank into it, otherwise we create a /memory@addr node
+         */
+        rc = fdt_path_offset(fdt, nodename);
         if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
+            g_free(nodename);
+            nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
+
+            qemu_fdt_add_subnode(fdt, nodename);
         }
 
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
+        if (!qemu_fdt_getprop(fdt, nodename, "device_type", NULL, &err)) {
+            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
         }
 
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
+        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            fprintf(stderr, "couldn't set %s reg\n", nodename);
             goto fail;
         }
+        g_free(nodename);
     }
 
     rc = fdt_path_offset(fdt, "/chosen");
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b1e9a6b..46c5c3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -203,13 +203,7 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
 
-    /*
-     * /chosen and /memory nodes must exist for load_dtb
-     * to fill in necessary properties later
-     */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    qemu_fdt_add_subnode(fdt, "/memory");
-    qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
 
     /* Clock node, for the benefit of the UART. The kernel device tree
      * binding documentation claims the PL011 node clock properties are
-- 
2.5.5

