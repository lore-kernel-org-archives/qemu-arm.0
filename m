Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5172C83030
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:06:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYt0l-00054k-4i; Mon, 07 Jul 2025 17:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLO-0005Ou-A6
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:51 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLM-0004Lo-50
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:41 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4a818ed5b51so27954081cf.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919699; x=1752524499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybeqppIASMpILlSOtSzibeJXQgdx0fr6hKS1er4nRe0=;
 b=qgmK71pX2NWWxbsUS0q6hmTu5ujk27zAjIu1KtDWQHqZf+UFU5nrdWoshCDDM5BunV
 vV3RiB1oskIrU/Yj9e6iJnI2yFUaAfLN+EcQPxRarAsNHxlbGCEqRMW6SsAg1CXVN016
 Zll1mmh4wzPckIy957Nae86PMPsvPEF7swuM/bmGEDGhHJ2sKzq0ApwqkRJKF8dFPefR
 71E2tsJBY9W3ATFvRRuaO1bgQ5RbE7N6XtkFyjj4crxUMT+Xqz1hNmKVPNWzummIzVjv
 ZvAcZPh3HbYviCAp33gB5d2pSQZBqlSxPCS+vSXQcflVZyDBKQNMymHhCUTOXU+jzDjY
 NCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919699; x=1752524499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybeqppIASMpILlSOtSzibeJXQgdx0fr6hKS1er4nRe0=;
 b=bYURqkRHZaphZ3I+gywPfEi1gpI/3WuqB5TwaNguIgJAN5Ju7ZtmXTY0Z8NyjmEJpE
 CAhEpuNT7G6ONY4RsXG07EMAI+A01fA4MmmLYwpXWW5evy7i+xEh0G3MwPzOGc5F/PrS
 uadhTmqBTY7JjtBRy7PstgMvlsEirua4e6XznTvEskjZH3HFTiNmi4IqooLicthjkSOW
 psRto8Fk0zBLXMRPuTEn1W7E36HqvwY+471c7Im9PSU8W6ic6o3PrSNbsVzUF6Puo/Hp
 tgLjvBPcNE8nBEidovtP3+/l0e/1Rg1AT0IoeKDLxHX546Fq4aHIkHpqasfPa912Ilmu
 ZHvg==
X-Gm-Message-State: AOJu0Yx3F7SXQ6a6Bm9uvzF0j51ChQhjrQJHawFVljiT2sUbWUrdLYNu
 Lx1tB3Tyk3ntlUtWWFNwAyhbMIuJt8lWnYSeSW09zWYRQLVwjIrcgRXqYdhG0nvMe50=
X-Gm-Gg: ASbGncuwQVWJaTfr39Crq5eU2T1FkXxNbDZRu1LKu74iGOzOY9pyGgwbjcK3PX2FRV8
 +eK3kVzLsIXO5YzKAyzKko/fUt+PdmThWGXqSBJnIlOL7o1yGKLLsEPX3qQ7UURy5Vr60FcclVu
 OUK2WwBGxy/kN+ZNauq+Zu3uG/y5+vl0m/UfnkGkQVXhgkCc09WOJLUJXaJ52jMlDUsMrRktLhm
 dDpvtJ82PJ2p0WL95pRvSfNVKCWx4U0CFlwvvK2w6PSPehzYqGNMcYGZ4Gp8bJuVmkMH0+T/weI
 QSfPRbENkws4PLZxdACvbPIJxXY1lOOstA5eswxDLGyAPUuTWznVxabKFWwETZ7hcmIBgO4YKxr
 T31taRZdmDTyk1BUo
X-Google-Smtp-Source: AGHT+IEu3+TxoBTKgfKy+3aHCvEP+MO+ZCSYwFSeSPqlBoqhy5CKbKprhMk7mGPwuPIjxQQjkS8avQ==
X-Received: by 2002:a05:622a:82:b0:4a6:ef76:c265 with SMTP id
 d75a77b69052e-4a9987f9b5fmr187230181cf.36.1751919698689; 
 Mon, 07 Jul 2025 13:21:38 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/20] target/arm: Convert get_phys_addr_with_space_nogpc to
 access_perm
Date: Mon,  7 Jul 2025 14:21:04 -0600
Message-ID: <20250707202111.293787-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 4 ++--
 target/arm/ptw.c           | 4 ++--
 target/arm/tcg/cpregs-at.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1781943fac..20b49201cb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1588,7 +1588,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  *                                 address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
+ * @access_perm: PAGE_{READ,WRITE,EXEC}, or 0
  * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
@@ -1599,7 +1599,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
+                                    unsigned access_perm, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index adc681da41..19e67fba67 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3539,7 +3539,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
+                                    unsigned access_perm, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
@@ -3548,7 +3548,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
         .in_mmu_idx = mmu_idx,
         .in_space = space,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, 1 << access_type,
+    return get_phys_addr_nogpc(env, &ptw, address, access_perm,
                                memop, result, fi);
 }
 
diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 398a61d398..c34fc6ec6f 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -38,7 +38,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * address of a successful translation.  This is a translation not a
      * memory reference, so "memop = none = 0".
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+    ret = get_phys_addr_with_space_nogpc(env, value, 1 << access_type, 0,
                                          mmu_idx, ss, &res, &fi);
 
     /*
-- 
2.43.0


