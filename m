Received: by 10.28.71.27 with SMTP id u27csp1164971wma;
        Fri, 9 Feb 2018 09:03:24 -0800 (PST)
X-Google-Smtp-Source: AH8x22438rKjHZ9QzzjpbwbKD7IDU/zFGVLbmoBTRBi1KvUgJpEyxbONC5iEcKsqWpHayc59OYBM
X-Received: by 10.37.155.7 with SMTP id y7mr409590ybn.518.1518195804460;
        Fri, 09 Feb 2018 09:03:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195804; cv=none;
        d=google.com; s=arc-20160816;
        b=j+AD+Kn/llbdFyjqb124WYrlbfaeGu66LZzXouYDpHbwWrL60sBnPtQDRSdN7I5se2
         e8HFRGb8aTFPWZSTI7mAXRj1YdDzfdqxuJ3Sx9HSrS1FKhFIJKL3/ZQzldkq6BMObjyO
         0YgjsK6Em8mM9KqWyQ/wPcAEdA9gF2FYF7Y4PaRaCXA6orn0onP7S1gBumBQKyOc5wS/
         1A33pS/vNqGGDY0E9eU2mbw0w1pUKY0I256Vub6lwduJ/wWMpw9GYlxpr/FmujR69tNu
         NvIqj38elZFWnZkF7DCgjHkdWkKGFA1at2rlHmwNVOYS9N/JPeqmyv2V0lVCU6evup/t
         6n0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kOs0l740S7EYdlPDNB9WaKoetr+mQfo05LmniM8iPR8=;
        b=jhEEBeSEUd/ynm1BWlsFDjKWeqsEQBAiLshTAyQPQh52VZEV1qe5UtnHU7uz2TM0BO
         zqMEdCuLwcYGr0OBfzZHmgcpe7Fcoz2JtllJZbWJnf2Vrr+KlK7tHmqxkhwT8qUWv3hv
         tO/52jtU4K+JyQox22ThqGI8+Cd0wXUxzbboxCKB7e2mqd19O3VjZJHx+2dDsqxelffe
         VB385CXbn92k7PaPS0pbQEoLxfk5IeX0CT8GneF0cYdGuom0340lDqLwqdSDae52i/hZ
         Ch6etu8sIInK/VK4t5oXEUWoUrzbIOpgFPu7slj1HophsxjNgWoapopKn6VikIlIZMK1
         uVXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si474085ywk.611.2018.02.09.09.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:03:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC55-0007ei-Oq
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:03:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0D-0003yV-UU
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0D-0007ql-2Z
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:21 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0C-0007oa-ME; Fri, 09 Feb 2018 11:58:20 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC0B-00031W-Id; Fri, 09 Feb 2018 16:58:19 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:08 +0000
Message-Id: <20180209165810.6668-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 09/11] target/arm: Add AIRCR to vmstate struct
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
X-TUID: VyVS9xcym1rK

In commit commit 3b2e934463121 we added support for the AIRCR
register holding state, but forgot to add it to the vmstate
structs. Since it only holds r/w state if the security extension
is implemented, we can just add it to vmstate_m_security.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 30fb1454a6..25cdf4d581 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -423,6 +423,10 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
         VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
         VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
+        /* AIRCR is not secure-only, but our implementation is R/O if the
+         * security extension is unimplemented, so we migrate it here.
+         */
+        VMSTATE_UINT32(env.v7m.aircr, ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.16.1

