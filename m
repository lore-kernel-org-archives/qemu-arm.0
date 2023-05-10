Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp3300098ejq;
        Wed, 10 May 2023 03:31:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7EFmY1dkNrkTF0XQx7S7YxrzAwYkES7EZ+JVZmwDSpaUMob0oyoHQgaEPcvdph6FMlCwdW
X-Received: by 2002:a05:622a:c3:b0:3f2:b4c:84ac with SMTP id p3-20020a05622a00c300b003f20b4c84acmr25495944qtw.18.1683714716180;
        Wed, 10 May 2023 03:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683714716; cv=none;
        d=google.com; s=arc-20160816;
        b=dugkaReHH3Bj/TihagmsZ58N1MHIaCSQ9H0IL5EsXIZYUoj7Ysmt9m9x7tY8v73N+d
         DV4o/MyntADB8aZwj9ZSx6mFwfO0IiXOP8+oaWsqtL7G9FANNqJNuEu6eW8W4Uz9btO6
         +uhf16mRAevGj3u3Dqad9oaMTR/TAhlnS/B4IScTOGvyOnMFqelr/H8XEIG9c2ylUOr4
         Xr3FlUC0fQMxUfDdfwgtWUn0H8j5NFogsWBMbbAlYMzNhoMBQv/H7FQZbJO/S8YaGVLz
         kODFrU6BW9ewXV8c3qNIA/uNV3ZkXK7ZEToR4NTJwXh8JDQ/4WgQBMZ85TghV2uYI124
         riCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wa8bsD5M3brm06qvVTw533TqTWNTe4tyXT2fGV2y+vg=;
        b=SYp/3aWQUHZMaHJQhpRLqDWAUN5F6joFjKRzAL2UxOxwVUVYCjU1eMitIN+2xd1W2R
         XWKWmfnjNdpbj3M+1aPos2YxCA0vN6DXF2U4nqLdq4mk98WyE4LSNX/pkY2T4pkgJoM/
         lZ+fE51Buma9TE5kQ+ftJWcxhbzdPvILd/ABFZWf7uMpDcdpvel1VbNTj2eGZWZ2l/C1
         IFONsoUvv2uDjvPefEc4aWfQD+yE5etxqoRwDywWxy5y3rIvRabbqMtYE2r6rFQYCYsD
         I5kxh2d1VMi/ekLnlAZjA305ZRGFuqUz0hCB9dZ+HFbHWokgu+9JWBPJSnkK/dw8YS+P
         izug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=cxwGmzWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a05620a16ce00b0075790c13b71si1865499qkn.413.2023.05.10.03.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 May 2023 03:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=cxwGmzWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwh5q-0003hL-AC; Wed, 10 May 2023 06:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pwh5o-0003f3-MI; Wed, 10 May 2023 06:30:44 -0400
Received: from m12.mail.163.com ([220.181.12.214])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pwh5m-000892-JT; Wed, 10 May 2023 06:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wa8bs
 D5M3brm06qvVTw533TqTWNTe4tyXT2fGV2y+vg=; b=cxwGmzWxZdpA+Dq6i3WDT
 G7vYIkSjVHpy/tsZDhVxuGQQMV9c4ksyfoS8pciiTi6aPKTv+iyhGBtqxFuhqGvW
 xxwWWuSSVQoC1+HJOuuMIH/nFItnD1dZX4MJjQP6YyJQV//f2FkFFIQwRA8k6VeH
 IR5BrIF0DBh8rkMzX4Ir3A=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wBnkgAvcltk0WrrBQ--.23956S5;
 Wed, 10 May 2023 18:30:14 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v4 03/11] hw: allwinner-r40: Complete uart devices
Date: Wed, 10 May 2023 18:29:56 +0800
Message-Id: <20230510103004.30015-4-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510103004.30015-1-qianfanguijin@163.com>
References: <20230510103004.30015-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnkgAvcltk0WrrBQ--.23956S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw45ZrWrGw1UurW8ury5XFb_yoW5CFWDpr
 nIkrZ5GrWjg3W3ArW8Kws3ZrWSyF18GrnFy3W0ya13tF18Xr40vrW2qa1UGr43Krs3JFW3
 Xr95Gr42g3W2qwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_jjgDUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzhhr7WI0ZI07igAAse
Received-SPF: pass client-ip=220.181.12.214;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AYxRhIj4NlTI

From: qianfan Zhao <qianfanguijin@163.com>

R40 has eight UARTs, support both 16450 and 16550 compatible modes.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 31 ++++++++++++++++++++++++++++---
 include/hw/arm/allwinner-r40.h |  8 ++++++++
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 128c0ca470..537a90b23d 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -45,6 +45,13 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_CCU]        = 0x01c20000,
     [AW_R40_DEV_PIT]        = 0x01c20c00,
     [AW_R40_DEV_UART0]      = 0x01c28000,
+    [AW_R40_DEV_UART1]      = 0x01c28400,
+    [AW_R40_DEV_UART2]      = 0x01c28800,
+    [AW_R40_DEV_UART3]      = 0x01c28c00,
+    [AW_R40_DEV_UART4]      = 0x01c29000,
+    [AW_R40_DEV_UART5]      = 0x01c29400,
+    [AW_R40_DEV_UART6]      = 0x01c29800,
+    [AW_R40_DEV_UART7]      = 0x01c29c00,
     [AW_R40_DEV_GIC_DIST]   = 0x01c81000,
     [AW_R40_DEV_GIC_CPU]    = 0x01c82000,
     [AW_R40_DEV_GIC_HYP]    = 0x01c84000,
@@ -160,6 +167,10 @@ enum {
     AW_R40_GIC_SPI_UART1     =  2,
     AW_R40_GIC_SPI_UART2     =  3,
     AW_R40_GIC_SPI_UART3     =  4,
+    AW_R40_GIC_SPI_UART4     = 17,
+    AW_R40_GIC_SPI_UART5     = 18,
+    AW_R40_GIC_SPI_UART6     = 19,
+    AW_R40_GIC_SPI_UART7     = 20,
     AW_R40_GIC_SPI_TIMER0    = 22,
     AW_R40_GIC_SPI_TIMER1    = 23,
     AW_R40_GIC_SPI_MMC0      = 32,
@@ -387,9 +398,23 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
     }
 
     /* UART0. For future clocktree API: All UARTS are connected to APB2_CLK. */
-    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
-                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART0),
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    for (int i = 0; i < AW_R40_NUM_UARTS; i++) {
+        static const int uart_irqs[AW_R40_NUM_UARTS] = {
+            AW_R40_GIC_SPI_UART0,
+            AW_R40_GIC_SPI_UART1,
+            AW_R40_GIC_SPI_UART2,
+            AW_R40_GIC_SPI_UART3,
+            AW_R40_GIC_SPI_UART4,
+            AW_R40_GIC_SPI_UART5,
+            AW_R40_GIC_SPI_UART6,
+            AW_R40_GIC_SPI_UART7,
+        };
+        const hwaddr addr = s->memmap[AW_R40_DEV_UART0 + i];
+
+        serial_mm_init(get_system_memory(), addr, 2,
+                       qdev_get_gpio_in(DEVICE(&s->gic), uart_irqs[i]),
+                       115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
+    }
 
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index 3be9dc962b..959b5dc4e0 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -41,6 +41,13 @@ enum {
     AW_R40_DEV_CCU,
     AW_R40_DEV_PIT,
     AW_R40_DEV_UART0,
+    AW_R40_DEV_UART1,
+    AW_R40_DEV_UART2,
+    AW_R40_DEV_UART3,
+    AW_R40_DEV_UART4,
+    AW_R40_DEV_UART5,
+    AW_R40_DEV_UART6,
+    AW_R40_DEV_UART7,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
@@ -70,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)
  * which are currently emulated by the R40 SoC code.
  */
 #define AW_R40_NUM_MMCS         4
+#define AW_R40_NUM_UARTS        8
 
 struct AwR40State {
     /*< private >*/
-- 
2.25.1

