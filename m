Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B1DCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:13:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3ySj-0004b8-RX; Wed, 01 Oct 2025 11:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySX-0004Uo-Dj
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQY-0000sT-Nj
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so78200755e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331244; x=1759936044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=YUVzAZRCiIkvBfFyTl8r3vmMvqXgpkn9m0laU+u/bmKA4r1IbzpciSeTdnQmc0Tskf
 Ukzj7HaX9S+T9sILSe667G+FKJIuwojtlwtiR1SiUd17RL/YJZGm0Myp6RxTYGhZcSwM
 gQSxVCZqTuolxlgc40nvSRP5QwLJQjb1N70nw2wYC1jxoFLf02F/V+90TeqYiJ1qMpvl
 HN1Dheyn6fbBwBwy4IKdomzGXwIIbSAmZIHqP3Gi75Ze6KqESOb5/v/oCN911kfxLBzA
 tU6aSq0UtD8Y1JTfKNirvraPcUXdvjaGiNTQkkpUpwV0CT0GcTdzwZb9vQOOH98bZjyp
 C0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331244; x=1759936044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=ihHDCDyhb0amLf+uofbpTHcWvjB1J8NyvJ+ttkPmbjIvVpcef7z8fXN6s6K/Dh2gNs
 QTO2hHvNUNrSRI31mdQBsccfK537fNSv2+QmwX1Fzxm6Sz6a8jwKcToLIo0lxHuo7k4X
 k0hEzykey4p3AINLrtER5ssRa9WEPfgXWAWYgYq3ibl5CBDRMeruAxl+qI7AIKH2oLB3
 981xRwHY0YP0D8ZKkrM1o2pd/9J1pSBEf4k3j/sWxAUvegwh1q83+waj6an4/t5Sq1i5
 /IQlbzHmuIBgUElT0xfoNyWGd7pdMlnEN9LMRvv9e5sVuB6KlITlvlXD1eCQtSO/cCD7
 2aBA==
X-Gm-Message-State: AOJu0Yz6M1TcTXFmjnpp7qpU3dckYLOzUiVRgda7euqg8wwBg0Jgvs12
 D9hK0CB63tBtN3cyHmdYMVh+zIluYoR0GqnVvQHSWBrFM5j1jmYaes8gvMpQ9VAmUbI=
X-Gm-Gg: ASbGncvSae13pvt8z5BA3lHAW2FA8Ess5WyyR5Nk2E3c7TSXTWKv9AVOv/+8OCtYH6j
 vA1oF7WKOyzc6qDx46cEtjNWvoa+49sOi63H4fuAJ0ed66CIDCxHg7Vt8mDBHAukQtfNgIOQNT1
 TsZM01RGHXzOm+4/W6gPRm8m4la0ieJGhtJGXKhLqDSsTR25Td87HIruyfB5gQT4eeyc8jBX+h6
 aj9eanBrYLx+/mhvEEuNnJPVv95fd46d6GkMVTUPVkrkR5MzVLDYdfTtgwDnRJ3e4gWKH5aX84b
 c/jgSpjYl+tVZPN+pRdHMxEufUPJI6xt34jpM5H7WutZjDVHqZ8SpuW8+0iA+eB9iRHQ7DfSMNK
 5DYzqO5cS8BtXAi//j2dZTOX6gXfkUdxIXB693q/nba8qEhBZxxjYHXf+F7Ovx3mlgbXn8CnhWn
 i7778cKxC+RItiVStAB5jQfW+/AsXXUYY=
X-Google-Smtp-Source: AGHT+IFkQNGVq0nEvAqiHZde44QbZe8PBGEZKor8cq6aaYtJtyGE0kwMUg/fi8b17T+fFK2R+KPQFg==
X-Received: by 2002:a05:600c:348a:b0:46e:3f6f:a8ee with SMTP id
 5b1f17b1804b1-46e67a5c7a0mr7124835e9.13.1759331243991; 
 Wed, 01 Oct 2025 08:07:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc8aa0078sm27313031f8f.59.2025.10.01.08.07.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 22/22] target/sparc: Reduce inclusions of 'exec/cpu-common.h'
Date: Wed,  1 Oct 2025 17:05:27 +0200
Message-ID: <20251001150529.14122-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Only 2 files require declarations from "exec/cpu-common.h".
Include it there once, instead than polluting all files
including "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.h          | 1 -
 target/sparc/helper.c       | 1 +
 target/sparc/int64_helper.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 31cb3d97eb1..7169a502432 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -3,7 +3,6 @@
 
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
-#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index 9163b9d46ad..c5d88de37c9 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/timer.h"
 #include "qemu/host-utils.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 
 void cpu_raise_exception_ra(CPUSPARCState *env, int tt, uintptr_t ra)
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 23adda4cad7..96ef81c26cd 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
 #include "trace.h"
-- 
2.51.0


