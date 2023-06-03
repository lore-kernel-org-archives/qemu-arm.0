Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545202ejb;
        Fri, 2 Jun 2023 19:37:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S1TPIOZ0WUynM2JCf/JIYxIngWMdgkvLTSclLPc26HuVj1Bpz+t96v/5E+YGoUQEkE105
X-Received: by 2002:ad4:5dce:0:b0:626:29db:7fe5 with SMTP id m14-20020ad45dce000000b0062629db7fe5mr415084qvh.60.1685759860873;
        Fri, 02 Jun 2023 19:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759860; cv=none;
        d=google.com; s=arc-20160816;
        b=NksueyVU1sxKhxKxrL17wprDCuXJ7S0qXtys4vjoGmCLlH4F1fUipAGcp6YZpDzbbA
         IoughMFxew4Q4GQHOmrXcwQyQNW1ulSztzHmcbR6oAC+CGemh3Afn3seRGk3cxUNLt9y
         YB2JqH9j7U60LghbDh7hFQ/ytvrYqmzAVj+VFmZqrn1exTigLJRepE6EDdSnsQiT1vdz
         aTHKvge3WFWfk+DSAjY5MlxBu/1cFCjVPCEBHXE4I5yOY6IzMclTEI+VGJJOXCvvOHQY
         LP0fyz0fhZqDsdAJJ79J99Dy5ch+WCgnE4RBCY68Nc7r7avPTbVqXEAiJovifpR8y283
         zLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jW/LkFvDYs7wuWSeKP7O4G0IgkgaVuXTO9qaWXdUTaM=;
        b=G/lf7Qf82zuEVgbw/6UfwQQfI9Wwo2hPAg13gwaMImozSLB9Tf+9UUC40HNYLOk0pd
         CUOAykGjnVzi+hrW8rch6Xk38gWLHX1vTym5gg+wQiH1EKkDtJota/R5eucUY2E/tGbd
         5P5B4VHGlt9OitlekMFhGpby5mhztjzDrrJGBaaA2FzQFopFCK/fihjBEw9LBYjrjD/3
         0zD/tjvUJKGMb43gtuMRc/QzlHNfC7wZLDbFBG/2iTCFVK866etlwmOEMGrBlM10qVwj
         8G+gTH7QmyZnxMTCPoxHiFvuM3xosucpshs9h5LTk0kihAW+f20Hl3gW1r8IUMNPf/Hn
         hySA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnPFh4f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac87f03000000b003e18051efdbsi1679529qtk.671.2023.06.02.19.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnPFh4f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7k-0003OD-GA; Fri, 02 Jun 2023 22:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6d-0000cE-MI
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:05 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0004s9-3p
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-256712e2be3so2366743a91.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759688; x=1688351688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jW/LkFvDYs7wuWSeKP7O4G0IgkgaVuXTO9qaWXdUTaM=;
 b=hnPFh4f+AWxBJf5sbiE7g8pqu1YrrALaXeTJJCgO4St7e6bMBIWNOHxZUk97tx2Qj9
 /dwDaOxRJdEKwwVA8MUBdz0TNFlFMP4b9wsZJpraNGTqO44pczDLLXawC3LlGP73+Hst
 mcJipySYYmPK9m2GQ/OUMeGJKtrmuMJIewlUg5YrSCS1s+HninI5yMAyjW+3WldrwIaZ
 iH+Ww38QCpGOGlxwnVVeQnwzuLSLXMamJyuSGkYjOhZuNYsFtNhXOEsoAqdsNMy89CDb
 HXDyDgDVglMZlJatc+hC1LgVaJaOtbf6xwix+7ARTsyrYX+ZXyU1MCapzXBy6GWiAJpW
 t/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759688; x=1688351688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jW/LkFvDYs7wuWSeKP7O4G0IgkgaVuXTO9qaWXdUTaM=;
 b=XVprUI6wRTLglIvZMXY1Pv9gMYt1L9/WPPKbZoIzCNocgjlUqyT1cNIO3cb4TzdqEH
 Y4L3IEfHjSsLhyj4DBFG5X50TzITuaUZN5ts5k86R2pSNOC2TtXoqEpFCdjK+oY6iTer
 XtGWJnbxR9ikaE37uzfWoOS3KsvBrbytHHFDut/LzuxM9+XZk1+89pTJ/2trhhnbgkp8
 seYYG6S0g+AqbSP54maYa3fKKz/n+sNB2f96m0cFTTyNsMWNr2dSdsNgQHDNMu4MU/VT
 pce4qiLnCXe7aPtHZ/Frl8WGk/7QzQFE1HZqqO6RRp6gF+tC0BGPScDe2pBsICPqQCb7
 Uwkw==
X-Gm-Message-State: AC+VfDxF8JYoxqu9m05Z50QfCdxE3ZZrl5iu5aLLWSQbZQMll4Jc+GqX
 fwsh3Rlfptez39MNa2KwBMyc/w==
X-Received: by 2002:a17:90b:4c51:b0:258:6e0d:26e3 with SMTP id
 np17-20020a17090b4c5100b002586e0d26e3mr1337673pjb.48.1685759688708; 
 Fri, 02 Jun 2023 19:34:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 23/35] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:14 -0700
Message-Id: <20230603023426.1064431-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: RLuodID4hcAs

This implements the VCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 444beb1779..c7f8b39e9a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

