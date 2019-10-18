Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1228962wrm;
        Fri, 18 Oct 2019 10:50:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeVQcawwbZUkLUdQfEvdxZKaQPhmTemW8AZkX0PUreeCC2WnKn/RjfIAcq+1M43L+zV3vr
X-Received: by 2002:a17:906:1f16:: with SMTP id w22mr10114334ejj.5.1571421002156;
        Fri, 18 Oct 2019 10:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421002; cv=none;
        d=google.com; s=arc-20160816;
        b=bcaf6J6HemjXPyzLTNNcctG2yMIS4BnHv8aamQ+8BuaPI057xjxf06K0hnpUlcFq66
         0UdDJAdB/7wE+ovnlCr/6xvSOWxlKwYISVbCxI7QF4BJTlV8JgIu9/7eWBqsIgicmCK8
         F/0xzkJT1TWO61dlTthp0pxgKGl9H7jOdFo2gHhXRyr0ASHhau2dwNVKCkqhnffby3sw
         I8yFAB7yqM0x+rhMqTIGMaasiastU8C+6j2Wcr9+lLSijGvFkjYCbgB/s9+kUQtkoyBw
         IKU1/IBOm2VkaS4kgfuyfhykiV1toir8LXkRMXihClK28e6jl+rxBYrMQROSauFIdBKL
         kMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
        b=a/mxLsPM8/UsY4rAvwZQGs6XNyEbqCWsny97RTu2HAefwWG2FHbbAvF5qm4Z7V4/7I
         VPXNXGWxDy5n4PpNB8vDtWV6HttVnSrz8IWANYTFCPU4Za9X1jbq1vtsrO6IisuO5b5L
         9Y2W/QVjutijCZrGe5Z91DXjV4Ew2olxZS4jq09eyf5z8zmRdkJ4HBevRiYwI9A9Hprs
         Os/UXROJA0IGgL+uwX0ZxfkSrWPBzfvESHrJMwYkh2me3uNMH/fAVhWQdFmApb9Ljzzf
         jpFtQMyi62SOFxK4UVkw1+KjpVo4UNQzNmHVsPm4E5X4LBJIznXPvtrkhHJy8uDySTkD
         f1Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jqqk+gJi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si4748637edb.149.2019.10.18.10.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jqqk+gJi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWNz-0002vP-NJ
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIv-0006W3-VR
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0005RT-Db
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIu-0005Pg-6P
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: by mail-pg1-x543.google.com with SMTP id t3so3750533pga.8
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
 b=jqqk+gJiZ9YrCR3dy0o3Lgiw7Z6ZqhF1P8W+cy4NtzomqpZ8PrM4mz/jL6j2JhgsR5
 HxiaSaMqOiq7zTWCHl0SU8YnfWKfBh8Rau+7AdBfO00MPF7tCs1D/nW7POj3E6RR4+Np
 fvCuO5qo5WDIrHNgR2CL6kUZfBP+V1HA6e8McptspXkKcsXDJxDCi4edsDzua71ZCdsc
 +4OwL01JdMDficT9qtIHihX0x/W6TZ9kchFmNVS7QjKblCnpR3QuWPYoEoJ+v/3u6fYa
 QOFbuZzbGa1IvMe1rUEXsXulOD4ZUJMSU3Kl2PS5ECL2v5n5gPqxEJQCa3zcxsXR88pG
 ZHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EExBny+oAa/2RvpDTj0xViQxKJSM6o83jutlTagIpwU=;
 b=PXMVzk1ccJ0cfT/Ek6MHK8A3f17n9WnKC0l0go8NaiqB07GOV7IUXbJH7+YRl8PxWM
 NU5wexEKLcuBzjmrauqPRbOgTSKjHV578T5CV4hnESqLci1vfgwlUO+RfER75PvDMQlU
 +hMM2XC4MhzqK7KhAnIqiq6SjM+FLkmlqxWurJowN/9QXT3vvnBYmHCzPBG60+S1lO3Q
 mgXbNfsITTDQGhn8mWJPlzMQ3Wg//mnFv1D4zSE5BnxSqnhqnfaVI+vC6UiXRpgnKCta
 8BOS36TBbVlGrV2i8KFZGYTS3j4hVYsz6Y16Oygsduw287gUDp9Uvq3HZDkFJMusizqD
 DiWA==
X-Gm-Message-State: APjAAAUnSwX5HEDRu1yNcFLKvl60u4eOS+DdGQ8eY624IWc+x4HoUj0n
 stvf/GF0qCCtDpGHdQfu0yCosA==
X-Received: by 2002:a62:b616:: with SMTP id j22mr8036487pff.55.1571420682064; 
 Fri, 18 Oct 2019 10:44:42 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/22] target/arm: Split out rebuild_hflags_aprofile
Date: Fri, 18 Oct 2019 10:44:17 -0700
Message-Id: <20191018174431.1784-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: xAllIzrWr2M3

Create a function to compute the values of the TBFLAG_ANY bits
that will be cached, and are used by A-profile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1cd54cc93..ddd21edfcf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,18 +11106,28 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
+{
+    int flags = 0;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
+                       arm_debug_target_el(env));
+    return flags;
+}
+
 static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+    uint32_t flags = rebuild_hflags_aprofile(env);
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
+    uint32_t flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-    uint32_t flags = 0;
     uint64_t sctlr;
     int tbii, tbid;
 
@@ -11262,12 +11272,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        int target_el = arm_debug_target_el(env);
-
-        flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_el);
-    }
-
     *pflags = flags;
     *cs_base = 0;
 }
-- 
2.17.1

