Received: by 10.223.197.9 with SMTP id q9csp829429wrf;
        Wed, 11 Oct 2017 10:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RdTj5dRQCYeyaXM1JoS6t8ePaFUjTkWAacyFa2PIy7X8/BmFZ5PtAwUEVx7YfwNMNB2uaj
X-Received: by 10.55.210.71 with SMTP id f68mr546298qkj.150.1507742698890;
        Wed, 11 Oct 2017 10:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507742698; cv=none;
        d=google.com; s=arc-20160816;
        b=jc/HH3LfAJovQU7yn5cDS0BEFT72s5tjfesAKWp+OI8XCpwF+/QlXrfeHNWDiqhKGx
         5Fh2/0+fguIjOnqQ9IsWGMHNT4jo3Lt9XqcDcOahM3dZr8WoWf0/54jHvogPIS+8rZ3s
         WhTaYnhjPOEXWC6qrMhQSssmBmhJ2Mvkt9smdaQwOnJhUwZT5fUT2oj1TkGHqfpijRaF
         6ZIqGIa7uDd6mSicHJd+Cu1KW8xQT+PnJd07nQpfYymdtJyaR7lcEj+ymTiBP7elcUxc
         uRZMe7bNrk7o4r+KakP4lSbyGWpo759tjhrwXFAXqI8mW6GmgNYJWftw1TQlO5Mmwz4D
         +YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=q3+A/IthDmre+DlQjXpbZ6mnbWkKsBjzJ6gXEPKWgII=;
        b=aS9UPSJSjqpIjyOquF0RGi+WZq8AEQV3H9fJtgZaGZ4KyBtaDERakhejqRy3Z3QUqS
         FttsgngEvgWlQHt0kT0hZj8eqCHdfhA9F29dyBaCEfTp+HJt8+9szBuXw2igMeBAbFKj
         Qf5kFGY/SSdHa/1Lx8iziLQMeuoBYvuwlIpXi4pRGc8Mkk+HwoJ3lveJQUxDZL4DcAv2
         Jw2xpSYunjhK+5OBZ8djQw6uSVc1FgTr+/lsI8Z6/vSIrGqzo+4ZWbFnqMWoiiDEp4U5
         VBpqDRruPywmXc4yBAftegQQf6mmfb9//CbU7885F+XHvM31WKVvl7wPLEUbPEkydVSP
         /FCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g64si1875686qkc.288.2017.10.11.10.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 10:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2Kka-0007fg-Lr
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 13:24:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e2KkM-0007dy-O1
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 13:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e2KkM-00042m-1d
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 13:24:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e2KkL-0003zd-Rd; Wed, 11 Oct 2017 13:24:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e2KkC-0007JD-KV; Wed, 11 Oct 2017 18:24:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 11 Oct 2017 18:24:36 +0100
Message-Id: <1507742676-9908-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] nvic: Add missing 'break'
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GUZtC2TyJOci

Coverity points out that we forgot the 'break' for
the SAU_CTRL write case (CID1381683). This has
no actual visible consequences because it happens
that the following case is effectively a no-op.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 201e90f..be46639 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1447,6 +1447,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             return;
         }
         cpu->env.sau.ctrl = value & 3;
+        break;
     case 0xdd4: /* SAU_TYPE */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
             goto bad_offset;
-- 
2.7.4

