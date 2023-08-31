Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5083323ejc;
        Thu, 31 Aug 2023 06:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEY5HzOzor81BT8MgEnPNEG8eow9Cq1xKVFv1o7geoO0qrK/3oY8T/TOWI2azaC+D08A/a
X-Received: by 2002:a05:622a:18a4:b0:412:b64:9f45 with SMTP id v36-20020a05622a18a400b004120b649f45mr2730850qtc.4.1693487494222;
        Thu, 31 Aug 2023 06:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487494; cv=none;
        d=google.com; s=arc-20160816;
        b=JCrsSjj8UI5Z/0c7uXiZ+6TYG6bIBtiP0ga+B4zQn/1oGjw5yj24W107c5frcY6Kad
         /OI1iQnkzGkjFpAe45l5oT+y+HIV8zJn8PqYwkLOdhb6tTjOX/1JwpYQeBh8NH48pEpG
         AbWFf5fSja26tJYZLFBrHQyy3GLteo460YFC1b8cCX1cG/vZceUJnHphGj3PuVoMfIV4
         9Dzh38hEzw04XQvVLLEacMwIYl2aTybpkeC7hwXxHdjV8VrGzX7CeNrQAtsLqgCZZsti
         xuNhV0VXY1aRp/AKLbFXe8p8Q/tmOGFfhHndr97VxFV820iMyCdjJCqPwkl9CO8N4PV0
         bImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T8Rzt94Oq4ZBRDqKkCqv7vBHeUbY8NjNoX/xG/H7lQk=;
        fh=BMk5qXduLlNP8ROX5W9hIcNmA71lrvt8zpMzPpEU3K0=;
        b=y+OoS0ufXbGN72vFuyv0V32hz7shcK/P89ZxNb8aqWp0wArkRkmsQlOx5JUp2gJQhq
         aJ/IJUEFEfWQleVQbY6TGCk8TqAy8nFS8YIlU7YOWNEnU89uH/CXj73OYBpoQ4LPTEik
         5WyNkEaMfAC2TXwvwF4PGLWs4I5NIhX59eNv26j7ny+4QP4e7CiHuvjQy2t+0nSTf6TS
         ac58bNFhIs5TrM6BpATvInqdJpuV4vryVNGpqeciO5XWFQCgR8fnCRboqUjjIXUB4QpL
         2NtFJ2RkI9cL6Q35yNmtsNh3F2mOqmI7UFu5VRWsZ2Ge2nTj4pQJ65Mh+C7+WP6aa2sT
         GAyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKH8sSwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85743000000b00403cecf15c5si833877qtx.329.2023.08.31.06.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKH8sSwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhJ1-0003N7-Ef; Thu, 31 Aug 2023 09:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFZ-0003GP-2f
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFV-0005Wl-PZ
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso7427115e9.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486692; x=1694091492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8Rzt94Oq4ZBRDqKkCqv7vBHeUbY8NjNoX/xG/H7lQk=;
 b=jKH8sSwUSoJ7elCMQbgYaJQGskAMHLtrWHCIdolrFTpSBcbZqa7gWG9Dpf/GV6x1Jq
 /ipur8FQsosjH25elnexIN8Y4zI+Pc/yH65x5HpfU8hbvSGtH9B2ezfruTsRERvnA8kk
 8aTx8WPp4NPMkhEbIRhLAD7PoKb+y0dIf4ysPdbDCxiPj8pkMjyrXS0NAc07bfokfMUQ
 iltEF6pMhvcKFI4q0SteeYfuyu+X/RdoznAnH+2K3/CevFTukGUS6+qF81Qpqv08jJTO
 gwE6cZevgfrDr0vMzu226zYG76Z/eyUvLVaUFVWnIsdeZD+w0CVHFNTHO/w7FMJS6Nuv
 1yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486692; x=1694091492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8Rzt94Oq4ZBRDqKkCqv7vBHeUbY8NjNoX/xG/H7lQk=;
 b=I4ntHX7gP1ziXMNpPn+6pjluLo7C5UqiYDYfSqm6pOANwMrkrnYfuUxL/YSbMAfNVc
 pD2ABZwktIvlyrYSosu8v73ktmKNgG+v8FnNimhamUociCEM8RVvvqT8wetaLRcbGv7Y
 MrvLLObLOJYJNWj8i7IS2FopLNxOQPtWOG6LY6TK2EkSZX0L8IkqoA5aYqTJCXeLH3ez
 EgBuuNLTnOCQ9wb3wlGM9yXuPS8BMgCB6GrPdqBks4P8x3p7hN2MhxFx1RzMUmYkfunG
 n8IHT7DQRtZPQcE0sYk1SWWAVx65Fa1vokYD/8fo6LQ7hNsa/osPAaxJLitk/3qHx4Az
 Tdmw==
X-Gm-Message-State: AOJu0YztBHg+zJdwautBQbH5drggFDyIgBhuqfN4fvZOha4GJblTGiWc
 FERx/fVv+j+A/L+2jA227OeGxQ==
X-Received: by 2002:a05:600c:292:b0:401:b0f2:88c0 with SMTP id
 18-20020a05600c029200b00401b0f288c0mr4157753wmk.16.1693486691879; 
 Thu, 31 Aug 2023 05:58:11 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0031ad2663ed0sm2131830wri.66.2023.08.31.05.58.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 14/41] target/helpers: Remove unnecessary 'qemu/main-loop.h'
 header
Date: Thu, 31 Aug 2023 14:56:16 +0200
Message-ID: <20230831125646.67855-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: pHB870GMEuvZ

"qemu/main-loop.h" declares functions related to QEMU's
main loop mutex, which these files don't access. Remove
the unused "qemu/main-loop.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-8-philmd@linaro.org>
---
 target/riscv/pmu.h                   | 1 -
 target/loongarch/iocsr_helper.c      | 1 -
 target/loongarch/op_helper.c         | 1 -
 target/mips/tcg/sysemu/lcsr_helper.c | 1 -
 target/nios2/op_helper.c             | 1 -
 target/ppc/int_helper.c              | 1 -
 target/ppc/machine.c                 | 1 -
 target/ppc/mem_helper.c              | 1 -
 target/ppc/mmu_common.c              | 1 -
 target/ppc/mmu_helper.c              | 1 -
 target/ppc/power8-pmu.c              | 1 -
 target/ppc/translate.c               | 1 -
 target/riscv/csr.c                   | 1 -
 target/riscv/m128_helper.c           | 1 -
 target/riscv/op_helper.c             | 1 -
 target/s390x/tcg/crypto_helper.c     | 1 -
 target/s390x/tcg/misc_helper.c       | 1 -
 target/xtensa/dbg_helper.c           | 1 -
 target/xtensa/fpu_helper.c           | 1 -
 target/xtensa/mmu_helper.c           | 1 -
 target/xtensa/op_helper.c            | 1 -
 target/xtensa/win_helper.c           | 1 -
 22 files changed, 22 deletions(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 60fdd6f42c..2bfb71ba87 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -17,7 +17,6 @@
  */
 
 #include "cpu.h"
-#include "qemu/main-loop.h"
 
 bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index dda9845d6c..6cd01d5f09 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -6,7 +6,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index cf84f20aba..fe79c62fa4 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -7,7 +7,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index 8f97d04313..fb57bcbb78 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 0aaf33ffc2..5017457c5e 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -22,7 +22,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "qemu/main-loop.h"
 
 void helper_raise_exception(CPUNios2State *env, uint32_t index)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 834da80fe3..96cdb3c7e3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 134b16c625..1270a1f7fc 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -7,7 +7,6 @@
 #include "mmu-hash64.h"
 #include "migration/cpu.h"
 #include "qapi/error.h"
-#include "qemu/main-loop.h"
 #include "kvm_ppc.h"
 #include "power8-pmu.h"
 
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 46eae65819..c7535481d6 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 #include "exec/helper-proto.h"
 #include "helper_regs.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 8c000e250d..6ca5d12207 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -28,7 +28,6 @@
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "internal.h"
 #include "mmu-book3s-v3.h"
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index d3ea7588f9..f87d35379a 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -28,7 +28,6 @@
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "internal.h"
 #include "mmu-book3s-v3.h"
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 2537cded83..cbc5889d91 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -17,7 +17,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-#include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
 #include "power8-pmu.h"
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 49b6a757b7..7111b34030 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -26,7 +26,6 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..de31818daa 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "pmu.h"
 #include "time_helper.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "sysemu/cpu-timers.h"
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
index e6a4f6120a..ec14aaa901 100644
--- a/target/riscv/m128_helper.c
+++ b/target/riscv/m128_helper.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 7e2f1908ee..5355225d56 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 762b277884..93aabd236f 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 576157b1f3..e85658ce22 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -20,7 +20,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index ce2a820c60..3e0c9e8e8b 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index d2a10cc797..381e83ded8 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 57b75882c4..12552a3347 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "qemu/units.h"
 #include "cpu.h"
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 10a2b51f91..03e2c1889a 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index 5a1555360a..ec9ff44db0 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-- 
2.41.0

