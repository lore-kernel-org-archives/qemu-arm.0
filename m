Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp120521wrq;
        Mon, 2 Jul 2018 10:33:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcwMRZhY7RHcWb7eqoZqeNlLPZjOdMbjYt258Z2M09KDQS2ABRJOA6RghF4M2N/ijnVf+UV
X-Received: by 2002:ac8:44d3:: with SMTP id b19-v6mr23143157qto.167.1530552820075;
        Mon, 02 Jul 2018 10:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552820; cv=none;
        d=google.com; s=arc-20160816;
        b=sBdJBWChEbXcq5HNcoxVz7mn9XR/5LK4DJ+D+LDaxLZKGbPSx0QotW0KHZDwu9e4rn
         8xVrSsIve5H4extLwnYuF2qf/bAGqVomgYFCFZcTURwUrcswANNbLTbWO2iz37WWLlTC
         u+mowdgDAgEznW3W4PeWJ0LOr6tW2gwygDZ9iblX0HdPSTm5Iw24wIJZ+s87wFuPzyT9
         JkX1MRbeW1M8sPvkkOgWIRBQRzCpo68/6WLPg0HW5oOVFjqaRcb4vJnq7bE2O7YoFEQ+
         lCnZ/A5GBRh4RKBFeMxz16Tbx2I/HfTnHrLdReGB++BzRsEw11vLEAl79O6qVDu8bS0F
         xLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1VTreS/T42L93WyXoLIeQeV1Wkh13vDSF95jJXhi8QI=;
        b=D3DCoC/MXl5XysAVNFE7bB7MpZ9m20Y+LY8tJF34gWXXJIeC51SfqQtgz1i0hzDhzN
         5DDKmdRXpKgZ1jp1zsea6lSXWm9ItD/S1JObkWOREc/ARrq6BJlkqlhvWpAbPVHi+swt
         b2mrU9nsnXvfFbR308LXhWI04tDHOqv5SOrVDESKlpqyt/9mMhk+ZCLQ9Tzh9c50bOYk
         0g1wWDmdxRHmn5CMQV7QT/7g/ox530ib5P9fNYaZYKll7Fb6qr6fFmWrf4ddMA46vxPZ
         Il/bI7GeUatmdeHcrW3YKssc6GR+twgoSLe80inunJpobiJC+OL2Fr6KR/tGKjU0cZz3
         JNGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w185-v6si240416qkc.58.2018.07.02.10.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2hm-0007dL-V0
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y9-0000PD-Jr
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y8-0006qx-MO
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48096 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Y6-0006oc-PG; Mon, 02 Jul 2018 13:23:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6197777888;
	Mon,  2 Jul 2018 17:23:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53219111AF38;
	Mon,  2 Jul 2018 17:23:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:38 +0200
Message-Id: <1530552162-15533-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:23:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:23:38 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v2 11/15] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, david@gibson.dropbear.id.au,
	dgilbert@redhat.com, agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DDIgy7noOvJ2

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

