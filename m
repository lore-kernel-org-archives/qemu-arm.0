Received: by 10.223.197.9 with SMTP id q9csp5130540wrf;
        Tue, 17 Oct 2017 17:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RgK+udUODcXiBFrNqXM0vY03vvtbJd5Gk9mqfi2HCk367SswLjbCF/DjL6tRZnQC3UB+pM
X-Received: by 10.55.154.84 with SMTP id c81mr139393qke.43.1508285468043;
        Tue, 17 Oct 2017 17:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508285468; cv=none;
        d=google.com; s=arc-20160816;
        b=wA3owyTXv2cT+qe6hZatIFo7xuZ9K/lyy1SawvEqvku9UNTGxURPm53z4Bb/lWIXt3
         aZKjg9OH6lVx2RMgKMxTtoSZOREAO/kbZXekBx4mmC0UC9GKImUO+TX3dqLKT9lgqZqQ
         qTQMyu2/gUX/rf/0mTGyNUWd1FRDt4syIv4h9hXoISVWWZxEK/rlIIinPyKUrC9ma595
         DbTM2PKGw88Ju/jURa412CxzauJNSeOTHXT8Y3ahV1uZzHKsbaJcM86Qmg+rKHsTHv8I
         y8ZxyN2ViYpY9yiLoJ/RVbDPCDt6B0y5jsaDmSdOj3kjJ3SqlOA7MluGWgBT3sbJclUw
         7Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=QdtUVePvjnUKf7ayaPJEzlFP3poU4VGvehcv5+w+noY=;
        b=TSlD9dZkCfOMnRLr6W+FCUOYSVHsOxvEF4Sn3lgm4mlae3LzDGfrmvaaeBGFP1sqh3
         HhR8ODY65hwDgpCdLmxaRUOGjtFBobgIJ0x6oUDt1Al1rGxFxJYRqQGI5l5ZjbtBagCE
         n/TgjS29R34ljKISZkk67wtqS/1GboYqX2uVWo/YF3c2yipA27791OE9mSjosjdbeFaU
         DfaG0URBbuWN2xBffCOI8Scx2MiSdI1/fuoINCXLruatL9DUPR9supHI3272k0eivzDA
         mXWVmvrQemZquYOXmolBM4jCaaMjJYqAkmVxyWB5JPyWafmj6tesqcdK4tR/A2949oKs
         dTQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16si1406851qkh.107.2017.10.17.17.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 17:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4bwv-0000mU-RG
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 20:11:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4bwo-0000mD-2N
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 20:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4bwk-00042r-2O
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 20:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e4bwj-00041x-Sr; Tue, 17 Oct 2017 20:10:54 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4D47221879;
	Wed, 18 Oct 2017 00:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D47221879
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 17 Oct 2017 17:10:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: qemu-devel@nongnu.org
Message-ID: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
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
Cc: peter.maydell@linaro.org, julien.grall@arm.com, sstabellini@kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xen.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZbc+kGYZ60T

Advertise the presence of the GIC system register interface (1<<24)
according to H9.248 of the ARM ARM.

This patch allows Xen to boot on QEMU aarch64.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07a..a451763 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -136,7 +136,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->id_isar3 = 0x01112131;
     cpu->id_isar4 = 0x00011142;
     cpu->id_isar5 = 0x00011121;
-    cpu->id_aa64pfr0 = 0x00002222;
+    cpu->id_aa64pfr0 = 0x01002222;
     cpu->id_aa64dfr0 = 0x10305106;
     cpu->pmceid0 = 0x00000000;
     cpu->pmceid1 = 0x00000000;
@@ -196,7 +196,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->id_isar3 = 0x01112131;
     cpu->id_isar4 = 0x00011142;
     cpu->id_isar5 = 0x00011121;
-    cpu->id_aa64pfr0 = 0x00002222;
+    cpu->id_aa64pfr0 = 0x01002222;
     cpu->id_aa64dfr0 = 0x10305106;
     cpu->id_aa64isar0 = 0x00011120;
     cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
