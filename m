Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B02F9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXDy-00019z-UC; Wed, 22 Apr 2026 09:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDx-00017V-EH
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDv-00018z-PD
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488ad135063so47500045e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862954; x=1777467754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yq/bGIVh38nrtfwG2BReGAMOSU3dNrWCtccK7bpObt0=;
 b=zLSSKlPLbkPXphKKvIJG9JEobL0FT4X7JeITCTnKZ254Uq+EaHtQlkb5iCxy/flBv3
 UEQe7JUYFIPrTTOgsqcBHPT370TIvEdd8TQTFJ4YW0B0pt0FjfdrvQUh0H3BvtPrhSJ/
 JSTya62e/gNJx8EfbZQED4cBi40/Np0K1Fm83HVpkY67mBh8Ry/jxGY5AfeSN1r4SQYy
 JowkDZqRdp1eBsqdXrWVxFy15ru+zrR+hPXjPvGJD2XeZv+CXr5O34vHoZvT1h9k2Yyf
 A9iR3YPzjIJyBTZ485VcyUxBb/Enu8KF3eadTX2RC0dZln1ZiMGnmycRSS2MoWgLX5vB
 Q2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862954; x=1777467754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yq/bGIVh38nrtfwG2BReGAMOSU3dNrWCtccK7bpObt0=;
 b=TxX+ocwpetE+Wt7pFFC1o/Z/aVcnKUaofk68xW0M3sYWZ8pp522nYcBRyQFKpNhCz0
 Ibk91WyLKBy3w8YdzrfkP2f9dfadWK9bLxmH2xxyoj0JNILcd1aJpa6maCiz5fAq/LGz
 jGY2CjcsUY2VYMqKgynNBE1fYSeVSsE+sabPa0HEzT+hOr21sb50m5+HuvvLe30e7Li6
 YBTn5RaYeuvNFNV/0u0I6oLyrsA/nMEbP2m/c2Gn1GA+y8IRH05LRjVSN5jonHS9Bo34
 POhNNwOkhiG72agA8Uig2ZxnrbGmJirp+RNJpUeuZs9V6xNrOV+AOyD/r00sTQWbszUM
 mJTA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sNgDolFXL33vuqC6+mZ0vJnNOrfOU2JJMcAzgE81JXIl7gWGKjIqtmrIACvQcHRw1/RtgW/z9fQ==@nongnu.org
X-Gm-Message-State: AOJu0YwG+2HDkuaMMAIcznyUSyeTF5KvdEPimQEHSprV8xmi7MrxEKzL
 AkuOqVhyiqjOHdQjkSo7W7++JVOq6TNF+m0vI6ZGUGkju+1vnnBRxV8Hg1gMqhs5FXY=
X-Gm-Gg: AeBDieuNn4KtTvfhWNv1FiH8xfROaRq14WviKJTSYZl+9pNxbtrFcCQg0hoWRuASwBa
 YBxBlqprXh0Rkb5nKOtaccpT1UWEwX6NEjAg42k7UJdc3OiBFo8QJVt/Kn0vpskfMnyywZqMsVU
 CSsJVD+DL/mabfR7MEtruoaoLxUhKd38RtjQL59aVaEP3u0ZHK0G6RL55PsRReE7Q136NBNH0XU
 w58//zugw5/ZjUk9wtiTXcWPu2+7r2ElAUXBX4lRmAT61fh0cGUJ5oLzmpoybbTxOZxzndC9yvw
 gyUwr6Ovhcwi1fIurnajb1b3T+PhU1zorj6nuQH9WMA3S1ugrGnbFefTfW7SaoqkgoIJREqE7xp
 vmKBYy/F5Ly7KS1DvBy6oVGALEMgVsEbXFJJa/+vb+KWdZQPtzQm5Ks+Hur/PmYTLGx8DqLkGxb
 jzp4HqyMFtNwdv7MrNzYkNtVPyK2OJ0WUNriw4gQvdqk3L
X-Received: by 2002:a05:600c:1da1:b0:488:d376:42cd with SMTP id
 5b1f17b1804b1-488fb785901mr358408635e9.22.1776862952412; 
 Wed, 22 Apr 2026 06:02:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc5e3f4sm230894695e9.2.2026.04.22.06.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 78333611CD;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 19/32] target/arm: make hvf use syndrome helpers for decode
Date: Wed, 22 Apr 2026 13:52:36 +0100
Message-ID: <20260422125250.1303100-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


