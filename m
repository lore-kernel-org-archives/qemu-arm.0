Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5273886wrt;
        Tue, 2 Oct 2018 09:45:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60wbrrKom+dOm8YqyGFoQpipmX77FFyZGdcoltO8NHx3xTOWG2RKKtG30QOIdpmK+QgztBi
X-Received: by 2002:a37:9f85:: with SMTP id i127-v6mr12841140qke.113.1538498753777;
        Tue, 02 Oct 2018 09:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498753; cv=none;
        d=google.com; s=arc-20160816;
        b=G1toeLgi3p1MPsvQ9KuV+R9t0YEQI4J0uGvVX3Q7oCBZy7nKdmwN4n7Oy9ONezi5ww
         NB2BTrIJ6zhoVckoFart5POzAPiWi4iQ1QZKRoR6Ia7Gt+Qka+Dwfsy4G/F1VUXQvqQe
         zi7fe9Zep5kBiKb6mBbNjw/cM7rq0He2LHHizK4jCChW9rp0BEumG1i3e3TpQXvygIBs
         LOHDWGVf2HSffrmLN+ztl9V4LcTHrYWEE3LNGAMfm1hq+l1jfSJTqMVauwtZksl2Rxte
         UIODPfyBRLIrrZXiH6dyRxAJDGLJUBETLB7/of0cEqZ0pKJioLCr0bQtq9nMgJeuOFu/
         hobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4XDAVnbGORLRKu1DnC/E64YHEl3Ij68pMuA+OozA6pg=;
        b=wQyi+BBn5xMGByE23F1Jfqt1XsmbKxphfdFp4KO5vUF04cmHpKIx/f+iVdCgXGKs95
         wwADScHijCtQYvftH6urTp/HEfyJuZsXutKILaY343+OX8ajpX7Ob+uM13VZTjJkoJ8n
         i3h3eRYmOq8ov9VwrgpioZAS3F8xHd9yurmsz/LX7k7HiGeI9ODXVM3wfb/B6Z1xbqj/
         53deT+jos2YPpHSBfA19+ujrDA7zoiz43DfMW7qxhEpiGrF2u6SHmPfQUPgQdr/vP4tD
         PwQaX9Nnxx/6GTY20pEKltAj11RsvvjuOZBF/n0XhJnxWCMZg7/IDNkpR1lU1Czpuz4w
         Yxiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6-v6si1043570qvb.123.2018.10.02.09.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7No1-0007xv-B4
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:45:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nf8-00078L-BL
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nf7-0005JO-IM
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Nf5-000596-Pq; Tue, 02 Oct 2018 12:36:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Nee-0007Jk-Sl; Tue, 02 Oct 2018 17:36:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:56 +0100
Message-Id: <20181002163556.10279-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 13/13] target/arm: Add v8M stack checks for MSR
 to SP_NS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f2UPTVCby23m

Updating the NS stack pointer via MSR to SP_NS should include
a check whether the new SP value is below the stack limit.
No other kinds of update to the various stack pointer and
limit registers via MSR should perform a check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 074f7616272..712828674fa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10963,11 +10963,23 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
              * currently in handler mode or not, using the NS CONTROL.SPSEL.
              */
             bool spsel = env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK;
+            bool is_psp = !arm_v7m_is_handler_mode(env) && spsel;
+            uint32_t limit;
 
             if (!env->v7m.secure) {
                 return;
             }
-            if (!arm_v7m_is_handler_mode(env) && spsel) {
+
+            limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
+
+            if (val < limit) {
+                CPUState *cs = CPU(arm_env_get_cpu(env));
+
+                cpu_restore_state(cs, GETPC(), true);
+                raise_exception(env, EXCP_STKOF, 0, 1);
+            }
+
+            if (is_psp) {
                 env->v7m.other_ss_psp = val;
             } else {
                 env->v7m.other_ss_msp = val;
-- 
2.19.0

