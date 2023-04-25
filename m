Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3723366ejm;
        Tue, 25 Apr 2023 12:48:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlM7FAK9MVcZut7Y2dycKVDxRRN+gthNgAqRGF1IUEbwAhHZqW01bwG5MN6IQUVgH/lYcb
X-Received: by 2002:a05:6214:29cd:b0:5b1:a698:43c6 with SMTP id gh13-20020a05621429cd00b005b1a69843c6mr30637515qvb.18.1682452125604;
        Tue, 25 Apr 2023 12:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452125; cv=none;
        d=google.com; s=arc-20160816;
        b=A0A62LAP3OBWn/WYJl1c8/8gheBKEG2w3SCrxMuWI6XTR4yw4OHusE9DnJVlqI3g7e
         shX8seTO2+U7Y1iY6IrSuZAqVljXwIgDB0BTtRF4OOHLHRWO4A1eoljUNbcf7sOqBuld
         TrDzhK6yFVP9GpZxomUQDoicsqGhxxwdXygSHxqo7Sbn3OJKvM0rNpnT+vU2LnQevFsh
         3LneIu/MBgAfwNOaVSgXD3L9/JQomXQ9mAvyGRCc0sRpFo6ioNQu3rBc9PRDGJdm4d5T
         l3CaVcFtO+EOkcgUj0gtkwYd00tLGGuREVwWCUODkNYIJpWrkgjdWrpOKiyvEwKgPufp
         1CcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
        b=svo3Dzi7CoqrNnoIFqd1817MEsKNUiTpKQrvcMgOq5X2em01tXfLlO/R2u7q2TjRyE
         l3GAt4ZVfdnyTZQ3SPCR5RVDTyRCbYMCcgik4jP/Q9p8Kjw+WP7HqqzVuMhcOs1yZaEh
         ux9sx80bk3KOVZUSW2Y/ycJTG/k0zdlZrrTCYDc+Ug5D8z0uMUK7Uh95lhBSbg2c96rw
         KGSZEfX5OvhFeATr9xj4TqM66IiFeE1aGFEttczsP9c3BOrL9VbfC4d536WWSla2ITnI
         qD3bcCW4FvvNCoTRoArCLvB24PJfI6bPP4AqIPx0rUSW+2kEbBuQz8nLFLhcY9jzM3uY
         dbUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SikyR0KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf8-20020a0562142a4800b005ef8b3a05c2si9471275qvb.285.2023.04.25.12.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SikyR0KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOY0-0002oZ-G4; Tue, 25 Apr 2023 15:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXw-0002mS-OB
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:52 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXs-0007Gz-Gf
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:51 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4edc114c716so6758191e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451707; x=1685043707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=SikyR0KOVeHlbDjVhuVnKq+I3SYoofkrVkB/MxdgBixPU7skE4xZwI9AEVv+ml84Dj
 zmPahdno9MaepyydfnKZDCMlhn5sYK9ALE6c/B4szH0biVWZFDd4+TFTZV5qJDtZId3j
 3x5V5UhGcgpgstmRF2LRPAN+XzD6cjqXGKeUE5ZaLENnA+pa1g6oziJhBC0tnMGl9+MC
 F3N9T4hGq8apENCbb0w1S5YdeH3JzSUNPlHiqZlE6nv2ngSp84t8yOPdX26szWXy9mKZ
 UdACiem0u/nDJPwC2tNb5dW3mIwav14mWyf4iSpNaSRcXko8+Q9aXnRbXjeG7oJfKpPV
 cFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451707; x=1685043707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=axG49N2zGutj1JW6lh07VIDDn57uSAp/hHbYM064BjB2ewUb0akm4Vt/cWETRztJdv
 502FBRz9CDc4hY3ugLkcPSazxpUG3ptRuQU8c/0XXgSvlPotx9+S540E5GgnpG9uiie1
 znGTcAoWcG22Hu2rAIK5VnDkJiI/BKw9d4D6j99568UaWVGE1FlnYIEndqVMZbNmqBUw
 +7GiS80RV2F49moAXj9SU9uSbTJl15TUdglNVMFJP27Y8Cm2yr57Pn+2kH0sVaxrDr49
 p+kllxZPWH8UKX0sgPBZ4HTILj87fMar8ecxAaIeRDdT0V67hSTly/emtJAjFXvBoS86
 T00w==
X-Gm-Message-State: AC+VfDzWe9gfQh8EJMyIkhR0q4oMi52JdgdPeapvoq56pMYj0VhkH3xz
 xdJiRJq5lFQOxZyTBoUS0XPcVA==
X-Received: by 2002:ac2:4181:0:b0:4f0:441:71a4 with SMTP id
 z1-20020ac24181000000b004f0044171a4mr2767lfh.35.1682451707772; 
 Tue, 25 Apr 2023 12:41:47 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 50/57] tcg/s390x: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:39 +0100
Message-Id: <20230425193146.2106111-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RTr9ygkq/Nu2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22f0206b5a..ddd9860a6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1572,6 +1572,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     int disp;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1733,8 +1735,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1764,7 +1770,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
@@ -1806,7 +1812,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addr_reg;
 
         /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-        tcg_debug_assert(a_bits < 16);
+        tcg_debug_assert(a_mask <= 0xffff);
         tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
 
         tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-- 
2.34.1

