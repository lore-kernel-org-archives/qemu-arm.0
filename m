Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp153047dlq;
        Tue, 21 Jan 2025 06:25:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWz1EK2mXQXFvXw6GUJzonSH+mKEkSGoma3x7MFfRDfflmeiNzJc47U0eEFfxL0vfh9BCQMF/RyQQyqng==@linaro.org
X-Google-Smtp-Source: AGHT+IG3J18g1I/ZRJed1dWptY1lVREAUHrx9g+oW6ERxZNeBI03v0EHlDruA6hHW0dEvXDHyTvv
X-Received: by 2002:a05:620a:2484:b0:7b6:df08:367a with SMTP id af79cd13be357-7be631f4946mr2547152085a.23.1737469528712;
        Tue, 21 Jan 2025 06:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469528; cv=none;
        d=google.com; s=arc-20240605;
        b=c+8ZX2F9MEuRna50liySLNHQtkLQ4E/HQbXBd3KOTskYTHD6HG0R4PAr1IrPG4KFBh
         yoPJbWSHVRupMvUIvvKRGVFHaihQ1S7IgHWgTGfcQujpScO0EXJcVMyPODuEREDMQPpk
         0f+6uLV13qoQVvskp3nZ/KRupi6/X6PPZ7w7VpNHusyoxKinveJZYhDXEAfuQsTVNUmK
         usba0jIOd4d5c6KfYPk0ACFJUQKglAQKRL6GCSY4sDcuzBU60rFEm1+CXywO1iTeP5xv
         2zNbtmv7NvKmvcKcHzupia63WuQeJX84U+1uC/feff4jXMSMnVqG25fiOBcg8stX8oc0
         HzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JiIs8YYj06822iMH2Rgg/pc1ZfogTC4R+p3YX6Af3lQ=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=KeIfymobdM1sHV6XB7sm+MH8b1/8LTjoXgD6pATC6xYtFiambMZbWNmfmffrwaKdhB
         75y8vMOp3yUe3gvNmPf3w1Fw+WJ6/1Ub32HFbpeAnHfdSBbjGOIhjurLD4w/94sxPBdg
         Q5IqIBLnxoOPzJpiMF1k3zIZHgFbBpYNBC/wHfctRDEL5ph1MUvb8HetT4vXkuCH464T
         zfE0gkADvbFlGHFJfght96slB/74ZMbT/rFl2OQyAgugmEz7EUyJ4evXewXVN48W606l
         DoS1K7phbv42GRqtUnjeVL3odDwZakbg9tQmDpcimuDG2+V1P17C2fctkXY8V+Sfjp9s
         uxzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTB3p5lD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be7497e443si711966385a.239.2025.01.21.06.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTB3p5lD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFB9-0000kj-Kw; Tue, 21 Jan 2025 09:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFB7-0000h0-HN
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:29 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFB5-00038V-Ve
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso41474105e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469466; x=1738074266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JiIs8YYj06822iMH2Rgg/pc1ZfogTC4R+p3YX6Af3lQ=;
 b=jTB3p5lDYf3+8kBtX5RyuD6LvUrcnogsIHONfQbMgRKJCV8vIcj2LxieF5U58M5dkQ
 fKLJ4CAztL5Tff2TetyutnsemG4C1vj4ovtpzoOJSbuV4rtpGWQsL6f9itG0ZVH12Veu
 ek5na5sfAyFudb+CyDRSK3imkSKN590idOVsiQOJ/79nNr1XtzmRZCR/DXgXphxc3o5M
 pkizCO9xoirdwf9eIvi1HY5bsLqhslx7BnKiFwUd7DOXdIn3X51WcjTtFiFQwMYnz1EX
 fK9bo/BeY3kRn955PM/EHYcUrM1eELUyBt5ICG7pDsNHI019zCme//J7n0mUlHq2Kr/W
 vJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469466; x=1738074266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JiIs8YYj06822iMH2Rgg/pc1ZfogTC4R+p3YX6Af3lQ=;
 b=t/9PH7ddcUt3BZDWC8KOqj7lZLfKLpHJ3Lq3DvkGNcjtOzoRE2oCjG4GS9Zvf++PRy
 D73kqWjOgQbPJ1YeFTwqHhxNTdiHNr8STP/bDe9zd+qb+txygnrEcbK69jG5Vi/ZTvaZ
 zljwH1DWoNm5IHw29fg2+3UTWjV1t8IAQCzlXFH2yQWN2/Lv4Z05YZMflSu3b2rfTnHU
 Mo/HCPyzxJGPkquB42KlYEMrSEFE+L6+8Y0V8CC4dhuxKbgmkiN80vFE+xR3id64cUDm
 X3khHUu6JlDuz9+LxDUMjzlXH+orZHlGad5IZrq3+Vj4Nc+8EAfKXdrSGYpdWegABlLO
 lxyg==
X-Gm-Message-State: AOJu0Yzd3pmR4y0j2fRrQ+Y2/HQffP6lomgLVK8wxnhooXl+YHvDJSJB
 0MkR8TYRwqskFMJMAUS3Lkt8U8qNLwDr15+bojJ8WKtAJnwK7CwyB/h/eG+wcLw=
X-Gm-Gg: ASbGncvBFqzn38l6ACeh4pL6pmsh/RFpuxiGNUs6kU3tYQNYAHzWXStFYFcobhksAjq
 qGycERXq2W8gBfrkPyg+blM7zNr7kKcG/SBolL1wvf6wNMKz0XIPRKyyI32ROjGWO5twQGBeRsU
 T+jAl9og0bnwh3VQ4AolT7Y4xEcLn9fvp6j09FFi8q7wsa5ULWHOeRulPJQQzwJkFmsMnGD4i8d
 cPVAowGvFr3rTHVQcVyZUb+LTPpTRRfnuyf4d3snagOZlAOti9V1do39Cw563D7XkXxwB7dsusy
 1wVhbO4+SNN8msRYnpM0oc9EaLU/WoqOQ5t7Ks6a31Xz
X-Received: by 2002:a5d:64ee:0:b0:385:f1f2:13ee with SMTP id
 ffacd0b85a97d-38bf57b9426mr14843696f8f.46.1737469466639; 
 Tue, 21 Jan 2025 06:24:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327574asm13594085f8f.68.2025.01.21.06.24.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/28] target/arm: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:22 +0100
Message-ID: <20250121142341.17001-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bYpfimL5wESr

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 048b825a006..322c95038d5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -123,6 +123,7 @@ void arm_restore_state_to_opc(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 /*
  * With SCTLR_ELx.NMI == 0, IRQ with Superpriority is masked identically with
  * IRQ without Superpriority. Moreover, if the GIC is configured so that
@@ -141,6 +142,7 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -2671,6 +2673,7 @@ static const gchar *arm_gdb_arch_name(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .has_work = arm_cpu_has_work,
     .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
@@ -2721,7 +2724,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->mmu_index = arm_cpu_mmu_index;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-- 
2.47.1

