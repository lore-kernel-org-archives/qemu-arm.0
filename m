Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15282918lff;
        Mon, 30 Dec 2019 03:11:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqycSEPY0/m1oFbK9GAZfXj/C8rBmnSdxj3VtwjNdBviiEumvyekps6nDs4Zk0R02ORL4nbt
X-Received: by 2002:a05:6830:1d7b:: with SMTP id l27mr68561546oti.251.1577704313861;
        Mon, 30 Dec 2019 03:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577704313; cv=none;
        d=google.com; s=arc-20160816;
        b=WcLVrGualx9KnkJB0Z+BhjXFKBUK4qZwFu736oq6N+CFLjBetF+1uf7pUl1yehfTHp
         PW5WxFvICJ0+bJigvNehZ6D+guz/DgmhBZDOb6wSXEAWdzRodQG1gwZXmQFrDqGDIOUH
         dbzVyM+wScfNHlLcZzPmy+rxQb5liEEbHpSX8kl2oaSrixcBgw+LyO1RH9OWgbW1v0jB
         TxC6IXupmUnO5MjvDMJu05dsJHo0aBfmO6Kb7FcPE2CdEhOKWjOJSQVA6fqOqxeXTNWY
         xYJ5nPZ+qBNmFpkruf6ltdWyklqJ86pDQkZtmWppj1jLgAZOt6m3YJ8DVHq37OXbvtgK
         +HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+HcL6RtbH65y2vmENayC1ied30BzD+pn5ZQNQGLUrBQ=;
        b=OTmN80uMmoHnNisZWxfh+4D5yBuxqilP7gNQ11cFrjTJvUGSevSV1DfGxZrypUCB7E
         0XjTACfhRy8hmWVjWJ7v7tRSMZy3VHLrZd3RlxyzUk7vqZZp4faPfJRJT21QR7CfDE7I
         n9Hjf7lWw+1n60UrdUOroG2POB1NJkokQh+3Hm+6Y5ZsshToakwd79ZIVp3iVk3GINFH
         1LgXU5H666aKstJhFRX7ncI5SuocfYUU0QWfGaW+lqBc9fZuoC2k/pm+1LiQK38w/WKT
         UlH44h9v63YEhEHsBP5fT25+NOzsKOHo2q6/UFBSbOj1oGNEC60RZgGO+ClGEsPxOO5m
         o+AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hQPvj1Oa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s128si21090762oig.204.2019.12.30.03.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 03:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hQPvj1Oa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilsxk-0007hV-LD
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 06:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvx-0005U3-I7
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:10:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvw-00037v-HL
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:10:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvw-00037l-BH; Mon, 30 Dec 2019 06:10:00 -0500
Received: by mail-wm1-x343.google.com with SMTP id b19so13627679wmj.4;
 Mon, 30 Dec 2019 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+HcL6RtbH65y2vmENayC1ied30BzD+pn5ZQNQGLUrBQ=;
 b=hQPvj1OaisvygzpRuEp32g/qa0ZCf5LboT4oqXYdZ223T58Ji8kTSxBSy9rXFpl2Ss
 NgnO0ruPpOCdXexFf2Bc4Xe83kPnCkhaeCwxM8BJu7AkioUZ/YmMuHni6zIQfFPnsDX2
 kvOc0zoa7XxvlJpLUKN+VqOce5TGb0LlVkw5Lr+vq+FGQvqX1QAJmTOYa1SWlF4xRa3i
 QDAmYMuLtzB2RvC3f7+Ztnb/TiqJ7DtO4q9iMKxeuC1mdOK4eMS8EGSuFNtOHiEUVFRJ
 r/iE6P3g+Kl6K/vE1ltzq1TyRR2UqJKF7ki7MHtZz7FZepg9OznOPFXJ4QRz8YBsO/nm
 wcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+HcL6RtbH65y2vmENayC1ied30BzD+pn5ZQNQGLUrBQ=;
 b=gYuiXuHFtjRIyo4q9Lz5OMbx9rOOICGATpaKAACHicujsFOSpE2/lkixBkFFB5sfw2
 aw5BAe11GChXM6NVCfWCy6F3LnUUzSPN47wWT3PVi5FHVLFQAmX/w1X4QbQX02UIRb3k
 B+zc7P0q8SeV0TT3PsU7lKObiiXyQdJM3Z7ksw767gjtRdCU/DlDLja1RRtpJGTt9eEV
 bXOydnvdNT01gcOAUrbM3KLYx2XHwdHlBHgVdBc3VAP0jCjUQ/ErJAHKksegWmxkrSOw
 R93JN2JvrBwEpseEg3wEwKYj31HjiKaGoBCOm6cwddCwV/A1D6Ei/1xojor8wpap8KE0
 YjAQ==
X-Gm-Message-State: APjAAAVVtk2EG5cU5wPDg0ekdFeJeN5ACPDM3J6+qX3NWttn8ZkNA8Jn
 yDgfVMfjwIcF+Fn0yuCt7DOvN+8dWUQ=
X-Received: by 2002:a7b:c151:: with SMTP id z17mr33970422wmi.137.1577704199196; 
 Mon, 30 Dec 2019 03:09:59 -0800 (PST)
Received: from x1w.redhat.com ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id p15sm20442738wma.40.2019.12.30.03.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 03:09:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/arm/allwinner-a10: Move SoC definitions out of header
Date: Mon, 30 Dec 2019 12:09:50 +0100
Message-Id: <20191230110953.25496-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191230110953.25496-1-f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fgiCql2UZTZ

These definitions are specific to the A10 SoC and don't need
to be exported to the different Allwinner peripherals.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/allwinner-a10.h | 6 ------
 hw/arm/allwinner-a10.c         | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 7d2d215630..941c61e533 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -12,12 +12,6 @@
 #include "target/arm/cpu.h"
 
 
-#define AW_A10_PIC_REG_BASE     0x01c20400
-#define AW_A10_PIT_REG_BASE     0x01c20c00
-#define AW_A10_UART0_REG_BASE   0x01c28000
-#define AW_A10_EMAC_BASE        0x01c0b000
-#define AW_A10_SATA_BASE        0x01c18000
-
 #define AW_A10_SDRAM_BASE       0x40000000
 
 #define TYPE_AW_A10 "allwinner-a10"
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 118032c8c7..0f1af5a880 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -25,6 +25,12 @@
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
 
+#define AW_A10_PIC_REG_BASE     0x01c20400
+#define AW_A10_PIT_REG_BASE     0x01c20c00
+#define AW_A10_UART0_REG_BASE   0x01c28000
+#define AW_A10_EMAC_BASE        0x01c0b000
+#define AW_A10_SATA_BASE        0x01c18000
+
 static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
-- 
2.21.0

