Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4FFC98328
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3o0-0003OW-PX; Mon, 28 Sep 2026 01:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3nv-0003Lo-Bb
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:32 -0400
Received: from mail-dl2-x14.google.com ([2607:f8b0:4864:38::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3ns-0007md-R7
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:31 -0400
Received: by mail-dl2-x14.google.com with SMTP id
 a92af1059eb24-1473f265b82so309199c88.2
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572887; x=1791177687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E/2Qp3nCn4UZKuGzVzJjcMz1KmS7snLXtD06CwxIVUc=;
 b=CgJj+hy+NEc8JIgWgQZ/+dy0+3Bpth85UMd3EqGU+RUNAJUt4Cs4OvoMhTKB+jVOgt
 IAik/bCgfOvTl7YgJ2ECuDN9J5CAyNu6/2t7W1r/v7a79YF9S1S5H+0nglcgJZjhMCMu
 XsBwx4PH/B3UYp/HGSv/42KepKovy+jTqw4gUUsnWDxGb+N2aY+r5elv5i7fESFt+Qmy
 1goKcscvWd+zh8OC3df7kcEll/gV1NQbrNxykFgt1AaaUa4FhsO5EB8jzimeshcLxkpj
 gnPnFIaaJMUZAgoVsPRrH6f6js+YhDgL+5lInTXcMk/TrsM+PWZFdvM4IiBLS7hYZWIl
 giPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572887; x=1791177687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E/2Qp3nCn4UZKuGzVzJjcMz1KmS7snLXtD06CwxIVUc=;
 b=byq5Bp7RVuqd5U7/9F01EupZgciydUfzYli4YYzIIIBelExOqZOVqErizSTDMEatUw
 F0npZX8UfkRayAJdj6+oxeCBiHvdWHidFHA//MWpMLxyxPtAafr+rr8JcAAIPm2WXt9u
 zGUFOP41/+QZxC+X6Dde+FR4ojjeDn0gNq790g5RzPI/xefMMGxwBB3g6DW+t+CadLeR
 G7P+W93jhrkzoN5VSXrz2aDLpo/+HqvolCY2tPKWVWSMaJDShW9xZTvQ8+B0XGdLuaDk
 s0W2loILVEHcBPZ5VlO87rjcIvLd0bch7iClqDniZLW6ZZQsaCgQTUvGz5r2GDj2N7u3
 8XRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByxbid4fBUS+Zj8wyfH9X9t7Q6KGxFRpL8V9O+Ii6cTDepl/PbxWuoqVxMfH6L3gh4tP6GgCpr+wA==@nongnu.org
X-Gm-Message-State: AFuF++n/UmRGyUOtjYyMBtTtPMi5oJ+kitMZkvFqkHevLokbod5jrdoL
 JfQow2RoQ01kpvXoqGCe6yFJa2exTLDvrDXIgAIVhyBV15Xu0ScE5QAo
X-Gm-Gg: AYBFou0NhRZa8niU1VytSwi9z1nLlUn42vSxvEjqTOjFDhp4zjsXrNZ9cK205ofyPAF
 ABQEgLCFxv4OX9FfwmeUYzU7+IqzE4XC/YPiO+T7vKDPhkzS56u/rzjwsYD4YsWrO0s9EK3fcN5
 ORrQYqRP0hCrBuVeKrFIl9qcgYbWFdSrp3S3aN0i11xE5Cct/6fRyFXMo35isGqhh5pdhL0UESk
 +//U4yJeCBSv+thg+Ugeo6KDRD8+g487MRitbdZcA9yoB3YHtYdE27dlhp0nb5AQij97ZF2Lc7g
 P+hZvD6rFxLu1mP1pq2ec7fn8RFtqCmqkHfiWmw4SAl7uerXOh20mjHphQegT6bClwNla67/Af+
 xyGlfSAfM+GTIQGsSA/CcFcyaEJrNL+l7tOaibVKLIuUeabB6zatMLC/A5A4E+mLnYXSbAT/4IC
 tZ+thOfdNSdnkG3HMw9pZZi0Jhpu56FdbHfb+Vvqu4ZDEYuDFv1KsJm4awTBEgvNbcjJofVuaC2
 akDTpU/i3dejKjGUMh7V76YTNN6Yfw=
X-Received: by 2002:a05:701b:2086:10b0:144:eaa7:2763 with SMTP id
 a92af1059eb24-146ce492bfamr8820295c88.16.1790572887188; 
 Sun, 27 Sep 2026 22:21:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:26 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 03/24] accel/tcg: add raise_excp and raise_excp_restore
 helpers
Date: Mon, 28 Sep 2026 13:20:29 +0800
Message-ID: <20260928052051.251-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::14;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x14.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add two TCG helpers next to cpu_loop_exit_excp. raise_excp exits
with host_pc 0. raise_excp_restore exits with GETPC(). Declare both
with DEF_HELPER in cpu-exec-common.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/cpu-exec-common.c | 12 ++++++++++++
 accel/tcg/cpu-exec-common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 31fed8e497f..d6277b7d917 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -124,6 +124,18 @@ void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t pc)
     cpu_loop_exit_restore(cpu, pc);
 }
 
+/* Raise exception and exit the TB without restoring guest state. */
+void HELPER(raise_excp)(CPUArchState *env, uint32_t exception)
+{
+    cpu_loop_exit_excp(env_cpu(env), exception, 0);
+}
+
+/* Raise exception and exit the TB, restoring state from GETPC(). */
+void HELPER(raise_excp_restore)(CPUArchState *env, uint32_t exception)
+{
+    cpu_loop_exit_excp(env_cpu(env), exception, GETPC());
+}
+
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
     /* Prevent looping if already executing in a serial context. */
diff --git a/accel/tcg/cpu-exec-common.h b/accel/tcg/cpu-exec-common.h
index 19359a97bae..1e82f3b14d3 100644
--- a/accel/tcg/cpu-exec-common.h
+++ b/accel/tcg/cpu-exec-common.h
@@ -1,2 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
+DEF_HELPER_FLAGS_2(raise_excp, TCG_CALL_NO_WG, noreturn, env, i32)
+DEF_HELPER_FLAGS_2(raise_excp_restore, TCG_CALL_NO_WG, noreturn, env, i32)
-- 
2.52.0.windows.1


