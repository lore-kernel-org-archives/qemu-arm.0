Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4293683lfv;
        Tue, 2 Nov 2021 21:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6Uu6ds/QyleTGmXUXaDraQmFCYunWoivhQCdLwIfCuueH1JFUh3xm9f5E9g0QfxvNWkWg
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr8359643oil.65.1635912288327;
        Tue, 02 Nov 2021 21:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912288; cv=none;
        d=google.com; s=arc-20160816;
        b=bDvqd8V69kJIvgEMFtAuSPJrTjXr7zKxZn5XcCGZ7KeZV/lcNBu6IV1IFJcgHRnF6v
         ZJiKhVFuW6dqLCoCzGGl51cqECl3SA1MAV4o2eXYQu5YhCwP+6uLTEUyyGSc44BDXmg5
         OVNe3RyZimsAT8PkcN/Aq2VDVuEtrKUASXRcD9dTqABWNNOztQHQR3Z26RJKbwJ6usHb
         iMv6HGUivG40WVqSi3QZeM9LGtk0RlRjrAqR3yfRfiku4Ib870MK1VTsIo7ahgr/hUdK
         5UN+o2ydBJ0SFXJWzZNFFAPbCV9RFSDEzBWhsRouw4/mASzivu4tS7LsMgxPf7Uay4YD
         svTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pKojDLUB4PcjfS7SRPDbZQq3hYacmhCQrpop1lkMtjQ=;
        b=B6okEnaRZg1YbM5hBFKefLcTE6K9mBa9blKbrGavwkgZZsloeGJZN5RUFtpOYY6pu1
         hOV3ZDie3NS7q3YG+qLgvO4HflYNqpFozncqrgmiLiup/xBrcH0/lr4Xf1PGINTqFP/o
         UFrmeNOH1+4TCpd6ohB7Wb+9EM2RjkXCT86e4JPpjWL5TKCywtr4qjGw0z3fMizEE9Yp
         WeBKuhMGKhEcp8WKuJHS4cay8QSOEdUm+GDDwH7g9Z3t0zom4mugNvagIgV0apsM5tdh
         IwuRcECmOiJJEhC2j0/oUuI+KvLVQ8swKX70VHB/h36u9EYl6HnVoZPBwS9nzxb/6gQQ
         9mww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToJypVBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si1361536oti.95.2021.11.02.21.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToJypVBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7W3-0005BJ-KX
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VH-00056Y-K7
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:59 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VF-0000tz-2Z
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:59 -0400
Received: by mail-qk1-x732.google.com with SMTP id n15so1092622qkp.12
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKojDLUB4PcjfS7SRPDbZQq3hYacmhCQrpop1lkMtjQ=;
 b=ToJypVBwDgdrteKyrxJuynqLXboRww/m45VLq3kBP2w2v8+kW7KFCyM71Xg/H+KW+i
 tCX0WviznXbI1lwupGc9WRFeSWYVjRL/LpsWpzjrojOxK4ush+uGHNVe8mQjWt/c0MHw
 uY9hOB8fkNbpEy9vvbAvF1s7QTRLoQXoH7GZgh0saw3ITSgvYQfV272Am1T21x6qapae
 F2Bgfl/rOVSUHG0IY69MNQkaEwhIddS8EuqHH5/1YIo+wCLFuPbK2Qv9a4aNYN46Q0Q6
 G+wfZES2R767pRKCCaJ8b49pUfX+K8ZqqTy0X8XShqz8Pvaw9X+intoL4Q2r9DA3TjFl
 xIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKojDLUB4PcjfS7SRPDbZQq3hYacmhCQrpop1lkMtjQ=;
 b=iY04onsOGebkwXXVWDgMejuEqmZ2TzVwh0fMt00+9CYco7Lf233b2uQqqfVFk/3XB3
 5ONgjlhwVm9KOuyLR1MT3cdD2py2FDmwUm2++fHeh2hZ/cANO77fHpzEIX/WqDN1McSe
 uQgPBOY74bbqCza3M8uOSLBCArP7Zhu9SqyUeAL+XX0JmwXEq6APc4C1GTMBBRrrADt7
 6hC9uFDCYiAxlYh7ad35JLqcNiEPqeFOtYGFFon0RKyxGrhV4sJUMMCfxmLRY+AqvKiD
 u/YppFPpSwNiaWysp61q+fxyi3vpD3lf68mCjScpR+rBwHEAafeXRIH47hv4mJiWODVK
 XcUg==
X-Gm-Message-State: AOAM532MXysPa302nMvgC71rCyOYqX1ekWWMHoqltBh2Od86iy9hf2WF
 +PD0osbCHJCkXiLCl9bx3rXFkA==
X-Received: by 2002:a05:620a:408:: with SMTP id
 8mr4294199qkp.116.1635912236141; 
 Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/10] target/arm: Hoist pc_next to a local variable in
 thumb_tr_translate_insn
Date: Wed,  3 Nov 2021 00:03:45 -0400
Message-Id: <20211103040352.373688-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/a5v048RWyD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ead77e9006..a39456ea98 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9629,25 +9629,25 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     uint32_t insn;
     bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 2;
+        dc->base.pc_next = pc + 2;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_lduw_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    dc->pc_curr = pc;
+    insn = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
-    dc->base.pc_next += 2;
+    pc += 2;
     if (!is_16bit) {
-        uint32_t insn2 = arm_lduw_code(env, &dc->base, dc->base.pc_next,
-                                       dc->sctlr_b);
-
+        uint32_t insn2 = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
         insn = insn << 16 | insn2;
-        dc->base.pc_next += 2;
+        pc += 2;
     }
+    dc->base.pc_next = pc;
     dc->insn = insn;
 
     if (dc->pstate_il) {
-- 
2.25.1

