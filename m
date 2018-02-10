Received: by 10.28.71.27 with SMTP id u27csp2742257wma;
        Sat, 10 Feb 2018 15:05:58 -0800 (PST)
X-Google-Smtp-Source: AH8x227IT2/3+43kiug99W3GeZb+WO/oVA0RCMzkc/skNl2XYhEmTcNpvpHrPmfOrwDUgYorYAkG
X-Received: by 10.129.240.16 with SMTP id p16mr4936788ywm.210.1518303958521;
        Sat, 10 Feb 2018 15:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518303958; cv=none;
        d=google.com; s=arc-20160816;
        b=bqLD1PBm//QODNEUghsmsT2Ui6i/NbKWoHiRk2GmmhqnzzJhZkn5y0J1v5EvUn+nTX
         qlbDl19oAEEf3moiqldr4BYeLfhNDctxh5C8TFoWM5RGlpW4MLkbod9bgs1hUP1VjW8o
         qFWUeJEUB/OrVPSxNSogpLvQMhhFzlgg7ls2iUHDX6W0ju2NlAWUB2U3zaO494aLr8b4
         5pJys17hf//I/eyzO4u+nUU/xLj+4LDW4m59ORyTAYJbXoyLGrK0lK+dlW0N+ECO/WD+
         Q6JjoczWBInPc1jx+JJPYaIZG0otRLpZgTasXY326xpEF62WDgyefq4afZ9VNAclAanw
         I8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
        b=v6AnL9pfO5Kw1iVgZFStXJBv7B427sWJ+HK7r8Xi2A92DCurj4l+3jU/UENOpRSwuO
         weOX75nlNaM+IZJyPw2nnrX2cHOvbCvZQM1L6GatOA9imRQE1AmB4dYheFMRLzDba7Tb
         xQDnwbTgifS+wWkwA8n+SwzTaSKPQYCREmEcR61LbRxJfqgqfOT2pcZoiVe4zwK3tp58
         b9LvsEOixt0GuenkGMNm9s7DPsiE6tvHSgctZErnZ/6+ufuKoIzz34BSZOlh9Ly8BXHt
         krXWpFzlBSX5nepefoO4r4FNR/AXMxsdh+55XHatwt/5aAOoh/VcUf0qf2bNDqW4ttQc
         beCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9/SLfeL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d138si976524ywh.403.2018.02.10.15.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9/SLfeL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeDW-0006X8-12
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:05:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDC-0006Tb-EG
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDA-00081U-3J
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:38 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:32945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeD9-00080D-QH
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:35 -0500
Received: by mail-pg0-x243.google.com with SMTP id u1so5488594pgr.0
	for <qemu-arm@nongnu.org>; Sat, 10 Feb 2018 15:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
	b=f9/SLfeLlcQnt6SOD/c5sH6VcE8OeLdHWazaEEKneO1VuE+CBB08f+KW2CTKl8dH9E
	MT/jZuU+5scYueJjHij5l1lcAWp7j3ASl3+0baNdKA410kzaHDMA8wDL72XTZGPLBtY3
	bDET9WIjjAINhqFz/5oE2yVUtCtJN4bnSfBIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g3DEJfoYnA4ZEKPBUJIKJiCt3e/U1XrQnB4yUIPoJVs=;
	b=unCL/4IXh8VJqbtCzwDJ1kEjjVyj1LeXsPCjfwmJ6kpaVWPMeeNPszo88ComnLCx5A
	6nVSWlMsO6saxoE3chvGd28AASo4tif7chTaJqU1JbI1IM9NntxwwkLuyelFRHw5QaaJ
	ivacwq1NWzV5cdX/7acsY0aQeeB4WAit4abNQ28Cg+VZAL1xgRWFpnyq4a2czrSXz/6w
	QI3in37Venp56i4ih3Z5muvOrk4jHZSuOBvKCVl/v2wK1s09ZVs1KrWPgwLQ0E7TzKTD
	1Xt9jNGlxUvwaBb7ccuLwm38Ak3MgJjS5MOtngJ3s68oBi+/GUpdKABx6v72hvkbTqUd
	/QQg==
X-Gm-Message-State: APf1xPBa8YLuX8M/5YZ9QO1yMChvNNSu0RfdtKTMqAyeTVk9HYoIYisV
	4id3iVuIz8ktockWPUxDki9yafHwSuY=
X-Received: by 10.99.186.73 with SMTP id l9mr3060866pgu.83.1518303934793;
	Sat, 10 Feb 2018 15:05:34 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:26 -0800
Message-Id: <20180210230530.8421-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180210230530.8421-1-richard.henderson@linaro.org>
References: <20180210230530.8421-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 1/5] target/arm: Remove ARM_CP_64BIT from ZCR_EL
 registers
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8+eaXHdivLjT

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

