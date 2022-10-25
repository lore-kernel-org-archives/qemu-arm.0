Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3703482ejn;
        Mon, 24 Oct 2022 17:50:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5mC3XR2HmtpGmQN9s7SzTYsCwjEzEJplb9oLBAbd0GuFIGNUx2cOB3n+4PhVxzDELfPPOA
X-Received: by 2002:a05:622a:10f:b0:39c:cd6a:ee2f with SMTP id u15-20020a05622a010f00b0039ccd6aee2fmr30297807qtw.388.1666659043874;
        Mon, 24 Oct 2022 17:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666659043; cv=none;
        d=google.com; s=arc-20160816;
        b=sR5iLUzSLBo5qtt3Oc+dBx59SnG7ROMqxiXyg/lhcdQ9hIp5nGrE51EH2brt1Wi8sF
         GVL0bTVAhomNPtMtL0pSOuJ+srTrJ0PlPkh7WnaQaiBJunUHcldYN+XUYqqL4jguEsBJ
         pHzpunMj7Q5ROhj6V5DLrdcBZy2HgS1MwTTuqVl04KXbpdqFCqJtkHG29hjGO0exF1GS
         DeqH+YueSv7mQChEN3AUee5QcvbandmAUS2cPvVXQGrnchGrhNd/gHDmC5asUx5ooil2
         fwdJ6YlhdjMyEQo86Q2xMGqG1MRcfXQzBtcI/Vzh5B13yRWSb1hF21zPeX90iepsrz11
         IiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RanAds+xBge68b64kZDRt7NuRJe5o63knTfwLsKT7L4=;
        b=A6m9h6rVf8TxjghR53nk1O/N0jwIYkAOdskkiZpy9Dv1Q997du+dQRYJLfa14/ogVM
         RIB9v0ZIhvR5T2qu66cN370DlV9NuKfF2WmwCPQjs95fjXglf9Cx3mN3bEIItGKNsVwC
         nicGr9iXw7WDbhsRwmYfYzPn3XFx56kU0+n1TIk5k4CwCERs4eWqbltjyYKUp62+K1hz
         BZb5WtDx2eYUDlKSq2PF9kbLxG1rK0OOT4nQqYIF6puogbRb73SoXxgq8Ay3KKEtj+7x
         AK5F3QbXwwVTgjZbkTwq3Zs6VHtRXJwNe7S5Tfekr0hLIjUr9VdjJ6PlWgsb17MqCPWY
         YOwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NWa7MnIy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85742000000b0039d01d9f63dsi999842qtx.527.2022.10.24.17.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 17:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NWa7MnIy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on82t-0002v4-Fj; Mon, 24 Oct 2022 20:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82r-0002Sw-B2; Mon, 24 Oct 2022 20:43:53 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82p-0005DN-Pf; Mon, 24 Oct 2022 20:43:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B166D616D3;
 Tue, 25 Oct 2022 00:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76187C433D6;
 Tue, 25 Oct 2022 00:43:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NWa7MnIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RanAds+xBge68b64kZDRt7NuRJe5o63knTfwLsKT7L4=;
 b=NWa7MnIyGEd3vccWSpj5Gc7PwWbnO8Bjp8gT5cchwNJECLjvXZgU4XtgPlv7RpLQ1PB2Rs
 bASTF1zO0e3IwQ9pFWRtK77oWxpcP4zVA9y78hf5CKtH/ka2u6urJH2kftyZVvuIX/63Im
 0UKN9mrSkQSuLiFXBz0YDx+OiKQwpx0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a79714c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:48 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 04/11] arm: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 02:43:20 +0200
Message-Id: <20221025004327.568476-5-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dO/3erkuTbdW

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0b92af188..b106f31468 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -683,6 +683,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                       rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
-- 
2.38.1

