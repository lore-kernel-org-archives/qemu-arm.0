Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2288745njb;
        Mon, 7 Oct 2024 18:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCbrtWPXKQ65EXlYp8pZsE+eFTmZcMMvP+/jpcKuwd96P8MDCz9EoYCjiIB09hx2hB+s+c1GdvljOZ/g==@linaro.org
X-Google-Smtp-Source: AGHT+IE4ISib4vqhfU4baqaRgKoaePB6+SylqNW4gVCUN9cGOmlQUHFboOkaHXW6TWATcmlySIC4
X-Received: by 2002:a05:622a:454:b0:45d:8bd7:126e with SMTP id d75a77b69052e-45d9bb5ae8emr190458291cf.47.1728350444915;
        Mon, 07 Oct 2024 18:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350444; cv=none;
        d=google.com; s=arc-20240605;
        b=IqsdrvD4NAw6Jfn1EQCSdfLLxuvFaLYvbmpMeeEGH0TZaG/QNEAVCzE+Cvj5+/EqNX
         2UcEZ1Y9g70imxxdfSQcv+RvqoDo4BGSBt3Zs6JRGANM5mPUeo3cEtq4RxkEskusiM9T
         X5RYSp57ImFgBxlYG+11BuYUXeWeIc40I8jcX7p0h+lc5TUGyhmK59EDipJ3Yh39CXU9
         8zNvc+TlDlakudqDRlng/vet7NSIBdoes+ZyNglpcL2LbOST44OUZtMqJt9cAQizSCzD
         0cAU1emLxUKeyAQRbVXT7UdQZIM9p1PddPyHk7O9F6gKhSNUkWnhJ4JakM/5p5TtscNO
         CABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=PbhHf80sfK7VkwcTgOuxP6owcvc4suokU3ESxbdaOWI=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=EaEIRQUBHN+rSbSfRy1RIOIf/8httrX3C5C4MC5rfTczdFp2JAY7Iq/ni+McTMaFrK
         IqedjfPE1e9cRLzmT++eBrMX6Qkzk34NfeHNttXaCj2N15g1gsM2Z+ugqQ95mNrdhTQS
         rdqfyyee0Lpu9VHSF1LnyMyrIPALcs8PzV7WxTazqTQtjBiXEGp7a01G7H4ZCdPjYsQV
         5Hphl5zU4MjnLz6VOa4iP9kPov5miFzFSgXRdrJQyCWREkgZB45FboEYrdNcI39Vvpwr
         0YUBqBIf7f86scObU3w0VX25GZCMnOQfbT7Ef8p4HqQUw1jAFcNFBb2aGmVKhPKdPlNz
         1t9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WgGt88eQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae756618ecsi791070285a.287.2024.10.07.18.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WgGt88eQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxytZ-0002rE-CB; Mon, 07 Oct 2024 21:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l4gEZwUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxysp-0007zn-PW
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:30 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l4gEZwUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxysj-0000BC-JA
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:25 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71e026caf8bso2116843b3a.2
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350360; x=1728955160; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PbhHf80sfK7VkwcTgOuxP6owcvc4suokU3ESxbdaOWI=;
 b=WgGt88eQPJb2pCn/luNNOQS7IZiQNXsYfB2Q2Eid9GioGVOAfmDz6BkQpcgX/cOcqB
 2lZvHzgtfzBJh2hTjuLDmuK2gLkk15xaToXDDL7iBUi2sLFkpDxZ4pP5fFZJXCxAbeir
 UTzyvwb9mB7zmjaOxoco4L2htsp0SaSv6BvMqSeT+7JcPmwGT2eDXPEe/3tn0ire7VuA
 mpGMXbSruxgXc1ac/Wixaf3WCZzexuijkccozTnlHtLl72RSqy3hzdGDAIOziZoK9Elp
 iQX/ULPl8vW6Eg9dYGpxTenGxLzNXZCQAEmX8tjTSYo3yxTuP0GZpCIKM98wbW31iyoJ
 iMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350360; x=1728955160;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbhHf80sfK7VkwcTgOuxP6owcvc4suokU3ESxbdaOWI=;
 b=WzRA9zyHtg+Sdi2YrrHVk89NViV+7e0JaPgNUZ8dEnubFMlQid2ABvz6diHsxg0PL0
 VAITnSN92uqZqBD3Ig7e3uYJtotsgVfRS8E1WmRIAN5y6Jz00Z6NFo/jm0kknJRApasV
 1iBmLjiG6nLZ9xYkcultHSm0snBO6HzvS1n71oTJ3jsPCAnvMXj64oZxZfTockEWgMRu
 AEhPhYzbRY6BB8JNV9Z6B971rA38YDB/FFLqaZ2Fyky7cilRQBRkSOT4ZPkfqh1WOChS
 ScgMz6dyWdT36eLOUZXVY7f4jO4C8kyp8Q9r9XE3P7Q+IKkupBdRnrElRxltfFwouMke
 NDWw==
X-Gm-Message-State: AOJu0YzAwTKmkWsJ30YD//dN5KU5/SgRqPwW9Qfqw61/Zp940A+KUpeo
 NW0uI0Tig+yOb1x0JieFJ9a4cWyQNB4wvZHAZcMHvNSji1pAO8fuAs6FOhmfC/1ljVnDgFmAUA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:7687:b0:71d:fb06:e79b
 with SMTP id
 d2e1a72fcca58-71dfb06ea3amr14561b3a.0.1728350359669; Mon, 07 Oct 2024
 18:19:19 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:40 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-15-tavip@google.com>
Subject: [PATCH v2 14/25] hw/arm: add RT595-EVK board
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3l4gEZwUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 0y/cCtK3jLFT

Add basic support for the RT595-EVK board, enough to be able to run
the NXP's microXpresso SDK hello world example.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/rt595-evk.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig     |  5 ++++
 hw/arm/meson.build |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 hw/arm/rt595-evk.c

diff --git a/hw/arm/rt595-evk.c b/hw/arm/rt595-evk.c
new file mode 100644
index 0000000000..4f875a0b12
--- /dev/null
+++ b/hw/arm/rt595-evk.c
@@ -0,0 +1,64 @@
+/*
+ * i.MX RT595 EVK
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "elf.h"
+#include "exec/address-spaces.h"
+#include "hw/loader.h"
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "qemu/log.h"
+#include "hw/arm/armv7m.h"
+#include "hw/arm/boot.h"
+#include "qapi/error.h"
+#include "hw/arm/rt500.h"
+#include "hw/qdev-clock.h"
+#include "sysemu/reset.h"
+
+static void rt595_evk_reset(MachineState *ms, ResetType reason)
+{
+    /*
+     * CPU reset is not done by default, we need to do it manually when the
+     * machine is reset.
+     */
+    cpu_reset(first_cpu);
+
+    qemu_devices_reset(reason);
+}
+
+static void rt595_evk_init(MachineState *ms)
+{
+    RT500State *s;
+    Clock *sysclk;
+
+    sysclk = clock_new(OBJECT(ms), "SYSCLK");
+    clock_set_hz(sysclk, 200000000);
+
+    s = RT500(object_new(TYPE_RT500));
+    qdev_connect_clock_in(DEVICE(s), "sysclk", sysclk);
+    object_property_add_child(OBJECT(ms), "soc", OBJECT(s));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
+
+    if (ms->kernel_filename) {
+        armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, 0);
+    }
+}
+
+static void rt595_evk_machine_init(MachineClass *mc)
+{
+    mc->desc  = "RT595 EVK Machine (ARM Cortex-M33)";
+    mc->init  = rt595_evk_init;
+    mc->reset = rt595_evk_reset;
+
+    mc->ignore_memory_transaction_failures = true;
+}
+
+DEFINE_MACHINE("rt595-evk", rt595_evk_machine_init);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5bc9438945..86d704cf1b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -636,3 +636,8 @@ config RT500
     select RT500_CLKCTL
     select FLEXSPI
     select RT500_RSTCTL
+
+config RT595_EVK
+    bool
+    default y
+    select RT500
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index a2b20617c9..48ae30acef 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,6 +61,7 @@ arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-pvh.c',
 ))
 arm_ss.add(when: 'CONFIG_RT500', if_true: files('rt500.c'))
+arm_ss.add(when: 'CONFIG_RT595_EVK', if_true: files('rt595-evk.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
-- 
2.47.0.rc0.187.ge670bccf7e-goog

