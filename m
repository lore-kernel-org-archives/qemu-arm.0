Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1494973lfb;
        Mon, 19 Apr 2021 13:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaDufmzg5JRQ8bdQeEb/U198KCKqlX/oV2w9X4vogXHRMlrtfJ31L5yfr3tOjcaoBZp9h2
X-Received: by 2002:a6b:7d4c:: with SMTP id d12mr13654904ioq.29.1618864788277;
        Mon, 19 Apr 2021 13:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864788; cv=none;
        d=google.com; s=arc-20160816;
        b=DynRSprgRw0Ri0xn6efmJrltryS1Vr1zD8y+5M3pq6ZH3bR/RtZRDXY+iLHRbie6xv
         7dh7lEwU0fuNHwr0jt2P0Qip7efTfQx1GVBPz7UqlW4gnDta+gKzT03bKBiW5OD1DTO8
         FqRqF7YnN1v700m0s4jJRS+eakSrT96FfkLL5PM/VR5z7tT4Bt3bFhQyMqhbB+JxwyoA
         cBuSBKVKlla7vdtBclkD4oyQzEcpph7+XcRBy9aNOC0HsSh2QkxKT+mYZg8dyTxIy0zm
         OtVPGLRHff5S1oO1DlYlfLK4/MhnS3K2FMUmprzMkgyOGkoY8OzY+Qu9zj1SYmtZJyae
         VTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sbzgUSpJ4Len8Cs7k/6eQfLYFJFY7f59LIhjThiphCw=;
        b=S2LUt5qCag9wEQhN/FxAMf8H9YiYJDBUceuoXGG0gKo6XjWsLzJIKir2Jz/XXaCYN3
         nikLGm0VM0TXowaGU4i6Emt12k7LtAHshHFgpfVGwU+96Cp/3/QCK46P7b7V++06JrM1
         NxNZpnARvkKjwoR/5KW0aKommjO7mFM2zMM4ReNJA3pdMPM1FO7Br8gJiDauHCsVr7PL
         ZAaC3tPrgfpPOjjXGa2nVTKczCXnko1zu6rl35/TxCgQe8NSiztLK6PQvMtxhEsgeN3c
         U5QLpGkPCx+U7EfSQ3uSmLwopCL/+p8CapJ0Lppkhg+eWtOBXScZy9t7cb8Yd8gocSDS
         ChDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0+nFpSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si16733818jam.42.2021.04.19.13.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0+nFpSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYagN-0007m3-K1
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQe-0007WO-RV
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:32 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQc-0002cb-GX
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:32 -0400
Received: by mail-qk1-x736.google.com with SMTP id d19so1477321qkk.12
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbzgUSpJ4Len8Cs7k/6eQfLYFJFY7f59LIhjThiphCw=;
 b=M0+nFpSXXGtBPz2YIxSwkJlkfycKhhUzu37P79QedqfW3tBcQGpNWlznft24zF6bXH
 W0ud3YGskYAKSoBgXhQg4szZ3rZ1Lvo6o54OY2LQ7PUfeQupDtKgM2xzgeM/1Qkgd1Kb
 +YOpIl2CpcrnW7QqXfAIm/nXXOvkFROa4uvx7M6lJX0Yy+NnsoLEvfem31+GwvOg3914
 CtAGqtonewb9OG4Ge4AwrljGd6W0HPhcPX4jI7XgvV4iLYpjX37MYg7KhsfPQ/AOCx7K
 z3TA2uI05cDBKUMlnxmRtm+IucCOiCVe/7IX37tHw2bK9KRwfMRKuurIT7oiEUgsNBsv
 lA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbzgUSpJ4Len8Cs7k/6eQfLYFJFY7f59LIhjThiphCw=;
 b=JEjcXs6WjOKGFU3S9uPN3ppHfWJa6V/qvnE64QgApE9iaknswXff8biVxxZzg8fFuE
 Ox1oG8Ajs5THZVCMUjuLwnbDU+4UAR4d5FeXK1Ik4pgRtvo3R3SKiQuiQoi5hn9G6le/
 lFL+nIQS0HhF5z1zq0TT0v7HJ5OE51Hq1kbMQR9hrXWtZ2Y+emGU9xPIGFKg+3Z+ep95
 oRdh9jEd8QdAXJLR7i2m3yHctT1X4suBDIMZl3XdB9Q3JQYHgxHAnxw5oSvY/vpyFRYs
 XGWUIuZw0CYqZ4dMAoMKaQrtaFmzJgPPOPO9cyPHpZ/zAeMM7boCiMT35KkxOq1hG0Js
 W6/w==
X-Gm-Message-State: AOAM530LB67EUJDzwC57gJJlrSuj9CWGmBemedGh5ReURalADiLAzYiY
 UjBjFdBmU8U5z14lmZXjFlX9bw==
X-Received: by 2002:a05:620a:847:: with SMTP id
 u7mr14053002qku.11.1618863809458; 
 Mon, 19 Apr 2021 13:23:29 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/31] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Mon, 19 Apr 2021 13:22:42 -0700
Message-Id: <20210419202257.161730-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBipDuHj/xmY

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1b0951c45b..29fbbb84b2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6920,7 +6920,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7076,7 +7076,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
-- 
2.25.1

