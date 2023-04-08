Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp651241ejb;
        Fri, 7 Apr 2023 19:52:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWjwYey4vgz9IvCQO97c6/gGajMIpM5+7vo2a7EGo6RaQakxBCg4B8vgqXAU440V256JCI
X-Received: by 2002:a05:6214:23c8:b0:5e9:752:766b with SMTP id hr8-20020a05621423c800b005e90752766bmr2123974qvb.47.1680922327674;
        Fri, 07 Apr 2023 19:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922327; cv=none;
        d=google.com; s=arc-20160816;
        b=hXURAALpp4BFQF0wKnsHqbC6PxZb1nYDlCAAeLx1iJMTGwHMho5zMD4rDfQ3UDnoaG
         RmP8GPJKf3Z6y4rSWOMSDFPBOiOdGum1n+hGOHTE4vZ0vMKmoo7fzOcQK2SuYzjEpEGE
         DtR3TFE92KpSujVpVelwcs+oChtnoObiIAqpymIKYSBybC1pL+1I02qXTXskmTwQm+wG
         hSfpmnY3drRPlQ0H/uPYhrJW0PtunKmRH52vvOsgpipcsQOnENyN3wL1Y76h9epZpztl
         XHU02SkcL8TBk+riRlSXQzZUnRF7LSuUeTZLp3p7wgHCbzgRDJcvct6/lokcj4HoCzT3
         vs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
        b=1AOKaBHditQOODjltawfhXCIyg+UaSrlY2w+93D3Qs+sLjS4tQAvyO/tbmLUiwkyr1
         EmTQsjeB1Tv5Ll0cVf0LXywv8+lEmJOA0gALjIsaCXHDhDaGnBXfve9GnJx+ly0BKa2e
         awyrS2zCGLl6V2s/eT3GqZrvOFrPdfb7GFYrlHZpw92bWevwvbt6nh2d+eHvTgM2K9Nl
         62o40PPOnQXDoTzslosz6DwFEQQwHGD+PHBMMcjJ/F8EQsbx2tVRlA1MHEHEvibCuoXb
         QPJLlEDglk3r+DBCVbp3TNZ2GwXikOzwXEYYD+Mr58hz/nbtwwLGWpQU895eHmiHp98+
         ZNEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6r62+fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a056214076800b0056c21c9348bsi3755224qvz.586.2023.04.07.19.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6r62+fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkybX-0003vJ-7h; Fri, 07 Apr 2023 22:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybT-0003Og-Ax
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybO-0007nU-NR
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id b3so248403pjq.3
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=z6r62+fR/fU9gnjqCuewDYj2jsptEwsSt4+1T3QR6Pttrr7zcQPPNZZmje0/TBUugf
 9BkCKiFn99uTcUMXUYS1MrzZUMTbsIipo5TqrX4p7VSyZYtZe/or8P9wusfJN2QpeM4p
 HfSL3YGo6j1AtrKOzMeWUwLl2TmJLfGvJyQVzc5+C9H8YrGgphA/D80LHTgE7ApfbVwG
 nijMPLraV/rKqToM6REOgwYIoHIQ5bpCrRpx6y6AsoXRPBwP4Dspaky1pHirQ1CalHE4
 nh0NzDTIRXSwqGV4zu2BlkgNO3fKHmvBzOz2U7EIqr9bR6m6zLI1CPZzrDceOLIJqvjG
 umJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=GM9D0c05wwKw7ggkvyhyqSE/A0BJ5jfTSBxuZAXOvEnHBV+KHH1Marlp6DyCDzybzc
 xfc17blzpTqOiiwB5EQ0EwYj14ai22rovfbKhMhYjpQG/26HcKnQesr49ptDv4GLO9lO
 utsXjm0mOBCWVlAnaj9qr3xExhszdja+xBhkScw4dAR5Mzw9ltlMrKoQpEEDAw4pyP9o
 63eke89XvtVYgXVzcZYPN6EtYU3eWBtlgy8Ddfa3pxSI53gv5+M3Dnu3G1nTd7UHNuKJ
 832NtR+GRMGitqZBla4VcRVtZnJ2Oka+YYwF/5BJhCAs7fql+9f0Xxq5eB2MU8lK7LFS
 o6aA==
X-Gm-Message-State: AAQBX9ck5+oPRcyZh64XfThkiAIpLIb9rqd6kPJXCWaaxWkIv/hAIDA6
 kip6x9VWKxUs9bLuHBQMWrb0lA==
X-Received: by 2002:a17:902:d50a:b0:1a1:e39c:d4d1 with SMTP id
 b10-20020a170902d50a00b001a1e39cd4d1mr497545plg.67.1680922013184; 
 Fri, 07 Apr 2023 19:46:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 41/42] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data
 return
Date: Fri,  7 Apr 2023 19:43:13 -0700
Message-Id: <20230408024314.3357414-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7eMaWreBk7my

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 086981f097..f3e5e856d6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1

