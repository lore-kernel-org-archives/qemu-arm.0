Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E08DF9B605
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:11:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUYC-00071c-Rg; Wed, 22 Apr 2026 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXm-0006pV-7m
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXj-0000jH-Hs
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso27600585e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852650; x=1777457450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUXCf79/aCPWP+oojaJHciitYmV1hJJUoyGLuPcbhOc=;
 b=b9JVmR8AMwavo9+B1hw0BF6tqDsQJ0x/F4/7DX1xnF/oRKKdxz2Q3Ks/FdJJ6g2eaa
 iZmGFNkgUDYahZZ7PEQb77k39pcdFcvLgINQL8Ub+dNDYIy0PlsoGyqO+t4dfC1Mzduh
 T6Koio8Uzo5lccgB6giIfD87IEhdQA0qKkhAgAB1aU7rXXQsmnRC9KuANRL5L1lUdQzf
 feHlj7H2t4tgbmRXOxsC4Z0UzGvMMhXMrL0Cq/XpmAryVayxXRMNFQCPMOjh0dF+rzHc
 udt6rqUrTcDf9/VBula+DqqcYgKRXzIqCOAqKAbT7Fm31YYTh8PhUiA3al2A3zSyTw1q
 7thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852650; x=1777457450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rUXCf79/aCPWP+oojaJHciitYmV1hJJUoyGLuPcbhOc=;
 b=NJsTEFLrUE4OTAF6nY2HRq6135aHb8QGq9jGyuJ056DO72Gq0eigYmSvX7clItNV5W
 RBEUs0Q35Ux7uVT95OwybaH37Z600eCRDZ4bFduwh0Bg9xtiuKNo3DGwQl5xpa2Tyha0
 4q7Asn5oDaKNeuJDvqX9njMb/NyIBcMOZykbLZqc/Ope19rCYbkQTw1ysHBWz7Vt2+FQ
 4X+ny02Or/CrrCVa2D5YTvcy6pT3CZX4NclykD5qOiDLzIfBj3rKLuudAKGv9ps92c6g
 c/kCT0LokdG93goMqgMbOIaYkTLJ6qAjP4gxeP9b6UqD+ZHFFMcQ1SDqT+TDqobXfQcf
 NeHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lUg8Z9wpjusbrx48EcGdUKrtRpVSqWAHlVnAU9FQMlVudWJkGbPi8h6zH/oUzSN2V3g/SA/I06Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz4MV1YPAsVjSYgwR1hWBLnCL2Yi/DaaaaeAeAPqDILzeuURBVm
 Si8BvKiJmzZFRqTYHa7TUzOSgQPcTQFO/V4kxM156uaQAMEhuYsTL6+W6QE5RanDNFrl3oMNp6Y
 0Z5X1G+w=
X-Gm-Gg: AeBDiesw+jbhYO4mK5YwtyuSFaQ20csoPA6T2jqJ7wyU3UqI9DaXuXiJLdeZtHWSFxB
 ni+JMA3Dcm+iykg/5QnqB60CK06TUdWOJ8Wmi4Wpsue3P1NgpoB+QR8skGGKsZ0ZcGw7rGzW37U
 4Y9TKZVaa9laOXjK2zXVM7lQ6vpxr62tpsi48nJAZNqaLZh6G1X3qLkErgcaokB7pfckTCC1cvf
 2DQVb5JjT+1e6mPP7ecsnQ8DBDj06pQYTL9GBrgP60UR/XDDpN+X4/kKp8zoLuIc5E11l6Xp7vc
 3p1ehnbOzDALcuNkjQ1Lyo9d4sD39fOaku3qaVuSAkdSSZHF+3VjZPeVUIpWMvbdugUrX9qxmiH
 Yg0pOhby6ze9nPTg2CQC7enSDEhfhSVRAtQHb5zkd2E04c3GGCpKLPyb9fleS1r7M08GVyICPKT
 ge2b/9odXHCDnmqjs3zHPZnhtMXmyw7GMbsQ==
X-Received: by 2002:a05:600c:a303:b0:48a:5576:a28a with SMTP id
 5b1f17b1804b1-48a5576a618mr79079685e9.0.1776852649757; 
 Wed, 22 Apr 2026 03:10:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc17f642sm399924805e9.5.2026.04.22.03.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CF21960342;
 Wed, 22 Apr 2026 11:10:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/31] target/arm: migrate SME trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 11:10:16 +0100
Message-ID: <20260422101043.1234229-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use !is_16bit directly
---
 target/arm/syndrome.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 63c8e66ea91..61053475984 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -384,10 +384,18 @@ static inline uint32_t syn_erettrap(int eret_op)
     return res;
 }
 
+/*
+ * ISS encoding for an exception due to SME functionality
+ */
+FIELD(SME_ISS, SMTC, 0, 2)
+
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
 {
-    return (EC_SMETRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL) | etype;
+    uint32_t res = syn_set_ec(0, EC_SMETRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, !is_16bit);
+    res = FIELD_DP32(res, SME_ISS, SMTC, etype);
+
+    return res;
 }
 
 static inline uint32_t syn_pacfail(bool data, int keynumber)
-- 
2.47.3


