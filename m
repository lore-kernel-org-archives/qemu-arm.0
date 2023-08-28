Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054575ejc;
        Mon, 28 Aug 2023 07:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8g0RZKmjT3lH0Q3jkmn61DB6w0gz8G9OYtxyzeLDABCR8TeM+f6D4XwPaYqffiu5JsKQU
X-Received: by 2002:a05:620a:472b:b0:76d:268b:9741 with SMTP id bs43-20020a05620a472b00b0076d268b9741mr33966385qkb.17.1693234648843;
        Mon, 28 Aug 2023 07:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234648; cv=none;
        d=google.com; s=arc-20160816;
        b=x5LizE7MMcx1ahQNT5uPtXcS/UGqYM1YrsPY9bXhYefHB51aTjWWKP0x0GzDfDGbnv
         oXmY3dOst93TcWMOR1ruvEdTxkMQoFH1C4UqYfHk2FxFNgIPszHzUHH7M+bkXRKnceSr
         UWZR1bUdeVKjOHRWhLAccgsXHy6dD66klwipGTkCqQkGJPhz8zsj6YsZMAgI0rV2owwC
         iR/4MQm/0jt73CPqD6I7vTzgTo1ifONX79rSjGbW+LQeAm+IM1nC5/cQrHyrebmja6GH
         IXtEwScXVe3yph4mHqxm/cCWe95d5RfG6wVG6bAVR0lxVNytTQUvCiARx9y12rP3DLKH
         PhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9xZkdiA8sqUe1S8Q9uqQo08DahS7TNnMVPj2P4ZyMvE=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=c4T9md0qzftTl0O87KVDfpXwhn+XmX0i4kHUwMyrinAApyU7OHnEgxe9JPR2wtK9/K
         1GPQmSSsdzAjQoI+9g961m/gx0WpOhxptj/hfyTYtGFdhbwkSXv1JG8WAFU7A39JTlNl
         dJ0vJ/JjaFZjHb31vgq4+WM7r+dZqcB+YDC05d3ZU2PjLzYKAM7aQgkAuPCnRyhLhzG0
         7G842NM/JubrZVXVm0GsvM/2YEzSmcjYFsd/BBqt2SWtG7denU8Q0mo6imorsIGIyB3l
         DSU6xsdwKw0Wih81RCiozJ4p+4m+8j/J5v46X8GsE+1/l5H/eQb184pweWNYpJdaQTXg
         N3IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcA2srww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a05620a290500b0076cd22a181asi2903071qkp.683.2023.08.28.07.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcA2srww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadf9-0003SI-4W; Mon, 28 Aug 2023 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadf7-0003R9-VG
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadf3-0000gG-Gh
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe32016bc8so28557315e9.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234572; x=1693839372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xZkdiA8sqUe1S8Q9uqQo08DahS7TNnMVPj2P4ZyMvE=;
 b=qcA2srwwSQMvlJ1aQK3DsTA9hoCoRhpkLfHKTfcQ3BtVieCHQ6ESGa2e9fvogENzOp
 si3gL54/crLwqxaIEv6IuK1KEKM9gJTiw8fhYt5vADH9fAe+OjDw/lQ5NjTMsLPhcxCc
 9xabPVfHxwiY1feBNs1LHJBKPDlYfgQPP5jGCRA1whqwFqEwTuhe+oHsc+hf50yjPfAB
 fAFFp+yRKQVSX4oiITvH5mqg8+MmAYTm0ueAGFoJNUoO/5k2Zs9o3WCEHiRVZ1plov5a
 GLY8JaxXa/Q8FWmpEBTl9J9Ou3mDoiA+cVBP7H0yk3wpusISlLvTKCriSSRXM2Q153qw
 Q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234572; x=1693839372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xZkdiA8sqUe1S8Q9uqQo08DahS7TNnMVPj2P4ZyMvE=;
 b=O4CpN+hHL0I0MNH+9kMPXUWl96n65XK15a6+0jRjwR/dfD6R+pZ1FSeUs465+8FS02
 rUDgmVvchfAyWc6vR5BKZs4mCsw3oEKmWyGnyKWiUO3x2NG0CWp/Soe0YnZxC+m7Lpfu
 NWAtGNJSJ/C/54qwiUBrOom9b1pZ23KjZz0y/43HH/urJ5BHijNNeSO9LxtraxvY06Mu
 xmxRvlmOPlBLgEKU8tK0i2hSt6JTr1ObP0Rxcq8DGY6M0JbBLXECnN1NC7bItPMQIyKH
 +8jbTOrrhb5bKJkJptXruUmcTx0pFykd55S/7gKAfr/Rum42En1GVH9iEZFZWf/iLLcN
 itAw==
X-Gm-Message-State: AOJu0YyezlV8Oy75gdUQUkg+/gp0HM8nm+O0AQLeKas+o7LSbE39I2gq
 iF3vi+YBIVJL0OcRWr5L+ye+/w==
X-Received: by 2002:a05:600c:2284:b0:3fe:e842:60a0 with SMTP id
 4-20020a05600c228400b003fee84260a0mr17830834wmf.31.1693234572113; 
 Mon, 28 Aug 2023 07:56:12 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c0b4400b003fe0a0e03fcsm14094586wmr.12.2023.08.28.07.56.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] target/translate: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Mon, 28 Aug 2023 16:55:41 +0200
Message-ID: <20230828145545.81165-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: YjHhQAIKYWDr

All these files only access the translator_ld/st API declared
in "exec/translator.h". The CPU ld/st API from declared in
"exec/cpu_ldst.h" is not used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/translate.c      | 1 -
 target/hexagon/translate.c    | 1 -
 target/hppa/translate.c       | 1 -
 target/m68k/translate.c       | 1 -
 target/microblaze/translate.c | 1 -
 target/nios2/translate.c      | 1 -
 target/openrisc/translate.c   | 1 -
 target/ppc/translate.c        | 1 -
 target/sh4/translate.c        | 1 -
 target/sparc/translate.c      | 1 -
 10 files changed, 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 846f3d8091..d73ed28da0 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -24,7 +24,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..c00254e4d5 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,7 +23,6 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
-#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index d66fcb3e6a..e57ac57338 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -23,7 +23,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e07161d76f..5e68159634 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -25,7 +25,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..d02c16296a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -24,7 +24,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4264c7ec6b..dfc546d3bb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -29,7 +29,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a86360d4f5..30ff63ac0b 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 74796ec7ba..49b6a757b7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -27,7 +27,6 @@
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..c1e590feb3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -22,7 +22,6 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bd877a5e4a..3e108fb19a 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -25,7 +25,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-gen.h"
 
-- 
2.41.0

