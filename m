Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544851ejb;
        Fri, 2 Jun 2023 19:36:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62bQ9CtUfoyIfammbQCjfgqGfcwjMav0zYZv5lozVD6qfCioS2s0ciazMTy6BPxV1qxyyq
X-Received: by 2002:a05:6214:2526:b0:625:b517:6dd0 with SMTP id gg6-20020a056214252600b00625b5176dd0mr547953qvb.8.1685759796545;
        Fri, 02 Jun 2023 19:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759796; cv=none;
        d=google.com; s=arc-20160816;
        b=tKk08dT/Wokv9Fq9kbR8VYl+ZGkRj4eKBf90cQKpvj+6Hfl5sr1aE2jjzhLnxkdJQ7
         V9bXz/WAZ99a09FE5MOb+iTD/idYjmeIHnXbS8bsWTtUwQq0oMsWtpt6HajvLZcLgBCQ
         /f+CgDbGUneA7L7sJUE0HjA5uwHuEsdIgAbEnThXV3/KwIcrdKbXEz7Tca3Xo3FxdfgE
         7PD4EZpAuPmNibe2qwCXp+sM1kFqQqaXTElsO+vNGr2ETkYWehRcDNPmJvTlBYhGeUIH
         usDgvY03YDNEaAxhvBTbAFlzkzg5i7kehnApA6wzCHxhhfCQvTmSJ+D+SMHMCmq0bzjP
         b7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CR+1wQt05yIfbzYy2NzsdTF5VaBo8C6ok0NyR/w15ro=;
        b=HLHPXnUYBAfWk+pP2gUOWWdRdS5YGaEIepq95Wg3gMgJ8CLzFDpI6YFnfXIrG+ehF+
         USIK07J6ScQOGblbLPmtBA20Dp2AqYDPanUqMZJ9d0GiC8/l91AEOxpO3g5uzUbe28Mi
         1rWqZiLDL3Ohw8EFHgaOpHLUs9ZubqDWe+fPDuZ+aLE34lZYIOrY1uGAWcWtnKkf5s9P
         ptlBlbrbFY2L/pnl6Pwn+DcZkGTRhVaRwHSDbkZw//BizKCub9a6mdlf1eWL8i7nC0TO
         xKGx1ZjB3Q9RjOQqwg3AQOEC/N0PnS20HNNbinu9HiIzQ3kerk3w2F03u3OLapbaHDen
         5pcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cM/+/ur4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020ad45aaf000000b0061b69d0a7d5si1831952qvg.243.2023.06.02.19.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cM/+/ur4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H78-0001F0-KK; Fri, 02 Jun 2023 22:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0000YY-7Q
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:58 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6L-0004ov-P1
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:57 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6af6f4a0e11so2507709a34.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759683; x=1688351683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CR+1wQt05yIfbzYy2NzsdTF5VaBo8C6ok0NyR/w15ro=;
 b=cM/+/ur4rjw5nqT4msbq5UKx4MSGFppNiSsdaZ7S3gi8JPQhIGu+h8a6FWfzbKSzK/
 +SIigdwBr+Qu2wbsiH3TmI2V54fOCAfsW2L7q+RwUqwpp2UrN0aEnvcwRKocrnh/EEXJ
 QfAnfJZ8jva07HBH7V+enleV1UB30XuONhTWxuluplKf6gsGfY2dP5sCVr4o/KbPl4mS
 rWLn/KxJbcE28WHHCMTTTxuAyXuWOUNw5LDJ4HuOGtoDDV+3jn0TEFqh6+aSjRTHrVbK
 wLjdP+MgH1b6G//XnE3y9aOXBWljBZZ6aOm21k4TuqMvq2/32JDnd4DJAiVTRnKkxReJ
 etOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759683; x=1688351683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR+1wQt05yIfbzYy2NzsdTF5VaBo8C6ok0NyR/w15ro=;
 b=iuGhPvHP4XBR5PH1EV5WkUdRYftMB+BrgyS0kovMDJ6IcDBumFd4dhVokWQ2le0z+n
 mwmXBH9t9lEXuE6m5SiX5nIwFO2HmDA9DCGSM9QuBUonOEJYe2j84YK6oad9cv/IYInX
 WU5mwjvWIGTea3Wks524Grcou1+X+bAeNOqGE5XIUlp1b2uEFb6pVkSFs0yHEZYC4/rJ
 JPGJgDSr+e5cZNV0Yj1LKolnEAJvFWIyGfhO33lxsc0k/zUgLRwHiN4xMqS0mVyEjFwk
 npVkIlZ65FO3OsonYtNTWcwzESdGj96pyCPZWrPzPm2pMi4DAKQ6fygNmjZodkLHnrDt
 6hEQ==
X-Gm-Message-State: AC+VfDw+Sho0E9Sf+qY0V6AMiSG8XwgDid80h0BaPsBP245+/t9Wlwb2
 neRq7cCLuXQVXbDPvCohMD7xiJ/CF4MHG3tWNDc=
X-Received: by 2002:a05:6358:4e24:b0:127:f3a4:f484 with SMTP id
 cf36-20020a0563584e2400b00127f3a4f484mr2590129rwb.2.1685759683225; 
 Fri, 02 Jun 2023 19:34:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 18/35] target/i386: Use aesdec_IMC
Date: Fri,  2 Jun 2023 19:34:09 -0700
Message-Id: <20230603023426.1064431-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: x8gSdHGk0RJU

This implements the AESIMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 036eabdf95..0187651140 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2219,15 +2219,10 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int i;
-    Reg tmp = *s;
+    AESState *ad = (AESState *)&d->ZMM_X(0);
+    AESState *st = (AESState *)&s->ZMM_X(0);
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
-                          AES_imc[tmp.B(4 * i + 1)][1] ^
-                          AES_imc[tmp.B(4 * i + 2)][2] ^
-                          AES_imc[tmp.B(4 * i + 3)][3]);
-    }
+    aesdec_IMC(ad, st, false);
 }
 
 void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.34.1

