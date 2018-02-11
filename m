Received: by 10.28.71.27 with SMTP id u27csp3693889wma;
        Sun, 11 Feb 2018 13:01:34 -0800 (PST)
X-Google-Smtp-Source: AH8x225oGyb3qbGM+nctaFnYvz9Yc7Jqcj4eVNHHxks7tVuU+SQhRXSbZDlt62tMlinqw3zmrSDU
X-Received: by 10.37.185.74 with SMTP id s10mr6595387ybm.207.1518382894559;
        Sun, 11 Feb 2018 13:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518382894; cv=none;
        d=google.com; s=arc-20160816;
        b=bpdIjN9tYdTnNaMt4SVUdZWvcGFL4FEvmklFaZOLXZhLBUoBWVnwSQtz+TMg8hCjUx
         JW8x4PqO2VTEeKeL+FyKGbxkVbyy64iLkv6DfNqhuybhtd9Rrf/824uPAIPB3mt32MkA
         nVUvtgjdbmVmUpBgjH+DbX+wM4KBIvG1nWeyL+uj2IyFPC9PUcj1i2vJw+5NuoF9ofNc
         7aLBq2J8mLHg1kIqeSXONDRJdE9P12r4qX05NobW93sFe29qdvAJrjNkWSBEBsH3D/w7
         DUWt2wCLVVmc2Lkf39C5WYcGdHAPYLdum0HWKbHPf2WzYKdgn7NerfGHR26DCm4kel13
         dykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
        b=HO/bV0+g3mZPlbqZfsnYklqjXFBH3Ami/r3s2TBrxeN5UOYk4tSkcTCcWG1Pz8lP31
         yJCy9s1A2EdWL5NHGNt3i8ZxS2zCt1fNex/24mZ16HaqZEe4ftX76obOOLdvObZgaqr+
         IW92S59swm2AI/YHtouHyM3luB2xFsQ2gczadDwtHXt00pmV0pA0WFvY6ETUBcCgGaqW
         p7P4PAdfGHSer04i33UFUfZ14GZvvex3wctKnm02fOB2RLdBZU9Ki7Vu2Zw89u+YDLdS
         kPOxqsIXau7jLXhBKR27hDe2NLnO0gfGlJqRSAFP9rEE3Vkr//kkJhFrM9DmhsXGKxzi
         QIrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLAqDxE2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z11si1273410ywb.158.2018.02.11.13.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 13:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLAqDxE2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekykf-0008IF-Uh
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 16:01:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi6-0006ic-WF
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi5-000459-Mo
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:55 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyi5-00043k-Hg
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:53 -0500
Received: by mail-pg0-x242.google.com with SMTP id j9so5072905pgv.3
	for <qemu-devel@nongnu.org>; Sun, 11 Feb 2018 12:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
	b=jLAqDxE2ff3dH6ZuBdQ6Sph+7R8LcQwWVfXVOeWLu5ant2OC1gokCFwe9IRf7DitCB
	sb522el61ktNwKm6BWjUAy8tGaJk0RlY8DUaiUk+Djh7l+ArKTjQgmDr9wzY2n+ylm2T
	HakyPLzOw3sNEGkqOUEaXkrTDl91ZjHmzdRxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
	b=iUtglDmwnESCVW+wV5I1uGNFve0bfMqMbTVAMDY8FU5yK+eHROpyqadzgQHxzcTVK7
	ivyY1B/4n57l5OJVV2Dzot3bPXuOjjdvDdzprgdi13alCSQl3eqoOnCuQiCnRFGhVDoB
	oXV/CCBck/b+6Ersc2ZmfEhELjC565xo7dAfIdZuww037qafGk0xYvs8JmDXAo82w7lt
	r26DCcube8Jux7A61OPn8Cl+WKYKi4j92Msq6EFQHTqARTEQue8grn9dHFB7Zegj0dHq
	cqFRril+jz0TeM3Ci87zmUABbsqfDiH8PsbePyU6+NT7gC0ngCzRrYeodziFz8rqL1m7
	p9Tg==
X-Gm-Message-State: APf1xPDHmkSd4wji2HPdO6o3++SXm4hrWP2yZ9ky2Wmc0MaYYPPkyqv2
	YfJgkfao0TU/8dlTFr+tI3BvxuHKTWg=
X-Received: by 10.101.91.3 with SMTP id y3mr7764158pgq.260.1518382732211;
	Sun, 11 Feb 2018 12:58:52 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:58:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:42 -0800
Message-Id: <20180211205848.4568-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v2 1/7] target/arm: Remove ARM_CP_64BIT from
 ZCR_EL registers
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aG32zyyZGyXE

Because they are ARM_CP_STATE_AA64, ARM_CP_64BIT is implied.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 180ab75458..4b102ec356 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4357,7 +4357,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo zcr_el1_reginfo = {
     .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .accessfn = zcr_access, .type = ARM_CP_64BIT,
+    .access = PL1_RW, .accessfn = zcr_access,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4365,7 +4365,7 @@ static const ARMCPRegInfo zcr_el1_reginfo = {
 static const ARMCPRegInfo zcr_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .accessfn = zcr_access, .type = ARM_CP_64BIT,
+    .access = PL2_RW, .accessfn = zcr_access,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4373,14 +4373,14 @@ static const ARMCPRegInfo zcr_el2_reginfo = {
 static const ARMCPRegInfo zcr_no_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_64BIT,
+    .access = PL2_RW,
     .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
 };
 
 static const ARMCPRegInfo zcr_el3_reginfo = {
     .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .accessfn = zcr_access, .type = ARM_CP_64BIT,
+    .access = PL3_RW, .accessfn = zcr_access,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
-- 
2.14.3

