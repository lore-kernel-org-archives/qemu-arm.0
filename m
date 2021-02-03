Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp499312lfo;
        Wed, 3 Feb 2021 11:29:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8qkorjkOqqf2iaCFdg3kshNGMuh3FL7CNJNDdbRJOKcCQE1zOMzL5vFi1pSRqAH/Fg3Xi
X-Received: by 2002:a25:f54:: with SMTP id 81mr6362681ybp.103.1612380541545;
        Wed, 03 Feb 2021 11:29:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380541; cv=none;
        d=google.com; s=arc-20160816;
        b=hK/0q3tBFbkwj2R0JO9i+UXoVc659Qke9G3LJX0ZksYt9z85KsmFrPxV3cg6jQ/DwT
         Nx4gSTXZTle8e9y0+HLqoqmQB2hV5FV6XTquBF79a+87Joo5gQMNWtgRWlhf5ueuiP6b
         KtkJjKtcrt6etMlNdnRmRr/Ftp75fXmu8WOK4r1WniE5lZ3MqjBJuOmzFgD8WmvZVYXb
         oe1P+Rrd9kFo/sAgY5NImX4/6QTIYpAdy1AWSD9MlZzT90i9Tkn8cwcXX9XQFgJTkpRJ
         mdThJ6agdWAvQWJZbWG1Eh0U91y32h2Z97pQ6qZiMyPzqC8b5nxnKeB4R4PCnpaNModn
         8Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lsa43KhLD9F5pbGprd2vnecoG5hphPKA1CxFp2hJ7uE=;
        b=T7gdirvda1QtJn7OtkQUecBrsUU4Hp7BTmBpSqsxCsXBWAYp1m2Rf9Puu94mA1JbWw
         7wWpIbR+alNEvfn9BXPfd0elxql5XGcOc8Q8ofQPpeZ9IMhpNGGb6qEgVl402j88fFqq
         bs0walbhlkoKLPeSjPTsOwJzrK3zvx8JVVgWKAjc5aApsJ+nSd1wg0hnoLwEvhYSdByO
         Ze5udUglUXHF/CHuMvqAR3T0vJEUiPrEWtWMSGWRQrDXnWH2Hv24d2ArZJCkejkMURJ1
         XWbyAViouFgVfb4dJZji+E3/Cd4iRFXCqhvKI3iclRuPuxkNJpAs74E2bjWVvFYPuFcw
         J+Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e1u5ubtb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r123si3318172ybc.347.2021.02.03.11.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:29:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e1u5ubtb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Npk-0004dc-Ul
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOU-0007NH-Ib
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:52 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOO-0001cv-BX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:50 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 8so367148plc.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lsa43KhLD9F5pbGprd2vnecoG5hphPKA1CxFp2hJ7uE=;
 b=e1u5ubtb7b72Muf7/Sk1uX6dZA7D6Ben8TYrupvU22XojFLr79cna3+Df02Bk8a8QK
 p/+sb0+JxHeX/oiRlSY+qui+XvpsqGBv4VnBLQtaPZZtuYlkSctN/fmAyTsKXj1EAWo1
 JBvflLROsH9sd8d62a/Wu2PJe+e5nCymSNDo5KdLpCapDLOX2besk//pDUCFWL+4Fupj
 Vqzkv6UpJWMfQHQLpr/BXV+lk8or9WJvYevSpZoIEqtJwuSdclxBhSa65buJ/4u/mrr3
 e84tCzSzODk0d0D0M1M6jIws1CcSqc1sTQwRSL+aYqmTmWEFol0pIM05neeKVDpe6wbs
 9b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lsa43KhLD9F5pbGprd2vnecoG5hphPKA1CxFp2hJ7uE=;
 b=IDT4V411FMqMFmV5gaQ6OUy4LGo508+tdaUBraR8Cd1HDO+5DzLMBRzWT4EW8kPjF9
 wkfeIyxNZ762znxe1dqCEH1EcSXjIvoaf8y9bDMVthiSI6nrDeMGZtynyb2jfjd2WRTN
 XWSpOYOYklMADO+lmLrVVdOeEowNj73XIeEFiywQTCmEw8yv1SKZZ1HFmefAJ2/uAnqq
 lAu8BNU60Nm1pVasiOLZla88dYiV04AFVJZGShhhgozlCTLZ7wp1Jp5RjWStuqBYgjYO
 f6NcGnnulGbynwb8M5kxzgl/W+l3uAspV+GZcjRJcPrJsRhWBGv27SPwagJ+lRhv0MIb
 q4LQ==
X-Gm-Message-State: AOAM533GJ7itvujiBoLKtCYNXqs6P1F42b+V/KUg09S6vbozBsYZBErh
 oDR6bSBcXMa7QLJN1+fidCEp6goZ8yRT6pEX
X-Received: by 2002:a17:902:ed84:b029:e1:1058:d7ca with SMTP id
 e4-20020a170902ed84b02900e11058d7camr4480110plj.85.1612378843071; 
 Wed, 03 Feb 2021 11:00:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/31] linux-user: Use guest_range_valid in access_ok
Date: Wed,  3 Feb 2021 08:59:53 -1000
Message-Id: <20210203190010.759771-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eZU1kBAhA4r5

We're currently open-coding the range check in access_ok;
use guest_range_valid when size != 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9fbc5edc4b..ba122a7903 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    if (!guest_addr_valid(addr)) {
-        return false;
-    }
-    if (size != 0 &&
-        (addr + size - 1 < addr ||
-         !guest_addr_valid(addr + size - 1))) {
+    if (size == 0
+        ? !guest_addr_valid(addr)
+        : !guest_range_valid(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
-- 
2.25.1

