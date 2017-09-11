Received: by 10.223.172.38 with SMTP id v35csp5559858wrc;
        Mon, 11 Sep 2017 06:52:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDq5nkQAwYsLhpuOAI2AMhWWwcQ0U93OHXqzLdzwhalF/FxGT97JCT1to8PYL+1Vl/I4cpL
X-Received: by 10.55.76.134 with SMTP id z128mr16063415qka.183.1505137930730;
        Mon, 11 Sep 2017 06:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505137930; cv=none;
        d=google.com; s=arc-20160816;
        b=JoRSaaOTbFHDqsDVPMD/rprKkSgw52QYJ8/ffRKC/obk5wvK4K+6dyobggfEkvPuBJ
         sE5V8cbNTvr28HATyCo3NgxcT2EoF9DsT4JuKSw2lMhv2ezjYfap5oB1cWaOVs9k2Lke
         KTPW1JV6hBMIkj6XN71wNK740zURY787jglldoE+kpnksc4/N2sSQmU17le0+Z79iSjQ
         1T2V7UHJirAfgbEKupJQ98P1m4Gsm4ODKYoPefXtcE9vUYjpP+BT3ntbiHJK5Lu11vQn
         exbhlDO+n66ATpeKzslniCBrUF1lW4oNANQ5RX3u6aLxdBHcFhLf50Hoi9KQp0E0BjuI
         Jz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ak6eDkVOr9wRUe7yevzq9xJxkTkFAKk1+BvJtSbvFWQ=;
        b=H9VjH4J87QTMJEnNrcws2mYkabs/JVG5s3LRsqjpZAcN/ZTio5fVLYs6UR0I5Fz5Ri
         vpV7CCpbafRbXApB37a5g4OawQ/2PJA589kJbw7dEuDZWLtuPHCRVIABKWhX8maLUFyM
         7AHgk4iilJCQuQ4pIFe2/6YbF5Lrnwjg9Ui9q0R8lcM75SUY/HJEt2YBjRZZWK2m3cio
         HkxBDrk1H4vMg6ZLhzyI2PAfc65hqhUmp04/jIObnBu0zXmyUG+0JrJJiCFGLujqyeLq
         onM//HzdZKwa6RvzGESpJaoG8V3/n/EG2ApNdlkmph4R4s2NBkwxi+rrhnYpZFjR1xOz
         hVyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v46si5873708qtg.348.2017.09.11.06.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drP89-0001fU-8Y
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:52:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP83-0001dL-RJ
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP83-0002BR-4J
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:51:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP82-00023m-UK; Mon, 11 Sep 2017 09:51:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7q-0007mE-Rl; Mon, 11 Sep 2017 14:51:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:06 +0100
Message-Id: <1505137930-13255-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/7] target/arm: Get PRECISERR and IBUSERR the
 right way round
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
X-TUID: M4Wvi2wzdoOd

For a bus fault, the M profile BFSR bit PRECISERR means a bus
fault on a data access, and IBUSERR means a bus fault on an
instruction access. We had these the wrong way around; fix this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 668e367..1741e0d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6430,15 +6430,15 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         case 0x8: /* External Abort */
             switch (cs->exception_index) {
             case EXCP_PREFETCH_ABORT:
-                env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_PRECISERR_MASK;
-                qemu_log_mask(CPU_LOG_INT, "...with CFSR.PRECISERR\n");
+                env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_IBUSERR_MASK;
+                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IBUSERR\n");
                 break;
             case EXCP_DATA_ABORT:
                 env->v7m.cfsr[M_REG_NS] |=
-                    (R_V7M_CFSR_IBUSERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
+                    (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
                 env->v7m.bfar = env->exception.vaddress;
                 qemu_log_mask(CPU_LOG_INT,
-                              "...with CFSR.IBUSERR and BFAR 0x%x\n",
+                              "...with CFSR.PRECISERR and BFAR 0x%x\n",
                               env->v7m.bfar);
                 break;
             }
-- 
2.7.4

