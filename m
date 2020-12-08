Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4232008lfb;
        Tue, 8 Dec 2020 10:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+O2Tu1LOU3mAYpS6fdkYvpMRkNORJhZ3kGgKhc02aR68UcS1vlJ+L7ttRES55AOfbEb8T
X-Received: by 2002:a25:aa91:: with SMTP id t17mr25794882ybi.394.1607450512973;
        Tue, 08 Dec 2020 10:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450512; cv=none;
        d=google.com; s=arc-20160816;
        b=WtbTXBBIcsMbCsmwSWSl0w6KGfqlg/ki/rJxEMDcjGIAIz7cDU/knbheRXH04jmxAj
         3HMFhwlaVFbjlCRHl7909E+vqFkgQ65IVk+Rqzs+PHg7iDjc+zhAFEFFnPJclqF+FhDb
         2Ckq8oJ+AtWM4/hAdkOXujc4ayunws/ZZK6iTq76b+DaKuNfyFHu+dZl2tghluJUud2g
         YBZhJC35RF6rJk/2fZ1IfiMvLFs8Q5/ZoN3zXVtBLvyE7MyoaW/RsZE3ImYteRbpXefl
         M5vGXC2KzBM4InxFWis2YWy9l16Ok/jMv3QAV8rtKTLnF1JEZ7i8ZD4ocz7O6368BYLX
         rofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
        b=G6007h91x5vaj8aW5s5Yb34J+4EI9R+XNg2BI53h3aDGfQ3OGF/szNBZOq9MGxIW5a
         OB8QbVV6lF4xTGkfWvXTIWQ/CXZxY/nc7j2LFXL3zmc6LG4RRxWk3oON7MTRj9b3UlLl
         uhfs66QPMXQ6QST9yyj8r/ykCdXkUVEAVAn0iy9zkY30MB1C/emnOJn8KupnAIgMyKzq
         8wEMutUBsnc+iZLinaLZ2U/ntwtqzyRWBskG5eJK6+lRPr4w89EgW4YGKyZA2nNnKXXc
         XqGhPMYtQswuKlaAx7jC7ksYh6kuCm6p/rG5Ae+VBYlUM7wrElr2nKDsPZIOR7w9y2Yl
         UN0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MEyfdmHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q185si14973075ybc.453.2020.12.08.10.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MEyfdmHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhJA-0007UA-3O
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIk-0007SA-LM
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:27 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIh-0006Ju-U6
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:26 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so16650592ots.0
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=MEyfdmHyO5ZYzYpavTxAJgaKdPXfX0uLswewoIjU7PV5ffg2kHSDQLvWX5AOIngtdV
 EGltvz0+Lu9jW/ILjtYAHvKcHJA0BDOawSzUiJOdt7b/Wbe0xJioYpy6/t1tcfY1kMEB
 ipWbwChENe/xXJJF8IZvm4Vj9lDYkl0UpIjTpq/QZP+TqTWhLWZQe9BfThCufKt79PdW
 KRQuMGERdePhh0hQ0elY44i1gmzNrAtHgOYywR+AQuCaaFyQJlxd6A2S1mKNP7ROI/tO
 RKkUSZtv+KLj/5YDcONEaNI6qD29desxcsThKTQDzqvJgSNG/jJlVW8R9v2vQiZQ+yOE
 KIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XIA/+X37AvNazV2jisISm3ZiIWDvYr5zvekcj4Rlqc=;
 b=KpnIh5yM683pkDWLG9ySpIb9BE0cBkrDuiOdk2SQ2BrUcdVEgX9DtUc5uDiKm+Zb3M
 q5iLPZhcCGwLkc6jDhvwik3/WtYbEEOZzSBRLmayKSM0uZpBB7lPYsh5JlN+f7kJkL0U
 OPJ623sj0+AW8v2A+lSTKnz8/YhVmtAJJaCayMoLk9qvxs3fig3WNk3Gg89vDUILjCp7
 DrWe2HD60A1goNt8SO3+F63ijcI/KcjqVEIStojEkZnGCTweg5goaJ85eMX9crHpfSxm
 hP3tqY5nmL3g4DM5h41LG7tagrz9R+wzy30c17qiEZj81LQ4riuZ18xUHrL47V7XBpA4
 pZQA==
X-Gm-Message-State: AOAM533ilYUVrZKr2GSKtQm7zj0haL5uKssZt5sPIW8RA0aGwJtCtkGQ
 wpeKwWIOWWlP+A2hOAnqQ4yWDw==
X-Received: by 2002:a05:6830:10c3:: with SMTP id
 z3mr12056061oto.143.1607450482176; 
 Tue, 08 Dec 2020 10:01:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/arm: Fix decode of align in VLDST_single
Date: Tue,  8 Dec 2020 12:00:55 -0600
Message-Id: <20201208180118.157911-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 80VZodXcHxW9

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..0e5828744b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1

