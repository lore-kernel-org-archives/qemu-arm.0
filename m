Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2888989ocg;
        Mon, 10 Oct 2022 20:35:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Jj+9RWJ7nFRsw1f/7FGwHtBkMJaO3gUsW6L6tL+iBZdbfRcoSBRk8NXfWUiZClKDU329Q
X-Received: by 2002:ac8:7e92:0:b0:35c:bee6:bbfe with SMTP id w18-20020ac87e92000000b0035cbee6bbfemr17845885qtj.468.1665459312471;
        Mon, 10 Oct 2022 20:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459312; cv=none;
        d=google.com; s=arc-20160816;
        b=x+ppH8S0zsvkZgB4rRWxNii1lv0fc4sb1FKHv+aEON7OE0plH3XvIdKKbzByfZg7Q0
         9NKS8NTT68BGB4PTs3WViFaH4umW4tG+QnNmhjDEDVXMlnwZm1GdUzwnr4r/JYvbYlBO
         18lrH7PEP84CazEB/9K7Z2Gcibr9Oxcp28JJ9+diYru4KmSOmWPK1PZeXKYWsn8ocE9y
         bDul5xgEqzlgUMPuuQeL6IBrfwPlGzVqOeqdJ/TlVjj9+kjoidxk+KAE3MhgJKrLSelc
         OqEF6eR1MtzSeBWk068e20FveSIcLHLvICjMX2R8fm4BfgH4RctaTuZq+1m0C/jPcBlT
         Y2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=keRR6yp16j9BQA6bMnZFN0sAd0rexZw5HE86te+F334=;
        b=lFb5EC1FgMuA1yVhl3UQSB0DDGhpS4WZf8GHWqVh74WRRR1jvP0tByw+ReJLZfxYiU
         lcfIwUWL0I5pVI1sH/fp7BpXK8cUTaS/O0eMU1TFJcTWVeEDlah5FjklO6w8em8NgTHa
         s72ZMU7ikobZdHOPh0oBqLSyesIqTEtbl3yJldW+2EWZHxuAaamwShj5pY+9APBXeD4W
         V+ossGuY2t9rMUl/nXfHpRLuxEt2s+WFSuhmL4QlsInU3cT+WB613GSVAH7eU/yyMf4V
         ZGpbOs5U/22bzHBtsqwduXIta6VYIrFOuDxLOXgyVvVt/39M6bGGysQIPoNLCsv7vHC9
         yx9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yp2y9LT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05622a199300b003563c1ec1f2si5931679qtc.120.2022.10.10.20.35.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yp2y9LT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi62y-0001o7-1v
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nz-0002Wf-Sz
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:44 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ny-0002zv-8k
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so14737959pjq.3
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keRR6yp16j9BQA6bMnZFN0sAd0rexZw5HE86te+F334=;
 b=yp2y9LT3fCkE9987AaqC42D7jjLT5NB4f6cIg0JcVGw7PjLIKgXPbHg57zKskmT0J4
 3C0+Ix6vsGMnyIRHStyMeYlCoQ3bNARz4tIwdVITumzoy+PbFQWY1zX8vqSGy665inCd
 NauQ3ipTgCY5wA1Mc4AbvVkjxN+HrYFkbyL7ZtppYHxUY4URZD0HR36bRAeFPYoNdk8B
 BxhRTinOW24HlrXt9ZKKcu62D1UctqMdsAg5yRJGTDEhyejB+dpOTDXMYmaiU6PDa53y
 SYQD2fLk1bRptLhqD9mzQc4xbFCu6HCbx+KIFBAbR+qkbuo/GsdqodWkY4s8PsYvluKk
 4/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keRR6yp16j9BQA6bMnZFN0sAd0rexZw5HE86te+F334=;
 b=tivp5WNerX1ARGmHZWVqesGCPnuJsWGG352/29SVVMyxIMMnmQF54bM72+6BoYNDF/
 SxJgl/iZkjsNH7br4SdN/eqIrQBLCpgoV0RUQ27m+ZnT+AUyblgXdzE/doiOTvUkiwdo
 lnWhgojxckaMDtw4CHKI/5UwbEJ0isMuVuBnifBAPb7P/Ya5lwPSSjfYbY/5FGyV8Z+Z
 pH5oy3EhZgFZiBWGeE/POhpx4NJM2N0gZ78xa44cJIZ4zsTAeD3NlvovCExiCOV1EY8m
 oy5Jupx5sJvXYTGMhfjTM19lsRx9RfU0lVAbhaHTLP7WVyMIwbeUfQEHk5mcVwyMEzn7
 aP6w==
X-Gm-Message-State: ACrzQf3DTfy7HLaDDTQRuxWRrMLfP71xizLVtte17y8KPDBtnei45Q1w
 XgzT8IA2yJu4zRF8x7zfP34GCA==
X-Received: by 2002:a17:902:f644:b0:17f:7f88:5f47 with SMTP id
 m4-20020a170902f64400b0017f7f885f47mr21873347plg.123.1665458381354; 
 Mon, 10 Oct 2022 20:19:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 15/24] target/arm: Extract HA and HD in aa64_va_parameters
Date: Mon, 10 Oct 2022 20:19:02 -0700
Message-Id: <20221011031911.2408754-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IzT8XjXEdx0q

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..76ec7ee8cc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1041,6 +1041,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..4487957e5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10581,6 +10585,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1

