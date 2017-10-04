Received: by 10.223.197.9 with SMTP id q9csp5936954wrf;
        Wed, 4 Oct 2017 11:50:51 -0700 (PDT)
X-Received: by 10.55.40.19 with SMTP id o19mr26676281qkh.146.1507143051869;
        Wed, 04 Oct 2017 11:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507143051; cv=none;
        d=google.com; s=arc-20160816;
        b=eKr1FNDl7Xyi9d7HMK0+6iT4fOImTQghWqCnShZLYWeO0NWRayHh7Dwq4NioZxzEj1
         gNTr3RKoKOxnfFKjN57PJ+7M1w0vADs1Sgn/lGy0/6ownaimedppx5rSZH1J3IKV/owf
         RSSiXpfir79epkfk1KamJo1jg1rjZx/qHCgU6vM0Fg5uA3IUXqGbWFYXiIWwgdBEN7hB
         1tHObcfOo0EOFmhrZUa3Sd4wEm3ia73ysP4R2yrAJkiwY9WyL3NWKRBI1Cd+9RsPSkTk
         LYFXvGVDp2WDEaW9+vyOaUimAlhHlN7nBrqrYKd3I59UFYzX/8zzdAEuRGREzXmH+vp3
         zbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=b+9rLgDBfShWST9hHmo3Upcv7Mo8cJQOAwEILtOo+vs=;
        b=ecdX0ENllxB77q+eTnPa+H1MXi6Ok56pgJJXSfGcV13H4DqFffYLm0FuOLIayClQId
         PEEc8zKPj9mmWswwARPZszZ3Sh0oL3S8jl/8ZX9B0cb8ZB/4AcYtBV7Iamq66WKHDTUg
         DnoTgI1GefRCPOAVFuR5xA9jzNH8eRqAR/ZUo1vcORfE9bjSVEN2+fVxLgg8Ukvj7I8c
         w7RSc5jTa/c4XEafsoyGW3VAq+bb63Yf4ZZTjD7jgY8EWzAqqE2h/kORpS2yJ3eYHCfd
         Ow+8SslEmBAVrnfoSYCu77Im64TWnCGgdfadxCjTWR+nHT6dMwdW79GPS8TkviEnnKDH
         M4+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cRCX91Qx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v185si2614627qki.538.2017.10.04.11.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cRCX91Qx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzokt-0005yv-BE
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzody-0008Fj-Fk
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodx-0002kW-IY
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:42 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:45357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodx-0002k2-DP
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:41 -0400
Received: by mail-qt0-x236.google.com with SMTP id k1so10069378qti.2
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b+9rLgDBfShWST9hHmo3Upcv7Mo8cJQOAwEILtOo+vs=;
	b=cRCX91QxSoWGhpmaJsEchKvBp/60bDNjDoX/fODaQCNRMwLuyAl6q8qpyE9M7HlmrA
	LlSFzfZfnz1HcaQ6yc+r87Je2dv0PLphkaYYuaHQYvdNfVvTdYXsA586m0TDrDO0QDN/
	gdzQCrU3J5J/IPayhhSX3XkhQ4qqUjnzy4wBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b+9rLgDBfShWST9hHmo3Upcv7Mo8cJQOAwEILtOo+vs=;
	b=N4IT3/3r/UOhMyMKjkxlooq61n4XuCN44amD2R5VDJmocZK+uRgAz7BQBtJ7sGNTl7
	SJGsAbnhiOyu2WqsRYoVWupcSi/y8ToM8B6q53EZg2LRL88iQ/mvJhiHmSpr/YSFOBcp
	W9d/ciFpZX/SRVjXO74dgQRd8Jc0wlQqQm7bkuhep96lY4iBKZZ1LJ1F55nSRUEJQoXb
	yINhWNkY+QZ1dtxJegipUm/8nuw4Ft3vOtSFHB5gXQLQVgjywRwpnOGyHOE30Dfe6VjP
	/XMhu6QS+ntoYAhfZXLnEOh6slfjrwm1UD2Mqj5f2QvaTeQ529fWlkAisb1MPAUYNBAR
	I8Ug==
X-Gm-Message-State: AMCzsaWifnjJ93hwXYJYAkrPiwzF9MKjZcYJ3tiI09BS2qcHCSkVKnRH
	uev4pSY00FkRzfUIxHkEYRz8hbKkoFg=
X-Google-Smtp-Source: AOwi7QBoNH+iXU/PRLXxbzG6ZNGv9KE/6gjT5YPs+YOp/WaUZPv3Z+8/B4WmdGiSwh9QHQMQaJpdUA==
X-Received: by 10.37.31.135 with SMTP id f129mr4684275ybf.237.1507142620809;
	Wed, 04 Oct 2017 11:43:40 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:21 -0400
Message-Id: <20171004184325.24157-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-arm] [PATCH v1 08/12] target/arm: Add ARM_FEATURE_V8_FCMA
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymiSACXkoTjL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 1 +
 target/arm/cpu.c     | 1 +
 target/arm/cpu64.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c5c9cef834..fdf72534d0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1313,6 +1313,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
     ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
+    ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 003d9420b7..788e46229b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -541,6 +541,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA256, ARM_HWCAP_A64_SHA2);
     GET_FEATURE(ARM_FEATURE_CRC, ARM_HWCAP_A64_CRC32);
     GET_FEATURE(ARM_FEATURE_V8_1_SIMD, ARM_HWCAP_A64_ASIMDRDM);
+    GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 276c996e9f..722d2806a7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1604,6 +1604,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b05c904ad2..96320ac0d6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -227,6 +227,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.13.6

