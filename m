Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1373351ejb;
        Sun, 11 Jun 2023 02:06:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XPNxgko1sC31MwlWiwBAFw3gfVgPXSH1M1q7W1JHlL0MLHxfq4511H89FwvFt9JrOJDA/
X-Received: by 2002:a05:6214:20e3:b0:625:775e:8802 with SMTP id 3-20020a05621420e300b00625775e8802mr7944904qvk.18.1686474415158;
        Sun, 11 Jun 2023 02:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474415; cv=none;
        d=google.com; s=arc-20160816;
        b=LUQfIahTHn/RXoM289TaCMxLUPkd7OWBuriEg8V1aFelTf3SU/82ZwDKeQynhn3/Qc
         Ydhxy6iJ/B6LB3t3vkiZ4zp8myCcvyLdBnspc4+ZjQZqcuIeE1cHzpqg65C4Zrldki1S
         Xh3Aaz2LfBSYpANiM2M348a3pNMfLNCh5evao85Nlra+rIq2Hk5NqfB2jtBS2+UByClu
         7DyKjmAas03GdT1nEyQtS+krteR0xFSbxhUpcQivBhpuX//sKNSE6zd4ZZwtVvzFFJd7
         2oMGS8NEnTfH1TYkOkCNispjhaNu5hlgj9ZlIw91Bfs1lUtX6z0s4tkukWn/eZr0RNrK
         P6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
        b=rya2H3mmyQbk4mMF5qCUuyyitzcL+OB+GmciE5waGIip9vLBPGn5YVgI82Ajlz1NHO
         VCCRemnW826Wk8fGcDkHxy8ID2+4u60QWbOIscGFdi1gbayGEROfIFuKqL66Z1GUMtT8
         j+KQACTAcA+znGbeP4v+ydi7bboyoQjdcKHi6Zd+F9yj+2+1MT935/X81FkoopFusqZm
         HgDNilq1qR9vZnWxpPDoxAjd0WMlsq8F3mCk3qKGr558ZV5CYyiNv56LrxfdSHH1Qlbl
         dzU25+IdYHpKx/yzmvlVy3VDX8sLKDDi5dgZitZktyKGiS0xLqZX5E7sRMY0nwrbfYno
         xVWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdbJcpQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020ac85dd1000000b003f9a7814a33si4518110qtx.744.2023.06.11.02.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdbJcpQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Gv1-0001H9-84; Sun, 11 Jun 2023 04:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Guw-0001B8-C9
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Guu-0003d5-AQ
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2116944f8f.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473959; x=1689065959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
 b=NdbJcpQTWNeNzxUJzNMqzfziVot6wUUXbgri+Zk8hF+ibBKv7X5zt+H/qIXtMuSOOv
 keRxjnlEZHbBys8qFKfytZBhrXZ5f9S/ZMaxMWlzHPHhYP8n6fY+MTvnNSzsiNGm5sT2
 C5ZhjD3pP4kk4f+DtsH2UHMcBxWdFHEpHYmSQpISesoIqNL5ZKM5fRRBn4a6okHXf81d
 r1DwuGryrHkNmkkdupHqcHHBO6QB3DjyBDZo2fiYJsRRepNT/dKFtpb8NjiXsqEy4uLl
 jILkr5osaB3ok2Wji9tUOYjhYfnhLDbrL6hEQJt4rcNpFejQ1DqxREpDy7MilQowDHgF
 57uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473959; x=1689065959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
 b=JtRp4n2ZvtCZmBL30BGb6OgINeldsQyAJUALzMhz6QgoDbCaZB3ndN+o8zNpQTz15I
 of4tncGePqHw7/o0HAoh4dIv9QtS91vATI+zgUtRg5lvJ+4R6KOYd1qpiowlJF0wQs/u
 0OXQzCLWVlu+SS3uuDR/a6HzSn4zvPlcdDJXTUva6ZGDlyxOkxnmacOjC354tMhn75tD
 N/XuePkp3BySXm8nRY1dNzIf1u4y5aLZqM63lqD+0brcr3uoTlTk3xDgM0Tg0gF8jZ5+
 sXXMfigeDKOEPX1zveK9HoZ9NX3eAqyBdyz5AJHEejh6k8K3MkbLDmWCWow8Y0VOrgR/
 DHJA==
X-Gm-Message-State: AC+VfDwNvYwNilF+i8Q3Bu8TG9gOG/Lgc0iDBbJVk6xDbdIYP87e+Y1s
 fT/6KIVOD1JpWQz+HUkTohLq21DYbYjBnPI9604=
X-Received: by 2002:adf:dd07:0:b0:30f:bf01:b62a with SMTP id
 a7-20020adfdd07000000b0030fbf01b62amr495722wrm.24.1686473959060; 
 Sun, 11 Jun 2023 01:59:19 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0030aedb8156esm8998995wrr.102.2023.06.11.01.59.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/26] target/arm/tcg: Expose some iwmmxt methods in
 'translate.h'
Date: Sun, 11 Jun 2023 10:58:27 +0200
Message-Id: <20230611085846.21415-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: q2ZhM6t1pJd+

Expose a few methods and variables before extracting iwmmxt
code from translate.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h | 6 ++++++
 target/arm/tcg/translate.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d1cacff0b2..3d7c55d3b6 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -165,6 +165,7 @@ typedef struct DisasCompare {
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
+extern TCGv_i32 cpu_R[16];
 extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
@@ -298,6 +299,11 @@ static inline int curr_insn_len(DisasContext *s)
 /* CPU state was modified dynamically; no need to exit, but do not chain. */
 #define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
+/* These are TCG temporaries used only by the legacy iwMMXt decoder */
+extern TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
+int disas_iwmmxt_insn(DisasContext *s, uint32_t insn);
+int disas_dsp_insn(DisasContext *s, uint32_t insn);
+
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
 void gen_a64_update_pc(DisasContext *s, target_long diff);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 3238463f13..aaa479521e 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -45,9 +45,9 @@
 #define ENABLE_ARCH_8     arm_dc_feature(s, ARM_FEATURE_V8)
 
 /* These are TCG temporaries used only by the legacy iwMMXt decoder */
-static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
+TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 /* These are TCG globals which alias CPUARMState fields */
-static TCGv_i32 cpu_R[16];
+TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
@@ -1490,7 +1490,7 @@ static inline int gen_iwmmxt_shift(uint32_t insn, uint32_t mask, TCGv_i32 dest)
  * Disassemble an iwMMXt instruction.
  * Returns nonzero if an error occurred (ie. an undefined instruction).
  */
-static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
+int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
 {
     int rd, wrd;
     int rdhi, rdlo, rd0, rd1, i;
@@ -2509,7 +2509,7 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
  * Disassemble an XScale DSP instruction.
  * Returns nonzero if an error occurred (ie. an undefined instruction).
  */
-static int disas_dsp_insn(DisasContext *s, uint32_t insn)
+int disas_dsp_insn(DisasContext *s, uint32_t insn)
 {
     int acc, rd0, rd1, rdhi, rdlo;
     TCGv_i32 tmp, tmp2;
-- 
2.38.1

