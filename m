Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp155269dlq;
        Tue, 21 Jan 2025 06:29:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW293dDjSP+gxLk+q9VbCHu7jU9av1orFbJBs/aIbY98cz4xWJmparnVQ/ZEACGCUwq8WQ3t2ajWPx84g==@linaro.org
X-Google-Smtp-Source: AGHT+IHctkY96O1LCPgejo9WTdXoHxIYFlLZlrGatjvACWMfvi99rBIt/1WtxaSjEq5TORcOuKQU
X-Received: by 2002:a05:6122:da4:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-51d6f8f9f1amr12434367e0c.0.1737469749414;
        Tue, 21 Jan 2025 06:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469749; cv=none;
        d=google.com; s=arc-20240605;
        b=g9Uy5MipxbsUnyhipljEY7onnERouZ7IvHuPGl5SiYc0rhPwn2zfdtdYuAlvIHbgCM
         5x8Gdt+eoISEX/55crdEHyfgU4hpRlZ8bNbrZnnmOfULMZsCpxIkv0e2xFCsWuFoNwGw
         Z5YB7vwr5GHrWTACain8mUqTb0ghTVH38SRI1S1GlRtBfMrClUC2QY7yjyeHtIsFWrCn
         Kz13tdPm/qvH0M8L8WBC3uwE4TG7N8Izq1V4d5MuNT9G4MnkqZqHrrOV5VmE+QzfwYS8
         BVHp7qCMGUo7c5QU++R5eNZb50RcQaHTH9+nPyoZl+8JvrE0boEPTUKT9wNKBBQoFRll
         E90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5HU2b7p1M8gNy7Q1wMvIjKnoAVWtRUTk8UBT9dkhhN4=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=CU+tjEUrlXe4rnqeIkAM65iJUdgr8Cs+MKWzZp9foONPCnV/FJHFbSU1z/5wxEippc
         v+VJ8Cu4Q4FrMBZQf/cgdX3kqHogKH+nZNz33aqEOZf21lg0jccWub2TWXO8j9xVClo3
         E2eYnaVb2m09wPcXg0WMbrGfGxbEGqPqu2erCl3GxGHMs3tWs+/50rqWBeizAcknPUpL
         sVfGHeqUqEuM8TadznnBegJ5ZcMRWZXiHCdzucSiH0zRiTpuUW8OCiNeuc9yuHWznDyz
         AbpJb0HfYMTOFyKBAJl4OtcjkTtjZtoubN81Kjtip6AkM+ngq0r/nvhkhRVa3EHS5eMi
         6rKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x6oEL+TM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51cf57d7c62si3282009e0c.245.2025.01.21.06.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x6oEL+TM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFEG-0006oW-D4; Tue, 21 Jan 2025 09:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCX-0002ry-Tl
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:58 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCV-0003iZ-6w
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43626213fffso41803415e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469553; x=1738074353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HU2b7p1M8gNy7Q1wMvIjKnoAVWtRUTk8UBT9dkhhN4=;
 b=x6oEL+TMpKCORxVcsobLgkJ4lcBE97kQGMWWFC9hsOA6vuK7UHhlYyAtEiXgtThPUO
 7WG131z1HEBh9g4b5X9SILX9WJienge/1GsQj9RhYsYypCjg6suaxsXcR0tyOF/+YXRp
 id4AYjkd18odwte9UQxK3BkHbY1Z2rkst539sfIU9Rx4Xu/AYO5BC1fk9ZaMGbAgWzJO
 q1kLfsMoG9xb97gQI5h+jXvSiZdIr/K/spQ5E1+YKHl8TjIXoLu0skKBk00ssiPTMXV0
 cZdonGlD6UswZXE+jx5HdRxTv2L1ts8dJFt2ljOv5hGNjniDpu3sHbkmGxYPM/vCmXCd
 nrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469553; x=1738074353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HU2b7p1M8gNy7Q1wMvIjKnoAVWtRUTk8UBT9dkhhN4=;
 b=ACOGqAolol7JkWrruy7p5Pksk3Jab2hlTZAO0uibmlBhI/KXby5Jeorlot5E3leP7y
 mbu0llkgY/kV1F5InNI4lZ/QPSj3Yp6ielQa7LsSAhy7DWCLGxtQZUKx1zxsl8/4EXFk
 9uzj5KGgZxlMV6vVrD/gz8khDDkEkbF7kr8Dne1NNVNNtj9vRJ9i4rRaInrpKC7bsRi9
 iCcJDu7QI1H80lslWkL1lA15dyRPaWTbAZWQLOp/RxnBLVSnbww3I4cn0N3QT/VQbG9s
 cjVCJAxBzjgA/VXHlCRRoii8bi/Twvtnb809CdaVE7lGf7C5ZPeJZ02M/SfUIc90dV3m
 Ny1w==
X-Gm-Message-State: AOJu0YyKMM8dzz4CTr9PDvDefVf0GJ7zx0Ak0Lft+iwAHJl/4Y1pOTgy
 64C8fB6Hg7+CZuiGvjA8wqWuwkjNLq/1UCIXvySV9hGAd4xV6sLUuE+8ibHND9g=
X-Gm-Gg: ASbGncus9fzJ5+zPSG0yuYsnlPLOSJp47vt0WTfwUrB4yr9YYOxh1CSYuy7f564r+/8
 OehtH45Np/E2I+kRj0AigEFAqMd4k9/3WbhZkKxfBovlcLQvPnMFd2brpNKFmXWZq9pqTq8wv2s
 fCeY8U/kS/ld0dxRagCE2a6fN1NfNAC+Ok9M+mOsg1ch2zhYnj3t6ElCMn4xrucD9MgVmHpEtqj
 2aYSfoPjRUpUUVD/8xeyHBy5+OzJseQMQ5XKF2oAFNboNKolOzwFWY/eTMUzPWSn7IsxNSknoFb
 pP1XmPKe4YqXNTe9J9a43vq6dmqGiZi/wvkB4C0G1jrV
X-Received: by 2002:a05:600c:26c6:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-437c6b475f9mr239225505e9.15.1737469552939; 
 Tue, 21 Jan 2025 06:25:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890413053sm183998275e9.10.2025.01.21.06.25.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 27/28] target/xtensa: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:40 +0100
Message-ID: <20250121142341.17001-28-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: ovUkNYuJx1qd

Move has_work() from CPUClass to SysemuCPUOps, simplifying
xtensa_cpu_has_work() by directly using CPU env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 4eb699d1f45..c5d7682f4bf 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -63,16 +63,14 @@ static void xtensa_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
-    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = cpu_env(cs);
 
-    return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
+    return !env->runstall && env->pending_irq_level;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int xtensa_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -224,6 +222,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps xtensa_sysemu_ops = {
+    .has_work = xtensa_cpu_has_work,
     .get_phys_page_debug = xtensa_cpu_get_phys_page_debug,
 };
 #endif
@@ -261,7 +260,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
                                        &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->mmu_index = xtensa_cpu_mmu_index;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
-- 
2.47.1

