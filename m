Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3879248ejc;
        Tue, 17 Oct 2023 05:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE29ED7hu9eCe8DOzWCWcMhPD/QeDcFg5o+RCnr9eGaMfwWbA21pJ9E3ItMb7TSLQHMHOgw
X-Received: by 2002:a67:b74f:0:b0:457:d3ef:cbe5 with SMTP id l15-20020a67b74f000000b00457d3efcbe5mr1968577vsh.20.1697545412610;
        Tue, 17 Oct 2023 05:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697545412; cv=none;
        d=google.com; s=arc-20160816;
        b=rdv22LAkguD3oIj2xOqztMdQVidFR2/8cxKymPECCmSIRbSdpabqZnMKn0g6hzxHD3
         1ZepdaqBFXB4LaL07vEQy5eBh5M3FTS85XZIQPRpjTEPH2L5Z5yXOCiKhoHGEe1wLdH7
         gKAuv6GjFcTDSLc9uO167Bc54ZBkjLQEmIw6KjHzwZDX9bUXHB4HrndyQEHJxPXP/pTF
         A5hhMKU2dMWbEdibaGaIKAzDj4gBYTQa+uPlJ9dZH+YEFNENI9NZ8IP5YR+usPnlWCT0
         I2hkF2i1Y8aYoci3pmht92iGjpb1IZ9C8Nd6qG80oRwupSrsyjlraNF8JQYz5Pmb8to4
         y2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z+dBuj8Vl8/qNTxYaFNacqekLLopYIUokXsNr5A2Ax0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Jk/GOH/EUd+WfjYRhkqbx4ix8C4uigenLTPIM++Xj6CiVBQ3/YjIdmx6g6tRxQ+X35
         ibUt8NyB//H9+7LgbsXaHlrNtfQF9rVkrblsi16Hv/AVW4gQJLPcOcHIWpljEQF4Hnqv
         OoNm/lXHlTFRWNCvCyI60evm6M9zM9ueKzWFVG9HoygEET3LxbGmWfuPLci0ffNooI5f
         sH/s6miYP0LRmenI58vUWNM/t8qWmRloA3x0334D1M9EJvwhaWwnN2P851qRY8YWyw6k
         z+AE/a87edm75YtGlzTCfgbv2NDW3ZVSTvP8x/y9ic3ear8NbVLJe/u/RRKVxcFkfMNe
         hbDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbQemaBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac859d6000000b0040fd49cc939si1018048qtf.245.2023.10.17.05.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbQemaBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsj6L-0006Wo-OK; Tue, 17 Oct 2023 08:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6K-0006WX-QZ
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:23:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6I-0003uD-S6
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:23:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so54213405e9.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697545385; x=1698150185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z+dBuj8Vl8/qNTxYaFNacqekLLopYIUokXsNr5A2Ax0=;
 b=nbQemaBD6mN3ypdwiDW+xa3XVsFTpTk04eumBwonl5G7MtDVWSFI2CyU4Y1N7lztN4
 I/IaxgNi27qhcoHIOlqREsdpD5d7QrsOeKE5WyeX4kY4t/d2gw/ZGFR4CHqqtGv2S6hi
 iDt5EdctNAvWdSlvCQoYFgSNBW/0apO4qsUWVK5Od2ZGS2lRhvCFnUnt1JJDcCvxaLPe
 M6HPOsr3CkYH43PSzVvmBPMDaOdihYZWYVsyLgxpKgGbmmkXfZ27NDl0g7M69Fkm7Kut
 ZanwEgrQtZs5hx3ij2gfW/maa9bY5aoDdT3I2Kze+ZsDpkgLB18a+G7ts1Xc0b33m97G
 EYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545385; x=1698150185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+dBuj8Vl8/qNTxYaFNacqekLLopYIUokXsNr5A2Ax0=;
 b=kbOxmvKDiF6EKccuy243GPfdnT1239N8esSZJ+0CiNAWBn7IfurOtoLaAR2ijbS5B4
 3qKXA5pjfbdZnuWoTRCRlcF4p0N1DCsKtykOlqInbbCU/c9poqmTvwoPu+qBzoudIY9j
 oll7PexpukmFCE15nLC1Xtif+PPkMVP1fMHzB0mH5G1EeE+NY5oLOqvdkx3e0NjgsoFO
 Vb4hMEs9f2uQwCOe4IY6FyVvy4qGVIZteiY7LsmTKk/PN8S5k3QBGPqYixfRsOsymIFO
 +WC0t7ClXnINFBtPdbIQxj5CmxEEIN4gAV46TDr58Y2WUK1A2iS3pfQBHwQS+iiu0/Vb
 AbhQ==
X-Gm-Message-State: AOJu0YwQQlSMMA5okbpy8hr18lW6cSKbbUQ0o04q8JGpqdYdB7ZzoxAf
 FOwIIBmr7fHFm8PGfWryPyclO92VXxBOOXkNir4=
X-Received: by 2002:adf:f882:0:b0:32d:9a36:b518 with SMTP id
 u2-20020adff882000000b0032d9a36b518mr1594160wrp.69.1697545384721; 
 Tue, 17 Oct 2023 05:23:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1590905wrs.35.2023.10.17.05.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 05:23:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/input/stellaris_input: Rename to stellaris_gamepad
Date: Tue, 17 Oct 2023 13:22:57 +0100
Message-Id: <20231017122302.1692902-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017122302.1692902-1-peter.maydell@linaro.org>
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 5LmltYGgU+x8

This source file implements a stellaris gamepad device; rename
it so that it is a closer match to the device name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/{gamepad.h => stellaris_gamepad.h} | 6 +++---
 hw/arm/stellaris.c                                  | 2 +-
 hw/input/{stellaris_input.c => stellaris_gamepad.c} | 2 +-
 hw/arm/Kconfig                                      | 2 +-
 hw/input/Kconfig                                    | 2 +-
 hw/input/meson.build                                | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename include/hw/input/{gamepad.h => stellaris_gamepad.h} (77%)
 rename hw/input/{stellaris_input.c => stellaris_gamepad.c} (98%)

diff --git a/include/hw/input/gamepad.h b/include/hw/input/stellaris_gamepad.h
similarity index 77%
rename from include/hw/input/gamepad.h
rename to include/hw/input/stellaris_gamepad.h
index 6f6aa2406aa..23cfd3c95f3 100644
--- a/include/hw/input/gamepad.h
+++ b/include/hw/input/stellaris_gamepad.h
@@ -8,11 +8,11 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef HW_INPUT_GAMEPAD_H
-#define HW_INPUT_GAMEPAD_H
+#ifndef HW_INPUT_STELLARIS_GAMEPAD_H
+#define HW_INPUT_STELLARIS_GAMEPAD_H
 
 
-/* stellaris_input.c */
+/* stellaris_gamepad.c */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
 
 #endif
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index aa5b0ddfaa5..96585dd7106 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -23,7 +23,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/arm/armv7m.h"
 #include "hw/char/pl011.h"
-#include "hw/input/gamepad.h"
+#include "hw/input/stellaris_gamepad.h"
 #include "hw/irq.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "migration/vmstate.h"
diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_gamepad.c
similarity index 98%
rename from hw/input/stellaris_input.c
rename to hw/input/stellaris_gamepad.c
index e6ee5e11f1b..3bab557cab3 100644
--- a/hw/input/stellaris_input.c
+++ b/hw/input/stellaris_gamepad.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/input/gamepad.h"
+#include "hw/input/stellaris_gamepad.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7e683484405..841f3131ea5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -291,7 +291,7 @@ config STELLARIS
     select SSD0303 # OLED display
     select SSD0323 # OLED display
     select SSI_SD
-    select STELLARIS_INPUT
+    select STELLARIS_GAMEPAD
     select STELLARIS_ENET # ethernet
     select STELLARIS_GPTM # general purpose timer module
     select UNIMP
diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 55865bb3869..f86e98c8293 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -20,7 +20,7 @@ config PL050
 config PS2
     bool
 
-config STELLARIS_INPUT
+config STELLARIS_GAMEPAD
     bool
 
 config TSC2005
diff --git a/hw/input/meson.build b/hw/input/meson.build
index c0d44821800..640556bbbcc 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -5,7 +5,7 @@ system_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
 system_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
 system_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
 system_ss.add(when: 'CONFIG_PS2', if_true: files('ps2.c'))
-system_ss.add(when: 'CONFIG_STELLARIS_INPUT', if_true: files('stellaris_input.c'))
+system_ss.add(when: 'CONFIG_STELLARIS_GAMEPAD', if_true: files('stellaris_gamepad.c'))
 system_ss.add(when: 'CONFIG_TSC2005', if_true: files('tsc2005.c'))
 
 system_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input.c'))
-- 
2.34.1

