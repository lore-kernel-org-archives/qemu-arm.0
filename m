Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp655245lfr;
        Fri, 16 Apr 2021 12:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj/mdzfcsEzicm02M+Zu3Wvxq81N8f2HLXdgB6qeTPPAbj0vs8FOO1WRRFsWSIxdItjkCl
X-Received: by 2002:aca:5755:: with SMTP id l82mr7513864oib.37.1618600171741;
        Fri, 16 Apr 2021 12:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600171; cv=none;
        d=google.com; s=arc-20160816;
        b=gPeHu9jIFG96GBmIa81mb6iVAPqAun8QTbS2gbhocBUccTouU5R4POOQX8ScC1dBC7
         BdFaCq1tVX+x8BxhX/BB4k2cvJeKl5EBgN1VDFDcuDsU39F6sMPGtKiLzcki5g7f5VaD
         vIf9SrF/wLi0yiq3YN09+bGUPaOfCjZkyLPN52NnmPNIy1+nNXvFU6q/WSJlRr7LtM5k
         t5yb/UDs70aqNXVa+DecTSPuCKhyaMaCjEMb1pU+xAEOVlcpIPgGPN3cMzASVb1uA/ym
         QaZR3BnIaAzD/cT75GjoKNgiTDZycoqMWfPRU7hlhOhWAiiM1hSqntXU1fACiFLE5auZ
         Ttrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+FqQpeZX2hPehb5y76ZqDzt7hc+HNgslVIaYOGp2C88=;
        b=gNMYCDbm0JRqtu7AEJTOfN2KWegsdZJbh6Fn86DjI+3XA6p80WCNXNrv5x+1XOu5AF
         sQfFgFyyWD2WEJsTr0SIO4k9YxddB+nJI/qABBsfl91MYaQCLvbsGG9iR6ZswRjVSnx7
         E9Wg4iTslxgKUNyShQRq37kvOe3pUuFEWwJlwn7Ay+serCnJYqgEaOOEn5lSxys0HQgq
         cxt8NS1WawK53KBk158qdnHJi4urBMhGcqUNh8XzB9FxgtDeqxyoK8/yaZjMNYCmVSOk
         m1KcV6FvMKO+Yq16+PwCHyFX49bMHHPZ36OTNs2lQKd6m5Iv7PWDWntNwMnksQbGxnR2
         knyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYMlRlb9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si6876937otk.82.2021.04.16.12.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYMlRlb9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTqM-0005mE-V2
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThj-0003jK-8i
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:35 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThS-0004KE-OX
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:34 -0400
Received: by mail-pf1-x42f.google.com with SMTP id c3so138851pfo.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FqQpeZX2hPehb5y76ZqDzt7hc+HNgslVIaYOGp2C88=;
 b=VYMlRlb9R+lOpaDUhAl9oTRyFpcqb9ok7Ddxa7eEr4DRVjxjskH/dA7evgvGytDWml
 6D6F2WqNSjK6MDxh6jIkXdncxg3SbI+/UUCEq2Gwa85Cmm3bTQ3Il6MdVTutLrH6xQHO
 OU2VhmO0ef5/DWehCPF8VDkAHbhpDloKt95iSebHL4L+IHPqywdmLEV76PbM1ZRn/Sf5
 YAW8e5mzmr1xaaBAFirmwMKGBM8AAOoQnxEz8pyB/ZY3o6RoYOGmS5dfg1BWsgF3PYWr
 ydTo49zGEsY3Xp6/XKsEGRl0vguR0eAuVzoA3Slspb6/Er9TU0AZ65nexFp+tF54frm6
 ByrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FqQpeZX2hPehb5y76ZqDzt7hc+HNgslVIaYOGp2C88=;
 b=Tk90tjKAhRZeyX5Qjt9HwRrTyeqi3VhjsM2iRB5uvxZMH6gqNNpsyKdcrMDXjg7AEv
 kmErFjVnfAuZZKW9bhPSaTEejVsUhc0vjGrB0R2jm21J5lTK14KiSbIS8x3e43Fb8aZN
 O+OgOhWlI9mst7KeuShInx9HO59cqPvXl4Caw799fxqlxzx2VYOld3fBmLTctje5qr3p
 jlGXgzwAbNH2aZp+5dRKvR/hZOrNy9dhiCNio3kwK8DMUSLfW3kjxfbVk07Z5DWvncnT
 2CzebfBqKhBUioI4WKa5gh7D2qaA4w91Y54xh2otBZkxkUbLmRJw3gH9FrwQH5IK6+L/
 eCQQ==
X-Gm-Message-State: AOAM532kyFcUn5c3EOJc2vaQtFe1Q2iXw67qZjwXrA5rsa8JD66f/tIi
 /j9Rvgmm/f85jITu6+ij1cApLw==
X-Received: by 2002:a63:f715:: with SMTP id x21mr440994pgh.399.1618599612108; 
 Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/30] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Fri, 16 Apr 2021 11:59:41 -0700
Message-Id: <20210416185959.1520974-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YoeQWVSQhITS

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 91a19bc4f4..52b9ca502e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1

