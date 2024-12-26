Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5602118njk;
        Thu, 26 Dec 2024 00:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdP9vPmYczaLpQ2e/tOelluMXvPPWSnex4wPjtKH59D0OCAUY6QvPM5YFOsZyYfa2ulpNfNlHwXbKGCg==@linaro.org
X-Google-Smtp-Source: AGHT+IER8r47O4dD5YN5/GO8RYAyZAaxy8IGiHDGG/SlEQfMS0o8HqgIXisSjw/5mDL2VG0Uj79e
X-Received: by 2002:a05:620a:2983:b0:7b6:d312:c5c6 with SMTP id af79cd13be357-7b9bac2f4f8mr3398755085a.9.1735201771058;
        Thu, 26 Dec 2024 00:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201771; cv=none;
        d=google.com; s=arc-20240605;
        b=AAI4iLNkgxL0a5Y34dtBR7jOTEoVb4oJgChL2i1HO87+a+I8ZZFOMBv7XIBc4Ty/y/
         Dqmcgd1qzXUwZGQU6AZViN6SgQUApnNFA+uxOECaveXeqitegni1VRYoKqk+bycUoPI+
         1H4R97utawYoSfiV+FXBu1wcKkMnPVKJVW4joxcOBFdkoVDn7wYj805TyQskT7xD8XyX
         Msn7hzgtoI+a3btRD5nON1+HUieAQOQSOoWudlDgVjoTMizoWqFr8kgcN7EAx+zqs8hR
         EUaEijsxPy20zi9rbLAh86meoOLPCy5BhbCZdjUDCxc5cMUp0OYsMMKrfZaZieru45uf
         YKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=IC2Oq7akfcisB2i2J+bOE64Sr4Q2OzTG/tLjT/6CTOs=;
        fh=1zbuNBX/qBX/fTzxMTnp46RihL8UbzQXWh03ZLzBBCo=;
        b=Qaj0g0n7LVfFnfRB1Nj+1IE2Sa4zQt6lEoTCauyX0URC3ce4uW8s2LiTn9ldQmqzeS
         hyyO27mOYVxNqT3TVAk2ytyNSVnANzdU3qcwihoq54mayyoByvLI+e8K5KEBAxnPnzyP
         nvB5SVfiHOFnN80CJAqGz2h+YkD9HWos7oYN4c1S9nZJn3tBowdTLS0SkMbj9e9Am8bM
         PLM+7o+Uf2EgwFL8iBYGdapE8YHyFkp3YyRu+ZW0tY8Nx1mrPzzxxJcykUMN+It08ik4
         39efpe9nysUXFngWmuqebLGLC5KEVWJlV8HjjPusAESaWjekULy9ZkD9dO2bMDE3VL+T
         0h5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ks6xc+5v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac5667c6si1705443485a.695.2024.12.26.00.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ks6xc+5v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQjEr-00059U-3S; Thu, 26 Dec 2024 03:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uxNtZwgKCtgQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEd-0004qj-D5
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:47 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uxNtZwgKCtgQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEb-0001Ei-IQ
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:46 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2164861e1feso77080085ad.1
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2024 00:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201723; x=1735806523; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IC2Oq7akfcisB2i2J+bOE64Sr4Q2OzTG/tLjT/6CTOs=;
 b=ks6xc+5vV03vbNPP6KAuWZ5faOI5rNF9TEq7DYehaEn97+qKkXNt3suCmBzDElHZrJ
 xRkzAthAImu6Kod33jLAkyYdL7kWZyFFLvh5DMa+zVAMAtjoCxsccD7xzCl2IioBP15G
 sj3C8xvprh0f+1RPV3YKjQ16deral+mpDFwNtjsg+MjTLUz/Kg63nr8Moi36gaR8RQ+r
 H35Boon1VbGmDy+wI+VaF4iU5MlxN26GM8wb16C66sZHHM0mKbo0beigkH1j66hU62Kd
 2ap5yR6XmcddwKhKd9EK0cqOvTlcTc0YxvwgZayOdUvYjRSySnhEM9Co8NnsITY0qmFh
 LWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201723; x=1735806523;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IC2Oq7akfcisB2i2J+bOE64Sr4Q2OzTG/tLjT/6CTOs=;
 b=coD1qSbZR7bl09u7QlTLViXQsHP2RBCEGrZdE2Y0pHvAc4/j/7TughPO2JZxZJhbVy
 dKGwLePTWrMXMZyUab/X1r09vUuUe5AkuOHlQtgKI2L1L7oATsSdR0CJUKoHDAFJsh/f
 44RK3WueHH5FobK0KoEtu4LFkFZiY3/LsiFezoyP74Fzo385I+iwukChMF7rpW6zmcmT
 e5eF4eKhV6azYKm0lQjUX+A17gDFlRiBBdZU2Gotbm42MtUUs3l526RJaG/it10Xj7cD
 7hgEUI5sCgW8oqz5JlvFQ+e/1IqlJnMLa/rysWYRT0XmKPuW3t3Y1wZnBPCi7xxwZWnp
 NvWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAn2Mx5F4GACCNYeWL3pHykhyT/uEG6skwOsMEroDXSSWUolMNusvBLQRQYq1+h6eR8Fqvas4+FV3n@nongnu.org
X-Gm-Message-State: AOJu0YzqVgPTcnjQnjLpFudAXwbZEGliAja8apquk5FB7HaYSV+u5nW9
 mSOue86do7ccIZmhRMtTqUsS9KsCe+oh7NiKradkH+RgMIuaewvaoHg3DgzEXAE3V712QQ6ExCV
 SlZw8+J2gaw==
X-Received: from pgvz25.prod.google.com ([2002:a65:6659:0:b0:7fc:fac3:7df6])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3189:b0:1e1:af70:a30b with SMTP id
 adf61e73a8af0-1e5e07f9b7dmr36487714637.34.1735201723533; 
 Thu, 26 Dec 2024 00:28:43 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:54 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-12-wuhaotsh@google.com>
Subject: [PATCH v2 11/17] hw/misc: Rename npcm7xx_clk to npcm_clk
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3uxNtZwgKCtgQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
X-TUID: xWzRye7bRwN2

NPCM7XX and NPCM8XX have a different set of CLK registers. This
commit changes the name of the clk files to be used by both
NPCM7XX and NPCM8XX CLK modules.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/meson.build                           | 2 +-
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 2 +-
 include/hw/arm/npcm7xx.h                      | 2 +-
 include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (99%)
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (98%)

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 9bab048849..743066eb96 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -67,7 +67,7 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx_rngc.c',
 ))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
-  'npcm7xx_clk.c',
+  'npcm_clk.c',
   'npcm_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm_clk.c
similarity index 99%
rename from hw/misc/npcm7xx_clk.c
rename to hw/misc/npcm_clk.c
index 46f907b61c..2bcb731099 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 2e708471ec..e80fd91f20 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,7 +23,7 @@
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/misc/npcm_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm_clk.h
similarity index 98%
rename from include/hw/misc/npcm7xx_clk.h
rename to include/hw/misc/npcm_clk.h
index 5ed4a4672b..0aef81e10c 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -13,8 +13,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  * for more details.
  */
-#ifndef NPCM7XX_CLK_H
-#define NPCM7XX_CLK_H
+#ifndef NPCM_CLK_H
+#define NPCM_CLK_H
 
 #include "exec/memory.h"
 #include "hw/clock.h"
@@ -177,4 +177,4 @@ struct NPCM7xxCLKState {
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
 OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
-#endif /* NPCM7XX_CLK_H */
+#endif /* NPCM_CLK_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

