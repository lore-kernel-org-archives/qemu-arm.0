Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104251ejb;
        Thu, 8 Jun 2023 19:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rDrrvwM3AcmHgSehjqRd0K7J50B2F6KuPZD52TffgppsVvryq7zKFlt1/9kra3IFrGp2R
X-Received: by 2002:a05:6214:2501:b0:625:801c:5ea1 with SMTP id gf1-20020a056214250100b00625801c5ea1mr435444qvb.14.1686277676870;
        Thu, 08 Jun 2023 19:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277676; cv=none;
        d=google.com; s=arc-20160816;
        b=YWhADJmp7ZB4IiwmfCbBRW874i+CyAYpmibJm4gucfuOenDshPQ1fMsmV8EDVoJ3Be
         4AKXBZ0PgWV8Z27i4+yzuZJ5MoViuOfF65mC58n5tmPRw+y6Owj7LTky5cGeuDJYy+VU
         rSGBDt87vOiiJCnn3Q6OaWVLDPuvCXneepLPsXKY7CxKeWXXv3U/r0WOp2jQm+zk4JiP
         d2qytIndpkhVqjdDoEgfihp7Usipa4RuWY6OVCpJsrc/kGiJwzuoTikYvUi188yvtXPq
         fOD9Tsa4INL9Ky+ImDC+dY4nFYo08t4FMjmIqkP19h20T82GLsvnSLC4/1Q5HkNm+p/z
         jJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
        b=bgDlwbnXn5Wo1JC5FrPljYweoZy2dQhuK7M4t4CWXQzVb95yzVEJ4yuOfgzNWziEtI
         oVuNt+wNqb/1xhig6IllGqkd44GM82da+NzoUyhRIZ5W08PS28BS458I7XxZD/1dUa2W
         twU3b1x7bARmWmDETiJzQZIzfTerBEmaPU2zAFVRQExwlISDw0venZGEz7hL2TySqCGz
         jvJ7CsGKQx6yNVvKvVYM/1+/S1JotLgmOna6rPmpcpy4qhc4meVFQ5H4jW0Wu6AOtoE5
         igulVWW2kzIshv5w6ViYk4lWQVgdxrPQFin/gdo2CiBLRnq3ZVxPrspdYffw2uG1KXIv
         FkSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQqje872;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm12-20020a056214268c00b005dda9d0227fsi1638567qvb.596.2023.06.08.19.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQqje872;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpB-0005LL-7t; Thu, 08 Jun 2023 22:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoR-0003FM-9g
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:16 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnm-0005m1-FB
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:14 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-39c7f78c237so248526b6e.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277469; x=1688869469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=bQqje872dN77MdSkbXlgB7b5nBR/0+OTusCO7qmAaB4H6MqdcoWoZtNjlpl38qZMlE
 mucODEnqp4BjLqCz5LrnicHiGejOs2Nu84nItr0Cx1pIswZ2iwrFYToWW/5ci3iUdnrn
 fPoai5qI2amIJJvzpborpROiVmmXRXCIctP8i40bFtRn1NQ/p6SmWIlhuHW96nYh0VxM
 QfM0VNW4/Vuv5GcpEfJl5pHy2+50S7nMQ9CR8OsKxbyeTPJReND85D16l7LZyNfCgP4l
 ecXjcsGe2wXkb/vForSHQ/LqPQpaq8+AddOXozr56An/o4xiTiWhwhYXtyRk/kluUSZX
 v8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277469; x=1688869469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=l3XQpRLcWhEHC78P8dDaCPxG4fbtGmaKfnycPEolV3QJNbsLuktc95SaFNP2b//ulH
 /oB6EH90ZtVKebTtgQMpxR4ZE6/+f7k7na67uNQec0QtCd8HcEXxkM26ctkHDeKJC8cy
 qj2drneZdgSft9Kw9QqUhdUbRqvG+eqWFsYN0LS1PI668jHbxMGdvTVPNRyMJdanYmdw
 DXY/nUteHChDrOrqIrotWl1ve3iNMhasQ+O7DA6MJBubddnqZ/SsPgCMfQR7Zo+q/Gnf
 EZMXI3UdkcecTeAg21A01tv8znjGFWzf9Y2SCtYqzd/5+CQWwRwhUolH/IkF7Vayg1V7
 e1XQ==
X-Gm-Message-State: AC+VfDxQp2T6kvSUntKpNS53lNxYcUjHMx6LGR70FCrfsSBEkzQ7eiQr
 1fME6m0ommsgsyvl9YROvgyCBtrHQKMXFJQw81E=
X-Received: by 2002:a05:6808:313:b0:398:2b78:3272 with SMTP id
 i19-20020a056808031300b003982b783272mr279283oie.26.1686277468825; 
 Thu, 08 Jun 2023 19:24:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 28/38] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Thu,  8 Jun 2023 19:23:51 -0700
Message-Id: <20230609022401.684157-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
X-TUID: OzETxyWS9zvU

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 93a4e0cf16..a0e425733f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2162,16 +2162,12 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
+        aesdec_ISB_ISR_IMC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

