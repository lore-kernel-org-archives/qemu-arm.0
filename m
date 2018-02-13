Received: by 10.28.71.27 with SMTP id u27csp679849wma;
        Mon, 12 Feb 2018 20:22:05 -0800 (PST)
X-Google-Smtp-Source: AH8x225T5PRjwxIPdSFnQHhMWwJPSW1hg3HPlDanibI0RQel2OZ+EWFsk+34cr++1Df/gues4Ojs
X-Received: by 10.37.189.84 with SMTP id p20mr9046346ybm.260.1518495725449;
        Mon, 12 Feb 2018 20:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495725; cv=none;
        d=google.com; s=arc-20160816;
        b=FMgJR2Y7pqJDLvaHpq4OpUxjfxkqhx/5A5O2Y0nS/5m3DVnPi/7/CjaBRdprxjUK3h
         q38M89p+PwYWE5PA/gkHiSz8UbOEiQbnGiZ36aYyjvI+idMzTkjmxtwY4zNPsw9+r/sw
         R5+/l3PyeZhTX65ItsNnUTWsam0Vptl2vKLPLc4MR3EdJuBnAdKkm6MoMfJxVo0xsbMF
         UooBWyxFtxS0VooWAeFj6tVo0rhf6Gw98FMckFaz3Tir8r2Oj0GP09VwrZZqtTa467lG
         MCRr/in8eNJOY+a3DoCt3wHir3eutPaQ1AOyvd9x3nnlvpqAr/4bYkCJHWeFkHzqB4B6
         iFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
        b=FuXg1RZAX0EW34lspJaOu7DKU7lJlS09eF6YD9xh1JlD4UXHG3PbXSF4LJ88IY23CZ
         4tn3Hyhw5FVzOuZ3MAja2yYrRBAprJf6MhK/jaE/n+/ll3EwknS2ePKeTYiLABVeP7j9
         1TD0fAVKA2Br8w763Fz8BV6xQjoTHUTm98DSRS1HTSXQRUihvkcbS/i4kaDlcscjMIQF
         rkHt339XzR0/ZO8QieUBVswazOx8V3zi+SfQ2uMQwUl4LldqqfFpLi6ctuZsBmXeeFL4
         vT1GSH+ecBlv2a/Imw+MMiljVWsawMwsszhvjvoas4mSw6/zPSej9L7H+wLVPbpMNscw
         sGXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q2IgqJdg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si75759yba.179.2018.02.12.20.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:22:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q2IgqJdg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS6W-0003dU-Pt
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:22:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuP-0001Zf-EX
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuO-0008Rm-IA
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:33 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuO-0008Re-Cn; Mon, 12 Feb 2018 23:09:32 -0500
Received: by mail-qk0-x241.google.com with SMTP id s198so4951197qke.5;
	Mon, 12 Feb 2018 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=q2IgqJdgK7ZluQp/Ab9XSJ32J3TTHTj/K3oWvVeZtFMgkY2bvLwfdVS0+VbwI9yVDd
	R9b36hCQaghjjd5Ny1cUIRCG8ivnqqYDZDbCl8Ao65lTApZxTKB1sp2WcGR0/cNM0uQ1
	GXamXMmIp8T31GfuiAuQzD6Oq5tbidKuCorD/NVmUZ6p90N8AAXP0bdsCaeuQLMNAI2C
	jVbadu2aJ9/QgY9eYb2oYRc4ACuv3q4lCYm0zY4W0dYrx4j65RXZjdQsn1MdAfrbHhZP
	XCzFcH1RCodPAwXCkDNZyeefTtkny7F9Fk5So1jlbK83ux9aa7uSRh3HvoXeHjs+4JdN
	flWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=CkV+EqxRet+1hQjEDa2Vcol6mTQdGUwYeKVGEDI7iUojgMhondYjUEQcfezWMEjA+M
	nsz5wsusma4hdGWWK8rWSfMm/U1HyyCuanHvlPbUK8sVSbhp4s7wsIWmsNd3NuDKuOgW
	RdihFqJA4b9DXQCvMkK50OaROLBCF/+EtCFfsWTCi+0gilFxVW2BWvSZJrJjdA0WV/iO
	MgF9p4dyv3OYz37Zq9lOQbQTB5PMvVxRyM1/HIvx3W9B3xjetH7cLORAKGmQAJvmRZUE
	5vpNF5Vm/Jsj2klJ2WWSjvqFDbq8xFUCU93q21R2t4TwXyiGB6G9Yg9wBGai5vHcwuDK
	d4qQ==
X-Gm-Message-State: APf1xPCM5lR30eEqofifVBV9mrGQyVkE5ymqCmb01gFut/I8OpyPziN1
	BMDIubKOBuN1/+aTUJXW5h0=
X-Received: by 10.55.112.132 with SMTP id l126mr20889336qkc.296.1518494972006; 
	Mon, 12 Feb 2018 20:09:32 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:08:02 -0300
Message-Id: <20180213040809.26021-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v13 23/30] hw/arm/bcm2835_peripherals:
 implement SDHCI Spec v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: unXF6tdlqRAA

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/bcm2835_peripherals.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..ca971e83e0 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -254,14 +254,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
-    /* Extended Mass Media Controller */
-    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+    /* Extended Mass Media Controller
+     *
+     * Compatible with:
+     * - SD Host Controller Specification Version 3.0 Draft 1.0
+     * - SDIO Specification Version 3.0
+     * - MMC Specification Version 4.4
+     *
+     * For the exact details please refer to the Arasan documentation:
+     *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
+     */
+    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
+                             &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.16.1

