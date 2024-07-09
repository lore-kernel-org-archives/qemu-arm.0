Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3300403njb;
        Tue, 9 Jul 2024 06:45:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXFCA5f77wV2g6rx6Bm55n4PtC4oRakNCj/gpkclK29/lxJTJKaKRDFtjqCRXEUKzBBsGuRcZ3IVX2U4kP53/9+7mNLlXm
X-Google-Smtp-Source: AGHT+IGbSSCvLYqGvjCSZcsCLXTOcfCKsu4Jd5gBcq1NOvpZJNxH+z+iX1NbsA0BaH0sAoLzchZI
X-Received: by 2002:ac8:7f92:0:b0:447:d640:aabc with SMTP id d75a77b69052e-447faaa4c2fmr23615571cf.63.1720532753946;
        Tue, 09 Jul 2024 06:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720532753; cv=none;
        d=google.com; s=arc-20160816;
        b=ipb3Sxnqdlel8YcO7TX07n7A/hdTyBX7wiGNYdswiC7M4Ap/duqxarI1gA0egER+nr
         Zs+LRDLG2XFzareXKFW+zQyfYIPlYg6xGAF6cHABbFyH/WNBnFaT8V3tQbFocinAP+ON
         pg5nghzjN6Wlj/hTFYKujehd5+wraVfkfinz1piWHczOwPWqZkThKzeIkeegT/bls/QO
         yKomFuG24MXFyQ4S1GvH1giyE6qThk14pcmO/H1Ydngv6//F9RxpDH3bAh8LDuFFvqHh
         5OjNF7sgBBgdRqLwn1Y8/lUoRntm/wIybx5ze9GTNy8GIdST8sFS4+AgW7XUkwFg5rIq
         klWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6Dy9tTmWCONrl3V4OHSFlfMTEYKzq0YJeFJJEkMNS3s=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=TwJZQwGYNAvhLgVbGVga6nk/sdY/yojDs9qMTmVUBeLJsMx0Y7aExBcto+DVRVTbRX
         g9MXMwGcvBncItES/Yd4bHukcofzuJqeEYbU5wd6s+wXwHYPcaYOqTdOUySdrEqrs6x3
         atOMyAykfKQO4O9Bfz9lTwSLVfb0hDqHBaKGmY2egiV8aBwLkUCS5w5yjS5br0VYI0Ch
         GeeJ42jUELAm6a3gfk4k2d+nBg2VXpikkO7C/Zj/39SUM5FtxHm8zg6O7TbGX20DNN3m
         reGh4/K5YmOPSz5g5ouIovzNmYjmR9mcrc+EyL/Gvil16CFQaMdBCVMlyHkswd44cYAq
         bAXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alWsvwfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d7d05si208561085a.649.2024.07.09.06.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 06:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alWsvwfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRB9r-0001jJ-Ku; Tue, 09 Jul 2024 09:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9m-0001ga-U5
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 09:45:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9Z-0002Ib-IH
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 09:45:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42579b60af1so36534685e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532707; x=1721137507; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6Dy9tTmWCONrl3V4OHSFlfMTEYKzq0YJeFJJEkMNS3s=;
 b=alWsvwfhzHnK2URrWjrt8vbIVzzFbZM9aBR8ufViCm4XnoxDUoDTBHR19/R6xIhjHd
 T/P0aaGy9r7Nt+pMGTCsdihfNQuxq0P2Kntu/XLzufb+7wta7J7LCy4ka1HFcAxHhjU6
 oKjTkUaJ8NeaylYWs7uKQbp+w/TIT6ixi7pt9Q7b3R9SpumbgHH2Jid0pH3HYA3B0tKh
 W0rtYY+1PBNL5lLk5wgZJnHX54Jyjm2F2baqBKgi8wd1e6pI4cqECHm34DXmll1W3l6c
 bKxo4ouiZUUVcOsaSTcy7fbH1l1CK3ix6DchyxXrD/sHIM5/YOikCux4+EfVs26kG58W
 eZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532707; x=1721137507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Dy9tTmWCONrl3V4OHSFlfMTEYKzq0YJeFJJEkMNS3s=;
 b=U6NtU7tu7zppM/CYSWNtB+TrLGlfqqZ02JxgXu3KCTAXol59LV39eaWLd0uHzUyb3w
 SQ9WVMOFyuP1dYtiD1fwMaLCuzAE4sC6dclgp9CuW5wqA511TqjFy5WwPVEckH6u/hfb
 yuUleAVQvW7w4rYqBeL8UKJs9DLcFCN+uswhtInVaOlfKcW5RptyxxibuSNNtxzuPqpN
 eDB+uspdY+kG98jlKDqbybA09FzgX34MzJrgd+kDbKTEMEwK8moojevFHIAnLr3RRNo0
 s8zrjqC4vp0VRlP8jpDtF9dKX7cEyFTFoVtVz9RnQFSzzd5wBtkrWfYvmb++iFsfME1n
 Zhsw==
X-Gm-Message-State: AOJu0Yw2paziVTolho5dZpVXwkKdxwg451eNwLOwg3AkR2ttrbuH1sAf
 c9YUe8OMl8w071OHJmz3k3RdY7ce69iCv+Jms6EgQK8R8n0hIvbE6IdYFIJaUwtZWRvixrwRwfY
 a9ps=
X-Received: by 2002:a05:600c:4a98:b0:426:64a2:5362 with SMTP id
 5b1f17b1804b1-426707cf1bdmr19111725e9.8.1720532706866; 
 Tue, 09 Jul 2024 06:45:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f22acsm210426605e9.24.2024.07.09.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:45:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: LDAPR should honour SCTLR_ELx.nAA
Date: Tue,  9 Jul 2024 14:45:04 +0100
Message-Id: <20240709134504.3500007-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709134504.3500007-1-peter.maydell@linaro.org>
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: sq7R7fX/5LZs

In commit c1a1f80518d360b when we added the FEAT_LSE2 relaxations to
the alignment requirements for atomic and ordered loads and stores,
we didn't quite get it right for LDAPR/LDAPRH/LDAPRB with no
immediate offset.  These instructions were handled in the old decoder
as part of disas_ldst_atomic(), but unlike all the other insns that
function decoded (LDADD, LDCLR, etc) these insns are "ordered", not
"atomic", so they should be using check_ordered_align() rather than
check_atomic_align().  Commit c1a1f80518d360b used
check_atomic_align() regardless for everything in
disas_ldst_atomic().  We then carried that incorrect check over in
the decodetree conversion, where LDAPR/LDAPRH/LDAPRB are now handled
by trans_LDAPR().

The effect is that when FEAT_LSE2 is implemented, these instructions
don't honour the SCTLR_ELx.nAA bit and will generate alignment
faults when they should not.

(The LDAPR insns with an immediate offset were in disas_ldst_ldapr_stlr()
and then in trans_LDAPR_i() and trans_STLR_i(), and have always used
the correct check_ordered_align().)

Use check_ordered_align() in trans_LDAPR().

Cc: qemu-stable@nongnu.org
Fixes: c1a1f80518d360b ("target/arm: Relax ordered/atomic alignment checks for LSE2")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6c07aeaf3bd..5ea204d5009 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3543,7 +3543,7 @@ static bool trans_LDAPR(DisasContext *s, arg_LDAPR *a)
     if (a->rn == 31) {
         gen_check_sp_alignment(s);
     }
-    mop = check_atomic_align(s, a->rn, a->sz);
+    mop = check_ordered_align(s, a->rn, 0, false, a->sz);
     clean_addr = gen_mte_check1(s, cpu_reg_sp(s, a->rn), false,
                                 a->rn != 31, mop);
     /*
-- 
2.34.1

