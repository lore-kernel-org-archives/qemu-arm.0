Received: by 10.28.71.155 with SMTP id m27csp2710375wmi;
        Mon, 9 Apr 2018 08:49:48 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/d+CCt+Ac/lLULmQQSs4W249QhI4PinWzprDRxivmG85Uakzmagl+7zb+WPQC78V+cprQ7
X-Received: by 10.237.55.227 with SMTP id j90mr24057601qtb.39.1523288988511;
        Mon, 09 Apr 2018 08:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523288988; cv=none;
        d=google.com; s=arc-20160816;
        b=dy5A3OGZcGDqzADB9u8TRjmx7B1ovJm7+8HHjoj726MbU7EhoRBYvoNfgsJPHA2VeH
         0Qivm4xdeUSVJEGrjvDA2UqebAOhGBVKt4FCKs9jI/zHRsgam/4AndyRYkzr9U6Wb6oy
         MWxjkJEpBsRWLmdsioY6u4YK1SXaTbDpxjbRJ9RB7PGtA4SKh3EsoYFfAXYo9ss9Zbb4
         lmzYL8VKHTWFDM4FJKMt2MHlSCN6yZgYUn2T4C90mNukFEOqmk/QUZdJuy2p3Ydzm74G
         umbMTK9kImtOtk1CfTMkX7dYloDl680qq2Hr+twoByh5mVHbxYGwuTa1McrQ4gt3KJWo
         n5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=/TXKgJSHDJFCKZq1M5+XmnqHa2V5OB505DeBntvK6yk=;
        b=ETONmD7df31pHuHBna4lMzei7QAKiy46EXNPCIi6jJjPsSgq295r1SQDlfPZ62M9xQ
         QE4BQYHP6JWrGP93vp+dRGJWMlk91zkwoAVbyrew6g5lO8tCOAMS9U2DN3dHxwMvKcSj
         LlSE+rKYnvqwnl5DVJ4cvxoWROZCvU01Lp559rB/bTtrUJZb054MgtBa7vWIY707iprA
         LTu9d7CoqfMySAT5dRitzCxqfRIzMWtKEt+HOt7e835ARNJBebVUZU1oHwBjg+fd3D4O
         Y9N7ZPlxOnKcRyfu4yD2Gyk9sF2C11pp8v5eN8CFx/C6plYdjZa5GUfT27XBX2hiRHqp
         4/lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126si694841qkb.205.2018.04.09.08.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 08:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5Z3E-0002Zw-2K
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 11:49:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Z2y-0002YP-Gc
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Z2v-0004dE-Cq
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:49:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38792 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1f5Z2v-0004cK-7n; Mon, 09 Apr 2018 11:49:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15B5D4023BAD;
	Mon,  9 Apr 2018 15:49:25 +0000 (UTC)
Received: from weilaptop.redhat.com (ovpn-120-209.rdu2.redhat.com
	[10.10.120.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A47552026990;
	Mon,  9 Apr 2018 15:49:21 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Apr 2018 10:49:21 -0500
Message-Id: <20180409154921.29906-1-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 09 Apr 2018 15:49:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 09 Apr 2018 15:49:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/1] mach-virt: Change default cpu and
 gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2JZHn/0uY3E

Running mach-virt machine types (i.e. "-M virt") on different systems can
result in various misleading warnings if -cpu and/or gic-version not specified.
For KVM, this can be solved mostly by using "host" type. But the "host" type
doesn't work for TCG. Compared with "host", the "max" type not only supports
auto detection under KVM mode, but also works with TCG. So this patch set
"max" as the default types for both -cpu and gic-version.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94dcb125d3..1a9d68b8d5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1555,7 +1555,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
 }
 
@@ -1609,13 +1609,13 @@ static void virt_2_12_instance_init(Object *obj)
                                     "Set on/off to enable/disable using "
                                     "physical address space above 32 bits",
                                     NULL);
-    /* Default GIC type is v2 */
-    vms->gic_version = 2;
+    /* Default GIC type is max */
+    vms->gic_version = -1;
     object_property_add_str(obj, "gic-version", virt_get_gic_version,
                         virt_set_gic_version, NULL);
     object_property_set_description(obj, "gic-version",
-                                    "Set GIC version. "
-                                    "Valid values are 2, 3 and host", NULL);
+                                    "Set GIC version. Valid values are 2, 3, "
+                                    "host, and max", NULL);
 
     if (vmc->no_its) {
         vms->its = false;
-- 
2.14.3

