Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1000387njb;
        Tue, 18 Feb 2025 14:22:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHZJOausG7Mob0e0DptpY/wbnw0Xvb7lAGSS/Ik4YaCrZpGdgTltcEFPB+QpERu8H8Evr3buaWy8kd2g==@linaro.org
X-Google-Smtp-Source: AGHT+IFgtfPuR4Mf8cX6CdN/+EwN5ADPF6CKR7K0F92AzImW4YXL71uH+3bTuyDCtvpm8MA1i3gN
X-Received: by 2002:a05:6214:501a:b0:6d4:18ce:117f with SMTP id 6a1803df08f44-6e66ccd13c8mr215128506d6.20.1739917362820;
        Tue, 18 Feb 2025 14:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739917362; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMq6/QxxT5wzZIb51Ft/OmnD5Mlqm3bUozhrLyB+sB+cI88dz3dkYG/ZisNi4VfCQr
         LBeatkZ43SSzW4Vfr1V1lgW6ER/XNsQbAkoAwWCGi/M3BfraqSYvgs/fX2L12TIV5dzy
         y/XajvFXIpUUmlQXf03eUlYjZwF7wcHUlnmGSe3EAMqkdA0kMwYxEYz2M9ReK6yCozWP
         glExNfdYIiqbdElKikZauilwwtCXI8J40VN9X5EMt3KKW4cW6Emq/RVC1WBi2oLpfZEh
         3Qbp4rNIiU0I6rTkB+sJtuDTr4L4Co3PLjnlsy115iTXqO2rHe11Ji+uojDTgIKArqRN
         pflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=YzyMiiwDnQ6S+QqMo6hPoD3cO7L/FwWaN/5gyzhjYLI=;
        fh=J5rK49AvbqWd6GqL5OV0utShe4OiV3iZ48PVDD3WoNg=;
        b=YHTmkuHxYd8+EdbIebHYHFSkvJoW5SFaIRM1OSEGSGjX+it21bJBlnZlZPyuNfjvuK
         EOSJX6/9vtnqxYGIjULZS85y27cSMYh4FxBl+as6liUkEa6zCd2B7jJdVI1AeusycAmA
         TwzvhkkON4TyAAxkNSG701+1bye5mSeELUgavGVLN/9j3WE86EaWweNudgGfn20ib9+9
         DghDtuQike4cukGNR1PKwBe59jHhAs/cvDkrj4CDH3Swe14tzDuhPfXLRL2/K6f+Su87
         7Ex5OOxVH2L7EnnHZUyn8XJg8XKo9Dja0nOJC5qraZ717Mgo6ImSjJM2gCyuuj/YK2YC
         L5/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cvple46e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c5d4dsi112792746d6.420.2025.02.18.14.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 14:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cvple46e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkVyy-0001kS-BM; Tue, 18 Feb 2025 17:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Fgi1ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1tkVyv-0001k1-G0
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 17:22:21 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Fgi1ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1tkVys-0001jC-DP
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 17:22:21 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc318bd470so9007264a91.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 14:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739917334; x=1740522134; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YzyMiiwDnQ6S+QqMo6hPoD3cO7L/FwWaN/5gyzhjYLI=;
 b=cvple46eI5iib2qTHaeGmqg4yGDjzG1/vTH1lsJ+Q/8hObMypkFbFyhrNct2kZKd6N
 ODZwD0SZtVLdGqE3bZ0kQYeqaD0jTT6hdCG+dPZ0sU1IY7dt5yExYU5pTyHGlJfkejfJ
 PYu/vwkLRgRQj1gYHlU52GNMHPVxMPbkxxTM7s+mb4h1xSR1s1pvm4Q9TNocu9l8JYXy
 Bmlg+O2dwhUceLwF+lf3a4V9sCKO7okv8ea5V+xK2vDGgpyWxn4mqDMPnAUwSbrlURoA
 xZTT3lNgSJUwRy+GlsNbhdKf//okSH0Sx8JLnOiANmzuWw4Vlf/6E3shM2Qa5CMZEiSv
 6DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739917334; x=1740522134;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzyMiiwDnQ6S+QqMo6hPoD3cO7L/FwWaN/5gyzhjYLI=;
 b=CRREYaSGoUsLqQHpVr0u6kmLfmwJZx/eLQtUDDYTqPiikuYTrZEMz4Uzo56XoVz7Sb
 ijSkoyakjJwxTbAru/Ko9o33ynYagvejwQ1mqeVW+2B4Ci/Tc5URIFjMWO2EZ0cGSyJG
 e2jfqs7jWToFq3jvbvLF7T1hmi8bp+4wsKcERZhDQ7CuEOtwGYw00RkDy9ax3lrybUN6
 6hPj7dFdo3T56bh9Mnt6GODaaKU7t/uoKie21VGjYUKQY0nsXdXNAAoi8pUBqoYw/VX2
 NYa21ESYrqVhAKVMp2+2HAIPlUVzzN5sdgxJE6lDuEjNSrUpul62lH7mQa424myPGUby
 MQXQ==
X-Gm-Message-State: AOJu0YxjPfJmS3dIs0w0mraFL5+bCu39j0HZH4OK68kcQ6XEHNnpMNzL
 Ftw0WA1XkZcp4zZuMysyEqNFnVJzYRt3321i6+iuYkNh7bkW5qmiHFEcMLVqY07kmWwIpO+egvs
 HbBZY27mqmOUt38mCJQ==
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:2f2:e97a:e77f])
 (user=slongfield job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b4d:b0:2fa:226e:8491 with SMTP id
 98e67ed59e1d1-2fc40f1027cmr23084628a91.9.1739917334128; 
 Tue, 18 Feb 2025 14:22:14 -0800 (PST)
Date: Tue, 18 Feb 2025 22:22:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218222211.1092072-1-slongfield@google.com>
Subject: [PATCH] target/arm: Fix signed integer overflow undefined behavior.
From: Stephen Longfield <slongfield@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, slongfield@google.com, 
 roqueh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3Fgi1ZwoKCD8tmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: p9ymu/muP6HU

The problem is internal to t32_expandimm_imm, the imm intermediate
immediate value. This value is sourced from x, which always comes from
the return of a deposit32 call, which returns uint32_t already.

It's extracted via: int imm = extract32(x, 0, 8);, so the value will be
between 0-255

It is then multiplied by one of 1, 0x00010001, 0x01000100, 0x01010101,
or 0x80.

Values between 128-255 multiplied by 0x01000100 or 0x01010101 will cause
the upper bit to get set, which is a signed integer overflow. From
Chapter 6.5, paragraph 5 of the C11 spec:
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf this is
undefined behavior.

Though this is a minor undefined behavior, I'd like to see this fixed,
since the error is showing up when I enable clang's sanitizers while
looking for other issues.

Signed-off-by: Stephen Longfield <slongfield@google.com>
Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 68ac393415..8770f0ce1c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3508,9 +3508,9 @@ static int t32_expandimm_rot(DisasContext *s, int x)
 }

 /* Return the unrotated immediate from T32ExpandImm.  */
-static int t32_expandimm_imm(DisasContext *s, int x)
+static uint32_t t32_expandimm_imm(DisasContext *s, uint32_t x)
 {
-    int imm = extract32(x, 0, 8);
+    uint32_t imm = extract32(x, 0, 8);

     switch (extract32(x, 8, 4)) {
     case 0: /* XY */
--
2.48.1.601.g30ceb7b040-goog

