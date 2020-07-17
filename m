Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2144631lfm;
        Thu, 16 Jul 2020 23:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS0KszZq/2h+6F6pYamnfR4ovHj+FV/UmoP1jm876ijvLlW+Ji2qXcqHtPNNUfG2ijdy4u
X-Received: by 2002:a25:4ac5:: with SMTP id x188mr11186162yba.75.1594965841382;
        Thu, 16 Jul 2020 23:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594965841; cv=none;
        d=google.com; s=arc-20160816;
        b=cWazOM5jdfktB7XqTQCnH2NejO4SXeXye3j2rSePR/6H/noqRsrwpPe52am/b7K41L
         SA4RdH7F0heHl/skwKkWNcnSLXsycWfYteOqvpS2liMtbcGbSqw59DOxLqJJ0D8B2rnj
         qNlyD1ulOal12Gk1biTceH44CZISqKHeaDNfG8fm+xrJViGVBsy91cPgGZ+zEOcXpqv1
         15Qy2SfzpZyCOu5oyyi0lpNkkzoP+UIb8/ugRB5LaKCmjtP2m/3gcYtYgD+3CX9pvVuQ
         s80MlSJoaPzrQQVHZDy54SBFZL5KRWJCWhYncdNZOt5KhU5JFaF5ELr4R8hx7OubKIaF
         5Cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=frc86mILmkHC+wqWcKw1PPJTa/OZk2Y3JpwlzSnJqMM=;
        b=NKEXdrm9cz1CGzjUKuivBylPrdVV32AyL5C623Cws7unsCfTW/IsLWdM8rRl9aWMjI
         FYxrEiD1garFV8n33GXHNQz//Kbij8Gj4Ozg4tCWTy4w5EwFtKl1t/1t2QKG/G5n6nOj
         kg/WlLva8DrAFRI6Zi42T+ptmOrkDoXyshFhwp0iUQYleF+lVfQNQta5N+NJBkMwXDQy
         Jf3pnpXF7rp/KiG7fiy0/D/VZ+IJRkbi+B1AntNlZm+CK72W0eB/ctklPt4utNcwogIf
         OBtv9MP/Ws6nvY26YHfYUNBNBxXZC4jornCLsHOvoB7A7IMX7ZHYvMrCtn4gjyUEUXFN
         OZTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=T1puZXUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j131si7606928ybj.220.2020.07.16.23.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 23:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=T1puZXUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwJTU-0004HX-Nh
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 02:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LT8RXwsKCO4XiaYddUceUdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--hskinnemoen.bounces.google.com>)
 id 1jwJSy-0003iZ-VQ
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:29 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:36716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LT8RXwsKCO4XiaYddUceUdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--hskinnemoen.bounces.google.com>)
 id 1jwJSx-0005HD-ES
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:28 -0400
Received: by mail-pg1-x54a.google.com with SMTP id v15so7219389pgi.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=frc86mILmkHC+wqWcKw1PPJTa/OZk2Y3JpwlzSnJqMM=;
 b=T1puZXUBXlcMoWFROgqScO4xHSDWK+e87YnMYExRLrvuOElQ1MiJjWpRy9oWD00nYY
 e3TtVfyQq0btj5BpL9h1tTV1DmZzVGXo9203v9qOB8TJZ8rnGPebuQLb2Kk3p134Q6Z1
 ZmsxSzqlv6g77zysQCmoNU1qW9aPtyot4Z5ZFzJIC2wiyhORxU4jnnt6c1st8jaLuL/p
 qm1icrFywU5nfUrMZoYzntgvNw/wnDQ3OqMEDzikN0XG/+w5u+Su/Gq/XUJSkHUcgu+9
 Gyc8suo9S5Ld6gjeKt+tV/4vdUZFNmRF8dXZ2bJk3n5snZVsiasvCeL874XauV1DyrYk
 lVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=frc86mILmkHC+wqWcKw1PPJTa/OZk2Y3JpwlzSnJqMM=;
 b=isi5DFCUrV98IfPOMapdiP4dWXvZuJC3QFh1DT9kdxtb5Uf6kAFvJKbne4t9VCCi6V
 CtvOiX6ZAtsi3jFnLqJdiCdR1cZ4M3o79xCGFOODot/2vYevkFy2wwnBgRRCUoOg0wAC
 v6jxjcrc79HVKzdrE1hxkMT203f/nxbLE1d7bQCsmRdR1aO7kWuOillgf1X4g7/oTdnl
 U3/xRM/3RQ0I9LZcWWW7w4igPPjCmcd49YtLDdNy01UJaQH/bPQGWJCWlbDA9rhSHZWa
 I+BROw/RCTfxw/TONp6FiIjIdZONdfwTDyyfZ9OxEhBClk+oAQIokfFu/iLyaZDP/Bg+
 vVOA==
X-Gm-Message-State: AOAM531lpzCoCsyTD2Od86VKevuuOOaGvO36yAKwH7VGBDYwXbWdZsfH
 8LhKYvILi1RKDxohM6D4D16DkuwI9lyxU7edZg==
X-Received: by 2002:a17:90b:194f:: with SMTP id
 nk15mr8495696pjb.189.1594965805094; 
 Thu, 16 Jul 2020 23:03:25 -0700 (PDT)
Date: Thu, 16 Jul 2020 23:02:52 -0700
In-Reply-To: <20200717060258.1602319-1-hskinnemoen@google.com>
Message-Id: <20200717060258.1602319-8-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200717060258.1602319-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v6 07/13] hw/arm: Load -bios image as a boot ROM for npcm7xx
From: Havard Skinnemoen <hskinnemoen@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3LT8RXwsKCO4XiaYddUceUdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C40bluefiIW+

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

If -bios is not specified, the vbootrom included with qemu is loaded by
default.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0b9dce2b35..f32557e0e1 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,12 +18,41 @@
 
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
+#include "qemu-common.h"
 #include "qemu/units.h"
+#include "sysemu/sysemu.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 
+static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
+
+static void npcm7xx_load_bootrom(NPCM7xxState *soc)
+{
+    g_autofree char *filename = NULL;
+    const char *bootrom;
+    int ret;
+
+    if (bios_name) {
+        bootrom = bios_name;
+    } else {
+        bootrom = npcm7xx_default_bootrom;
+    }
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bootrom);
+    if (!filename) {
+        error_report("Could not find ROM image '%s'", bootrom);
+        exit(1);
+    }
+    ret = load_image_mr(filename, &soc->irom);
+    if (ret < 0) {
+        error_report("Failed to load ROM image '%s'", filename);
+        exit(1);
+    }
+}
+
 static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
 {
     memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram);
@@ -60,6 +89,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
 
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -71,6 +101,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
 
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog

