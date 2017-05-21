Received: by 10.103.124.15 with SMTP id x15csp1047488vsc;
        Sun, 21 May 2017 08:30:20 -0700 (PDT)
X-Received: by 10.55.188.135 with SMTP id m129mr16891124qkf.226.1495380620439;
        Sun, 21 May 2017 08:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380620; cv=none;
        d=google.com; s=arc-20160816;
        b=q5GiEWJGbxWbtVhnAYJO7rwr6XPpClKCnwxqWpIYQp55Hot4gWnJFHY6xVlsp0QMse
         rNEZz1SVzhooFB5pZ5wBCyNnmlMpL+1zvh0I/FSRHKd1gDGsaylwIu1DshKiZ66Mt2L1
         ffeqOt4nEhzRhTAX6LvkwkdTMoki+nBQ8tHER/akjXdp6xDty8gxKuVfhf755FY/EPn+
         qiDlJc7+CcYDWVelP8/RWdkNR/CWNOEIU2oWO4vFV4ZYxN8I1QmwApqyd0PQk+ABj322
         Mfdsrmw7RU56CYLxRQ2ddTbpoDaf8NRA29F20HvWUYZD/BtnLzFSUZXsGJGTy/r6zkKV
         Ok4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=iLesbFH3RQ6SbSHRVNW1bPk0u1VVh/aHDHPzTIhQm9c=;
        b=l50JMakCf41vOmsd2u/mSVvj8dTF28IPT36ke0LXVp8MMyW1bAMa0SgipyAIpsPTDS
         TlfnsIGNmS9KhWQ2QsPCmAuTgeamzZMzWvEV2KDnODr7conXt0DMNPbVwx/V3k1CQlGA
         oOmjk7OaED/L17i/MwVdiglGx189izgw3FyOiMe5vh+LacBI29Y3twQ6IWBeD8lzxSHi
         8Fa/9R1e5SGh2knD7PFYI9i8wx78i+u3oRAvftQ3M5DLWfcDeBztIEeMTdbiIPzPFmpb
         wrTbJnRd+PQY0lSHkTX8r4iwyrsQR/x+vkndbcC5PfGCcTE2NnlnSBl8a1HG8uuZ00/G
         WABQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p65si14903682qkd.290.2017.05.21.08.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSoF-0002Hl-V5
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo2-0002FW-As
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo1-00079U-3x
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSo0-00078z-VW; Sun, 21 May 2017 11:30:05 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D03D9239A1;
	Sun, 21 May 2017 15:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03D9239A1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:41 +0200
Message-Id: <20170521152949.15338-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 03/11] hw/timer/exynos4210_mct: Fix checkpatch
 style errors
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCMDhbRNHkeu

Fix checkpatch errors:
1. ERROR: spaces required around that '+' (ctx:VxV)
2. ERROR: spaces required around that '&' (ctx:VxV)

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index a2ec3920f82e..2404fb737ac4 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -937,7 +937,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
 {
     uint32_t freq = s->freq;
     s->freq = 24000000 /
-            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg)+1) *
+            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg) + 1) *
                     MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
 
     if (freq != s->freq) {
@@ -1162,7 +1162,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
 
-    if (offset&0x4) {
+    if (offset & 0x4) {
         s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
     } else {
         s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
-- 
2.9.3

