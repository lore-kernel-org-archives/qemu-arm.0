Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8328080ejb;
        Wed, 4 Jan 2023 14:46:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuAaCHffyv6OKXEAE4Ebyi4e+tZ9toAzxrkKM48iv5di2FwMlYChUJGUYaep+QrU5TtZlZk
X-Received: by 2002:a05:622a:1927:b0:3a7:ec54:cfa2 with SMTP id w39-20020a05622a192700b003a7ec54cfa2mr68024407qtc.56.1672872408020;
        Wed, 04 Jan 2023 14:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672872408; cv=none;
        d=google.com; s=arc-20160816;
        b=QhWru9d1//zcU9vfEq7oSh1ct5pHOb5HWgNF7cuFqydwLlUAh8OfY4H7fX3ySj2qWA
         v8VADnPvznNowqmMVOTmWGrdwKVhZvLoEbKUB+nGQO+e6kpdR+ZgZoG3oDSUUY7rDZ5Y
         vCmQ7Uaa2Lz199R/0VggMh1SGoQiJ+DWnMwTuNqMfBTVx4Fwu8FbZnlXFo+CtjN4Kp/6
         vRBCxsy88lgBhCHHTsvHQT6/AJaNqCh0s+oIGhfmyPdG4eSd7U8vnLJa5otjTSb1yDGH
         Waz2uCBMh1oayPTef5YGCs8/B6gh3n5IhZ+m+AoEjHRj8ZOUABkBwsMjsoqshwcZ2y1s
         IKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zslv5ettm0BZ6lahZKOwlTaXvhF8s2DyuA1mWPRzCMs=;
        b=oS7xFdNP8ykmJDr9PYXx8f8+Fqrflo8TTnL/4xwU502UeyMfEVjl8FCvImwYwyJ++8
         v9UdGuWNR9O9nOIe/k6r/xLLgnTTVeMtqpbs9RHAY4DTvJJTGX1eEsOJ9BvYNlTMknNB
         1CsU15flb8bWeHihijxhz2G2q2WLOf5npc/rf0q/kPNJdMuxmuE9x+kTd05ihD0YdbIJ
         UxObzxnDceGyxArYz7/5MGHfh6b4hCZVWyGH8BdFJsC/9GNYAOhZdqmnzsLuNpgO9e0S
         hjGOavwDzPkX6tf7XKRr3yGihXzMOx62qoP8iI0MyeDTl9yMERftG/wLgcbm26iZNbnm
         mGBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nxbffoqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br10-20020a05622a1e0a00b003a69eb226casi18455278qtb.54.2023.01.04.14.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nxbffoqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBv3-00023S-GL; Wed, 04 Jan 2023 17:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuJ-0001sM-Go
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:06:58 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuG-0005al-QQ
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:06:47 -0500
Received: by mail-ej1-x62c.google.com with SMTP id u19so85929289ejm.8
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zslv5ettm0BZ6lahZKOwlTaXvhF8s2DyuA1mWPRzCMs=;
 b=NxbffoqprVv6NlWkQCdargfgN3AeDlp6F+mpEaeWmQJ9ILjz/zFWD5ly8WRoPmkc71
 4O6RFG8PVjxFBO+xcP/suLGBeAD8GRcijOfILkqzCTB7E6cA3TER+4DbOPaj3sWoPSbv
 cqWMRBmc4KN/9N54hPVhfJIbrWzAK3Rblemr4+XOAAPZn1po/drvH/LapmVhbEzcCDAc
 b/P6/+JMraod5BtNeBlYPXkLA0/atgTBPKFmzXC6BPYlBIIJLNWlIboPQ3bMaQ2Q4SpW
 R2IVQuu6WQAqZ8wkuTlLgqQFpMHS6GZ72Vce4/VGxWWf1Sl3j+Be2wV4njDWwcJxRfI+
 8Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zslv5ettm0BZ6lahZKOwlTaXvhF8s2DyuA1mWPRzCMs=;
 b=jeUJoxLFumw+6gDE7i/ifr+lNzlHRpRXV3YHcVNuorxt/vUWSs2I/iVyfBRz/I+jWP
 irhrLNP/G6gNkDOl12ekMjruGR56VCtBpAhe/sBLrzytpBUNl/tA1tpdr6ze+RHnV8Y7
 21t/gi2KcR8I/5m76qILAoopbrKfz83AGbZQj7CwcIyXVJvLuhIB8qQFiUMuh6OQw1uM
 11tKy2bRqtmIEwoDNplNf0nQqlLCBbsIjsNonJSjTxzpvQfTkPA5AXWCuz8sOd5gYB/H
 LV5fUWqqCRgm3Jq2rbekzwjuLiE3df7MuhRmgbT3wxAGFrDWDZJ/7v46Ki69fQH42R0f
 /vBA==
X-Gm-Message-State: AFqh2kpO0F5NsyYlLc27V7S1/Kzqm7J11OLrLsyMyE9LaiDyoBMVaFeR
 Ws4XXZs8BFqiHHf+hiHw99VSkw==
X-Received: by 2002:a17:906:700f:b0:7c0:b79c:7d5f with SMTP id
 n15-20020a170906700f00b007c0b79c7d5fmr55349078ejj.68.1672870004011; 
 Wed, 04 Jan 2023 14:06:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hz8-20020a1709072ce800b007b839689adesm15807413ejc.166.2023.01.04.14.06.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 13/20] hw/ppc: Open-code pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:42 +0100
Message-Id: <20230104220449.41337-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Y/H1SBSCOLiT

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi01_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c     | 12 ++++++++----
 hw/ppc/virtex_ml507.c |  7 ++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..a82c9e0642 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -82,6 +82,8 @@ struct boot_info {
 
 static int sam460ex_load_uboot(void)
 {
+    DeviceState *dev;
+
     /*
      * This first creates 1MiB of flash memory mapped at the end of
      * the 32-bit address space (0xFFF00000..0xFFFFFFFF).
@@ -103,14 +105,16 @@ static int sam460ex_load_uboot(void)
     DriveInfo *dinfo;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                               "sam460ex.flash", FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
+    dev = pflash_cfi01_create("sam460ex.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    if (!dev) {
         error_report("Error registering flash memory");
         /* XXX: return an error instead? */
         exit(1);
     }
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                    FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32));
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index f2f81bd425..ee211664a8 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -233,9 +233,10 @@ static void virtex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    dev = pflash_cfi01_create("virtex.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PFLASH_BASEADDR);
 
     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
-- 
2.38.1

