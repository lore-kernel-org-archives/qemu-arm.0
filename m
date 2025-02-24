Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2148281njc;
        Mon, 24 Feb 2025 12:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8mBG6Li8Lj7WIqhGHpW8IAsp3Isk+BWlqGhmWzYumCIAq8jttocwSUcYztvC2iFjipPCAE/mRG8qXFA==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ0nNTiKweVaHMSfjTimd8DgEXeuAlQOfE2/XlEKUsrqRZe/Qo1vmNLDyfKXGtkfLaSiwQ
X-Received: by 2002:a05:6214:194f:b0:6e4:2f4c:f2d2 with SMTP id 6a1803df08f44-6e87ab9f9cfmr7994476d6.31.1740430299919;
        Mon, 24 Feb 2025 12:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740430299; cv=none;
        d=google.com; s=arc-20240605;
        b=AX6K+c07FbjsGAvC/bVkX6sRP5rKJa5QrboBcIyHaP6YVV12vxBjmOMbNizYdPfqMv
         msc6vSvwOc9iSjQwbquQYDmTz4Y+LScKMb+bcbYaXFFWKjny1hYz7opk0R95s3nYVu1G
         N3eBodD9M7YJLw5NP31XFfnts2Jnn9ydeRLHbUpW7VjwdtqIyacc4waanlJIPdFS/4K+
         POhuhthKyiN+6PS+k2LbUJFuHLFI8hwG/DvPnQDS4Ejk1YeegrWX15v0N/fphK92nRME
         8oQ1IkAH4sMyVGXFn+jTlHHEudS+17yqg5zRucKojqzbARO3gpqOWAIPT0IGXDcUZJqc
         zD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TCbsRN6azifS6kRCm00Z3CP8eAeBoGuL3X/G76qw8Uc=;
        fh=iUduMBOz3v4zFwUNeeV8y+gHivCAO1cJvNxL2m3hTQU=;
        b=EHAwTW+4QIKcDwHpfv+FIGZ6/78cwEeMSI4t+WCpgLHNQgtkdkLEnbasv/8Si8/+BU
         /AwJGJ2fL8nOY5VqxmHZoU+dOFce6agWB/EV9yjyXfiEFP68/9JJ+tyThQSeqv5JAsIs
         49Oa8Ob6qOYg/3R6sZrCR+8vUG9FN7zb7YXidWqAlhDtjsdM1ictmJahxOog6mADEsqs
         rdsUBAX8eqvDEnjGv6Xz8Vg6yeDSywwre7ChCNfpDyoA0+tvQM0g9RJ4aq/ExNSpyvug
         OkZ9212XNW7YpOe54LxwT/C53b8aw/3qLu4r4gu7dS6lUYSu434LY8nhQlNEiCJzblsU
         hHQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X15btTpz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b01a5c0si2026336d6.96.2025.02.24.12.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 12:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X15btTpz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmfQ1-0000YC-Li; Mon, 24 Feb 2025 15:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tmfPw-0000Wq-Am
 for qemu-devel@nongnu.org; Mon, 24 Feb 2025 15:51:09 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tmfPu-0004sP-0O
 for qemu-devel@nongnu.org; Mon, 24 Feb 2025 15:51:08 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2fcce9bb0ecso9557667a91.3
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2025 12:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740430264; x=1741035064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TCbsRN6azifS6kRCm00Z3CP8eAeBoGuL3X/G76qw8Uc=;
 b=X15btTpz8yr6PFfF2PPRmce2oj1UdiLvszBdawg2HDsjEjjyjXj+6AWrqRyJD1Mozt
 Ode/czipT1w8sUdP3Hyvovptl8Q+km835qJztu5o0bnCAY9U0KhiuHgLQSff0K95Qko0
 XS+9qVMGU25IOPpAEAu26DJCKn7OLtGGcufci/Fnr9g17CIk3ahTgaZ72A/y80SX8JKj
 qf3QdRsqYOMEzaF3LkDQYePs2+y7xjT6Y/K9kyyfjJPJAXLbmYXohiKaj2qzU7i59+b0
 TgqHOslgw8JOXTcS9crSpbEP0Gszk/1VU85/8LwZVOrTeZsY78K8Mq8Ins6RYkrJQrjR
 81pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740430264; x=1741035064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCbsRN6azifS6kRCm00Z3CP8eAeBoGuL3X/G76qw8Uc=;
 b=cKXsk8vOtmlxHa6M2lA6nH2gQgLSYaITbjVzYvIHonCOVIuaPz7NS+tDW8ts0183Zm
 jByYBY52g9mOMjY+H+2sGQsKNUiKZHDMVaz7iyGEhu9nHDcRbmWjJiGe8KYdsAcyPwpQ
 R+sGV5KdfuCJ9ZJL/hEP331/VQj+M4R3tS6y9svtLlBEG+vfYL9p9hYXeLCYhtNHjCYP
 c/tCDkfzFDIr8ky/uMjV3YwJ7HtFqFA/fyVi3za5CsjJNvD1L77Q3a0JBIQ5sPt5UtCW
 kTdGA8WsZtEcCDOCeRqF7moMOtZx7FrYgqOd+uCw4GTP+zRarIxHhuBYcrmqYF0CuPhi
 w/BQ==
X-Gm-Message-State: AOJu0YwgJHm/nsapQRMjZC7xnrSqqSuHIPYXYoevY08NdfrF75Qzyquw
 wLivqYwz3uYTBYk6Q+pBEORRDiq9K+IyX2AJFZ75Y9QvZQ8IfROIdznto4spu4h/uI3ihT4QxG7
 qe+LZNQ==
X-Gm-Gg: ASbGncssW+xsxno4eRejnQtxEmxVnCH+abZ32XSgs0FWi8yL5HoMEEGrmsos+OVboEt
 8V12FLHwo3oeRuz9EuVKGHQ7B6zANEkG70JlIBcHzAXPXNkZvUA6G7fagKNbQWMhrn7TwQ1T0HV
 mG/bxP+1xHZyYRix3v8mzJ9p0Wo3xxeDtbRAv3A/aYUQTM3lmlZDx2P9tdAx95dThzj1GU4yy9W
 HO9T24qeU8+H6VhPvR7UbksHS8xhJLknSCEE7x6auHdeVC0pyUlJf67Eyyb9dc5kV/CiRi4gvNB
 Outq/QBrkkyKN9CcF2Lo6Qqv8w==
X-Received: by 2002:a17:90b:2d88:b0:2ee:db1a:2e3c with SMTP id
 98e67ed59e1d1-2fe68accf6cmr939271a91.1.1740430263856; 
 Mon, 24 Feb 2025 12:51:03 -0800 (PST)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe6a39aa3csm106668a91.10.2025.02.24.12.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 12:51:03 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: titusr@google.com, hskinnemoen@google.com, wuhaotsh@google.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
Date: Mon, 24 Feb 2025 12:50:53 -0800
Message-Id: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ngjdU5v74ZOd

Regression introduced by cf76c4
(hw/misc: Add nr_regs and cold_reset_values to NPCM CLK)

cold_reset_values has a different size, depending on device used
(NPCM7xx vs NPCM8xx). However, s->regs has a fixed size, which matches
NPCM8xx. Thus, when initializing a NPCM7xx, we go past cold_reset_values
ending.

Report by asan:
==2066==ERROR: AddressSanitizer: global-buffer-overflow on address 0x55d68a3e97f0 at pc 0x7fcaf2b2d14b bp 0x7ffff0cc3890 sp 0x7ffff0cc3040
READ of size 196 at 0x55d68a3e97f0 thread T0
    #0 0x7fcaf2b2d14a in __interceptor_memcpy ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827
    #1 0x55d688447e0d in memcpy /usr/include/x86_64-linux-gnu/bits/string_fortified.h:29
    #2 0x55d688447e0d in npcm_clk_enter_reset ../hw/misc/npcm_clk.c:968
    #3 0x55d6899b7213 in resettable_phase_enter ../hw/core/resettable.c:136
    #4 0x55d6899a1ef7 in bus_reset_child_foreach ../hw/core/bus.c:97
    #5 0x55d6899b717d in resettable_child_foreach ../hw/core/resettable.c:92
    #6 0x55d6899b717d in resettable_phase_enter ../hw/core/resettable.c:129
    #7 0x55d6899b4ead in resettable_container_child_foreach ../hw/core/resetcontainer.c:54
    #8 0x55d6899b717d in resettable_child_foreach ../hw/core/resettable.c:92
    #9 0x55d6899b717d in resettable_phase_enter ../hw/core/resettable.c:129
    #10 0x55d6899b7bfa in resettable_assert_reset ../hw/core/resettable.c:55
    #11 0x55d6899b8666 in resettable_reset ../hw/core/resettable.c:45
    #12 0x55d688d15cd2 in qemu_system_reset ../system/runstate.c:527
    #13 0x55d687fc5edd in qdev_machine_creation_done ../hw/core/machine.c:1738
    #14 0x55d688d209bd in qemu_machine_creation_done ../system/vl.c:2779
    #15 0x55d688d209bd in qmp_x_exit_preconfig ../system/vl.c:2807
    #16 0x55d688d281fb in qemu_init ../system/vl.c:3838
    #17 0x55d687ceab12 in main ../system/main.c:68
    #18 0x7fcaef006249  (/lib/x86_64-linux-gnu/libc.so.6+0x27249)
    #19 0x7fcaef006304 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x27304)
    #20 0x55d687cf0010 in _start (/home/runner/work/qemu-ci/qemu-ci/build/qemu-system-arm+0x371c010)

0x55d68a3e97f0 is located 0 bytes to the right of global variable 'npcm7xx_cold_reset_values' defined in '../hw/misc/npcm_clk.c:134:23' (0x55d68a3e9780) of size 112

Impacted tests:
Summary of Failures:

check:
  2/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test                         ERROR             9.28s   killed by signal 6 SIGABRT
  4/747 qemu:qtest+qtest-arm / qtest-arm/qom-test                                 ERROR             7.82s   killed by signal 6 SIGABRT
 32/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test           ERROR            10.91s   killed by signal 6 SIGABRT
 35/747 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test                   ERROR            11.33s   killed by signal 6 SIGABRT
114/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_pwm-test                         ERROR             0.98s   killed by signal 6 SIGABRT
115/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp                         ERROR             2.95s   killed by signal 6 SIGABRT
117/747 qemu:qtest+qtest-arm / qtest-arm/test-hmp                                 ERROR             2.54s   killed by signal 6 SIGABRT
151/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test              ERROR             0.96s   killed by signal 6 SIGABRT
247/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_adc-test                         ERROR             0.96s   killed by signal 6 SIGABRT
248/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_gpio-test                        ERROR             1.05s   killed by signal 6 SIGABRT
249/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_rng-test                         ERROR             0.97s   killed by signal 6 SIGABRT
250/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test                       ERROR             0.97s   killed by signal 6 SIGABRT
251/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_smbus-test                       ERROR             0.89s   killed by signal 6 SIGABRT
252/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test                       ERROR             1.09s   killed by signal 6 SIGABRT
253/747 qemu:qtest+qtest-arm / qtest-arm/npcm_gmac-test                           ERROR             1.12s   killed by signal 6 SIGABRT
255/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_emc-test                         ERROR             1.05s   killed by signal 6 SIGABRT

check-functional:
 22/203 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_quanta_gsj                      ERROR             0.79s   exit status 1
 38/203 qemu:func-quick+func-aarch64 / func-aarch64-migration                                        ERROR             1.97s   exit status 1
 45/203 qemu:func-quick+func-arm / func-arm-migration                                                ERROR             1.90s   exit status 1

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/misc/npcm_clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index d1f29759d59..0e85974cf96 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -964,8 +964,9 @@ static void npcm_clk_enter_reset(Object *obj, ResetType type)
     NPCMCLKState *s = NPCM_CLK(obj);
     NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
 
-    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
-    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
+    size_t sizeof_regs = c->nr_regs * sizeof(uint32_t);
+    g_assert(sizeof(s->regs) >= sizeof_regs);
+    memcpy(s->regs, c->cold_reset_values, sizeof_regs);
     s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     npcm7xx_clk_update_all_clocks(s);
     /*
-- 
2.39.5

