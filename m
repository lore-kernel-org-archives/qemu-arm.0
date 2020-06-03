Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp35102lfc;
        Tue, 2 Jun 2020 18:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIkggRODnFHHr+Yz5cLzERfoiwolkkyvir3izbbngovvxiIB80WmJ/RlSuwstI6/rsekPQ
X-Received: by 2002:a25:6dc2:: with SMTP id i185mr47699442ybc.370.1591147282774;
        Tue, 02 Jun 2020 18:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147282; cv=none;
        d=google.com; s=arc-20160816;
        b=qpbxWVPkUKXsSPkTokPR+H/scmh3lwMk1OVkthzP3O6ybx/BJpR6Ivpp0J7Eh4YvI5
         q6IBNWZtnXvhKIqEirp2leT8dVlU5tidUTOr8U6qzjbwQFPUAWtbw6wkrCL7liHE32wH
         1OTFGFKpH+Tm4iR11cj8a3SPsMK10LPyQHjqcIB3L0Ta506zKS+F1nEylCITDeSDhdyu
         kEyV9QLndVHd7qQIGO+wcviabe/twC31GhqTGWovT45xDM+mIrJrt94yRKcGzzHKPGmm
         z4gs04hUP33uBiBSsSxPdDMOl19WPvZ6Cbmwu+DP/h0dFQ3w+xBzuOh89xCW8/Ix7huI
         wskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TDw09kqIkbskRr4/kNgVUuxCkd+nzaukf7UqdETf1U0=;
        b=VxZVhD2eHOr0/w9f6TmKNkk/Lk5qBM4mjn2jNCaimj4CLuMHg0PyYrpWtFFykCfl3x
         fcw9g8YTFleMKTRH8OxWwOBzg+v4Yg3q4TaRyiakCGq2bqWvW0mMZA6uOpS33xMqNz17
         UqMO1E7Xis4XbQez24pkyPXF1ZoqLKnUR8bbMt35+cYL6P9vI6+tFCBze6bWL/kwUIMZ
         nqZupaNijrgFBcenEc9enItGQz3nseS/khFYmI5GnHlkIDo0vACrhoIxrzp8UCs9UDwy
         oL6FG0K8c4P2IzkCBerAxLRVKdrC5UtxCVEqGpit/oNS5d92DtET8L5+2nyCZxMQ9e8b
         cNvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yUo6adD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s68si397877ybc.235.2020.06.02.18.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yUo6adD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI5q-0002F9-4t
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyR-0003ti-Ee
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:43 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyJ-0003Yg-Qn
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:41 -0400
Received: by mail-pl1-x641.google.com with SMTP id bh7so189570plb.11
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TDw09kqIkbskRr4/kNgVUuxCkd+nzaukf7UqdETf1U0=;
 b=yUo6adD8xnB39ooYZVKvAMUokWhucdRFGYuFbSDUjdog0eTz3gh6UKycWetGt9Q+fB
 CgLP6dzFgmkT/9YSLPYp1iqba8ULo7ZkZNDC/NBIxXJFKw/Q7cBKQq84btLmQw4qX42p
 vZsQH52cJjxoP8w2wNaLAzr7jD788JtY+nkwld5Hyjv+cLpz/5PDleNX0LBVjDpzfiFZ
 ZRXk5w6qBa2KWaAE5hd6qCTKihBIX73UVJfFBsnW7k//6EAyVDfU0zwjevbgKDqzaNqT
 AyeIhnzyjMp/hNFOVF+dyUou6/sG0RNFNXY5BJ4AweqwQSNPb8+0iqGAU9VM1bk5mZFl
 kbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TDw09kqIkbskRr4/kNgVUuxCkd+nzaukf7UqdETf1U0=;
 b=XVHQyO1vZgpokIzRIg2gxJm547SRppb+xdYXTW0s9xfO++KSMZcY5visr8exPy1cLz
 V73n/nbkIyNPXjeyyJtTNmc7M7qVUA/W2qG+Wan0ggt+z03iSJFmJwczK2NLQEizTnNc
 UgaPCuidWyPFzmNnYfeJP598+B1pSQkdTGcfZdjrk3PSwYaL1vJTVVbYSceigeb9r7Xl
 MuAdE3iZxFt22/xQGjCSwv5Qq8LP7f7Tuq32Begr+fuUJrRcM3e/8M+CV83WoM0fSonl
 tTvY3iel7w7OYEZyVC7dikJf+ZN0tL26es03mzOU6zzXt8oXvbGbMbKiVlK6vTY9TiKg
 e28w==
X-Gm-Message-State: AOAM531YYCb8NahfY+IppHiWDk3Ch2zv+9Dk5j8FLgB9pPJBm+mJZ+wB
 c9naytviu/BQuBkqDGPLb1WWVA==
X-Received: by 2002:a17:902:aa92:: with SMTP id
 d18mr27914389plr.127.1591146814331; 
 Tue, 02 Jun 2020 18:13:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/42] target/arm: Implement the SUBP instruction
Date: Tue,  2 Jun 2020 18:12:47 -0700
Message-Id: <20200603011317.473934-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1X2OgXPeftm7

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix extraction length.
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7d0b7d5b58..0ee2ef403e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5294,19 +5294,39 @@ static void handle_crc32(DisasContext *s,
  */
 static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
 {
-    unsigned int sf, rm, opcode, rn, rd;
+    unsigned int sf, rm, opcode, rn, rd, setflag;
     sf = extract32(insn, 31, 1);
+    setflag = extract32(insn, 29, 1);
     rm = extract32(insn, 16, 5);
     opcode = extract32(insn, 10, 6);
     rn = extract32(insn, 5, 5);
     rd = extract32(insn, 0, 5);
 
-    if (extract32(insn, 29, 1)) {
+    if (setflag && opcode != 0) {
         unallocated_encoding(s);
         return;
     }
 
     switch (opcode) {
+    case 0: /* SUBP(S) */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 tcg_n, tcg_m, tcg_d;
+
+            tcg_n = read_cpu_reg_sp(s, rn, true);
+            tcg_m = read_cpu_reg_sp(s, rm, true);
+            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
+            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
+            tcg_d = cpu_reg(s, rd);
+
+            if (setflag) {
+                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
+            } else {
+                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
+            }
+        }
+        break;
     case 2: /* UDIV */
         handle_div(s, false, sf, rm, rn, rd);
         break;
-- 
2.25.1

