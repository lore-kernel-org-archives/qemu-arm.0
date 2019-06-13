Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2478wrg;
        Thu, 13 Jun 2019 10:20:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzchU+g+VIe0cVKBcIPIBVVMT5bkwCJflmoiHTFEhjDuIF8jh2Ri649r1zUppY1jQE49hzq
X-Received: by 2002:a67:b14d:: with SMTP id z13mr10496418vsl.190.1560446402388;
        Thu, 13 Jun 2019 10:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560446402; cv=none;
        d=google.com; s=arc-20160816;
        b=yNey7T3/S0dGCedKN/uXhLZoHX996LzIR57AzWi1vORUiPwejsfN93zyBNLGUjFZUx
         LgWwyy9QUUb6UnepV4tBH0VHgTGH4WPHIE3xc0L5R6o5h3w8adHhMil8P0IJxPrKQ9hd
         jafrwtPYn7G9Q5rKrPKV34piedT4RUYfBJJU/OI/l/8KQL3lmFXCRKQrY6tDkxkEpRJG
         m8VI8/KWRaRTUnJa8NnsJ/aNQoXZT94JTJIZ+z+/w8vIFjGj4y3W6A0XkyplMWvuGjvW
         JU92f3CraQfsjdpfycg/vVBkkf9PYEuc+hn2PAc8nm4dWwFuKbp8MmkjwD1fDt9xcHsL
         ZdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=m4A8CkEbvWMmQVuN+nzRQmfo8pG9vjNNLIpgsnrjjCE=;
        b=pOAWdDgng9qzt0yx6yHftP+7elQAQuBa4e4HfzpU6gsvbJ/jAFHu0ZjWbosPjtiNQI
         qkx8FFZkMZYd5SRvbwc6Zw6KrFC0CQB7SiFUML9XeztqT40j3SFHwa9sMCCFYNjpvuHK
         odohAkjCimLCP3+PEvqxexlOV9SNiCxxe1O6vexRN6eVmSjf1Wq8l+f32NH2pe77p2+u
         1Rrvn+RYWXxVB7fIXOX+rsRadhDXOTpp4e4fxgwEHmOdBgOHs373KHWdauAqI5ReZc2n
         5o2ry4SqCdlzYtnMn93PQmR3DzET4Uy+bnDnFg0yShfu/UHQ6nszM2N9bDDnxaciQRU1
         zO4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rze6OFIp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29si159075uae.204.2019.06.13.10.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 10:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rze6OFIp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbTOL-0006hO-Sn
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 13:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlI-00041R-1e
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003Kq-T3
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35443)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0002Wr-Hq
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id m3so2527763wrv.2
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m4A8CkEbvWMmQVuN+nzRQmfo8pG9vjNNLIpgsnrjjCE=;
 b=Rze6OFIpxfV9Ip+R9pQrienaQuKkDljMUJrRsyXJdxi5paKGRxOQ6m1gxUOPuD7vgG
 V6Lhs/eJjYMwGNyq/jeJ+n+6704S9IshlaZFdy077cc0fAmzwEhJiBXDjVU5git2AeIL
 rNpjc4Bg5WWBPl+PEYHvAWn5YyO3JUylapDrytHxuFlweT6dzybXloOB19W+WP87rHy3
 QNgwXxF1wKLlAMv3QiBbtZqDTNTqkxSS5xagkHZsI8g6CsSMGACoawYVr9w9zLInqXLj
 nR4hMI4ZZt7/9HInJxMTP95rUIflNk9iV5ZeW1HRICVLM1BLTrIV654ZfovF9F921SYR
 vgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m4A8CkEbvWMmQVuN+nzRQmfo8pG9vjNNLIpgsnrjjCE=;
 b=WxMwsrMMNcUZMhhs5LuLS75aeKpaFyyJNzzyX3abjUZNUqC+f9F9+Oz4PX+XlrQNS3
 VYTqlSRmTKTN/H/FjVXRVROTEU6rJM6p7AN6Ya72tSmPkmTyF7erEz7GIYbFSQpqDCUD
 /yLUEJ+grXwRoIYxto4dp6B7scAP+RaM0QLspr4sQRZ5wO4fVsl76eRdWsfRLuRhQQJg
 ELQxBy8WynPWYVvVPgDbNYSX27DinuxOsSa7QjrRYZCtQw3HgD0K9DAdjx+GffFHMxv8
 0YOeHdCrHm4McII/NG7Kv5HiRExhn9ruNK2CqjemaOwrDUxQ5Iz1c/cWYGWNMnVA21fg
 KjKg==
X-Gm-Message-State: APjAAAVwFvctFBXYqYZc1gcTHJpJYfxPSI/OQQ8i/693btcCuAG2bibk
 frhiHam1AaM7Em8gnGXZHVG379IADSyT6w==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr16095740wrm.100.1560443966690; 
 Thu, 13 Jun 2019 09:39:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:12 +0100
Message-Id: <20190613163917.28589-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 07/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VRECPE_F and NEON_2RM_VRSQRTE_F
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpV1ayUgHY5E

Stop using cpu_F0s for NEON_2RM_VRECPE_F and NEON_2RM_VRSQRTE_F.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 124045a9ef6..75ed7cc7cb0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4181,7 +4181,7 @@ static int neon_2rm_is_float_op(int op)
      * what we are asking here is "does the code for this case in
      * the Neon for-each-pass loop use cpu_F0s?".
      */
-    return op >= NEON_2RM_VRECPE_F;
+    return op >= NEON_2RM_VCVT_FS;
 }
 
 static bool neon_2rm_is_v8_op(int op)
@@ -6848,14 +6848,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         case NEON_2RM_VRECPE_F:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-                            gen_helper_recpe_f32(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_recpe_f32(tmp, tmp, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
                             break;
                         }
                         case NEON_2RM_VRSQRTE_F:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-                            gen_helper_rsqrte_f32(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_rsqrte_f32(tmp, tmp, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
                             break;
                         }
-- 
2.20.1

