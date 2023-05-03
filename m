Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652976ejm;
        Wed, 3 May 2023 00:09:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64qFQAgcG+OFU2SdE44RcM3seDfo+nV0vszIjmhZ82zShk69YI4h9dSCyzp8660fyZ3rYZ
X-Received: by 2002:a05:6214:411c:b0:5ef:8c35:296c with SMTP id kc28-20020a056214411c00b005ef8c35296cmr8729705qvb.44.1683097784586;
        Wed, 03 May 2023 00:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097784; cv=none;
        d=google.com; s=arc-20160816;
        b=RojYMZZFpyFmFSbMzAwd3Mq8Wpt8HD5FDMVQJzE8UtuiANIFU//x3N/gJ4k7fL7sc4
         mXHkXHOmoXFEZwotFX1M4GMHAMCmUb3DA6odMKDQO9CxaTJ0CdjMG0Eq6EOiwqjIKDKr
         FDXcbIMRtQlcglhPCH2GCfXRb7NWE2cHIar6w5Ub2V080aFVadvoC8PmJea/Ixt+K7eY
         ez/zeeinmuCRzX5cnkOeES3xvkRRUmNylCLk654Elucv4vyH6vWX4/sZ0TDss88c5Pxt
         Utxpas5toZhcJ/a2xZ2GcrQP55q5Ej1gqWt12VwAaiG+oVdznGtIIploq/fThx5r6tYR
         kF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
        b=02K96Wdi9Wm75PcatwYC9H4knqg0QH8CfkB/c3KEGnIbjVKZCZ00HQ84bACH8IPUey
         AaorHuf7GiaUrqzJ7WeI0NssWb0PFHH5LRc3YUk521N5CDzhBB8mh+EoREQeSmWZwWAy
         5rnKZEpVV8pAexpzxUEKtdudIwuPMnwj9TeFa0SwX6juITFFN/pHepgyhb04KoMe82ry
         hFAxdSP3glZUqVNbvmVAE3/yWCQjKoX0ScW+9OQtPyn02P3yXoosA1UeVJW9DKa+LiAm
         1/Lq2OVHJaFgktOVZiUIgcyl0xr+D+uCKBK8bDttWsBoFgbk1ymslwEkBUJWi1K8gg74
         DkZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQZStCmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a0562140c8b00b005ef70d6a66bsi18044070qvr.146.2023.05.03.00.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQZStCmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bi-0004cB-Sy; Wed, 03 May 2023 03:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aj-0008AK-Vr
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aC-0005p7-ST
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso29995975e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=DQZStCmfpITqXVoPKKs046wsCDC6HKbvcDtAnqC7TguHvFgGaIT2G/NeXwws19QZLw
 gKp+COQvhNBrVGbaAUqbiS0yMUNLqXFk2ggkvJQ0b5oySg4ZcV+nI+5hh5Rrn5IapeYV
 sEJ0d3feP9kFdq3cFTXVJpOpvd8QJ/pwn5aDJhLqaS+ElnFBT/vEmOJd/HY0yd9tJOCA
 XHhgKMR1DToVJIY2MWvOB5fW1TJCC92FaKjmih0D9PI3b37b+pstBxjc/WCpPVvo5/cB
 7C9IrOWeXOQAWPiLNQsNAQqOD3Z94t0hxAA8/GImAQHo/Ho4A8yrx8m8/mrRcBdKSyoz
 VRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=f0O+esozHEL4vkFpHRuUhsXLtsn0WhUNDIOWPAH09zCxDdIU7KZ0hMOlqwE6n2Ocm9
 kiMQZtn/sWk95EHqegZgGTccoPq8bdAaNqHpWi/aFUKO0h8qKhJS5F6uMBa13jbhTrwi
 gV1vngcTQS8acSUeMnWzdO/H/YjiXkoyTclAJMOJVssnjAQ+ZMhFWB29fOqycgMBv640
 Zgmd15oVs1LQAYoJRJptWaKXXqAbZ9L4rT7H3uF6ywHlrNOoyVxcmDMxxnI9TEyuRfvm
 U7cTtPMtX5RaDWLjSv+VT7sgvNHZ3tuoPNkQYY/i3WjJl3hCXq5xqd+BPaUNVXcARB17
 pmuA==
X-Gm-Message-State: AC+VfDyqpNWs/c1M5n5vZGUS1UObFZZAEN3OG4RSmbjUXZepiHi7LkQT
 d9Bmk4jz9VlqfY6vErbq8IFSmg==
X-Received: by 2002:a7b:c388:0:b0:3f1:7bb5:9d71 with SMTP id
 s8-20020a7bc388000000b003f17bb59d71mr12991250wmj.33.1683097642518; 
 Wed, 03 May 2023 00:07:22 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 33/57] tcg/sparc64: Split out tcg_out_movi_s32
Date: Wed,  3 May 2023 08:06:32 +0100
Message-Id: <20230503070656.1746170-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: YN4wUKEvlILF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e244209890..4375a06377 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,6 +405,13 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+/* A 32-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    tcg_out_sethi(s, ret, ~arg);
+    tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+}
+
 /* A 32-bit constant zero-extended to 64 bits.  */
 static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
@@ -444,8 +451,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
-        tcg_out_sethi(s, ret, ~arg);
-        tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+        tcg_out_movi_s32(s, ret, arg);
         return;
     }
 
-- 
2.34.1

