Received: by 10.223.172.38 with SMTP id v35csp7472501wrc;
        Tue, 12 Sep 2017 11:20:27 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDZ9GTaEKkilhUbLWFMmARBYLZYpIbJflYOW1gg+mOz8+Rs6H0BRhhKz5UKvJW1m+x+8wzL
X-Received: by 10.233.239.140 with SMTP id d134mr20844013qkg.59.1505240427197;
        Tue, 12 Sep 2017 11:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240427; cv=none;
        d=google.com; s=arc-20160816;
        b=D/yeWzjNzhvOHBBEtQug2Po73A1lJI3j/ajZ0ouWrCbsvFuE5F1zPobAD1a482EjZY
         eiEawvZ8HDkcmvmKyZYQOGxM7jvxIeQYJzAnVbpDEv8iKYIk4NTQFtsec9O34f8CiCW9
         mylArZr+loevGRw7rPWe2ChYGpE/Zr76fbINz0i65stMxUqjw7e7/eXejUuUK6w8PCEt
         fDxJqK7jH+MpaPKZ1Htm68Wk0uEOeCg14UqZxUgdfRzq2Q5cntdaiUlhAmorJ9HKQ6qc
         b8DMWh9NWsVv+YlaL+kCZLeCSMxfygXKsv8WB7wgqTwV9d9zBy0zONp+gLJ3yAh/esp/
         Ckiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KfqOr5c3D/TPnaY2YCNcC7WzwcmuUVPVB4jjexCkhwQ=;
        b=YHLjACzzcAOmnVIUa+JqhrICC5yjYDHh8dfA63yUAhUjPL0MeEziWx1wNgvCJIGEbY
         SfvWhoEMc+JZdZO7M04BrfFVOCJyylcRB9nOk9x6E/2xlNC28I/7fIGE6rvELJ8dEvKE
         IiC99k2cT3gn4zTh6xL61FQrYrjXxnfVUJ+249pEIewlI/leOCoDaWSl/cQ8BNfBCih7
         1Dn0yOHeD2Gdz5t/eH9BIVbVKazEJCngdiwTO/F9xlYXmFAm+WLZNavQvqE3u9Sf2UYN
         gwLw+UPh3cCy/a/FpNMid4zVwge/N+nLhcbG3w6LVAl1+Yh7jnxP41uCWTTXzQ64uy7s
         jkQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si14133202qtf.254.2017.09.12.11.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpnM-00012r-VF
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:20:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgz-0003PC-PA
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgy-0006Pl-Nk
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgy-0006O6-Fr; Tue, 12 Sep 2017 14:13:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgw-00017V-Vq; Tue, 12 Sep 2017 19:13:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:58 +0100
Message-Id: <1505240046-11454-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 11/19] nvic: Compare group priority for
 escalation to HF
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
X-TUID: AO45emwFHS6M

In armv7m_nvic_set_pending() we have to compare the
priority of an exception against the execution priority
to decide whether it needs to be escalated to HardFault.
In the specification this is a comparison against the
exception's group priority; for v7M we implemented it
as a comparison against the raw exception priority
because the two comparisons will always give the
same answer. For v8M the existence of AIRCR.PRIS and
the possibility of different PRIGROUP values for secure
and nonsecure exceptions means we need to explicitly
calculate the vector's group priority for this check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 00c03b4..3361a28 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -478,7 +478,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure)
         int running = nvic_exec_prio(s);
         bool escalate = false;
 
-        if (vec->prio >= running) {
+        if (exc_group_prio(s, vec->prio, secure) >= running) {
             trace_nvic_escalate_prio(irq, vec->prio, running);
             escalate = true;
         } else if (!vec->enabled) {
-- 
2.7.4

