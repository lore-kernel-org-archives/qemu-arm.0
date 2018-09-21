Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2852029wrd;
        Fri, 21 Sep 2018 01:19:28 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaZQx1bfW0X7823ILMlvRcz+DTnYS+ZguyIjyG351vtRRokd6XXH1zd+5grSuqOpaRF2d7x
X-Received: by 2002:a37:4ecb:: with SMTP id c194-v6mr29688053qkb.345.1537517968718;
        Fri, 21 Sep 2018 01:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537517968; cv=none;
        d=google.com; s=arc-20160816;
        b=C/5blWa+H2bnDPiHknJj0BVkDSdrGA4Mc6fC0+NJvbaCxrFLx/Ez+Rb5F8lIcmquCF
         O7OkEp/EGmq7MxC4QzV1Cl8X7TQkMm8wR8ypzZWdQ8w/81Iwq1dZ2y5UnCbwtWekD6Gd
         gjorXl1K27euqBNHB/m4afjyrDM2DaIalxgQ1upbeAHXMDoxbSjZz9Tz6YuIGv1lPXoX
         kdxLtccUZ7IuqRrBdZaoQ4ZPQZQ2tvFg0Sj9neti0d0NLHnI2WhVajQEbAYIF4ZNx47M
         9o+NE7MVoQPCm6ySrtkLcRSuxxmyquAe9aq4Y1D3A1XF7WyR2Z0DymObRXVTOZP0koKM
         5VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Xd+HwDIm016z5rnm8x30fGQHYHG40TaAp0mIT5jv86w=;
        b=J/Y7m87YJPeOBxMMYRpm0UvryqmarADcsdHlSoEJdsTqv5zD7ljBZdHkAX6ZnbLhEG
         3r4YP/0TWxbmrwph79cbOLNlDbGxlo1Y8DnzZTNxr2ARfmNcTZzwjFJ1NkDMQyd7KQLk
         W+NcDupJnQrEJGl5gne3JVjoP0FG/9TkR894kG+OWKZ2cmEDBWCpxfynqQF3MSbPussK
         jTkj5ZyNT/LLNtBZX8Mo20q428j/qN+GaxGXn5qxtAptzjcOar/oBzkoH2TEDKTWu7wy
         d4plMdSK2/t0oaoSn6OF07icskX0r1OiFHrNsxp7tVKitUkPYZ/TUp4219YrINIutjIn
         UmiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f194-v6si2701232qke.153.2018.09.21.01.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Geu-0003p2-6T
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:19:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeP-0003ZL-DP
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeO-0001CW-HD
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GeO-00019O-9R; Fri, 21 Sep 2018 04:18:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5568C308FBA9;
	Fri, 21 Sep 2018 08:18:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1527D665;
	Fri, 21 Sep 2018 08:18:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:53 +0200
Message-Id: <20180921081819.9203-3-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 21 Sep 2018 08:18:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 02/28] hw/arm/smmuv3: fix eventq recording and
 IRQ triggerring
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eq/AKgjkTw4x

The event queue management is broken today. Event records
are not properly written as EVT_SET_* macro was not updating
the actual event record. Also the event queue interrupt
is not correctly triggered.

Fixes: bb981004eaf4 ("hw/arm/smmuv3: Event queue recording helper")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 26 +++++++++++++-------------
 hw/arm/smmuv3.c          |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bab25d640e..19540f8f41 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -442,17 +442,17 @@ typedef struct SMMUEventInfo {
 
 #define EVT_Q_OVERFLOW        (1 << 31)
 
-#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 , v)
-#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 , v)
-#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
-#define EVT_SET_SID(x, v)               ((x)->word[1] = v)
-#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
-#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
-#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
-#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
-#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
-#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
-#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)
+#define EVT_SET_TYPE(x, v)  ((x)->word[0] = deposit32((x)->word[0], 0 , 8 , v))
+#define EVT_SET_SSV(x, v)   ((x)->word[0] = deposit32((x)->word[0], 11, 1 , v))
+#define EVT_SET_SSID(x, v)  ((x)->word[0] = deposit32((x)->word[0], 12, 20, v))
+#define EVT_SET_SID(x, v)   ((x)->word[1] = v)
+#define EVT_SET_STAG(x, v)  ((x)->word[2] = deposit32((x)->word[2], 0 , 16, v))
+#define EVT_SET_STALL(x, v) ((x)->word[2] = deposit32((x)->word[2], 31, 1 , v))
+#define EVT_SET_PNU(x, v)   ((x)->word[3] = deposit32((x)->word[3], 1 , 1 , v))
+#define EVT_SET_IND(x, v)   ((x)->word[3] = deposit32((x)->word[3], 2 , 1 , v))
+#define EVT_SET_RNW(x, v)   ((x)->word[3] = deposit32((x)->word[3], 3 , 1 , v))
+#define EVT_SET_S2(x, v)    ((x)->word[3] = deposit32((x)->word[3], 7 , 1 , v))
+#define EVT_SET_CLASS(x, v) ((x)->word[3] = deposit32((x)->word[3], 8 , 2 , v))
 #define EVT_SET_ADDR(x, addr)                             \
     do {                                                  \
             (x)->word[5] = (uint32_t)(addr >> 32);        \
@@ -460,8 +460,8 @@ typedef struct SMMUEventInfo {
     } while (0)
 #define EVT_SET_ADDR2(x, addr)                            \
     do {                                                  \
-            deposit32((x)->word[7], 3, 29, addr >> 16);   \
-            deposit32((x)->word[7], 0, 16, addr & 0xffff);\
+            (x)->word[7] = deposit32((x)->word[7], 3, 29, addr >> 16);   \
+            (x)->word[7] = deposit32((x)->word[7], 0, 16, addr & 0xffff);\
     } while (0)
 
 void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bb6a24e9b8..8c4e99fecc 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -136,7 +136,7 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
         return r;
     }
 
-    if (smmuv3_q_empty(q)) {
+    if (!smmuv3_q_empty(q)) {
         smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
     }
     return MEMTX_OK;
-- 
2.17.1

