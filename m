Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104380ejb;
        Thu, 8 Jun 2023 19:28:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rSwOTHqCrZy0hIgnNtIBFHvgOwWF1WiZN+K4wekhgqd2xtJN890dHh94cJAhmZRx/Znz4
X-Received: by 2002:ad4:5dcf:0:b0:629:1659:dba with SMTP id m15-20020ad45dcf000000b0062916590dbamr359603qvh.10.1686277707223;
        Thu, 08 Jun 2023 19:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277707; cv=none;
        d=google.com; s=arc-20160816;
        b=D5T9SCKgbib1z2yaBq1EgorJ5ODBrgeuAYxQ9+Ky2qc8PKrs3ZajlhU8WfdN3x2cGa
         jONBS1HRM6jHfZaQBvqqexBKeBlAau/eZBXrxOMsapIZtN/ZfbL7LHZFPodJm4BZUl0d
         8RRhObxq8WCOW0qLDHedEIKOWjgqGov9pogY/zFNdlui4/ycbC8l9bKkJZc56bTspC5Y
         cPDMa+obgdq4kOV9h6m1V0I3mgjM3dlUOzov0MiSpD5XAGfMNGLOV4AfzRizVLrQuf62
         ZDuEAFvoOmzlZ+pX1Ss9gjsIqvSrpTvPksN6raoRY0Vb+y0IIJOk54xx2+eFLcDX5FKa
         9l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/wWEoR37K9gKQXXFZPMySJPPLhvqTL7g38psR7hdJt8=;
        b=pmRxt5PHsrEWsnGEnlRcrqtrkzrwUZA39icWBS4kXaZUYvnSVH9P/uSHwOdZsVjiwT
         xVnexW1rvWsez5VcHTb6hMVUAGQSlcWxn1HVrnWqKh9t1eQ7d+5S7ESnQL+RX3yjlGB8
         mQ3vc/k298vhcROt0lQeSFiQCuc6OIsKW7bYxAiehV0VIs+hxrco8YMb94yX3yWfVEzz
         nDXbN0uDjoE9LlAGqCegBY8LN/BPdV1uVtZseC0Wq+UkN1cyR26e9S4OxNnudkrtUAVr
         BHfrf4vzMU/i3g6ZFT+gV1kNAeyjlBAiRmndg3gE5m3UDdUAhTIfgMznAzlrLlaTkmXo
         /1Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=woDFIUod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm12-20020a056214268c00b006261c158af0si1667863qvb.237.2023.06.08.19.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=woDFIUod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rnp-0002oh-KZ; Thu, 08 Jun 2023 22:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rno-0002nJ-6o
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnU-0005cg-OW
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:35 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-653f9c7b3e4so1008774b3a.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277455; x=1688869455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wWEoR37K9gKQXXFZPMySJPPLhvqTL7g38psR7hdJt8=;
 b=woDFIUodVWeVCFUaXiri11M22BWOoEqik9IFVurNEiKu1T3EDLih7cQwPmf1Hve8JO
 kjLY05+lIZR4GuIL7oTsijbJbc1xf8xbVysV0M/2Ir4cWda8QWGHB8Pkocg8gvPezt09
 CeUZlMOEoRWx3emF+WlHy/bkxcq2Ecukq8EMvEJxCO70tdC8+u/kycYz7jsfuRcQ+6s2
 1bLBDrrQ5sW8ajXx1DvqIbjmBT17U6amTWFWJPIjD24vugaJ4RTBAUPkSPYrrSbkw7/K
 jUDrPnTFAWNjvR0rZ1cRDTrlHtsMWbXFbAkW1mHZ9wcJIR1tDWcFq+cZDhhmGZUHxwIj
 sYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277455; x=1688869455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wWEoR37K9gKQXXFZPMySJPPLhvqTL7g38psR7hdJt8=;
 b=eu3zGcvvD1FDsqn2699wRViP6i8PeGA6MrfsWTRbWuQXYW8bQTbeAz82QEOJrzdSF3
 iBneQapfNM0JctcrvASBvom1jMyMOMocEXvMojsCTpUAzxrLANwaGqSU2ZgKfAzbBA3/
 p4qpNeGCdEu6gSRTqnol1HZLf5SHTK/kpHXbXP7a9uRCn0v+kY/A8MqPFDlGbiGd+Sjs
 Zcxl8SLwJyc6D3TvYSG2tODjnG63xlxLNDLyLVfeTA48J0FMJoFRASCCS3gBuUTebLKy
 mNO4YFgOCDDaQLAR5uOFaAYD5vYfSIdM8PC67aU/ZxvagcT6j7rIHkBrWxE8Cr8BiPBV
 99RQ==
X-Gm-Message-State: AC+VfDzQtlbyO1jJkGhGPGHY1iXciNOL7XeDRsK7QbHnzLQtC1fkBnrd
 lGu95g/UJAmikh93xymVYU8QBA==
X-Received: by 2002:a05:6a00:1acd:b0:662:24ac:c336 with SMTP id
 f13-20020a056a001acd00b0066224acc336mr28035pfv.8.1686277455296; 
 Thu, 08 Jun 2023 19:24:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 13/38] target/i386: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:36 -0700
Message-Id: <20230609022401.684157-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ne1KgOalPBOF

This implements the AESDECLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 63fdecbe03..0a37bde595 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2177,12 +2177,12 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
+        aesdec_ISB_ISR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

