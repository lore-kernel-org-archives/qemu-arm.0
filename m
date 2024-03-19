Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384119ejb;
        Tue, 19 Mar 2024 08:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNj73++TL1QKjT1bEdMV7GwVcHar1kJt4a3uE3IjOzgJpRtYI+D+DI1vxoaIc7GYs/hRVlYfzqAv+1UTjOdiKzgqbx6FR8
X-Google-Smtp-Source: AGHT+IGh6vw3Y6SDQs46oIjzhrUDS/LrT7kl0niSt4EqY0Lf3iPyZfA9s2qyUs5dQFg3a3FBz/2r
X-Received: by 2002:a0d:dcc1:0:b0:610:b98e:c17b with SMTP id f184-20020a0ddcc1000000b00610b98ec17bmr8096756ywe.3.1710863227911;
        Tue, 19 Mar 2024 08:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863227; cv=none;
        d=google.com; s=arc-20160816;
        b=l/C+zy1UGh20FO7xEob52yDLJUbQqt7bkFz3T1pvMCuj7Wwmr65nwO828yAMLwcLr4
         CszxSuKyLdnMY09xzKoNQl7o454hldBsvMeQpzfoYiceJbQY4gB/zh7IJ9VVbrzj0q04
         vpj0mCqwFxkfXvkiqUN2F8zL69zTLyJVh3g2pQOZ5qWg4vw2Awm6QF/WNsrYLcR5qyEv
         B1j9y8sOX58Z7Ng422sHOLbg54GZleQg3dmeJwxuhWBCxfPa1/FZxlr57k6BAP1CyxUw
         2OM7dBy3iT5BxhyHObXFQVmVpK6px7y+VOyK5ynSaPYkyJkzRoaxKgyD9uGq2a49wBGi
         qTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lFh6leBQNpipJMM3/s/OcU4SdyeufSpSeMnLPrJ3AQ8=;
        fh=m1RBg5y6NL4+ylsSJOYVP/wENqx8d0Ups+Bbr86mzmc=;
        b=npPo6ZlR+6dX2Dv7Eu2NwbosSxuqQNgyBCNlhylAPHKu+lxO1hr9R5aY31W2gAISU5
         82IJbYzK63UB+D5p5ESGMZtDF+SZGE9d8Rq7Y3y0+MmXh+d9N1zHVoAqOszAWchLDa2S
         gkUkU60BlemYKUmHJjEJeoT1RKXMrevTioPj6stiQ4lUDRD0wypp5oCb+lqW/Vu/Mevj
         BwC6LBBjmACrmDCBOztZJMI1myaZQ8hxrQElHncMhwce4+xAZIJ3nlvdtkl//HbtkUmo
         9e0XXG1mYWl7S6HgPFvoFtB4b58h+tf0o3LZsGatDRjGkXo5A5bOOPwOkj7XqTDgNu9X
         GMxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj9osDfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a174c00b00430c6ac395esi6021002qtk.219.2024.03.19.08.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj9osDfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdj-0006x0-GA; Tue, 19 Mar 2024 11:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdb-0006Az-2k
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:28 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdX-00059A-Ha
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:25 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d46d729d89so75978631fa.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863056; x=1711467856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFh6leBQNpipJMM3/s/OcU4SdyeufSpSeMnLPrJ3AQ8=;
 b=yj9osDfrqU7QkCrwjP9VCRrr8Ab0rydLLrs/1x9FJjBFXuQ0PXMVDlL6Q6DF36F8sA
 TR39483s33mOuLK3ctZR3dSV5E7yVGOSe/9FXHdFrQPYUkY1KK+dGQpo02kwRIMeZkc+
 gTZuuOZ4T0G2Nfu744qXzsUPoGhWxWqR7EM6xiZWG57TIpDqO4ou9ezkotyYN3VjXnmQ
 mWK38+r+43Itli9Twlb39WZywFwGNjoUkuoDTvW3E2Ieu0WWHhl9VofoDcXIqz1I8TgL
 D/58Y6BG8jw+dkr5kG63Lpjrbt574my5/8OORefyGYvph9ytAii2KxRsvxOKwXDS4bW/
 6W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863056; x=1711467856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFh6leBQNpipJMM3/s/OcU4SdyeufSpSeMnLPrJ3AQ8=;
 b=gBDGN6Hx96jmZH7CkznI6bCAMRH5g837nsIWKizYlsHG/c/Yk2JH6t05NwTylwvBp7
 FSrtPxm6eAXIdRUCoi/Up1+CUWo6L0qN+mvPRijuTDKGbrYOdh7Y9AQP0uLMXCIil1km
 w8PUYxVUm3D6upw31ZTmPv9P9c5YU7i9uHnDF5H6eSJqzo9QXTCjwZRI7CrxvvQ6fQFX
 lea927LAlc2Qa9CZtBwpI+w/0QudZyXbLknzg3jOXft3fkFEUd2ss/82wveI79VOk7nB
 Be/G3xdFwRVtkbpuIHA7Sc4P1DCSl8UIbc3nmE9Qn5XIZTiv8HgESOqZfoC114I3arC1
 QDQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFJ9hXbdt4DeILvOoUZ9vnHhmfd1hqykPZnTDzcyUKs5sQxI7lAbwBHnFdUQoQHF/TioIeXe8uDImnjO+dSTb2quoz
X-Gm-Message-State: AOJu0YwCfCqOftnt1l/2cPClMsr/66AtCnoqi3LJoFCQphASBYOTT0dD
 AfW/TwquMVm+hlcCWiB0FA1ASSYJhPyG7vvs3WefBL6uIKwt7CMRP14z2Y0LLXM=
X-Received: by 2002:a2e:9653:0:b0:2d3:1bd0:6bcf with SMTP id
 z19-20020a2e9653000000b002d31bd06bcfmr9018846ljh.8.1710863056510; 
 Tue, 19 Mar 2024 08:44:16 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b0041465879011sm2205757wmo.12.2024.03.19.08.44.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH-for-9.1 13/27] target/microblaze: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:42 +0100
Message-ID: <20240319154258.71206-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T3YhlsGt0h6d

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/cpu.h | 10 ----------
 target/microblaze/cpu.c |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 8058dcac7f..956269250c 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -415,16 +415,6 @@ void mb_tcg_init(void);
 /* Ensure there is no overlap between the two masks. */
 QEMU_BUILD_BUG_ON(MSR_TB_MASK & IFLAGS_TB_MASK);
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUMBState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *flags = (env->iflags & IFLAGS_TB_MASK) | (env->msr & MSR_TB_MASK);
-    *cs_base = (*flags & IMM_FLAG ? env->imm : 0);
-}
-
 #if !defined(CONFIG_USER_ONLY)
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 96c2b71f7f..ded4c7a0de 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -113,6 +113,14 @@ static void mb_restore_state_to_opc(CPUState *cs,
     cpu->env.iflags = data[1];
 }
 
+static void mb_get_cpu_state(CPUMBState *env, vaddr *pc,
+                             uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *flags = (env->iflags & IFLAGS_TB_MASK) | (env->msr & MSR_TB_MASK);
+    *cs_base = (*flags & IMM_FLAG ? env->imm : 0);
+}
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -408,6 +416,7 @@ static const TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
     .restore_state_to_opc = mb_restore_state_to_opc,
+    .get_cpu_state = mb_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = mb_cpu_tlb_fill,
-- 
2.41.0

