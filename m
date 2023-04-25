Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721254ejm;
        Tue, 25 Apr 2023 12:44:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBIGPB58UoU7Y7ps1g6pnqiBK0IxvrNo26UZilLUmZ+GGPPk+gjPzjfs0y9JAeiC3F5nRj
X-Received: by 2002:a05:6214:e84:b0:5fd:7701:88c5 with SMTP id hf4-20020a0562140e8400b005fd770188c5mr34268697qvb.6.1682451844848;
        Tue, 25 Apr 2023 12:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451844; cv=none;
        d=google.com; s=arc-20160816;
        b=Xbxh9llZ3aNNy/fYB5Ctge7Dd3nQuVVrJXEBXFwr9V2G6XjOpT9/EqBsse24rJkn51
         6xVO1DiEVfK7yVwMjxmFnrA7qCzglJ6hqi4WmZAmBpJAfv4AdJK44lSwZQ+TWrRM3GiM
         O9T5sG5THivrfmj5I+GxhQ9CUCmiu9R0IgI2AmF2pCIWpR0Yz7z0s7OPKeGm6jto9Qag
         PcBAuCTev4OuYZUm1c6WxO4ZMBxAeTsVOMP9+4zFsQ8fO2eDuPbPBXmpPaP4gVg0zHDg
         znG+3gSrybsQENJR6O6noFpAqb/azhKKRtwx8nF/lr2ZMO3S4zSg/86Oln1Xu4uAdPD3
         nYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
        b=i6rIH8BIwzGFF4kOm1iEVmD67+BzB0/1WacamoJW7JJB1KpdU+hAeUBPodz9RMkIrp
         JWa0GywC0gLlVYIbU0fQOVKhdaHdyITwMmJ1tHSN8TB2bV3NYQPfevy4m004Eru5DXwl
         7fvt+tmmahWkpEJCgX8/38Y9cSZuSg8FyQlnwkRnx9xaLF/S07EGznMpWKX54t25IRoe
         4VmE8lXRPWbtU8jTzyAZTHKb/MivfkAr5u7R5fbXqqUhufFGH13m1YjtP6vb+EU4jjcq
         lD3DJBTdMjXYCHSpFlxunDqFYbBkaTO3qOqYyTsQnU5cGwBkDhVF078b2KAxqxogwMPV
         YZTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvExPJBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu3-20020a056214260300b005dda9d02291si9757987qvb.614.2023.04.25.12.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvExPJBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOXt-0002fz-0t; Tue, 25 Apr 2023 15:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXr-0002eG-3z
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:47 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXo-0007Kc-K0
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:46 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8afef50f2so59555531fa.2
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=mvExPJBCVtAUA1IGymCoo7ZSxMGWsopnTGT6rFxBaSur5n9mTmWe/O960ts99y5nKw
 LFVGz7mHvOurQnMDhxtYWstTqJPQGdlFgtOTgbXjgbbpue4NpFwhYdHrQf58llj8K3Ih
 dFsj0NC4ZrNYZtY7Kf3AV6C1wy671O1zXTlUvXkLvAsnghaOC24FY5cfTjcw9zlVoMco
 Azb/Ex70IqohHZkwtctPj61tggqHcp/bW4o0JBLVDyIjquplw0zuabGH0xK5dhIStHXd
 rTBFVBoScxtqVH6d7lenAnC9uh2a4SFCO/wTK+9OwbfchBrrku21Kn2tT1c2TAOk3yq1
 QOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=YRWVit67dOHXJZ54zld7LetNrn0hQNdezaEv0zUEqCVfZ276DnOzifsmmP1iASGe+V
 sqlwpBuBJYH9FuVHIN1cnnwB774dLJ2koKuH/2647kqg3E2QDKJ7v2Lpz9jCv4tLVq6a
 1KBTCO9LgN9/K+vOWEmFQNow4wh9eguYIwKETEW4SWG589vXXwt8Lz8JNqLoImQjgXQe
 HyPWVuhe+ZARcEJ+9ucAHMy0QDPkjhTcwgKGQDkOBpt8JfpesxkO+ZZMhFcX53ebDcTo
 kkIlMW71aaSUmVBEv9VyBsXsr3EAhdWDyTaNV8Q7FgMkrUFAyv94odY1IxTo744c06VP
 y3jQ==
X-Gm-Message-State: AAQBX9fuVTPLLTXMLHWY9SQZST18BCXoZ9Wfz0z4W3iHVgUBdchyU6ro
 KaDGI8RvwBkks6NBg000xotuQw==
X-Received: by 2002:ac2:4910:0:b0:4ee:8ff3:c981 with SMTP id
 n16-20020ac24910000000b004ee8ff3c981mr4411726lfi.10.1682451702769; 
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 49/57] tcg/riscv: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:38 +0100
Message-Id: <20230425193146.2106111-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: JV9yOcDeCoSW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 5193998865..aae0512cbf 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -924,8 +924,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1u << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1

