Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721060ejm;
        Tue, 25 Apr 2023 12:43:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350bFAAPnaGtzpte4NhqA4dXbwjcTg3J/4h22oC4Zda5geCa/TmIJYbpwTMcWX9hEPwnBW2J8
X-Received: by 2002:a05:6214:5184:b0:5ef:7d5c:a76c with SMTP id kl4-20020a056214518400b005ef7d5ca76cmr27274851qvb.14.1682451823767;
        Tue, 25 Apr 2023 12:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451823; cv=none;
        d=google.com; s=arc-20160816;
        b=axJTq+POHFRBUcG5m7/ZDGtxWFsn4UdcHMeIGwLqqseiM5VtdyfzbyQRRwki+epPbW
         KFV4lXTq2d/E7gl57eChMeWElOezTv3Nzfd5jSDr6z6ICVqAHops0oUMJzlnDjjpSSCd
         axclpbHkyhkpO+HC33mULEvdEhHKltGBgLMl6FRnnds1qLp0t5JYupfkQfMgstcSQJh3
         X9AIv97tyArdkUJ0iMukvn18P0n9olQ8+WSCygSYgIxAQ39baKeWrlw3xln/lAqZMa4N
         pG7zVH9uV+Wg3YgYODK5s3o/aCVWxxLU3T/Gz7UbesIUiDCeVT7iMAdaSZXw+1MxvP/C
         FAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
        b=Btd1kERzGfB91nL5cElQ5+TUVeH8DbGbZjklqk8OOcT0ShfM5sVxgyF//0Iyeqz+Iz
         m24B3vwXIFk+60olmRNIsLiD1vcW8EbEsq2bWuLuOdch5r0e2mwgyfoMUUTnnBakfbO3
         msj6OBq1daHALoE+iQJmE/BkXNIfQOdAjAluIZmFljaTX/dBnN22U5zzzS/Ul5+Dmq5b
         L/f5IMO2TnnL6qVt1V1qE3jQyQtpybbG/R7q72ZqtCjZxph1OZ4ClzaKh131FgIoTDYc
         iAyyIlj3aQCwY9fJm+Zs/Y23GJinss3Q1idPVLKhk2JmaMp2pkAlrhS7s8fXZn4oYfSV
         x2sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcgRlDw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85992000000b003ef30a227easi9157931qte.806.2023.04.25.12.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcgRlDw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOXo-0002cr-8U; Tue, 25 Apr 2023 15:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXn-0002cZ-Fe
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:43 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXX-0007Gy-M7
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:43 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4efefbd2c5eso3441596e87.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451686; x=1685043686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=tcgRlDw6ECIOkgdNni+h2heGVFiX9cdS6dn2eQ75VTg7UFOR0S2Jv0RNtS3C0Sgg2g
 343A006kqSjq/4NrAs8sbl90RQPN2O2yHOYfkcdMTpVBrJOvSB1NOFkqe827Pvaxq4Ot
 /Qpvz6TqZBss7eH9JeHgOoHTasNA8gLJaHw9rx/afpWOKMpsUtApdlogPE8SGxN1euN7
 8yYPJeR7ccOFuKRWCR4Fcv4j7OE/1QCO+W2e0hCFErdlXOAM9Z9WoEk7WAR1/s90CPs/
 3mPFqnX/i1dhPI2+SlNanUC99J1xe7tc8lx1DI/3crRiiDcqVpTD2ihCNIaqFOSD1NZd
 L4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451686; x=1685043686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=Cj/Uf+ZnBz6hDGKM6XsmgZR9AFqTl/uj3/YwCWrt8g3qHinAOhWWtiWvosZArLyVzK
 D5Nk9HmxIFiwaB9nNs+v8310y9KZk54RRV5w+HCyxJk/rpiN7XUjaWZbZv6Qb/xs02lP
 PkMK/sGjHN/5LmxAi//iKHQBhfu9t2SggyU8+HYSZZoow12O41dn/YP9XVmoQDnsKjGI
 gIuRhC7VRSX6aE9ioQOtxO5RB0CcOux9fS8dBot9QZF5WaXfu8g3eJ4wCwHR4fa3IIzt
 +yI2LauAiKfDqceMhV3lXGurDAzKj4Qy/QpjGoPR8q20XDeaOLaFU57Z3MBHhDZhyB33
 iUyQ==
X-Gm-Message-State: AAQBX9f+G9csXNU+QvD2BcTptxMZ/MKADVT1vLEKLGrShK8Pg0i5ky+2
 0IXhDvwCvHLcPeDElbWjCjCCDQ==
X-Received: by 2002:ac2:4563:0:b0:4ec:8b57:b018 with SMTP id
 k3-20020ac24563000000b004ec8b57b018mr4377425lfm.33.1682451686253; 
 Tue, 25 Apr 2023 12:41:26 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 46/57] tcg/loongarch64: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:35 +0100
Message-Id: <20230425193146.2106111-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IlAgqxe4z9jl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 62bf823084..43341524f2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -826,6 +826,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -845,7 +847,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
+
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1

