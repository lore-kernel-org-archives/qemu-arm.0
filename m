Received: by 10.223.172.38 with SMTP id v35csp3209639wrc;
        Fri, 22 Sep 2017 08:00:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDmczZhc2Nhz1KMz/ElVczFZsczfU8/jli6YTUluOoDYyW2HoSUjpwArn2H1piDSGJXes7F
X-Received: by 10.55.16.74 with SMTP id a71mr8597172qkh.170.1506092406831;
        Fri, 22 Sep 2017 08:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092406; cv=none;
        d=google.com; s=arc-20160816;
        b=NE5ra+d4k05ctS4UYzJOgUa58w3f4SkjD6FO7hrSka+W63w6ovILDSHDmR/nOyYmpx
         /Xv5LTiGIM+BB72aGv/aBpMszh4jfPhb6zrGkAJ//YnrVbl1hXTVUpK63Rl5SZ+GNoJT
         hPKUk3YeVFGp0eNXZJOzrANni1vBInaf5wUAy0Oh5gATSDAg3/ENno60l07Fblo9etl2
         w5QqxGg0NZCs72U4Cq+7dUL4ejrlqMi3BAfw5C+yjzohj6xh6TeTfXSC1CZ6NP287PvC
         aF9f8LYUwuo9BJHQXOcBexiGKj8xIg9iUnPQYj0Tutmw0sH9WcRpxITUwnpYT0K+ydqo
         hpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=eYjzFvsOeZ7TOJ9PjbfOpFu+JiyM+T227XmUcJoz6dk=;
        b=bRXfEmvF6rKX/xxnqpLamUHKnoLQJz97RtVE8UoEuyoPyC2cKfv4zv3jjQHG/8n45q
         ukdymVq5pA/aMo2rhMDqFSc8DqyObm4UlOTSZIRYcPlmzh1pQRuR7lP6LNu9qfol3Va1
         qwC3ao2mu4ibHbWxYK/Kslvi2wZlUFK+AHTt8UySOaLM7XNmHB97DthlxDFdbzAMreK8
         cyGJNy/EB6hqEiH5Ll5eWO2cbJzeuFBXBMI2Zrv7/YG7fwnnNPNekVvgzmcKpgJFaVGy
         XHXMy/EGPcfAJKCe6HswqoMNgnJev+HF+E7Nx5TNCU/YQIBXXfyPN7hawXEppD2KEd4E
         JhpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w34si29528qtg.75.2017.09.22.08.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPQy-0008AO-KK
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:00:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQU-0007rW-2F
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQT-00040I-Bw
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQT-0003yz-5l; Fri, 22 Sep 2017 10:59:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQQ-00077x-HY; Fri, 22 Sep 2017 15:59:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:48 +0100
Message-Id: <1506092407-26985-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/20] nvic: Clear the vector arrays and prigroup
 on reset
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
X-TUID: 3q8lwZX4ddom

Reset for devices does not include an automatic clear of the
device state (unlike CPU state, where most of the state
structure is cleared to zero). Add some missing initialization
of NVIC state that meant that the device was left in the wrong
state if the guest did a warm reset.

(In particular, since we were resetting the computed state like
s->exception_prio but not all the state it was computed
from like s->vectors[x].active, the NVIC wound up in an
inconsistent state that could later trigger assertion failures.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index d90d8d0..bc7b66d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1782,6 +1782,11 @@ static void armv7m_nvic_reset(DeviceState *dev)
     int resetprio;
     NVICState *s = NVIC(dev);
 
+    memset(s->vectors, 0, sizeof(s->vectors));
+    memset(s->sec_vectors, 0, sizeof(s->sec_vectors));
+    s->prigroup[M_REG_NS] = 0;
+    s->prigroup[M_REG_S] = 0;
+
     s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
     /* MEM, BUS, and USAGE are enabled through
      * the System Handler Control register
-- 
2.7.4

