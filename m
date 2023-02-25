Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635541ejc;
        Sat, 25 Feb 2023 01:17:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+2W+Qrw48HTkvnFpuG+V1kJ5/Qw4xfPDxvv7y5G2S0A+6jc7ukvUhGEfYmJwUrPsewZhL0
X-Received: by 2002:ad4:5bc2:0:b0:56e:b347:8dfd with SMTP id t2-20020ad45bc2000000b0056eb3478dfdmr37807013qvt.25.1677316657817;
        Sat, 25 Feb 2023 01:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316657; cv=none;
        d=google.com; s=arc-20160816;
        b=w+AEb3I5pZbRUTbLPqb4x/0OIWSZdYiO3hri98KxI/4o03SjZZhFXBWCCRW/TWhNOI
         q04h+o8Uthdi3/31V6DXJ8l2kysCOp90s1hNJJxhgORiKHQQoce2XM3lYrS91egQjJpB
         NYm3S5vw71odW0C/1DUnEZE7+MpZIfumMp5TNI2BqT2GYQ00F+4spy1ekpDwyTAUY/Y7
         Fbvy0Ct9uNt1mXBQrjzWHHYOZQFOTnd/HM7ps7UJGYfDXyrvys513VomKzZKmO8xoGSB
         xI7AY46FS5b5EsHbH7SQofvh0zQPQicAKjxpyHANTgSoOLpjp1Lpvv6xgzPSBX8HUyqS
         uJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
        b=bTCPnRDwtK92ppk4tHTj2gLg77vHvXPEX4gHnLORyTx/TFPURI/GVRHH2B/BWmbFgN
         HC+ZeKd4Kp51H74iYTZ2a9XauYiD87af04dp4LjwrpTv5sSZE6ykBsnskuMQsX+8F15O
         KlouZfx086vYWjTd/AgfJzFidfDH5A9a+rbSoB2YDGZAIAFgkEvD2aAE6qH3jTWf7bNw
         lgsKg1JaEeaWAOi8yQQ66HFo69bNzTONOLv4oiOdwf8dRRBZhTr92zOMMicRfKvZsCSe
         naXB6elSNmUoUrmB5z56SY8Zr1w/lnriWRw0L1g8LPuvmWGXrz39ycBaUzclFceBxhD3
         NIHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v5g3p7c/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0ce38e000000b00571bfc395c6si1627240qvl.467.2023.02.25.01.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v5g3p7c/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqeo-0006F9-RE; Sat, 25 Feb 2023 04:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeV-0005n4-Lm
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:35 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeT-0001YV-J1
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z2so1846443plf.12
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=v5g3p7c/rbmxrCzpT+mNS7RbBqum2/sHm+2Uk3YfqSQr53aY5MciGcdJ4R/z5KbrUg
 RLjSW+WUtRXfosIrkZzhryAED9nzreJ1qnWkH5aR4M0uwHWsABWbMSy1zmac5JIntYQ+
 cRsa2vhGdxekfeZ4JosYdWxAyTYHvUcIzHEeq2QWvHyc+zzSAjxWNpBPyNhq03J5bTJZ
 9Mr8Yj24NzDfzvUjBJVmF1xiU7qTuPyA5i6pMlYNhJk3YHqYcUOm372tuNkOj7XW7RG1
 vpg684U29+WwQENJmuaKOkgnWwtGrtyMgnXCbJRZfEPC24lN8nm5SxV9rH5cb2v9eOSr
 mfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=xOHYUY/lCwHax7E5hUcBvUw4fxsHXcwHdYrbxjK7ZQH7nHbhOw1HhWy7VJL6UR0kL8
 6kiEtZ/Vq8g84u2m6Z1G+REFuDjlGsAyLqNCbcfKMIlCYzXyB2BRqguyEjNwLNMmkZGG
 k2X8oNYU3kHcLqVqJ420qlPIZck2J/9jP58jenHFkJwTTskyrrUp+yl/5CqPDdQoDK2J
 s+Hqeu3tcVAmrw2ADHbUXobL0xnwjnY+7ujyCiiyaaEFSePHeYNgaILRoX7Qg+p9f3rB
 60IJNBYKn3iTyHJf862no+JqQ67f+aBO544cgKiDVk+V8a7/pvq6po93THqIVtWae0hF
 3IZQ==
X-Gm-Message-State: AO0yUKU5gkMS4fvjibO4oqxFct/4RBgirO50aKQg8CBMIXi9mZeRtO+9
 nJYDrd78zRWWsUXoDNor9Z/FaQ==
X-Received: by 2002:a17:902:ce89:b0:19a:9434:af30 with SMTP id
 f9-20020a170902ce8900b0019a9434af30mr23465319plg.18.1677316532678; 
 Sat, 25 Feb 2023 01:15:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Fri, 24 Feb 2023 23:13:34 -1000
Message-Id: <20230225091427.1817156-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OxmViUQTYlzD

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 5e9d1c0fe8..4f03548365 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -800,12 +800,11 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
 static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
 {
     unsigned int insn_len = 2, rd = dc->dst;
-    TCGv t, addr;
+    TCGv t;
 
     LOG_DIS("move.%d $p%d, [$r%d]\n", dc->size, dc->dst, dc->src);
     cris_lock_irq(dc);
 
-    addr = tcg_temp_new();
     t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, 4, t);
     if (rd == 15) {
@@ -816,7 +815,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(addr);
     tcg_temp_free(t);
     return insn_len;
 }
-- 
2.34.1

