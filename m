Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1531599ejc;
        Fri, 13 Oct 2023 07:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl5sVPAnW2YvOq6qmXdNVU5PMZM6oOby5CW1r3ZCbEum/5UgdP2mJoDiOYk3beBTYO0xbW
X-Received: by 2002:aca:2b11:0:b0:3a4:894a:9f3d with SMTP id i17-20020aca2b11000000b003a4894a9f3dmr29255881oik.41.1697205851906;
        Fri, 13 Oct 2023 07:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205851; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdJioN8Vr410IazhcD8BJT/xRxVGj2ZkwR4/sSZO6aiR9faSu+KB4TBXU+uFCM8aRM
         9wcq5/bAhs2BkL1v5NsjeW134p8UXq9kjly+uOKC/G8C+OXHFw/AX4jYtXSn2t1t8eoQ
         OEgxCnNDW9wqNnIpexH5Lb5NL36qFjspmEpJhlBRdG0mZSdeS/HcgNpgSPY9kd+BLMr7
         vvz2PC6uIB0INE2+WN4gGHmUdyPHV0KUVGGMzTRRROBqVzo+QQInfGfF+1lhe+6WYq45
         NCpY/choo1VMqLsQRQ21URFhucf55/s620q5vH7D9XdybjZGL+WRe/upJE76PB/ZuC6d
         hwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ct6nqOkWPITqikpho6LzBF9JTwL/xSnZhZ7aKNqCpWg=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=GWTEMk7H+Sy5ja8XUD1F+HiLsosnAOShRnLYRguj50DTCdb0ySxHbHZfeBrIeZWPLs
         o9C/GD12TdYntZ8FcNRzNFdNYq538+499K3IX1zd3NeKrVQmFSxEhEeM8UjNrc6zaycV
         o+Lq1AJDfOKJuQFoWb1jI2CAQNMfe9g3uA2+Ympi0KfxUpt3OMYZ5SygCBnLrSEGrTsq
         NODgS19AUlTq/X/3F5C6Iv0UvYb8g9dsGkTMF0ylQqwhakf+22bY9sHPkU4nbnIQJe4A
         BNtewE2WNcgNvx6/FSJ7ttL0O2KIPtBKuCgw9P5eR6yQOrUItab1QjhLr9IglSD2EFwq
         jXFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uu4RGZRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a05610221d400b004578ef2ded8si142728vsg.7.2023.10.13.07.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uu4RGZRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrIl3-0008S2-Lj; Fri, 13 Oct 2023 10:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjv-0006it-1A
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjj-0002DT-Cv
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so3757401a12.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205711; x=1697810511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ct6nqOkWPITqikpho6LzBF9JTwL/xSnZhZ7aKNqCpWg=;
 b=uu4RGZRGD8JKoiIilgiVEOqLk6vLunYr366a1gSYzH5lZ3t3yOaKrgQXzmTY1MsBEG
 a9wX2y3pBGNbky+FcLJ3bsicE6sgrPlfUP3EXvhaf0Kg3VGeYqJEBvEcA7Z7kWe76iEj
 waGcDNMekdzg6KUvmL2CHX2/9xQ9/CCu4fj+nz+sPjJbh50Qcj5v0JYGiQORxYJYSYaI
 NjThwtS6S0NaPF8nk028CFw3CDue2CcrF2+0dBGJrJUdDGirO4xdENoLURcpwonJ2DQ2
 o6MJIb1YtXDDv5j1rLEycnwMTOXd2bcJ5SIKI9Orw99G9kVdZFbWT0f8W0/crVu0G4xo
 EAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205711; x=1697810511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ct6nqOkWPITqikpho6LzBF9JTwL/xSnZhZ7aKNqCpWg=;
 b=jCao+iCTbW4rsuLoNEaB5BRUdl0EXaWYQ2zrAY9v3/4lZvTfW1RbZ+jSXwGTcxJIF/
 ewrMktdf6PLSN9I0bcrYzhCdRYPQNN1w1Vz2ar9ZqEaKEUcRVXXFCLN5mrr+QVVNHmcN
 gSIi3YBzUGlZUSl6Z+XQ/zpUi8rcqnIKBULNZtBwQnYB1tD5eIX0j6Bbm82VLeZCjaaq
 YFQzM11EXy4kHEdZLPjrUVEcj66zmmFEsTPMyCSZCTuZT+LJQL62lZszPjCW8zJqk6Z4
 CAjdMnqnfHV+bsW44DE0WpNrb08YAb7WQFg9ZaAO3VVaTwkaaS7Htkz+Go2ycoklybm0
 7HtQ==
X-Gm-Message-State: AOJu0Yy1Wc6rxYiBzFebUr60pye+JlJOLCMcAM/faQrvBytunCdV2gOl
 vTwi7LmqkYcdpEyIhQf3zjkHmA==
X-Received: by 2002:a05:6402:b18:b0:531:1875:bbc8 with SMTP id
 bm24-20020a0564020b1800b005311875bbc8mr23576375edb.19.1697205711335; 
 Fri, 13 Oct 2023 07:01:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 bm15-20020a0564020b0f00b005346925a474sm11552152edb.43.2023.10.13.07.01.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:01:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 03/16] target/arm: Move internal declarations from
 'cpu-qom.h' to 'cpu.h'
Date: Fri, 13 Oct 2023 16:01:02 +0200
Message-ID: <20231013140116.255-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +Su0MzlXsqKA

These definitions and declarations are only used by
target/arm/, no need to expose them to generic hw/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-qom.h | 28 ----------------------------
 target/arm/cpu.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index dfb9d5b827..35c3b0924e 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -35,9 +35,6 @@ typedef struct ARMCPUInfo {
     void (*class_init)(ObjectClass *oc, void *data);
 } ARMCPUInfo;
 
-void arm_cpu_register(const ARMCPUInfo *info);
-void aarch64_cpu_register(const ARMCPUInfo *info);
-
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -63,29 +60,4 @@ struct AArch64CPUClass {
     ARMCPUClass parent_class;
 };
 
-void register_cp_regs_for_features(ARMCPU *cpu);
-void init_cpreg_list(ARMCPU *cpu);
-
-/* Callback functions for the generic timer's timers. */
-void arm_gt_ptimer_cb(void *opaque);
-void arm_gt_vtimer_cb(void *opaque);
-void arm_gt_htimer_cb(void *opaque);
-void arm_gt_stimer_cb(void *opaque);
-void arm_gt_hvtimer_cb(void *opaque);
-
-#define ARM_AFF0_SHIFT 0
-#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
-#define ARM_AFF1_SHIFT 8
-#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
-#define ARM_AFF2_SHIFT 16
-#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
-#define ARM_AFF3_SHIFT 32
-#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
-#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
-
-#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
-#define ARM64_AFFINITY_MASK \
-    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
-#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
-
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fb1b08371c..06f92dacb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,11 +1116,39 @@ struct ArchCPU {
     uint64_t gt_cntfrq_hz;
 };
 
+/* Callback functions for the generic timer's timers. */
+void arm_gt_ptimer_cb(void *opaque);
+void arm_gt_vtimer_cb(void *opaque);
+void arm_gt_htimer_cb(void *opaque);
+void arm_gt_stimer_cb(void *opaque);
+void arm_gt_hvtimer_cb(void *opaque);
+
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
 void arm_cpu_post_init(Object *obj);
 
+void arm_cpu_register(const ARMCPUInfo *info);
+void aarch64_cpu_register(const ARMCPUInfo *info);
+
+void register_cp_regs_for_features(ARMCPU *cpu);
+void init_cpreg_list(ARMCPU *cpu);
+
+#define ARM_AFF0_SHIFT 0
+#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
+#define ARM_AFF1_SHIFT 8
+#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
+#define ARM_AFF2_SHIFT 16
+#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
+#define ARM_AFF3_SHIFT 32
+#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
+#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
+
+#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
+#define ARM64_AFFINITY_MASK \
+    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
+#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
+
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0

