Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78962ejb;
        Wed, 15 Feb 2023 19:10:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/2w3ckxhOOuwSLk1neEoG7iSRHBYlkzCpb0jo6OojN3WoBPST2x8GDfyhcUU/N+tKKAX/I
X-Received: by 2002:a05:6214:519e:b0:56e:a6f1:8cf with SMTP id kl30-20020a056214519e00b0056ea6f108cfmr7983489qvb.6.1676517045560;
        Wed, 15 Feb 2023 19:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517045; cv=none;
        d=google.com; s=arc-20160816;
        b=iEmhOfWV2fjfHJeiso7je97UveTETuj+3/rXvYjWl7eZvZHyxKgiZOVHkDJSuHts1A
         fslebXGNRxZxaj5Jg9ZtB9KYQLwnayxZhKmXQQaAi4QabZRalgpPG38y0nfjVtTUBVVq
         edPo4F5Ea1dh2wiAxqi2U0meBsOh1IDlwB+Aou3Z9sHHeEwrlnmZR8ZVZfe3vO9bWcG3
         dncVzTUKbgEEUfVy6S7atsqB7SLTVRUcOSpaJZNKMvMtklKI/1Gr6HS0P5ibCPONS+L6
         aimRfKeQc2h2Fty5IUFPa0YmteDdxNzFCiqGZbkyeNl/7L4plsk7gKEQ0t5TtDP+gISy
         IAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8oTGtji2gFH3RPMGsbULntVwagtctLLdB2UDLnFD4qU=;
        b=Ht7Y0K9g/Ve/gRx/S0b7V7hKZFzNCO09wCxvSB3HU22T1ZJ/jYq9JfkbssIyaPGdkD
         fjipYRiiwJSEW/ICOfItJLx6lENtGHpKCuq8if1V700JGLXgPrbSQepttFgddSoqFzwl
         qk8tLpAcJAPYs4Wo8djyZP5OD+WO0CODm6AdaQpgxubksiPinMgq7SXDIrxW66ZCHHzt
         b2Y1EdA5JlGIdMxM4HNkdrWoZZ/IH94O3Yvuw3Ur44xuzhRVK6aRduIF8bPZYWwPkNdb
         AwmSce5LQCpW9jP55+DbdP8/6HqKtAxcT6p9TVyjA3jYoTbik1aTI+P+DGDO+H05lShh
         ZKIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fu/XE7oz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25-20020a0cb2d9000000b0056ebe0fa8ddsi77603qvf.553.2023.02.15.19.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fu/XE7oz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSUeJ-0007Wj-Oh; Wed, 15 Feb 2023 22:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeH-0007W3-2x
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:30 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeF-0000GC-Dy
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id g9so600222pfo.5
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 19:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oTGtji2gFH3RPMGsbULntVwagtctLLdB2UDLnFD4qU=;
 b=fu/XE7ozh1m1IF2AGnAXm0CwKpYNz7sPFNk1V0BruBVbN3LJzSdHq76glFoyMrsOKH
 TwkFwrFMNLmmnJM9hO+dpUF7++HucE3R6umH9cod8Gbqhb4IQAqtWggFo4sBptIXCKrm
 EE8X93ldJkOhMeU12AWfqZkj5T+RpioZChdPIfUuCDUITd7hXogsRTQfmcixyEXILANm
 lmR/zOEa00K8k/B6h3INQ3KaVyrTGDxrA67P9+vGDvYJnXrAUu9VjM03lxEIh3jDY4xd
 Fz7//jBnuQk6EzT5HftQtRtRq6tSxAm7F/PPcTgMLaMiSyMw95RKbChLIImNmmCNGhcH
 M8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oTGtji2gFH3RPMGsbULntVwagtctLLdB2UDLnFD4qU=;
 b=ZSfnv+YRhgzFTXx+SuvmDfSHNZ1XzBmenNCLuyjIl8ZNktWoW+a5yVu2sbSQI0wzCs
 7aCw6Pd92tWyIfdNl2mIN3/V07SYr22gLReO8gbsQYPd7jG7oi4K2XezMCWghCyODP4V
 6LX1sT20MumJlc5UVCrXQw3o16ZoYdlGG4lWgTuAPJ+4FF+YmqCNnlTWYTKNpZmVf2WC
 6UVNUXzjoxUjKdX1HDlaV5KNXEyblhMFzqNcv6y/Ra6r+Yz5c0X03bKE1uvNfONlbica
 0A2Ax30uw2L++8EyX7lrFTokBUyD2QsiUOp8GkKYVRURvRw3Z+ybX351XGim5e9SfuYG
 PB7Q==
X-Gm-Message-State: AO0yUKVthAyj/oR1gYmuJgIWFTSTdOQru66L161IskPwCA5rkKYZy7f3
 Lcr0Zfud+azicjKYXk22DMpRrTx6wZ3RHvJOoD4=
X-Received: by 2002:aa7:9402:0:b0:5a8:bf60:fa57 with SMTP id
 x2-20020aa79402000000b005a8bf60fa57mr3196974pfo.4.1676516965844; 
 Wed, 15 Feb 2023 19:09:25 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 19/19] target/arm: Enable FEAT_LSE2 for -cpu max
Date: Wed, 15 Feb 2023 17:08:54 -1000
Message-Id: <20230216030854.1212208-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0R4mDy7v6Rdi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2062d71261..a97e05e746 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -50,6 +50,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..ab91b579bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1245,6 +1245,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1

