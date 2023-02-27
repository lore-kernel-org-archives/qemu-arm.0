Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4402542ejc;
        Mon, 27 Feb 2023 00:21:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/asmARFXLGIegIi1Im6fBYXmuLbK3cHa2A3ymnGtKpLkoO7Ktc85tBRP6cQ82a4r5IL/iW
X-Received: by 2002:a05:6214:194a:b0:56e:a88f:70d0 with SMTP id q10-20020a056214194a00b0056ea88f70d0mr50115660qvk.27.1677486083824;
        Mon, 27 Feb 2023 00:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677486083; cv=none;
        d=google.com; s=arc-20160816;
        b=ikpMv/1pdDkl+8AUD/amG7pDkVsVnhDSK/WWP6SYcgffY7b9sNHexmSZn74hIPpHiH
         A1pJf5zs13yXS92bFEEYxaeqjxXtw8qgWLkDR4/VQ4H1nZ4h8/LQRClyDzsbkB09c7pC
         MEp6rO28vpH4vXXxrh2oOGb/WKLQXmB827o3wzm1eUrtDcnCF0O/gvdQTtXC9IaTF7XH
         Gc7FtgT32TeNdCyvSMPNnFVfdOuaxpIKUI1a8ICPNcR15cZ/RZW80fGl3SB3LTI++GCF
         xI70GwzZBj6P4M1sjw7TliFEaCgKVGaKhQTHMlnboph0EJyOfnyge3wagLQTz77PuzDz
         +I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7jpkfH5p2t23I+xxdw6uRxaIWCvz9AwC1FPMX8AE4Sw=;
        b=b+4oa4uefkkXSmYrz8AeyKr4RZp7Lup1rGSINV3t25gR/emk/wVeJnC1RYy2SavPF+
         sVQhLW9+Zqel4FGW0S9CzX8qVufI+Zroa+fUTp+usDMbI/saCMu7gFBtK0L4QwNRkqzh
         d7rZdOVRrCSngRrd0tTbrFqpRr39gNmRWwrGiNaPyj6+fnLU5SbJ6naHSVvT6Vvq5b0S
         2yZKrzS4pKqFuzk9dhJNrV9YhlwDLOaoR67WyhO5q0hnjXnuXo2WGFziM/je5UWthfDc
         9A3o4wj1V8U9OCqAyFo6GF7OSA7qhTlPsDYovK+Ggt2rzNsRkVZAjDlz6g5YbE00YIR5
         r8Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lro8Bsse;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj26-20020a05620a191a00b0071077285bacsi6522133qkb.338.2023.02.27.00.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lro8Bsse;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWMa-0008Rr-8V; Mon, 27 Feb 2023 00:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMQ-0007si-B3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:43 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMK-000720-3O
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:39 -0500
Received: by mail-pl1-x635.google.com with SMTP id y11so1419543plg.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jpkfH5p2t23I+xxdw6uRxaIWCvz9AwC1FPMX8AE4Sw=;
 b=Lro8BsseqHGybYNgGZTW5kKipHMTdLqzlo09sIqP0ssDcJsIbE8jcI5suoLiMdvSbr
 yOnfrtnvistm/rh7rf0Hm/4aVGCdcfrjUXvn5HYHtL9+dv1r1NkEMz6cWfwSK9YFzjee
 4mn/+XfgEJy1Wr0JUDSQHcLBvWJ1RQfsDgq/R3D1bDtKS6AUhgfm0hwlmJpw0v/lN/IB
 YuklpKgOsGfxlUr27BzY1CnEz5R1vBD4PogSBJV82UmGhIy7QtpdAQH/fGLTj3I3E6+U
 VVRMRbYRaL1pweVZAdQtWH3ue5vyBcfUMYG+/eWGyf50H3Gyu0H+9XgAwjphCFekT5z4
 B6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jpkfH5p2t23I+xxdw6uRxaIWCvz9AwC1FPMX8AE4Sw=;
 b=KFhiF+4eSiJxZ7BkEp92qc+ZjP7mcQ1+3o1bZQubqgh54gE0ymr9cAuhvpCRG3cLaP
 To/odC25yO8hhKof6WU7l6D1BE9awOkMSYhrSgIB8h4FUcynmlbIWjT7J9Hcz46Z1mwr
 t6CtbYKMmVQJGzfDuFgErrFonNtXaNc4rsaxnNRtVDbmn533ks2a18lETL7vW0LFgCN2
 JFak3n0mhWJ40ErTHqfpI3JS+jBCrwTiYUJ+63tuYvUHUYgY16tMVd/47tPyx0f9Dgkq
 OD3wx8DNuIdRKwVGapp/QtKmBDPFdXZSPTu+UD50UMpexo18vMgEYsIfVZi1yEFq7l0i
 wgag==
X-Gm-Message-State: AO0yUKXKRoknjf15C+jFaw/tTCntZCPGw500hn7rznhjPtbf/kc+q/Fa
 bPeRbhPmDpDVAj9azXah/uhLdalYgnfydvl/e4I=
X-Received: by 2002:a17:903:41cd:b0:19a:a9d8:e47f with SMTP id
 u13-20020a17090341cd00b0019aa9d8e47fmr30574088ple.36.1677476853562; 
 Sun, 26 Feb 2023 21:47:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 41/70] target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
Date: Sun, 26 Feb 2023 19:42:04 -1000
Message-Id: <20230227054233.390271-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZkXAxv566xLZ

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu-regs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 42f2cd04a1..d900e13cad 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -177,7 +177,7 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 
 void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
@@ -210,7 +210,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
-- 
2.34.1

