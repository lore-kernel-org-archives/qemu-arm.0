Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3518475ejb;
        Tue, 6 Jun 2023 07:14:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qv5MVFGTGywZzr4CV5N+GsXHuLy9ngp/KDfOTAq+a5XonqwiCa+e8OHA37St38j5/lfzo
X-Received: by 2002:a05:622a:349:b0:3f6:b0dc:1084 with SMTP id r9-20020a05622a034900b003f6b0dc1084mr2579421qtw.54.1686060867352;
        Tue, 06 Jun 2023 07:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686060867; cv=none;
        d=google.com; s=arc-20160816;
        b=dVUiEGwd5fsaQc4mBc3wf/dw+fnuvcAnu8y7lBpq9Fgyji3qyQINlBON7wSHZ3Xf/q
         7yxlSzzPjB8wkIOAZPfoQv4b0Oj/60ux2cvmsXXkxCwSdnGKGC/EoP8yCNqRv/4HBBWS
         RgLiMX8tR2wWSzWCtm6zBup/e49h9FlOKwLVdTq6G67eSxza5LQ2NRpm5JTSRRJI091z
         /p1oxxyy4Y2JkoLAkZ6YqAj2AS0poWnfqWnENkLf1ayzO3isFDnUIROZT631AHbBHwAV
         KWpMHKGdf4wd7ARS7oJ9rIsN+lCDJFgYJMUq4mOT2NBfZurcodaah9iHeP2BrI0RDEle
         RQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8UQAuFP30266AN4qnHJPcBraOFHFZpQqvUy0mONI7XQ=;
        b=VquVKmgLk4dj1pre7W5ggQ1GrCVyeTOoZq7zkvIRaeUAnL6ygelTaUQsBfMJSf3S6V
         G3BA/K8XhRASh91ow2014RG05ccjKuJG45Zlz4tCtFK8ZCYC9yoK9gF0N96ZRyokdxSi
         lX6tW6cH3rvQmU4Ok+uMdHB0MtxE4h88pzIF6flxrPkC+kKhesH5G/CX39qXeAKSETKX
         V9/CDrN8ADu5uMWeBEdcwE8ZLAimkIkMNfAFeU4PZ2AjuNa7/fKhWP1I+dFTaTyaCJJ2
         sbc8yNCjRSGRDXUcMDa6mNMcuWbsFPNLZb5DrWjEPY+jaX1jsS7P5a3SXuQWiKFTKQox
         6wrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aQhtZ/VW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a05622a058d00b003f6b7262df3si6300723qtb.298.2023.06.06.07.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aQhtZ/VW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6XR9-00042k-Uo; Tue, 06 Jun 2023 10:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR7-00041h-Lz
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR2-0005VU-2u
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so53788365e9.2
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060799; x=1688652799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UQAuFP30266AN4qnHJPcBraOFHFZpQqvUy0mONI7XQ=;
 b=aQhtZ/VW0S9+eY6cAy1aj8hGuZ+UDrJsPnpKCfEuEH9G9qe1sHiFEnaZ3d8O/cwqS5
 XyLasJA4JTUp1JDJyIaGF8lWI9Dv+GM5w/ufEGA1Ctkzg9gg8tVl4/aOqu3wzIfJnVOQ
 fZvk3r0JMAwwPv7PtdyfVbiBBoGRzdYsYoJ1QP/IQzV57Rweg1domcbJMdHH8Q6OX/6Y
 HTpcNEAK4H1cBQlmo19FmCcVJSLAiUsCpfByqlRpSK5QKnkgLZNeNRsBHagh5HgFAWgM
 3jCQ4ezFPw36XnamwrQHBJl/RqevfBJRpiG14AhTWjHysrj/hPxiGtc8MkmKiZZXFHnE
 67bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060799; x=1688652799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UQAuFP30266AN4qnHJPcBraOFHFZpQqvUy0mONI7XQ=;
 b=E5fIqGQM00aKgwzbf6pzubWJ/jEN87XYTLnRWK7gZs3LAz8rxqzP9ymzt5C1n4a93e
 KDBb6IlVxQ62SP34fnBMPWqvLIAy0NuSBGSD0oUFfHQXMEGUNKt81R1tvwE8drfvBV67
 UdwUnbIaqIM3p2G+7xSLovCj6wJPZ/wED6dtL2xk/IXt/Vhu9/dpCYjCGt/RXHgoS2J4
 3oqleXlfwxznS+5ImwjCd+UUhWvPKuqjA61mEVNsiAbAqiBOzAspHJgy8m+lEyURsMTG
 bFTaAtC7cSAKg6jT+nI7CBvcPb81VUgq3lMQ5o+SwOIp6CaidNacuOqvu2PVGe1mZS79
 4ahw==
X-Gm-Message-State: AC+VfDxoux0GKK9oooVg97dbC9Z/Zkgmae7uVI/k3VrWTDiYphKUItem
 kxtENgqxstSxZlZdOlw8b8G2Mg==
X-Received: by 2002:a7b:cd08:0:b0:3f7:e4d7:4469 with SMTP id
 f8-20020a7bcd08000000b003f7e4d74469mr2220729wmj.41.1686060799304; 
 Tue, 06 Jun 2023 07:13:19 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1c7405000000b003f6f6a6e769sm14204324wmc.17.2023.06.06.07.13.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/5] target: Rename per-target 'helper.h' -> 'helper.h.inc'
Date: Tue,  6 Jun 2023 16:12:51 +0200
Message-Id: <20230606141252.95032-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RTaATrBDAEfy

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included 'helper.h' as 'helper.h.inc' for
all targets (updating the documentation).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/tcg-ops.rst                       | 2 +-
 include/exec/helper-gen.h                    | 2 +-
 include/exec/helper-proto.h                  | 2 +-
 target/alpha/{helper.h => helper.h.inc}      | 0
 target/arm/{helper.h => helper.h.inc}        | 0
 target/avr/{helper.h => helper.h.inc}        | 0
 target/cris/{helper.h => helper.h.inc}       | 0
 target/hexagon/{helper.h => helper.h.inc}    | 0
 target/hppa/{helper.h => helper.h.inc}       | 0
 target/i386/{helper.h => helper.h.inc}       | 0
 target/loongarch/{helper.h => helper.h.inc}  | 0
 target/m68k/{helper.h => helper.h.inc}       | 0
 target/microblaze/{helper.h => helper.h.inc} | 0
 target/mips/{helper.h => helper.h.inc}       | 0
 target/nios2/{helper.h => helper.h.inc}      | 0
 target/openrisc/{helper.h => helper.h.inc}   | 0
 target/ppc/{helper.h => helper.h.inc}        | 0
 target/riscv/{helper.h => helper.h.inc}      | 0
 target/rx/{helper.h => helper.h.inc}         | 0
 target/s390x/{helper.h => helper.h.inc}      | 0
 target/sh4/{helper.h => helper.h.inc}        | 0
 target/sparc/{helper.h => helper.h.inc}      | 0
 target/tricore/{helper.h => helper.h.inc}    | 0
 target/xtensa/{helper.h => helper.h.inc}     | 0
 target/alpha/translate.c                     | 2 +-
 target/arm/machine.c                         | 2 +-
 target/arm/tcg/translate.c                   | 2 +-
 target/avr/translate.c                       | 2 +-
 target/cris/translate.c                      | 2 +-
 target/hexagon/translate.c                   | 2 +-
 target/hppa/translate.c                      | 2 +-
 target/i386/tcg/translate.c                  | 2 +-
 target/loongarch/translate.c                 | 2 +-
 target/m68k/translate.c                      | 2 +-
 target/microblaze/translate.c                | 2 +-
 target/mips/tcg/translate.c                  | 2 +-
 target/nios2/translate.c                     | 2 +-
 target/openrisc/translate.c                  | 2 +-
 target/ppc/translate.c                       | 2 +-
 target/riscv/translate.c                     | 2 +-
 target/rx/translate.c                        | 2 +-
 target/s390x/tcg/translate.c                 | 2 +-
 target/sh4/translate.c                       | 2 +-
 target/sparc/translate.c                     | 2 +-
 target/tricore/translate.c                   | 2 +-
 target/xtensa/translate.c                    | 2 +-
 46 files changed, 25 insertions(+), 25 deletions(-)
 rename target/alpha/{helper.h => helper.h.inc} (100%)
 rename target/arm/{helper.h => helper.h.inc} (100%)
 rename target/avr/{helper.h => helper.h.inc} (100%)
 rename target/cris/{helper.h => helper.h.inc} (100%)
 rename target/hexagon/{helper.h => helper.h.inc} (100%)
 rename target/hppa/{helper.h => helper.h.inc} (100%)
 rename target/i386/{helper.h => helper.h.inc} (100%)
 rename target/loongarch/{helper.h => helper.h.inc} (100%)
 rename target/m68k/{helper.h => helper.h.inc} (100%)
 rename target/microblaze/{helper.h => helper.h.inc} (100%)
 rename target/mips/{helper.h => helper.h.inc} (100%)
 rename target/nios2/{helper.h => helper.h.inc} (100%)
 rename target/openrisc/{helper.h => helper.h.inc} (100%)
 rename target/ppc/{helper.h => helper.h.inc} (100%)
 rename target/riscv/{helper.h => helper.h.inc} (100%)
 rename target/rx/{helper.h => helper.h.inc} (100%)
 rename target/s390x/{helper.h => helper.h.inc} (100%)
 rename target/sh4/{helper.h => helper.h.inc} (100%)
 rename target/sparc/{helper.h => helper.h.inc} (100%)
 rename target/tricore/{helper.h => helper.h.inc} (100%)
 rename target/xtensa/{helper.h => helper.h.inc} (100%)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 6a166c5665..c74849a231 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -151,7 +151,7 @@ Types
 Helpers
 =======
 
-Helpers are registered in a guest-specific ``helper.h``,
+Helpers are registered in a guest-specific ``helper.h.inc``,
 which is processed to generate ``tcg_gen_helper_*`` functions.
 With these functions it is possible to call a function taking
 i32, i64, i128 or pointer types.
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index f7ec155699..fdb3ec39f5 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-gen-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 6935cb4f16..fd061749be 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-proto-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/alpha/helper.h b/target/alpha/helper.h.inc
similarity index 100%
rename from target/alpha/helper.h
rename to target/alpha/helper.h.inc
diff --git a/target/arm/helper.h b/target/arm/helper.h.inc
similarity index 100%
rename from target/arm/helper.h
rename to target/arm/helper.h.inc
diff --git a/target/avr/helper.h b/target/avr/helper.h.inc
similarity index 100%
rename from target/avr/helper.h
rename to target/avr/helper.h.inc
diff --git a/target/cris/helper.h b/target/cris/helper.h.inc
similarity index 100%
rename from target/cris/helper.h
rename to target/cris/helper.h.inc
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h.inc
similarity index 100%
rename from target/hexagon/helper.h
rename to target/hexagon/helper.h.inc
diff --git a/target/hppa/helper.h b/target/hppa/helper.h.inc
similarity index 100%
rename from target/hppa/helper.h
rename to target/hppa/helper.h.inc
diff --git a/target/i386/helper.h b/target/i386/helper.h.inc
similarity index 100%
rename from target/i386/helper.h
rename to target/i386/helper.h.inc
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h.inc
similarity index 100%
rename from target/loongarch/helper.h
rename to target/loongarch/helper.h.inc
diff --git a/target/m68k/helper.h b/target/m68k/helper.h.inc
similarity index 100%
rename from target/m68k/helper.h
rename to target/m68k/helper.h.inc
diff --git a/target/microblaze/helper.h b/target/microblaze/helper.h.inc
similarity index 100%
rename from target/microblaze/helper.h
rename to target/microblaze/helper.h.inc
diff --git a/target/mips/helper.h b/target/mips/helper.h.inc
similarity index 100%
rename from target/mips/helper.h
rename to target/mips/helper.h.inc
diff --git a/target/nios2/helper.h b/target/nios2/helper.h.inc
similarity index 100%
rename from target/nios2/helper.h
rename to target/nios2/helper.h.inc
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h.inc
similarity index 100%
rename from target/openrisc/helper.h
rename to target/openrisc/helper.h.inc
diff --git a/target/ppc/helper.h b/target/ppc/helper.h.inc
similarity index 100%
rename from target/ppc/helper.h
rename to target/ppc/helper.h.inc
diff --git a/target/riscv/helper.h b/target/riscv/helper.h.inc
similarity index 100%
rename from target/riscv/helper.h
rename to target/riscv/helper.h.inc
diff --git a/target/rx/helper.h b/target/rx/helper.h.inc
similarity index 100%
rename from target/rx/helper.h
rename to target/rx/helper.h.inc
diff --git a/target/s390x/helper.h b/target/s390x/helper.h.inc
similarity index 100%
rename from target/s390x/helper.h
rename to target/s390x/helper.h.inc
diff --git a/target/sh4/helper.h b/target/sh4/helper.h.inc
similarity index 100%
rename from target/sh4/helper.h
rename to target/sh4/helper.h.inc
diff --git a/target/sparc/helper.h b/target/sparc/helper.h.inc
similarity index 100%
rename from target/sparc/helper.h
rename to target/sparc/helper.h.inc
diff --git a/target/tricore/helper.h b/target/tricore/helper.h.inc
similarity index 100%
rename from target/tricore/helper.h
rename to target/tricore/helper.h.inc
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h.inc
similarity index 100%
rename from target/xtensa/helper.h
rename to target/xtensa/helper.h.inc
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 1f7dd078d8..1fd9c18262 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -30,7 +30,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index fc4a4a4064..6d9afc5f00 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -462,7 +462,7 @@ static bool pmsav7_rnr_needed(void *opaque)
     CPUARMState *env = &cpu->env;
 
     /* For R profile cores pmsav7.rnr is migrated via the cpreg
-     * "RGNR" definition in helper.h. For M profile we have to
+     * "RGNR" definition in helper.h.inc. For M profile we have to
      * migrate it separately.
      */
     return arm_feature(env, ARM_FEATURE_M);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a68d3c7f6d..308f6a8513 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -29,7 +29,7 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/avr/translate.c b/target/avr/translate.c
index ef2edd7415..4205bf94b3 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -30,7 +30,7 @@
 #include "exec/log.h"
 #include "exec/translator.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 1445cd8bb5..3b5686cbb0 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..3d5c628885 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -33,7 +33,7 @@
 #include "genptr.h"
 #include "printinsn.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index d33813d173..f2e5ace845 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -29,7 +29,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..61fa64efa7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3146a2d4ac..fdbb9d25ea 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -23,7 +23,7 @@
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 551ef9e52a..8594313e8f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -34,7 +34,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..ffb40421a0 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -31,7 +31,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 74af91e4f5..1dfffe1c6f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -32,7 +32,7 @@
 #include "disas/disas.h"
 #include "fpu_helper.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a365ad8293..6f81efe90b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -34,7 +34,7 @@
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7760329e75..f5e8a25977 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 37fd431870..598759f813 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -41,7 +41,7 @@
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 933b11c50d..e27df3c9af 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "instmap.h"
 #include "internals.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 08cabbde61..5b60082749 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -28,7 +28,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7c549cd8d0..7db663c915 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -45,7 +45,7 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..df4c721cee 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -29,7 +29,7 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bad2ec90a0..99efd3ae87 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -33,7 +33,7 @@
 #include "exec/log.h"
 #include "asi.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8e4f99478c..ed40a2c8ef 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -33,7 +33,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b7386ff0f0..68495fc983 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -45,7 +45,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
-- 
2.38.1

