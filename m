Received: by 10.25.0.6 with SMTP id 6csp215029lfa;
        Fri, 26 May 2017 02:21:45 -0700 (PDT)
X-Received: by 10.55.184.5 with SMTP id i5mr875730qkf.141.1495790505180;
        Fri, 26 May 2017 02:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495790505; cv=none;
        d=google.com; s=arc-20160816;
        b=mhPAhr4NkgTf1es5aKiaxzF5baSPHCWrxUsFRRKRYX6Tsy3Hu9IPhy9kk3o4lu09J5
         MstnGyAER8jYLl1ATYiq7AnHn9Lw5QnXEo9Oi3JiXrokGdj5sQWtsIJUtefYCe4+aN2m
         XCMwyz/XKT+zy//B4m8hYLKbZo/IZMBLUXFR7uwjtULqggEfQuaOs3f1F7c0x2r5FCEA
         c3jRhbsZL+uem9KPw8Yrt6oX4SAG0RqJDuWJc9ptIXDIauFGU/fVwli00SSVnbdFagrT
         ZjmrRidcV2Bc821KdBXdmKDG1KmOMBv3v7sU+sDuyvcUxXMlOd+5XBPgNaEamqiuzT9T
         ij0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ti3cMgCW5ys2hcfsEX6wrXBMUMwEfJMtKpFpA4/pWi4=;
        b=PxlPMKPbnWPkWiUFMEtIORU9vvwamhTdlSOv5qUeUpm8QiO6fiQmltehPmqG/q/hRq
         W0/eaGO4I+lMc5ZmrEkkTX8RsghD73+HOgGoarPLBXLAmxySSN/cJUnZrU0lfkYucjvH
         H4DVaUcwC5BJjdKBgTkD0gE784FLB0ZOhF3MdGuAC2ITlomNu98hsIkYjudF/jEdhdfC
         yarASU7Ip6IiLrN9//D3410eJ826a7VZYsuzKnsKQIFlzj/sQPY7fbJBa/2xaesG8E9x
         OPWtTdAUIOpBEn6lGkik3jmVj8dOnPcXI/tRWTc43+1l+w6hK2pQAkhoZerknpCJXt/P
         /jmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u33si218201qth.169.2017.05.26.02.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 02:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEBRI-0002gY-IB
	for alex.bennee@linaro.org; Fri, 26 May 2017 05:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR6-0002f8-LL
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR5-0005Ys-TG
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:32 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:32807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dEBR5-0005YT-NC; Fri, 26 May 2017 05:21:31 -0400
Received: by mail-pf0-x242.google.com with SMTP id f27so1525371pfe.0;
	Fri, 26 May 2017 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ti3cMgCW5ys2hcfsEX6wrXBMUMwEfJMtKpFpA4/pWi4=;
	b=hxGYNef3eCHXrQDE/psND/9vSABwde+ebTvdDlx9T2DWwnXCBo6gWP9FA5udFguTIv
	vsZWHS63oO/WGApbK/V002nCeO/R2ww/zpG98K3q5sCQ8BePRFvrI2mOkQHgvfW4Nz9O
	rAO4n/VlquptJU0MTzla1oQ0jP+aj0fBu3NFXttc2oK4NtWnK8FHcgNHWm9cE9t6vLff
	1bOMsc/zEyzjnaqpySdUtCMO2glaeyl+6SQIMm5SUPYoupzo0aQvLKTVTokMxp3P6H4h
	nFaRqQe3JYu1asTYJ9ojdbonvv/r4G879DaiUQDvID20i7OQ/JSwA61W7dbtThliUsv9
	9hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ti3cMgCW5ys2hcfsEX6wrXBMUMwEfJMtKpFpA4/pWi4=;
	b=RT27gWshu6hKnckoRX0hU54ll/jpSE94+2gur1GZUzyTt5dkES9O2RUttYCm/P2tZ9
	b/iEp/MYFH4caPMEYuO+8152nSQkRXh1kNGppXzhrR/NnhjtPwC9FgC1mfprxTTXFSah
	388TOg4sa9EL9SQWMjaon8UUNNBmEOHRVaOzmodnFzquXhch+Dymo2tfOG2jlwmeGoWZ
	ONbyljFHUZ+sB4KMOuhwenNEQfY54OGqr4njYC1q5lXJHImtYCGhCJE/hpcBe5Lhqvr9
	wE83aH3Hh93+vKtpHtyMWtXNw+8KgrQ2qSKtPhGd7vYOMhqEQL/lpdy/hqAqfo6iV+SF
	Z1oA==
X-Gm-Message-State: AODbwcAusniEQ8Tvt9k7XG2btEa4AwX/Z9PCx4Dt0GpJKTAZGbRCo3Eg
	3YcLEsEbTiuD8Q==
X-Received: by 10.99.110.200 with SMTP id j191mr1217162pgc.236.1495790490999; 
	Fri, 26 May 2017 02:21:30 -0700 (PDT)
Received: from control2.hxtcorp.net ([223.203.96.18])
	by smtp.gmail.com with ESMTPSA id b2sm602187pgc.16.2017.05.26.02.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 02:21:30 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 26 May 2017 17:21:08 +0800
Message-Id: <1495790468-23862-4-git-send-email-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 3/3] arm/virt: Implement hot_add_cpu interface
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
Cc: Li Zhang <li.zhang@hxt-semitech.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 20CFZWyamIoR

From: Li Zhang <li.zhang@hxt-semitech.com>

This patch is to add add_hot_cpu interface.

Signed-off-by: Li Zhang <li.zhang@hxt-semitech.com>
---
 hw/arm/virt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 31314c1..c7e8322 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -527,6 +527,24 @@ out:
     error_propagate(errp, err);
 }
 
+static void virt_hot_add_cpu(const int64_t id, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+
+    if (id < 0 || id >= max_cpus) {
+        error_setg(errp, "Invalid CPU id: %" PRIi64, id);
+        return;
+    }
+
+    virt_new_cpu(ms, id, errp);
+    if (errp) {
+        return;
+    }
+
+    fdt_add_cpu_node(vms, id);
+}
+
 static void fdt_add_its_gic_node(VirtMachineState *vms)
 {
     vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
@@ -1654,6 +1672,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+    mc->hot_add_cpu = virt_hot_add_cpu;
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.7.4

