Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1022564wrq;
        Wed, 23 Oct 2019 08:14:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwgataE6bd79at/sfwtQD2NTXrHLZ0icz5GBVTyDIoQ3t0EjdomE2hjD2eq7LdgmFAPpBQ
X-Received: by 2002:ae9:c307:: with SMTP id n7mr8904562qkg.185.1571843648839;
        Wed, 23 Oct 2019 08:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843648; cv=none;
        d=google.com; s=arc-20160816;
        b=YfoWAQ4mYDnrWGyngkSSSUAt0Mp/W6EybEWlEhqtNGU18Z6zAu6h5AsMNzg/0IePCg
         SDThIvS/+RgDZDJhKheBeVeIS8m6Ic9SXjBTwB+OMlbKQ+EoAmMcsbKfXJJU8e1YnNeO
         b8Mgkkw5eL5FyFuM7PxwKeEOJNbdxzo9Kl4nBTv6RlSTtNTztCZNTjDrvE6uQ7fuIycC
         SDt828n+q6N+9lDOoUTZWXlppBqzFysnZACq1itGEUVHZuua7mN1RZcwKL0pJQ/1SxNH
         19DVd8iiZBSX50/vnab0eBBQ0RkJzszrpyxBO3dXZRcP7y8/Kuuwel6h/EpCbjzLh8Zs
         l6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
        b=QH5NXUhVqW7zYVN+F+dpoOzMG8qWCC7amqQ9zqKa22lBO1h67RYwrJzJtrjU5A+M+3
         kXUd0scF9ruyEKu4de0Yvr3cDFCoAx8UWEUivvqZ5iEQWhuXAs9YS8gMPgyORWPVpt4y
         22y7PIZ7UxbY54S1tx23kgK8X062fdmG6CJLqjICFOdH/gq0SOWyfYFRLGAhusaEnlvQ
         arCsFHETk7aqDp55ZZMYbMV2E9HHjqzwfVfa6DeYvqH1f4HjOGiEG8uvRyWqRkt8wjnG
         zBULe8wHiOIvHbB/T1UYwMtsgv9E3VK/6HI53ml2GW96vCkJXkXach2fO3eP/2TFscq8
         DTnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ubohb+G+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si13971467qtd.388.2019.10.23.08.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ubohb+G+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIKu-0001tU-4U
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-00087J-O4
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001EY-2a
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8q-00016y-QW
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:40 -0400
Received: by mail-qk1-x742.google.com with SMTP id p10so20030428qkg.8
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=ubohb+G+UrTjpIMomWpQ9Sa5nmzNxu1vYatVTsSKyMH1bdJ+VsGOuRhAFBp6IwZJuH
 MGcS9tTAerLZT8AXkq0eDQ+cm93ffExLqa3t/2PhgOJQ2kI24JigrTOR857+4+ZfRajZ
 MovB3vZMhCgfN2nk2Xg9nysn5DGTXolLJsDrj9HzSq5gYnKMlDLHi1W1KKD/ZeMPhgu8
 X7gDQJwrWFSzHAO9OMDLwmhsqyt6ygUOyZZCryl+weZ2+HRggRCZmVO9ciuy+3zklBjz
 xTHVgP4zTsHL64ppddC/34xbQhqgXJsWBA0NuKw4RqNsCnoQNOslD0/qbALeQf/Vyz/Z
 8aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=rpM1u61GrcakVk/XzK9sIWyVn23FqRwnoAa5JnoZMW4T7rAzspi3YkBjvo0FX8Cu0s
 uCapUI7LiQaEl0OPNcGSP+/Sj0HbWBV953x16un7SkxbCey2lUHmeBb6DLq6+IsVsWHu
 yOA/8I5gz0YcdjeupUA+Q1qReokxxBqUf1G4/RdF32Hjtvw4fG6z8/5ukcxauwtH+AvJ
 t4bZ8hZ7UORdNABU/wVaSf44SOr0CeM6Iw74UF7gcBP+LJKp+2xHf6+DFAV6+vELwX1z
 6fp/uJIHtDdSZNiYE7kZi/SJzJEq6jONMcPi0x07AHa3dx9N3iU7Ec7yfJ+Xz/iMJYIR
 uU2Q==
X-Gm-Message-State: APjAAAVQqXNaUW0JpnA0pSD2yo7DiYz+Bj+DHK5pl/Zn6/t9N9bChV23
 UfvRdztx4QSVUWUFVj6CYflINA==
X-Received: by 2002:a05:620a:4f6:: with SMTP id
 b22mr8910127qkh.65.1571842879590; 
 Wed, 23 Oct 2019 08:01:19 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 13/24] target/arm: Split out arm_mmu_idx_el
Date: Wed, 23 Oct 2019 11:00:46 -0400
Message-Id: <20191023150057.25731-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
X-TUID: LdwxHUoJaPir

Avoid calling arm_current_el() twice.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  9 +++++++++
 target/arm/helper.c    | 12 +++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..f5313dd3d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_mmu_idx_el:
+ * @env: The cpu environment
+ * @el: The EL to use.
+ *
+ * Return the full ARMMMUIdx for the translation regime for EL.
+ */
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
+
 /**
  * arm_mmu_idx:
  * @env: The cpu environment
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 85de96d071..3f7d3f257d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11026,15 +11026,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
-    int el;
-
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    el = arm_current_el(env);
     if (el < 2 && arm_is_secure_below_el3(env)) {
         return ARMMMUIdx_S1SE0 + el;
     } else {
@@ -11042,6 +11039,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     }
 }
 
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
+
 int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
     return arm_to_core_mmu_idx(arm_mmu_idx(env));
@@ -11202,7 +11204,7 @@ static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
 
     if (is_a64(env)) {
         return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-- 
2.17.1

