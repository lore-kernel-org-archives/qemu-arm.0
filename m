Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3757618lfh;
        Mon, 23 May 2022 13:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw/akWSHmmeWmYuoqSZBgCtJvwcvWDPEEP8vfPxwe7FQeXw6MbPY5lu8xwN06eWIsEjKOx
X-Received: by 2002:ac8:7f08:0:b0:2f9:2158:ad9a with SMTP id f8-20020ac87f08000000b002f92158ad9amr11322788qtk.364.1653339489877;
        Mon, 23 May 2022 13:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339489; cv=none;
        d=google.com; s=arc-20160816;
        b=O8R0BoJoKNFRdrE8gemdvBJ22a/s9kGmrSXBcwkRmIeI1lcPFG+JuDxRBbvJHBgvX0
         ihCaih38v+yrInHZTHmM91UtuJsWqLQvSecj/iy9K1OanlkIk0YDXhUHY5u4ZdMktsts
         6iYcdnaixYzSYBCiZNNeSYAb1u8Cd6bI5z1IbGg3n32ldzhy0GDllz/2GrtMrcX0UO+h
         K20ZrHzvcsfK0joYQ8PnIg8CqnE1+hWDmU9dXdZBVBme8xKByEA6EqJELTLcC5BxOyTU
         9bGxx0/f5rrsMjTzRNBMmJOPNNuxisB4VX5pVEqWaUhEvGCxdzcyGZzhdpfIcZoSU+Sj
         8usQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jD6P95boxWaFHWGjo6mmW0PDhuVHQHt7cpvcaNfyIzM=;
        b=pYvtIwHyXeCQhoWiz0oEUupxj8r7DsZNhUOl23cfdfniVelUZiA5Or6aocyxmpykRW
         p5yYi0hcrK6LXAPEuyTBqMbndSU9SMuhVemmI7bX8kV/Zzd+CMFDI7QpvuGeIJZnK9yJ
         rzMTFjXrQ2MFrn6dwGRYbl5KjrVGkt7NH5fxE5Fcc/g7T0YRKn34n+LHm7BwJOhdbIlr
         /Z+ajb3aRTOg0oaWI7og0KisAhx/YJqaucATytSAtwI+ZcYjCKl4damcoP1rPjx8BW63
         LF38HrUYmo3wyzRd964kzibqi6h1+O1TOKul9B4XKh7bolJQcTD6fBD8AW0OgD4+fj1s
         f0Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGLnsTiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05622a01cc00b002ed9de7e563si3374680qtw.131.2022.05.23.13.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGLnsTiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF7w-0005BW-Tq
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyH-0000QP-SM
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-00054I-6i
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: by mail-pg1-x52e.google.com with SMTP id j21so14446788pga.13
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jD6P95boxWaFHWGjo6mmW0PDhuVHQHt7cpvcaNfyIzM=;
 b=AGLnsTiuOea8q9OM9vQ8LQN5rvwKktk8ok0EGJyznLa4ht4voMoryoVz3zVTDd7fyE
 +ryzjM9jlZqzWBEzIWRMe1Viba4OTHCMnUnSVUgftIoGsWtg8OsMHAumxEfHu0nfu5Aw
 +zgtToE8a9eF8sfu0qeeZG2Y7Ai9Wtg08BZScM/fm5C8KfilkFdtYkEZbCOmpBsJkS7z
 Ifp1f+u/3UutB3Z7VHMV5pDSPRxMMOrcvJi9H2XYxtzcCMq3i6iZ8+dlarjsVt+31PTg
 W/V2QRdjNKzxifOnoX39Nw0cTKCp8k9WNw7CTk15c4Es+bGt0WArpDDuT9Z818D3ONRs
 iKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jD6P95boxWaFHWGjo6mmW0PDhuVHQHt7cpvcaNfyIzM=;
 b=FCjfwCnCK4Abq0BGi0r5XZ0vniNuKfY29ifdt9YjkKTTz94SfHBDtQdNA7Jc1Y9rOg
 8i/0u4Ui1KfEntGRkMr3ST7/f+HwaOkpfTo/yXAc3SaaC+ruRVstY9UalvpzPj57W/Rz
 DR4h5Hs9b2AwVnXPeDEu8eU2wAFLlSn3LrVrNqsT0CTHTMX7pit1YWuj4lrjXDHvXSq2
 yIrlrEppcBaIFo2a4kNsn1nsNDW0Z1SUIfe9YPoCcQAdRRPiHItVQrVtbnazytRxWSba
 Vmu0WLQrDw+83fnNSuNjLVDfBhMceDdqBZEut5dJKhDe1mp7a4Ucjw3z13++ECzZcGzj
 IfPQ==
X-Gm-Message-State: AOAM531l/xQRONrr1Szpg8/Wsq7EuDo9xcZ1FWtvHWMYZn2TGjsTkZTe
 Oh0sVntOAR2tkgfK+FC0a46LDA==
X-Received: by 2002:a63:d211:0:b0:3fa:8733:73a with SMTP id
 a17-20020a63d211000000b003fa8733073amr2963634pgg.606.1653338879602; 
 Mon, 23 May 2022 13:47:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/18] target/arm: Create helper_exception_swstep
Date: Mon, 23 May 2022 13:47:39 -0700
Message-Id: <20220523204742.740932-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a3YT34YIUrTC

Move the computation from gen_swstep_exception into a helper.
The assert removed here is present in raise_exception_debug.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h       |  1 +
 target/arm/translate.h    | 12 +++---------
 target/arm/debug_helper.c |  5 +++++
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73d..f3fd53f3f9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
+DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6f0ebdc88e..c03dbfb618 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -340,15 +340,9 @@ static inline void gen_exception(int excp, uint32_t syndrome,
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
-    bool same_el = (s->debug_target_el == s->current_el);
-
-    /*
-     * If singlestep is targeting a lower EL than the current one,
-     * then s->ss_active must be false and we can never get here.
-     */
-    assert(s->debug_target_el >= s->current_el);
-
-    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
+    /* Fill in the same_el field of the syndrome in the helper. */
+    uint32_t syn = syn_swstep(false, isv, ex);
+    gen_helper_exception_swstep(cpu_env, tcg_constant_i32(syn));
 }
 
 /*
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 181ba7b042..8d87b65a8d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -467,6 +467,11 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
     raise_exception_debug(env, EXCP_BKPT, syndrome);
 }
 
+void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
+{
+    raise_exception_debug(env, EXCP_UDEF, syndrome);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-- 
2.34.1

