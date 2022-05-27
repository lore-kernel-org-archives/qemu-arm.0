Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1197923lfh;
        Fri, 27 May 2022 11:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw4kY4FZAdJUs7N7MeuB8VDudH/IaRuIBhrfq0dXv1NvGNAXB7DBJB0K6aLY+d4zhgKUZk
X-Received: by 2002:a05:6214:768:b0:462:1f65:8c5c with SMTP id f8-20020a056214076800b004621f658c5cmr27494932qvz.32.1653674821118;
        Fri, 27 May 2022 11:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653674821; cv=none;
        d=google.com; s=arc-20160816;
        b=NN1xUUl+RDCjfhYaHeb3CDkS5Ib8qneI+wm8ys5eyzy65UQsjOs9H9otEz3UdkhIPv
         cH4r7zRsu8/sHEJQRyHbhwGWooF2K05xwezJIXMUOcgnuUzMTn/ivSDY2RqC3UztKvHm
         hKB+FyI5pS9dkYxXf5k1740zd2uyl3XGqAs7+7q77F0ekjoC3TqWwCHq4/l/kizrbZEo
         S6qw51n7oqbfwiipY+aff4q0GODQt6SeuPEU081zwzQbHpAfs1YVJJEb6xa3jWyaaXzm
         BGS02TOSH18fs5peGaV1yftboyvCX2BXOsdXY+w1IslPZFsQ0lsJrDfjeBCB5CMJs6LA
         /9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vc6A4fJ2bpA25nPv/BuEPYKtg306M4XfmsuW8OQnyWk=;
        b=Pb5rs/yg4Un+Xsb08yZR17+3yFvJ3av2yVg6yONV1T03ybvn8+GHnpS1UNJvume9Wk
         CUyTSjt6Mf5Uca34O5efsUlDz6n3gEN2zv6NhJ1HjYO0+M0oQKSme6l8NZsbSRXw+Wd8
         xmwgGxbtuZLOzRhHA2w6ht3DOntEtfB8hiCDnHFilqlXMpuoMDcj3GSdxPe6CnHTpof4
         ndQYOqYMTd9q5MQJ3KAnY8jYJtmKaD4sNXAqm+vSaPI5EsXp3g9x5xRfeS0+r0hA4FTz
         JkD4dXYLFXos9TxnVErgPLW9hO9N8r5fylVqPLzRyKzCo27uvIsVKLFLoM0hpKkQnoK4
         /hpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6n32vXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05622a181400b002f3b4ea054esi3157024qtc.89.2022.05.27.11.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6n32vXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueMW-000325-Hm
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM1-00030S-Ow
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLz-0001cq-RB
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id y1so4955851pfr.6
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vc6A4fJ2bpA25nPv/BuEPYKtg306M4XfmsuW8OQnyWk=;
 b=i6n32vXeQlZRyGRIWYESF8+QaYwy/aQKXl92/ZypR/DjgOcSn6oqW4BqLT+W5gcc0j
 r44/92d+9WHPA1Q6DXXQ32XrCRyMesnzdjVpm98Wysxi08YpFDWtHmsllAHgaPM1DZ22
 bxPr1QGnHiEgrhNCQZithunDDP8m9X1yC4cPLc59g24imbTjCbLDhZy6bpirYHc5IA3g
 DDNRKVVS2VA4jWjA5JZMOdwNFoOHanwI+umhXYPygLEnFz9mnCubPJfQNegc9b4f4HQr
 1BGlyxRNHYnSIWi8+LdTk0jJcC+WfZadpzPYdDw+ntBoumiRqr2dikQuFWaI5zKmq9I7
 bmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vc6A4fJ2bpA25nPv/BuEPYKtg306M4XfmsuW8OQnyWk=;
 b=OV+aWD7Zui4nE57wQs0f1FSghc7hAJCE9OWTZ1q5J6fLY75kSHD6/8wSIkkq7KE5rF
 F9xBlRm0yXLc0+JfvKkuhXSlgHgQhdpkIAscf863dSp7yWgDDtQCe2E+3DL5XFdhngdY
 Hg2/mNQjXE1vUSmODW2cB9c1URO/HawVZF1eknfUNeB3etnQKvh+Dt84SXxpY/ZnpogK
 4rnDeWcRRMUXKOxYT7j+9lr3p+83Vc0u3+2hvdcxFDvwOFq+EzBpz9vdrmNuEweKEdsZ
 cfCAXjkEChb1shGp4p3pkh28cA0Mrt04ja66ek2iwj5ZKgyrzQOpdjJsvOdyyffYi0Xm
 L/Uw==
X-Gm-Message-State: AOAM530xPn8wJVCPE36gLaazKKbvamte0M11WMMLORSqvIIWOTaUSaaa
 T2fg4yM3WMwIPZiDYA0aEW0CgbPU3XIzag==
X-Received: by 2002:a63:1a17:0:b0:3fa:e901:1c68 with SMTP id
 a23-20020a631a17000000b003fae9011c68mr11153205pga.243.1653674786362; 
 Fri, 27 May 2022 11:06:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/15] linux-user/aarch64: Use SVE_LEN from hflags
Date: Fri, 27 May 2022 11:06:10 -0700
Message-Id: <20220527180623.185261-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: my4I3HURhgyS

Use the digested vector length rather than the raw zcr_el[1] value.

This fixes an incorrect return from do_prctl_set_vl where we didn't
take into account the set of vector lengths supported by the cpu.
It also prepares us for Streaming SVE mode, where the vector length
comes from a different cpreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 19 +++++++++++++------
 linux-user/aarch64/signal.c       |  4 ++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933..fcbb90e881 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return (EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,25 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        old_vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
+
+        /*
+         * Bound the value of vq, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild
+         * to sort out the length supported by the cpu.
+         */
         vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        vq = MIN(vq, 16);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
 
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9..57e9360743 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.34.1

