Received: by 10.103.124.15 with SMTP id x15csp1047569vsc;
        Sun, 21 May 2017 08:30:33 -0700 (PDT)
X-Received: by 10.55.77.215 with SMTP id a206mr11975820qkb.11.1495380633886;
        Sun, 21 May 2017 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380633; cv=none;
        d=google.com; s=arc-20160816;
        b=BSsgP9W7D3oucZgoGSkrUD6TifxuxWbopHSNGYtDlaXo6dEG3NY39eWBUny1Gbs8JA
         BWDkKGvM4byb+TeqhO9ZwZwVSBGY0BkUbYv6PJsdiTV+Untl7XDHLylcdz7FK9V779Su
         +xg61nLlSrwfC4MgdB0Lj3Q5HkeQClKcTaI5qAfU68UrD27YYRNVaFe0GtppIgAgtdv2
         Ez6FrIRJp873IJzUDbEBdf+bbrsyCeyzTkiyRH4K2jxwMaqHNdTaHQgHnSdjZeN98F5g
         OQXt1miOTXIEJLRhLgVmrViBMm08GwKP58JT0K7xqJ+2cCKOvbZCfCV/RSQfEArKK1ab
         /23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Foupl2r4M2j/aunGPbqTN9g5JVXYUScX/fqtP0sj8KQ=;
        b=qC9jj8+e29J7KDF/spEPR0Kaixl1/dSzQtlw1kZSazQutDt42EO0mn7O6sAYedltHI
         b6Bw/MD5L1B/QRBuIClbxfIWwYjJbZeRcv1hvYk7QA5BvO95coRkTrWzmOGZ6nh7Ljtb
         7Y2GGmLZYY3OWJijnrmcLztJ1WKN3aassHS4YLr8uIZnFSFqtL9fZPeGJlTzRM7TcloE
         aC/4wmSx+9EOwElcw0OFg30+6TmyZrcQsN8UouwFKntgxVPlAfDt7Xr2otS/PNq1z6SM
         WyXusRmzcfsXW8gpofqohZd/9laFP2O4bFPykBfsdtNqyu8ccEBrAIfH+biN5DmN8EOe
         TNDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si13055992qkd.212.2017.05.21.08.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSoT-0002bo-EA
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSoA-0002R0-N9
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo9-0007Hj-S8
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSo9-0007H8-Lw; Sun, 21 May 2017 11:30:13 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7517C239A1;
	Sun, 21 May 2017 15:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7517C239A1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:45 +0200
Message-Id: <20170521152949.15338-8-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 07/11] hw/arm/exynos: Declare local variables
 in some order
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
X-TUID: XBSwJW/jdhnE

Bring some more readability by declaring local function variables: first
initialized ones and then the rest (with reversed-christmas-tree order).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0da877f8db0a..27a7bf28a5a9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -162,12 +162,12 @@ static uint64_t exynos4210_calc_affinity(int cpu)
=20
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
-    int i, n;
     Exynos4210State *s =3D g_new(Exynos4210State, 1);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
-    DeviceState *dev;
     SysBusDevice *busdev;
     ObjectClass *cpu_oc;
+    DeviceState *dev;
+    int i, n;
=20
     cpu_oc =3D cpu_class_by_name(TYPE_ARM_CPU, "cortex-a9");
     assert(cpu_oc);
--=20
2.9.3

