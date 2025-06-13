Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2680962njc;
        Thu, 12 Jun 2025 17:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3WUKt9KIXC9w/VRwKx59hSYM/tjhzNNOM3GSXyXnZT7OAWwU/ocHLcsmu48f7eELSYvCgjVM76Zq45A==@linaro.org
X-Google-Smtp-Source: AGHT+IFsoKtSnNUJW3BuhG7SjOSUC6oxXbw5cGtuE/ui9G4aGlwziZ0m9tJvBMIbfR2UxxH9G9Rc
X-Received: by 2002:a05:622a:5a89:b0:49d:89bf:2982 with SMTP id d75a77b69052e-4a72fe92ce3mr19766431cf.17.1749773222479;
        Thu, 12 Jun 2025 17:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773222; cv=none;
        d=google.com; s=arc-20240605;
        b=EBogI40BiSLgCVu7Z4auMflg20kenTYIiGeAZQGWSZUvsk6OunLszldrSu1NAdGWhV
         nEtI481fnZEGrnMds1dPjctdotNOMG51bNnc4VxtEpMHJZPfbXC9d4zgQEnY4BZ+B1Zs
         Zyd5XJy8B5AM0+/D8vs7uo4K2MNTGbNpSnADblXmH4GYE1f3zt6GATfLRd34n7P59vBY
         8s8Xhu7awMYqkVFmPzqchByr3MT8kuBlU07aYHlUCM6N9roBKBNVBJPp/gdh0rbW0V5M
         EgHebD9QVmHIVjrTpIXBtO+FXwBAzL++i5SuDk8sb9DbSkbPPGxrZBzk99kimOMA8kUa
         sTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=IFNo7OhYkVhWHM6SQDIAUQfEPwpaNIWcaew9uihGsFg=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=CJ8+vMN7MBGXAiSsYxtBRBYCb6PRmHmmWrSWMPp0dEgfSilCrQKx5r9Cgav/MhxQkX
         BEffBXuPA89nxZwAB3qIqEmOvoU/1fMj44AWXKACCnk360jQ6v3xTCvdLvAPh7nV0X/Z
         QmttxR39wqajnKKA1dIVnBnNvKoZouZa9jjrMjzkYZ+HJRc9hzJM93Djo5tdf/nZR20c
         BATeySbk7yKbk8QuTKZiZgUMnB+3fXBIRn4FlEM6S+45h486CSgAv3ZLf4Mpq+OBDJ+w
         5ktzUgWc8MqBiEfK9np3fkE3I3GBbWYOv9V/SncrqqgeWNtEREsUdcR/uSVfMEFteZ9q
         KAYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="xYzK8/eR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4af9e6si18489141cf.304.2025.06.12.17.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="xYzK8/eR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPrwB-00074P-Og; Thu, 12 Jun 2025 20:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C2tLaAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1uPruL-0005rd-AE
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:33 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C2tLaAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1uPruI-0000aN-FN
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:32 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b26e73d375aso1444108a12.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773068; x=1750377868; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IFNo7OhYkVhWHM6SQDIAUQfEPwpaNIWcaew9uihGsFg=;
 b=xYzK8/eRnulGq8Vq4ieSqByHu+l2ILJYN4o7sMHTU7o40s9CfRyutMvh4CvmwSHjbE
 twqWoIHbMNsvFFMPVaKYdTVqY6Fr3Yer8pn72dGogV48W80+lCzFwxZNxtZYDmXlJNzU
 /S0NltdyQi3+9tck/Yl3SRqaGhdeRpJ+hxkR75FlMZxBh1abziQ+v3QBqugtPCbS5J3e
 2pJ4Z7wNGBhNqt+dCdCfpcRNjD0jqQ1XbY8Zl8y9TmsB0B6FOhO8iKXT+eHesc6ZHRx7
 SxSroErzWQ20l/HkPot6fAqJ1nJDje0lhFZoe+ZXKG9gsfTP2QEQ1qaWNBkatdUi4InX
 xuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773068; x=1750377868;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IFNo7OhYkVhWHM6SQDIAUQfEPwpaNIWcaew9uihGsFg=;
 b=Nn6s/GHP8lB5Tq6Y/+Y7qTFvOCObq5pxk6Wmj22UYQO7FHajuYl18fDjonZcgPs3x6
 Yd9DBadieqsnWnaGnAhc/auU4djgxC9YHEB0b38L8LIfF1w5AGREV2Yw6JMdB/fF+xYp
 oIXAO80euQ/AW0cpiU6U73R3Z2Eyfr+Ist9u6m00uj0RUhuHckDSssae5H78Mfd42/TN
 h3UjIK9eXUV6bunwK7NlzeTYhGqhXkfl7PjRVm6NOTEngpaGxo41Lt99M1YHaB2YRb6k
 5qYl5/wxAhC8bQoUO7mmjPP/dja3b0IlGfL1vGGwmtkl4OE8OTuGLDNUkpkw/Lya9QGP
 J2/g==
X-Gm-Message-State: AOJu0Yx/PPXL8bxSKRtsrnWWgxR5lieQAM4AyJaXB+rUm7c6w57JG3ql
 zb/nHWCxwEzq/QkELHEO3SAyVxpUmv+2+/V352aSO3C+JM3RfIewT58cWO6TcG480KNLhzstbVK
 s6CWIwN4D/HftftiPrOcE0q4m4eC8Tv2rus98oAyQ5S51VGtJPovj/ISyTXxkOJmmFdIYJS7Qx6
 Kd6/AU2HHkx6XYbi61o5rTpMLWLq2YsgnaVwoTGunF
X-Received: from pgbda8.prod.google.com ([2002:a05:6a02:2388:b0:b2c:4d7e:b626])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3994:b0:20b:a75e:fa32
 with SMTP id adf61e73a8af0-21facf126aamr1382432637.40.1749773067968; Thu, 12
 Jun 2025 17:04:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:03 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-12-komlodi@google.com>
Subject: [PATCH 11/19] hw/i3c/dw-i3c: Add IRQ MMIO behavior
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3C2tLaAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Yy/z7ywK8HZI

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i3c/dw-i3c.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index ecd79aba8c..c58e12964c 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/irq.h"
 
 REG32(DEVICE_CTRL,                  0x00)
     FIELD(DEVICE_CTRL, I3C_BROADCAST_ADDR_INC,    0, 1)
@@ -352,6 +353,46 @@ static const uint32_t dw_i3c_ro[DW_I3C_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0xffffffff,
 };
 
+static void dw_i3c_update_irq(DWI3C *s)
+{
+    bool level = !!(s->regs[R_INTR_SIGNAL_EN] & s->regs[R_INTR_STATUS]);
+    qemu_set_irq(s->irq, level);
+}
+
+static uint32_t dw_i3c_intr_status_r(DWI3C *s)
+{
+    /* Only return the status whose corresponding EN bits are set. */
+    return s->regs[R_INTR_STATUS] & s->regs[R_INTR_STATUS_EN];
+}
+
+static void dw_i3c_intr_status_w(DWI3C *s, uint32_t val)
+{
+    /* INTR_STATUS[13:5] is w1c, other bits are RO. */
+    val &= 0x3fe0;
+    s->regs[R_INTR_STATUS] &= ~val;
+
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_intr_status_en_w(DWI3C *s, uint32_t val)
+{
+    s->regs[R_INTR_STATUS_EN] = val;
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_intr_signal_en_w(DWI3C *s, uint32_t val)
+{
+    s->regs[R_INTR_SIGNAL_EN] = val;
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_intr_force_w(DWI3C *s, uint32_t val)
+{
+    /* INTR_FORCE is WO, just set the corresponding INTR_STATUS bits. */
+    s->regs[R_INTR_STATUS] = val;
+    dw_i3c_update_irq(s);
+}
+
 static uint64_t dw_i3c_read(void *opaque, hwaddr offset, unsigned size)
 {
     DWI3C *s = DW_I3C(opaque);
@@ -365,6 +406,9 @@ static uint64_t dw_i3c_read(void *opaque, hwaddr offset, unsigned size)
     case R_INTR_FORCE:
         value = 0;
         break;
+    case R_INTR_STATUS:
+        value = dw_i3c_intr_status_r(s);
+        break;
     default:
         value = s->regs[addr];
         break;
@@ -409,6 +453,18 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case R_RESET_CTRL:
         break;
+    case R_INTR_STATUS:
+        dw_i3c_intr_status_w(s, val32);
+        break;
+    case R_INTR_STATUS_EN:
+        dw_i3c_intr_status_en_w(s, val32);
+        break;
+    case R_INTR_SIGNAL_EN:
+        dw_i3c_intr_signal_en_w(s, val32);
+        break;
+    case R_INTR_FORCE:
+        dw_i3c_intr_force_w(s, val32);
+        break;
     default:
         s->regs[addr] = val32;
         break;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

