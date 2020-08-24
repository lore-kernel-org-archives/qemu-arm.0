Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2614588lfy;
        Mon, 24 Aug 2020 07:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLwDQtMd/o76SN6UyJN1qNy71hhYlO4LEcrHH6c6oypPfPdOFLAwIzmJ4VwQrKKJMfR0LD
X-Received: by 2002:a25:5305:: with SMTP id h5mr7237136ybb.433.1598280096880;
        Mon, 24 Aug 2020 07:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598280096; cv=none;
        d=google.com; s=arc-20160816;
        b=aBFMpNEDcqY0q54CdQqNu5te0GPMfJFTA8SVDDCxiqVVzeGud16FKM4DIE/2g2oJqx
         it+D3YAZ/JaGwsWP8mxHJiRvwdk7PPbJQUcS3zmxaJ3QIgj/R5I7Iryn7/GaXWRoj91M
         C0bdxhg+VJon8pRCorisxV96Bqn7LpqcOW8Lt4Yffhi0c9g0mHrJtPUBZmvZkvbMqmBP
         gABlHyDFAmBCMos31qzAdya2uL+Xaj6Jvyzj4Q2ML1BZb9tNsFYIKV9Frr97vlG3Q/x6
         hakJ66aTUXY/BrE5081+XeueknlMdkbU3OTOEX2JMtpz7Q1XMt8+vYZ++7lYb81fxqQh
         hr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pd01uxw/z+OGFpmWpo0tpfZAh/qZHgIvhk5c35++C1s=;
        b=o7jO2WcvRUjdDo5If2R/vlPAeLJuOg4YYE1HBMYV0bvB4qPDUGv6uxvEIyfk3IOTu8
         VEmNjVGkSi8l9QeXBF258M+wedQvf2K0Ck6Gnc/VXmVBhHsu/XUdSOxirhZhZvQzRLM5
         12Qgm23sDo2bgOvQJemA0aV3IdsWKoxvfW6Mf5J9y7dHHmjhvlcZGSDIuMGm6FzwU+VT
         Q248pUfyt3MrB1dY8bYe3G5WHRdWsX1v4SyugLUAzy71dbfth5kFk40az8ga/K30nrhU
         Les5OhVIh4VDEKhh3zPjgxOczGsjPJ4knk0OoiHL0lW4z8nUxZQA+G/NXT9GJS79HAgB
         bhpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+SE297L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si11085728ybo.214.2020.08.24.07.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+SE297L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADfE-0003vO-6s
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADU9-0000OY-3R
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADU4-0002mt-RW
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:08 -0400
Received: by mail-wr1-x442.google.com with SMTP id b17so8125978wru.2
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pd01uxw/z+OGFpmWpo0tpfZAh/qZHgIvhk5c35++C1s=;
 b=I+SE297L0XUSzXiduKOfJSXy6OtZVdpqbwk6m9A8fBTwIo18wOfcSqEZ4CemjrbMHy
 samsrqj+kROvIeDPhtu5/6ncpxVN8lITAh4Iz17UBhMejGf2oz7LEvCp7nwwmhLK5Hyl
 ZA8+SBGgHsjXj1jGr8CmBloRzLJqjI9uTNKXDbNm5GsiqCFLLNwgMK7htFC54JV9nTXJ
 GCWBWO3ods+bVe1TpFseDEFoBE+Cv4bmO1p6dlfx3TpNb+06Dt0sEPWPTZ2wjyXmP1Ny
 NnyI5SsweE06+Wuvau2is8waQPCRqgcR21EjMEixuf/BY8h4O3iq804eGUqiGdX4s6H/
 r/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pd01uxw/z+OGFpmWpo0tpfZAh/qZHgIvhk5c35++C1s=;
 b=g6ZE1PbvPoh+sX66D9oj6klUugROq7ePEXXUaB7irNKUde7p07thxATBPHsL3F4uMw
 jesjrmxI3p/N7kOcoDntGs/VoD8FdFZVZF67856pXlxAR5ynbraYiBZzozd5goFRWyMk
 HF7BfeSeohZezUYuK16xOubNYnKYMRGjIClkxM6Mhso6xipVZFHLLgUsTaswmbaOCcPh
 4cYjaaPZYp3TIbI7hvX0oYegQ2p1yJdOX41XethgPCcFeEJ/GbuhjMXDxGEi+c/FZC2u
 KZtGA7PnNWLp+kdAJjKIfmI79zbfrUIA0Y9BCwPmL+6mEyQr5+7SA7bVAcY2EB18DTsH
 WfTQ==
X-Gm-Message-State: AOAM531F8cFGRlzTWtbYrdkRuGnjbYi3ilT1gcz2R3xRIE4AEQbVWLZC
 HafVdwa2EaeeecJHWJY/y6VUYQ==
X-Received: by 2002:adf:f847:: with SMTP id d7mr5813070wrq.328.1598279400140; 
 Mon, 24 Aug 2020 07:30:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/22] target/arm: Enable FP16 in '-cpu max'
Date: Mon, 24 Aug 2020 15:29:34 +0100
Message-Id: <20200824142934.20850-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dA0QqdXmiJLr

Set the MVFR1 ID register FPHP and SIMDHP fields to indicate
that our "-cpu max" has v8.2-FP16.

TODO: this patch needs to go at the end of the series.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b382fcd60e..c179e0752da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2143,7 +2143,8 @@ static void arm_max_initfn(Object *obj)
             cpu->isar.id_isar6 = t;
 
             t = cpu->isar.mvfr1;
-            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support */
+            t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+            t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
             cpu->isar.mvfr1 = t;
 
             t = cpu->isar.mvfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd696183dfb..3c2b3d95993 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -704,12 +704,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
         cpu->isar.id_dfr0 = u;
 
-        /*
-         * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
-         * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-         * but it is also not legal to enable SVE without support for FP16,
-         * and enabling SVE in system mode is more useful in the short term.
-         */
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+        cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
         /* For usermode -cpu max we can use a larger and more efficient DCZ
-- 
2.20.1

