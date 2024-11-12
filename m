Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7486252njc;
        Tue, 12 Nov 2024 09:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTBPs5V9jysCHluEnwJ49RdmBcH/SX8j5HTzMCJsfoXK5AOSZPSkTqNzmSqbEL/dnGmvk1EYgLtEwS5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHMxl/YOpeZmkzjohjq9MZLdasOYBQUtBj+IjjXaQZuY6fX94GQD5QUaTCYyNRIXQdNnAQq
X-Received: by 2002:a05:622a:4e8a:b0:461:6167:de32 with SMTP id d75a77b69052e-46309416019mr196338061cf.54.1731431066854;
        Tue, 12 Nov 2024 09:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731431066; cv=none;
        d=google.com; s=arc-20240605;
        b=N9G98r5O767AfVfc0efkJNciyLF6poPYPTLkwYRyzvmbcXziUcxBp8FmryHnPQM6Io
         U9GfhYPiYzMUk38i5eGuQk4n3jmqLswm7/QwFuq3E8k4+/QyAWzxt1/n0POeRIxrv7PW
         ZRQWT8ULkt3ZTrYAaRCXFjQnM1LZ8RhDzh5tDuuUTZqEOBrMooRazMWfB2ZiAFzHQ61v
         M902NX8jIDgtw1pr686Ar8tLD18dRwvcSTC8OLp40UTVbGBvbSBiUd8EH8CeDlxdk0I1
         mAIk58Cf1zOilVUj0fHeIbFLFSkF+FNLg4QkMn5rDdEqpx6GeEoDastMsMwnj07naUwz
         1Esg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XnAhVVFjjEa9AE7qgj063mddus/nht38lXKcvLgTu8c=;
        fh=qlhsbDsFfPbTqkQoyyWXX2TjxvfjQWlHXC7D72EGa80=;
        b=GJwvH2aFGw4pwG98yHYH0VaT3Luu6T1JMaQsQ3ghZp0VKx72FRUkB7fMcIx4IXqohL
         dSKREVhn0kGyBXueKEQyzDicEye0Fh0jcZXlsyma0wEuLiwr/g2ZZRc1XIlw8OyIhKV+
         mRcXLfHyMmWjnStD42pXoHIFLv/G9s9CQa9DzuFENSVvxoxaQE1D736BVlosz4JPgJOU
         jBhNtFv1symxbo9EZTEX0iZxwjCqAAhXLrS+nUgnaIo4cHKiYGOu1p1sRH05NMlfDc4M
         FVdbVew/Zc8C0Gjz/5Gtn+G8lyziy7bIvRJgXQ2e/x+6huw9rP9RiMVYO9bjvPxH+EUZ
         QjMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=k9R8IPfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40fdb4si147748171cf.37.2024.11.12.09.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 09:04:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=k9R8IPfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAuIg-0003gE-MG; Tue, 12 Nov 2024 12:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuHW-0003Bo-8h; Tue, 12 Nov 2024 12:02:22 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuHU-0001SK-IR; Tue, 12 Nov 2024 12:02:21 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7ed9c16f687so4038401a12.0; 
 Tue, 12 Nov 2024 09:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731430938; x=1732035738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XnAhVVFjjEa9AE7qgj063mddus/nht38lXKcvLgTu8c=;
 b=k9R8IPfLQdy5F0tA2ZuMTVRUuW7P0+ouZ/RqL/JyDXzhF3w1gfvD7C+7dTCbEaG0mu
 GDBfbNPpPD3gQYQiWiPdeND1oLE6/MDV/k7YV1sDNyBJBIkwnokfGf04R1JEUUXjOopM
 iBBnoA0F9cjoZ4b8asKMAwMjyEMhuluZN/RIM/pPcTOIgxvmCpbcemGROyS+8IEPNCEc
 rRAl91MR9ANwvv6Xg8FFy2fkslYyUj76Ntyd08cDPSu3DkBNjao2cQILaNlb140pgeh1
 HMXL3tibq1XLyZyaqpgfv5w38HJkQl2i7wLi23MaoWuylXTbJt8CLUftzJX0BF7SSJ8y
 OaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731430938; x=1732035738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XnAhVVFjjEa9AE7qgj063mddus/nht38lXKcvLgTu8c=;
 b=RkKX6+3RoIfId0leg+DNFHb6NrE5gIYtCcedwJmRo2Ye9Je+37vUCYF5fZKtE0uEBc
 mDk+rNRv11WPkrFvB9Z5o2vhVEQnKVbC6Tv7H3KDrjeyijC4BtG+NzgDkl4hFmOzm6u0
 0wbY31mVwOi9barRMhjG4+yEEmAf3lQdtEO19gVa3l+e7FvwQlLusxBPE0jH3QIxUuoB
 fuHP/BgseBkUCUExnDaV8ESggf4HvDXJPLputCX64sXYN3v6tP3lnnK32IYX4PjARFoT
 cIf8mVf6BTXESJqqrId8jlcYesgEbrsAytepw9uEhAtCLSsyO8D+fEaXQYZ549EKwKFj
 /HiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/4Hnkt7L9Y41PeSHs6yRIbsA0AvZhcFNHoovPHe4DS4WDfBAsWmESDREFvzX5fvXaGd1ff8ZsA==@nongnu.org
X-Gm-Message-State: AOJu0Yw1n5SiM9uYMbOcUVBYq1Bt3Y0whFejxpyTcVeqHTqpe1F4SAbg
 D3UJkstWJGptxWHQJAnslJF/MnTMSXkSAcRZ8YxZN/R1AkHiMpvhBULBWQ==
X-Received: by 2002:a17:90b:3a90:b0:2e2:cd80:4d44 with SMTP id
 98e67ed59e1d1-2e9b172b03amr22530782a91.28.1731430938259; 
 Tue, 12 Nov 2024 09:02:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9a5f5e57fsm10814294a91.14.2024.11.12.09.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 09:02:17 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [RESEND PATCH 02/10] usb/uhci: Introduce and use register defines
Date: Tue, 12 Nov 2024 09:01:44 -0800
Message-ID: <20241112170152.217664-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112170152.217664-1-linux@roeck-us.net>
References: <20241112170152.217664-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=groeck7@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Sapdxvo7tc5b

Introduce defines for UHCI registers to simplify adding register access
in subsequent patches of the series.

No functional change.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since RFC:
- Rebased to v9.1.0-1673-g134b443512
- Added Reviewed-by: tag

 hw/usb/hcd-uhci.c          | 32 ++++++++++++++++----------------
 include/hw/usb/uhci-regs.h | 11 +++++++++++
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 50d488d6fb..bdab9ac37e 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -389,7 +389,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
     trace_usb_uhci_mmio_writew(addr, val);
 
     switch (addr) {
-    case 0x00:
+    case UHCI_USBCMD:
         if ((val & UHCI_CMD_RS) && !(s->cmd & UHCI_CMD_RS)) {
             /* start frame processing */
             trace_usb_uhci_schedule_start();
@@ -424,7 +424,7 @@ static void uhci_port_write(void *opaque, hwaddr addr,
             }
         }
         break;
-    case 0x02:
+    case UHCI_USBSTS:
         s->status &= ~val;
         /*
          * XXX: the chip spec is not coherent, so we add a hidden
@@ -435,27 +435,27 @@ static void uhci_port_write(void *opaque, hwaddr addr,
         }
         uhci_update_irq(s);
         break;
-    case 0x04:
+    case UHCI_USBINTR:
         s->intr = val;
         uhci_update_irq(s);
         break;
-    case 0x06:
+    case UHCI_USBFRNUM:
         if (s->status & UHCI_STS_HCHALTED) {
             s->frnum = val & 0x7ff;
         }
         break;
-    case 0x08:
+    case UHCI_USBFLBASEADD:
         s->fl_base_addr &= 0xffff0000;
         s->fl_base_addr |= val & ~0xfff;
         break;
-    case 0x0a:
+    case UHCI_USBFLBASEADD + 2:
         s->fl_base_addr &= 0x0000ffff;
         s->fl_base_addr |= (val << 16);
         break;
-    case 0x0c:
+    case UHCI_USBSOF:
         s->sof_timing = val & 0xff;
         break;
-    case 0x10 ... 0x1f:
+    case UHCI_USBPORTSC1 ... UHCI_USBPORTSC4:
         {
             UHCIPort *port;
             USBDevice *dev;
@@ -493,28 +493,28 @@ static uint64_t uhci_port_read(void *opaque, hwaddr addr, unsigned size)
     uint32_t val;
 
     switch (addr) {
-    case 0x00:
+    case UHCI_USBCMD:
         val = s->cmd;
         break;
-    case 0x02:
+    case UHCI_USBSTS:
         val = s->status;
         break;
-    case 0x04:
+    case UHCI_USBINTR:
         val = s->intr;
         break;
-    case 0x06:
+    case UHCI_USBFRNUM:
         val = s->frnum;
         break;
-    case 0x08:
+    case UHCI_USBFLBASEADD:
         val = s->fl_base_addr & 0xffff;
         break;
-    case 0x0a:
+    case UHCI_USBFLBASEADD + 2:
         val = (s->fl_base_addr >> 16) & 0xffff;
         break;
-    case 0x0c:
+    case UHCI_USBSOF:
         val = s->sof_timing;
         break;
-    case 0x10 ... 0x1f:
+    case UHCI_USBPORTSC1 ... UHCI_USBPORTSC4:
         {
             UHCIPort *port;
             int n;
diff --git a/include/hw/usb/uhci-regs.h b/include/hw/usb/uhci-regs.h
index fd45d29db0..5b81714e5c 100644
--- a/include/hw/usb/uhci-regs.h
+++ b/include/hw/usb/uhci-regs.h
@@ -1,6 +1,17 @@
 #ifndef HW_USB_UHCI_REGS_H
 #define HW_USB_UHCI_REGS_H
 
+#define UHCI_USBCMD       0
+#define UHCI_USBSTS       2
+#define UHCI_USBINTR      4
+#define UHCI_USBFRNUM     6
+#define UHCI_USBFLBASEADD 8
+#define UHCI_USBSOF       0x0c
+#define UHCI_USBPORTSC1   0x10
+#define UHCI_USBPORTSC2   0x12
+#define UHCI_USBPORTSC3   0x14
+#define UHCI_USBPORTSC4   0x16
+
 #define UHCI_CMD_FGR      (1 << 4)
 #define UHCI_CMD_EGSM     (1 << 3)
 #define UHCI_CMD_GRESET   (1 << 2)
-- 
2.45.2

