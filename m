Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2790416lfp;
        Sun, 26 Sep 2021 01:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4PMLNM3pTOcin8Qtcu/9i0hjgrSsWz5WhwjQx1k+hsdrkfPeOCH70mH2ade3IDWFwME9V
X-Received: by 2002:a25:db41:: with SMTP id g62mr23233600ybf.118.1632646153464;
        Sun, 26 Sep 2021 01:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646153; cv=none;
        d=google.com; s=arc-20160816;
        b=suBz0blmnMoGTQgr8rNnOtGTsKYzW5heI605p4U+vK+7rXdazfPB/ioi2eCpbs69n9
         S3tHuvE5Yp9h5Fr5kHKRCEGjsugNt0/+E+1ZBPSnBDRLuVo8G0lMKVZ963tXA13wExEW
         k62JWy8glE8BsiIWOtg5JdZvOnSlRnmoC2BL8EtohmVIqCSlfd0U/hwtCt7fppXuVPdr
         mwSXM9cRPru1QkUxLDE9nfRgoseGhlQKJTTaf7C9+6c0TamkREZzSXq4QAoL4e6kNFV2
         dMoYdslCfvqAiXa38yCxzStUae1xXSRA2EQq29mlZIcnhxHDC8Bkvh/YK2AsRvIt6CI5
         msYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=UR2xo8pFad+aemSHLhyNEbYm2nrezw9mc59K40k9cr4=;
        b=KAySMD/LXyQGLE2fY5Cnc9T66kvRHxWzZDyd4qbEZyQO+5b/AEIsj4pP7NI5gORNcD
         7w19KddhH+4MlMks6AQF57KIIVLccHaJrpByRXNk3q4ZA1D8x26C7tM5/kHEYBX4Ie6P
         2VmGPW7aZZ4HOhHs2rdZ8g5GDI1DENjSnLNv2wPCkXkDWyAUbiLlVyy6rce81ZL1F70B
         izHEPP3Y8vIyUG+TqMmzvMKchm+eeOPgHfUKTGasYNEuW58W8nHyoAdxeIx7nybN9FMH
         2gfdUf5euX55EPxy0Z9xE48jpaWnnmLQkTDAMrkLfSx9OwCBjwwN2aoqKOV1rrUIPNV1
         6jiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h63si17611945yba.260.2021.09.26.01.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPqS-0002Ea-IT
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPne-0006Dl-5k; Sun, 26 Sep 2021 04:46:18 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnZ-0002ab-OC; Sun, 26 Sep 2021 04:46:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HHK8v5wwKz8t3n;
 Sun, 26 Sep 2021 16:45:19 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:01 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:01 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 05/14] machine: Improve the error reporting of smp parsing
Date: Sun, 26 Sep 2021 16:45:32 +0800
Message-ID: <20210926084541.17352-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oEimTfOCQ3PI

We have two requirements for a valid SMP configuration:
the product of "sockets * cores * threads" must represent all the
possible cpus, i.e., max_cpus, and then must include the initially
present cpus, i.e., smp_cpus.

So we only need to ensure 1) "sockets * cores * threads == maxcpus"
at first and then ensure 2) "maxcpus >= cpus". With a reasonable
order of the sanity check, we can simplify the error reporting code.
When reporting an error message we also report the exact value of
each topology member to make users easily see what's going on.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c | 22 +++++++++-------------
 hw/i386/pc.c      | 24 ++++++++++--------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fe935cb4a3..f1b30b3101 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -782,25 +782,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, cores, threads, cpus);
+    if (sockets * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, cores, threads, maxcpus, cpus);
         return;
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 83aa136a15..f08eb4fc3b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -749,25 +749,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * dies * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies, cores, threads, cpus);
+    if (sockets * dies * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology deprecated: "
+        error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, dies, cores, threads, maxcpus, cpus);
         return;
     }
 
-- 
2.19.1

