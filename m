Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp899489wrx;
        Fri, 22 Mar 2019 09:30:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOU3RzOeEOM3qEkGUW4Cr6Q2cK893cUIf2Bfuot+SYvwkb1euBeADSNKNAE2kA5RHcIhRC
X-Received: by 2002:a25:6196:: with SMTP id v144mr8871496ybb.361.1553272219485;
        Fri, 22 Mar 2019 09:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553272219; cv=none;
        d=google.com; s=arc-20160816;
        b=QG/Dn7zXWkEKUc6d7F/O+LbJbZ+xMvqYh6+R6zmPahyd5mukql0GzW8zY+ka03Ymnj
         +iO2GbhHQnYFQeseDfaKT/bz903tSQTLo6fbPLjuf0QkFDlLvjt0DcG2jYsypPdXUA0B
         UW7f3oMyXTjUNGO//kC5cwh1vixO+frqoPH/tOxtk4ei5G4ZHwpS2IU4oC7hZnHOTOkc
         ZMXvuK3XEXl9q6aX0Wc/kYEvClg1e6tud0AfAzfhu/hKBCJguF7QJ+RCKLvmOk3ZixBl
         M7WljcPAfUL6zVJh8rkkGpHo98SRcTEhFuxW9uUEnWo3Ab4BzjWXXVKPaziN+4qzqp2w
         aM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=hyfdsRq6+VDgVKblD/NLnjvAR/CL9Ca/SVZi3n9GNE8=;
        b=FTGGpjVKU/9l/AsnEx7roOGFuULv1+YpsCJrimrl3Z/crH6WKOjpuytEiMuZvtulU2
         Cg7WSI1TjAzEXgBeInWqwSXgpdPPv3/V/IggCNpKcncbufoUh/5l7TjZ4f1AhtKZC4ZS
         MIc+av06zyA6THiwzTD6NPi+8XScyC/6qeEVT+awFq7GTUA66loByVJeYGPMOSKmqtqe
         OQNRxD/JLCNjsFa9/taauZMV9UG4bMR2XeHYPSeJz2aiM4uJ+chpKKm3K51GJsOJ3uOH
         rUq1AwE0/zw2iH/llH93+KyXDu1b/0xqaTPOQ9DsAFjkVtLHL2HrLc/pZ7VjIC1RUrRb
         kA/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si5182750ybk.65.2019.03.22.09.30.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 09:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7N3i-0000Fc-QW
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 12:30:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N3U-0000DV-4z
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N3B-00044h-KA
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:29:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7N3B-0003yI-8y; Fri, 22 Mar 2019 12:29:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 905A4C049E23;
	Fri, 22 Mar 2019 16:23:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BFFA5D9CC;
	Fri, 22 Mar 2019 16:23:36 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Mar 2019 17:23:31 +0100
Message-Id: <20190322162333.17159-2-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
References: <20190322162333.17159-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 22 Mar 2019 16:23:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] target/arm: fix crash on pmu register access
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
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zXVOuzY2d0V6

Fix a QEMU NULL derefence that occurs when the guest attempts to
enable PMU counters with a non-v8 cpu model or a v8 cpu model
which has not configured a PMU.

Fixes: 4e7beb0cc0f3 ("target/arm: Add a timer to predict PMU counter overflow")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c8d3c213b6b7..fc73488f6cc0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1259,6 +1259,10 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     int el = arm_current_el(env);
     uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
 
+    if (!arm_feature(env, ARM_FEATURE_PMU)) {
+        return false;
+    }
+
     if (!arm_feature(env, ARM_FEATURE_EL2) ||
             (counter < hpmn || counter == 31)) {
         e = env->cp15.c9_pmcr & PMCRE;
-- 
2.17.2

