Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1922513lfp;
        Sat, 8 Feb 2020 09:01:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHciYO0XtncH803/3WjqRZWAtqhoJUaztfsj2bn9c+GIDXWTdhbF3GGkZybn1Odh1X9Sb5
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr3502165qte.204.1581181310690;
        Sat, 08 Feb 2020 09:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181310; cv=none;
        d=google.com; s=arc-20160816;
        b=Le/6em9+Pj3cxPKGtcawOR+hYK+p1UCO+QPAIxtHdzEO9JqkzGxMkZ8kEwzcQjn2Vo
         wF2em1JTzYrLuYqadqb6psNtHc+hU+6IYEtszV27MepfLvPtE52SLGKqHPAqAAaYzeQU
         smZOOOhdqCC31cocGqFa4/uQHBMIOvpgiiceoQrFGfrWWvhghNjadVKVNygHU5iHFOVO
         iffjIhh/yneF4K7SjSDYQz/pFq0MBSk7n+LNiycPTPxY6GYmu/0yWEkq5mn5L3CuVAHZ
         y0eRE2FVmjTi3sK6Kcwhc6bho2447w14eMopW6UUQd+DihnEt5MQsDBsykfD5mPgDauk
         mHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tBZ23XKKuSqArucqlyayxcsuhsU98/F9gBo+Gwfs7bo=;
        b=dHlv6ofmn46CajeEA+dEjEBuCbTEpKXofzPPahUVzwDnPj+3qo+dfruwHiArJQczzW
         U43xoeuBtbDPv/ful6cG0rTLJ2ORoaJXf9VMmTi3PjDIuYlMKxtsKfMdLVwJDvBph9o6
         9YMKOK2x9eG40z7cUdYBk+SFeNdVJjQ5JFMKyHCQvMELTZqbuV8j3oq3WO6e3mHCnu++
         1ViAIWc8OnKyeFuz2pGFqae/H4yTmVgmQ0MJ3yiSmafNoSi7sanRPHeDPJxZQLDAQ3Ku
         wjkImFuOP9CpyCbvcblqTs9GhBaoLb6F7kOZc17uEF/atZhII+2FzjqqAB6wUV2P6p2g
         rUJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PoQKtWoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp4si1580139qvb.66.2020.02.08.09.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 09:01:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PoQKtWoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TUM-00059A-30
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 12:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ5-0006IO-TM
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ4-0001sE-QT
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:25 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ2-0001qj-ED; Sat, 08 Feb 2020 11:57:22 -0500
Received: by mail-wr1-x444.google.com with SMTP id z3so2499116wru.3;
 Sat, 08 Feb 2020 08:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBZ23XKKuSqArucqlyayxcsuhsU98/F9gBo+Gwfs7bo=;
 b=PoQKtWoUv1myiD7jWyloDmog+kYtVbshUzEDQGkXkHFdwrekpbk+S8VvaFSW1GKRZn
 Bn8FgG7mffZLRI0vYm7l3K/yD5qr2SJfwPZFOjr6xXzE+pIdOiHTXuEBuUBlipcSJKQG
 THDQounAseD470THW98a7QFumEHJ2bPM4mA6LuHkb8Xt0NGBxMUWUmw2XZRpWo5Ha3BN
 OttN537+akQZXoYnXL/8Perl+B1mD21VnkRsksR3gLua7Jt27Tau1HVeyH847kBPcnZ5
 7rPW6nMPJSNrkmhJ193JQcyH2c8ZeLZ2RLzZHyqPB0rcMXZXmm6p0mtv24+LMZl9pxJR
 GVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tBZ23XKKuSqArucqlyayxcsuhsU98/F9gBo+Gwfs7bo=;
 b=sUosk3aiC2ghHkePwwFwb23/gpaRXgM9me9nZzbrCtIWNQndxg/3ChO1hQFP5HP1ON
 sBeXS4Ds6Q6w8/aFlJbfDGslTYicCYdsGGv/H3ytpCtFtnv8PZunCctdadfs7jtfXgsQ
 +hz0XIrsKAJQxcnyOfoJg7JXESINabmL6UQcmpKN2WioN0vkGUSLF359UsSMDtBYMZfE
 0UZMZ7nBHGNX6wQD/JMdLdiLX8YbsZijfw/kNdMSCtKmsIKHxqBl/duq/UKfvsI2z3LM
 AUTIE8QMUShq12WiIVcz6MWV1S/ouKJm45uH/E4WY3/SRNi/FLcY3RjzNUf0vYJGQlHu
 TUjw==
X-Gm-Message-State: APjAAAW9Jhy74175zd2/qkyey0QW7PjBGBP3FNI7DlxvsN8oCOdsKDQa
 8UsWBw7obt2gv9LS/PjqEmsW+Tjx
X-Received: by 2002:adf:8b59:: with SMTP id v25mr6336731wra.419.1581181041280; 
 Sat, 08 Feb 2020 08:57:21 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] hw/arm/raspi: Extract the board model from the board
 revision
Date: Sat,  8 Feb 2020 17:56:43 +0100
Message-Id: <20200208165645.15657-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0UmtSny9j3r4

The board revision encode the model type. Add a helper
to extract the model, and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index f0dcffbc2e..0537fc0a2d 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -101,6 +101,20 @@ static const char *board_soc_type(uint32_t board_rev)
     return soc_types[proc_id];
 }
 
+static const char *board_type(uint32_t board_rev)
+{
+    static const char *types[] = {
+        "A", "B", "A+", "B+", "2B", "Alpha", "CM1", NULL, "3B", "Zero",
+        "CM3", NULL, "Zero W", "3B+", "3A+", NULL, "CM3+", "4B",
+    };
+    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
+    int bt = FIELD_EX32(board_rev, REV_CODE, TYPE);
+    if (bt >= ARRAY_SIZE(types) || !types[bt]) {
+        return "Unknown";
+    }
+    return types[bt];
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -287,7 +301,7 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
     uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
     rmc->board_rev = board_rev;
-    mc->desc = "Raspberry Pi 2B";
+    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
     mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
@@ -308,7 +322,7 @@ static void raspi3_machine_class_init(ObjectClass *oc, void *data)
     uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
     rmc->board_rev = board_rev;
-    mc->desc = "Raspberry Pi 3B";
+    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
     mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.21.1

