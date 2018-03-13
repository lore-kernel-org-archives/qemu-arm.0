Received: by 10.28.91.67 with SMTP id p64csp849878wmb;
        Tue, 13 Mar 2018 08:36:28 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvIGSK9gpKgkEJDSD81zeOvwtL1uowL4QYedZ/dz6P1OGNSYezFO/Ilgk4l6Y2n+/sSEBsH
X-Received: by 10.55.15.15 with SMTP id z15mr1452838qkg.171.1520955388309;
        Tue, 13 Mar 2018 08:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955388; cv=none;
        d=google.com; s=arc-20160816;
        b=M/BXJrrlrrkiv8eF9PRH4jRj9J+C+Qcjsqf5VXw47ineF5qHmkDj57rt85f4s8NK01
         hqr6ZQNpitmgusDxIetK1oNE8V+glh0iCFUjLSY0jdsYnOwm67BR2+WtlDD8GW+1DLoW
         HVQ66yaMdnO85q3pDcbToFrHBdTocaRjXYkwgjq9zX6+orHnbDV4jPZqg3SNYxz8smAB
         cXaqDuS4xONee3UPar0f/MSax6KXI3fW4wz3St4esMo/8T51iI0T94bcdSzMDVu9vAyH
         axrhyu0MjJP+sSdL6rbNTi8p9sArjiKpROcPK3zFBpPtDVq85O1SdfcUBnODiLln/DYD
         jYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9BteupbPsug9iUj+zZyvMYumndQ+T8rwze+rfs5/KPY=;
        b=eP7Edq/wY/yfJlKNAQzFQd0b99PPnRRgOCb24ok3MpBIXsz7pmTgB4YnhbiPIVkhLs
         XwF3XKRhB3fZTjdOfU8ESPZDoV0MAgbic8Va0GFWZEBbKOqYlXVBNgGZwiUGFNrczmoT
         WUoui8LzBMCyugSvnzBf70B4D1ShY7C+DPGqWtVweO0kgXbmoeO96YesT4f6Jn/O93Aj
         +DiQWYg9yKVZaXvS91nf8yM6TAujZ/A8DjI7LME9awhlVqY0t7nJVWuQfHPQZmvNpWfg
         t5oWEw5CJyWbtUHOJ2WF3hkbIHTWcLhkMq6Z6EseX6QBNjqNuGYB+w4lUIAhZmNoqxy1
         GEAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si457742qtp.264.2018.03.13.08.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evlyV-0006eA-MC
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:36:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxP-0005U8-Nj
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxJ-0005oW-MS
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxJ-0005j0-Ch; Tue, 13 Mar 2018 11:35:13 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlxC-0003G0-0N; Tue, 13 Mar 2018 15:35:06 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:56 +0000
Message-Id: <20180313153458.26822-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/9] hw/arm/bcm2836: Use correct affinity values
 for BCM2837
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PeTQMsraVdsF

The BCM2837 sets the Aff1 field of the MPIDR affinity values for the
CPUs to 0, whereas the BCM2836 uses 0xf. Set this correctly, as it
is required for Linux to boot.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2836.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 07d2705f96..7140257c98 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,14 +25,17 @@
 
 struct BCM283XInfo {
     const char *name;
+    int clusterid;
 };
 
 static const BCM283XInfo bcm283x_socs[] = {
     {
         .name = TYPE_BCM2836,
+        .clusterid = 0xf,
     },
     {
         .name = TYPE_BCM2837,
+        .clusterid = 0x0,
     },
 };
 
@@ -58,6 +61,8 @@ static void bcm2836_init(Object *obj)
 static void bcm2836_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
+    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
+    const BCM283XInfo *info = bc->info;
     Object *obj;
     Error *err = NULL;
     int n;
@@ -119,7 +124,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         /* Mirror bcm2836, which has clusterid set to 0xf
          * TODO: this should be converted to a property of ARM_CPU
          */
-        s->cpus[n].mp_affinity = 0xF00 | n;
+        s->cpus[n].mp_affinity = (info->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
         object_property_set_int(OBJECT(&s->cpus[n]),
-- 
2.16.2

