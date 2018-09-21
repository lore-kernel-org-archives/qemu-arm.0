Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2788490wrd;
        Fri, 21 Sep 2018 00:02:06 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZI8DxwHY+6aDIu5BL8yFuX5RR61rFWbohMxbcjnCUZSGaK1T0mJY4sIPGlN4o80suB2pBt
X-Received: by 2002:a37:d743:: with SMTP id m64-v6mr6095902qki.322.1537513325935;
        Fri, 21 Sep 2018 00:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537513325; cv=none;
        d=google.com; s=arc-20160816;
        b=PqyqEm4XXrVLIIGyR7+1RBgtdcmLRB5B3pb7b2XI1tjaxbeZkgI2UUhgqQKpAVp+Zi
         fvHy6hxSnnHU0xVX3ETvXeQhKuC8wqCX9bWxZTMGmSgEGWVDdy9hD0YzjDwcFXMMxrzH
         q6rg6C5l6V3YT6xsLNPUJqxmYmTNKZ1K8EK8Q8/C+EE8Y1Um8nLc7SdYoEApoULCb36L
         bCWr6hqID/NvXQN76NvXp/2xZ4kPdWKtZECJqD8qm2xBzY6uQH8wozMixcUdZLMX0VZ3
         jHX3rHxwCSbdZogDdYgrgeenoG2iZntRNGU6Wnp/MAiOwxHzdIzPioGKkRP9LQccGngE
         1U6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Xd+HwDIm016z5rnm8x30fGQHYHG40TaAp0mIT5jv86w=;
        b=jjlYl5QwoTMOqPA7R6fjXNzJwf1HZ/V0J6lcxRyXgAWutVDRJrVbYXw2cSta+GqnLp
         JSNSwhA5S/iHCjWWoO2VR/3IHRBNSGqG1Xh+ROTz67kTnG1oUiiBWJWb5l1Y09K1qrau
         xqZmRUq9Upd3bnF2NxHxGZpaeofjhO55Tg85Qgz0+k7U51FkAWsPvqZFOq43Gk9J2jg+
         BXI9ltwdNZJk9QYPRdk8z5ZoJVV44oLmgCqoGYqyjlZ/bjStE9v9uY7MXsMMCncpW1X+
         9+xAddtOMDv9aLZ109yOSD8vdEhjhUnrePH/Yr+7PYa3xYreJjf302dUlhwQ3yZd9uaX
         ApIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f142-v6si5515656qke.70.2018.09.21.00.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 00:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3FS1-0002R5-DN
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 03:02:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRm-0002Oo-VD
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRl-0005XR-Rs
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3FRl-0005Wb-JW; Fri, 21 Sep 2018 03:01:49 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E828A3082126;
	Fri, 21 Sep 2018 07:01:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5C3D2015AD1;
	Fri, 21 Sep 2018 07:01:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 09:01:38 +0200
Message-Id: <20180921070138.10114-3-eric.auger@redhat.com>
In-Reply-To: <20180921070138.10114-1-eric.auger@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 21 Sep 2018 07:01:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/smmuv3: fix eventq recording and IRQ
 triggerring
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ExA/yOUYorXE

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

