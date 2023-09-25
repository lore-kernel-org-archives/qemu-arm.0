Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp306781ejc;
        Mon, 25 Sep 2023 04:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhAabLRkPEKT8ydJfJDPoo/cXgp/uFc4kAwopLAggZxUdDjMxFkjsa32AODs0KMFGV5Z/n
X-Received: by 2002:a05:620a:318d:b0:76d:95bc:7aaa with SMTP id bi13-20020a05620a318d00b0076d95bc7aaamr7305870qkb.29.1695640969343;
        Mon, 25 Sep 2023 04:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695640969; cv=none;
        d=google.com; s=arc-20160816;
        b=X/KQAIcWEqPTk0vrS6ETnFw7zHkeBZWbzAPBEEOOGu9fQOl8Rpaeqr8Z0yH0B754MI
         GKm+qWHp80Ogg3yHmvTpmcv0zl7QiUkm8iupl8ZCpgiAlp2SK6b1j5LiUn9VrxH7MXbq
         +fHS1pe+NVm6wtgPk9TVbhLXrhQYVBmJq6i0VJZNR4XPQZmwynzl0nLcr8SJpjsuJIyX
         zcpLfkdemTemg81p5plBgY0gInj46jz7h4yqjDHJlcEE1K5UzYIXELySEPGojWnejj1Z
         DAQ3cfXuGdpgFuOXBlDxUWCZguR7ke+Zr3qr4BrjCI5zrvQXUk8hkjbTzuClfF5ymSZM
         HJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KjTSXQ7FvnDgO3VZ62RhJ890kSaoi49kAiFaYhyCFgA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=X5uNwEdpl7QAkgCdWnqa7q8jjrUzvtDJ2FeMyPnq3g5ekDhsMsFyda2pw0lcVJ6RfZ
         Ys5hr3gVpipZ5wHBx8Deh5LZiXIsHdP/y3cNQghY6cNqNMNwutTzjegYBOP1XlVgldR7
         slXmrklPkY8SzUyjuc4SF9OY7gMXzr4xo+/ZGio6rvewTla27MGPUnbn63c6Hdpvu/az
         hNCTv7eAr9EwN9LR+es9baJnogMtbyNSt/prgx5quRCHnAwhKVmYJJ6Au2gH1LaGJ2Um
         fvCc/xXcjUzPF9RcgfOD5tTRKLuO5ojtoGVoOt4/U0Nm14BWLqGAmBT1iYOFA1PL/LvH
         5qMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tk76PgAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05620a123000b007726448cd7asi5726141qkj.191.2023.09.25.04.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 04:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tk76PgAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkjfV-0007WH-6e; Mon, 25 Sep 2023 07:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qkjfU-0007Vh-5B
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:22:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qkjfS-00019M-FX
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:22:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso31180875e9.3
 for <qemu-arm@nongnu.org>; Mon, 25 Sep 2023 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695640941; x=1696245741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KjTSXQ7FvnDgO3VZ62RhJ890kSaoi49kAiFaYhyCFgA=;
 b=Tk76PgAKJ7uirUmUgQa50KFdpjcnAw4PbCZ+UhK7EGexsRNPpMGYNseRUWwjOQg09W
 wyF2P0x4vGRnYrjafrlX2wNhJes65ArHfBsDwFTo38gikFcrWs0+EmkxuYcWguYReSFo
 rh47drYc+fJJ4VBjtoTSEVklTNVwL5OcU9054m25zOTmW8xwFNqhSMvSEQwIYfWg3qwU
 lxpXvUfzaKmpLoVIGDqxV7AiWHXu7FSvQQwUOBIo34It3SBcerOqaRJ569lBbFWa1puy
 tgCEYSJ+97RNYxRvGlUsO1R7BN6+cE5OUXPjbQ0d4ZFqVkpu2kUgAKLWKUqRRnWsbcTo
 ThMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695640941; x=1696245741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KjTSXQ7FvnDgO3VZ62RhJ890kSaoi49kAiFaYhyCFgA=;
 b=IlIXI4svnmFLvo/kWSovvmv2lCKfVJFJ9oTAEzEX/6YXK4JDwdACPTrF9iEQHuBwgz
 LaT+VJSjd4X9Tmsu9hUZdBGQXsVjq5UiMnVrbXwZ9BTYKZHzWdwl7RUOHTeLJaVqdUrv
 snIp6id1k88azjH5LL+hSxKGCTCgoovVci9WIdXCebnILhUkTErYDZNBAvcU6QMXqUbP
 CpIAR8u5FkrzbQN+w7dg9ZbQ9S2TRPrD0MWrO87vo+qbT30Blk+nsM/G8E2ugcy3Rzgp
 SKOodJNPgBkq/asRXmUbvOV6YtcsaZ1GERk6tiYk0PcMIN7170a2QPsNEJPwNhzuxNzi
 XvBg==
X-Gm-Message-State: AOJu0YxMp06GTnE+0AWUn42EVqW28Wi8WWROer1dZ30fS2ikIS9BwVHa
 jMTMzAlo7rAxeheqBwtcElRjWsaEFjJMPnqLgww=
X-Received: by 2002:a7b:c38e:0:b0:3fe:238e:b23b with SMTP id
 s14-20020a7bc38e000000b003fe238eb23bmr5906587wmj.36.1695640940691; 
 Mon, 25 Sep 2023 04:22:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003fe601a7d46sm14881425wmr.45.2023.09.25.04.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 04:22:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/common-semi-target.h: Remove unnecessary boot.h
 include
Date: Mon, 25 Sep 2023 12:22:19 +0100
Message-Id: <20230925112219.3919261-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: epT1QE9zsm/q

The hw/arm/boot.h include in common-semi-target.h is not actually
needed, and it's a bit odd because it pulls a hw/arm header into a
target/arm file.

This include was originally needed because the semihosting code used
the arm_boot_info struct to get the base address of the RAM in system
emulation, to use in a (bad) heuristic for the return values for the
SYS_HEAPINFO semihosting call.  We've since overhauled how we
calculate the HEAPINFO values in system emulation, and the code no
longer uses the arm_boot_info struct.

Remove the now-redundant include line, and instead directly include
the cpu-qom.h header that we were previously getting via boot.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/common-semi-target.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index 629d75ca5a7..fa00c7fabb6 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -10,9 +10,7 @@
 #ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
 #define TARGET_ARM_COMMON_SEMI_TARGET_H
 
-#ifndef CONFIG_USER_ONLY
-#include "hw/arm/boot.h"
-#endif
+#include "target/arm/cpu-qom.h"
 
 static inline target_ulong common_semi_arg(CPUState *cs, int argno)
 {
-- 
2.34.1

