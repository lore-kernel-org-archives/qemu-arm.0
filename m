Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp502386wrq;
        Wed, 4 Jul 2018 05:50:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpecGC2wgwDq/2PV3t9GfqjV9/i1wKaCtnAsUGtElT02i4GRQXvTMmTu06jsuRTtaqSxTM8i
X-Received: by 2002:aed:3534:: with SMTP id a49-v6mr1431764qte.244.1530708609858;
        Wed, 04 Jul 2018 05:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708609; cv=none;
        d=google.com; s=arc-20160816;
        b=mLL6vofj+q83qUwSrXh7rDdn/ijcl4rnCigzkMAomaZhx+TyPZEI9YK2OjxL2YMatE
         bOusSNug/AJKOl8CTlt+rFf3tSc4Pn8y2yXPCoE/0lvYgVYey2/XUlTS3k0BbbY4K8Op
         EMRVDZJMTmz2c2WL90cvs4mdSR8bJ93UZxzG7YkkN862+dB/f5sNgqTnKYv7tmPCAvJ4
         59PNqiGrsCEZuvq6W3Vor7gsvPr3SB4rAxqCYK5/13mtojmtjyikUL5S9633HsUFYUhi
         UexqnePlGM1XLe0wzpIoll9UHBtgBnKp0o2c+MMTR7+9c1/5zJlrXg+HltPA1wySFarS
         lg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7W1yUKF6im1uDvQzd2JE42xRkXVi45O9gRtgzuYmOCI=;
        b=UpY7rME4Rp+GLjEll7mnLfAm+avURaSKm3ecIhZOvZi2l6RiJ8772/btHdiAqaD16K
         msmJLNoBfiZdQJyP54mVT7UBDSWB7ZWBqdNuAdg5Y8Ui9FImynB+/4+gS82MI6ncrFEb
         RXKuliU2cqUCyOYD18cWENbcdoyooJuSwhu0amugegYJy+gP9oE+je+7tC9pDU337HCc
         zhRBXG9rAAHGValVCKhpAEJofo3E6DuWPmve+VVvDjLbpU/B3vsbXCmVFXd17rjk+nSO
         LCvENogrfdqZjtZA3zUyDMJc34ex294jkP+UUKG8WMWS94lD0yHsIWdyqUFhZR9fP1jl
         MHKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8-v6si3591925qvf.134.2018.07.04.05.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahEX-0007qc-Aj
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:50:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDx-0007RH-6n
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDu-0000T1-Kw
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56974 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahDu-0000Sn-Gc; Wed, 04 Jul 2018 08:49:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED1F6407563E;
	Wed,  4 Jul 2018 12:49:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96E6A2156889;
	Wed,  4 Jul 2018 12:49:27 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:19 +0200
Message-Id: <20180704124923.32483-3-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 04 Jul 2018 12:49:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 04 Jul 2018 12:49:30 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 2/6] device_tree: add qemu_fdt_add_path
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
Cc: peter.maydell@linaro.org, Alexander Graf <agraf@suse.de>,
	eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gK/QjWm15Y1d

qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
also recursively adds any missing parent nodes.

Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 device_tree.c                | 24 ++++++++++++++++++++++++
 include/sysemu/device_tree.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index 6d9c9726f66c..ad570a4dbe3a 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -520,6 +520,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
     return retval;
 }
 
+int qemu_fdt_add_path(void *fdt, const char *path)
+{
+    char *parent;
+    int offset;
+
+    offset = fdt_path_offset(fdt, path);
+    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
+        error_report("%s Couldn't find node %s: %s", __func__, path,
+                     fdt_strerror(offset));
+        exit(1);
+    }
+
+    if (offset != -FDT_ERR_NOTFOUND) {
+        return offset;
+    }
+
+    parent = g_strdup(path);
+    strrchr(parent, '/')[0] = '\0';
+    qemu_fdt_add_path(fdt, parent);
+    g_free(parent);
+
+    return qemu_fdt_add_subnode(fdt, path);
+}
+
 void qemu_fdt_dumpdtb(void *fdt, int size)
 {
     const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index c16fd69bc0b1..d62fc873a3ea 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -101,6 +101,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
 int qemu_fdt_add_subnode(void *fdt, const char *name);
+int qemu_fdt_add_path(void *fdt, const char *path);
 
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
-- 
2.17.1

