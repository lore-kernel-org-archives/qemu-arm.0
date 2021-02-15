Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5560468lfc;
        Mon, 15 Feb 2021 04:04:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcVqb4tno/MJQWrA/+jK+v1i3qLL6dZiW0cD0Ka0WLqYJsWDw8anayeveM31l3/SLLyENN
X-Received: by 2002:a25:5051:: with SMTP id e78mr760160ybb.386.1613390697763;
        Mon, 15 Feb 2021 04:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390697; cv=none;
        d=google.com; s=arc-20160816;
        b=WtlKjsdEbuvtKafuBLDhWChEUbpuS2K7tWaMyYp/pAnfCrCmaYilxLiGUDc/CuUGT6
         tZfzuuTuwW0jfbixZBml3GEYAXG/s2UTwYR6oAO4MrJIw6dMH2udy2l45aS7LN2i7RwN
         Zts2qurgpFKuiDeoJhAhrLtCvcsAglGAZgYoGUP/MnUc+Os+i8TWf6P9p+e6gstl1rRo
         EpToNbYBLD5yZeveWSKV/EKPN9uuNOlPGsHBrtLJaMjo1MdnblioOKP1R2KXbyDBc+bx
         PlPyqXmIAInuBzRqttrGGz+SIrwScQ32U08pL9ZmZ12RKVmr6WMHRoxlkAhLgoLG+gUq
         twvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mn7Me6K3TMP27APgbQca833jRzvfQ06ASXws5mXDtM8=;
        b=YCJiyHv8X3mpFTlE5DtUdEaBNVY+6IDC1uOkEqkSE8guszAldzalpJWybwBDQRQsGb
         hx0ZEtGr0xHtNrWqoYDyMuxyiDNGH6DZZzfQ/2U8+4Qu/BbOHZC0OCkXsB5z3JdRGL35
         NZC13FkYq2wIy+BTukxmBnS5AGxmXcjmgEM0rQAlH5u5UM2/086xqNeOrqu2OKl+kaGQ
         9J8KpDrvK9uaoiGQ0IRVUGq0SwJs9Jvyz85WAq+XTReB0kGYAHb5c/feQ+AM07hx1d5x
         jPzFl/KHceEeppNICk+OoNQ/nmg8ny0J5a0Ja2rTFuCkl12NNZmuDl10Bbb1fx09YD0I
         3ItA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyVCAR8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f141si8344839yba.286.2021.02.15.04.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:04:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyVCAR8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcca-000704-Qn
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQm-0008HK-DR
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQk-00047u-RZ
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m1so9062174wml.2
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mn7Me6K3TMP27APgbQca833jRzvfQ06ASXws5mXDtM8=;
 b=WyVCAR8ecScqsmMGiwfNYiOumxkC4CgzOB8y+dwap4B/2EYXyvkO2Q0crANWuMuWHl
 S7AyxohBdLMq6uKROhWeFqRSjn0+U2nR5jLNfLEW8PFdDgQQksdUWQj428TZixroiThM
 jFZRQYMtn0IYVLFw99pVLB+TJnupkWk1tdeSlbwc9zLEMlRfTb3T7F2hjB9PT7syBSbE
 0s25InGYqyXSVVftaIa27P53HcZ9w49hb0tnVigazAwpjPdUT4nv9QCz1W4IYDgWyLWf
 kOK2RqkncMf/ccMS7Jv84HZP2Pc8A0y8y4Z8bmGp9aanNdcpyPkH3f+Bc0tIbeURu6Hb
 rdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mn7Me6K3TMP27APgbQca833jRzvfQ06ASXws5mXDtM8=;
 b=dAZQns5sQf/xmJ5sKk3vHvlJcGemgooqOLBrduj7PmDHga6NGASIZThVhurGiKGvoc
 UewiDiOmviHF67WAfTB4LMSH4W5staCIn/WBDzx1X0G37pyzRdlsi6JhFSQYqt2xn6lx
 9nwAOH4PnbIgX6q6mmonljDA8FytDqnGXSgVVPKg/a+QI9wvudCxukVYqylW5+NnFnfZ
 rPccV1Lp2PM8aCy/y9BwW2kp0jngNUJ9HrIR94CqXQHLW4vk82YdQzyQrmqJCkGZIgZN
 v6a4ZV3c8kUZmhytrRe4LyFKOQAS09I0VTEz8uNRIhc0EtMNrD/TA9aUAJYxTApIRz35
 qRDg==
X-Gm-Message-State: AOAM5307HPOOvKDrNEwcCEYHoJ80aobxGpP+WLtWgaoIhOVQ2kEZe2Q/
 xqKspXpKyp9Q66HJMnuZlEOahABIa6VSiw==
X-Received: by 2002:a1c:107:: with SMTP id 7mr13885028wmb.28.1613389961694;
 Mon, 15 Feb 2021 03:52:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] hw/arm/mps2-tz: Allow boards to have different
 PPCInfo data
Date: Mon, 15 Feb 2021 11:51:29 +0000
Message-Id: <20210215115138.20465-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6Xl0Pp14H+4

The AN505 and AN521 have the same device layout, but the AN524 is
somewhat different.  Allow for more than one PPCInfo array, which can
be selected based on the board type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We can't just put the arrays at file-scope and set up pointers
to them in the MPS2TZMachineClass struct, because the array
members include entries like "&mms->uart[0]" which is only valid
inside the mps2tz_common_init() function.
---
 hw/arm/mps2-tz.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f1a9c5f65a5..a79966a7187 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -423,6 +423,8 @@ static void mps2tz_common_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *iotkitdev;
     DeviceState *dev_splitter;
+    const PPCInfo *ppcs;
+    int num_ppcs;
     int i;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
@@ -544,7 +546,7 @@ static void mps2tz_common_init(MachineState *machine)
      *  + wire up the PPC's control lines to the IoTKit object
      */
 
-    const PPCInfo ppcs[] = { {
+    const PPCInfo an505_ppcs[] = { {
             .name = "apb_ppcexp0",
             .ports = {
                 { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },
@@ -598,7 +600,17 @@ static void mps2tz_common_init(MachineState *machine)
         },
     };
 
-    for (i = 0; i < ARRAY_SIZE(ppcs); i++) {
+    switch (mmc->fpga_type) {
+    case FPGA_AN505:
+    case FPGA_AN521:
+        ppcs = an505_ppcs;
+        num_ppcs = ARRAY_SIZE(an505_ppcs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    for (i = 0; i < num_ppcs; i++) {
         const PPCInfo *ppcinfo = &ppcs[i];
         TZPPC *ppc = &mms->ppc[i];
         DeviceState *ppcdev;
-- 
2.20.1

