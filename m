Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1343341wrm;
        Thu, 17 Oct 2019 11:51:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1cLSIhRvQDe4gzLN6o0hsROqaNyaIzE8hui5l7b6ywiMk4UEJqr9OuXIWuWtW+U0KGtKj
X-Received: by 2002:a05:620a:165a:: with SMTP id c26mr3562527qko.237.1571338306268;
        Thu, 17 Oct 2019 11:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338306; cv=none;
        d=google.com; s=arc-20160816;
        b=c3yo702YMwnVxqUCokOcydgAC0p4AHylI3bT6QApQh8ma2wm83NV1d46ThNfFoI9Vz
         7uaWm5lpYKWsUQ0QLJaooBylwXBmpDeAieNTOzx9ubdeybigfHVYDJR5zSrwy2CefUqe
         x+jO0V5SSzTiQqRemXRiPsZERpFkGok6aCzOZ64fowUqNtDyCBhYUbuS0KetqgP2xHK6
         3EENsJro19F7ErsDRq3JeTJe6fsRSgjRtPYSBL3sIeWvTmPtG4RRqmO7KNKVQTQ1AJa3
         bWtwYxz9DFWKIdLnqiJ7cbHptMWhe5Q5h1+T/ELnmniL2chOOEH+NLc3wcQ7y8cvzjim
         XTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=1nvchNn+VWtn/WVfmFkMyvJoEKsssvYDkhUOA8bdyeU=;
        b=SoSs0EekEYlN89TN8MSN6J/J4THakt3xQERK+sBYM8oQOWINniFzq4khHMOPpNsvIx
         ANCS52a4jp5ssaJ86lCbIPmQgNsUDush4ChSqZhQUSaOjw4Z/IWSb+NmLjYCPBDSokSv
         0Qg84nCKf9S7hDRRJCZRJjRCze69uLtxQGRnhDEV5ZYfWgDtoMbuEdc2gOP7areGy4Rh
         7RsNu1mpn4zIlQV+B9BHFEbvRIDk0Bq9qVttU9L1x/Njc61hxELr+QLpZ5IsP/PP/Khw
         QTFNvjiNATfyqDwsd62zeddl0o9YeMq4oJ7IYoa50TenWXGgbF29jMicBqUq1iLcofKD
         tqSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pjFbZYsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n36si2687899qtf.309.2019.10.17.11.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pjFbZYsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAsC-00012Z-EP
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArk-000124-1p
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAri-0000oF-Og
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:15 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAri-0000ns-Gl
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:14 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r1so1845817pgj.12
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nvchNn+VWtn/WVfmFkMyvJoEKsssvYDkhUOA8bdyeU=;
 b=pjFbZYsHERgxd0UTphjzgIl1XGCwLM9sm0zge6jhrNA5FoAbgAIAGlgXOPacrBR7VZ
 a7+LXPT9k/9cXBjB9rCUMN2itliSMl2+Sz3haIPLBT7KOd+2pxylbPfw+tUY8cTSBeK+
 W0a6DeoKFq3LFJWolQzQt+Qr3CZFKp0OmdXYYF1knCNWgtEw9GRlaawrVLKVEFudiLSt
 6EC2O6LNl5GnpWwQDA0TMwoUbWyssKm189E+qG9nC70d1zE8cYNXWKd9A8MVsdDLtsyI
 b04B8wZthi7cJUapq/NsNF3nDtD1u75iWGxKQZnccxt2IrTV+KXnxrEwbQMENM9ahcvZ
 dd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nvchNn+VWtn/WVfmFkMyvJoEKsssvYDkhUOA8bdyeU=;
 b=D2TuOV71Cq1gtAMZj4hgXhzDDDer11+2eQQZ9xj8+5AWT167vz4HVlnhQNbyskHyQR
 DoCB0MnPJNrIsef72pBhP7JjGmrZHAE15exmEV0Og7+buS2ydVFEWp8ILkPd88u5y7Oh
 oS/VZpRR3urDlirDOPga3fcMVRwdb1zUarson9hYMEoOJoVk+VrYa6sN2eBtQzPYX3+k
 VO3b2cMgohYH75Nh4fsGcXwg8e53oLN5qt7BRkcVf4yxOb9gD9GpD6CI/DFzlii3IwA4
 JWXng319iI02dD0iTRw8l4wPQFwsmBtdtJleOjaPTPOtIxYx498i1q0ZUJ+FJ53E63R9
 xskQ==
X-Gm-Message-State: APjAAAUbP9g389x+Go91W2slZYiXPMq42r6yuoKLw0xLGRfU3gZLC/eC
 OzfOTGeXv/0ssWSM9YyognV3JQ==
X-Received: by 2002:aa7:9f9b:: with SMTP id z27mr1826642pfr.65.1571338272750; 
 Thu, 17 Oct 2019 11:51:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/20] target/arm: Reduce overhead of cpu_get_tb_cpu_state
Date: Thu, 17 Oct 2019 11:50:50 -0700
Message-Id: <20191017185110.539-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CC/yEusE7GPO

Changes since v6:
  * Regen hflags in two more places for m-profile (patch 19).

Changes since v5:
  * Fix the debug assertion ifdef in the final patch.
  * Add more calls to arm_rebuild_hflags: CPSR and M-profile
    These become two new patches, 18 & 19.
  * Update some comments per review. (Alex)

Changes since v4:
  * Split patch 1 into 15 smaller patches.
  * Cache the new DEBUG_TARGET_EL field.
  * Split out m-profile hflags separately from a-profile 32-bit.
  * Move around non-cached tb flags as well, avoiding repetitive
    checks for m-profile or other mutually exclusive conditions.

  I haven't officially re-run the performance test quoted in the
  last patch, but I have eyeballed "perf top", and have dug into
  the compiled code a bit, which resulted in a few of the new
  cleanup patches (e.g. cs_base, arm_mmu_idx_el, and
  arm_cpu_data_is_big_endian).
...


r~


Richard Henderson (20):
  target/arm: Split out rebuild_hflags_common
  target/arm: Split out rebuild_hflags_a64
  target/arm: Split out rebuild_hflags_common_32
  target/arm: Split arm_cpu_data_is_big_endian
  target/arm: Split out rebuild_hflags_m32
  target/arm: Reduce tests vs M-profile in cpu_get_tb_cpu_state
  target/arm: Split out rebuild_hflags_a32
  target/arm: Split out rebuild_hflags_aprofile
  target/arm: Hoist XSCALE_CPAR, VECLEN, VECSTRIDE in
    cpu_get_tb_cpu_state
  target/arm: Simplify set of PSTATE_SS in cpu_get_tb_cpu_state
  target/arm: Hoist computation of TBFLAG_A32.VFPEN
  target/arm: Add arm_rebuild_hflags
  target/arm: Split out arm_mmu_idx_el
  target/arm: Hoist store to cs_base in cpu_get_tb_cpu_state
  target/arm: Add HELPER(rebuild_hflags_{a32,a64,m32})
  target/arm: Rebuild hflags at EL changes
  target/arm: Rebuild hflags at MSR writes
  target/arm: Rebuild hflags at CPSR writes
  target/arm: Rebuild hflags for M-profile.
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h           |  84 +++++---
 target/arm/helper.h        |   4 +
 target/arm/internals.h     |   9 +
 hw/intc/armv7m_nvic.c      |   1 +
 linux-user/syscall.c       |   1 +
 target/arm/cpu.c           |   1 +
 target/arm/helper-a64.c    |   3 +
 target/arm/helper.c        | 383 ++++++++++++++++++++++++-------------
 target/arm/m_helper.c      |   6 +
 target/arm/machine.c       |   1 +
 target/arm/op_helper.c     |   4 +
 target/arm/translate-a64.c |  13 +-
 target/arm/translate.c     |  33 +++-
 13 files changed, 368 insertions(+), 175 deletions(-)

-- 
2.17.1

