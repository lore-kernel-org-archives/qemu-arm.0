Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp740016lfr;
        Fri, 16 Apr 2021 14:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKpytTPK9ydB8hr3OqRWzMV1h1jGHs6v3p5C8aBGD/ZJp5x44cpS8iEt/xVJ2gLOVg2Ucw
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr8661182ilr.124.1618608447670;
        Fri, 16 Apr 2021 14:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608447; cv=none;
        d=google.com; s=arc-20160816;
        b=NMiFGNgxKEXy0DiGUo7zzpn8Awp54U+48Yv6Sz/CD/eVNApzeS9sDl9ObiQtdJTxsz
         AmsTiz/RkHNKqEUuCI+jDG8IBWVxrJf0ATD2SJuppFDSOKG1eGHxfMxZ/U4mtmNXr19K
         uTUXS3ecnfrXnG3oRwf7Ca4MiR7fgiSxPQs135Zzt6ThI3tu8zETeqP5gpx4qoq/kaES
         BdYjguMD5mb4boZnMMKkmhz3+N6F47iDRYeiQCy6f7KcShSmvY9j30pLgcvQWQ1vYoq4
         tCKgE/sMWyHbTWVwcyYqZyHHH5hVOfU4LzzR/MNHKbbS5wEpHQ9lp1g1mtguDEc5T2aS
         nRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
        b=zxhxWZrjvCrr4pnRnjidLeeAhQ7djxsb+HYWI7BiCobfHnHliSWNNYr5xLy77Z75Ll
         E9iihX+rx8ayZP8ij2YPnQnAh0MQ/cd60EdLedI6Ug1upotaNip7XR81z5i2P++sLJUS
         DgaVJtYkp86fpGi+0Yxey0MMtU2v4Q8mU2KROzZn960v3sXXhbz5A2OY4qfDH+HnBZ47
         ihferxJyXrO5qsznO27iIgHnf1ASMyZFqr1P5/+W2UeCtLyWhFd87/PFrGY8oEtm7wcj
         9e2JNzRSgXF9vu9dI4ke335UvkpcYIpUmzPD4R9q8KYm83srFCkAp8qKo/i7Jew6p4Bk
         ttpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxYxRwwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si3111359jad.22.2021.04.16.14.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxYxRwwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVzq-0003Ix-FP
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdE-0005h0-HE
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd9-0001eF-6w
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:01 -0400
Received: by mail-pf1-x436.google.com with SMTP id p67so14194647pfp.10
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=RxYxRwwINCDWwbj/euXXFTmjR/uiBAP90lqdHqCSB+tydAcaQKht261yRa2AUio0/R
 r+yBfCJsxVuHXv1G1Uvyrk4+/+qvHoNZH5ggG03lLW0KfKe8n+1U6E4r+MmgEtOqHHtl
 Q+vL0fpC4zuaBm66kYaJXS3PyuM5FgGJAMoQyIx9h6Qr4MqnLyOgtfU+L6aOBGfVCHbX
 RjILcn1LwBBSb9DGbelxw25r1Jw9Rjucu+XPwddscCZ2WR6kndX5+NUnq0K684zk8oqc
 RvCLmK40lN60M7MD6zXg7gIp8fv79uqzy9Y5VfYf5cSZw2LXmm64CtpnQz2PTcVvzYwQ
 /XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=dQe3+84UKpqDlI4Vg0H5jUAw8HXIsYO2aHoFJfQP/D+KPlOQAGxofmwiCqlaha4ELm
 6W36Si8kjc9akr0yPGEplh1h8ffFQ9XMpBubGKW2+pW6FVuMf8pEvojQa7sZvKrTsvPH
 D0Gbi4efJOsk7cIlqFDAjbwUHfkeI9aFHg8WKiImlZjckP7D+J0+HfbUTBelMSuO+XOF
 1Ff3q5C9avZIzE1WBJQ7DxXd4ds6qtlM+gkQcOCXKamxo96E53c8/f08cj8LVYHcJkVf
 2KYTnUw8xrsMokaV+AX+urod4CuwYP5ZkR6zgzyEGfSfg0g22oTxwKWOLvC34gRlkl+n
 7pXA==
X-Gm-Message-State: AOAM5309mmDl5y5x4HV7nkhqaEjFqLimsxQXcSbKGXUfV1YVatya98rB
 cqZfwDzt2uwetpaN0VPEyNujOUvUl0exaw==
X-Received: by 2002:a05:6a00:24c3:b029:253:e598:2c62 with SMTP id
 d3-20020a056a0024c3b0290253e5982c62mr9686369pfv.30.1618607036385; 
 Fri, 16 Apr 2021 14:03:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 44/81] target/arm: Implement SVE2 scatter store insns
Date: Fri, 16 Apr 2021 14:02:03 -0700
Message-Id: <20210416210240.1591291-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFff5MgYX10Y

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index eea8b6f1d0..0356b6a124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6167,6 +6167,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1

