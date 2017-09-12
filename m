Received: by 10.223.172.38 with SMTP id v35csp7464050wrc;
        Tue, 12 Sep 2017 11:14:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDKpM1NTqKYLUTi5LNgVQoV+Wm1nNnHhOFUklx5HYuqnblLKxlZC7/dlQzeCEBEFF0P4xpW
X-Received: by 10.200.38.110 with SMTP id v43mr12334020qtv.296.1505240052307;
        Tue, 12 Sep 2017 11:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240052; cv=none;
        d=google.com; s=arc-20160816;
        b=a14AK5h7aTkuZKFi8uj29MlH0BmtwHgT0IHFvH827RNE6JQA7/wXW592ve7hm4Lh96
         CIAelSpAzBKRlymjSwdcoWG/qzKorC83N74gv6lI+FWYWeIatQetYWcQM4uxqsShxq7J
         nbOOQ8An9h1gDUVzEfas4S204hnm2ejMD3y5u9yHWiYia8T16PwJsUxt68XoFWExPySO
         xeWxewZBZ9kBjcSC8M3JOVYxQ8SrzNFFEOZXIFYdJS27rl61qrMEwtc/xgn3/2oUlCtG
         I1eK96+J5aO5TEa0HG19LWbdh94JI7f73gE8/cXQJzeKPYNJRGT5Mri7WcQFpM6VkEuh
         xWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0RdA84HwaRVq1HY6y6uO6ARE7wTHWisiKDdMt0RMmtc=;
        b=mu+hvApElKWlbTCwTYJT6io4QUQCj8sFWx0B1isw6TpQ9yb3oiLj03mbuhKZgKGloI
         eEgZ54QqTFZtDm6jrPpvdP4CZBBQHYuG9cBYmdojRmG6jE70AxMIC9WTzhetMfwuruWP
         GYvqKwsD8UCWANHfOvk6W1VjZKwT4HB0W3s2unDkqr0JDL+XF4ZrlO8VjOAhLZEST/yd
         ckvtHVp8p+pazZFYX8hgO25CzgBHSL8/5cQXIr1RNioxYbY8sHpe7H+h4hhiK39cdehF
         NlL1ebAqOiPSeq3oI09meZSorHmww9hu3tFaop4HqgNgZgP9nQUfsBUPxFcF2F5RXEB/
         KSPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x33si10153743qtx.533.2017.09.12.11.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drphJ-0003ZE-W6
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:14:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgv-0003KD-1g
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgt-0006Lj-RS
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgt-0006IX-Kg; Tue, 12 Sep 2017 14:13:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgr-00013V-Hy; Tue, 12 Sep 2017 19:13:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:50 +0100
Message-Id: <1505240046-11454-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/19] nvic: Add cached vectpending_is_s_banked
 state
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
X-TUID: OXqStoRAnD72

With banked exceptions, just the exception number in
s->vectpending is no longer sufficient to uniquely identify
the pending exception. Add a vectpending_is_s_banked bool
which is true if the exception is using the sec_vectors[]
array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 11 +++++++++--
 hw/intc/armv7m_nvic.c         |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 317601e..87c78b3 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -57,10 +57,17 @@ typedef struct NVICState {
     VecInfo sec_vectors[NVIC_INTERNAL_VECTORS];
     uint32_t prigroup;
 
-    /* vectpending and exception_prio are both cached state that can
-     * be recalculated from the vectors[] array and the prigroup field.
+    /* The following fields are all cached state that can be recalculated
+     * from the vectors[] and sec_vectors[] arrays and the prigroup field:
+     *  - vectpending
+     *  - vectpending_is_secure
+     *  - exception_prio
      */
     unsigned int vectpending; /* highest prio pending enabled exception */
+    /* true if vectpending is a banked secure exception, ie it is in
+     * sec_vectors[] rather than vectors[]
+     */
+    bool vectpending_is_s_banked;
     int exception_prio; /* group prio of the highest prio active exception */
 
     MemoryRegion sysregmem;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 694b9e0..417a456 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1250,6 +1250,7 @@ static void armv7m_nvic_reset(DeviceState *dev)
 
     s->exception_prio = NVIC_NOEXC_PRIO;
     s->vectpending = 0;
+    s->vectpending_is_s_banked = false;
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
-- 
2.7.4

