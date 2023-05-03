Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654435ejm;
        Wed, 3 May 2023 00:12:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5K5+7+LuUwB0vY3zL2tmLDPWs1KtxFlMqs3G1XwGTzMRvoEilOAw5IZKnHc4QaAqT4Y2dN
X-Received: by 2002:ac8:57c4:0:b0:3f2:f11:76e0 with SMTP id w4-20020ac857c4000000b003f20f1176e0mr20073478qta.1.1683097977685;
        Wed, 03 May 2023 00:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097977; cv=none;
        d=google.com; s=arc-20160816;
        b=kjyl/qkYV1M0emxrH6Mxbq71kx7+z8uvjCjjwFk7nsSUe6/Z21o8vq+VRF37Uzpm4U
         Hfzw3o69VROiIEcmKuCUeopaCuuWcMHC/VvaN1Nj/1jeeEJEepX3YS8moJ7HQ8iC6aRu
         4uHA6FAshl5zEi83d+3JtnVFYXxH3gCwCw5ywNiKaUhf6Zeo0p6QlLVpk4i7r2ksP7r4
         t0rKr9RATFcAUlDTgPw66/2/G1PaNulAiDvpDLbeAG9N2JhuOXqfdL4QLskQl6u2YjZi
         5nUO2JWH1CTZe8ofDPwznzr3w8Wz+WbOVe5hSzquBu8FzObsgB53dGG/49ylIOc+7dZY
         yZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
        b=KuVPfp9k3ZGosOQcCUfxM6YZVid8aHMtjLqgxOwquTbYKq+d11tmM2bv/DFCstaLUX
         3xF1aqceftIlp/XWx8LXmtvNqQVRgrPtGKJdmc++/3vmOybV5HborwmE7b0YQoH0YUmi
         ihkJMUa8C9RHQewrsjbZ+Gn+4lPWHqW4MPZb2iikTAh1W3++JEv0o6IyQdMkp5Zxbwrd
         QHqA6iolu/ZlRJzVETcpflIvAO+ZlLdbnwdR/vnK5Gu9wC4mtEtYWxI2WSUrY1NnGhI3
         YeBF1wp+hVDOYVLTTGnQcdSviedxbaWo4GnS23obMT5KwfeayAiXzoMhl27WCTXxlYk8
         +B8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvG4Kq09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020ae9e711000000b0075169f11d14si2615260qka.160.2023.05.03.00.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvG4Kq09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6dk-00048Q-8o; Wed, 03 May 2023 03:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dN-0002tk-S0
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00073P-83
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso31704735e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=UvG4Kq09uplNadGTc8PJAfzwYnX9k6t1vOVCKn/OyHdSAr4drcDpMFLfbQScZpbAw7
 xkTr/mUzcldVFwMvk+bj0jlwGO0/toFV9eu638UsOxTUDSBnp5PteLU92Mj1Pz7F/LDd
 dqy/OK7Avr+pqceaEdrjOuWaanQAMVcMfbQ/PWxCk3rc+fys1W6R+Ah5rpXwHGIECNV0
 RJ+jxq97rYCkSIIk3L6/MPo8xR9ipsoF87ygHL/ykD74Ob6dLueXNr0+x0JVvxAuec2c
 a1ioth2rGJKJ6NyA0oNlAKlNGE4mpouLHL/yyvRoOLsyb5DGC84hx4DpdCKbX+F/m/M5
 JRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=iqoZhJrDH+3cHM8jkXAZr4TibC0SYw7AEUEvKZsX7ZB42PnmRV7iFHeoP9Eu5bBvKs
 GqH1O4XsicUUkdgh5LriA0Krz+hdMgRU8iMCcyyGS6kItHo73DMuV1CCBy3UcP/Gwxmq
 TndiUNSjgdPb0c/Uxji5xTKY7ate5u27WLQXB15aonkV9RPklmJFa94vLk5vG5j4S1PL
 6Cbvjg/xGYWOcIpIfdp1Hm+OChas7l2qnrkTAFiNsAmP/2bE4tVQGAbVzphtF3LHEzpj
 pyORsF+sPH1MjX0hYl12ZP0rhDdxRhpYaj6B+qbtE8S+wwm8WS1Tg8UbpmArQRhfZjUq
 dO1Q==
X-Gm-Message-State: AC+VfDxhVC0l9Wi0qpgu9+ostyPr7oj1NwoPYyR/ilJSYf1VAojMvUvC
 GJzuhxyN4zTnTVjG4lJEFT2TAA==
X-Received: by 2002:a7b:c856:0:b0:3f1:7288:1912 with SMTP id
 c22-20020a7bc856000000b003f172881912mr13430836wml.33.1683097832005; 
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 45/57] tcg/arm: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:44 +0100
Message-Id: <20230503070656.1746170-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: /nzekDVMqQnA

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5aed03247..edd995e04f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1323,6 +1323,8 @@ typedef struct {
     TCGReg base;
     int index;
     bool index_scratch;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1379,8 +1381,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1 << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1498,6 +1504,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     };
 #endif
 
+    h->align = a_bits;
+    h->atom = atom_a;
+
     return ldst;
 }
 
-- 
2.34.1

