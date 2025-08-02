Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA87EC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLo9-0005jJ-PN; Sat, 02 Aug 2025 19:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmR-00033o-Cu
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:48 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmP-0005kR-UQ
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:47 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso2675604fac.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177804; x=1754782604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5djZzXS5Dinimievq/95HDV9TuYnTpWymA6EcqizEU=;
 b=WewFUTzrhMyAaMPW16MAi/D0aolrbYQglpWe54n3vZa28NtVYYBcbVWKt3Obh2Us6O
 aKFGZPDvaELkv92xH2f6gasiD0LJNnGNQOR3aa3/t6+YHNRyKM61tboK/NE18wnENh04
 jXum7ebydV3w99WkIMMHwKVwSx+tD3G4vE8PfsnWOe+VaUtD+Defwyb34bwI0Kti2EXr
 41YyWR+hDMVd0XqJeTDG3jvBDGSUB7hZBKVRJAMcRPw7ODGbUnIM9UHtIrIancsMR4rS
 bUZiTtWB7S29NhXBiI+GhuFdL1MH/shLnk12ALabYebcLMbQdnVqn/yK4lINxd8gsHNO
 mKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177804; x=1754782604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5djZzXS5Dinimievq/95HDV9TuYnTpWymA6EcqizEU=;
 b=Z6I7mLDXOj3XAhdc7KiQ9iWSNSW3Pzp0cvtHXQW73PAhxAVV8Xo5bFke5daZt5V0RB
 bKXKVYqUl9ftTkNXSZ/FKLsEPCiummtVD9lywRheBRhU6gdbmx5Nfn/I3s4mtoMJJPR8
 73JhibqLocbewGJbYuqTVe9iWAY1QT/Fft2lHtbrpysPL+YXEbtsqYD6FZgdLpQS9f/t
 XOhwYdN1crSvFpRT15VS6QElwY7IJ+Re/taBJn3RkmUiYtn+jHqyqxXMQ73TdPMyEMmH
 jXDRg9axNMlli7DFfbRK/+PRjeQr/aI+xv/dkCkSd79pVjR7n4HUbbPUiuS5SnM+p65S
 vjLA==
X-Gm-Message-State: AOJu0YxFdAEo3ZDvYvfzOo1mYvEtseDnkEh869t04GEvSXsRYN5ZD4a4
 /tljY86jTGciwY1Q9YUJ45iptDgijoxQ/WBWZpKPFG+TJy1mm1Mm4H3Opw9sDVybT0Q=
X-Gm-Gg: ASbGncuZFxL8js+ovw74GJsAYOSCrfiS8FYukeBa2UdiVfuBFGI8U8T62IDefyU+8OW
 XylYRogU6adVa8lsHT7VMlISM/YYG50iHD5KALnOGgUBVf4quUg5PLerlDXAPZZm5lNY+Up2CAe
 5Ni3BFs4HMdnQ6ywoDnBHeBP4wmMWKE+mSwL9VuHpfe0K2BIC8L3Z0VgjFVinf3bha+PiBtyPdB
 Qy38dugjiaCGon/eETkHQUFau90yKoyGwYHEJ3V76fnbALH82vuAy4cL91YzzgsOIvS/1KoPgBJ
 64ekjHt/H10m51Fv8nnk18kjH1Ys3fqD5sQ7kckXsYrahL5PrJ1lkheKS38IsYFdtL4vlU8b/Rx
 1egKk7/G3QYR9YdJieGdLDmJnu1rRQPlLEWSfLWY6gCjsl5RDaGP+
X-Google-Smtp-Source: AGHT+IE4Wrfck9OUylO4HcW2JLy6SCukYXLWAEj+KiTJ/TuJwyvRkCA2EjU5ISzUVsUPpkabZqFXWg==
X-Received: by 2002:a05:6870:a9a3:b0:2f4:da72:5689 with SMTP id
 586e51a60fabf-30b67739802mr2633111fac.15.1754177804040; 
 Sat, 02 Aug 2025 16:36:44 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:36:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 46/85] target/arm: Implement gcs bit for data abort
Date: Sun,  3 Aug 2025 09:29:14 +1000
Message-ID: <20250802232953.413294-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 1 +
 target/arm/ptw.c            | 1 +
 target/arm/tcg/tlb_helper.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 805f4a1876..7a42f8be0b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -756,6 +756,7 @@ struct ARMMMUFaultInfo {
     bool s1ns;
     bool ea;
     bool dirtybit;  /* FEAT_S1PIE, FEAT_S2PIE */
+    bool gcs;
 };
 
 /**
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3c84f0f024..ce9626b627 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2393,6 +2393,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         fi->stage2 = regime_is_stage2(mmu_idx);
     }
     fi->s1ns = fault_s1ns(ptw->in_space, mmu_idx);
+    fi->gcs = regime_is_gcs(mmu_idx);
     return true;
 }
 
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index ae2acd6727..37c7651799 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -78,6 +78,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
 
     /* Form ISS2 at the top of the syndrome. */
     syn |= (uint64_t)fi->dirtybit << 37;
+    syn |= (uint64_t)fi->gcs << 40;
 
     return syn;
 }
-- 
2.43.0


