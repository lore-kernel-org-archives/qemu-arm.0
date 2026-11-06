Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF788606A31B
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vl9cUB4E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP9sS-0006QH-5g; Thu, 05 Nov 2026 21:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sA-00067x-9d
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:40:14 -0500
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9s5-0005yM-MN
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:40:08 -0500
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so459574c88.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 18:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793932800; x=1794537600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gq/d0KwPPYo52ABxaaA//hWxeVPvL++rdqpTw0UqREs=;
 b=Vl9cUB4EpG8B1J1qjuaoyH0tIV2jkuFle2SFmEWy5Zv17uWdGdow/Z/G3SY7nJlw8G
 Rce7DJcawTiP4sT/aU3Px5ZtsLO6M6ez6v7Yo0zzmUUARAvHCItGZYi9LyYBBJ/lGyOs
 CIu2a1n9vV3/B3bdzG9dcKODLIJOIzGWaaB4tDqpZKAzpGibRUbWwoKVO5JAanw7KPoL
 2UJDc7XZKel6Oe275LpakJQOejgxsSoaqmzgdhdCxqsokUUd/rqWiRhEfeab9KN+LIO1
 SPPXQYwOBloFzGT/CmCPpKvTodxb6etBJnmkbWMGPR3IXbvHyFSmr8wG22QQV9TX5xws
 tcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793932800; x=1794537600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gq/d0KwPPYo52ABxaaA//hWxeVPvL++rdqpTw0UqREs=;
 b=RwgrF4cjGizmMuSPJhVA3G6lUtA4fVVuA+9t/2sYxeS4PrieUlUoHl+zRHapCkCm8h
 0a05ZDU+bGcy+T4QTXdT58BAD1S+oH3hdGrVoRfTBgb2ciu3REdu+RXzl/koeb0OYkRN
 AnxiI8F6DPyHvSVg/83nYM8Dj6Bc8Yi2Py2C8t+K0sL2trhI8bZP9FFPhyXIhREvJEkx
 TNrUZpcGOen1iCIjTAPAE8xq53uSCzzdvW4UzNq92kouw4fnGHufudpttsTFNXWHzHPn
 C7VhAdXbVSShyIOoDZiuA944MHA4ZGwoF+WZZRAb/IjPWM++oMwcV+2MBUDH5+fMvWBb
 tWiw==
X-Forwarded-Encrypted: i=1;
 AKwUvByIjYFgC2S8baEpqv6HyANVdiRk+WrnufhddgjLZZJ4Qs29hf/RPYC2VVXgJ2bL+DfFSsZ+Z9rtUw==@nongnu.org
X-Gm-Message-State: APuU4Z+l/GkJl+kQ5lMl5JMQoni4tbfX5dYMoQdTWGXjfDCqgbAPOYAk
 u2UUS4iseisTthQLGu56mEUSx5I9ZNyqI33G4A+hQOyMaKPzvkh7jVlK
X-Gm-Gg: AYBFou0eGIONxngLaiQRTQ2bIqP8cXhnsAdj4bJf9s8iysYZlSqrXRGUM1iint2DIBQ
 icFNtBPaf6qgWr1UACkenw7WX9E+fblt8UVwUYNhL8AWelb2xm6rkgXNTI3fWGQ3T0bj4WXzoNe
 zsznHYtZN4+P6CAqXOcY9hM2wXM52mTA87moQW3No9bi/INEKooK7Z3jJiJWi9UgW3Og0mAXsB7
 nHcu+cG8p1f/g6USEmqQIM1ObA0Juy+CQnC4fP62wDAUzJEfAPmMQBA1eOpI39IVhi75uT2Rc5Y
 pGWCKiHD32lh5yJCzOWapAAOIhaMLpv4JX1Q5tEuOs90n+IOXkDJlcI8eauVyM4ACIqY1xuifjS
 GhDFy/1a0+hlu1Lj7DXI9pidXq2YNTobHUpIAyqe5GN8P5RW/ImQ16aa+LgqUkNM7LrGWyKHVs7
 UaZcvNyP+R/6xHZi/lh1U8mBhHVL6sSqFmB2VLKt+R4Neet8s7LqymQV3jIrquC+WKbrcMRlWzh
 5NKRFE0O5tYuWnT9AngRfax+Wpb9Fizxv1W7ZZTxJ/HJld0knryOaO7MHsCjhxUQQeTtEC2qH/9
 wcXhmiReyAE68958qYKGAZNndviQhJx02HUHWy+9cMfavCtt
X-Received: by 2002:a05:7022:3c08:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1b25d31d662mr902654c88.28.1793932799300; 
 Thu, 05 Nov 2026 18:39:59 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1b25e4efa6fsm1108318c88.20.2026.11.05.18.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 18:39:58 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 2/3] Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu
 to riscv targets"
Date: Fri,  6 Nov 2026 10:39:34 +0800
Message-ID: <20261106023936.772-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit 2d3e6b4003d5380c245ce8ffac4b8866f6d10a33.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5beb602338..aa28098e10 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -27,7 +27,6 @@
 #include "qapi/qapi-builtin-type-infos.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "qemu/target-info.h"
 #include "qapi/visitor.h"
 #include "system/system.h"
 #include "system/kvm.h"
@@ -2241,7 +2240,6 @@ static const TypeInfo kvm_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 static void kvm_cpu_accel_register_types(void)
-- 
2.55.0.windows.3


