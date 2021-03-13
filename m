Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2257908lfg;
        Sat, 13 Mar 2021 09:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaDYKaegqWLgPeQvAMdG9pQDnYe8xz+w42IVHY64nAfFbbH29BF3Lwl4FWj9uieDEzQX75
X-Received: by 2002:a02:a796:: with SMTP id e22mr3882300jaj.93.1615655911813;
        Sat, 13 Mar 2021 09:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615655911; cv=none;
        d=google.com; s=arc-20160816;
        b=prEChY7FFlLQ9YbL4ZmjS5vcgk8h279RpAeUStjGPl6jQbiptszTCOu3RWirXkq8oD
         l1G5vmmo98XDgv/0xNSxzfrVQBrhhUobiz0Rvpj7LLmOkuhbs6fGzT6q5fCephF1tTxu
         5pNuBYh5kKIB4s1nV9iXavL2cIG/wY+NvUQoT7A3lGO209l2wHlRRwFfaducZhQep2f3
         DKuQX5Vc1ZUnyoIbl9f+9IchX9cikD4KhnNPfwrMxN0Q5uXE52uw7ftcfyV+pMgiTrvI
         MyzoE1BTcK+u41fl5HwxfvCuPcmoY75s/ntSOg1JxEassefWx3eccD/FSvcbTjMLWive
         gtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5dbGGreB+KCx7HwQpBslacsaletNg0zMJJsmt+JNjp4=;
        b=S4Y34heW+aLOYKHj9lLEYbB1WzAf4ePD10uhnf1+2+KWJRXmXX7xF33LHycu+Foyi/
         vjwQyUKQXF2uBfxm3rsJZW5IYosA+D2mtl6xjHfDcDnHdAd2sjw1R5KuEfYCMLcc4SEQ
         nrQLzSo0J1bKk/LI4dwi8yNFN33rNTx8/kFHVGiM5PVr92KEf0MenRmPdEjh9KWQ08G+
         oxyCrm1+z9No4SKR4rxhpret91zBZEXBjrMM7kV2jqxnpqPJzazuENvdd1irAXSmcwpE
         hvMmbwKi8C/Xx0lvpcP4SFGdlD9rwqbo7QCyY9SbYlO8nAOTtdaTbUX3qsZ9t3v5FG/K
         boSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FgMdz9L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si7508730ioh.3.2021.03.13.09.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 09:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FgMdz9L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL7uJ-0002SN-4e
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 12:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7oC-0005Oo-5d; Sat, 13 Mar 2021 12:12:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7oA-00023a-OU; Sat, 13 Mar 2021 12:12:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id l19so5590426wmh.1;
 Sat, 13 Mar 2021 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dbGGreB+KCx7HwQpBslacsaletNg0zMJJsmt+JNjp4=;
 b=FgMdz9L9lddRk7JgJZfBg5ECP3K8vEfWeIkS9K0ION/aJYACja1SXmohGGkAD0dSEk
 vv5+S6SUMQ6+uNIymzPFipqCxYA8WyFh4Wb8tWNeDnj1irGNKx5zlrb244sYlS6gYeYo
 G0i2bQvbFMb7G+2ZmoeGv8rWNnevSYyaFExhDRUcLJQdN4qJeMRHzL0h0cM1vtHEwZNy
 piyMCOG8XUwQQg0X2nh3AYEbcIoVqoubhz6CeGCcwZ9HO8p0TD7oYIehvxvzI/b5BtAA
 6S0qF95G0M1JvPIPFWyvr5kVn2Aq6PWQDFmhtHCIeIx5+ggXtrLddXVZGn6/5GmgkTm2
 7Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5dbGGreB+KCx7HwQpBslacsaletNg0zMJJsmt+JNjp4=;
 b=MINTNwkx2WEYgSopQhTqAuVAq777GUjSFQdBXVb8elvdKe/g6Ak0nq4iC6Wk55i9fo
 MaAU7chfLtTCSKengZeMS+LaibKBEhlhRyxgfU0cqdR9jbGAqg3pm1RDzCpGItz9BayN
 u3yCVu2cIEI2fTdgw1uO8vNUhpC40Z/jvjbfTOgKtRPE2Er7jRA7Qjblk9HZ7BsARq+Q
 n2mGlsyOBRQRWSX3zLqfpm3P7oN6/qQXr6Q66NjTc7s6z1+xGYZ01QiIfrPBgZxJcuAa
 EQjqjfCRJuLal3WftSQxhziPFVYOQdji+c0HvP9OCPMzQ8M80KQitNvwcDRB1xohgGTd
 wz7g==
X-Gm-Message-State: AOAM530RHkA0n04zcgUFR3+PojHwoS7jhCCFAGrOUdm0ZoWtTh26YSjw
 PUoj3vipk9Qz0hL+oCyAhSncAZFYVeFQ2A==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr18320333wmj.38.1615655528577; 
 Sat, 13 Mar 2021 09:12:08 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm4923221wmq.3.2021.03.13.09.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:12:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/usb: Constify VMStateDescription
Date: Sat, 13 Mar 2021 18:11:50 +0100
Message-Id: <20210313171150.2122409-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ro72ATFlmeA

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/ccid-card-passthru.c   | 2 +-
 hw/usb/dev-smartcard-reader.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index c1a90fcc7a5..7212d0d7fb5 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -374,7 +374,7 @@ static void passthru_realize(CCIDCardState *base, Error **errp)
     card->atr_length = sizeof(DEFAULT_ATR);
 }
 
-static VMStateDescription passthru_vmstate = {
+static const VMStateDescription passthru_vmstate = {
     .name = "ccid-card-passthru",
     .version_id = 1,
     .minimum_version_id = 1,
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 80109fa5516..b3845ccdc14 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1365,7 +1365,7 @@ static int ccid_pre_save(void *opaque)
     return 0;
 }
 
-static VMStateDescription bulk_in_vmstate = {
+static const VMStateDescription bulk_in_vmstate = {
     .name = "CCID BulkIn state",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1377,7 +1377,7 @@ static VMStateDescription bulk_in_vmstate = {
     }
 };
 
-static VMStateDescription answer_vmstate = {
+static const VMStateDescription answer_vmstate = {
     .name = "CCID Answer state",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1388,7 +1388,7 @@ static VMStateDescription answer_vmstate = {
     }
 };
 
-static VMStateDescription usb_device_vmstate = {
+static const VMStateDescription usb_device_vmstate = {
     .name = "usb_device",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1400,7 +1400,7 @@ static VMStateDescription usb_device_vmstate = {
     }
 };
 
-static VMStateDescription ccid_vmstate = {
+static const VMStateDescription ccid_vmstate = {
     .name = "usb-ccid",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
2.26.2

