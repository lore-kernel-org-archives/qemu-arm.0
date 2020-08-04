Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp52883lfy;
        Mon, 3 Aug 2020 17:27:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyZM9NKrCi2VG58YtOpWs2aFQ5WuXVHuMgPWSPfvbUyhO8BIdyNzGkt1+TnfJUFPS9ioUQ
X-Received: by 2002:a25:5056:: with SMTP id e83mr30318526ybb.507.1596500852149;
        Mon, 03 Aug 2020 17:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596500852; cv=none;
        d=google.com; s=arc-20160816;
        b=hYLiWQtzXTc/REVEYMxI9m+tkF04BW56xSWcHWKgV2Rml4o9fn0Qb9JGfpJkaPK3nY
         98rvhb2mdEyUlMQFbs+uH7oacSEnrW1oKYAMaXJh4YC1gw72+ZmqogAcClgd2DizdcrE
         DXTTACkSP1okvHdDhaKwlKnMkTqMGTQyF0MAR0a2A0wMt7Z+otP6b91qqUbcYXPeaesN
         Baur39x6jIVp7ziYPeni50lcY+rEKgCyQMrg3EoZj8SDQJ2WKnJERsMhsYuk1NnyW0hQ
         hIPbNo7vXj90orlXwOxxUopO2WwoUsFcilbcrGMu+ufqbagMjJ/Y8PkOwr96xZ7Ztw65
         XXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=NdI/lRvciywZTVwluPi9hRS2Qi8JdRc2jAMCVsyj+YA=;
        b=nPBzKp8BSwgaJdEDVrHYdtcQX/dU1ox56Bz5d8LV4c77UwOoETWWPQRCd+bVIzLqwQ
         SvruboRBiSFnZ5BhyMoeVAL4N0XKvOQmhtHzf2HY5XFUXzaTHVlWHSGnIuWr4AoLLtxY
         H1gNmUli+IrGBWRUuV7HSjIzWbu/P3DNa+NNUGCswhC+aXDCdB3BnWKXPaeMRnxqSi3a
         BXiE0pw6GNH365lf8Yv6QjseMy9yHWIOTrw31ymwc/DjFSU05z8a5Dozd2LP7GglT4p1
         lXZPZD7DbL23oYpHcdiaP5SAULinzwK9PqLNmWUabydu9/EZSZgziAHfn0GW/oGGDNiK
         H0yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=lslg8Jtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si16207246ybi.326.2020.08.03.17.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 17:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=lslg8Jtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2knj-0001g8-D7
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 20:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Z6soXwMKCGANAAEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--pcc.bounces.google.com>)
 id 1k2knb-0001fo-Gs
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:27:23 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:55926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Z6soXwMKCGANAAEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--pcc.bounces.google.com>)
 id 1k2knZ-0006Yg-Qx
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:27:23 -0400
Received: by mail-qk1-x74a.google.com with SMTP id 1so14137822qki.22
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NdI/lRvciywZTVwluPi9hRS2Qi8JdRc2jAMCVsyj+YA=;
 b=lslg8JtguB3I70C/3fIUX77sfu64t+DvwInYRQPOvTIwDuMgdhrcRGDnjQpZEIOUV1
 n8lhaqT6z2XwzirHU1c6Is9s+ihUNSBq5S3gjRcSke14qGDkaMQxWpk61fX+/r0Yxqg2
 Zco64D0PRVPLrnXH7tLGF4DSeFolWJAI5OsCjpBBNEiFEGGjpxAbO5SIhW+AUAphDojs
 oBoOtypM9wmtl6ccDK/gL8v7Yye0M7wLgl/d+lrFoZTwQqQXQ1Uq6Sts1DXfktYLczWD
 UxPtGsNVhIbvqOwS39jKUlzoj5o3shnomQOvM6iFxSMXjW8RqOfAkWA3YBiJWM2qA5pN
 Rgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NdI/lRvciywZTVwluPi9hRS2Qi8JdRc2jAMCVsyj+YA=;
 b=VYEPHxjXOUJfeYZbCr9Qi0ksXlHmEFJ5NblE4exQSpdR5rz9ANNw6EelGPuqp0tHVZ
 IkITQeKY9sEtYVIae6uXhFBWKQ9PIIX35NmJjZEioGso0PeNUISNWlcC5ZFkhSBPUSmm
 Xy88ZoHsDhSuBcoxddYEr2wTSb9tSWL3/2bV34Zyzaip91ADSsfjrFlOKgCkrbYNmxNQ
 mkpdsz9sDqaJlf3gXukgGRMHkcnE7x/9EZ0FkvW4hNftt4TRIlnP7ZlY9iJ/X0WPbaR4
 XTcyAEmn6HbyV+TIVMY9DV25Vc1U2tbyXCPAterLn1+kzCiEWg6+SIllWyC195JCBS8X
 PJMg==
X-Gm-Message-State: AOAM532KUWxgkpj1yWvGrgMgKNv4oZL0YYnipthUYGixKgK+yRbTpsbu
 uk0lJLokrpk2qv1jFNm6mlGmjU0=
X-Received: by 2002:ad4:44e9:: with SMTP id p9mr12513721qvt.112.1596500839100; 
 Mon, 03 Aug 2020 17:27:19 -0700 (PDT)
Date: Mon,  3 Aug 2020 17:27:11 -0700
Message-Id: <20200804002712.27733-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH] target/arm: Rename function disas_ldst_pac to disas_ld_pac
From: Peter Collingbourne <pcc@google.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3Z6soXwMKCGANAAEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--pcc.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0E/M+a0vOq/z

The name disas_ldst_pac is misleading as it implies the existence
of authenticating store instructions, so rename it to avoid that
implication.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 target/arm/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c0764957c..749de2e509 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3408,8 +3408,8 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
  * W: pre-indexing flag
  * S: sign for imm9.
  */
-static void disas_ldst_pac(DisasContext *s, uint32_t insn,
-                           int size, int rt, bool is_vector)
+static void disas_ld_pac(DisasContext *s, uint32_t insn,
+                         int size, int rt, bool is_vector)
 {
     int rn = extract32(insn, 5, 5);
     bool is_wback = extract32(insn, 11, 1);
@@ -3562,7 +3562,7 @@ static void disas_ldst_reg(DisasContext *s, uint32_t insn)
             disas_ldst_reg_roffset(s, insn, opc, size, rt, is_vector);
             return;
         default:
-            disas_ldst_pac(s, insn, size, rt, is_vector);
+            disas_ld_pac(s, insn, size, rt, is_vector);
             return;
         }
         break;
-- 
2.28.0.163.g6104cc2f0b6-goog

