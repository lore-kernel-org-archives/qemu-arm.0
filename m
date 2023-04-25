Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721907ejm;
        Tue, 25 Apr 2023 12:45:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkcJm776Qrbvj6BRWOAYzOSW2gH01UWN3f7lhG4QclqEM/qIThXSuBZ2+VEeLj9/2GKQc8
X-Received: by 2002:ad4:5fc5:0:b0:5e6:1bf5:1af2 with SMTP id jq5-20020ad45fc5000000b005e61bf51af2mr31863386qvb.18.1682451929081;
        Tue, 25 Apr 2023 12:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451929; cv=none;
        d=google.com; s=arc-20160816;
        b=BAJbeS6vaBUTGMzff8Z2NLT3CgqPJDQAHncASY7lD/ob5g1s0sRag/rZaxcbVOqQgF
         KyMT4CpSbxPkckTF6j9JvQ2JxqnItWvXvXyjil6gCHXz4bG/OQgcjYvdlhNWlmiPzRHE
         RPw/zNhALr3hD+dpAyXDo/gtUxEd/xsDsWMCWEsRdZ4z55cfBCg8weHm0znknU65aYb4
         qolm6ZCiwNCZixIfv3+E+Q7vBieGif/2VwBIbv/pbQ8XPi39T5GN8xauspNX0jiQZJ8o
         B9/VBunfvzijomwqVBdHzcTpPyVV17KqDefuNPZ9+tgpn9R8D9ivdPX/oaYM8VEtrGjQ
         7nlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
        b=oSZJ8bPJzHhlyfsJEf9ipVDVglsQzEwhfhZl00+OR8sR2DCPaUBVtm/6snf9FXbdJg
         Ov8/EeAXumfKnSJIUqG+8dyPpwhGUFjWuT+5Y482Z9s0TTPloAJbP9jsUh5tJsXNc7Pc
         ocTSW7qnmTI/+qT4h1127BSaQ8Gm3dEVPwVCti9Bz0YXtTXqC6BdOcwj97FgqJLREHD3
         7CXTXrweal8OKV+wbecnyTEnWq+mQ4qNNGkpCI7E9XbNEdK0ryUr5Va4u6Cc+zaMkXa2
         4NqiXOV4Y67VpqQlgndP42g7BxeUFyTUT8m6knVqOrPG8F9VxqVHXTTA5cr/7kgWIdAI
         ksIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwkSO3oQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020ae9eb06000000b0074abdfe66f5si8888094qkg.243.2023.04.25.12.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwkSO3oQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS5-00061a-MU; Tue, 25 Apr 2023 15:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORB-0004L0-6s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:54 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR3-0004iG-3s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:52 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8eb8db083so60791041fa.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451283; x=1685043283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=IwkSO3oQw9L8O1QXDsNgVkRCSX0gq+onqW4DPhYmvtIipyiZPI/dSH22ogL9sYgee/
 MFC8B9AFkLJ4TWb5ZRlWmXzsbOfOdYo7jhqHnOJoFDYQyi4OYzSsnxQtA4WeCxYdPg1e
 qKFbATzakM38BA4VI8qwLEVue8EhqHYNb5kev4Lc6XB9cmIrk8gtuYdP1UID5n7TSe+g
 8sv3HeqXI0mD3EjNlXWL3MnLMcMzb0SQH+KuOijOOA9M5cHw7XsLOt8Rl+E1oPfCbe3Z
 wJQys438rKFA+Wz3wmkyCxs1Fr6tLHqf5RdyEkuCVQDVAPdA/gvDwNJucTtSvcWAY0pG
 dY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451283; x=1685043283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=axnTFEA1HouQDIM+A8MrD/6hX0if+cNgZNaisWlDl23pGYLBCuusK/fkXAw7bbUIX8
 eVFRKUz5y2rRyXfdYNjfoTU2v9E91HGwINfsFMFS17G5HcIcgV5/Lmj5c3oIQdDuYndv
 OZpcJkqgkSK1ehF1YSY+r257HCvMejiOoim+tILMfhQ++9ZYwu4jqGiJ2Fj2hqPmTW/C
 gk5cqbg7Dlg6BKpG4IKhr2Z9JTzaORSRVwHcLTNBMtKGgU/K8UYHHr88Cea80l6rll4s
 /VoWLTEpi5svMWrCLM3SetjW32gAdzSRH62m2wxT1+K1OX70NIdIPBysAB6TR+4OqvUv
 hAUA==
X-Gm-Message-State: AAQBX9fzhEKst4mgUBpTK4BCapAUOCoCktBXzQ6ErZ+tV3Nd8+pSbfCS
 F96jLpdhD9zNmWHdzRbY+42HhZ3RpknkUjiEXLt1PA==
X-Received: by 2002:a2e:93cd:0:b0:2ab:24f:c3c1 with SMTP id
 p13-20020a2e93cd000000b002ab024fc3c1mr2713746ljh.46.1682451283114; 
 Tue, 25 Apr 2023 12:34:43 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 29/57] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:18 +0100
Message-Id: <20230425193146.2106111-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PtO/PJfwf5/R

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 968977be98..de8aed5f77 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1679,7 +1679,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_TMP0 }
 };
@@ -1716,34 +1715,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
-    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
-                                                 : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

