Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp622575lfo;
        Thu, 28 Jan 2021 14:46:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTbabS4Zy/cgi5SAJh9zrcohwIor1AZY0RQJXOaVa+ZY7iIhmJ9AmGTsOAC+k7JEVuy7eA
X-Received: by 2002:a25:d058:: with SMTP id h85mr2151936ybg.231.1611873983683;
        Thu, 28 Jan 2021 14:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873983; cv=none;
        d=google.com; s=arc-20160816;
        b=X4zp45++lwqm+pZnTskYzxPkFN5eBMBlEnOsaWKLKk8RV9CZ16+XGlnpzKUjkdrNSU
         yPo0+PuzpDPF7L4w19qf12ZD79hfhHOisfDkpntSOhcNbUNlxE4OtN0hWEgJB9I1J9GR
         HeXCstg4wI/d3ifqTrKN5Uw3VnyNRiUCCrf17a3BX0zAMuclMXonIvMBTOlgYNDF5HzX
         vpc94I/NXn40hFEepJebBCJ3qf7VYcdQjJS9kgA13qUL3+t8s8KQjyw048XJeMwPOulN
         zSMLytWxnxueqizmRmajZEQjvrQBNL519L3eUqbLj20RTsyKqDGmMbmDqIvg79CETgTw
         9sPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
        b=a/vhsGQ5NplDA2RXYAUrxvNluf9JLpGt+l2pMxs1mjUOAl8N1xiZAg0+sFkdU+dsEf
         T93y5ujI7n7W8CSp8KnGeft1m9v0LggJlN9z+hbcEIB6xQBujfdQNzFfKYBNHx7f7gnk
         L/B31oLMWdR/lf3Q2P1RPDNLaLU43C5XaxpiEQs8Ga1ihM7OFG//9pTcn0b3VEyyLi1u
         GzdAxnpYgDvQZdiWLPQdF1g6VdgOrgE1CRlFlg0XEasnwkbtK9UUlwJ3D8S9PiZIDWKh
         me/KtKseQsj2K9xFdXKyk7mP9oQqhdILUu8z42oA5RR7kebcpdNNnsnNjfD+kgLBn0RQ
         P1yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aw9NDjqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si6852156ybm.397.2021.01.28.14.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aw9NDjqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G3T-0001Kd-0k
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzK-0005Wg-MI
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzF-00088Q-RR
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l18so5250227pji.3
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=Aw9NDjqY6PN9drRr+/r4nElPi2eAAbZVnJ+fn1Z7s0D8FWNFXW47STthtTal25DXQh
 qHZyeD3xL78B8D3btXbY1ByLAWKpBUpr04H14BerHxArgo+E3gOlh5TVD80m3vulh3Fx
 rsfKisD58WD2thmQWv5xTsBApsH7uGru0HCwDm9blDgeRKHzVfriJ1jIYwQ/bKt10SEV
 LMH/eXAAu8xEyMfGbXov7Mjiy5geDpDSr+uATldXchscO8ofjtHoB3Q9kX4i0FhqyaDL
 u6+1u9IblN9g1WIEQYmwHzLuA46QdYBQUGjfm98yo6ryPP/AFG0iYa41XIDo3d6pxoA1
 ez2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=lkEBJwhXPtsKQ2mLpZNgBm+iI3K+pw2j2EcTc8YUcvPO7a3WY26zJ7RNkaUfix7nTO
 zoDUcgCregyQJUH/nHm/diQiQjpGLKZr4zJd2MW8N98fmszJxRZJg8+sFgkUC+szt2En
 9BwH35NVjo4iecOrqm+2tToZtBUXYpg2uZuT2ByhRLpt5PyqXfHpMWyArWSdoopj3DPP
 JK2BDOaPZDxr/aK/UXYC2OTrO8LtfXrUt8DCxYRKg4ptxBqVEsw40eBqw6DtOpBd7ltL
 +TZ8dondRFD8lkXyO/hbcdj5urwkBLxHnkLqwabTE1mHxJtsvArWfpwYx1dBG/C0htN+
 vr/g==
X-Gm-Message-State: AOAM530DRCkS2rH3pTz6x36BFUvbyzx359L2Udy/AEZh4VO5fLLR1iOr
 IRDeHEUiOxlzZlmUBdYgOaVHUQ==
X-Received: by 2002:a17:90b:949:: with SMTP id
 dw9mr1585322pjb.20.1611873719633; 
 Thu, 28 Jan 2021 14:41:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/23] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Thu, 28 Jan 2021 12:41:27 -1000
Message-Id: <20210128224141.638790-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: U7vxU1iSLe2E

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Ditch type changes; retain true for HLB <= GAM (pmm).
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b..4e6ef3d542 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.25.1

