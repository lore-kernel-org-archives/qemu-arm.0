Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5076345ejc;
        Thu, 31 Aug 2023 06:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzENsMLfBKAyiFWhJXayZZsc7BvcPqOUGx6ijvsR6BqceC4+ei3pBu/kiDEE3gu827GgbK
X-Received: by 2002:a05:620a:4004:b0:766:f972:73e1 with SMTP id h4-20020a05620a400400b00766f97273e1mr3410158qko.26.1693487028735;
        Thu, 31 Aug 2023 06:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487028; cv=none;
        d=google.com; s=arc-20160816;
        b=c1B5j2OCmHqGGs2QFyBmBuMEwomTo+Z3xwiy8Y4CX+LdvDCz0NTNgdWXWgRTYs9ZZZ
         OfOYajpGCYlm51OJw5I6zxhfBc+3X8RMZC1kSr375GQGqOZ8BpAexy7qemTeDZZ0CSOO
         sS4gJ1hRfwh9caXXBd8Fu+f/2xj07j4OtQuwYDGdaJHivfPN01vSAYiyjxNVzgBNwePV
         p8W+Qu73mHGqDL+FuvuABBy/PxkUSgHJOqFG2JJIk9L1N698u5W9hof2a7w7ADIZzg03
         WkVtIkfiQiisQuzOtnd9hjpifNyL8JluG2XjAiD5jE5PMBvJksemR1VD4TnJ2G3KQkX+
         EAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RGsHEuyFoG4D07fPwCyTopmI6+5DcT12Nv/vCGRvwBA=;
        fh=zPby5tpCTm8ppSrp1rs0jVIwH/bVa1BdpqaRaDY5qN8=;
        b=NxqVD7In/sbUFIrBTty8juNf55Y6XxiZbcr4AzX2Af8g3K6EdZj9MSX/aIF49ICYmI
         9wSNom7QxVEHltmYIK8c22Ros3FJ+GU/VAdDcCXqach4OACVUUyKd7xYteqeUJmkFWK4
         kkQWBW9h1jkTyDL64Cx5u1GCT950T98wt8TUHqGXdt8q9SWL77LMV8OkUTT2ChsZAHpk
         USDmCSK7s8N17gGsTYi5gZ4RlOO7FFJ5U+0QeUgEohpw6bJgQj1ORneB6iRVwinAbZGn
         SIYK7p7WwBq7HHB611g/Rzj9GSV0hOLoV45mr8horscsOC2jdAxbbiyFmz8rvHsp/YhF
         sGKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jAK3cfG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a0a0900b0076ef3e972d8si916805qka.201.2023.08.31.06.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jAK3cfG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhIC-0001Mo-Or; Thu, 31 Aug 2023 09:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFG-00032q-T7
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFB-0005Od-HX
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so7202635e9.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486668; x=1694091468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGsHEuyFoG4D07fPwCyTopmI6+5DcT12Nv/vCGRvwBA=;
 b=jAK3cfG84TIOtj2LAh5tqKi6QMHrpgt/Y4R4eOj8QbIhIiKsSL1lfi+rKbgpN6iZjk
 dV2D+Jz7Y49hBx/OP0UsgNA0Fyh7GDJ63mnIruQmLrMZrRlCQ2qaqd3ozYkt28UQQgjr
 1P3B5wkR9XRv+h09TZc04anoAnDb8p6Ub1jD/+X/BrNRnE5hR3D7L3Ks54AICYoj01ys
 Jup516hQV0zQMzLSEH5uVhBMasEEdy+fs/u6xCTB5FZwtogwRLFh04waMXbXAX7dyrBm
 RVXtLbGMjLo3qmYXbSUXKljPEYbAeH10Aj5iqBV/xAeLnHC7F1TbvjFpbHELXxSKhZf8
 5UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486668; x=1694091468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGsHEuyFoG4D07fPwCyTopmI6+5DcT12Nv/vCGRvwBA=;
 b=KGifYuE6kVZGBPDs3l6LR1Kn5Rys8H8wiuoVOzB4k5HEY+cJhZa5/4yQIvopGM2HWl
 a1bSqPnYIppZ7q57T1oM+rDkUf3LR81Un19TwUY91gtwWqiR2gWG822loO7TpiK3oocp
 lcPk9TA5NHXIY2lhJLfOX0/Ja7/GutYW3UAVg7+sjBmqyWIy4u8fD8rCn9+pMs2Am23r
 5qTDbhLWhrc3+HuJeFWwUz/C6eOfki4PeN8WFyKHjqjnRsCSOxCejHY0aOcex6GPY/6/
 Xh+utjH2xCzLXL58IhUXgC3EiSavAgLElGlxlf4DwUIM2krCX9yJFzBl23BD9TzgSKS5
 +XFw==
X-Gm-Message-State: AOJu0YzzPhKrvimOr12pdIj82yPHTh00YIZHl06tRisXrunq0xa/Gcmc
 YDoU/WFMInR+MUJog+5YPPzx1H9T3jEyj+a69x0=
X-Received: by 2002:a05:600c:ac4:b0:3fe:1b4e:c484 with SMTP id
 c4-20020a05600c0ac400b003fe1b4ec484mr4008814wmr.5.1693486667797; 
 Thu, 31 Aug 2023 05:57:47 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d4f89000000b0031c5b380291sm2184139wru.110.2023.08.31.05.57.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 10/41] target/translate: Include missing 'exec/cpu_ldst.h'
 header
Date: Thu, 31 Aug 2023 14:56:12 +0200
Message-ID: <20230831125646.67855-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: SLlYhdzejbNB

All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-4-philmd@linaro.org>
---
 target/avr/helper.c                  | 1 +
 target/i386/tcg/fpu_helper.c         | 1 +
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/loongarch/cpu.c               | 1 +
 target/mips/tcg/ldst_helper.c        | 1 +
 target/mips/tcg/msa_helper.c         | 1 +
 target/riscv/op_helper.c             | 1 +
 target/riscv/vector_helper.c         | 1 +
 8 files changed, 8 insertions(+)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index e6e7d51487..fdc9884ea0 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 6f3741b635..4430d3d380 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b5f0abffa3..226689a4f2 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 27fc6e1f33..65f9320e34 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index c1a8380e34..97056d00a2 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/memop.h"
 #include "internal.h"
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 29b31d70fe..c8597b9e30 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -22,6 +22,7 @@
 #include "internal.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
 #include "fpu/softfloat.h"
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 9cdb9cdd06..7e2f1908ee 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -23,6 +23,7 @@
 #include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
 /* Exceptions processing helpers */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bf7e0029a1..bc9e151aa9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
-- 
2.41.0

