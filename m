Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D19ACA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChRV-0005Ou-1R; Fri, 02 Oct 2026 13:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChQL-0004E0-Ot
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:52:01 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChQI-0007Qt-NR
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:51:57 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3510b42f4e3so598606eec.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963512; x=1791568312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sB6wgEvVNcwq25z55JvixoNQOs+J2ayZm8e/ED1pw70=;
 b=PLtqjOXTaKhUn3LWIHAhZahRHKiSWiIMF0Ulhhzm4AojXkwZ1/0Io3B8/WKoxt7aZ7
 vtrRYdDdXXIIhHEZ0UJ/iekRENKmhVN0LZtn/zWRLpP/N8stKfQUPY5SdDUyA9PdpHWH
 8JsWh1zZ7CAcs770B9AjpUtesH4Oj2HwcBzMU+uBG5vsg7DqlV7LKjESSsq8Vard0gTX
 ZzTcerOLVS1S8Y0P+yYCSyTYg/2RcmILUq1iG1N4ueJovQgXkBGvGwZGey/QFi9QE+QR
 nL4SNgs1MVC3fD1oKWhdj50X+tSN5ECFhsrqoB8DmsI+7NCVvDFG4fZUtH5IvPSAlxC0
 UifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963512; x=1791568312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sB6wgEvVNcwq25z55JvixoNQOs+J2ayZm8e/ED1pw70=;
 b=aSNo0CarYIPOn7JVctdegxche7XsyoarDDvbzaVfIQZaQ1kVMeXa4BHNp29wqN0qXK
 OLdSEqkKEFs7dVy4j+lI+nEyhNP8HU3W2gkADMFlviHq8bwYg/PLjX3C9L4lWRJn+D3v
 XZSi6ediJP7j0qu/pJxmXXoGkhgt73DHf5GIFo9K8LPKuZ4T5Kq1Vf7qbVAZoYgOlVF3
 nhPCBTy3ck2JGzMO8OWoI2vzlHSJujQX2koAyNkpnCBVeWZMN1preOgQSlIm0k6Rimlr
 Dkf4lGPipVTUioUtkAb4cmglkGESIO9e2VQBtoWBz7B1XzO1J/hFwBQ+e9AQBRCQdAOZ
 NP4w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzs7FC5nocWYg5HfwPmazXtCKFnEs86uOFKy+DVSMoG1DkrNsDfY9y1OALWjwE0eBR/dVvoYVzGZA==@nongnu.org
X-Gm-Message-State: AFuF++kGqoJtJaFUSZHvotSOUYqHSZR/CbbDKODBXbqdtW3XsU01HolI
 aaNETzvvcHPPSawSlu3u3t/3w3FPQRnJfY7c/D60YIYTLFF2D0RXmbTq
X-Gm-Gg: AYBFou39Y+K3uChnx53twVhGnAD2AGwv0KujXtjK1fNaHMSN5borgmvMEqVODAev8Y8
 cULRI3K233Kdtzq+kR9uJFt+kE0YOvAdTA7x3qqTP4xrDuGfUtyH3t+OUSAw2//YDOmIfqO88m3
 dHLmYQ/jFOvaQ1JTUf4CLxxcBkR5SLnV+17Y6RqpjXtUBlwZx5kPCmJ+DpK6ka9+LPQaGW+YIGM
 1Ul6NPVSTH1nXa/LEKBOv//pCyuD8M8gua8u+QPL2DC77rk4YE05vRuAJ1eDoRpntAA6x/LhWG2
 bqPmoodlWHqehDbKapu6Z6c2kpGcarW+ZufQftmion4c9vImxI5avz5ZbZgIiDN0rdBBd88mBZh
 Zg7K/njn9BCMfmqr700BZ4Q43p6tG8oP0+yo+Sk9qBlQHfwhzmJ46zVKIi+TJ3YbZoqUfU1HCDM
 37fkZKM+TMz33TOBvUjDa3uyWQatWK1TWEKY5rlmMIkCdxy8KEhCAvwz144IcaxLtmF+utW3oJw
 h+B5zooUgbzwxY1YoQnVVQvxC02Xg94
X-Received: by 2002:a05:7301:b0a:b0:344:1bd9:1f0d with SMTP id
 5a478bee46e88-34f150d42e6mr3482254eec.21.1790963512373; 
 Fri, 02 Oct 2026 10:51:52 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:51:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 08/27] target/hppa: remove hppa_dynamic_excp
Date: Sat,  3 Oct 2026 01:50:16 +0800
Message-ID: <20261002175037.1747-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use cpu_raise_excp_restore() for FPU exceptions and remove the redundant
HPPA wrapper.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/hppa/cpu.h        | 1 -
 target/hppa/fpu_helper.c | 3 ++-
 target/hppa/op_helper.c  | 8 --------
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f453444d7f9..da3cc15fe9a 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -407,6 +407,5 @@ extern const MemoryRegionOps hppa_io_eir_ops;
 extern const VMStateDescription vmstate_hppa_cpu;
 void hppa_cpu_alarm_timer(void *);
 #endif
-G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
 
 #endif /* HPPA_CPU_H */
diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
index cdbebcfeb3a..1115b90407d 100644
--- a/target/hppa/fpu_helper.c
+++ b/target/hppa/fpu_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
+#include "accel/tcg/cpu-loop.h"
 #include "fpu/softfloat.h"
 
 void HELPER(loaded_fr0)(CPUHPPAState *env)
@@ -131,7 +132,7 @@ static void update_fr0_op(CPUHPPAState *env, uintptr_t ra)
     env->fr[0] = (uint64_t)shadow << 32 | fr1;
 
     if (hard_exp & shadow) {
-        hppa_dynamic_excp(env, EXCP_ASSIST, ra);
+        cpu_raise_excp_restore(env_cpu(env), EXCP_ASSIST, ra);
     }
 }
 
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 9c560a56d34..c1728f1fb91 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -30,14 +30,6 @@
 #include "user/page-protection.h"
 #endif
 
-G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = excp;
-    cpu_loop_exit_restore(cs, ra);
-}
-
 static void atomic_store_mask32(CPUHPPAState *env, target_ulong addr,
                                 uint32_t val, uint32_t mask, uintptr_t ra)
 {
-- 
2.52.0.windows.1


