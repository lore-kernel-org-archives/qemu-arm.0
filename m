Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp648215lfg;
        Wed, 18 Aug 2021 12:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7r4Cc+0KyTR1zPXASD7J1nD4Otd5/DF3MGYvsv/exr7+T8YCurGweWyv6sysJmplfybUA
X-Received: by 2002:a92:d70f:: with SMTP id m15mr7082362iln.162.1629315781850;
        Wed, 18 Aug 2021 12:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629315781; cv=none;
        d=google.com; s=arc-20160816;
        b=rkByvzmXe6qbuqafVhAm3YsDujCebTF52I/3MrLzoybYGtvVriIVPvUvX2t6Ufwxi/
         JmdWRg+TFv1wigkiSgX8QhaRJmvkKIWaHjlKeqi2JxmhoOM3XJUmmBPKmA4BSj56Me9Y
         JXVoevr1jEE5F+VoLvKcPU0RjrmVkJPPhpLZpGwAniXdmGSc/UKQ9acNEzxfr1Mf7DSH
         leiVLYevg4ae2Xo3QAfNVuYFak9zWRzY34hp/Dta1jNXmyQaayj11vbe3pya0lbUwiZX
         tx4nH4k0kxKdtCL9A6aQWlhICu8W1i4/8oal76Lz0P8OVEvOkJLhVEcUTqKcDDQBbGET
         vTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
        b=X3BNOsugxegGON8WYUj1Dusb4Bdd8L2gjMQX2t7vufnPCz9gesBRXQcy12CRSKKo2k
         CN79DRf1NzwbS+WhCI42D20KrSg1LpMeW9TqBO9p4Z6JoWJs0rXPG0mrC1zGOeJDqfNh
         NLUfjMGmRvSwmXn9KgInVj3OnTpzxJiNKfMCnASBTkRMQ5/Tl8XRWbz6R8LPSLFKlQjJ
         fpLWKrclvGCUG0yMd/dGtK9lRWALC2PuOQXxSwQSL70PJqdLP1Li2xUDxovWhi+vgv9s
         JmV5CQB0fioc5OiJ5gLQGt6OBmfVIR6D0o1jr2Ol3HhEbm+2Bas1iGKjXXsmoaro5vGj
         ag0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+FK48JK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si707130ilu.162.2021.08.18.12.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Aug 2021 12:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+FK48JK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGRSm-000864-UV
	for alex.bennee@linaro.org; Wed, 18 Aug 2021 15:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6a-0000tp-P6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6W-0000IV-G2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id 17so3299260pgp.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=Q+FK48JK/6YD/I2bhMtcX+5hmUNWMcqlnIu9BelaWfMa6qNIZv7Xp34aOiFVuhB5tP
 g78tvx5vcBdQUuTSvMUdkslgjEoRm/GUXqsB9d31ynKCDsvHMMe0Ng1n6GTMCgi++UNc
 JbdYQ4H3sUo+nXbCAYuLOtycHoFg588EBAg09B+magBz4us+e0zEqEJ7voPlLKSV94IG
 PjInz7toePIVb8CWDkGBbnpYvsB2zkGigP/UrEVbEIEey3BFMBCRDhW0Jdq6cIUUMmiN
 WKN12lPMSxlVPvmVe+iazeakE4LSJQDhxezsHF2SYsl9ZjQmPlyjyvfLujOqlI/N9mRn
 gqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=Ru0sxRrJcbnITl9BV2zpi0HnUhnp85obAG9Wi0x8vle7aXNh1KJ1P2cGN2B86brscr
 z6lg/MtXPNyxTKuRhf0NJXvdJdZL3IOcaGwssirOQ7XfLkwKKjbLT7ZWAg9dwTuvtGF3
 rJP9op+AHCx0ulp85WL9vi+C95pibdDG6i4wd+oWThw6aftdYDVH38b0FVLoU0SfJ2w4
 ZhtVU0EDBhg+8BT1ngyUklbJYG/rm2dN15OeAPlGDU5LdeGUGHJyfLxIG49qMECPCWy/
 mYZeSzSqCnMhrHl6eZatFig0sCSc5xwJHF/9rjufrr/gGuVO3JFXQrsFR4ZVYpfl833K
 Qo1Q==
X-Gm-Message-State: AOAM531MrOTkOTR6f4DP+qF+L8z0x9g3d05ibX3O/3OazCw6zfXZyxi/
 rdPoKuOcKjbYGwZLTABL8kLoWAyzAUcYew==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr10983327pfh.74.1629314399259; 
 Wed, 18 Aug 2021 12:19:59 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/66] target/arm: Use MO_128 for 16 byte atomics
Date: Wed, 18 Aug 2021 09:18:44 -1000
Message-Id: <20210818191920.390759-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlQKzzF9kKTR

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 13d1e3f808..f06399f351 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -560,7 +560,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
@@ -630,7 +630,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
 
     /*
      * High and low need to be switched here because this is not actually a
@@ -656,7 +656,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
@@ -677,7 +677,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-- 
2.25.1

