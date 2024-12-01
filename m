Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148308njk;
        Sun, 1 Dec 2024 07:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXf2bBqpjANdd6Jogp44zAB2hVtBGjTJu2M5oA3EujR0kfck/Bt9FZ3lu7fEOQZMzwWXW3LdI/w92jKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHXJx2XS3uh832+sMmVlFGlmWvBzXSKbZe/zcQ4ktKIEtPQIWd1L0Ccw0s++ZIvQPJU78R4
X-Received: by 2002:a05:6214:130f:b0:6d4:2910:7f12 with SMTP id 6a1803df08f44-6d864dabbc7mr271386736d6.41.1733065741497;
        Sun, 01 Dec 2024 07:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065741; cv=none;
        d=google.com; s=arc-20240605;
        b=B9rrFk/NqC4TNmnsW07Kqb5npfiL8ATH0VWZOyWAeKclPJoukXYcDpIYp0gmmu4bPJ
         8m5wdGgInb+xOy1IQeiWemz1xMhXvjJV4ipLpQOidXm9T5YbicqxKiMigKxT4w1G23CN
         xeY+MtiCSLFA8MNoBv/92NFEoJB390GXf7OMuO9lqiIOxXm6K/r+0bWsGE860MVF/K7R
         BcwRR0sGcATODgW4RHQ211byIIEmqFJo3f8fKefRtYzBCmk7DUKk/VRS9rsCVy/MEe+d
         pZQ5ucD934cg4FcZECXDix4ndMYcfyUswlp7OU98oo2nKK9xeHzjC8XNXh6uoW6MAHdo
         SLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SrMMcVEKVnfBTB8hZDN/4CY8Nj/pokDbQuR3DWbuhpc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=CbBL71a4jvpEVffR78qNXWoFyK8KiW8Dt5Azd0tHFjdIdnt10TYiyAV5Tenh5bcSSl
         ZtCanAMqrrEwF+yRkaBFZxWt/fplrJzFWxS274Gl43g346/NEXltOtVKC3sX6t4K8SWz
         xTC3hBc4QlKmSJKwKHK5qXk9G91GvCfHxSbZcUA2k4eFufyqj62SLyanlduerumqghvb
         xB4AxAoPt1Gla+gkzF7MYnnc0iIKzyi62Hv/Y9YIk95blsyZQ0GaaHtJTo7STLZJCvFt
         aivqMNQjHiGmtKx5NjokbgxJ3ypjttni/AGLJgQjrTicaYd7feRhHpe3QlkuaB8EsHAv
         S5Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKoSZY13;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875591a14si102970276d6.502.2024.12.01.07.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKoSZY13;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlWg-0001E9-R0; Sun, 01 Dec 2024 10:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWc-0001AL-PF
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:19 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWZ-00043Q-UX
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:18 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-29e61fcc3d2so174453fac.2
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065574; x=1733670374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrMMcVEKVnfBTB8hZDN/4CY8Nj/pokDbQuR3DWbuhpc=;
 b=ZKoSZY138/u3qyAer57DPI3JdQjYWOKRcCjqukRTiLIGNRKwKvRPU9x4dRjm43EH7S
 raBM0nf+FmizuiPP0+YZaW1yUXyMWhbayTGU1lh2OSdOlZu1Iz9eKElImXfq3PJLegx+
 MVJbzezbavMmK/BS92AuHPM0lg+1iS74guJ9sWlquH11N2hj+bfaaIodm8qsT81AEFzu
 C9/koWIuuVmx9ZPPWLZ1dvZ2QLGUKUMT2dB/UlYxPg09m5XBPKcXdX08fRWLlqr+UArk
 0C5skIM9AzrBLMlGsjZef7asNS5DgeeSSzndzwZP44+kxcBxhQW5hudWUMgUN+Drb+yP
 Kldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065574; x=1733670374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrMMcVEKVnfBTB8hZDN/4CY8Nj/pokDbQuR3DWbuhpc=;
 b=XP1dUB2m+WdwEQHaAHulaIjQyzaVmeGhjIux/bn6Z3IxMfLz9KR3OhSA1Aht3PTm3/
 lgeeGqc/aljiPOBJRYBLp2B9HZHf/VICtLfTCcspyANVBrePoHpms1KZVOEOJmc4j7CQ
 hqyJxXEOjZBVMngZ+LPyedCOq6JncpkCOHuZWAnu/Om7ElCNUBwrTYFVDfbra+alBlyB
 C6CUxvS8utUU3nlyrKfHNCRPKTYJ99Zg3ubgtsyTJGegTtu7zRgAEK3lL0Qv/b2IaNQr
 KhAnoBWm328N1E35vTjEuqSMMi8XiUwYBMiuLRTJPdhTMlTkJF1onEYPZgBdmXVhE9mt
 /Sig==
X-Gm-Message-State: AOJu0YwyCqnBlZENAMfCcaIRsLhUzpvxZxSi5Dhlkq+NZPEPI7eouR1Q
 VbiaoPgvl3jSQXUu7mS/fpmWMJ9M2bcd5kqfcd0PeOTSPuHXUpuf86wYeY6xElPgLmd43vxX8Jl
 aZ8g=
X-Gm-Gg: ASbGncuPRBAKMP233AZHHxiRiQfbSMOzpX43DxXQTaYnqA6wkTOrnESDlBje0LCVmnS
 cHISyPYbw0ZDYanE8eFfFX+YAlOE+gRDq6gJAEXPTOiLTzbjQHF6STXUCGB5pB54tDf/CyfijHf
 aSJP13Z1vuTpJonTqWIPeH6XDi+QQaIcHVGMMX0i+TlH0JLwfRnWUOaHJOFAj28/HbOkUMIsVrb
 ReHdJuYZfaMlNwI5vfTWWh1LVtQfZ/W17NpsVsFy/ZAlmpCILPT8XY1ocfWwnvA6lKowzPB6iFa
 ArjzP5jbF4bdSL9GvekRXGkMP4Uzh77MZ6PG
X-Received: by 2002:a05:6830:6e9c:b0:719:dd54:ee79 with SMTP id
 46e09a7af769-71d65cafa6dmr15131800a34.15.1733065573739; 
 Sun, 01 Dec 2024 07:06:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/67] target/arm: Convert LSLV, LSRV, ASRV, RORV to decodetree
Date: Sun,  1 Dec 2024 09:05:02 -0600
Message-ID: <20241201150607.12812-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
X-TUID: KmyS82/3sXk9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 46 ++++++++++++++++------------------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9f687ba840..8b7ca2c68a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7575,6 +7575,23 @@ static void shift_reg_imm(TCGv_i64 dst, TCGv_i64 src, int sf,
     }
 }
 
+static bool do_shift_reg(DisasContext *s, arg_rrr_sf *a,
+                         enum a64_shift_type shift_type)
+{
+    TCGv_i64 tcg_shift = tcg_temp_new_i64();
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_rn = read_cpu_reg(s, a->rn, a->sf);
+
+    tcg_gen_andi_i64(tcg_shift, cpu_reg(s, a->rm), a->sf ? 63 : 31);
+    shift_reg(tcg_rd, tcg_rn, a->sf, shift_type, tcg_shift);
+    return true;
+}
+
+TRANS(LSLV, do_shift_reg, a, A64_SHIFT_TYPE_LSL)
+TRANS(LSRV, do_shift_reg, a, A64_SHIFT_TYPE_LSR)
+TRANS(ASRV, do_shift_reg, a, A64_SHIFT_TYPE_ASR)
+TRANS(RORV, do_shift_reg, a, A64_SHIFT_TYPE_ROR)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8456,19 +8473,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 }
 
 
-/* LSLV, LSRV, ASRV, RORV */
-static void handle_shift_reg(DisasContext *s,
-                             enum a64_shift_type shift_type, unsigned int sf,
-                             unsigned int rm, unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_shift = tcg_temp_new_i64();
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-    tcg_gen_andi_i64(tcg_shift, cpu_reg(s, rm), sf ? 63 : 31);
-    shift_reg(tcg_rd, tcg_rn, sf, shift_type, tcg_shift);
-}
-
 /* CRC32[BHWX], CRC32C[BHWX] */
 static void handle_crc32(DisasContext *s,
                          unsigned int sf, unsigned int sz, bool crc32c,
@@ -8579,18 +8583,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
             tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
         }
         break;
-    case 8: /* LSLV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
-        break;
-    case 9: /* LSRV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_LSR, sf, rm, rn, rd);
-        break;
-    case 10: /* ASRV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_ASR, sf, rm, rn, rd);
-        break;
-    case 11: /* RORV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_ROR, sf, rm, rn, rd);
-        break;
     case 12: /* PACGA */
         if (sf == 0 || !dc_isar_feature(aa64_pauth, s)) {
             goto do_unallocated;
@@ -8616,6 +8608,10 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     do_unallocated:
     case 2: /* UDIV */
     case 3: /* SDIV */
+    case 8: /* LSLV */
+    case 9: /* LSRV */
+    case 10: /* ASRV */
+    case 11: /* RORV */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c218f6afbc..3db55b78a6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -658,6 +658,10 @@ CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
 UDIV            . 00 11010110 ..... 00001 0 ..... ..... @rrr_sf
 SDIV            . 00 11010110 ..... 00001 1 ..... ..... @rrr_sf
+LSLV            . 00 11010110 ..... 00100 0 ..... ..... @rrr_sf
+LSRV            . 00 11010110 ..... 00100 1 ..... ..... @rrr_sf
+ASRV            . 00 11010110 ..... 00101 0 ..... ..... @rrr_sf
+RORV            . 00 11010110 ..... 00101 1 ..... ..... @rrr_sf
 
 # Data Processing (1-source)
 # Logical (shifted reg)
-- 
2.43.0

