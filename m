Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2713335lfo;
        Sun, 31 Jan 2021 07:16:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9DrjmWLmlc59x4Q9AYJMtgIQOk21w6Dp1RH9xzvjg43PbB0i7luHO0CXLDaAKIP6sTc4s
X-Received: by 2002:a25:b116:: with SMTP id g22mr19418095ybj.447.1612106192220;
        Sun, 31 Jan 2021 07:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612106192; cv=none;
        d=google.com; s=arc-20160816;
        b=lpzQV8PojNvtS8ylbgt914nLAFYwBR6GXodjqHAg8lR+6wi0mpQJLNMIvWVvCVzclb
         xPW95mFG8iC7gQ5IHanwZ0/1rcL0P83RJniDMJ9Ho4b1sCWuf0l1Qbx8Wd9OU2gUfSNb
         1YqA/ANZcFd6TavRpgcTyFAO8lqyGfyy2wT9jQa4mu96JK1P8LCE7r97EPG7x7GDX3fE
         2tvG3U+9diiuSYyJ2rjcohgmYh5mJrJ7U21EVTq+nzSWCPLrJ8J1sz37eqb6E8Z+AAil
         8dbR9aSSFq5fImJb3+m29K06VBs8fDk5Rf4GaEOE27O1B/hecLpAuDLZS+zj3IbOgwML
         v+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ldhPTzxA4UPWiOW+LZ2h6Ki08VC7Oo3bcq6ZAuAin0w=;
        b=Vm0+REfKozpQqnjOlxZ4/HwCR+ZUP8yReolKqmHVNxW6eV2aQklLHiMMcxJ4iDq9hZ
         tD0FvNm/kI1i39pW3yOn+U9NfNIIxV9Be9wacThOE7q+9kuhT826KPu2T33sXS/h7r9x
         4a1a7aTbfOj2g4lVBoBICl6dMOM6o6giySBu5Urbzmz1iWiiMYVpGJ6mWh+L7x/CKJiH
         oSbezowEiSUlW0iXbM3mm4dB+6RdJj+NFbAiv5rlYk9jKXV/IYWFTqmSf1nuMwtCGn5Q
         qx5GnjCBgO3yv8DVV6y3sdE0t43mYvuluKWIYdWauN5cZrRG5cH2xhf1KxTj4fLXKHGL
         WU3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SrJXQmjd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si16347368ybk.29.2021.01.31.07.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 07:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SrJXQmjd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6ESl-0004FC-Jd
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 10:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQf-0002j6-FD; Sun, 31 Jan 2021 10:14:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQd-0006ko-Tw; Sun, 31 Jan 2021 10:14:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so13851765wro.12;
 Sun, 31 Jan 2021 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldhPTzxA4UPWiOW+LZ2h6Ki08VC7Oo3bcq6ZAuAin0w=;
 b=SrJXQmjd7iWFGHl3EDknBIdB0mMy5DNuZNVkW+dhCAOwwwaT6d3vqof3LR6THZz5XS
 CRKNKxQ4vvef235fsMX0jEpaw0ZeJxod+44Cakg7oc4inzeuh7hfthIv2lbW5uLJt994
 j04cN+hlE8/b+DKikyYT6ZrKoi4uJHXyg67vYeuNgpDPknjE04ThO8H+rbTCaMoWs1wO
 RmukcZvwCO8XMxHVH7spkWvpvSG8QQdVFyOSkOETvKulaWTeK4YHrGgWfTBybWh9dZbK
 kiAhvPmNflrqwnF5JtTTCGyPLqWTgSsXqtg8tFo+5zW/nxTcHSuU1wpexpraeKKcCTSx
 n6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ldhPTzxA4UPWiOW+LZ2h6Ki08VC7Oo3bcq6ZAuAin0w=;
 b=lEyD4xMC399oSFoetaUk+WhHu/QP7f/TkPNzAuc8y+IsL0udnjgNVa+F8w/f5/7SPv
 GY+RA5DG732e5vFBw5zCa7rEU7A9lrj0ytmBULGe+pGiMX8djBx0iPzj0SYEVQmyIga2
 YhwYRzCg7kQB9Lz0H+ARGIMpGW3iCgRvf2ArpwZSVdHV3/q5CcMWdRBi4S66aneSuyV3
 YMjwrRZ7AL5u6E7uGbxhWKEAEjd4khpCS4elRUxjRvtoqPKiAvS+3rkbVnbIy2+PFjvd
 okhKW0b33qb07iE7eEJ52z6qcHxLUxY2StyAXQuVO/LFH8Q2jikGroPA3j8BLZJmSiNS
 b57w==
X-Gm-Message-State: AOAM532/UM5ZdndHA75Gt01v2uZLWg8cMsWJeOkktCQ/n7u0jntAzl5I
 m0R9FmkEOYp+qheDIi0TEUsXDo9iveE=
X-Received: by 2002:a5d:690b:: with SMTP id t11mr13995267wru.12.1612106057720; 
 Sun, 31 Jan 2021 07:14:17 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d17sm13763448wma.2.2021.01.31.07.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 07:14:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] hw/arm/raspi: Trivial code movement
Date: Sun, 31 Jan 2021 16:14:09 +0100
Message-Id: <20210131151410.318649-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131151410.318649-1-f4bug@amsat.org>
References: <20210131151410.318649-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfsYMYMlODqZ

Move the abstract TYPE_BCM283X and TYPE_RASPI_MACHINE declarations
earlier to make the next commit easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 32 +++++++++++++++++---------------
 hw/arm/raspi.c   | 18 ++++++++++--------
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index de7ade2878e..fd16ed87c40 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -219,20 +219,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo bcm283x_types[] = {
     {
-        .name           = TYPE_BCM2835,
-        .parent         = TYPE_BCM283X,
-        .class_init     = bcm2835_class_init,
-    }, {
-        .name           = TYPE_BCM2836,
-        .parent         = TYPE_BCM283X,
-        .class_init     = bcm2836_class_init,
-#ifdef TARGET_AARCH64
-    }, {
-        .name           = TYPE_BCM2837,
-        .parent         = TYPE_BCM283X,
-        .class_init     = bcm2837_class_init,
-#endif
-    }, {
         .name           = TYPE_BCM283X,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(BCM283XState),
@@ -240,7 +226,23 @@ static const TypeInfo bcm283x_types[] = {
         .class_size     = sizeof(BCM283XClass),
         .class_init     = bcm283x_class_init,
         .abstract       = true,
-    }
+    },
+    {
+        .name           = TYPE_BCM2835,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2835_class_init,
+    }, {
+        .name           = TYPE_BCM2836,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2836_class_init,
+    },
+#ifdef TARGET_AARCH64
+    {
+        .name           = TYPE_BCM2837,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2837_class_init,
+    },
+#endif
 };
 
 DEFINE_TYPES(bcm283x_types)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 990509d3852..dce966a4dd8 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -369,6 +369,13 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 #endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
+    {
+        .name           = TYPE_RASPI_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(RaspiMachineState),
+        .class_size     = sizeof(RaspiMachineClass),
+        .abstract       = true,
+    },
     {
         .name           = MACHINE_TYPE_NAME("raspi0"),
         .parent         = TYPE_RASPI_MACHINE,
@@ -381,8 +388,9 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
+    },
 #ifdef TARGET_AARCH64
-    }, {
+    {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3ap_machine_class_init,
@@ -390,14 +398,8 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
+    },
 #endif
-    }, {
-        .name           = TYPE_RASPI_MACHINE,
-        .parent         = TYPE_MACHINE,
-        .instance_size  = sizeof(RaspiMachineState),
-        .class_size     = sizeof(RaspiMachineClass),
-        .abstract       = true,
-    }
 };
 
 DEFINE_TYPES(raspi_machine_types)
-- 
2.26.2

