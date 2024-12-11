Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196780njb;
        Wed, 11 Dec 2024 08:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAK89tcqLXVmkz58eQDKtXghjxex6cmZX++5tH547rcQF3zoCSeEURx/8eF29a8F90VlEFPF5ilVO8kQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG4qVGY8hUcHsFkyIHnqKZMcrhfXrNX7qcBEcQ3wdnCTX5yJAxz1j/tc2e9aJ2dJSZhRUeE
X-Received: by 2002:a05:622a:5a99:b0:467:7109:c783 with SMTP id d75a77b69052e-467961500c8mr606191cf.3.1733935341590;
        Wed, 11 Dec 2024 08:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935341; cv=none;
        d=google.com; s=arc-20240605;
        b=GvC7vj+MshXH74+J1XDzwVOg3P3vKQZShj13aXoHtSwgh9smJe4nDMByAYvwnzrrGN
         k2lXmbbLiFe3Mod25r1sCHdnSi5YF4gZwZFl3WtVL1Mo3RaXi7C2Sp9nGraRqmPhB0KM
         F3me+rrBJYM2jKjvONrTGr4PBm77aFc6xCxKqZcDFxz7ODVQ2gQlwGmHxNvDKSFVCKuR
         h7bjrwg/IT04AlrbHMQmslk0quugK67KP3GTMEsYgOESZrWR8Q+PYFBGMJA+bs6DfgX5
         1zl8SfxpT18BmzJCDvyszSKJPZLqt6O/jeLU+8AHseAbko5kPDtZEUppKqfCagSUXzbp
         aL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sjwu/WCIKU5sioc59WkYMjpiHpm5dBrQM69XD4ADE/A=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=JhlqO1DcBG4BDEe6d/QoWEXfOC6kFS6OWC/lgXojKt3+plsWNKXIxrGM+mHcSCLaN9
         Hsoj/aD+lSwJvxm2EX5/dzEq+D2gowgQGDTXvzXV2Azoq9DMkdKQ6j8pceh8SMrBBnT4
         DF8XrBPwj7vHEOosVZ0eLKKWGdqxqamArMwmlYfRIjrT8git1ikkys+QdSzby/qOw32K
         IPSnU0qPr16l9sEL/+yzxZA9OhA4q/As1BhqT80STX8FCi98DK8vBStVOlSOb4zIrsTG
         QWm2aryYBy9/rC25TI9srnzjdr7qWpj3WiGr3SWJptv7stG/LWLzMuKI9qloEVgU5OM2
         oDaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIAFxWkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678583def2si32936201cf.165.2024.12.11.08.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIAFxWkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdO-0005Ux-8b; Wed, 11 Dec 2024 11:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcM-0003su-IM
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:19 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcI-0001Bi-6G
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:17 -0500
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7b6e9db19c8so102943185a.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934672; x=1734539472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjwu/WCIKU5sioc59WkYMjpiHpm5dBrQM69XD4ADE/A=;
 b=aIAFxWkEMO0t10BMyUtZ0d90Iv48my2jcrNimt1r7965dmKoBBHlc2RFN+1XI09k5L
 rXlWEUSKnhPCsXTjt6AaF7BqzEjCNEzvRScPynU+LtfzKda3g/LM2+7rlB7poQSAnf84
 L37G5CxC6rE73FjVPjZLIiXSUYv6vH9mcf2Pg3FbFbx3Mhj686v2l5I2IEcHMk8VFL0o
 fxqCEV5xVUgKcRPqxkzgPY8gBjRjNwlNtNnoqm55mTBK4wOMnqSWIGo45gziZu+9ITX1
 YVmZNHBbwgcgFppKNjixSPWIqLsY8i1pS6veTSy67SVzFO4FGbRfCRK7aL5kO9OW2COA
 H3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934672; x=1734539472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjwu/WCIKU5sioc59WkYMjpiHpm5dBrQM69XD4ADE/A=;
 b=TnTPpaFqDcFlyZKpEZf8ResI7e26mSJnJRuSY6Z6i8d98g4BPLLZPu0spvbrnzcPkG
 UeilcL0XU8wCKj8Spd/wUhwiVa7CPi4PMRXB31Hd8+pbxgZJUJ3mcLl4F3RGbI/KBv/S
 YBP5aF/K3FqRYoJucH7R2soCkAAPbAcOGALzkUUokzgzxuhkhxgEgFWAlUuLcSP2FAct
 c/isyIby1BsLfvvvej4cfy+n/JynRMskwW8oMf/l8+F2Ga6R1o1U9/aczz5QQWXN4itE
 9utbwk/kgrI1WhS75iM1aSy1ujNN944VyAysjwDNWaPvrDcPmEa2l9CCIxN+ceBe24as
 A7MA==
X-Gm-Message-State: AOJu0YwfWmyYm7Vuq4KNkzPJWgqndeZiTc9rwQGFC/fzTnX8S6l+bKZV
 sK8X5cjPUfLkrPWdg4f2cvhlsuBxJgTe/dPIJK44MKJ85yBXbxYLAyEEBjyx4E0=
X-Gm-Gg: ASbGnctpZQc73aHe/j2vjX883Clo/2B+Dxf+7WSNdGXuQQcFPe9Z4pzJNq3ZGya7bnU
 9vKQJ5cXMxUHr6UKXaZJVt5LtlAZ5BdrWUY+V5pwbuUkOUH7nJRk20r0dMjOXi7BZxh3MzvDI1H
 1SdKoR2Kh+EB1GpMYDJzTLlYKt+HpQwqmCBVRUoKoYMSPf9MtTongRoVFj3oDl8dUPWhfbtyMn1
 OmC1ShAmuVeiz9pfrFdcMyYBXvkPRrSYAE+hCMtY2DEQaesINPOr9+Nw4Mk6A==
X-Received: by 2002:a05:620a:1926:b0:7b6:c92e:2e6f with SMTP id
 af79cd13be357-7b6eb459f29mr594302585a.22.1733934672557; 
 Wed, 11 Dec 2024 08:31:12 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/69] target/arm: Convert RBIT, REV16, REV32,
 REV64 to decodetree
Date: Wed, 11 Dec 2024 10:29:34 -0600
Message-ID: <20241211163036.2297116-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
X-TUID: 48oluCCreiaW

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 137 +++++++++++++++------------------
 target/arm/tcg/a64.decode      |  11 +++
 2 files changed, 72 insertions(+), 76 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ca8b644dc7..1805d77f43 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7684,6 +7684,60 @@ static bool trans_PACGA(DisasContext *s, arg_rrr *a)
     return false;
 }
 
+typedef void ArithOneOp(TCGv_i64, TCGv_i64);
+
+static bool gen_rr(DisasContext *s, int rd, int rn, ArithOneOp fn)
+{
+    fn(cpu_reg(s, rd), cpu_reg(s, rn));
+    return true;
+}
+
+static void gen_rbit32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    gen_helper_rbit(t32, t32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+static void gen_rev16_xx(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn, TCGv_i64 mask)
+{
+    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
+    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
+    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
+    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
+    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
+}
+
+static void gen_rev16_32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    gen_rev16_xx(tcg_rd, tcg_rn, tcg_constant_i64(0x00ff00ff));
+}
+
+static void gen_rev16_64(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    gen_rev16_xx(tcg_rd, tcg_rn, tcg_constant_i64(0x00ff00ff00ff00ffull));
+}
+
+static void gen_rev_32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
+}
+
+static void gen_rev32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+    tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
+}
+
+TRANS(RBIT, gen_rr, a->rd, a->rn, a->sf ? gen_helper_rbit64 : gen_rbit32)
+TRANS(REV16, gen_rr, a->rd, a->rn, a->sf ? gen_rev16_64 : gen_rev16_32)
+TRANS(REV32, gen_rr, a->rd, a->rn, a->sf ? gen_rev32 : gen_rev_32)
+TRANS(REV64, gen_rr, a->rd, a->rn, tcg_gen_bswap64_i64)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8302,67 +8356,6 @@ static void handle_cls(DisasContext *s, unsigned int sf,
     }
 }
 
-static void handle_rbit(DisasContext *s, unsigned int sf,
-                        unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        gen_helper_rbit64(tcg_rd, tcg_rn);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        gen_helper_rbit(tcg_tmp32, tcg_tmp32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
-/* REV with sf==1, opcode==3 ("REV64") */
-static void handle_rev64(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    if (!sf) {
-        unallocated_encoding(s);
-        return;
-    }
-    tcg_gen_bswap64_i64(cpu_reg(s, rd), cpu_reg(s, rn));
-}
-
-/* REV with sf==0, opcode==2
- * REV32 (sf==1, opcode==2)
- */
-static void handle_rev32(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
-        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
-    } else {
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
-    }
-}
-
-/* REV16 (opcode==1) */
-static void handle_rev16(DisasContext *s, unsigned int sf,
-                         unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
-
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
-    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
-    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
-    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
-    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
-}
-
 /* Data-processing (1 source)
  *   31  30  29  28             21 20     16 15    10 9    5 4    0
  * +----+---+---+-----------------+---------+--------+------+------+
@@ -8388,21 +8381,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #define MAP(SF, O2, O1) ((SF) | (O1 << 1) | (O2 << 7))
 
     switch (MAP(sf, opcode2, opcode)) {
-    case MAP(0, 0x00, 0x00): /* RBIT */
-    case MAP(1, 0x00, 0x00):
-        handle_rbit(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x01): /* REV16 */
-    case MAP(1, 0x00, 0x01):
-        handle_rev16(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x02): /* REV/REV32 */
-    case MAP(1, 0x00, 0x02):
-        handle_rev32(s, sf, rn, rd);
-        break;
-    case MAP(1, 0x00, 0x03): /* REV64 */
-        handle_rev64(s, sf, rn, rd);
-        break;
     case MAP(0, 0x00, 0x04): /* CLZ */
     case MAP(1, 0x00, 0x04):
         handle_clz(s, sf, rn, rd);
@@ -8557,6 +8535,13 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
         break;
     default:
     do_unallocated:
+    case MAP(0, 0x00, 0x00): /* RBIT */
+    case MAP(1, 0x00, 0x00):
+    case MAP(0, 0x00, 0x01): /* REV16 */
+    case MAP(1, 0x00, 0x01):
+    case MAP(0, 0x00, 0x02): /* REV/REV32 */
+    case MAP(1, 0x00, 0x02):
+    case MAP(1, 0x00, 0x03): /* REV64 */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a23d6a6645..dd44651f34 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -28,6 +28,8 @@
 &r              rn
 &rrr            rd rn rm
 &ri             rd imm
+&rr             rd rn
+&rr_sf          rd rn sf
 &rri_sf         rd rn imm sf
 &rrr_sf         rd rn rm sf
 &i              imm
@@ -685,6 +687,15 @@ GMI             1 00 11010110 ..... 000101 ..... .....  @rrr
 PACGA           1 00 11010110 ..... 001100 ..... .....  @rrr
 
 # Data Processing (1-source)
+
+@rr             . .......... ..... ...... rn:5 rd:5     &rr
+@rr_sf          sf:1 .......... ..... ...... rn:5 rd:5  &rr_sf
+
+RBIT            . 10 11010110 00000 000000 ..... .....  @rr_sf
+REV16           . 10 11010110 00000 000001 ..... .....  @rr_sf
+REV32           . 10 11010110 00000 000010 ..... .....  @rr_sf
+REV64           1 10 11010110 00000 000011 ..... .....  @rr
+
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
-- 
2.43.0

