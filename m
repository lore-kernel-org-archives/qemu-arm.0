Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942663njb;
        Sat, 1 Feb 2025 01:16:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNxWOG0yJv8KFDdf09hDe1eQBBMtwNCyKBdJsK8vX9tGttSb4/n8ko2AauJ3mopzIGXOeIgmn8c/UCHw==@linaro.org
X-Google-Smtp-Source: AGHT+IGG3yRgwVAQaOqui7ehzvJLw0RteqJKS3lXaMQc6t3Ik1h3UTPy5wUG0YDBq3zRPuuC8vhz
X-Received: by 2002:a05:622a:1b93:b0:467:45b7:c495 with SMTP id d75a77b69052e-46fd0a7724dmr213620541cf.15.1738401413934;
        Sat, 01 Feb 2025 01:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401413; cv=none;
        d=google.com; s=arc-20240605;
        b=flgAtyhX5wG4UEZztpXqCP5ZoDG/fk/Jyi+H5amAxXlbTq/vICL2QVh/arUUTbdmH2
         nM3U8gZXe2JI99u/dbOSOdlZ83n72VVn9Qd82Y1X7bpBFEGQ401CjJTT6LpxGqyJb29l
         QC+NsYaDkHtZ1a/4BmMzJVkZSEJU2jYycXE+hJ5cwFd2NgrK/3C0PH29bLBC0I7PoPR1
         lRyjX41AECpMI/Grg1BKF2dHuAWhMP/9l+2xkVuI8qq/BJKfHBzAzPr8GG1TZMZnqrlI
         HXdOHkbru2QOhGMK2oribc1lGIlCWniPqoAdhXSWqfptvAm8Ieury0kYfHlVyvCrqwZd
         cQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hEJr+KxKG+5t/x8q8wqYlKjB+Sy8stapfLkWTHUsQNw=;
        fh=nbHFNtasIufMXQrSGevsRR478yiRlahAq0CqzlBHsUE=;
        b=MvZg2Q8J4waRI4mn9dAXtTV2D8JHpYK6cHQpo4YNXlHjhIDRXrCBxcywNU5t1ZUQAx
         Q8hFN4OIAEUK3Tkf7hFE+ZIWuYKOO9wNsnvshfOxhFrZJYSpSbhj3uH+GwQfs7ntFoVW
         5Q7H1HWt5a12dlf1ou057wTOVAohSTxWe1BZ2fYWZEFOGWN1jPTLWSNzWPr9GEULsUVo
         kc9eHaVPMXYjvgRY1nkX97qop9wwEtwAWhhyxhYRPLFegfXUI/WLsqdbhI8/7fdcE/LI
         4O+gDJa5vtWp9lKTRCHNs4Uoy90alt4Gr797R4Fpt0F7yweR5iHliK1pLskyXrq5dVqO
         GpSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf8BDdDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d167fsi54270601cf.381.2025.02.01.01.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf8BDdDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1te9bZ-00012V-U8; Sat, 01 Feb 2025 04:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bU-00011k-QP
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bT-0000b8-7y
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso19411905e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 01:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401350; x=1739006150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEJr+KxKG+5t/x8q8wqYlKjB+Sy8stapfLkWTHUsQNw=;
 b=cf8BDdDf/0SP9XvpiP+c5qJgNkvTn72kZHXN4IF5QDz9S2ypHpdyeNrCaCobVvRNtH
 4sJqTtQsMOkTA/lXoBz+jhE70dpD5dXZE1d8upp79Th73IXxbfd4sfBKsIpxYhutQ0V9
 jY3eSXFG6JNaqloHjFSM7LIxB3ia6ymbJFFChdKZxIYYWpcHN/EH1Rq0Z0sVaiVe5/32
 cvo1cUjR9+vBaYAOwDYlcCVtxGLxBHlM6p6AGY/FHfnpsRkDpr8Goh//Jp0d/FaMb9OY
 OWl0z+6eNgImJsn52x3OfO4w0XBwerejsgojD2wuJR3DGfkzVc4+gNCY4EpN5neLhUsQ
 hpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401350; x=1739006150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEJr+KxKG+5t/x8q8wqYlKjB+Sy8stapfLkWTHUsQNw=;
 b=ddYsHThdxXxn1r0TJ9p4tgCjip4QeaZw3QjxwKi/GAweOBLz/bH2o5abBdXA2yDNGO
 OVYAQbbMEG1wMyjctmIJvScROUuzMEKw/67ly4vlUXc5F3fl8E+NOHq/gf4+YkCe32UX
 BgsB3DxygEe2GZLh1tPriIaVLVJ/JRlIFBXLNKxWPKQMDJm/uMFjv1uVxVJTUlcnC7Te
 /h3fXuoZqlNwMikprDpZ0RAYJ4UgAgwSsAMMI5kJwYuleOzw5I3pGLz9QoUvaVNxXUSy
 YodDBatbxOIcdgOJyhGlQntnO2b/x0vsy1FXI6AG5mnjaSQ7QXn3EYeMiWnhdqkd7N4Q
 KlZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEBbt2GwOATZz1xGX0pH6KINoIhyfz0EpXdzoH2o56VVopl/6YV9avSuqSYIBrqKJ6CFef9GNQYQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxqJC82lHcp6Bez6Q6UOrtjexpcJM3GAZqFIw1xlGkTlaEJ9MW
 D+ZLPTIQChyCMSLkUzfzE8hgwPo/XhKIYzDW0EESOeiyL/kFCw0Gv0LXmkuNcU4=
X-Gm-Gg: ASbGncvYToI+zOf6dUVY4KcRHIBnrIWSYbbks0RE9+YS5Ui75hBGDv2n9ciPe5ngqCK
 2DBvSM1oglGNGuieKf0l3NXnarBjw1YMDtG01k1MXu01lDe1St8vcIuAKYaoMou19SvHSaNYCC7
 U1GzLxZg3bSy4dj7jli8gHQRCF6hIj/ZtkhGfAF8H3wGdXHQ2NqOy6k8Qg5LnFVDtmmd1RZEB75
 k7Nd5tQNGaK25kdp97AOREqagvAiHD0bsbVSncBJM5Ksti+uf/qSuuhjGFWB1Sv6ZQkLN6c5MeD
 yJ5s7ddShgVCigTFSNkhGR9xmX8clgYDsPSH7b9v/MfKsFQeYuzIzWElJMhvgpbKrQ==
X-Received: by 2002:a05:600c:198b:b0:434:a7f1:6545 with SMTP id
 5b1f17b1804b1-438dc429291mr112652585e9.27.1738401349784; 
 Sat, 01 Feb 2025 01:15:49 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc80e61sm118252725e9.34.2025.02.01.01.15.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:15:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/7] hw/arm/raspi4b: Split raspi4b_machine_class_init() in two
 (1g and 2g)
Date: Sat,  1 Feb 2025 10:15:24 +0100
Message-ID: <20250201091528.1177-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dAxtiK5jI/W8

Current raspi4b_machine_class_init() method register 2 distinct
machines, with different board revision (thus different memory
size), whether the host is 32-bit or more. Split it as 2 new
methods, one for the raspi4b with 1GB of memory (on 32-bit hosts)
and another for the raspi4b with 2GB of memory.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi4b.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 548059f6d69..4ea79ec7092 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -107,26 +107,45 @@ static void raspi4b_machine_init(MachineState *machine)
     raspi_base_machine_init(machine, &soc->parent_obj);
 }
 
-static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
+#if HOST_LONG_BITS == 32
+static void raspi4b_1g_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
-#if HOST_LONG_BITS == 32
     rmc->board_rev = 0xa03111; /* Revision 1.1, 1 Gb RAM */
-#else
-    rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
-#endif
+
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
 }
+#else
+static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+
+    rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+    mc->init = raspi4b_machine_init;
+}
+#endif
 
 static const TypeInfo raspi4_machine_types[] = {
+#if HOST_LONG_BITS == 32
     {
         .name           = MACHINE_TYPE_NAME("raspi4b"),
         .parent         = TYPE_RASPI4_MACHINE,
-        .class_init     = raspi4b_machine_class_init,
-    }, {
+        .class_init     = raspi4b_1g_machine_class_init,
+    },
+#else
+    {
+        .name           = MACHINE_TYPE_NAME("raspi4b"),
+        .parent         = TYPE_RASPI4_MACHINE,
+        .class_init     = raspi4b_2g_machine_class_init,
+    },
+#endif
+    {
         .name           = TYPE_RASPI4_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
         .instance_size  = sizeof(Raspi4bMachineState),
-- 
2.47.1

