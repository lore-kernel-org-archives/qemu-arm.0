Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984144njb;
        Mon, 9 Sep 2024 09:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7v8TV1MIX5f+2p4JgxlbLvzrUdcBaLfUi42RTzwBOFAX+oQ8gS4Dc1UmV3DcEZS998uGFW7YBAhUIWg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3X843pP38VLy8ilxAu7fipvJ74ZUK0AuHHLVymQKV2/pJ3sJyuK4B14HVqNvxLckhSt5i
X-Received: by 2002:a05:622a:1114:b0:458:2961:bd4c with SMTP id d75a77b69052e-4582961bfa8mr90107921cf.0.1725899029091;
        Mon, 09 Sep 2024 09:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899029; cv=none;
        d=google.com; s=arc-20240605;
        b=GdKCRqbhOumpNO2JkYos+MeMyFLS2v+49osAEnjnE5wiYgNuNxU6ffiT+05/KJiAwt
         J7VCjKAjG4vqCkfaMPmW7f9UhCcUOEAX7DE9HQAC7JonDu2xTgBYYyqdqYYJWzaQpdxR
         ZM6Lxu5/cISNUy/35zf1mbrjP54JSmJF/lFeMZEfdwaxLH2fPZdL7JJNgqyt3E5x3xhI
         5wapA/8vrqw6xL6ROIAElU6o+bmlRZVdVMOfqTLXw/SMMRv5ewG8Y16MjyFhjnmh5xLW
         kOl3EnYI1mZTM7yLHXuXHZ2xEnZiKfgQP5GK9f2EYCimK4YaTdNqghpuxZkchONypfpG
         bczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KLV5QacygPLKfVWBa93d9ZxgoSwEsczlHxuXIXCNBYM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SZWHJBL2QUYZOT9SrNlHQiWmqjQVc4t5Cmynf4I3iEyBDgafnz16kuiRscIXhbazDo
         Aph4Pj5d29YgeU8TiwecglPNQxnl5f0++6vN9l13Sb31ONj+j5AYXDwtNz/EKxwsS282
         BB4U0n0d5UeZiVfJ8ri1BGi1oeuTyXqxdR9CoykEAYRRx/i9hRd7esddEpHZiprSqdl8
         yzIP0r75H2drTtzR6pZd1QDC2EVhS0kW+s8bb19S8J7MiY4p8U+10JPNFjeIAoG8IJsn
         CzL61gkDS5p4vdSeg0fpB8h6ylGQO1bBnZqZaLAzmjNazYWI2WLQU1JPRTTIptpF4ZFE
         H3Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mQyHILvv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e7f645si56644531cf.200.2024.09.09.09.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mQyHILvv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snhAN-00038f-CZ; Mon, 09 Sep 2024 12:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAL-00031a-J7
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAJ-0007lZ-PT
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:01 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2054e22ce3fso39172245ad.2
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2024 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898978; x=1726503778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLV5QacygPLKfVWBa93d9ZxgoSwEsczlHxuXIXCNBYM=;
 b=mQyHILvv3J/GafelTC3bTr8uWFs2w1JixFbOU01nJmWXGa1EVDU+521YOLcNeycdn1
 /SKGqsRjRWA3x61lcpKCoFpOWUxS5OJB/0oyb3NX21GVCdqaWsL63/R228YQbTOHfaBM
 e9NBBoY3/93pAU08ITOSkUEKkHLwC7+EBUjSuqwx3pqDL4TAIAgRkXtSLfJPQO6tyUTO
 w00mzOleoNKJ2BSbRCVd4oNYepWOc5SXhUV9+ch6xwgQdSeuB/HS7LeQAtCVKhUyN4np
 d4u4GF0WeUmVHO9X8aaVDgH3THhbMsvcxBQchjNMta14YR8dTnPWtYzGJCXS/ZmaFLTW
 K8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898978; x=1726503778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLV5QacygPLKfVWBa93d9ZxgoSwEsczlHxuXIXCNBYM=;
 b=DyE13YHeGXi81OEUe9DWH85dolL2ZrLw0fsGfw8KFrcbucze6ySboIwbi3HQMBb3AW
 IuWv9gzBXUzUtcth5lxI+bARLGUFT1GhnxlM5vrWbg6uGAltSfewnnK/Hsw4B2HAX/Lu
 tk4XwmSM2fOxu8FyhfKoogZDyWN6S8g2rAAhCCMd+UGJY5etDuKTZzDrT4AbY86P+oyo
 QXwugs6zmuT0nSbYEC9rfnCj2FBsrX/yWrk+8brpvWja4tDMGugy9tcVgCjqdrvPC0BT
 z6vWNg42gPg/Y7xlxQ6dvUc8bquTjftlCnLGNCBzdOIArnwPc1IS91MbDuQzRcB8MWXS
 Vo4g==
X-Gm-Message-State: AOJu0Yzs6mCSepXjUY5f1d2Trp7ql5H2vTub4xKeW1HCjTMPv7YCp9nw
 bVzRQZc6YKGZ4yhDzESlH7Hs2WUlmzKpZMcL+e0vUu584OSwpXTwT6qH5gkfmXPqCKUZNWi+FrS
 P
X-Received: by 2002:a17:902:c94b:b0:202:330f:1512 with SMTP id
 d9443c01a7336-206f05f6772mr113427935ad.44.1725898978505; 
 Mon, 09 Sep 2024 09:22:58 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 18/29] target/arm: Use {, s}extract in handle_vec_simd_wshli
Date: Mon,  9 Sep 2024 09:22:28 -0700
Message-ID: <20240909162240.647173-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OT6WIKRhA2A2

Combine the right shift with the extension via
the tcg extract operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1225aac665..740620074a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10477,8 +10477,11 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
     read_vec_element(s, tcg_rn, rn, is_q ? 1 : 0, MO_64);
 
     for (i = 0; i < elements; i++) {
-        tcg_gen_shri_i64(tcg_rd, tcg_rn, i * esize);
-        ext_and_shift_reg(tcg_rd, tcg_rd, size | (!is_u << 2), 0);
+        if (is_u) {
+            tcg_gen_extract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        } else {
+            tcg_gen_sextract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        }
         tcg_gen_shli_i64(tcg_rd, tcg_rd, shift);
         write_vec_element(s, tcg_rd, rd, i, size + 1);
     }
-- 
2.43.0

