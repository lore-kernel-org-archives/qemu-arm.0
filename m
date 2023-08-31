Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5083436ejc;
        Thu, 31 Aug 2023 06:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpPdmAcEQ5rbof6nEOiazXebQVFuqfAo2X3w/lW/ovD5jQ3At6X/88vYwdgIIqZb50sgFg
X-Received: by 2002:ac8:4e86:0:b0:412:1c47:773b with SMTP id 6-20020ac84e86000000b004121c47773bmr3096982qtp.63.1693487501311;
        Thu, 31 Aug 2023 06:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487501; cv=none;
        d=google.com; s=arc-20160816;
        b=Y373yNKbE/dXHZqyw1tN2/acYMNy9afRKh0Qubw4LOT94VDBNfdpzRLkMC6K+kdXGi
         kIFD/4TEH40kN7+Eg1pqN4WNub/SInXus/2D7j7HoMaAXQkS3y1xVPOwxM40wa1Mw+gB
         o0fDaNoXS95/1Lzcnoiv+XsPYmfSD3TSMqfYqFnrkyB+MvET4qXb1Gv1zTUOKteJGZu4
         /YEjXMZ/1NTNlXcudZ4XkWJdAl3FlmGQck38PZUt9SFnDr7fbsiSyiT9Y0xoGvP7P49j
         aRW6DBki3ZvBgakvWRJxx13kqvDPNCteY1srO7jMEK3FwKcnFXOLW6HvPS5QUQG1svJW
         iqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=npXC2cUG3xwBM86LQFtlABD0NAvwwGboOAIVdLWrRRI=;
        fh=dr7PdaRKoWbuNE9hteFBhkgFoOt/juYsjcguatGTkbU=;
        b=Tc/M6TGO8KaudiqxDzlBU3C88aBCuHGmFb3m/PQ6jUXN6P1p3pqEPKJ1HFZxZs9ztZ
         0hOkYnVILybPRHycCnDX3kAF2Msx2vVsxdmezJbIEusutHO7RcdEVqF14EZxDzVuvjsn
         NnATasyTKd/O3KqOh0WkTqYPTpQURtWCJLmQgIDHpl+Re+mW/e3NaeAjyfJzWBXQNDaB
         QECvLMZiVgBCj8qQHp7BhZ60EMDUDyMIyt3AR2p1fkEg8728/mp7aRnfybGPEYBn6gai
         6Umdl/w3EPcK77HPri9JP/rJJ4NNDonjpoLC3EhfQtBwm7bAlK+zW65mdvjdeYKzIRR1
         TVaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6c02v5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05622a019000b0040d6219d809si801796qtw.79.2023.08.31.06.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6c02v5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhIu-0002Sy-1Q; Thu, 31 Aug 2023 09:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFl-0003KC-Er
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFh-0005aJ-Cf
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fef56f7248so7533865e9.3
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486703; x=1694091503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npXC2cUG3xwBM86LQFtlABD0NAvwwGboOAIVdLWrRRI=;
 b=M6c02v5UqYa4WmSRhnXr81EZ8h646oOAEtyJMpQLOm2jEfnUPS/aeHCnf7uWW9BznD
 tSS5Afi2uttVt/WuXUcFgty6t1mjkk644s/cTn6PephoVZ5u5grPvpC0hUko1Gh9fkCu
 y+oFHz4drO4CpePNxdi8Sy7bEkHDN5qteGY4EFm93OXTvdC1IYoOzKdo3zeY+DCCwqis
 i6bawe4XwVQy+EMxygHK/R8x+Q5HpFXh9W8r0NrQCcjE2vj2yl23Rln6IPMZSAHOh+mu
 eMEenChJf53ubz72RoU1x/XOSUp2Hg3Ya++dUkDRfBWBrw7fKyDmHFl0H/ljDjcf4OvW
 tMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486703; x=1694091503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=npXC2cUG3xwBM86LQFtlABD0NAvwwGboOAIVdLWrRRI=;
 b=Gf73c4P4FdfsX6qR5BfD+BiAc/kzckSsRfkYM8W2GbvM4zoZFzlFHG4kYnTF2b+zRe
 Pdh3JUMHVSTFmjDQzjpMlPRBqT4CXEeqOA1V2fW8bpuqr46OJs5WROu645LEtoWVmp2E
 3kxDET/qs2BaqIydXZZnqLgqejaP6V01/x0a7RAfYC/kMKVp0tOrJoVjtx79KbqBwnIF
 SF7WjGyle/Ty+Krxpm93+Kq+yWls6p8IvH/FgFElGKXEFv0MG/ZRzO3IafY2yUd+gnzY
 SnYJHfpTtaPHUPy5YptwPmRMHMWn08vlGoaMWklzwbXa28gfYTmdW6K7wV702ASq2QSg
 wHng==
X-Gm-Message-State: AOJu0YyawplxZpsIqyR66LzePycenD66UCyKuLspj3AHE+ZTbBQtPVqT
 r2MzrjV0Fkgmh7HRiofo0AY+dAMM821QT5rZeyk=
X-Received: by 2002:a7b:cb8f:0:b0:401:d258:ad26 with SMTP id
 m15-20020a7bcb8f000000b00401d258ad26mr4401784wmi.19.1693486702890; 
 Thu, 31 Aug 2023 05:58:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a5d4ac3000000b003141a3c4353sm2134044wrs.30.2023.08.31.05.58.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 16/41] target/xtensa: Include missing 'qemu/atomic.h' header
Date: Thu, 31 Aug 2023 14:56:18 +0200
Message-ID: <20230831125646.67855-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: f01U8/oM0p1p

Since commit fa92bd4af7 ("target/xtensa: fix access to
the INTERRUPT SR") these files use QEMU atomic API.
Explicit the header inclusion instead of relying on
implicit and indirect inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-10-philmd@linaro.org>
---
 hw/xtensa/pic_cpu.c        | 1 +
 target/xtensa/exc_helper.c | 1 +
 target/xtensa/op_helper.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index 6c9447565d..8cef88c61b 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qemu/atomic.h"
 
 void check_interrupts(CPUXtensaState *env)
 {
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 43f6a862de..91354884f7 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -31,6 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
+#include "qemu/atomic.h"
 #include "exec/exec-all.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 03e2c1889a..7bb8cd6726 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -30,6 +30,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "qemu/atomic.h"
 #include "qemu/timer.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0

