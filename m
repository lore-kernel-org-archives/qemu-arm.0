Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4988786lfp;
        Mon, 17 Feb 2020 03:46:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxN0ZCBYo6CYkVicC5hMPDw8MSJc5JcVqxpcGFt5EXgEFKfd61xb/DxEfBx8n7Gl/ZMCCGc
X-Received: by 2002:ac8:7392:: with SMTP id t18mr11998800qtp.332.1581939997502;
        Mon, 17 Feb 2020 03:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581939997; cv=none;
        d=google.com; s=arc-20160816;
        b=ZogJvZ8mjQnq0G2fg1KpWVS1SF+T81hJl3C/Gs0tRbcTbppnSEUMSEO50uB7mgOYQ6
         1gqvriNT7DDIAwoRm5w7s4UImd0PGPdYh4ECdE1HLcMBN0HQeBZ54U+L0AFhvT5LvOM9
         v0YlMA6Btsy+1CAq3dg1SUuZ7nqrHjTFl3Bilss372TXj9YmNj4OADeBrCgbpEgWkAjH
         7Ro78wAi8k2gAIKOSFB1/G+NOnCXXn76/IvcPr+5t12T3ix6dEAtncPMID6S+1YZUq5d
         ZozZL3UiEnCsH/LE/hM1ai7cP+UMuF73MoQbTIXSm/oA8/UZe4eAHW1D5ksCICOzPbxJ
         ibHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nvtVA24YsHTPrSYwj3qF+5DzrFJmWkSlCMlNJG9JnqE=;
        b=bzfK2epIa3uSpDH+fUOqTbucffx6WoyhexNp1hILu8Ry1b78t/L/pj8kH1FO1wuC/j
         +AQJxnx005aVUkcYCfIiuxD7vIhmbuYu9Q9hRkPFtjh/+F9qVYPQahaV8723wSO7YeKR
         KmE6zNAgU535O1N6vUN7lt/LX3IXR2fmpwH38qea3bTMtJQE3lI0UNN7Vhdrc51wiJk5
         A2UOZCeZp4hPTiCmtge8KKc0iUEnAWZO1FZ9FIwFXPKPK8ikVHfbvKNcOqeh9oD39PuK
         teSQo1UjUnHIHi0h1N5YnEZoReBw+sJxEHlH3NQBwYKzFhxAqedfV59rOrfJn4P3NGcs
         7Dag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VQF9b72R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t207si203925qke.107.2020.02.17.03.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:46:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VQF9b72R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44103 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3erE-0006YY-R0
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqL-0006TH-VM
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqK-0002OT-Vg
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:41 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqK-0002NS-Pm; Mon, 17 Feb 2020 06:45:40 -0500
Received: by mail-wr1-x441.google.com with SMTP id g3so19302341wrs.12;
 Mon, 17 Feb 2020 03:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nvtVA24YsHTPrSYwj3qF+5DzrFJmWkSlCMlNJG9JnqE=;
 b=VQF9b72RHHe7Ve/RYts9HftY4hap3MiHLjyWjcgzehS0c+FM//w6Jjqqm8mj6okGhZ
 ZR5Bn4xmXPzDuPzxKlXGPkddOlJn5iwIMen2m44Uw+lgIBmiC2DD76VybtxlF8P1ULou
 2y8F6trv96sbadbq9GdLlqW2uKrnSUhClFrtaYxkVySNjdVwigIpj97FLp4vBmMO2UTj
 jxXD4pBiUkPifDaDyQ3QEoMgSjii0iUhpJHOJasqqPESWe6gfursFxVOTmtWSesb1wRA
 jT+bi6pQBeeeolI0ysrZWZ/UOhm5qG1XPOjcPtf79ICO4yyPnoLmIFXa5Yk50ik2TNu+
 C9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nvtVA24YsHTPrSYwj3qF+5DzrFJmWkSlCMlNJG9JnqE=;
 b=VwNiq275GV5p7l1Bzbhv1va0E8A9kRG+fiRBfEJQSFubEV/7th2P/mdFHhzu9pB86h
 nsQA3dviZLXMAlOmPlnfI94j+IOH/n54qOFS2oFetnD5OeyhShBwwDQbpKPNOUmiiN++
 Kgb63J41r0jLLHpxMkjWSyuYc3Ye7LCaDGl+ncUKtDzkqWTXi1xSIjohI6tsWejFOLRD
 Tv7GD+U0zx840t+W3V5I6PhBErd2yYrXDyaFkdTM5ZWeBOOaZ4hwVjXeBo32vq37fGKn
 m2BKSimn+z8pVt/WA12V+XypMqRYB7kBETRMeAx8XSVJGHchawpjfOd/SxA6MNua16Rg
 cEKQ==
X-Gm-Message-State: APjAAAXwdQblR71unA/lgBnNXNrpbH9/n/XHNHEX1+OjME/9GVD/qvSU
 mg6jI96q+hYpmGkeV2dH4uvGWphnygs=
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr21591033wrn.400.1581939939548; 
 Mon, 17 Feb 2020 03:45:39 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] hw/arm/raspi: Use more specific machine names
Date: Mon, 17 Feb 2020 12:45:23 +0100
Message-Id: <20200217114533.17779-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BI73jSqquenn

Now that we can instantiate different machines based on their
board_rev register value, we can have various raspi2 and raspi3.

In commit fc78a990ec103 we corrected the machine description.
Correct the machine names too. For backward compatibility, add
an alias to the previous generic name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1a8c135dc6..d9e8acfe3b 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -327,6 +327,7 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
+    mc->alias = "raspi2";
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -337,6 +338,7 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
+    mc->alias = "raspi3";
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -344,12 +346,12 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo raspi_machine_types[] = {
     {
-        .name           = MACHINE_TYPE_NAME("raspi2"),
+        .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
     }, {
-        .name           = MACHINE_TYPE_NAME("raspi3"),
+        .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
 #endif
-- 
2.21.1

