Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp548701ejq;
        Thu, 9 Nov 2023 07:19:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFThxihM8RRkP8ZAOHTwBH3c/SGcMNf9GjVrdB++XMAwsDEywvAIKzBcZt6WcL95I3TsBEI
X-Received: by 2002:a67:c182:0:b0:45d:92e7:76d9 with SMTP id h2-20020a67c182000000b0045d92e776d9mr5050463vsj.21.1699543185796;
        Thu, 09 Nov 2023 07:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699543185; cv=none;
        d=google.com; s=arc-20160816;
        b=d9a0ZNvroAbdYlI67xIVIJldkf++LH9vQEhF2KASgVfjY5TrlyhCjUBVhwgRGtzW61
         CRahCwFzAO2p+8ViRwzhGo15pKXfOZULJCCg/eRRBHB2NWIzD3+ycSSZcHNFSzuLVFtZ
         K+m9lSd6HtrLJXm7xYKrfvH2VlWAXVb4l1lXA5gBJ4Gh6it2PQtzSw84ZlyK0z+wE85G
         QSsPkohwnvE8sirnGrYg5a8hHH4IA/veTZDcXiKG8cTTgm/fQZ+MYzpk19dlD3nZGCuj
         ww5f/NV0DvURAklYGg3Es+XrCz8yCJh+JNNGxgrdmBs2gBMJaPyTMpgazWPvE4Kl62rc
         pISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LDbBoisi0P3yvHqkaXk81VfJ8YBxJI8aP3fBZsVq+Oc=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=fG9lTQXCj7YoDpp5iWaCuzKdzfOo3rxfn/x7n8OhrC70/O8gF2mitpqtXW3Dwx/SIw
         +g5VwG3DPB0E2bFrlwpV/AqS86Zw01N9SFpgyacqj/g7YSY3Qi0DEP4W4Q2lcx0DGvsB
         ARWChWSzPtEw1EhHPaGEiSnLyHCYGKFQTStOl1II5/7o74T9DAg2tuAOcNSFQgYHej4/
         XSvdNAlBtDRSDEjFr+lX5gc4dY5/yL7IJOWmSdhCIatOeeaJNWQNn5MGXVU8XVOl+EHO
         DmfQdLeyLPITvfiJLIhB7lkcvrA8Q706GYSwX0oGqMeaWC3dbjX6yVZf792eFPyZZU+V
         eo7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMr7fqrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4-20020ad452c4000000b0064f4589991esi2899895qvs.320.2023.11.09.07.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 07:19:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMr7fqrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r16og-0004Y2-12; Thu, 09 Nov 2023 10:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r16oW-0004Uq-GZ
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 10:19:25 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r16oU-0000jI-4P
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 10:19:23 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so1244035e87.1
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699543159; x=1700147959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LDbBoisi0P3yvHqkaXk81VfJ8YBxJI8aP3fBZsVq+Oc=;
 b=XMr7fqrBqN5C67tptiFDr0l71IHtuH97fM4rt0RDjZibx87trCeujXiUkqy9DgLKSY
 wXlD+BS9jqImFED0DPGisXhtOqT7kJ0yQ5IdaWgDKfiCZGFvoWfDMBW28dGqe8s/eozP
 U4DHpuWyrVKiYG9XzqWT03a5YN3D9kmOa2VNkv9bz3XCOR1sju/uIX0SBzAMPxDwcEfq
 TdUOMefWb2XkXM0TJ/3A3dKSWlUQu4jiqt+iRzE3ZZ3Zt4GRnqi5phGRkWzMqJf3Zrz/
 U17mhORm3f1StoiHP1B4xmH/5/mMfEZAY97P5at8y79iIN6ew0iEW2h0EYU8riByl13Z
 4DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699543159; x=1700147959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDbBoisi0P3yvHqkaXk81VfJ8YBxJI8aP3fBZsVq+Oc=;
 b=jW5DMzIXl5R+BqhI/bgRrQpOlsJpFLtetipit1J2pF8iCB4Csm7TMiM0F/G/2KP3ya
 QTyPT0awKC5XxkkEouVLCIuWt27XeH10OZR+2upJChXLwdaEkr6rEh+u+qUXMS8oyf7T
 iVk5RFCf2AtNfs8b2aLa2s+leFYP0ySMkLQRNOM82uy0oNtkBLoACyAl1YfObfJ0JcVC
 +W55PBLFcT4pY03Z+1cuQtwLnnfUeSt011Z4n0CobEZESfrpzBc0SajVkRPefOSRNbF8
 1yeptKTLA7znAq4QkXkIa4WA5vA2YampYFLct2XGJ+o95jUeyJKsvK/weEBMdVnm8lXU
 jU0g==
X-Gm-Message-State: AOJu0YxiEejwzc/423m18ya2or9o1qexbtIYMo0/yaSXiu3sjLbSkOBk
 sX6URgli1dZdLIhvIDijBljUs/2L0Q/WyFHU+o4=
X-Received: by 2002:a05:6512:25b:b0:500:b7ed:105a with SMTP id
 b27-20020a056512025b00b00500b7ed105amr1731050lfo.29.1699543158695; 
 Thu, 09 Nov 2023 07:19:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d58f2000000b0032f983f7306sm7575083wrd.78.2023.11.09.07.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 07:19:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: HVC at EL3 should go to EL3, not EL2
Date: Thu,  9 Nov 2023 15:19:17 +0000
Message-Id: <20231109151917.1925107-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0S5cZd7AjJcn

AArch64 permits code at EL3 to use the HVC instruction; however the
exception we take should go to EL3, not down to EL2 (see the pseudocode
AArch64.CallHypervisor()). Fix the target EL.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 41484d8ae54..a2e49c39f9f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2351,6 +2351,8 @@ static bool trans_SVC(DisasContext *s, arg_i *a)
 
 static bool trans_HVC(DisasContext *s, arg_i *a)
 {
+    int target_el = s->current_el == 3 ? 3 : 2;
+
     if (s->current_el == 0) {
         unallocated_encoding(s);
         return true;
@@ -2363,7 +2365,7 @@ static bool trans_HVC(DisasContext *s, arg_i *a)
     gen_helper_pre_hvc(tcg_env);
     /* Architecture requires ss advance before we do the actual work */
     gen_ss_advance(s);
-    gen_exception_insn_el(s, 4, EXCP_HVC, syn_aa64_hvc(a->imm), 2);
+    gen_exception_insn_el(s, 4, EXCP_HVC, syn_aa64_hvc(a->imm), target_el);
     return true;
 }
 
-- 
2.34.1

