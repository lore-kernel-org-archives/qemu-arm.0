Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2146252njk;
        Sun, 1 Dec 2024 07:06:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbVk0nhflYaMZArCKQ9AKs9JqU2uuZeiOR0o6T/Mo2WTLC5yTImRfi/I1DqaYhJy1ohD3NIQtRYY1etg==@linaro.org
X-Google-Smtp-Source: AGHT+IGpHOPq6Ws9M3jfoeKEK3od/SNkDdFBH5vmg1YvshhJLdWK5FTw68ScWJ1Ze3K3OgcMDL5h
X-Received: by 2002:a05:6000:156b:b0:382:4a94:af0a with SMTP id ffacd0b85a97d-385cbd80afamr9347325f8f.20.1733065606817;
        Sun, 01 Dec 2024 07:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065606; cv=none;
        d=google.com; s=arc-20240605;
        b=dJnJXPO+fkaDaed4gyZ+6C5FyQiz619H5/e76N1bqMiO67EEDxk9RjZ8BPk175Syak
         bqKD8XKHaNZ+hlvA6f7aHWz8mk8TWvCYwRO1NfcdcHnOWasE+SCKYjNNgV9fc3TeJ/Tf
         zwBYC+nyRhr7bUtCaXxEULdaDYLvQd+233zzGfMj+2lOg8T8LZzGrKwT7+jeOsybEDVE
         agVsN4ypFQpJd8+5M9F7sJ85j6oOs9OKAcQLaxzKlBno0qMgKCtKk2tvg6K1s0+mdnKU
         AYfI96ZGxTpitozTf54B+Gyxu2SC5JIaxjrPxU9xuDehY91OmVk02QwT58oBhUwj5nB8
         w9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+yoyh9K2K+390OchJBgvM17dKnlsh3dj4ZAo5zedWuQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=JxMLqN0X1iyHIh7VvJSIJtMNB+627hDkiPmRYcgoSa7AKs7FBpXxwH4kmZIbKe2ptp
         vq/uAL2QHTqiOTu33D7oebK8ozmLU2tIta6l+ZNTW4FQb4+e94nvE6NPsBYKxZXPNToS
         axkeJiYGX4FVfVv80eny1qLU/nWw7NzQwJIJyHcNwFydD9UeHQ7r31aG43QL0knS6M1V
         T2JGL/tUDpKtU6z3ONMXkZj1mOMuF/0eNpyZ4H6TsOcRf6ohXBorEsRk56Xti8gk3XGh
         LRlBVVNh8xMvSpbl2IqKbmeIUVXYYuYmHiwaC67cRQf+bpwQpzd8GASViRgTnLHhlOWW
         0x9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1TL+uGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385e5de5e9esi1531390f8f.139.2024.12.01.07.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1TL+uGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWk-0001GS-Kv; Sun, 01 Dec 2024 10:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWh-0001ET-28
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:23 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWe-000478-OR
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:22 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5eede9695ffso1696924eaf.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065579; x=1733670379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yoyh9K2K+390OchJBgvM17dKnlsh3dj4ZAo5zedWuQ=;
 b=P1TL+uGcFBXT5GNvnjtdDUGuP559HLPoutdUzZpiNs08HlpXio9SI/1LA8xSlod2xV
 V4+ctDU5ISR0L7YaxJyRvDYeAWjJlCvysW57M8zlqPLaAqqCPFxTfoEmdy233uCF1/Pu
 ZaXAUi1NRby/7LpPNnOfxnnUdInqjZUqkW8UQOodJQy6EyrHFslvFXbOuaotdVFl3ACM
 m1Ep3Uh/y1VmMTQQglRla0wpf3b7B7+LqRSdQbu0UqX8aA0D2+ECU8pYivfPFYyWX7lH
 99O8bsr/rwVUG9xJz/oitKjGX8pP7XZk86XIXXHTdrkR3qounckDo9bBjFA+Q//qgOSp
 dEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065579; x=1733670379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yoyh9K2K+390OchJBgvM17dKnlsh3dj4ZAo5zedWuQ=;
 b=ixZj01y0ChRhldteMj7V8AWTXn6ekK3Is0lxb1y8tKvqOet10kiYVYSf3Igih7uuDj
 TurwY+NO8KgEFu5MFpDTVuVvgr6cb/bRo5u7hzgfxTpf7GBwGiyIi9r2iHBnoQLikMqr
 vHWoUrj7XvKJIVaXXqIGGy6s9zc1xW8uchVcAP8RQF9u/pyARjXWXnFB0hCJ7c8h6Dua
 QPMv53+NHje5UEtsnwI3q9kYQFBORzH1wBpPfuGkDkNmUOKrQXLYYbaJDv+/vNd0CDTk
 NhV/kUVeLWdtu/m4K6amoHMJh5kyEb5DVLRwn+6dPAmkrPtJIQdtl8xILbYYt3FGqZUX
 jVEg==
X-Gm-Message-State: AOJu0Yx8XA0+GzMfKAZgbKF6e98IHKQSzIyq810WbDmRQ5GrpMBcfYYH
 godv9v2hsNK0Ae/4yndlDE/z2MMtJ69QllwAG8o/S6783BwZ5ORUyJy/TxITp3gDqiN4Qwd9t9R
 dops=
X-Gm-Gg: ASbGnctXnEWriv6i9c1p0g+mEuaLzlKBLIMUPdQce+Z0A1F3P9Y1krZfYewpIL/+tJv
 S4LYBAPBWefrCCXvZtRnLzz6KAs0glJUKHX7+gZjGnptoSe+P5oWfLskLm/mll6KMLx2Go6+XA2
 RbHdEH9vifnHzu/bg2Q7BirCaw27xXM6ZcnUEuanVnY3zsa3r1dy6KuTHG0Tui5roMAN7UED/78
 2fbp92wQ8C5+ih6zkrXvoL+eyahcI+N5WTwRECDnv9+0XRUEAfF00frpj+g3IR3XC6ZC5ylvoBd
 1jN5uVFe1UJkz53fEEuAraVzR3TvL5p/PS/M
X-Received: by 2002:a05:6820:1acc:b0:5f2:9aa:5821 with SMTP id
 006d021491bc7-5f20a14f39amr12513692eaf.2.1733065579451; 
 Sun, 01 Dec 2024 07:06:19 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/67] target/arm: Convert CLZ, CLS to decodetree
Date: Sun,  1 Dec 2024 09:05:07 -0600
Message-ID: <20241201150607.12812-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
X-TUID: ZLNusswm5ZGA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 72 ++++++++++++++--------------------
 target/arm/tcg/a64.decode      |  3 ++
 2 files changed, 33 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1805d77f43..552b45b4e2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7738,6 +7738,32 @@ TRANS(REV16, gen_rr, a->rd, a->rn, a->sf ? gen_rev16_64 : gen_rev16_32)
 TRANS(REV32, gen_rr, a->rd, a->rn, a->sf ? gen_rev32 : gen_rev_32)
 TRANS(REV64, gen_rr, a->rd, a->rn, tcg_gen_bswap64_i64)
 
+static void gen_clz32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    tcg_gen_clzi_i32(t32, t32, 32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+static void gen_clz64(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
+}
+
+static void gen_cls32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    tcg_gen_clrsb_i32(t32, t32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+TRANS(CLZ, gen_rr, a->rd, a->rn, a->sf ? gen_clz64 : gen_clz32)
+TRANS(CLS, gen_rr, a->rd, a->rn, a->sf ? tcg_gen_clrsb_i64 : gen_cls32)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8322,40 +8348,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
     }
 }
 
-static void handle_clz(DisasContext *s, unsigned int sf,
-                       unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        tcg_gen_clzi_i32(tcg_tmp32, tcg_tmp32, 32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
-static void handle_cls(DisasContext *s, unsigned int sf,
-                       unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        tcg_gen_clrsb_i32(tcg_tmp32, tcg_tmp32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
 /* Data-processing (1 source)
  *   31  30  29  28             21 20     16 15    10 9    5 4    0
  * +----+---+---+-----------------+---------+--------+------+------+
@@ -8381,14 +8373,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #define MAP(SF, O2, O1) ((SF) | (O1 << 1) | (O2 << 7))
 
     switch (MAP(sf, opcode2, opcode)) {
-    case MAP(0, 0x00, 0x04): /* CLZ */
-    case MAP(1, 0x00, 0x04):
-        handle_clz(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x05): /* CLS */
-    case MAP(1, 0x00, 0x05):
-        handle_cls(s, sf, rn, rd);
-        break;
     case MAP(1, 0x01, 0x00): /* PACIA */
         if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
@@ -8542,6 +8526,10 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
     case MAP(0, 0x00, 0x02): /* REV/REV32 */
     case MAP(1, 0x00, 0x02):
     case MAP(1, 0x00, 0x03): /* REV64 */
+    case MAP(0, 0x00, 0x04): /* CLZ */
+    case MAP(1, 0x00, 0x04):
+    case MAP(0, 0x00, 0x05): /* CLS */
+    case MAP(1, 0x00, 0x05):
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index dd44651f34..410eaa9333 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -696,6 +696,9 @@ REV16           . 10 11010110 00000 000001 ..... .....  @rr_sf
 REV32           . 10 11010110 00000 000010 ..... .....  @rr_sf
 REV64           1 10 11010110 00000 000011 ..... .....  @rr
 
+CLZ             . 10 11010110 00000 000100 ..... .....  @rr_sf
+CLS             . 10 11010110 00000 000101 ..... .....  @rr_sf
+
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
-- 
2.43.0

