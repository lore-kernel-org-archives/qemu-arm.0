Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1664556wrp;
        Wed, 13 Feb 2019 01:00:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYKAPvOtbpAQYgn2QLvnb8JJRVqrr6tvBwL3yW1h6EFzgT8Bc9yAxqBxUOwCqTHRTA9tJol
X-Received: by 2002:a25:5e03:: with SMTP id s3mr6500878ybb.8.1550048423088;
        Wed, 13 Feb 2019 01:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048423; cv=none;
        d=google.com; s=arc-20160816;
        b=eSLBKCj89gJMzXSfwtedt91l2VLpmM5pgOmivqHlNibmxtD5Jwctq2NS7493ri/A0P
         0skEg7yG1eUg4tmB+vVNeYv9DTyLUgRYykPrLRDJ+mXMp+caTIU62OvcB90bESsfd1AL
         qhFgJw347OZLbhjxWpCowEuTrebSoqASiMX8YOeUpGrA4ga7/s64U07gOWhUzAIQg55M
         98U7m0ebe2YPoQUrEsoiw5v0EiZyWUXRE+pOPqg+ki42Lhk73gfkwVyKEdwNMlAsB4WK
         hlcYYK5SQMw4cZdljhD6sT/XLNDXPfV5yyz1oXZ7wpPNKfJ1NNbfPVP4QQyj3vMJbOip
         2orQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=orrRAvrFPoiQTEaWInPZ928W/ztoUAmVyrBcc5oF9Gs=;
        b=pUP7SUO6ugtuCj+lXKRuh50NipzxBrYj7siUev2TPrWry/gBZkJZHPSs9mPPu2xLeT
         xd3TwL87K8xOMVRI/rTVnsPxJQCqtnuVtYG4rOS/xcSDNkDtHRB1YWn5kEGrXxWn57TS
         bgBSJK5AOf1DybtSA+Q10vubRNVyxQxNbGq2+uRVXFnATbm1/NW1tYw1TvJtlad8CpwV
         hQ1G/ktK+4QQxAnI1y4eoYs4o2CnFv2SGaHWFjeZ5pfroRW6y7l4YQJelNuPZm7pfrdK
         wxo0CRBayQVtpdBlvLHdVy3R6pq1ahGpn0oVSaB80wWMV/abcpQbrqOawMN4TcuJx0ln
         whLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si7365988ybp.426.2019.02.13.01.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:00:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqP0-0001D2-Gl
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:00:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqFy-00025D-K8
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq5E-0006Fe-Do
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq5B-00069y-Hi; Wed, 13 Feb 2019 03:39:55 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23AED3DDB3;
	Wed, 13 Feb 2019 08:39:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC28C10021B6;
	Wed, 13 Feb 2019 08:39:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:16 +0100
Message-Id: <1550047098-1210-24-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Feb 2019 08:39:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 23/25] hw/arm: Express dependencies of the
 ZynqMP zcu102 machine with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S04V/cWXqQj2

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 11 +++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 4ea9add..3a4b15e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,10 +3,6 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
 
-CONFIG_AUX=y
-CONFIG_DDC=y
-CONFIG_DPCD=y
-CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3d96d1b..721cc07 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -289,6 +289,17 @@ config STM32F205_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    select AHCI
+    select ARM_GIC
+    select CADENCE
+    select DDC
+    select DPCD
+    select SDHCI
+    select SSI
+    select SSI_M25P80
+    select XILINX_AXI
+    select XILINX_SPIPS
+    select XLNX_ZYNQMP
 
 config XLNX_VERSAL
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a5f3fc0..d2ae2f1 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -108,3 +108,4 @@ config VIRTIO_VGA
 
 config DPCD
     bool
+    select AUX
-- 
1.8.3.1

