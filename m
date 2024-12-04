Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp491141njb;
        Wed, 4 Dec 2024 12:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPv+cSwDjqWpJwOPx0fz8gJUsHfei56MhLZ9t+StsLK/6tu1UPakAwK4e1NP/zazwBbBDgtvqXYtO5xw==@linaro.org
X-Google-Smtp-Source: AGHT+IGni3U/IFCYnvFFs8/fBXNV7c3GnEunWEOut6OOzbt75+SM5OdCSRnkZWRLzjdNx3ji5Frw
X-Received: by 2002:a05:6122:8288:b0:515:1344:9695 with SMTP id 71dfb90a1353d-515bf305c4fmr11917931e0c.5.1733344261013;
        Wed, 04 Dec 2024 12:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344260; cv=none;
        d=google.com; s=arc-20240605;
        b=VoKvS/JLJed+mRbzgh1P/KG7tc2wjs2DMKYkdoH7VkEKoH3GyKxBLbAfl1irm0uFXr
         SCcTMmxO3QWqQ57wI/2jHMdhKZLgD/HY9QPQY19FVDMAKaX4pXivw6yso8Z5FrK7LlEj
         jKsR5maBQK/XNVJbt56U95uj0QGhMKy2zIwI9jpr4KckN06A6h5fWc4M0CpLW8k4fbo9
         IbEhKkf5ipfY2aVoQJr2lel5EDT5SKEb1bdH6U8eQacIg8h0J8SgnPUaJnn0gKFZcwxX
         ZaZwRWZNP8du/SB+z91oj5u6QPigY8UHIFRiawSGA+QImC8CGysxD71To/mc/72pC1Io
         zJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OthQd7angO3Yu/emzCL7LUH+S5aSARcEIzo6mzzFka8=;
        fh=lsKHYUhezdv5IwgzaKnkvUXvaNzkojaXHzt/6KUWXtM=;
        b=OxWdrUF3/hoYrA5qFnCqwDOCMEkx06iHrLW5+Q+kiYdWXdKCeBlqOjH1BJ1sD8O/lw
         8nAAQinI52Qp8eui+5pr0AnKAZCOlfMgJJWOuU3sdLGnny3pKrtlatiwgNqwv5i8aeIb
         xQr34BpnVdAwg1oRddjBolC+z4V0851kttkgRQD5Oxjv/Hs0QJOd35r7scIzu4LDNmGt
         jEHTI3KFJGR8AXlNCNIO8dkpKyTW3r2Wk06bT0d219RBgm2mkwL6HB7r6dKSzebfjbLC
         nNwKGw8ReSV2FyzCnNn+UAo5MR8LruPg1bTneW3TPRTqDGsf9e0eMF4uETMBrFUXP/Ga
         4dcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WELlmwSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515c659bec2si1554904e0c.228.2024.12.04.12.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:31:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WELlmwSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvyY-0001M3-3p; Wed, 04 Dec 2024 15:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyI-0000Uz-3s
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyF-0000x6-D1
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a736518eso2226265e9.1
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344056; x=1733948856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OthQd7angO3Yu/emzCL7LUH+S5aSARcEIzo6mzzFka8=;
 b=WELlmwSjK0NpqMScJxkhVgND5CiF3ZZMT06gjH3xL0GfW14TqaEcOd6rvpX/Y/gdPa
 RKPz/JqZEJ0Kk1+kafFhAp++PGO7e6Ev6cw8+UiNJAhUPUi1y5t65a9L2zi9uRuvNo/H
 qowrzPWJ/W7PgkipixJQ9vvfRKQSDGRUdOusLK/XeWUU07S0Rtw1MnFfFmX0YjcG91wb
 PmhqXw7pszkAnxetzR+yBzx5EzE/dIwZvMJfhZIA9gX7CD0iQaPyi9/flG1Nvjle4RVn
 4Jt2HRAMI267sErj4dGb6STezc/HJwfFmeVb2mLGEPijioJGq2Sd5Ro2Nj6mKE35vbyl
 uHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344056; x=1733948856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OthQd7angO3Yu/emzCL7LUH+S5aSARcEIzo6mzzFka8=;
 b=OZTyqXAfd0Yk0xMMqs0q/AybG7N6ERzEfBtJol6O3mpNu4/zG77ZTnPnHvc8NLhKiN
 Ulv6djteqQW2SldZGQMmtZMuXQgCgOnHir7ZrhSvvsmFSMTFwreKAB6D6WaCKUqBtMsi
 vFPKtaTTg22NRVIdWelQQPu9V+x8KNEvhMzE5UubXVguoXqcJ8erptlhC1SMFGNVywHJ
 c8IgDuBtnRiVo27Fxp5vO2zHSP3lR4WjS3Lq6RhUmSHVyYD05McBVaJghl98pbV1tD2t
 oQ4Qak4yYZbWfzXZ3i1+/73jMTEaG+3dFrnahCOjfazbgM0bmMeHEC7nL4SpoIpJwXq/
 ZxuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIWGmTZDgytlMfgRTeSMdFzm3n7ADnRNAfrhMhf1Yo5oNowM9snKy70Sb3mW/UMMlHVKEloeIEA==@nongnu.org
X-Gm-Message-State: AOJu0YwpbPnh/ab5MJbOAGCcuxxD/CTHh3WkVjBBHm8KCInPVYS81GJX
 7VSpfF+VpaxAQAJep+sYd34CqECYDRmdgp4x2FJq6Rpm52ZHTHg068Y9rEa9w5M=
X-Gm-Gg: ASbGncs6JXU3qs7cbiRfMwMCWTn/7iisnGvWLGxUZhR5CpkIci7JoshOdpw35FiAhLP
 gUBe+HX2ygr9BX0y5JATYPKqUukhwSg2gBDjIg9xS9XDWsyReHrNGiQ+ETdQhjS6tkH8ER9nYsc
 K2FcGEgcNCr874CeK0bhsMFj/Szf21eXPkj8+RmERMMtbh4VgN2Dm+lxucnq3ESUfnnctKvzbug
 heKkwMGxmW3mGZV0zfvoRFBNsRMBcsfLFy1RBgc3ybuACmLyt35nVBYwekgREzSXf524NRh758b
 6GikzEFHekZyLsg5DQfbXjsM
X-Received: by 2002:a05:600c:3103:b0:431:5c7b:e939 with SMTP id
 5b1f17b1804b1-434d09d1d68mr81549135e9.18.1733344056242; 
 Wed, 04 Dec 2024 12:27:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527eeedsm35050045e9.19.2024.12.04.12.27.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/20] target/microblaze: Implement
 CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:52 +0100
Message-ID: <20241204202602.58083-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
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
X-TUID: lPPGGGutuFnF

Implement the MicroBlaze datapath_is_big_endian() handler,
returning the value of the ENDI bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/cpu.h |  2 ++
 target/microblaze/cpu.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 3e5a3e5c605..dd6b61b34ba 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -412,6 +412,8 @@ void mb_tcg_init(void);
 /* Ensure there is no overlap between the two masks. */
 QEMU_BUILD_BUG_ON(MSR_TB_MASK & IFLAGS_TB_MASK);
 
+bool mb_cpu_datapath_is_big_endian(CPUState *cs);
+
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, vaddr *pc,
                                         uint64_t *cs_base, uint32_t *flags)
 {
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 710eb1146c1..3a0e5713415 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "qemu/module.h"
+#include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
@@ -119,6 +120,15 @@ static bool mb_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
+bool mb_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    cpu_synchronize_state(cs);
+
+    return !cpu->cfg.endi;
+}
+
 static int mb_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
     CPUMBState *env = cpu_env(cs);
@@ -447,6 +457,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
+    cc->datapath_is_big_endian = mb_cpu_datapath_is_big_endian;
     cc->has_work = mb_cpu_has_work;
     cc->mmu_index = mb_cpu_mmu_index;
     cc->dump_state = mb_cpu_dump_state;
-- 
2.45.2

