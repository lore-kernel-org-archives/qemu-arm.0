Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6394901wrt;
        Mon, 21 Jan 2019 11:11:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4vDpmsXMtzAzKb/jyWKX8nCiByE/BonI/PcDI9er2JwHLuyNMHGkVDSNC/TD6ASdiwCd1P
X-Received: by 2002:a1c:8095:: with SMTP id b143mr568802wmd.63.1548097918309;
        Mon, 21 Jan 2019 11:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548097918; cv=none;
        d=google.com; s=arc-20160816;
        b=H3buNoNc1FCwVUkrDfdFkIyXWq4W4x5ZuiHgLGwsWA7igu8s5obpkm3SSBWSWYkPAi
         674IWUHdmtBGE3wj9+Xy+MGjkU5AFA2Xpm+vz6zrNuEz8KIGF0Dwcdri4f5lGJ+Hmzj4
         /UggBjcTmpONxN5uJKw2RYyABBdvPaaeJcm9SE8RqbfmN/D5Pt8j3BWSqKZHontnI86d
         OcreoEiNUdiPeQRBRTyxc70fbXxGI8ryDCadbLQjzm6cMygyQPAMS3/aHqYUTgGsTv3H
         bx7fX6EqwBDiYhbTT1Gxy2XLFG2/82pAO2yH8WkeQwFwoDYmAq9VOy/2C1+0OVPXSpEg
         iOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PvO18lRzUs66YBhl5hb4KNvCqQL2PZhRg/eBt9ybWrc=;
        b=xevVdKtJmgWutY109P1tRLQpjaqxTRHlZvRY/Uu7q3XmRnp+dsYFoFb55tWs7Bqj1R
         8XjnbN6N051dK+OIvApVh9RY8di9U12wBPivRM+fycWDaJVV1K+FMJb32kbHm0wFyouJ
         3Jw8eS+BcE6cwpFahFiYUAHLiuf0sw7NS38SpwW1bNTYXHQLd6j8hbEm1zEZ4rlQ27+P
         Hu9fM6DW5maXpEW/MbeVFXRodQikk7kx6uuZyE2Ig9U92vAdaBLBztX6muxqQP4JfXc7
         d7yhBce3lNrGB4d8mpzJ7+WLWTpzbfF3aCyfImVSzXxk3itjxDJ8vFqBVHiPi3unjbwd
         E63Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FS1zvB3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si66285047wri.417.2019.01.21.11.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FS1zvB3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glezF-00036Q-7G
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevU-0007jF-Mk
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefY-0002lJ-O3
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:37 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefU-0002cN-VT
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id t200so11925203wmt.0
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PvO18lRzUs66YBhl5hb4KNvCqQL2PZhRg/eBt9ybWrc=;
	b=FS1zvB3Lf0kfZmeTKPrbGpQmprlmH8Jl/MPGrCkn8roIJSKQxYbQel2UPSAe3sPRTS
	uh/zsR4oscSRe4gbLPj55vOegvdLBZWsreGSAOZo00qqXfuFlhXk6I5THugxf9U09TJH
	XVxz2w7BJJWn6X6tB5DorxfMa5LBcLhhBr5Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PvO18lRzUs66YBhl5hb4KNvCqQL2PZhRg/eBt9ybWrc=;
	b=PPwA4jnbHRkBnUMdLAwzMm0P3YDOi2eNOVFSl2OY8pd8am0q4ingq0ipNO6uThCVTJ
	hs6AtEjeSoBPVcI6/MqWk9kU2M+P6KqTsovcuu0s1C/N3NvYOj9nklCRWTV6RZu5anGr
	dEmszOQ0tZ2xQ5AC/v8sWjBNl6dNu+FBN/kkEIp7jXu+sgREskkPBZvRcVjKmmVhSmL9
	WQLk9QwT4JrnoYx4085gkJ8xY0PnwvKvq7H8JXTnTyEo6vjQnbzlxYKJHbqh+u8aommR
	ODotaYonm4nm0ey/M9eaIEqLIUMxFXvXje8kxluI/Xtv/WuQAPMbqlAFUIzKvDMQthkQ
	gMzg==
X-Gm-Message-State: AJcUukfdNwa/Csof8aARafiCDATAHeXSVYZ9HkeKLBDMmmqra2L6fF73
	64a+D61oaK7FiiHxN8TYrarO0Q==
X-Received: by 2002:a1c:6489:: with SMTP id y131mr572455wmb.34.1548096688538; 
	Mon, 21 Jan 2019 10:51:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:02 +0000
Message-Id: <20190121185118.18550-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 07/23] hw/arm/iotkit: Rename files to
 hw/arm/armsse.[ch]
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rhz0OctTe2dl

Rename the files that used to be iotkit.[ch] to
armsse.[ch] to reflect the fact they new cover
multiple Arm subsystems for embedded.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Makefile.objs                  | 2 +-
 include/hw/arm/{iotkit.h => armsse.h} | 4 ++--
 hw/arm/{iotkit.c => armsse.c}         | 2 +-
 hw/arm/mps2-tz.c                      | 2 +-
 MAINTAINERS                           | 4 ++--
 default-configs/arm-softmmu.mak       | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename include/hw/arm/{iotkit.h => armsse.h} (99%)
 rename hw/arm/{iotkit.c => armsse.c} (99%)

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 50c7b4a927d..22b7f0ed0ba 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -34,7 +34,7 @@ obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MPS2) += mps2-tz.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
-obj-$(CONFIG_IOTKIT) += iotkit.o
+obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/armsse.h
similarity index 99%
rename from include/hw/arm/iotkit.h
rename to include/hw/arm/armsse.h
index 521d1f73757..ff512054988 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/armsse.h
@@ -58,8 +58,8 @@
  *  + named GPIO outputs mscexp_ns[0..15]
  */
 
-#ifndef IOTKIT_H
-#define IOTKIT_H
+#ifndef ARMSSE_H
+#define ARMSSE_H
 
 #include "hw/sysbus.h"
 #include "hw/arm/armv7m.h"
diff --git a/hw/arm/iotkit.c b/hw/arm/armsse.c
similarity index 99%
rename from hw/arm/iotkit.c
rename to hw/arm/armsse.c
index 7ff14fd5aef..8554be14128 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/armsse.c
@@ -15,7 +15,7 @@
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "hw/registerfields.h"
-#include "hw/arm/iotkit.h"
+#include "hw/arm/armsse.h"
 #include "hw/arm/arm.h"
 
 struct ARMSSEInfo {
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5824335b4fb..3859f17d98b 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -46,7 +46,7 @@
 #include "hw/misc/mps2-fpgaio.h"
 #include "hw/misc/tz-mpc.h"
 #include "hw/misc/tz-msc.h"
-#include "hw/arm/iotkit.h"
+#include "hw/arm/armsse.h"
 #include "hw/dma/pl080.h"
 #include "hw/ssi/pl022.h"
 #include "hw/devices.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index af339b86db7..52222117d77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -625,8 +625,8 @@ F: hw/arm/mps2.c
 F: hw/arm/mps2-tz.c
 F: hw/misc/mps2-*.c
 F: include/hw/misc/mps2-*.h
-F: hw/arm/iotkit.c
-F: include/hw/arm/iotkit.h
+F: hw/arm/armsse.c
+F: include/hw/arm/armsse.h
 F: hw/misc/iotkit-secctl.c
 F: include/hw/misc/iotkit-secctl.h
 F: hw/misc/iotkit-sysctl.c
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2420491aacd..3f200157879 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -114,7 +114,7 @@ CONFIG_MPS2_SCC=y
 CONFIG_TZ_MPC=y
 CONFIG_TZ_MSC=y
 CONFIG_TZ_PPC=y
-CONFIG_IOTKIT=y
+CONFIG_ARMSSE=y
 CONFIG_IOTKIT_SECCTL=y
 CONFIG_IOTKIT_SYSCTL=y
 CONFIG_IOTKIT_SYSINFO=y
-- 
2.20.1

