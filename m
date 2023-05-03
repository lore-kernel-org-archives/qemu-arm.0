Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654583ejm;
        Wed, 3 May 2023 00:13:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ifxd5nAovuRWlJABrQkiKodSRB374rvB4sb1Qjo9Md6BDdI2lCt7p2JnL4/iWQ/NS9biI
X-Received: by 2002:a05:6214:20a5:b0:616:55f5:ca94 with SMTP id 5-20020a05621420a500b0061655f5ca94mr7518762qvd.29.1683097997045;
        Wed, 03 May 2023 00:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097997; cv=none;
        d=google.com; s=arc-20160816;
        b=QgG6maVHUZ4wPeeu+SZYHw0vsM/BfHLwiMHt2GrPwnSeXtY1pTtQLBD4RYEvpFjoWk
         8AprqUjzBHlLqcykGLnjxwhCXQZtBHbTp8fOVEDmWJ/0FNDSTsaEwGbzSCrT75lqQHA1
         9EEKRQnsWPeeb0+YAFzB/EQEM2Dw2GBDVkNP6b2mFfgls8m6IwbhxcubJxGHfIirbmCv
         CNljFveEuxOXEOKPyXy3Ly40nDshtxSgbrBSp87lJQo/tc3odhiwh6WkrknGXKYsHTl+
         ae4j9zvxVlkBxbuPD8rLLEBPR13cWYk8JtZG3/dLkLtc+zqPFdyrpiPzLcBznuaL6WLA
         nDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
        b=Ec28OR5n2sZzb9Vwpikpjl3NfrQRjBIywIKJ3wUDZNVeehdBmdZgqChO6dUTpzGDCf
         hSdL72mTgV4h7UCy01KQ8FP+Hct9ANwWGeU8sp9UUPlRtoahMlFK0kg28IR9YGlXG0ZH
         +vRSuzWPXlb4Eud5U0MEQ3rBkLp6AS2nC7RmZfy6q468EnbzYx+3TXjzMpU9ewFOGmra
         wxBJEUqsto9A4HXwmhJqQ42qfKiXn1+c/gp52o6AeMJanSv3nKmoaddyf0kYKmiR2SYY
         nt8+X8D9EgeuHM5LQ0cfViLBo3ASjFGTUQi2T3LwvaLriDRjbDZIYeNrLpwudsqLv+DI
         hW8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y92PkcNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r131-20020a374489000000b007467839169bsi17228101qka.438.2023.05.03.00.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y92PkcNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6di-00041o-OA; Wed, 03 May 2023 03:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dQ-0002vn-FG
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00074r-9K
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so31047835e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=y92PkcNOpzq+QHGKF1ZrxtDQYUzUeOSQwnRrPHcw2qxlOgHljRVQcn8iZJ8frAW2b6
 93Xmrk+Dx9CZ+oJ+zLgDiAzaixPD7GHC1QcYSHRA5XRycAAW/HKpcyanbgjLcPltfxM8
 ApnJMF6msIP1GtZ4ITEOgutPWlizglZ8bOgwXGcUYRoYq085NBvlTRlzypg6KRUpdYgN
 aPjxV7GsMk4T1Bo6aq7flRTQcozgzPWnKnniaCyfUFhGqeVyZ1jpEYAy49By+I2nXxWP
 srnyOPWtLjA/+18WD3ABDj6uvuIMo/afJlYGx9znIPEYksIVLsrseNXYe+IyY9O9cbde
 xUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=AIBTyh7GC/ibno8wvsosWN1ZbOkEfH+W0ZbQamUeJfBfP2oMLPCyvor7lXpcuuHmTZ
 EykeAwQ6c9lfgY3G97qxMzbBLDeeIIxK5Uby5wRVXPh+gTb4KNPx09M0Fjism7Guwpr2
 uCvUhoEGlKAxHVIZSYcW95QBjb+FMeaczN83b1bkG2pyM6X+c0Vq1NnTHLlmRr6sJQD2
 yOaiogAcVj4lfbsCt2KR7QbWW80/hbye4uFnSogqhI9gd3agaD/0aJxC41+B757I/i8w
 Jf7RNCuXIi/+TbIfWUNQDvGUXLQECI1tho9Btgn4rnXo7Tb/yDbzYORYY0+pw6/8gJAU
 f87A==
X-Gm-Message-State: AC+VfDygrp84r15LO82dkmaa9nBWSADZ9yWhhQGIWlcEKTkVg47Fv8XP
 +EqQlVL7kUTWL9UWNAaBCWVoag==
X-Received: by 2002:a7b:c85a:0:b0:3f0:9e2b:22de with SMTP id
 c26-20020a7bc85a000000b003f09e2b22demr14347444wml.22.1683097834050; 
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:47 +0100
Message-Id: <20230503070656.1746170-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: 3NZLg4knQ7hm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index f0a4118bbb..60375804cd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_a, atom_u;
+
+    /*
+     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
+     *
+     * Before 3.0, "An access that is not atomic is performed as a set of
+     * smaller disjoint atomic accesses. In general, the number and alignment
+     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
+     *
+     * As of 3.0, "the non-atomic access is performed as described in
+     * the corresponding list", which matches MO_ATOM_SUBALIGN.
+     */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
+                                                  : MO_ATOM_IFALIGN,
+                                    false);
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-- 
2.34.1

