Received: by 10.28.71.27 with SMTP id u27csp1945286wma;
        Wed, 14 Feb 2018 20:48:49 -0800 (PST)
X-Google-Smtp-Source: AH8x225eFaOPQa2MmJixT4EcMHdYeBSWp7F7VAJ/ZEJqqgKsZuIs43HDJjQcNniGdctLkjQ2CgCw
X-Received: by 10.37.107.69 with SMTP id o5mr1145128ybm.337.1518670129042;
        Wed, 14 Feb 2018 20:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518670129; cv=none;
        d=google.com; s=arc-20160816;
        b=H8gsTF6sSnubDLDpipshoWgKrtKIhEUJVPubiDBS18zGFeKTDRJKPJldPoRQTlozef
         uXdvKsM8WvY5Z2OaIxG+cyECQnCICcxAbdEhvR/kAOndsedkaN5XAciCnf4e/tWWPtZq
         1cBUVuDfs5ebcW8YabdSKjcBKkb4m8QEezka5l3Yv1YgNZSR9JLphufigv6uTw5CTsL1
         EOFIw4NOkcrSkws2C4k33NummDez6ufapjnkheay+bYdhDWzc0dw/o6ANYR2Z4p3cKYw
         YlIQCHHgXsFn/7HqwROmISSjyiH/sqQR+gOfZDYyYX8HtHBabe3FP2m4IccW104ZZdhd
         Hw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=tS6N32aqPY7x+TTEuvHXDv9hqaO9i7o+Ojp9fYmI5qs=;
        b=HvWY1ZJsTDN/P1OdvIFGV4xsUkZnACt4yAja+KoOepwH3ZiHzWHerkXgAl8ParIp6U
         /ChalygarzYZLAvIITB8dyaSKJxbaY1YTiKr3KVXqMixxgkrBBolCgatWCIHnFcqFMgm
         +mOe4AYQSBJC7wK/yrLm2Uz/EY9H8uP0x7zX1+PbtsJ/97o7vrNYzBQxrc57rKabpysH
         p3qGu+coTpn3ujnJLFvB0ZgJlqZea55h051VoKEaclkabXkDCC/afFS50npf1oTnC7oW
         TUbQhFkhNl/wsHMEv1hdMcUSkmS008q8gQX0cKc9ySel7lxVzPmFXD9976n5509QDgUt
         NJ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kuzW07s9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g200si594369ybf.532.2018.02.14.20.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Feb 2018 20:48:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kuzW07s9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emBTU-0007TZ-Cl
	for alex.bennee@linaro.org; Wed, 14 Feb 2018 23:48:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emBBa-0008Fo-QE
	for qemu-devel@nongnu.org; Wed, 14 Feb 2018 23:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emBBZ-0004Mt-Po
	for qemu-devel@nongnu.org; Wed, 14 Feb 2018 23:30:18 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emBBZ-0004MZ-I1; Wed, 14 Feb 2018 23:30:17 -0500
Received: by mail-qk0-x243.google.com with SMTP id o7so15055038qkc.1;
	Wed, 14 Feb 2018 20:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tS6N32aqPY7x+TTEuvHXDv9hqaO9i7o+Ojp9fYmI5qs=;
	b=kuzW07s9pjzL3LsNb+RTb3Exp0pKDqm1VVRrkK1XrxawR+8ZqHSf5ivIcpwbGcE2wm
	OE7DPlclmALr8cqfMw+54JRnFQuJC3son5PKRwwJsQamhRE+BWWttfjcqlhVEaFxFjGz
	iBJmXN6OSeDknLM9gk3gpcPyejf0y7qjSJhePWxBwaO/rs73Rb7VWNVN1kOOBUyisYLr
	DOucHY2RYeqK3G0PsnEUDbYR6byFfSt0s4qzU/gdvPuenH8wJwmz8oesNo7OrsISSMQR
	DHr+/Zb01oicOnGXAW8tFQZ8KuzzrHZdhY1CzPYa5Q9BfYw1RP4WAVIaQXHv7ZnOHxlx
	lbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tS6N32aqPY7x+TTEuvHXDv9hqaO9i7o+Ojp9fYmI5qs=;
	b=UF3FG7ezWOD3nyOT7rAy9sAMPcZ7G8IdpM/Nv8H0DOv8r36JhDl8g7ZJr2IZ7FdHgx
	wvGEuT+T5kJrrMY1pc+CZMEllzRJ3ul2IxXeXdICboDp8zyE7tc/g3HnVpxXOiT6FNmz
	8sa4KmNFUVmthPj3GynINkak4gmhTAlgDJUkQsEQ923uJiB7FYEA1sShuceDdwIH5V9l
	KFtcurb5NnY2OQKykizu0wzZ/IsH7IVXE4N8R1veE0eS5C2vdTEMa1voo33rnmYMMPQ5
	4ef3mBJl1+e+wRpNGo5zCzsOt36E7HbZ7numLvNEZ46O567MFD5W1G+dasHVebTEPic/
	dQXA==
X-Gm-Message-State: APf1xPAxgo6YuzuuL8Q4B9Mq4hOJaZQqa4aWAxIAAuGc083vBvRTQClJ
	nN9BDjpr5rqx0sU59TGJu4NNEV0N
X-Received: by 10.55.219.1 with SMTP id e1mr2157125qki.151.1518669016984;
	Wed, 14 Feb 2018 20:30:16 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t33sm10680312qtc.14.2018.02.14.20.30.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Feb 2018 20:30:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 01:28:53 -0300
Message-Id: <20180215042900.16078-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215042900.16078-1-f4bug@amsat.org>
References: <20180215042900.16078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH 23/30] hw/net: use the BYTE-based definitions
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bWzWgizEIsAi

It ease code review, unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/allwinner_emac.h | 4 ++--
 hw/net/e1000e.c                 | 6 +++---
 hw/net/eepro100.c               | 6 ++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..93ec0e7067 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -125,8 +125,8 @@
 #define EMAC_INT_RX         (1 << 8)
 
 /* Due to lack of specifications, size of fifos is chosen arbitrarily */
-#define TX_FIFO_SIZE        (4 * 1024)
-#define RX_FIFO_SIZE        (32 * 1024)
+#define TX_FIFO_SIZE        (4 * K_BYTE)
+#define RX_FIFO_SIZE        (32 * K_BYTE)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 16a9417a85..767b35fca8 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -81,10 +81,10 @@ typedef struct E1000EState {
 #define E1000E_IO_IDX       2
 #define E1000E_MSIX_IDX     3
 
-#define E1000E_MMIO_SIZE    (128 * 1024)
-#define E1000E_FLASH_SIZE   (128 * 1024)
+#define E1000E_MMIO_SIZE    (128 * K_BYTE)
+#define E1000E_FLASH_SIZE   (128 * K_BYTE)
 #define E1000E_IO_SIZE      (32)
-#define E1000E_MSIX_SIZE    (16 * 1024)
+#define E1000E_MSIX_SIZE    (16 * K_BYTE)
 
 #define E1000E_MSIX_TABLE   (0x0000)
 #define E1000E_MSIX_PBA     (0x2000)
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..6fdeb05259 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -60,8 +60,6 @@
  * changed to pad short packets itself. */
 #define CONFIG_PAD_RECEIVED_FRAMES
 
-#define KiB 1024
-
 /* Debug EEPRO100 card. */
 #if 0
 # define DEBUG_EEPRO100
@@ -104,9 +102,9 @@
 /* Use 64 word EEPROM. TODO: could be a runtime option. */
 #define EEPROM_SIZE     64
 
-#define PCI_MEM_SIZE            (4 * KiB)
+#define PCI_MEM_SIZE            (4 * K_BYTE)
 #define PCI_IO_SIZE             64
-#define PCI_FLASH_SIZE          (128 * KiB)
+#define PCI_FLASH_SIZE          (128 * K_BYTE)
 
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
2.16.1

