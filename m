Received: by 10.223.188.70 with SMTP id a6csp1499639wrh;
        Wed, 30 Aug 2017 14:56:02 -0700 (PDT)
X-Received: by 10.200.24.29 with SMTP id q29mr4450586qtj.53.1504130162770;
        Wed, 30 Aug 2017 14:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504130162; cv=none;
        d=google.com; s=arc-20160816;
        b=J5wEUTXHb3dv1Wkn6LzDs7Nsfm25wrp2ZAQ7C6rZibQ3z+/E6MX0duYSBa2ZN8TP7U
         CDMcYZarDxZjiUOdKbnNGajTfggLhFfg5BkrVBMowaSyOJcFOf1qJ3yGfqbV+dAghz30
         UHR0ZktDIexJ2sWh9UFaYvzFvQmF5X8Q1wyGfC4E/RbdZCoewk8CagSWB5Ft3r5u0bE9
         HGuodym4xjYj6E5vNuiVxj+YUPn0J0ilgq348WCVmmVsLl+TmOILhd1zhU6ed2HeX2h+
         +9XLaYQPYioaVfjFFvJy+idKx9XL/Td1zd5FOXTUwW7PObYG+uKOM70p9ydr+mOejYgZ
         Gxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=i7DICPMjD1LkEeBKl04nBKD47wy864nsi72KEboM26o=;
        b=rXJTXjyuvpmfLoy3ZoTaCWzhRva5bFe2sp+P75QQILBS/Nsvc+xtOMxsnE+8lfHJuu
         jXLJAw3SwehQH5BDydUpon9Er7i40AXQNcAX2zzfKWQa37RhkaCXimHYPkLAKQGPEkLE
         H9Ahg2csVSxsYDRU/eFeeeaR9fRLlzYg3aJmjqtont10jNra1h7jhVP3Af63RkeAksKs
         uMfSTB4wQX2H3GZ6KrmhD2V9p1awLdxADuZDVU474lSuILVIQEBvUiH+xSyGp/wgWDL/
         i7VYQh8GWfofWDtXzIiE4a6Q+ebNgBVgILMcKNYFoNA0m2TfWsAZVbIxmYBSMsbkf+Rf
         2ZWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jeh3tYU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si2333219qkl.197.2017.08.30.14.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 14:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jeh3tYU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnAxs-0005EW-DB
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 17:56:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxf-0005CV-ND
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 17:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxe-0007Ys-Qi
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 17:55:47 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxa-0007RW-3e; Wed, 30 Aug 2017 17:55:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id u11so6269513qtu.2;
	Wed, 30 Aug 2017 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i7DICPMjD1LkEeBKl04nBKD47wy864nsi72KEboM26o=;
	b=jeh3tYU5epWh1U64H/vTahGgKgs+DJG6mmQxFBOr210l6E6NQlu7L2IyenFwj8Ye9F
	7yTXuKiS2gAEu4Rawupf5u0Gl/ktL7Z7GalfrjqMKCbf1Q2oR+rrVR9xmZ/Fg+YFoJ3v
	aYteg3ZsGNNQ1LSt9CDP+OLce43FvgWMYN4MG23RjFvZ8vv/sxji1ZaTERZ4PnOUpWdS
	yQFmT1nKuzAGY7vnBDw2PnI1H05+DfssdUdTeaN7BkyIVa74+YdbXrWECw2bkWw7Mq7N
	qg2k3k28bK9D1fKqtOS+82aRwqOdEZI8gYRgYArcD+KeyuRK173jU07mdWpdZwbvbNHT
	Rjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=i7DICPMjD1LkEeBKl04nBKD47wy864nsi72KEboM26o=;
	b=uEN0e1oLYJ2DHWr359ybdA1cxEceBZCFeR1X7hih8X6w6ZvEOSPoNbwoMewkDVFClX
	HUDKPnGMYCtvbGaHFb3/6yH4+w2tigX7a6Ie/AcmaA14YpIMFV6Bu2AVz/b8dzGIeQ5x
	KEoiRviRjuSQOyw6w/1FNrP99PY1i3LYeOr+19rX2GBk2VykKMiZh2wlFodpsvumrc/+
	oygYzA7MJSv1Uix+A6IuucfvaLx5PQGwv3wNCXSr/p6Nr07PhZQoRVm8UZOP8FvrkisD
	ZNqBu6aQ3VZMUfjvlC0iaZoAaOXBqlw5C5OZG8Lb0u/zQqNgqr96DCRjOg7Z02YG6VEp
	0TuQ==
X-Gm-Message-State: AHYfb5hIsyZZ9I0uvoCLBuiZ2ItN8ztjn9Fym/jHupIDI01qul/rmjmT
	tWrfb1bYVKv0zA==
X-Received: by 10.200.22.34 with SMTP id p31mr4388556qtj.310.1504130141468;
	Wed, 30 Aug 2017 14:55:41 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Wed, 30 Aug 2017 18:55:07 -0300
Message-Id: <20170830215523.25278-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 01/17] MAINTAINERS: add missing ARM entries
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XUBkIJT+mJLu

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccee28b12d..b363e1b9c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -380,6 +380,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/char/pl011.c
+F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: hw/dma/pl330.c
@@ -403,13 +404,15 @@ F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
 F: hw/timer/a9gtimer*
-F: hw/timer/arm_*
-F: include/hw/arm/arm.h
+F: hw/timer/arm*
+F: include/hw/arm/arm*.h
 F: include/hw/intc/arm*
 F: include/hw/misc/a9scu.h
 F: include/hw/misc/arm11scu.h
 F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
+F: include/hw/timer/armv7m_systick.h
+F: tests/test-arm-mptimer.c
 
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
-- 
2.14.1

