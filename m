Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695431wrq;
        Tue, 3 Jul 2018 00:25:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcSRd+uPAIUvhdvBgujI5MOwB2sYf7Ty8I88ZIVxyvO4b2A8mosdylMzJl0yjwWHcwKj9YW
X-Received: by 2002:a0c:d683:: with SMTP id k3-v6mr25302704qvi.154.1530602738219;
        Tue, 03 Jul 2018 00:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602738; cv=none;
        d=google.com; s=arc-20160816;
        b=Inl3XDRPPWr/z9k8VDV2//fnO5Hf7HYcq7s1ZPX6jsKm0YPXY+Ph5tDxRla5JP9m+P
         CBteTCbL2UJH+Z1D6dQIpREgZuBL0EmhQrSmehmiD9fHWpwSWizc/yORkSxqZQvyOU7N
         9/1/Gb9efcHitPoh9V69rJ7BnxhQJIXB3Dg9GTPic42bJd0gGiG6gHIaSza/ipdMn1Oj
         7iB/o7rX2V3Ae6pZpjsv/YRAz0kUi4PoKNxB86LoqiqzwJKuGm5rDAmztIksBMDKP71A
         3zB1AAnNalBSHj+Qqttz+K2lBTvnEHScMXPwk65N4mY+RVu8nF6vbmc1/jThigkhIO9n
         RhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1VTreS/T42L93WyXoLIeQeV1Wkh13vDSF95jJXhi8QI=;
        b=pt4/1f3Vb5NLnG3eqsOjEwvFb4ddz3LcGoXSWlLmnxdWKHGZOF9BDZDyH7OgVdsLu+
         iAN5OUwAz8F3cWpKRDFyrL4idFE/qaHKnE2ejTmbtdRHPU74J0yb87j/BHCe0cnMCVNo
         UQHpQqYANZ0EUTbO1n4l1mmnNQu8Vu6icazB3AKc9T9QAfKc7qu0pGPkQSM93Y5zE31u
         rux4a0+mjiFiEVp9GsWmfzBjnCryz5NzP+6tKxYkKDTYS9L4dAVl/YJpLn0z2cr2Pu6i
         OZDeIKRIZ0f6sbj6jQu+hsRE0rhVvKUMyCzWi388eLa4h8ZFXKpa8k7LdgTsVhgvBkC2
         7/yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j37-v6si494050qtc.35.2018.07.03.00.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFgv-00041K-Nl
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:25:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFdM-0003BF-KD
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcI-0005Ua-C7
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:21:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46852 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcH-0005TR-Vp; Tue, 03 Jul 2018 03:20:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B6C97262D;
	Tue,  3 Jul 2018 07:20:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2DB1C5B8;
	Tue,  3 Jul 2018 07:20:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:54 +0200
Message-Id: <1530602398-16127-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 11/15] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zd07p+q/6wVz

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- build_srat_hotpluggable_memory movedc to aml-build
---
 hw/arm/virt-acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2..0915391 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -568,6 +568,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         mem_base += numa_info[i].node_mem;
     }
 
+    build_srat_hotpluggable_memory(table_data,
+                                   vms->bootinfo.device_memory_start,
+                                   vms->bootinfo.device_memory_size , 0);
+
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
-- 
2.5.5

