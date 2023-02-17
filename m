Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1535026ejb;
        Fri, 17 Feb 2023 06:18:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+1nyTUjV4v8tlH8s+ORIku7pPddEnmPJ9veKM190On097qhZuXuO4qvLRD4nPL1y3PKXp2
X-Received: by 2002:a05:622a:44f:b0:3a8:fdf:8ff8 with SMTP id o15-20020a05622a044f00b003a80fdf8ff8mr15441281qtx.36.1676643530772;
        Fri, 17 Feb 2023 06:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676643530; cv=none;
        d=google.com; s=arc-20160816;
        b=YJ5AaVIia5U1n7dliAMKbZQIPHsFvIK8EmrnRTIHLSxcJuNjtz95NK+nj60MUCkaQk
         WNXt4LCuvhFv356nQO4Ch9WIfOQZYgSCC5T2WUXp5F8lqRFsSOOE3tMl45Yew9MKSNaM
         vyyHrhSD+C3au5h9/UzeKGup4GBY/ByYNyRV59jrt14QuLfMawYezhAvU4eS87ysSf9U
         GLCCuHpg5/IaY3sMZIGn1mDfPFhvdcUYUh0US8r/Wm6nb6bK/m4plhAwmhnGsjywjnyT
         bCZ0ewD8kE8WDscgn4F/kymtgMfnMIVWm6HbvGaJQFB5CNodvaa+dJc+02JfFntlI4qE
         IsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jmj+DkxKlXQx+ze+c/Skb1A7l3kxqAfEA4I248QEw48=;
        b=W5Ts7U+ZcKHe/XDUXepeJ+GbFXfr3i7M8MG4gtr8Et77URrSDzCxJHhED2AhSQ8WJw
         EHrK4Z1ISwqJuCd4D2Gx4DXqji8pZEL5jboD4ZEO1bkXXteXBWf5jIHP0Yaf/L28Lg9S
         mTk2BlnxHzvMmcvfbOfmkzV1bRKPfQc3C9Nhtljs99ec1EMHnuShWNHMuptX5kt7hstJ
         uSsxo07indR4aZXFfNWeuAOOQeuDfW8okyobSMS6l3sc7i4Ejzxm3ovQ7EFHyiK/I3ZB
         rY3TlZLUKUBbfr/IeLxHFGkjMoXjcZarEiCY8Ex9e802x9JGwB/HGOuDqM3g6OM6AzzZ
         gjpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=A1BWiOLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85992000000b003b05130768bsi3820257qte.61.2023.02.17.06.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 06:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=A1BWiOLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT1ZB-0004Ph-Lv; Fri, 17 Feb 2023 09:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pSxGR-0003sv-7d; Fri, 17 Feb 2023 04:42:47 -0500
Received: from m12.mail.163.com ([220.181.12.197])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pSxGL-0000ds-Sh; Fri, 17 Feb 2023 04:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Jmj+D
 kxKlXQx+ze+c/Skb1A7l3kxqAfEA4I248QEw48=; b=A1BWiOLgoKLNGBaxyd+Co
 27oJvkx2TDdOwoT3W2C227ZRuxF0ScU0TKzA4ExBKbtUbc+96UdzHCzv5KgkM09t
 ZSsfoY5MbyCsXiG/iXl9vujSRCcO7/X6+no7Yn1kwvcrG6c6SD5CCapsEcc6Zfad
 O9puvNA4IqEGZd2ZXZc750=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.20])
 by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wBnbAHwS+9jgz5zAA--.48578S3;
 Fri, 17 Feb 2023 17:42:08 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 2/2] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG
Date: Fri, 17 Feb 2023 17:42:07 +0800
Message-Id: <20230217094207.16882-2-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217094207.16882-1-qianfanguijin@163.com>
References: <20230217094207.16882-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnbAHwS+9jgz5zAA--.48578S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFW7ArWDtw43Xw13try5Arb_yoW8uF43p3
 4DKr45Kw15t34vgr1qva98WF18CryUJ3yIkwsFyF17urn8W3ZF9ryrAr4rKr98u3y5Jw4F
 yFWYyFyxGF15taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi_-P8UUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGhcZ7VaEESo2QwAAsl
Received-SPF: pass client-ip=220.181.12.197;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Feb 2023 09:18:22 -0500
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
X-TUID: 1RSwJrPLUF9O

From: qianfan Zhao <qianfanguijin@163.com>

TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
register, we should lower interrupt when the guest write this bit.

The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
device connected on the i2c bus, next is the trace log:

[    7.004130] axp20x-i2c 0-0034: AXP20x variant AXP221 found
allwinner_i2c_rw write   CNTR[0x0c]: e4 { A_ACK M_STA BUS_EN INT_EN  }
allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
allwinner_i2c_rw  read   STAT[0x10]: 08 { STAT_M_STA_TX }
allwinner_i2c_rw write   DATA[0x08]: 68
allwinner_i2c_rw write   CNTR[0x0c]: c4 { A_ACK BUS_EN INT_EN  }
allwinner_i2c_rw write   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
allwinner_i2c_rw  read   STAT[0x10]: 20 { STAT_M_ADDR_WR_NACK }
allwinner_i2c_rw write   CNTR[0x0c]: 54 { A_ACK M_STP BUS_EN  }
allwinner_i2c_rw write   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
allwinner_i2c_rw  read   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
allwinner_i2c_rw  read   STAT[0x10]: f8 { STAT_IDLE }
allwinner_i2c_rw write   CNTR[0x0c]: 54 { A_ACK M_STP BUS_EN  }
allwinner_i2c_rw write   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
allwinner_i2c_rw  read   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
allwinner_i2c_rw  read   STAT[0x10]: f8 { STAT_IDLE }

Fix it.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/i2c/allwinner-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index 36b387520f..86a77d4a59 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -443,8 +443,9 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
                 s->stat = STAT_FROM_STA(STAT_IDLE);
                 s->cntr &= ~TWI_CNTR_M_STP;
             }
-            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
-                /* Interrupt flag cleared */
+            if (s->cntr & TWI_CNTR_INT_FLAG) {
+                /* Write 1 to clear this flag */
+                s->cntr &= ~TWI_CNTR_INT_FLAG;
                 qemu_irq_lower(s->irq);
             }
             if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
-- 
2.25.1

