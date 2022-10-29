Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp141284ejr;
        Sat, 29 Oct 2022 15:45:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kM6LpNfEyAX3yc6zDYA9KClBS2X8rF3HtzjttVnIgplDlpOkDZwb2gD3btRbXCEvAKMEj
X-Received: by 2002:ac8:5d8a:0:b0:39c:d3a8:3f91 with SMTP id d10-20020ac85d8a000000b0039cd3a83f91mr5167818qtx.324.1667083519726;
        Sat, 29 Oct 2022 15:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667083519; cv=none;
        d=google.com; s=arc-20160816;
        b=L22MKD2JJq4Flui1anLN50nTT2x6NLMNwuL94VkMnMt/x46TCaMkYeOJ+dMlEzX3CR
         HT5uMfB5oMOwTYzgtHCauAnSQ9UNvZaWOHbUmYgj+yi8mNY42P2OPbpFaB+tTW7/R5OK
         s+2iBzG+PN7gISMuX+nvjcfqYrbke2uV/VsjZatGPqCwK3e4YoMoxvnv9XtQpSzyJTed
         74LnM8q3/DZ7XeWCW+6G9JQ+VX278nSQJMuTdfl83Q/xW42EGoUmbQ8Q1+K13CtA8HtP
         3yMyoPxK/Ss0hCPF+1y0fBee9cOozwDZOPOn+pPqB0hTvJsSGEmA1I7uTvAFjvLPf0q+
         uIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jxTt9Gxq0jWOkHdY3SXW7lKxUK5PTB2+BQzqSAJTA8U=;
        b=B+eMHvua5lK/bwCJQBAXNp+/Kykh6+5Kkx1KXnNp6zuqcA3pBQNLUqTj1AumuBN0sZ
         alysewneiy8bnSWjYjUn9M1dYkxHO2mxHtyBTENcx4ePy8p3TboG/Br/ONcoMu4BRCA8
         z2cTktZuZtd0c4gqb7nRLIrcjVQimS9I3WaLkxeIhQfoT9oiFszc+PgiqEgdlbD9pMBx
         /rUwcg5BdN4tanaF+hcNVdM38PU0eVK82PsVN1y/5NKKtDD3Y0yFVZXC2v8KKyA7WLb+
         kS4jCU+TWQarg3rM4dq2ENjQjzZMu9B7uxL+6jrlv/y6z7QgD6RChjVQVlUH3JoQjPY2
         8PHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bY25hcvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if9-20020a0562141c4900b004bb993d9884si1476311qvb.229.2022.10.29.15.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bY25hcvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oouYX-0003e0-PW; Sat, 29 Oct 2022 18:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYV-0003bd-4T
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYT-0002d5-Dz
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxTt9Gxq0jWOkHdY3SXW7lKxUK5PTB2+BQzqSAJTA8U=;
 b=bY25hcvjfIDyuXwdFhqZn6tWneDP2I9DxU3SrD51lpfaUHxGpCy0HankM8ELoFEGVJ3lHk
 YefsOg73yqqbvDGIzMzdvWqxUX/Wz3hjb1Xkf4lHsj62uTqh9V6JvwRdjDQuAFOq2XAnuO
 OtnOQJpiRFRA4Oe5LgIxw1GdoYza4Q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-ptANUzQqPiypKDrnWfcMcw-1; Sat, 29 Oct 2022 18:43:47 -0400
X-MC-Unique: ptANUzQqPiypKDrnWfcMcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3EE5833AEC;
 Sat, 29 Oct 2022 22:43:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6334F2024CB7;
 Sat, 29 Oct 2022 22:43:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high memory
 regions
Date: Sun, 30 Oct 2022 06:43:07 +0800
Message-Id: <20221029224307.138822-8-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aVNMx6bZ+fJc

The 3 high memory regions are usually enabled by default, but they may
be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
This leads to waste in the PA space.

Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
allow users selectively disable them if needed. After that, the high
memory region for GICv3 or GICv4 redistributor can be disabled by user,
the number of maximal supported CPUs needs to be calculated based on
'vms->highmem_redists'. The follow-up error message is also improved
to indicate if the high memory region for GICv3 and GICv4 has been
enabled or not.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 docs/system/arm/virt.rst | 13 +++++++
 hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 4454706392..188a4f211f 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -98,6 +98,19 @@ compact-highmem
   Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
   The default is ``on`` for machine types later than ``virt-7.2``.
 
+highmem-redists
+  Set ``on``/``off`` to enable/disable the high memory region for GICv3 or
+  GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
+  limit the maximum number of CPUs when GICv3 or GICv4 is used.
+
+highmem-ecam
+  Set ``on``/``off`` to enable/disable the high memory region for PCI ECAM.
+  The default is ``on`` for machine types later than ``virt-3.0``.
+
+highmem-mmio
+  Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
+  The default is ``on``.
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 020a95cfa2..65cff7add1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2095,14 +2095,20 @@ static void machvirt_init(MachineState *machine)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         virt_max_cpus = GIC_NCPU;
     } else {
-        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
-            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
+        if (vms->highmem_redists) {
+            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        }
     }
 
     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
+            error_printf("Try 'highmem-redists=on' for more CPUs\n");
+        }
+
         exit(1);
     }
 
@@ -2371,6 +2377,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
     vms->highmem_compact = value;
 }
 
+static bool virt_get_highmem_redists(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_redists;
+}
+
+static void virt_set_highmem_redists(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_redists = value;
+}
+
+static bool virt_get_highmem_ecam(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_ecam;
+}
+
+static void virt_set_highmem_ecam(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_ecam = value;
+}
+
+static bool virt_get_highmem_mmio(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_mmio;
+}
+
+static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_mmio = value;
+}
+
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2996,6 +3045,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable compact "
                                           "layout for high memory regions");
 
+    object_class_property_add_bool(oc, "highmem-redists",
+                                   virt_get_highmem_redists,
+                                   virt_set_highmem_redists);
+    object_class_property_set_description(oc, "highmem-redists",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for GICv3 or GICv4 "
+                                          "redistributor");
+
+    object_class_property_add_bool(oc, "highmem-ecam",
+                                   virt_get_highmem_ecam,
+                                   virt_set_highmem_ecam);
+    object_class_property_set_description(oc, "highmem-ecam",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI ECAM");
+
+    object_class_property_add_bool(oc, "highmem-mmio",
+                                   virt_get_highmem_mmio,
+                                   virt_set_highmem_mmio);
+    object_class_property_set_description(oc, "highmem-mmio",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI MMIO");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
-- 
2.23.0

