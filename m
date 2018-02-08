Received: by 10.28.71.27 with SMTP id u27csp2306578wma;
        Thu, 8 Feb 2018 09:06:15 -0800 (PST)
X-Google-Smtp-Source: AH8x227UHIOcL24jLud5Nd3i8OSDD/kGri2w9J2OxrTeJlor9NeELoPkAhOH+5VJ2qpAmLbgT8FP
X-Received: by 10.37.129.7 with SMTP id o7mr979424ybk.259.1518109575080;
        Thu, 08 Feb 2018 09:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109575; cv=none;
        d=google.com; s=arc-20160816;
        b=vyGEl+y7+W4lT+64Na6TMsxug170mr8mMWSTL117/DRzyYPjzwq2hOlOTwpKy4RLcM
         /OBvdYF3+hRBpTKkSARUhGyc7/+DBXzgNiBxQJ26rdET+aZ42Qh3p5KPFBRdhmqhCM4M
         yg+3egA10vIEAxC1YL1vmjeCYnemz7b/1StM3qtsOI5/jshZW+/eOr+LrI8VWniNqcjW
         y28fk+TPXg+QbgiFpaGEeH//opt+8R6FZfFzxc7pxRcn8Ejq73QQCGmiucYLLqf6iAPE
         3NylJtPz0bcQa+rCAxA41v6oG1GKsqQqTKoTuJ0DiE+7qgLI88ABrmS7CbSw7gQs33pY
         hRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
        b=BQGHqyhm/Rv5vCtaUi6nkSD14DlsnDA76BzjWaq7QLJcT3Q7pdh4bZflUDonb4omkc
         Fevba3a0bt2HQytECBt0SC9UOmgT3+EqBM49WxLFcEpIUI2Vvv6VbDtNg4e3Ojj04PgW
         1SzqsSsLadykUmXODn0B0jYA6NUYOXJTdUqFK5A/2/0BsYvgmZeuyxuaqeZgI4oonWny
         BpwJDG9xtg11PySs38HLu+/NH5klQAco1LHMOKbyTIQ72xGxwEx8ldHg8tXQeGvz5wcI
         NTZvkN8eWCKozMhJYvQJGMpy4/bP6gouehFV9MimMUlLfVcH6iS/aRDhmCJ5Sib3FX19
         aZiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gd5JYXn0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si69777ywd.56.2018.02.08.09.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:06:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gd5JYXn0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpeI-00052I-Bx
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:06:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOH-0008VJ-4X
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOF-0004Ma-4S
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:41 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:43131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOE-0004MT-Vx; Thu, 08 Feb 2018 11:49:39 -0500
Received: by mail-qk0-x242.google.com with SMTP id d129so3137888qke.10;
	Thu, 08 Feb 2018 08:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=gd5JYXn0CTkAg4SUCrQPF9hUtA6bHuCAc48vgxRjhGCURBXRiyiunFx7QZTpi9pPcP
	9aS8g54qchpHFJ3mPNq18ojIuPqc2dTG18J0eoL4t2p1xkNtNlLualJC5S9sPHZU9kC1
	RTiawk8mKdMHnFNx8CLgV3GCzwQ6yVr8LP7SNIdZ6/eyKkCLPsnzmuAxkmul0nNpHCMH
	VYrbxUNHIyke/HiRs2rAoiSwFoMuSi4/tSEXizjdSRmPPvKHZjoWTFRP/CPMvX9qIuGa
	mpkXnS7b/kPzpmtHcuLcf2Ss7pbm3MLXX/zCuSA1oBMQEFeCjrodo4eqwa3wCqTfTBl0
	4P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=OfLne2EE3RgNBKc9OOrtqxOj93a/FAZT0SptTzF2x/WtPcYmIDLtdwgdfDosL1E4ul
	Ll9neBiVOtXvemMDljrZZOIcrYu19b6KZF2WpFs13d+zt2hCdd/kCslEfFGJ1Imy9KLB
	jp8Ay5e6GXHKVNhveFuuXxR77rMuD8ZdNEbELksmmMsxXYQs3p+b8dfngUPE+QswXRqE
	Ke1IYeGVzq5oCTHNttya1RosDRuItxd/HA6CMdg/SeqKMJcWdYlTmdozu8WowXUr5OX5
	tUCWjREd+Rx54DSN7IzZ5NoGwtAyykkBerYRrpCZK8ECgQ6+Ky1DKWtklT3kGCGakSa2
	fjng==
X-Gm-Message-State: APf1xPD3bkjyyE9MONk+uBigRWe9AsoZTr0h0qmly87b53aBBWnurYTM
	9Cr1bL0XEw12oyBv4/XM9jY=
X-Received: by 10.55.174.197 with SMTP id x188mr1839632qke.129.1518108578475; 
	Thu, 08 Feb 2018 08:49:38 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:11 -0300
Message-Id: <20180208164818.7961-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v11 23/30] hw/arm/bcm2835_peripherals:
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
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zk8FiWLYnO5l

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

