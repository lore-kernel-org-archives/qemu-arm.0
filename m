Received: by 10.28.71.27 with SMTP id u27csp1167041wma;
        Fri, 9 Feb 2018 09:04:59 -0800 (PST)
X-Google-Smtp-Source: AH8x227yHcjB/ulPHcBoNMHOknifZbR7y2HWsvWqboN4JBMJcDUYfWIyHwexQv/gC/PJW9rEcFTM
X-Received: by 10.129.133.135 with SMTP id v129mr2472053ywf.107.1518195899644;
        Fri, 09 Feb 2018 09:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195899; cv=none;
        d=google.com; s=arc-20160816;
        b=DraJnRLwgoBOQChHelbZZIuC8LF1sOg5qrjHYaaMMQZkYQADkQSLb5YXoBPJltgyvb
         l1QQ4rDxFoPMf+ae9JZXxCzFPW8bgFzzUQnLrUT253pMVo2w2jeVBBy6YQhwC5V/9v+s
         dxnNia/eMQCxrIbIh2pqU6J/wF6yq+53ffFg0ftKd+9N+JxwkO5u+MDOr+1HesdZLnmz
         Pgkl3BPpAk7pzJrSkZhZts+DjYs7WpP+JRFni+L8PaqfKMgPT8BdXYkegScM0p3RDK1i
         7Czmrmi42fEUrfkyv41Ra7libD/hH43ZKJHkcF7ridbC/vA8Qh+b7M8SB0czg4V7iail
         RUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JnNwmIwtiCiIK6QGhT96KwxMNxVw+pKDg+tKYJ7M/UU=;
        b=d66FI6Eb7Qaunus+/PyvPQL7ov9UOMG+M2qC/DO9ACsb7pR5ovq5/TX576GOMSsMnT
         YlvwG/4DpEt5sbFv6FiKcmRJVy06Wp9s1B01yhSQAqlmLeAqndBGNlUXXRWPfeFIasDJ
         dH3g8RcWhNtBN1RFJpa4bsK4gqntGo2+3mzsfk5a1D4YopGSB2Y50FNC1lTW7L2OERhg
         9lrwPCOGr7YrGA3eA22O1SWe+RDcKrfd2monuyaGUsEzaGZos45yFkk2mUrbPbSqp1VV
         yRtJ0mQ124d6YM14sSRxrjF0/5u8PCowxAekie0Gq4xImOGfevfxOh1oZetlygNjMz8l
         gCNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a186si461113ybb.577.2018.02.09.09.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC6d-0000T1-2Y
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:04:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0E-0003yh-Rb
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0E-0007sL-10
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:22 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0D-0007fy-Mf; Fri, 09 Feb 2018 11:58:21 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC0C-00031o-8l; Fri, 09 Feb 2018 16:58:20 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:09 +0000
Message-Id: <20180209165810.6668-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 10/11] target/arm: Migrate v7m.other_sp
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
X-TUID: VcZsgmSU//yU

In commit abc24d86cc0364f we accidentally broke migration of
the stack pointer value for the mode (process, handler) the CPU
is not currently running as. (The commit correctly removed the
no-longer-used v7m.current_sp flag from the VMState but also
deleted the still very much in use v7m.other_sp SP value field.)

Add a subsection to migrate it again. (We don't need to care
about trying to retain compatibility with pre-abc24d86cc0364f
versions of QEMU, because that commit bumped the version_id
and we've since bumped it again a couple of times.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 25cdf4d581..1a20d6c36c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -236,6 +236,16 @@ static const VMStateDescription vmstate_m_scr = {
     }
 };
 
+static const VMStateDescription vmstate_m_other_sp = {
+    .name = "cpu/m/other-sp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -259,6 +269,7 @@ static const VMStateDescription vmstate_m = {
         &vmstate_m_faultmask_primask,
         &vmstate_m_csselr,
         &vmstate_m_scr,
+        &vmstate_m_other_sp,
         NULL
     }
 };
-- 
2.16.1

