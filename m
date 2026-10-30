Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA7606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UoXEuGfP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMsVp-00066X-PO; Fri, 30 Oct 2026 15:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVe-00062Y-JQ
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:30 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVb-00008p-Nz
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:30 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-84e513874f8so828563a34.2
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793389406; x=1793994206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4s+HOF9Q3xtcH8tmlmlazPhw+aN08WYT48sQMLUqAZo=;
 b=UoXEuGfPCvmQTVBewMSbQct0HoZECrDiJFRwGcunJjRAC7W/gGfN32awJCaCgfH1Ye
 4y7uGLYiSPJBrS7Kwni1I0Ngry8WwM3UNQNS/ALHCgTo7G2hmAyXcj7fqzRRqGrqCf0v
 wMITGcVa0CYTu2+IrcA5emEAl3UvSPTksJdQ8pfv6fJ4K7QmCcQHJUMB0AbU62SX6Sye
 6pbQ7alr8s85VBnjwgrASYPNEG/PBe7c+peB2ILbG/XaaW4ZTAznuh3ujiBcrgTocHSu
 8iRFR4OO/mEGQvEmYCFHBB2AN1/smURpd1/TWhpImDdrm8DDkYf6gxzFUqkgp5BVssEb
 Pjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793389406; x=1793994206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4s+HOF9Q3xtcH8tmlmlazPhw+aN08WYT48sQMLUqAZo=;
 b=NtO56mwbno9ZcFJp6uuM9ahZCrpHKuDcQbJB/yYh8Kn9MV2GUwa6GJFh1PCu17Ou99
 lyMcQcPP+a1UcnRjLyc/pZgCCU/QNJDqUzrHdgLSPmbbKI8PPd64jAt4hWv756AhVLOC
 XYuwJCI3BznOG9ldORt1jOepgKul09ttA4DwKKeOu82/gc5+IblighGY+tQC9G65NaXj
 tX+GpiQ8A2M+g818SAk3rSIBz/hU7FRfRhLERyInlzi6N75uRkmFJ5zye8FPMGLXXRlK
 LEcEpFww3eJIgLGfHSx2QAZ+yygM2grwp3z+j7+rCYk91IyKW5uMR30GBTRVa0NNF8W6
 4Sfw==
X-Gm-Message-State: AFq9FYKHhKA8+2H4yKMG4fXFtHeCbeSETwyihj+QrHEbg40XxOf9uo32
 Wo1sSZaY7DkoOL5vZI3FBW51uG42vqxf7G4duorMaw91UGJpH3qGsFQGLs2Sl9emd8o=
X-Gm-Gg: AYBFou21nKEAXbOEKWrQL5SQPMpxHlirsjdAcTFEc0umLhjc4v7jA6KqNHpdW8SIq0J
 SJvx9JcipD8aH9iBFqVPGcVvfcEHMZlhJwTS876E0aeGOCUEV8+ruLLcMVuItyNRtlRpLC8ko89
 O8kbXfkhTak+l7GHkkXEf8WiRe+OEjt/eVVAD7NnoehVuCwxKYsO1ssFtvBW9vkpB5T9c8fvFP0
 jbTeLJiQHYrOQ682az1+lKPrpSZrzH8ihMaawZNXlGMv5q24kJgvyJcC6I57CnXsaU19OXVFwSJ
 OcYrto64OuunWDvN+bo62HC3IWUeNcmLrRB2KDE6S1a5wgCkshfkNkU0UL+JQ5ELAIww0joyvFk
 R4ihMf7mFPTimDt46qUzbC6ulnuJ9sMwN2nAxcRhqUiSamIubXLRHnTs34xKvtTg1NvKZWs+Kfm
 lUJBI3p7dPPhiycWPNp/mPx786XuN4QayRWvgOUYwrvgM8CJK2M8vsYJaNkVDPNNKFUSNzlCRQt
 eJ0b4AEkDAVDiLTnQWbIeVDg05Pun5nCumKWl2HyeRO/s0JXAP3nOa4xTVi2HU7CUw/wi9ZHrnw
 WlZdusfRNZ3eI0PIp+17Hxjdv3PY/ozdjTzQDrXceeVW6Yy0aqQfGwa9wA==
X-Received: by 2002:a05:6830:4393:b0:817:bb8:cb7d with SMTP id
 46e09a7af769-85d36575f5emr2814404a34.18.1793389406400; 
 Fri, 30 Oct 2026 12:43:26 -0700 (PDT)
Received: from stoup ([2607:fb90:5e62:412b:1381:b0c1:1339:9c82])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d351e77c8sm2654768a34.2.2026.10.30.12.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 12:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/9] target/arm: Split out gen_goto_tb_int
Date: Fri, 30 Oct 2026 14:43:13 -0500
Message-ID: <20261030194318.319310-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030194318.319310-1-richard.henderson@linaro.org>
References: <20261030194318.319310-1-richard.henderson@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 38 ++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 884b7d78e2..4289b65fdd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -541,25 +541,31 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
     return translator_use_goto_tb(&s->base, dest);
 }
 
+/* We must have already tested use_goto_tb. */
+static void gen_goto_tb_int(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
+{
+    /*
+     * For pcrel, the pc must always be up-to-date on entry to
+     * the linked TB, so that it can use simple additions for all
+     * further adjustments.  For !pcrel, the linked TB is compiled
+     * to know its full virtual address, so we can delay the
+     * update to pc to the unlinked path.  A long chain of links
+     * can thus avoid many updates to the PC.
+     */
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
+        gen_a64_update_pc(s, diff);
+        tcg_gen_goto_tb(tb_slot_idx);
+    } else {
+        tcg_gen_goto_tb(tb_slot_idx);
+        gen_a64_update_pc(s, diff);
+    }
+    tcg_gen_exit_tb(s->base.tb, tb_slot_idx);
+}
+
 static void gen_goto_tb(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
 {
     if (use_goto_tb(s, s->pc_curr + diff)) {
-        /*
-         * For pcrel, the pc must always be up-to-date on entry to
-         * the linked TB, so that it can use simple additions for all
-         * further adjustments.  For !pcrel, the linked TB is compiled
-         * to know its full virtual address, so we can delay the
-         * update to pc to the unlinked path.  A long chain of links
-         * can thus avoid many updates to the PC.
-         */
-        if (tb_cflags(s->base.tb) & CF_PCREL) {
-            gen_a64_update_pc(s, diff);
-            tcg_gen_goto_tb(tb_slot_idx);
-        } else {
-            tcg_gen_goto_tb(tb_slot_idx);
-            gen_a64_update_pc(s, diff);
-        }
-        tcg_gen_exit_tb(s->base.tb, tb_slot_idx);
+        gen_goto_tb_int(s, tb_slot_idx, diff);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         gen_a64_update_pc(s, diff);
-- 
2.53.0


