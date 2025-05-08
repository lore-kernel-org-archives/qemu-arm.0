Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp431949njb;
        Thu, 8 May 2025 06:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9e31yHFgKvJ7+bUURTFtKXYP36Qh/Jpgdgp6kOZHnXPQLgbJgd6rFQty6iw4NjaJ8yV5Wpi7ERDZhEg==@linaro.org
X-Google-Smtp-Source: AGHT+IHyXdFWVX+Qq/zWAk0v9VTSpbGsSA0Rpn8fxlxigYccyBTdqoM2C/k/o2ubIovObhikyXrN
X-Received: by 2002:a05:620a:1a18:b0:7c7:b4de:12f0 with SMTP id af79cd13be357-7caf73aa3f0mr1053975785a.32.1746711916501;
        Thu, 08 May 2025 06:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711916; cv=none;
        d=google.com; s=arc-20240605;
        b=bTYGfX/fglf2UqJ08fyAhH2z/3SeaIOeWch5niHoB8xh9EEWqWgwS7y4CX+zJBKi8E
         ZWuXlqjeoAyIfT1q7tBA+TtHVuLEdfUBdwKm6w4AGyHXjHWdLKKrkmcrcSTpRbRBRN6O
         XGElAZ95OoxKWbLKQ+lejnF5+dffw3t/jPjcV6iHfGQ5Jh/xEMQlilbRj9+XHvS/CS8v
         80AN/C0L4uoL/pj/lAAmAgSn4/gjZiF9+Nk84QigiTo3oMXV9OXQOtobyYvrJ1RRqb1Q
         O2xygMowmfSD5s8giJpSz05PM/r3pJ3pfyG+CPJrBAI1EQCGaPJeXxfZTQXahlsCqdwJ
         4kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J0A/U1sPooJ/zOn+77YMR3kP+UO0nbbTuEYORNZS6uE=;
        fh=0uvrV0Htp9Jw0VIOJEPpMFs8cKLI6KUR0zibL0B4NWo=;
        b=SNpaSiphC+a4/eU5e1zFjb0VYr4GJ7VNCKDZ7NKAn+BnKcFMpdFCRkdeZX8mqNXdoa
         TZuh3GSSwrHyFNimwThNIFzOLp3bQ1KBz+eJ/+OfkcQ2u5673KiWYnVtNdNNI5c5yzoC
         jMZJqJ4DJhe5lBpx1l5RyDQ/RtARYq1yn8ZXSMzavtga2B6GqXQFI1t7AIp6qGghBJp/
         2ZTBcSiIiaGSU7YwFO2UBrYJH2Puf5UsWrG5p291ADNoAHCpEC38ua3Gxc+WHnH6hWsl
         HXrJHLfOHO2Yti21XBUBOp5ep89sJbZ1gJYf93DvApZ+D9Y7dzzo8j+8x/wpS3Q6Y4vW
         O/Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLNNEGzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf751f146si448979585a.104.2025.05.08.06.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLNNEGzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Yg-0002I3-1Y; Thu, 08 May 2025 09:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Ye-0002GY-0u
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:45:04 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Yb-00050C-QM
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:45:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-739525d4e12so961171b3a.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711900; x=1747316700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0A/U1sPooJ/zOn+77YMR3kP+UO0nbbTuEYORNZS6uE=;
 b=jLNNEGzSqFJoGW4G6SrVMZ59JgdHaOJBBsjsYWp3tIzkt8oZ1NYNxGrkwd5CK6anbG
 2YG9ioGkc4jAxqetauvY87deEW6oEiaZbqZXCN84+8cTeMV229+E5IY0pz6fG4gYnUpA
 utZ/aC/bcbvVJvYf3EuepY1hlE96IrXCJIkz4kJMHklpznEqJhb7JtyaWADIBcnNZre/
 CpwxWPqwexuyEE92IBEjcy7d1+SpzxueYeqQdbybIFIeXnZUxBbt/CdMCF5jWPC/4oqR
 yD6B/yaiG5/pfXlFgBjEhWZAAMomws5DiyXu/JzYzpQyWLwqvA8L64RRr/OSGaiFAZng
 dtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711900; x=1747316700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0A/U1sPooJ/zOn+77YMR3kP+UO0nbbTuEYORNZS6uE=;
 b=NUQR6XaCUf6yywp08qV2dXqwIhwEXTzcYu0U7PZXKgSS0f4KO+Tr2T/kCcx8jJ8fYt
 MjIk/qZzOA/MgjUBADwCf38lXTxV7HNl7Cw/y2Uedn66wkKY5p3lBc4EdDUcroJ/XVz9
 fIMUAxj5YRHWvLbd3KygYphPf+QSHYhB7WDSDkVU1o5/72gUthdYppBv+Mp2VvRZV2P1
 kszXPl1nZ5xe6GNsZuFA0szh5yG5zA0986iDNaxL3mn9SWZ9C9tTqmr9pRobset34uVq
 WCVUbXe7EhBPw5PpZ4SKKS/EA91XlcZxbGmixTHQ4nQ1Y6V4lvUcdur9m7kuTHYSw89T
 fFSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2+dXFbVVq0IdHxN2vkzcHWnOxr2Ldk1bj7eeB1szVd+j1Hc/3MdX+BniWaCxtpCe80lQ5QhQ7SA==@nongnu.org
X-Gm-Message-State: AOJu0YxOMPngsasKI6gS0xPrUZI8gBgZbKDy7hpuJcjT26ZUD4hWtAQC
 ew0gNV9qJdNc6KKb+NMz/8OIukClQ5GjaB972Jo77J+w+Hh3H1U9LyWYe1wHROM=
X-Gm-Gg: ASbGncu6qNEzeoLvHVmsFf9tcEbNvPcMewHZVTWWj+HgkFQwo8QzckJMxxtfckzsIT9
 5LvEfrDDPHTXayx8V5rIvVkvw7QuIphVC+17dW1XyFf7yAJKNs//VXta8CHDxL0L+zRfp9/M9b8
 8EaKwAtjKCIL/BdrjV9Ng84SZeVp+NewUUSH9QANgrRhS7uFXxqUIflG8z+Edzay2WlT8V7aafm
 RZ0h+FKQ5GqWSPNorYvBVHmhJ0zG5H9Cb5VOuRFcyOEnYrfUw1UCzwSokAlQIqxzdSwi9reAYWD
 U5MfCp4x6t+rvtJ0KPREXrqZyq2gT8fD4ZRB/5aMB/Dd8NR1vSHeHhaoU8c4p1gPY/Bn3+LXRoH
 1IX9To8BxVc3WnE8=
X-Received: by 2002:a05:6a00:2791:b0:730:927c:d451 with SMTP id
 d2e1a72fcca58-7409cfd813dmr10943548b3a.20.1746711900247; 
 Thu, 08 May 2025 06:45:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-740590a489asm13619132b3a.170.2025.05.08.06.44.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:44:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 24/27] hw/intc/ioapic: Remove IOAPICCommonState::version
 field
Date: Thu,  8 May 2025 15:35:47 +0200
Message-ID: <20250508133550.81391-25-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jEeUWJttAnZS

The IOAPICCommonState::version integer was only set
in the hw_compat_2_7[] array, via the 'version=0x11'
property. We removed all machines using that array,
lets remove that property, simplify by only using the
default version (defined as IOAPIC_VER_DEF).

For the record, this field was introduced in commit
20fd4b7b6d9 ("x86: ioapic: add support for explicit EOI"):

 >   Some old Linux kernels (upstream before v4.0), or any released RHEL
 >   kernels has problem in sending APIC EOI when IR is enabled.
 >   Meanwhile, many of them only support explicit EOI for IOAPIC, which
 >   is only introduced in IOAPIC version 0x20. This patch provide a way
 >   to boost QEMU IOAPIC to version 0x20, in order for QEMU to correctly
 >   receive EOI messages.
 >
 >   Without boosting IOAPIC version to 0x20, kernels before commit
 >   d32932d ("x86/irq: Convert IOAPIC to use hierarchical irqdomain
 >   interfaces") will have trouble enabling both IR and level-triggered
 >   interrupt devices (like e1000).
 >
 >   To upgrade IOAPIC to version 0x20, we need to specify:
 >
 >     -global ioapic.version=0x20
 >
 >   To be compatible with old systems, 0x11 will still be the default
 >   IOAPIC version. Here 0x11 and 0x20 are the only versions to be
 >   supported.
 >
 >   One thing to mention: this patch only applies to emulated IOAPIC. It
 >   does not affect kernel IOAPIC behavior.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 hw/intc/ioapic_internal.h |  3 +--
 hw/intc/ioapic.c          | 18 ++----------------
 hw/intc/ioapic_common.c   |  2 +-
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/hw/intc/ioapic_internal.h b/hw/intc/ioapic_internal.h
index 51205767f44..330ce195222 100644
--- a/hw/intc/ioapic_internal.h
+++ b/hw/intc/ioapic_internal.h
@@ -82,7 +82,7 @@
 #define IOAPIC_ID_MASK                  0xf
 
 #define IOAPIC_VER_ENTRIES_SHIFT        16
-
+#define IOAPIC_VER_DEF                  0x20
 
 #define TYPE_IOAPIC_COMMON "ioapic-common"
 OBJECT_DECLARE_TYPE(IOAPICCommonState, IOAPICCommonClass, IOAPIC_COMMON)
@@ -104,7 +104,6 @@ struct IOAPICCommonState {
     uint32_t irr;
     uint64_t ioredtbl[IOAPIC_NUM_PINS];
     Notifier machine_done;
-    uint8_t version;
     uint64_t irq_count[IOAPIC_NUM_PINS];
     int irq_level[IOAPIC_NUM_PINS];
     int irq_eoi[IOAPIC_NUM_PINS];
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 133bef852d1..5cc97767d9d 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -315,7 +315,7 @@ ioapic_mem_read(void *opaque, hwaddr addr, unsigned int size)
             val = s->id << IOAPIC_ID_SHIFT;
             break;
         case IOAPIC_REG_VER:
-            val = s->version |
+            val = IOAPIC_VER_DEF |
                 ((IOAPIC_NUM_PINS - 1) << IOAPIC_VER_ENTRIES_SHIFT);
             break;
         default:
@@ -411,8 +411,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         }
         break;
     case IOAPIC_EOI:
-        /* Explicit EOI is only supported for IOAPIC version 0x20 */
-        if (size != 4 || s->version != 0x20) {
+        if (size != 4) {
             break;
         }
         ioapic_eoi_broadcast(val);
@@ -444,18 +443,10 @@ static void ioapic_machine_done_notify(Notifier *notifier, void *data)
 #endif
 }
 
-#define IOAPIC_VER_DEF 0x20
-
 static void ioapic_realize(DeviceState *dev, Error **errp)
 {
     IOAPICCommonState *s = IOAPIC_COMMON(dev);
 
-    if (s->version != 0x11 && s->version != 0x20) {
-        error_setg(errp, "IOAPIC only supports version 0x11 or 0x20 "
-                   "(default: 0x%x).", IOAPIC_VER_DEF);
-        return;
-    }
-
     memory_region_init_io(&s->io_memory, OBJECT(s), &ioapic_io_ops, s,
                           "ioapic", 0x1000);
 
@@ -476,10 +467,6 @@ static void ioapic_unrealize(DeviceState *dev)
     timer_free(s->delayed_ioapic_service_timer);
 }
 
-static const Property ioapic_properties[] = {
-    DEFINE_PROP_UINT8("version", IOAPICCommonState, version, IOAPIC_VER_DEF),
-};
-
 static void ioapic_class_init(ObjectClass *klass, const void *data)
 {
     IOAPICCommonClass *k = IOAPIC_COMMON_CLASS(klass);
@@ -493,7 +480,6 @@ static void ioapic_class_init(ObjectClass *klass, const void *data)
      */
     k->post_load = ioapic_update_kvm_routes;
     device_class_set_legacy_reset(dc, ioapic_reset_common);
-    device_class_set_props(dc, ioapic_properties);
 }
 
 static const TypeInfo ioapic_info = {
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index fce3486e519..8b3e2ba9384 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -83,7 +83,7 @@ static void ioapic_print_redtbl(GString *buf, IOAPICCommonState *s)
     int i;
 
     g_string_append_printf(buf, "ioapic0: ver=0x%x id=0x%02x sel=0x%02x",
-                           s->version, s->id, s->ioregsel);
+                           IOAPIC_VER_DEF, s->id, s->ioregsel);
     if (s->ioregsel) {
         g_string_append_printf(buf, " (redir[%u])\n",
                                (s->ioregsel - IOAPIC_REG_REDTBL_BASE) >> 1);
-- 
2.47.1

