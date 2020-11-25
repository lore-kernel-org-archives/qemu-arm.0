Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp156156lfb;
        Tue, 24 Nov 2020 20:12:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrZ/ka2uwEv1zHoNGxilBetATlxOxrkLOk8mwVpN6hiypxe8zTUJmXIT7DMVyomsZzxvDD
X-Received: by 2002:a25:7355:: with SMTP id o82mr1978803ybc.338.1606277538521;
        Tue, 24 Nov 2020 20:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277538; cv=none;
        d=google.com; s=arc-20160816;
        b=hioiGdw2RJvmKZJXXVRtQE76SiFrD+pKvrm6SYgL7fcT4WS8Qx++E83Jiq6evFFETb
         KLMiyNQSIjFdmyqNgiVrHitar8/hm6zdBxTCV2RpWtfwJVyC18mfzoFdfjl6hL08a+A/
         pAU1ie2fKC7DU5770NVbitvwMdBa3x+BlBSvPpp894SULhpmkdk5i27Yf0RZKk46WwGI
         aylB1PVFy4XQnjUcfriMK0PmRMTYeYvsa16h5x/PO+YUQIo0Ng05jmhVLh6lRJeKbtuE
         /MdkFDAs69yKqtTlqNDGz4FzHXJgF1dqba4R2Z1NwUggndgs6591MxSVK8kfdDHDAdDH
         tbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A0GArN05QL42PJKkh5e5g8eJMWLUKLJQ2bxbC2/N0XQ=;
        b=vwhelcVChqI57hSPMnkKehidfSmMQdeUYTCCyRsMJfAZ8ULv9ZbWf3bXAwuRnff1Yg
         dJkMO/IJeEQ6484P9zQRco3mP5AILOm81vFpVkqyH3SrDjS/c4tCvwsGvGWfh9DDC3Vw
         XF/DtMQzxm+hNSYmHshjDrOCuITorna2ZoDR21uw0RAkAQrXi8lUidpETEhIBtz0ztCB
         NvmmzSPDbHxdwr8MJNOV6o65H2mO+MP0H3fz2AEd4bS8akgC6wXrngTzZScY+ICntpOh
         YPtxXsHSQhQ4wvoqSOI11Tb/fTRePSqfqyjkvOig0D7lNCjFIE5V4tugABe4/Qhio8S5
         Q2sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaKb39oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n72si1020791ybf.122.2020.11.24.20.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaKb39oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khmAD-0004Av-Rw
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm56-00055P-EW
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:07:00 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm54-00065f-Mb
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:07:00 -0500
Received: by mail-pl1-x642.google.com with SMTP id p6so454201plr.7
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0GArN05QL42PJKkh5e5g8eJMWLUKLJQ2bxbC2/N0XQ=;
 b=WaKb39oevq8pC/DZQaDhKHTXB2Lkb16p2n10ECBRxvi2+o1kh2KvB2F53K7JbHYSqb
 A3VBAzXqLIp11BaYWzP24ORfgTB7cTSKTAiXgJ5mWaknBnZm7tON7dSf4x/M4Bud6g4y
 URl+gyuMteTjxczZEyKVNnJ9RwYuO6f2PNrKrgKVd9sQOsFBOWbxearUOu17nS112Bfg
 0uo1cQ59LccSCa22QW5CtcvvXEEYxN2oXpSDbmog4Wz17HJd24IqyuWK4glILR6bboof
 FmJsdPLzkgaDevhU0z5McDc0BEFuyu0tEqimU4yp6SZbVxoR8HJ5n2uftqgwvH/d6dGL
 fdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0GArN05QL42PJKkh5e5g8eJMWLUKLJQ2bxbC2/N0XQ=;
 b=o4w3JLa7r3kJ9bh/G9j/3P45yoDRDBy1IBJ+VDOHyKEN4AEBWHHBdHGWrymYpkjywV
 GsRdv+iwwW87OIow3rI8cne2qkWopB7Z5UKZKh19Ut5tPJiK0bRspaQlXebiJarm1V3s
 SM5R8aYwCXPDW4ielp6z5qd59rukw27gjyoT+tbXdZuPi2SJJDtKvWSXo7Hm6Q6zC82d
 iJr9/nu1LcKDcZGEuVvbagIGY0EI3furxtvXh0vua6ow1scZvR60EMjMW2wzaqDUxCdn
 TBsg1ExR14L2vU9ZeJ1JzxuHBcqg51gVNYSJi9QSGKM5FQU8YvCHOpOy0iQbsmOmKJeA
 lRLA==
X-Gm-Message-State: AOAM531TphVvK/6VJQru4snHEHz/RGYfk/QUwRZVau9d3VR2VHN0JgbE
 gvM/fQEL5eCL0zt+0hjae5UqhYNN//34rg==
X-Received: by 2002:a17:902:930a:b029:d8:ca83:3108 with SMTP id
 bc10-20020a170902930ab02900d8ca833108mr1637830plb.60.1606277217482; 
 Tue, 24 Nov 2020 20:06:57 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/arm: Fix decode of align in VLDST_single
Date: Tue, 24 Nov 2020 20:06:41 -0800
Message-Id: <20201125040642.2339476-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zlqg/beHMYGH

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

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
index c4be019d9c..330b5fc7b0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -616,7 +616,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -631,7 +631,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
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

