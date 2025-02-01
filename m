Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942628njb;
        Sat, 1 Feb 2025 01:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjVaR088r5eL1KRxcdK08inZyHdEdRcAfsT0lstNZM7qkTVnS9uAylG+O9qUmG/0Oagr8bQ7ZNs6ozYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvChpItuxs845D1IHqabRH4x6r76zEfzn7hUNW6cyCoq9wpt8Ii/0cxn1G2roHmJGOmIs5
X-Received: by 2002:ad4:5d66:0:b0:6e1:7223:19a8 with SMTP id 6a1803df08f44-6e243c9492bmr257744246d6.31.1738401407459;
        Sat, 01 Feb 2025 01:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401407; cv=none;
        d=google.com; s=arc-20240605;
        b=kjwukbVlEDbd5+wdKgR+iqZAZNcOn3HuP4izI5AuFzCirTV9MDeEFkKUaIXxSxx510
         182i+XyMN/Mk1EJuVFyDd9ZyDF920owKMKEP70hF+BCm8TrbtGVU0CprjyMgdkV8ADRd
         jis8Hapji/+bkOa7/aNMyHbCFdiUG0kUzAcqJ+RbSRLcOnMKiRc9PA63hUUdlPJACAbB
         VhOjBtn5VM0ejnIGxyR4tqL/gahM6o+GfR59GUWuqjQ/vrgKEebYfVmREW9tBRJ3kTMC
         qpYhKv5Kwp2fDkAoIaSTbvUVpnkUv3YizqvNoMhjxIEjv/JDEd9HoBjrjY83argw1POl
         XvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=66gXMVjCY3cMcHioA5BCOH2x7vAMmwWjDCHfHbiYPrs=;
        fh=H4GbwdQ/2oIyPNlbjSTr+s+fsGzXnEOR03aP94txBto=;
        b=DvMD3FRmTNbLB2AQGZMDQd8ZLLs//g23cpwYIMiJFLLsfT6Llko1dW2POtxssdmYHd
         JliAzD4TRm8MdyfTou8DV5On4iiINapYtBENF+kT95zGQuiXMxKHzVs7wrOBkTl0fEdH
         xdYa4so0+tKRKlW/7O+XdEaZF11Nr1O3+dhyzmkiukyIocNGy6UJamzwNu4J23JmzINm
         sisOcMTF2LLEwS+2q/KYmb4rajepYQf3fhMRUX09VnAnnPcsRaC+Siyn56ObjBVc4OA8
         ZbRuusOpWHdrTlU2ZiDZF/NWQy9cDobKVjh6pPLyT2xesSnZJKWbwVuQBoS7cmNo+IRH
         yQ4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1wBjv91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254811767si52602196d6.58.2025.02.01.01.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1wBjv91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1te9cB-0001Ha-Oq; Sat, 01 Feb 2025 04:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bs-0001Da-Lr
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:16:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9br-0000pt-4L
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:16:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso20847805e9.0
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401373; x=1739006173; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66gXMVjCY3cMcHioA5BCOH2x7vAMmwWjDCHfHbiYPrs=;
 b=d1wBjv914EzUUOthRM0pdrPZj1xkqzAzhGgUeCKWouWGbeQJMk553eQZfYFSZptbhx
 VpP/k+xUIGP//7zrHQUX+A7P8WvavtIepX6n1V3LMHd3jvTB953jWTnIahKFO6V5jQpH
 EtHSwqUxX393zCQ3pxgFyM4UKKOzLeMJUMheuP8Th5KLYfeQqMRG0b7DSQTaJrmpNPpt
 VW1SD0kMiffbbOd6TTzqc0RnEbU59egJtH70P+q48YjMHOkZTSMzy9vnE7mEWQ1gvUEW
 KHgg1xRF32Rzh6pwGqrhlQm8ssv8w1bMzZW565Esy1u1Mf7ag76qs0MQXga6iiVg7X7A
 ddMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401373; x=1739006173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66gXMVjCY3cMcHioA5BCOH2x7vAMmwWjDCHfHbiYPrs=;
 b=gi9uvaM2pEwju/IduQWG9bEcX+MRQZcyuqdqDQnLDJKwaE4koZdJMkoSJmlsKugp9z
 3umWDjxAhvfF410Rk3J3OtUeVuHqaX2hDr08kLyAls7UhScd7y/j6Z7yMeobh4bWa4/K
 CeyIrgQ4PSAFr3csBBTpGCjlmfhlM+A0rF/j3Yhs1gHJTlQyexXtdtB7c33sSnxBDEgu
 hdh6G7SttOJyGoJkZaV1b8po2FCKJkonH4L5B9wHMcs7N0Y7rRuMWv3c3Y028kCr/3O2
 MDmHymd51rz79IY//lGqXnJ7ju/7kuqpwoS/yEAKd++5bwLVA8dfw+zO+3OfRvLJbd1T
 UeNQ==
X-Gm-Message-State: AOJu0Yyb3w/WD46x57ltZVzrCjR7sap4x6C3dX3/+vGbaicXmdlzt9Y1
 zfVF8Spd33g+TMZHS83B5axiDMi/AUky9cbhDhv7aJ6u1z7s+Mzt4r9NdeSkoCMHDEzl29j0pLf
 v3To=
X-Gm-Gg: ASbGncvUzd9OpFmmGnWFlYLMVNZTshDP0LZSJXuda/f1WEH8sM20fwNOboDfdvcqY9+
 9ewAx1mEuccLbiz677DRsYLeUof9jZXTz5sHMDnkw6z6Fqbdmwo00Bh/kfMstC55Yc/bViTHXou
 fHm0tuB7fwxLfgt03AtxKvkxvYl2MfsDAQ5aQrwTqyi5Kbhqwz/JVxU/8aY6WfWMey/FuVIrTCi
 BI1cpX0yJSbCjSjjQqHjj1O7DfDJpWR/5l1UdBfGPiUWV51Qd2DgT2I/ZBL2VZ7t110dXLcJHkE
 MMKufY0fwmcSstpBCTa//7ovPaxrce6xjftw31YB7A0C/YxeYX+y5XuezpbbW0p6zw==
X-Received: by 2002:a05:600c:3511:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-438dc41ef52mr105976065e9.28.1738401373022; 
 Sat, 01 Feb 2025 01:16:13 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f41esm81118335e9.36.2025.02.01.01.16.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:16:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] hw/arm/raspi4b: Add the raspi4b-8g machine
Date: Sat,  1 Feb 2025 10:15:28 +0100
Message-ID: <20250201091528.1177-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bx0JW+fgY7wS

Add the raspi4b-8g machine, a raspi4b rev1.5 with 8GB of RAM.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi4b.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 2cf8bc467c5..2120bc1a6f8 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -144,6 +144,17 @@ static void raspi4b_4g_machine_class_init(ObjectClass *oc, void *data)
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
 }
+
+static void raspi4b_8g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+
+    rmc->board_rev = 0xd03115; /* Revision 1.5, 8 GiB RAM */
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+    mc->init = raspi4b_machine_init;
+}
 #endif /* HOST_LONG_BITS > 32 */
 
 static const TypeInfo raspi4_machine_types[] = {
@@ -163,6 +174,11 @@ static const TypeInfo raspi4_machine_types[] = {
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_4g_machine_class_init,
     },
+    {
+        .name           = MACHINE_TYPE_NAME("raspi4b-8g"),
+        .parent         = TYPE_RASPI4_MACHINE,
+        .class_init     = raspi4b_8g_machine_class_init,
+    },
 #endif /* HOST_LONG_BITS > 32 */
     {
         .name           = TYPE_RASPI4_MACHINE,
-- 
2.47.1

