Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1279048lfm;
        Wed, 17 Jun 2020 22:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbr3bTM9nahP0zGaJnl94SuORb5dHWue9VyNQR/Mr9X6Wj7I0WWOArM9/g+YOe7fNRmyyE
X-Received: by 2002:a25:af06:: with SMTP id a6mr3994035ybh.271.1592456463279;
        Wed, 17 Jun 2020 22:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456463; cv=none;
        d=google.com; s=arc-20160816;
        b=ucdird3e4y9QwAOfjdHcfl2DVmOWjqG0ggDuTndUlZqvDeTKBvZGaf8+xYXe4lQGBa
         DNHJc/BKxYskTAWSVdKOmhFAsgTpiUPtYCvLJN7aTJkiTj0FXtNK6wCgimQTaljeUoIx
         +LbR6GJiGi9JiuPYk4tuyUzt6mmKxnkmhziZbQI7mz7PpWrS+FlhqCA7NmJg61xsRfhf
         ZWeSSKvlvMc4xPbSSKKCrtpCZQwnlEOEEUAGdJpzOIkim4Zq1kF13guKFSm6181e0aYI
         iyRmft1DODDuoUsGacqc3YExkVs/HoCzockSipr40LSARzza9u7ltzc4Nys/0ZfPb6Vk
         awFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fB7a+/Rpb0ifGeMz+aFNVR5YF+snSFI42vlkOdTuwbw=;
        b=fhVZiK7P37OOmCgvm3Ex6L8droz2X9DKWjCKZBg5f8VoA6LL6mQFqUISJnY0y/JSlQ
         /2Rql+JiNVGL8Ldi2H2bqHPGeeSDWE/RQ/5woBf3PSJo224qeW5gqnN8FaMr27TXO/Gc
         elMAubFj0Uyj65fm6SQV73x1V93AFAhbcu66sKVT1IPlNDi3tvTRZIzxvH7ogOrfMPkj
         Abf4IZiqD4uIyZVyS25dIEsIDw4JNmxFILGHGn88zn7TqT1XEv37TxZWNbn2z8UXm/e2
         A7mhAzzuqGM2RVA5RDq4KQmkHBjlWHh9TmZ0dlUY3eT9Dl+FXDmnkci6+QxoDrV8rPFp
         EKzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD8y3tLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c84si1574015ybf.33.2020.06.17.22.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD8y3tLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmfc-0005Ti-27
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCr-0003Ce-JR
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCn-0003J4-OQ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id bh7so1900958plb.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fB7a+/Rpb0ifGeMz+aFNVR5YF+snSFI42vlkOdTuwbw=;
 b=OD8y3tLfGun4vR678UzxZaNCkvoRxGlO2gfTOZmf7qwDMztv+Fy2PYIJB9c7jdoOeZ
 WJpEoGfG5Ix3xNxtAXmXr/j95Cx0KhT/IMMXHoxckES1nmfj6hkzhnn1k28SX+JsXD/S
 uiI7/us+OwcEfjOUQkUmhkKECiHZyzw+M+YjhxGiF2CSxprBkitvkUOOU6ndPsa0vAUp
 1Wf0/VLFEWwAHIJxdwIdlU5bq7luEsP6PSRfp32KMENmYHAGdykYtNO9Jq/NesrcqGBb
 3ouRzlibkDvUOPSj39wkYAlPcwEkL6ZMSDFaMK0L8H6zaC4txvwkZrDEDjFf+X5DvHi1
 HcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fB7a+/Rpb0ifGeMz+aFNVR5YF+snSFI42vlkOdTuwbw=;
 b=LSjxF1j7qK+ocowtXlLO65xegGIgwryZ/bOxwk3W/fEEVkmip/VehPM8iAF9CKtoAr
 MOc2QKMPQ3zVLA0EC5bdv+yrhVzYQrF6uTfZ0BqXUc6QokxiyPssW+AVLI+41IboMO51
 6SLPVGlroQHVEuXdK6MpYhGCblUmWtNmMJIkjooF+W936RxG7F69N7/YgD7WeECHe/EQ
 Izf5IPjn87WgkZtGRawxIQjAXT+1Q1F+MU6Qj7bH4ltDyBt9CFkZ4TRdcIUpEacV8LDJ
 Fyjqo5/WbVXxXxWgCHu/W1FETeVj8ioVPMKxqP9hukS+c/bHGeEctQUdfpekt4YrCEs5
 MrIg==
X-Gm-Message-State: AOAM532qxzRV2tSlWk4RfepwdKcyXnTRV7YZV/lOC3rlZb5nwmqNg8V2
 hltsilRSiYBokzYUPuwKniv5Qg==
X-Received: by 2002:a17:902:8d87:: with SMTP id
 v7mr2097827plo.73.1592454671918; 
 Wed, 17 Jun 2020 21:31:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 060/100] target/arm: Implement SVE2 scatter store insns
Date: Wed, 17 Jun 2020 21:26:04 -0700
Message-Id: <20200618042644.1685561-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yHjHcmpW6IGT

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
index a375ce31f1..dc784dcabe 100644
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
index 640b109166..7fa1e0d354 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5728,6 +5728,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
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

