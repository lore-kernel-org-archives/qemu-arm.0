Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4396828ejc;
        Mon, 27 Feb 2023 00:11:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9F5KK4KQoqpp8GUcv1thNPHjjNx9AnDMjGkY1Yp7zC0gNOdhAQN2N5wWXfgEcEQqWUj1dk
X-Received: by 2002:a05:6214:2426:b0:571:428:73de with SMTP id gy6-20020a056214242600b00571042873demr47657345qvb.8.1677485499989;
        Mon, 27 Feb 2023 00:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485499; cv=none;
        d=google.com; s=arc-20160816;
        b=T6LSAAIGEZwyfEXXP0L9QM65CKqKOe1buK9hcrAFFXUJ4nImOvY/1SMz8dHtGhw13x
         vt6D2VVdeMsWFS6FBNLEdRz9usg7qGSJW37M6JoDo/WPwtC8qmyhbCySijNHTsBuRGOU
         E/IO6uk9DyhT9jO+UHMMAvkSJLVcZju00nm//1qNNebBueV0hiKChL7nI4PV2dwVQ8Xx
         Gm5gmcwXMGCGGoXLZwj+BuzwT0ihY1upKRAlaxmeMMKmdI5JcIwNorN+QspNvMpLsiFe
         ElK+KtVhwfq7kCAsvbaAn/x2b/jMY1uJMhYyZKkVzlZDww3bSZd4E0BehvfaiCZ8PCYv
         CQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
        b=iWVA+OLQM3t75pK9p/NGCJE+muFxhaS5bwEG7MSX8Vz8qebHIqtV/JqIiDS7DTsUH2
         zKhtpDlmk6anC8nwmyYS/f+qlY8v2GtJGnP+PEbDN4u4d7xbvArJcGk40vF45oDIyzDc
         X0qXKNRh1d6SL9IHLzgQJ01dDCkH9SczJ8IpRXSGDmpZv/l7eONQxuxrU3YadHW7S5R9
         GyPIWYhFsKdiFWLnssrnnFVjUIGVOXf9teWalggTW/rxe4oqCoL/5QIOjYBWOxrJCbcA
         8X3Fr/WFTlXb6YLIaxZYNKkfQOZ31JJoTa21JT2bd06MxNuXyvWZpZQjyCX476cNj/qE
         +y6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE51e6SG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020a0cd985000000b0056eb2632e79si5756034qvj.547.2023.02.27.00.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:11:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE51e6SG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWOY-0001lr-Ra; Mon, 27 Feb 2023 00:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNJ-0004KD-PY
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:40 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNF-0007bO-Sn
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id c23so4886437pjo.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=uE51e6SGXuXMjJMflHsSd5YBOdMR66VosqpLIe1cDZA2aXi3VGa4s8rUsKYyaAQUrl
 +fWCrOP3fVdtEFUfHs3nnwVnVXA3QWJxhlFIe+HCReQHlbNxgEQQUsVl5eG4/0Fyrde0
 bboOilhvKgdmlm/K/SPgkDiOtNlrGzKCGJHKThjtGGMhNHr809MHkqH4rEqFF8yQzkAR
 XwAOMu+bWgGFWBof58EmDypCgKQj4NLJ5Z2WFuNpwy2J9vPDx7ADobSR7Mpewc2YFP05
 Zn9xvTTP6013FenPZz78uBpG/SsmlUvMyoS3P3QzjS1joEk6Eckc4/t+lHcWpmhHAF2A
 iz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=Wmn9mNi3EED1Pv9vN1YETm1YKH8+efXColHB0uoAF6lxj4HfeFw08YHdzAbGbZx+Nb
 I7GcO/x4DiHHrj/VE4hPkHF/Guy0y24nYb6K/LsNwRR6yMCNgDi3cwC/DHsjliw/sY2z
 MSaqIO+WtSyyZkIWMY9WvRntUz5ZsRtP2ryOrazfmb86qenYhjB39LO8jctlHDfSvi4p
 /TjaeBAoRf+p39E31qxsby8Jm5djHQBTb+KlPRZkcE9dqm7oIVIvwNJla7l6ZeMVkSAw
 FGqwlsgi750tdMIfIma1D0XT0Hq2b0GGE/ngQngj8DMDxjtZE4i9tOAUS35twDT8MvZP
 25SQ==
X-Gm-Message-State: AO0yUKWf5yuTTKbIeq6bYZ4c5xmwPcsgKvHnCSyiFf4wtQ3wjxnurD/F
 c0EdI0vlHCDe6+ZSuiSWT+UYNA==
X-Received: by 2002:a17:902:e80d:b0:19a:b4a9:9df7 with SMTP id
 u13-20020a170902e80d00b0019ab4a99df7mr29397733plg.53.1677476911916; 
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 63/70] target/xtensa: Tidy translate_clamps
Date: Sun, 26 Feb 2023 19:42:26 -1000
Message-Id: <20230227054233.390271-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: yJbpY8b8G98O

All writes to arg[0].out; use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index e3fcd50691..d727f9ffd8 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1514,11 +1514,11 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2].imm);
-    TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2].imm) - 1);
+    TCGv_i32 tmp1 = tcg_constant_i32(-1u << arg[2].imm);
+    TCGv_i32 tmp2 = tcg_constant_i32((1 << arg[2].imm) - 1);
 
-    tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
-    tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
+    tcg_gen_smax_i32(arg[0].out, tmp1, arg[1].in);
+    tcg_gen_smin_i32(arg[0].out, arg[0].out, tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1

