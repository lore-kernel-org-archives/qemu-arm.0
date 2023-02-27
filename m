Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4399993ejc;
        Mon, 27 Feb 2023 00:17:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/2L+dKY7QdPC54wHXfdzoHNP8/L7UzTAlvvh50rocM96ND4dd9AoM6TXO0zTPQhWUvxNyb
X-Received: by 2002:ac8:7fc1:0:b0:3bf:c994:c9b3 with SMTP id b1-20020ac87fc1000000b003bfc994c9b3mr12268659qtk.61.1677485824194;
        Mon, 27 Feb 2023 00:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485824; cv=none;
        d=google.com; s=arc-20160816;
        b=AAE/p6mFr8F3j1D9LiPAkvj0LeDqLSmZFvM0siVV7nwY7lSb5nhENqBO94RPGxf/hm
         /5BIK0lKpfWhhsJ+MRlHmnrgVHz2X36mjUTt/5CzKKuPc8cvrN9yQsASgWUkV2RCIYdT
         8efCySDCyQ80hlKEEmr7qQTD2Y5Zt0v53yEYhs4CMo19CsoG08Rzok8ew/hvISLiEg2T
         NUOd9y37d9Vh0ujR9ykn2uGhr6vqlYCKq30MR1JlTR/FKDyAXuaiVxlyehr/BW8Io/c8
         vYkHBwneYVAGAzeVnNHD7p1SGbAtCTwSGpvo9BZS2yXzxLr+MOaUGWeKSLFR2CFOJDiu
         4jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
        b=o5ePdXf+ZEthqdx3bebe66sWZihyRToDCmonDsCjDbs9+YJklTU/onwPIHC3YdiYuE
         OW1v221c9rZUSfCkHLACnHtEkT1mT39QVZc1SVDut1dg48SC0qmnIq0T5JX2sFUUgbIK
         CcNwfN6tlfADWHgrPO88Gz7357nadJaY11WlVyrwLx1BDei5hN6bwrmCOai0/pnaIK6a
         ryhyg6Yc8WvSQXhkK9WC1gRmnQOYcCMGuEIvo4/VBG4IxXuBwtotevr1RF3DN34i+SWq
         ZP5fwz06L2OekahvDrvTy1PJa/EKyCq0T+cG/fPAYArdoiSLweuIIxvXb5UNt2qpqnyd
         JtXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDTS2qEI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05622a14cb00b003ba24c325a9si6008405qtx.256.2023.02.27.00.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDTS2qEI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWCN-0001jS-Ih; Mon, 27 Feb 2023 00:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCL-0001dv-Df
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:17 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCJ-0002Sy-MQ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:17 -0500
Received: by mail-pg1-x535.google.com with SMTP id z10so2834862pgr.8
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=fDTS2qEINKy3aUYhbGyyb3cTTRA+LaP8OUjR077xcgm70NnBJE0ZlG2JFoFOJqSfAA
 YyzCCpbE3OqEZRYaRY+PR1OoT154nRv6eCQRHszDgt3Bmi/9IeLNduJu9GHmQshoqKmx
 4UyiH/cE6bBgKvBJnmEzLJI//On2QxWK33UmzXj6Z4fh4gE2gdri2i0pz9y6iGjC4l7U
 F6Ri+c3qNFTro83TaxjwL7eoANxFdbYeXnNyBWVqSUt0IXEau63rYI/dEDafSOCDS6wR
 N0tq9zJbGQmPMlyasqtgXCzP5NrsPqohRxZhpS1jkKg18CSoLUK7wNR7hqg+mgbtT3ue
 FNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=SG4Nq5kQ5VcMXJAxErq3pDiTuOWIRdZNBKBN2rxs38wMxPLDr2pDLsJVxRwRhFtEtF
 tAoHW1Ykk7vDvqa144CVXgg1rKI8YJKB/RVHXR+SJlfLnPu2nFBr/d+7kY/4FIWQgKGu
 CF8s8Ps4EzsdH1stHidmMhZEzIKoaUL2PQjtQUxfkhuupXjyvSOFZK85VfGl2LeQGZBa
 aPH/kbjUszHue2TRvhjRE3butUBDpgD025nTnn0hLRhIX31INHFZCQqZn3hUPjeFpz0f
 PRX6m4ZRAbqE1xecXciFzZa+ke16YxR4davNONs1tfG6BA1QI+DghYGwiiCR/xIfub2P
 0kxw==
X-Gm-Message-State: AO0yUKX5JrPKYGS8u7iTaq4ceHoBj1AD54/kwnLfUG/2x+s+8GyoklI/
 dfdj4S4wkBGCUZgV7OjeIORw9Q==
X-Received: by 2002:a62:62c6:0:b0:5a8:47e5:bbb2 with SMTP id
 w189-20020a6262c6000000b005a847e5bbb2mr20581675pfb.0.1677476234281; 
 Sun, 26 Feb 2023 21:37:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 03/31] accel/tcg: Use more accurate max_insns for
 tb_overflow
Date: Sun, 26 Feb 2023 19:36:33 -1000
Message-Id: <20230227053701.368744-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tOT+KBb7b29h

Write back the number of insns that we attempt to translate,
so that if we longjmp out we have a more accurate limit for
the next attempt.  This results in fewer restarts when some
limit is consumed by few instructions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fac1e8c465..62e8f28025 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -78,7 +78,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
-        db->num_insns++;
+        *max_insns = ++db->num_insns;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-- 
2.34.1

