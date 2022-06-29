Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp442845lft;
        Wed, 29 Jun 2022 06:22:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+PkM5R4uHlCKv0EkfZ5J/oAXlDn8VahEQ1YSKKZMqdzIE7H1M7tOKHL8Y87LqvoqxF6LV
X-Received: by 2002:a05:620a:294f:b0:6a7:4413:9416 with SMTP id n15-20020a05620a294f00b006a744139416mr1976425qkp.181.1656508946468;
        Wed, 29 Jun 2022 06:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656508946; cv=none;
        d=google.com; s=arc-20160816;
        b=lozmwAyDKDnKwQyeumPYsuj515gBOWzaoEK92bYsNhS4iahSlTmT0E72jaVo6C1JaC
         Sl8iNGGOZ+QklOOXRhbs7UF2JHYsYpoHi9G/Lox4vSurAOzjJmGu1hc90q+Om9xPzltv
         7t6GEmhEIIBcL5sy5fqo0Yn1hB++yNFw962oFs1YX3SdTV0GylhEw9K6N+waaSmkZk16
         hSc4XH03Tj/bJ4yUKOml7FspT/fJQq3r8JoocGmQ98RAEN+iADM/N0rnvbtnntLtempb
         a+LWNpjS5ZH1VUlR+GQfoODK2hbAcC2nHo5HFR52A1YeGkS+SS/qK3tr847zu1Ov6QWg
         MdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=E3I/Oo3kUZprr5MYtmkxHjS3LLSNsTaxvoiNuHLK1k4=;
        b=GbOX+hyNY1YH4k6x5Tk4pw9kJf0zWcTN6z2RqXcOlZLCWCAELw3Tf5YX+gDo4P1eAl
         P7aT4q66oTmk8v3lB3ZAE0GWiXq2Q344xlOarsGE/n2BQZPW4dJ9u9oGfqsjmfB0q9lP
         2m/kcwW2rcKkn2XppS8Kd1QJO6jYmAvdY5YQLtWFhnta2IUTpDT6wunW6yPN/Q0gtxS9
         f7l5ZEBB3J7n7KbjI/S+6ua7y23UuopksX5VUSHZUJZjv0JcouwewHezFrvY667PMmAq
         tpvVL0k1421Nf6BjLaN5DBHftfgj5Dfpw1tYFLQBdiU60TULkpDkZycBiG/piaTguZvZ
         BTJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=og3SuMCZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ac80083000000b00315668dcbd4si8514520qtg.646.2022.06.29.06.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=og3SuMCZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XeD-0003Sq-SG
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1K-0000sy-8q; Wed, 29 Jun 2022 08:42:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1I-0004mT-Lc; Wed, 29 Jun 2022 08:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E3I/Oo3kUZprr5MYtmkxHjS3LLSNsTaxvoiNuHLK1k4=; b=og3SuMCZGN3I8UXNIm9XPnNQQ0
 JXD7ShTk7eMY6ntXGHGzXWwB5xy1FbnHoZ+M1cWFOJ17mQ6Rnc0evT5AX37Fz66GSOGHBWUjGRHjo
 PdFHIxayKlIRh7PmAhxs7FrX+H9HziSvjpazlYaIMWXDUCuRGjLhTMb7JoyYGzByAynpY79bbbktx
 /pHyTQfZHurmaMUMKAHdFxdfG/ZxoMdKbLxBsgOXGhpRZWuFtA0kFshwveuU3YmiEftKtyiV3pT2u
 owFiny1nWKUt+bHMdT8p96grySmdRv6PNfT8iVUPy1qT1IK2FLdvJxDgNCgujDaOIzVv31nWTZnve
 Ho5mtNYOUw4Jye/ot/qg4wCsMj16L4NhW1reZp4mG+tHNrC7hp0GfDZKlr4WLCGnzhRjnxvZd1/0b
 bFnv20YaCI/Hg2UFFo6ImZ/WJzDA+o0djTMoHczV8Z3+EyBE9fuk1Mup/zeEpVEewcFKrUvbReXbI
 I0uYc0Z21S3KqCe9GGnwk8qIIpyMoQYUNRFWlX8yU/v5jG82rNjqQKu/QptlyL/PSjk89y1p+KDT0
 Sni4fpMkGqNNRiUGZjyElauoDSf8PuYYh/hYKBLA/Y/fFbxeqJY6iUfI1hIWIAdnTsGi1p+UqVIwc
 bj5sLpZ1Ac5+cMdZmA7UloVgVj6LelOYQ83kzLPLo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzd-0002tZ-2c; Wed, 29 Jun 2022 13:40:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:15 +0100
Message-Id: <20220629124026.1077021-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 29/40] lasips2: rename LASIPS2Port parent pointer to lasips2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kqXZbUD8FSWY

This makes it clearer that the pointer is a reference to the LASIPS2 container
device rather than an implied part of the QOM hierarchy.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 6 +++---
 include/hw/input/lasips2.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 5ceb38c1af..0f392e2bee 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -222,7 +222,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->int_status) {
+        if (port->lasips2->int_status) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -368,7 +368,7 @@ static void lasips2_kbd_port_init(Object *obj)
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-kbd",
                           0x100);
     lp->id = 0;
-    lp->parent = container_of(s, LASIPS2State, kbd_port);
+    lp->lasips2 = container_of(s, LASIPS2State, kbd_port);
 }
 
 static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
@@ -405,7 +405,7 @@ static void lasips2_mouse_port_init(Object *obj)
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
                           0x100);
     lp->id = 1;
-    lp->parent = container_of(s, LASIPS2State, mouse_port);
+    lp->lasips2 = container_of(s, LASIPS2State, mouse_port);
 }
 
 static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 7199f16622..9fe9e63a66 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -37,7 +37,7 @@ typedef struct LASIPS2State LASIPS2State;
 struct LASIPS2Port {
     DeviceState parent_obj;
 
-    LASIPS2State *parent;
+    LASIPS2State *lasips2;
     MemoryRegion reg;
     PS2State *ps2dev;
     uint8_t id;
-- 
2.30.2

