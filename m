Received: by 10.25.0.6 with SMTP id 6csp1490067lfa;
        Mon, 29 May 2017 10:38:37 -0700 (PDT)
X-Received: by 10.55.2.142 with SMTP id v14mr16532588qkg.10.1496079517383;
        Mon, 29 May 2017 10:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496079517; cv=none;
        d=google.com; s=arc-20160816;
        b=vpGPNP0JZtdK9LQ9VfkmybhHSzYWy+x4grj4e8Y0iBatPndgkXophgWY3kbGfWExP2
         fsScBsGQET6uJ4rRhYEGgiON3iLGpQ6GZL6eg5zw510HLfXoIV1ght8IEggZK2MF8grA
         rFjwnZ0fOEhOBMpCE8saf/DYE+pKrZTPNkxOx2b9m0b2moP0s7ZlRnLnhf8agKqma2wG
         YMnB85XGtbNymRQ/8LjIzkPnKWlO5amylVO8sN+hfzAoaMTINwzFcSJjb2RIfIX6Cct/
         6dvYj6DGUGhGwNOBMUxPF7ZVX1UVFOt16/UtOUhOoX7RBmjfKdmWZYJAFWnnqmKoGdcW
         nE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=5zknuQhlfcVx9+a08yWvOYGOMBi55OXjyaQo1fjIABM=;
        b=zu47DjmPHvxH3v+t5k1oqhzyBChawjjpQXyycbgApYcpe2Cvv//gNMESDFd8rujdtm
         KKzIjgbB67UmExW0YHyNyetcn6kKr9+2F3W3VPlGd1TNDCEUVAAM/dhK109FGm4v0E9g
         snGd3Df+hCJOJqqA0hiB2D/gngUq9HFImVw7GeKZtmgVcwISytU53ybxVLBNzpQnrWVt
         K44MDRaEOrXBNQMQzDeQkzuOY55o7ql6DalwmUQ+Wy1Cliqz6DwZaUlPBtxlrT2Ka/ZN
         Lcl6zv20wiVYJ0ZVuMNpb0m8DXE32t+/g9lcLLVRGSLwpD7z9q6p+0l65rCLcyCdCPc1
         QZ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si10263936qtc.216.2017.05.29.10.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 10:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFOcm-0005rG-RA
	for alex.bennee@linaro.org; Mon, 29 May 2017 13:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOcD-0005KJ-0d
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOcA-0002Ol-T6
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dFOcA-0002OI-NL; Mon, 29 May 2017 13:37:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BF8CC049D57;
	Mon, 29 May 2017 17:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8BF8CC049D57
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8BF8CC049D57
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6494060BE2;
	Mon, 29 May 2017 17:37:56 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 29 May 2017 19:37:51 +0200
Message-Id: <20170529173751.3443-3-drjones@redhat.com>
In-Reply-To: <20170529173751.3443-1-drjones@redhat.com>
References: <20170529173751.3443-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 29 May 2017 17:37:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/virt: fdt: generate distance-map when
 needed
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
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kymHJ9oh07k1

This is based on patch Shannon Zhao originally posted.

Cc: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c7c8159dfd59..4db2d4207cf2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -219,6 +219,27 @@ static void create_fdt(VirtMachineState *vms)
                                 "clk24mhz");
     qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vms->clock_phandle);
 
+    if (have_numa_distance) {
+        int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
+        uint32_t *matrix = g_malloc0(size);
+        int idx, i, j;
+
+        for (i = 0; i < nb_numa_nodes; i++) {
+            for (j = 0; j < nb_numa_nodes; j++) {
+                idx = (i * nb_numa_nodes + j) * 3;
+                matrix[idx + 0] = cpu_to_be32(i);
+                matrix[idx + 1] = cpu_to_be32(j);
+                matrix[idx + 2] = cpu_to_be32(numa_info[i].distance[j]);
+            }
+        }
+
+        qemu_fdt_add_subnode(fdt, "/distance-map");
+        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
+                                "numa-distance-map-v1");
+        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
+                         matrix, size);
+        g_free(matrix);
+    }
 }
 
 static void fdt_add_psci_node(const VirtMachineState *vms)
-- 
2.9.4

