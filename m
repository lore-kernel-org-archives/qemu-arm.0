Received: by 10.25.0.23 with SMTP id 23csp24119lfa;
        Fri, 2 Jun 2017 09:38:55 -0700 (PDT)
X-Received: by 10.237.55.193 with SMTP id j59mr9799300qtb.238.1496421535435;
        Fri, 02 Jun 2017 09:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421535; cv=none;
        d=google.com; s=arc-20160816;
        b=XoHTOfuJuEkqEuWpe9mGBzdezJZ6aT6yKQ9D0yy9ac+L1yDpaezzpJ4egXZ3puexgr
         ReO2X4noCcBRCkkaAR4PRD8t3KzfWgbSjUr/quAcrNMKzobJWe/W0jJrvOdXlNo0ALVO
         7LnBHOzqVLKsi7Io9pNFU3QW9rtoGLz4+64/uirb9k0SqdzykCoaK+sGblTrsdbsZVfn
         ctJUtDFtzjjz301+bdmlrFzXxAT51E9HYvf61LqzH4rh3EyoECGktArlBCpSj9WJWJEO
         vEr5f7ZcEn7jamQboqe7dFETjfKtYLUQRvNgXaryY8Q+KmhECWtmKquDEp2QhI+R+3Fq
         5vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=iLesbFH3RQ6SbSHRVNW1bPk0u1VVh/aHDHPzTIhQm9c=;
        b=UdLixL9yQbrrRnttwSKFzicPDcNrYOMMqwV/crs3jdJ3Eg0CfUNhyCyXcyXbGesVco
         NS4kP/jLQ1PPILYd6H0+zjhgrMD6D5gnQhOK84LI0amFbwD2lLK8j2bo14uFV6WUoNOT
         JfkrRNkzcILZ6AbemLwSSUSSZGRZpczEC9cqcsktLzeavNfyBocP2TwETn/rNtu9kCMo
         93oWoMsZSEf3FoEGFLS6vNmrJdHvKInOq8+pHIZ+m8LYVrQgnIRW/qRRB3Q9Gyuh3NGb
         xXM9vCb8SmQUgCCOC6BQEXfbZBVkDcc6yTapIhehguRvP0flBsYNTNdmo3Ot2Q0W3y4C
         vZuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r94si1501627qtd.89.2017.06.02.09.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpbA-0003Ci-Oq
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ0-00013r-N2
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpYz-0007Ym-BM
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpYz-0007Xw-4h; Fri, 02 Jun 2017 12:36:37 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A4E0B22CC1;
	Fri,  2 Jun 2017 16:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E0B22CC1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:11 +0200
Message-Id: <20170602163618.6369-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 2/9] hw/timer/exynos4210_mct: Fix checkpatch
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qyV3cZLa7Fls

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

