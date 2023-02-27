Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4295961ejc;
        Sun, 26 Feb 2023 21:41:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9tHRspoGkP1uDgWOQB9+md40/ZHU/FDA0V1LnhLqaozEjp0/q5An5InIcfVo/S9J2Uklha
X-Received: by 2002:ac8:5805:0:b0:3b9:2b0:5e7f with SMTP id g5-20020ac85805000000b003b902b05e7fmr30202798qtg.32.1677476461729;
        Sun, 26 Feb 2023 21:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476461; cv=none;
        d=google.com; s=arc-20160816;
        b=ZG9I76bD5gXSqzuYjwRQkVL2ZtGhC1ndTN/bw9g6eTkCVo58wsF0efVR3BqZaWriGv
         f+t1uzIu6USgQcf3RPVeFsgaEl/BCNbfK/hNSAJBQNpZ3D5PPdK5kfl6naTaZKGbwcse
         TbUpnzt64sgZ9gaC/MNNTw8HChNJUnXI7lLcq3efpkZU1UT16y+hTL2FrXSXSvPk8bKT
         P88tUPd1p9f49SUNi0CqDLND6DEMVxZ7k26vB7PpdVu+4To11hkqwYGBnIxqxE5VFwyB
         tLmreXwnCkKnxcHOXZF9xTnMdg3Gz9fn/jRREWBIc6ghw/Kpy/B/XdL1G8igRXpWCT0q
         7RQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
        b=zB8hcrZdagESwrKuoylovUpdadPBJtw/u0eeEuQUTF5UbrlhaZrV9FiXxw3OGjq3fm
         0DIqP3DaD7si0YBVi2FBskwRScWEgfckTMdxPptVTYt8Uo485BGTBdTqIh0iwHObm3Lj
         otD8QzeMN2ApSV9BanGaHo2jhdiQ6LBaigu9ClM4/KMoCiQvntpQO9+J1D61SCelXfCz
         1benGqUhEh/L5kPeerv/8HIyNT4eigrbG5ccBIVyGTJYLMxDlXx4HdmghK6KD4s13PIf
         /9z+2OmsQtziylSfkw7sbUrxc92oH09wd+LZX9APbhfw87jyaue3x9kN3W8nxNqfe5Rz
         kz9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxkyGAqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05620a024d00b006c81aa7656bsi5350096qkn.128.2023.02.26.21.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxkyGAqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWEU-0000wJ-Gl; Mon, 27 Feb 2023 00:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDV-0003yo-5z
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:29 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDR-0002xk-DQ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:28 -0500
Received: by mail-pg1-x532.google.com with SMTP id z10so2835958pgr.8
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=uxkyGAqaf12UHiHxe3ytgXuVwauNSoeV73dDe/22eNUs07Acfbr404tGEIUEUQjGUn
 t/qGcJKeCZhu5S45SKD/pZ6M4GNAS/tnxaqq963ch68wJSv3t6R0dukh72teYLYxjg+Q
 FqFchbIX0LpcYy0S7SNiPt71AULxsN3mLdtSx/DqAygVsZoIQR5JJlXRJOM12aBe35hv
 Au0uiwaxc4RQnp8e+d1EoUfJzFuO6eUQUNKni7LyeM2psYWZG6by/r3PkPw4DBsQ7pgv
 Sr9hYIiBriB8iW218B5IUlHVfrxKJ3sjQwvlcebm/+9RKBh5CbxoQGhANOJ9FAhkWlFN
 JnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=AJcszUqeTZg/04MXlbsDwl3/c42mMMeX0SHQuFUyoD5hMZ8PQi2KiNjQ/TwZgVyXdT
 kPa3JZxHsRj+rCL4bOPVJIlW3X7xXc0KA1LTkgDmA70xtnP6jHwiELT2H7Ur8hyVOKIa
 a2qB8Sf+nujsbwxRZpRuurFuolkz3/v1cXt0fBaZQ7LQR23/ua2e1g5Rp6bg7E5fEugO
 ZplgV4lRNyJjcpUrvJHLWtMKZ6tkfSI55Ddw6QzL5jt6Qvf7PH9xoXHvdk4KVuiPqa3v
 HUURe3EP6cu69/uFfXndNiuEgHKzArAchPm9dkC4NK7SbHiX5a7PWSwloKt2Hcn3VbpT
 qnoQ==
X-Gm-Message-State: AO0yUKVUMwACyppPcgMS0H0AumkmXMHjDEerisaEVpYOarAxdj7VhKrH
 kuhTQBZGJ2Q09V9anFukCh2oMw==
X-Received: by 2002:aa7:9e1b:0:b0:5a8:8535:18b with SMTP id
 y27-20020aa79e1b000000b005a88535018bmr20937619pfq.11.1677476304392; 
 Sun, 26 Feb 2023 21:38:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 29/31] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Sun, 26 Feb 2023 19:36:59 -1000
Message-Id: <20230227053701.368744-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-TUID: R5t3MbV4/0mL

Since tcg_temp_new_i32 is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 4d8b1f9ae5..733a2fb228 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -17,13 +17,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1

