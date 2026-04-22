Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DCCF9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUew-0007U6-AL; Wed, 22 Apr 2026 06:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeN-0006z2-SF
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:45 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeL-0002Pk-El
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so43180305e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776853054; x=1777457854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yq/bGIVh38nrtfwG2BReGAMOSU3dNrWCtccK7bpObt0=;
 b=R/Hnzk4LIMg5tAbF/6UzousfLH4uiWqR5BUnfAMyCjwhhdqiqSdIO/gpj8nnxuc7qx
 CrcmzgfswyC6nBNVWsGjpAnGNYcbgRkQBBAb8l527kmFK2M/NlLxq+8U7n0E7r22xXiC
 W7zUIGnkVOgMk2r7j4kHnqFH2cMlnKdnefDs0LYeh1uLdvKYK4DDVn6YG5pfB+VcczM7
 84Aw8CKY4NQhujS7lHt1eb/wk+iyuftiQ4Diei19eRrjyFgEOZyFCRBQxMZqqfx7zZRQ
 to0EUAuim/apqZOWRd2qjiO5vShK03c10z8BnP1jNhjdH8ZJBn/7o+z032IDFwjW4b0o
 yqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776853054; x=1777457854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yq/bGIVh38nrtfwG2BReGAMOSU3dNrWCtccK7bpObt0=;
 b=QelmHCzNr6EINX9LBZgH2KgBCm6+TlPhUQZ7ErU8tq/NBEjH8b8DdDRhbNhOQbckIf
 zbJBvCkkmE/FV6bXFvLijqGp+QqxR0pkgYvIOpxw11Emom9MMdUsD7V34D+VHBCokngp
 BoEW+gZRw9M8C0M8P61/xwUvcyoEFuppE76rOysJ+p7xaQzjXxeYVMBQ6bYz7I5iiiMS
 J1Dc+arxHl9AuS+SJUwYRbCrqMhQnqv0f83DYpInC3e6wQZBkchtma60HS933DT/bHBZ
 8w2GYjsi8hhkwHhwpMGdVYBoV73mNfK/Up6yguSa8Fne8EeLFwcvtzKAstQUSKsIdRKi
 ySNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MQvCVoWwM8OTkakt8/gfLatZvsZN6L2LOoN4ludJBXcZcr8nzU0rJvwV0Gii1dMJTbkK0dHjKmQ==@nongnu.org
X-Gm-Message-State: AOJu0YwnhkyE7zjgM9zzHsoYD9lkwjXxwnR3bUh8LE5loPMxbJRG3ItR
 rW9axug1zMVrODe8U65u8D17lQ4DdibHMGuXj651rO5l4r8s4rOPU6GkE3sPrzkzn/s=
X-Gm-Gg: AeBDievWyIT74nmDoI5aBrdhm/ExsqtZRLiN6rehxKJo4DYSDjIAexwSQQJtf2uJKRX
 MUSpDjhQE9OvJbffQZyGbcMXRQCXAuRMjJt4IJNRK00TmTrm/JAHYawd/a4EYuebSi5/YxpbiNh
 bvNkOgvVinm7GcE+ero2qbQJ71WkQpddtIF+S4y8/pJp0kfFjpGiGbAdR7zuRp3n71l5O8q7MXv
 WPuoIHkwi3D9s+qfeNhBvtspy4U9JQRYL715oU4s+AMDoOp8x8D1K2JnbQXWNf8qG4rqwPs5qel
 xojvo9KFhQadR/+GwcFW/bCdPkFnDu+S9QjbudizdQk9oRdiZjQtcAOGYyY3n3hFupG4hyfCLwy
 eS/TJ+PBQgQrqvF31coVgmfKY6SguprxhsBKllH8cre99oU1UqvtZMhH1mQOljPmCHXLmal1ozR
 gOBD+XGt0AYFx74wbFeY4U3V4J8pNoNBMqzA==
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id
 5b1f17b1804b1-488fb74dffemr240575745e9.9.1776853053932; 
 Wed, 22 Apr 2026 03:17:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm266237205e9.6.2026.04.22.03.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:17:33 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E967F611CD;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 19/31] target/arm: make hvf use syndrome helpers for decode
Date: Wed, 22 Apr 2026 11:10:30 +0100
Message-ID: <20260422101043.1234229-20-alex.bennee@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rather than open coding a bunch of shifts and masks we can use the
syndrome definitions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/hvf/hvf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..1c1c31f0b15 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2123,14 +2123,14 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     }
     case EC_DATAABORT: {
-        bool isv = syndrome & ARM_EL_ISV;
-        bool iswrite = (syndrome >> 6) & 1;
-        bool s1ptw = (syndrome >> 7) & 1;
-        bool sse = (syndrome >> 21) & 1;
-        uint32_t sas = (syndrome >> 22) & 3;
+        bool isv = FIELD_EX32(syndrome, DABORT_ISS, ISV);
+        bool iswrite = FIELD_EX32(syndrome, DABORT_ISS, WNR);
+        bool s1ptw = FIELD_EX32(syndrome, DABORT_ISS, S1PTW);
+        bool sse = FIELD_EX32(syndrome, DABORT_ISS, SSE);
+        uint32_t sas = FIELD_EX32(syndrome, DABORT_ISS, SAS);
         uint32_t len = 1 << sas;
-        uint32_t srt = (syndrome >> 16) & 0x1f;
-        uint32_t cm = (syndrome >> 8) & 0x1;
+        uint32_t srt = FIELD_EX32(syndrome, DABORT_ISS, SRT);
+        uint32_t cm = FIELD_EX32(syndrome, DABORT_ISS, CM);
         uint64_t val = 0;
         uint64_t ipa = excp->physical_address;
         AddressSpace *as = cpu_get_address_space(cpu, ARMASIdx_NS);
-- 
2.47.3


