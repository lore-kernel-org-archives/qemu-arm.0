Received: by 10.182.158.201 with SMTP id ww9csp3416038obb;
        Wed, 2 Dec 2015 16:29:16 -0800 (PST)
X-Received: by 10.55.77.17 with SMTP id a17mr7518182qkb.40.1449102556335;
        Wed, 02 Dec 2015 16:29:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j64si6164878qgj.115.2015.12.02.16.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hlr-0006EO-Uv
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:29:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004RG-8Q
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc7-00022R-M4
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:34979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc7-00022L-IV; Wed, 02 Dec 2015 19:19:11 -0500
Received: by qgec40 with SMTP id c40so48209295qge.2;
	Wed, 02 Dec 2015 16:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hwfwaDXdv3gy6nFKbBv3dO3t/bzAIfAg8SWAma3Lu9g=;
	b=JAYCljYEV7qLqKBmuPN0SPDf2RqnD6NhdtjUKzcEeBVCHS2UxrE2wpD6VJ3BDTH0PB
	OzAL4qWCe/ajcZBJHjKw2rx9x1XsV8mSerMC6c/5httoNycGbtGroBFa40S9tmSQK3pK
	U+pFRLicfEIOyc2WyQSJ3xY5KRd0FF7MtCb2+WzMLWvLGD66/8ndYSWLX5WeMUXmWdZQ
	MikalsuwxoOXr83nQm2UtQfNyJ1RPh66I1G9I6hlOJTYRdUVSDKeJONbBXEtbutBx1om
	GVPJ0ZAVEEkiVbRR61IBaPbZUYWgX2T1qQRNolq/8kaaK9UtaMBNrJaIzWuF4waClBHf
	IdgQ==
X-Received: by 10.140.32.162 with SMTP id h31mr7478766qgh.93.1449101951251;
	Wed, 02 Dec 2015 16:19:11 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:44 -0500
Message-Id: <1449101933-24928-18-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 17/26] armv7m: mpu background miss is perm
	fault
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DzaSrwmAAGpW

Set an appropriate FSR code when an access does
not match any MPU region, including the background/default.
---
 target-arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index da99825..e73f7a6 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7163,7 +7163,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
             if (cpu->pmsav7_dregion &&
                 (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR))) {
                 /* background fault */
-                *fsr = 0;
+                *fsr = 0x00d; /* Permission fault */
 
                 qemu_log_mask(CPU_LOG_MMU, "Miss MPU\n");
                 return true;
-- 
2.1.4

