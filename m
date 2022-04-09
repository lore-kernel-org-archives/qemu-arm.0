Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp172031lfq;
        Fri, 8 Apr 2022 17:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqtt3UccaiE3uXtx+8Gj0p1lQakOz3HUjK0mafWJTU61O/TgKthz1FhHlcWhoe0c9Wpy8Y
X-Received: by 2002:a05:620a:1aa2:b0:67d:1637:7a9e with SMTP id bl34-20020a05620a1aa200b0067d16377a9emr14637254qkb.680.1649462987027;
        Fri, 08 Apr 2022 17:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649462987; cv=none;
        d=google.com; s=arc-20160816;
        b=awTntr9j2t7+LLaO3ecW0wulIFxcKy6tgQ4JtzwdkiIhYTZZ55MaIxy9fB5q0qjlru
         x2coczuCSAdFER9/EvmgbceSSOgBLesVcH88EzhPdPvI85KiViq9udOBNq9gHaXuHWka
         k1ztgdfE9Yan2wk89NyD2cPIEI5zgZPD95JYwTu3RzKq4xdtSuFx3L/QV7wNR+qJuReN
         g5v5gQDYFhbNtjHARFVDHxFppFOoXxA63k1gn2UzgeT8CurryKVafRUfbRVCn2iV7KlN
         bSxq9LHxmmjgtY56mo0doPVBrY4BMh+0ImDSBzjH4VyhWgr15E4eAHxVT4kJ1mWx/tJw
         o3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NUApV7x1eW6JanJ9cXe7CSNy/ZAx/ZG1Cq9BgRTELmQ=;
        b=pv/Xl6v3wEJlk+PAY5RJoO+WxkCHeXgqv28hrmwPwNUURtMAGne3tpuWnQn4zeI3iP
         vsYxaUN6iZ5WlQHpC+RCI/6A4TTR3LJRIAWQ7JD79C/HIfv+MZH8CNLszKPvF9O3tnxw
         KKaMCQy2xOOP83wQK+6B3bEL8Y7p9q37pBK1DxX72YJz2cgh2JXiEn6YJitoTMfAT1Ko
         R0QmszwsoR0ainkOoU6LPig87VohHhy060EowXm24GRlSS4TCqte/+5giSSbTZ2pbQd3
         LAbvaG/DI7BcNOLsiM/QzcmpSyHSYGyEXTakOyZArp/OnCEw3LjZTyfFsEuTHb9Fz5Yq
         sH9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gt2CXFXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ad45749000000b00443e88fa25bsi1312837qvx.362.2022.04.08.17.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gt2CXFXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyfi-0003d5-GE
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydx-0008Ub-9P
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydv-0003Ue-OM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so7966677pjb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NUApV7x1eW6JanJ9cXe7CSNy/ZAx/ZG1Cq9BgRTELmQ=;
 b=Gt2CXFXF30KiLt0/W5zjehS0Fj4PnPoedIauhr9xKRoUZIwlbJfzN92cCyTwlfDwHo
 ZHRFx4eRyrvuiGphqaCcKto5ZypyMhMHNrDd9Faswm/xLvyrdrlNQ7c+OIJi4oXWxxyP
 MXU9qv4rJyGWRITqwFsJ91rSDjKUuvmMdLbxUCqKWY0VoRRuRfh5ygAV7gbN3WEbPhnU
 PpQqHGTLzIOVlljhBRnD92AFmKp33D9Tq1zkbk6dA4Zoy7vpsykGlUZUGvGOoUC4H6/2
 fkCm8LkUj19zQ786Afj18EVrFwnHw+MSqziRHGGsCX77iEhXlTosEMjxlAHGYFSpDtER
 XM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NUApV7x1eW6JanJ9cXe7CSNy/ZAx/ZG1Cq9BgRTELmQ=;
 b=H0ycOXs21u8Y8FmAHXtXRt8988Ybk/pCEqaN6PY6/qp/HSDLXuE1V71OKm/4KAqRHj
 kEBYb6CGBrIy1YwTvkWBi3atSgziCvXqZ9rVWv+RBJAkM6Zj1mOuwh54Xp/T8HS+EbBO
 nzQMup/kTagzfV6rW7oYMyeI22K6JJYZPvlGpCeCtaUkrmvtGzzwlinNJIUJzhbwVbDB
 hLuxYdH8cDMc2vrMSgRFKuYZ7810euGiKeqUqYzHT08QIMULf31ZPx6KZX8pC7hqZarP
 k6hKjh6U2UIlSbnXzSikVBXkkb+pvjjGXZKCC4Zvtih6gA76nF7BviO3KbGfpXWnp5we
 SBVQ==
X-Gm-Message-State: AOAM533gIlB54dgi3S0FAQk3xdH/hNjBGaOfPsGL3H03rtWIJaF3hdbI
 xzO5HNs8gi4+ljqHxBqH1+7dcHjDjL6T7Q==
X-Received: by 2002:a17:903:4052:b0:155:fc0b:48fb with SMTP id
 n18-20020a170903405200b00155fc0b48fbmr21514473pla.27.1649462874409; 
 Fri, 08 Apr 2022 17:07:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] target/arm: Enable SCR and HCR bits for RAS
Date: Fri,  8 Apr 2022 17:07:38 -0700
Message-Id: <20220409000742.293691-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lbv4+yTS0xOp

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01f8558fca..2f6b02af7e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1765,6 +1765,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1779,6 +1782,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5289,6 +5295,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.25.1

