Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FD2C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:27:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3sk-0000gu-3m; Mon, 28 Sep 2026 01:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3pf-00059s-QD
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:23:25 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3pc-00085R-Tt
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:23:19 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-33be7dfcfc1so3781405eec.1
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572995; x=1791177795; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BWMlA1NXCzJLFH2JlbJbQuxfT3OYvSZI8xbaoVuKaUQ=;
 b=doSKapxJUHDXm7Sc7ktjtIyKeynFK5wuFqCueqtSy5CS0ZPHghZinwqMB1C27m5W0E
 k4WVLsu8uSoJV0uG1xbbIWPHBetNjW5SeXExLrXRhlh8IN5uUX6vTfyX+I2YUO0zkGSd
 9bgPYiAMKAjI0tsxnVKbiNZfTsoLry/SYPl5fKxzqEP7yyTQcTiaVQCKlIol2Y5LhZQt
 MqavsF5HZ8I8VhouVHjdPPWXgiJ+W05e5za2IXw5/iNZ0OGaV31XhV8B2bLkFbqdBnDi
 Fs5ZDBH6nPcXhltx7NoPAXiOaHMxrEPi6CqmMt1eglAeOwlCotTIgkrP4OOdQzZXQdE8
 LHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572995; x=1791177795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BWMlA1NXCzJLFH2JlbJbQuxfT3OYvSZI8xbaoVuKaUQ=;
 b=nt8j8pi5YNyK+YTI6Q03EK2VLVGgFD1TCGJl7wtoEa9TYhs6HhzYS113/XObqNdD0W
 6YpWhQpCkCutSaSEjBSjo3MLEQD5R07+U8FOI//mKQLr8gqIhwDXcaNpKOy47GeCVUsB
 V1xlVeNYsv1CpKfdqs+AdozWpzlHQkHGxKjqSQlNgV7Zb826BgGotroBGf+tHEOB4Fhv
 xiKgwetmYAYkHdQUob9xOiq30Dg2gHj8JE8YWlzMx9er8PeJ15e0Cw4fHPJKNGWRJs/N
 rttaXY07sgND1KUL6boxTxBLiZRNbE+70NUP6qnW/UySctiaboQATjWavRnm7Yv4BdRP
 ZuTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYBtTWyQVfoN++Ply6LmIKwiTEgUaXddOloB57llc4fzN/u62r9pQOZnhb8BxpT8wVlvr77MTEXw==@nongnu.org
X-Gm-Message-State: AFuF++mh6gJTTXOUSB8eKSWU50v10/VMfGEl1nZa6EjsUmJw84TdPV9l
 xc67nZS7EeV7ArXg70VP18wxoGEje1vU/MSPR7kEx/VWtg8QAhXypn8j
X-Gm-Gg: AYBFou0ohmY7hG+GhmyBpMvGdwcuWY+S6ImAwDo/iNVMwFJDZU5DBJf1uNneQnfqf9v
 QuK/asQEC4FmlOj4Rlj2b/CouoZuReiH2RCA3VVak9SfQIFK9FtZ+ekaHDEsA1ahk58KS0/zo02
 Rz4JwoxKUH7wcpv61P2TlQCi/RCSBSaWC4ZV84pccPdo2yCm2kzF8oRboA0BRRFheBgxfj4Vin0
 9VfZfitWEA1fcpXDO8Fx4J860wk5a0K/HCdP5Qk2F4nrhticUOv8+Ilx4T6zQ0jLhyWBwGA8T69
 nawFU09b0GM4ejz0JjbCJG7RhAN8KIe22Y86mx+Gf1eWLodh6zJUOzHvB7o0JCdE3eHvJ/ahYNz
 TzFkrxo15LRcjbbk+lZ2xZ2wNrojpKNxndXdTLEFXFvrtbVM4rCprTBYbN/cpAqa7NIKO+howpl
 SN047W76JTpPAAq9XpDkSknDv215RNe8XvzAN5WMq1GOEbhAWggRRlXSN09+tbEB5/pKP7Uzznk
 J6PtjcM+s8zUgBOBYZN0arXg5LH34o=
X-Received: by 2002:a05:7022:b04b:20b0:144:c127:dd19 with SMTP id
 a92af1059eb24-146d01afcb2mr8924541c88.37.1790572995057; 
 Sun, 27 Sep 2026 22:23:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:23:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 17/24] target/xtensa: add gen_yield for EXCP_YIELD
Date: Mon, 28 Sep 2026 13:20:43 +0800
Message-ID: <20260928052051.251-18-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

gen_exception has one caller, and that caller always passes
EXCP_YIELD. Rename the path to gen_yield and clear yield_needed
there.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/xtensa/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 175fd4b5cfc..db48f0c562a 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -303,9 +303,11 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
     dc->sar_m32_5bit = true;
 }
 
-static void gen_exception(DisasContext *dc, int excp)
+static void gen_yield(DisasContext *dc)
 {
-    gen_helper_exception(tcg_env, tcg_constant_i32(excp));
+    tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
+                   offsetof(CPUXtensaState, yield_needed));
+    gen_helper_exception(tcg_env, tcg_constant_i32(EXCP_YIELD));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
@@ -1167,7 +1169,7 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
        but this is the first TranslateOps hook that allows exiting.  */
     if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
         && (dc->base.tb->flags & XTENSA_TBFLAG_YIELD)) {
-        gen_exception(dc, EXCP_YIELD);
+        gen_yield(dc);
         dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
-- 
2.52.0.windows.1


