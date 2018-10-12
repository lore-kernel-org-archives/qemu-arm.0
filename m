Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp900819wrt;
        Fri, 12 Oct 2018 07:47:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62ozuqWT4pH6owYUEEkPr+YCdKbsD/7VzGwcjledLfU4OFGwC44IP3P/e1vpsZwwj8vHRBC
X-Received: by 2002:a0c:e842:: with SMTP id l2mr6163554qvo.19.1539355628932;
        Fri, 12 Oct 2018 07:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355628; cv=none;
        d=google.com; s=arc-20160816;
        b=B1dXx3Sp9W3ev306d0Q3YAcVLuLZBuQtbLDYcUzp5SN36MpRAFfql41VfJzfaetM+r
         Ed5vlTMXnPTo27t9ngPSF+Uteh6TyTJVAz2WT85Ekeic3zTWKYlWiumA9lnDL7UPloc4
         HlB8DNctIOH3OZa1T8U4pd+VxxyWHbbAkyVRy057pnX47gRFR81QOiONwzifggs3pmHO
         Q2UgTywTSeVi5g16z9OETDd5TO2qGSAReYop82xfjyySIaFQ84HInnS4iAXD3uI2SfpO
         MsD3sXjsyGXUyQ+1ob7qo3WOSxlj/rzQKhub52x5ZGazGqBO936m/xZyRihftY3X3jEO
         ZO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qNj/af0mtDZaV7h55GKVgJxjNnCohQEo/odm7w6QZ4I=;
        b=wgPZKqs1aMAwhruzInO8MOu+BDma4XUNvWKE2bjKkbPReiDJCWMClMwLOvquTcHB4w
         ofNX3bUxMyLJaHIy4jJPI+ZsuH6TZSRoDO4+jPZabUy+nRbTSxyWCxtmDBAp0vqKhELP
         KW/UFV+RSOvNxChJeFufrXLS9kC0PZH+pVsUsUfWs4l7I9nCLhBS91cr990MjjxIFGJT
         fOgiDdHjTSG47rPIuwTlhokQy7CLomzft20ARViSllB5AGZKA6EyEovTcRCOTq/8sjEA
         eu8jAda21JlJnWu2gcAQbT94ACeI/tdHN4PaCEpbG3bh/sMusEjwqtGqQUnSgqelsm7j
         x9uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c91-v6si1333665qkh.242.2018.10.12.07.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyia-0002qD-AX
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:47:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeP-00083V-Vf
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeP-000312-6m
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeO-0002yA-Sq; Fri, 12 Oct 2018 10:42:49 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeN-0000PR-Gp; Fri, 12 Oct 2018 15:42:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:32 +0100
Message-Id: <20181012144235.19646-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/10] target/arm: Implement HCR.PTW
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRDMzAIJN3OU

If the HCR_EL2 PTW virtualizaiton configuration register bit
is set, then this means that a stage 2 Permission fault must
be generated if a stage 1 translation table access is made
to an address that is mapped as Device memory in stage 2.
Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 78d05fe1e57..b5752d52dd1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9134,9 +9134,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         hwaddr s2pa;
         int s2prot;
         int ret;
+        ARMCacheAttrs cacheattrs = {};
+        ARMCacheAttrs *pcacheattrs = NULL;
+
+        if (env->cp15.hcr_el2 & HCR_PTW) {
+            /*
+             * PTW means we must fault if this S1 walk touches S2 Device
+             * memory; otherwise we don't care about the attributes and can
+             * save the S2 translation the effort of computing them.
+             */
+            pcacheattrs = &cacheattrs;
+        }
 
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fi, NULL);
+                                 &txattrs, &s2prot, &s2size, fi, pcacheattrs);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -9144,6 +9155,14 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
+        if (pcacheattrs && (pcacheattrs->attrs & 0xf0) == 0) {
+            /* Access was to Device memory: generate Permission fault */
+            fi->type = ARMFault_Permission;
+            fi->s2addr = addr;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            return ~0;
+        }
         addr = s2pa;
     }
     return addr;
-- 
2.19.0

