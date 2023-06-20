Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp243916ejt;
        Tue, 20 Jun 2023 05:45:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WsLgp2IbdLEpDQVFj+qPo6l3hO815WIRtBDJAh9oKjYuV6BqGYwE1jatisop5/lNTQ1b5
X-Received: by 2002:ac8:5707:0:b0:3f7:f9e2:7187 with SMTP id 7-20020ac85707000000b003f7f9e27187mr14424607qtw.7.1687265123805;
        Tue, 20 Jun 2023 05:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265123; cv=none;
        d=google.com; s=arc-20160816;
        b=UNWJXk+CdNCSfFlfORtKUvxkE7AJYfHvMxY+FbFM2pxHHo6JSKmJzqf7TyAC6Ul+Qw
         iHCplvEL84TYSDO1gxHAUCGo/x72iyF/trPnR+cntUUMERON8LotOv106oB3Ik+w/f8x
         pjX7omS2VfgnAX5HnEBQeezEDwaYyTBdtTQl7klp9crQqGch7EKiPu4dq1MuNN4X1ynU
         WNogUXyTMWsLtr/RQlz8aULYMkKYp07Da82sij5HxORQ2qrowJ8rVQs0uW0w6Hi5cAEX
         r2+gkfTz6X1mu4PipWSBx8neHZrHkDgd3CyC8oYQtNoLnv1eLZm3slhj+wWtNXe+fQAj
         KzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2sdgIiqPnMV4fPsIp02tsJUyVwHllql7Gpq+1+0e7tM=;
        b=qwgHf04MsNeWuod6d5Jo+4UmM1dZFH0iGihj92nOhQAUqghgf1XqilLPf0ereqYUIE
         0K69wC2MF8yz3JaptrYB5l8UM9Nhc1qWOwqDanqqF89iT6GjqTLvUdI+kpIb54Dw6RKT
         z/CYm7SEY6do3xDAjPd89XmlfpC9NyEM9SJP0Ttt9OlJJzAN8lwpgWhg7LCGVV6/hqt9
         Wavs0E6U6hTUDloOQl0WXzUOhUiX28ndmfbAeqYeilkdNqmCIfexVaH1CjNpxvZigXXb
         OEvwC9P3itqIqPq+vTDXtv5vX5jalqaj5FXh18/YNpWFgvtenz2q5IP3OIxdSwwPbZ8I
         NWpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZzcbZpiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020a05622a00c300b003f6a0fc2c78si731454qtw.518.2023.06.20.05.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZzcbZpiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBaiu-0001dI-UJ; Tue, 20 Jun 2023 08:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBair-0001ZR-NA
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaip-00022c-Q5
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51a2c8e5a2cso6438487a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265074; x=1689857074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sdgIiqPnMV4fPsIp02tsJUyVwHllql7Gpq+1+0e7tM=;
 b=ZzcbZpiXKFGkP9X2om/Wznaqohq9BBDio79t4d3/chm+C6LZe8uZdIz/cUHOyOPlaw
 8hJ7E9tyihp5hIGWltmhIfKz25wWMs6058md9V1/I1/nMqyV+YckzbmQlJ1VlC7dY+ND
 PLp6+aiQIYyMOcGbKqPpIXPPSctcHWEwbZwdf8QhLbb2T1tjqFjEcqbGPMPwuRsmjJp1
 4xAq9NJHWH/YYPgdiAuFmVuSzt3WHUZ6mMQgI9BVN2yInH2XSAtLzTrQn1YIL5v8rr5X
 BTmfxzFEEt96wzXWwvVqLbM3ene0EmqtTM4X8hdFMKv566qi8pTzbSlRVGIGg0X4zlB1
 WgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265074; x=1689857074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sdgIiqPnMV4fPsIp02tsJUyVwHllql7Gpq+1+0e7tM=;
 b=Uh9AvkNhlMB13GG62jX0tJd702gmfdkOz++PoUbNwOiypMAVUmmK9plwXrQ1+P9wKr
 83m+RiyMABQu6BYq00XULhWsO/BjHWfcvfiqY61Bm35g9kmjgFpBFXK/XtHg4dcNP5Uf
 07a9izhbeq2Q01nTRHhfHBRHEAqyozdPBVLovOIMCi4Bznj8iNC0SAs9JM+RNoFcy/LR
 zrK2xF11+axnqzULVzxV6q8GbrolRDPuOtMTyTaBRcSfuzcp51ziwrFVIOnzK/Jxyi+9
 0n199jKmZabxqkKoUBE+EPclZN3brdZeu7RIpLzVc0ygqBHkLwvqbHasbeyJ+6ndd/uh
 BgTg==
X-Gm-Message-State: AC+VfDySKnhZKPN05Gj5sPWD8i03IrDzHxR4kH9Z+yhEJSaVnTuaeJsQ
 +nhftlwqoTPhzs3U5Qz0DIFiH9m11OFPFxSXXYf25MJP
X-Received: by 2002:aa7:d88f:0:b0:51a:4039:2d75 with SMTP id
 u15-20020aa7d88f000000b0051a40392d75mr8680669edq.34.1687265074416; 
 Tue, 20 Jun 2023 05:44:34 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/20] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Tue, 20 Jun 2023 14:44:12 +0200
Message-Id: <20230620124418.805717-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: FVIvXxIFVJUE

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 44 +++++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 45271d666b..6d5e4855a3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -264,37 +264,27 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
-                .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
-                .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
-                             : space == ARMSS_Realm ? ARMSS_Realm
-                             : ARMSS_NonSecure),
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
+            .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
+            .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
+                         : space == ARMSS_Realm ? ARMSS_Realm
+                         : ARMSS_NonSecure),
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            ptw->out_secure = s2.f.attrs.secure;
-            ptw->out_space = s2.f.attrs.space;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            ptw->out_secure = s2_mmu_idx == ARMMMUIdx_Phys_S;
-            ptw->out_space = (s2_mmu_idx == ARMMMUIdx_Phys_S ? ARMSS_Secure
-                              : space == ARMSS_Realm ? ARMSS_Realm
-                              : ARMSS_NonSecure);
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
         ptw->out_host = NULL;
         ptw->out_rw = false;
+        ptw->out_secure = s2.f.attrs.secure;
+        ptw->out_space = s2.f.attrs.space;
     } else {
 #ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
-- 
2.34.1

