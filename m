Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2149781njk;
        Sun, 1 Dec 2024 07:11:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4haYJCSK69BuI+Q7qRq2bMIae3CdlJ94ElG6PcKkktMEEA7/2WzPZe4VcJTYOptCbUbMMsaAySFw+Qw==@linaro.org
X-Google-Smtp-Source: AGHT+IEIRij7CVMTPeg0zwzvj2deFvgCEND6+xYtydaagi1K2D5QVb3EN5sSlg+J6rwJqbMGZXse
X-Received: by 2002:a05:6214:194a:b0:6d8:a188:369f with SMTP id 6a1803df08f44-6d8a18838a6mr38312086d6.14.1733065864420;
        Sun, 01 Dec 2024 07:11:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065864; cv=none;
        d=google.com; s=arc-20240605;
        b=lrqiHon6w6sbhXbkBI0+CoPUKL5VsrV+Wi1FZacOeR7oQt0lQ29D9Vmi6Yze3HZxbg
         SnJGX58uubTXq2UxzYeJLOXHsypouXJm36LdmGPM3JYpcHDpBR+OD+B6tZkEXX4V8bqf
         CkfZIoPasnl+iUgUqMBFV88qc+T8LiG3dEVaq7AhGzNLNeJnT/Q+dK5HevnLPl9/AO9C
         wopMBmw1NOgc08w76y86gLSm6AwrrlyrPMqPp+k6Mu2d1PyoAJo2Vded3TtmJBJxxt/2
         jv8AO0yDGERhoHlUP6Ew5w+nqBqHPDl7TI4ZiTuGlRvHSpc53hkO+T3zaA6itRXkQYMi
         I4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BCkydIoKayyLe/qvR4jEE53irWYJ4WD9saJmLrQJeZk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=cv3lPuooJ30fVf8mKHY96rtjKzqqBTVEsvouhUKWCMcqDgZ5dAUHCSKf0I1JDoForZ
         odzZkTC1Ugc+WGExG4rAlXX3pm227IqjS+RWoa2VM41Ttdk8u9Y6Ml1yFigRA0Yl2oAM
         fACHWVcd5cNdbJpwnkGAK4tjIflUTloG2IU2HNumb7WSTwLczJ4FHRcu0oNC0n21NZKQ
         ALRcY5ko9B/Pv9pXr4PsJ9TgpUGg350ciBUcA4gI0QhiCbE0RLLpblhTB+lBdrRffjLP
         BY4VMPHj3o/igeBH6A99kQH6sNjM+ProTH/UeqBTDg3s/0bKopmOXCPhnvN23Gzva6f2
         pmJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q3ToGFtj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849c0c35si968732185a.409.2024.12.01.07.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q3ToGFtj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlWk-0001G8-Gj; Sun, 01 Dec 2024 10:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWe-0001BE-Bi
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:20 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWb-00046L-P0
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:20 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-71d537b50beso1429231a34.1
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065576; x=1733670376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCkydIoKayyLe/qvR4jEE53irWYJ4WD9saJmLrQJeZk=;
 b=Q3ToGFtj0A7DjnLuDfjxE4v/zxQdt7qaxdtmUfhk0vPe1RS3/sVSeWOEa2wqUjlENX
 rSmj3zObtdpWGa3T86gQ1Imosi3Woqf1qVSOrvQjygsVX+3sCsU8y20h0uF+d0zx7kIa
 uSqh5En1c2CWcZjGZFjKMnE4ealR1pD1675SZYrHynNf2x/toARUk/5S10qBvqCBDzY/
 Pdc/0pykS/+ncgP2z7/fmHa1gmJbjBRGLWFdM7lWQ5ObL0UFgbaWlOTHXGeN3NXdrcNW
 Vh0xUra1JgGUKjyemlSHym4GV/1f53WqJ1Ji4xDKhM3rvojEAmwm8WtE1Lx6/UONLgu3
 KlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065576; x=1733670376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCkydIoKayyLe/qvR4jEE53irWYJ4WD9saJmLrQJeZk=;
 b=tXKpZWEAI/+T5GXCZyaVa9QDvhORFhUfR4DsSnhNa4y/jbucFvckryKTamnOlV50ot
 JHfC70IoFhK+dQpP1qBCsGCalkUxnNgAa8neXHI5qBqaVNGAawZ0RPTLHHfwtLOg1atJ
 xfAZ7ioEiJk58hdLLo51+KrMOlmzSY8Ihk0RqcjIg3dnXZUU3xyNFD3ZQyCLnVeIwcj+
 TfSYQnAlwdyaA3FV5vtm1Cz4415tur2WaYkRpAUYQq3SVUbnxtnltFaK3yooHZQaQ1nB
 g1Li1tvsu/oCyy2IMxFMPYDCXn1ZFqCjmXIUcTCr0HXUw/efAQPvxibYFmv4LFZgdnsB
 KJ2g==
X-Gm-Message-State: AOJu0YzVsVzZx04F7MF6ZjQCR49VJybp90u9MmHAn4M2gmGjLBabauLQ
 swMU1Uh2xqhZeZGTivnv2KA8QLwBwpYwn1sXEf9NBZKai4WkZNbsacsSvpsahFUiL0xq36CHGRv
 6cYM=
X-Gm-Gg: ASbGncspvyG6OTbVVxS8icGmkKniAsN6dZfjtDnPU0e+kw0SR8Hp401AcAlryjldwNP
 Z9KhL4rcIbpHpVmXgVk8hhT/OO6AJg3P5N93hWEWtgBaGwi66OPi7+qS2tQQFd65fw+3HAYJCdI
 5LLFVgl9WdBrq0+iPzmuCO4oQ+RpGOvTMzq4mJX7i00QoQ/7DXFiRmgi/GOBWuXj065EQiexO6w
 PfMl4+Il8b++eWJbvy5JFYkeDUlyWvcvSfdEI2BFtLNP/B2qrUS56ECD/ZwWHhe5c9UjjdLyj+m
 yahXZyrNCzK4mx2YZaxQR4qj1LkluZkWT91V
X-Received: by 2002:a05:6830:4905:b0:71d:3fe2:2053 with SMTP id
 46e09a7af769-71d65cf6138mr14259317a34.21.1733065576677; 
 Sun, 01 Dec 2024 07:06:16 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/67] target/arm: Convert PACGA to decodetree
Date: Sun,  1 Dec 2024 09:05:05 -0600
Message-ID: <20241201150607.12812-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
X-TUID: 17rHDvv95JQ4

Remove disas_data_proc_2src, as this was the last insn
decoded by that function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 65 ++++++----------------------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 13 insertions(+), 54 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 00e55d42ff..ca8b644dc7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7674,6 +7674,16 @@ static bool trans_GMI(DisasContext *s, arg_rrr *a)
     return false;
 }
 
+static bool trans_PACGA(DisasContext *s, arg_rrr *a)
+{
+    if (dc_isar_feature(aa64_pauth, s)) {
+        gen_helper_pacga(cpu_reg(s, a->rd), tcg_env,
+                         cpu_reg(s, a->rn), cpu_reg_sp(s, a->rm));
+        return true;
+    }
+    return false;
+}
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8555,59 +8565,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 }
 
 
-/* Data-processing (2 source)
- *   31   30  29 28             21 20  16 15    10 9    5 4    0
- * +----+---+---+-----------------+------+--------+------+------+
- * | sf | 0 | S | 1 1 0 1 0 1 1 0 |  Rm  | opcode |  Rn  |  Rd  |
- * +----+---+---+-----------------+------+--------+------+------+
- */
-static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
-{
-    unsigned int sf, rm, opcode, rn, rd, setflag;
-    sf = extract32(insn, 31, 1);
-    setflag = extract32(insn, 29, 1);
-    rm = extract32(insn, 16, 5);
-    opcode = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    if (setflag && opcode != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (opcode) {
-    case 12: /* PACGA */
-        if (sf == 0 || !dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        gen_helper_pacga(cpu_reg(s, rd), tcg_env,
-                         cpu_reg(s, rn), cpu_reg_sp(s, rm));
-        break;
-    default:
-    do_unallocated:
-    case 0: /* SUBP(S) */
-    case 2: /* UDIV */
-    case 3: /* SDIV */
-    case 4: /* IRG */
-    case 5: /* GMI */
-    case 8: /* LSLV */
-    case 9: /* LSRV */
-    case 10: /* ASRV */
-    case 11: /* RORV */
-    case 16:
-    case 17:
-    case 18:
-    case 19:
-    case 20:
-    case 21:
-    case 22:
-    case 23: /* CRC32 */
-        unallocated_encoding(s);
-        break;
-    }
-}
-
 /*
  * Data processing - register
  *  31  30 29  28      25    21  20  16      10         0
@@ -8674,7 +8631,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
         if (op0) {    /* (1 source) */
             disas_data_proc_1src(s, insn);
         } else {      /* (2 source) */
-            disas_data_proc_2src(s, insn);
+            goto do_unallocated;
         }
         break;
     case 0x8 ... 0xf: /* (3 source) */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f0a5ffb1cd..a23d6a6645 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -682,6 +682,8 @@ SUBPS           1 01 11010110 ..... 000000 ..... .....  @rrr
 IRG             1 00 11010110 ..... 000100 ..... .....  @rrr
 GMI             1 00 11010110 ..... 000101 ..... .....  @rrr
 
+PACGA           1 00 11010110 ..... 001100 ..... .....  @rrr
+
 # Data Processing (1-source)
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
-- 
2.43.0

