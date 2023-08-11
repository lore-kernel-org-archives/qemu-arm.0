Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649807ejc;
        Fri, 11 Aug 2023 14:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHeJX2UMEh2WoR0KP/0xnquKtuAljLH5iartfxJqWz46gKYtMQPTRAVoLIo9AgeO1woG0w
X-Received: by 2002:a05:620a:4155:b0:76c:c5bf:6b08 with SMTP id k21-20020a05620a415500b0076cc5bf6b08mr4225410qko.3.1691790170559;
        Fri, 11 Aug 2023 14:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790170; cv=none;
        d=google.com; s=arc-20160816;
        b=a9tA079Moz3cA1olCl6t8YZj2TwuUuzMbl1sfN3/t3DPg0aob7H8qjCPc3DIxKNpW8
         8Ah/KX2RIbb+1xRMMJLJB3HN6EwgN1rD71C1hMwSObJi3NiZeRMXEFgEM5sF2FIOlAOy
         0NB1kz4YikooBRi5faN5q6BpYbkEOQAH7rpjncO4WlEsovR4nMBcDnswxdQgDAUC2UgL
         ABc4W3eF9Yi35Z8k5sYCDppI2m5eu+ybnde0FXttReC4i8oBkMWxKY/niNge9AeOJdFL
         ldO8u4YkH87eLtAQ+9T3Dk9pAAH9WfcNzmlIVnr5MB2wbzPal2cwX7codS/s3LiZCzUD
         jsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TUziizuOUDp3zr/tYK6Nc+GQsbSzhH4p5nzwWQ/YUAg=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=yuoWcs4oG6otJ3Txyn0xRIGp1ZdnaHFlO25W1MVEziTaeOPSI1EqiGqKwEXiP9XLQw
         Bz/PsJQ8Y2ZiFAiLBIycN8GxodE0I/E7qf512P6KGtfMCYN+ceMbFJtqDA5kFGvN0K7P
         /kV9nxEFvJnnbG2snQuCatHeXIydvszeylAyYlSHKKsZoslMSJiQPHa886YMlMEn9l+z
         vvjjDSOaRIonVzivRofR3fxbtng+x4xxTJlgrkQCVSVjmkj1Og8iWn2+4+c2adw3X9ss
         oKwHPqVNLlfwb8w/f8NO+y2r73F5cTtCxCQRZcWX2INtLTiUYug6blUgxqzAIGTgLoPL
         ai9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFPGbTa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a37ad16000000b0076ca9e2bb02si2696914qkm.653.2023.08.11.14.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFPGbTa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsM-0003GI-QJ; Fri, 11 Aug 2023 17:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsI-0003Cg-QX
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00028m-Ls
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26813478800so1479271a91.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790039; x=1692394839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUziizuOUDp3zr/tYK6Nc+GQsbSzhH4p5nzwWQ/YUAg=;
 b=CFPGbTa0vWaNv4R3ujhCqZGrEUEqxmFfyvb9s1uznQa2IrkM03HwjAD5sk1s79vrJo
 I4XzbGDv+b6EfZVdkkmzq3PKqc0uStc89RaRMWqtJIhQr/QczjZCTQMXYAUru4CirYQD
 LNKbEIq7FJHBqs9CKy7FkvOZiNWqz6Twn3HoDVAmjM+2/fs8UNHwSFUswGWav4zZS7V7
 Rzxr++lTlrP+qIHtcQdc1Q+nb4/VwhZ7TN0XOAPebAd5VkW/kz9Mbp5ASRmGFR6DkFVW
 ULYTQgw1WtLr3M7BD5tbCEye1uGu7lukQ+eXMEFuxK2WHdvGYkrzr9y8iIhpqafPkIe8
 UEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790039; x=1692394839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUziizuOUDp3zr/tYK6Nc+GQsbSzhH4p5nzwWQ/YUAg=;
 b=BXxbwHSc6uUZGMCMuTI3meoOzrJKaRbhie0zUc0H0krPa48B6lXESfhNyQzSRljtp5
 BFAirY069WZuUbeoXvvZWY3zS/tn7lFufifrzvcwAMPPbSinzH1bvfdoMqbCKovqy4dT
 9zcJQ4s0uv28t4K9vHYkDH8IrecHh88ojFkoWXhETfwQ1L1Z7k+qmHaSiUqC/i6+cKKT
 anG3a8ibHlsWtRHMv02TLAqWQzq9hsW/Gn94m7mGvIBz/lKH87lbcuiyJEfNW5CgpXnb
 ZUIELYAyD4M3pre5BI1jb9GW2SgLMq/ATKov63c6m3mfbVow002js9lGMFwsdGALhOqS
 W3TQ==
X-Gm-Message-State: AOJu0Ywk34Wm3EAIL3TWKilWC/1HMZp4i4h3/qIfnm27QGhqxFiG3KXf
 iDDdJs60dQr/6EvgD10zpw8csg==
X-Received: by 2002:a17:90a:fb50:b0:26b:365b:e59e with SMTP id
 iq16-20020a17090afb5000b0026b365be59emr841527pjb.26.1691790039105; 
 Fri, 11 Aug 2023 14:40:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 07/11] target/arm: Apply access checks to neoverse-v1
 special registers
Date: Fri, 11 Aug 2023 14:40:27 -0700
Message-Id: <20230811214031.171020-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vgiTYRsFBU8s

There is only one additional EL1 register modeled, which
also needs to use access_actlr_w.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index bc3db798f0..b0cac05be6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -560,7 +560,8 @@ static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
 static const ARMCPRegInfo neoverse_v1_cp_reginfo[] = {
     { .name = "CPUECTLR2_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 5,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "CPUPPMCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 0,
       .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-- 
2.34.1

