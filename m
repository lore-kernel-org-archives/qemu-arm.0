Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5056540lfk;
        Tue, 30 Nov 2021 09:34:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZbIrZFmsn8SO9IDN5VkBYPj4/h0KZw+TI8o/7s1rXu9k3kbgON3BYIZpqmZlvjYEPKuQ2
X-Received: by 2002:ab0:6010:: with SMTP id j16mr870289ual.69.1638293656092;
        Tue, 30 Nov 2021 09:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638293656; cv=none;
        d=google.com; s=arc-20160816;
        b=Lsz+2hj1qwORxZQ7X+sYVssbWnvGuY0NLBKRYV9Chss774doyXad+4N8yYi5OO0B5r
         XGhx8m8PZI7LDJmPgLXZmo6YmsuLeXzgvllU18md1OUJe4Fhi1G9blxu24aEwvPSVkQE
         j2CY8sq3Y/TIM69HdtGBogYti+Z19DOlJCRKVhKKI704129XKfZdMCaaC7+q+NZ6kq7d
         gS4eqANdWXQcut0QAWZPyU/wbZZqi7gYZGsaJDTekp4efGSMu1hdoK6HIjDKN4M1rjeR
         a8jbx9IUdUIoB1BoQlvRLFHcO0pXW/9SeBehuCx2T0jqgm5bSjpE1nSt6sjB/pubxw/0
         VY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rfQ+RiViECLNtr/c9/my/pnagCNTFLLUTJEjsLwzVUY=;
        b=TSlzyXgLKbwACTmFLUrpYASZFJHYIgqoaEgsTAp2Dlz+QjVUva/5Ml2g+mjAiU0XAf
         Rw2PFXArc98Q1SpCQQmsATUiTYZipnZLWC4eB/q9quyvJIxOL5Wda608m5cvGKK2PPWZ
         H6umgxCt3u16j5+5/3pSxOIEb1z6Z4ttLxgnfR+kr1qOCdVgJmK5vwo1e+kOvLOcdwlh
         DjsQCUC8xeXnTDScMDXJpbNkyUbYw1I/QytwPM/6WXG3KjNELflyqfOJMTloOsRVqXVX
         W9w3RqLxyJ1dJywYhFcJmyMM4PHBfkzrBmV2m3Ostq0auNCojjkg0MhxIsaDrQJ070pv
         c0Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uFz57qVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m69si6407340vkh.4.2021.11.30.09.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 09:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uFz57qVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ms71D-0007NE-Gs
	for alex.bennee@linaro.org; Tue, 30 Nov 2021 12:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms704-00063P-Li
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 12:33:04 -0500
Received: from [2a00:1450:4864:20::429] (port=41635
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms702-0006ZD-TN
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 12:33:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id a9so46117431wrr.8
 for <qemu-arm@nongnu.org>; Tue, 30 Nov 2021 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rfQ+RiViECLNtr/c9/my/pnagCNTFLLUTJEjsLwzVUY=;
 b=uFz57qVY2nGIQxKRDHFsX5iWPlQRq4UCCXirYYe+qmq2XlygKjwUqUJDBYrrMXBWL5
 D8TUWimoGiu7VmsTQuqeGeQ0MYUaG9/UJxU3SQ8uzOGw0HWNp1hLaKDlseccRMukxxir
 E5GIVyepQveIIw9jvu5OVI7T+8baLEUCILqiviBxa/rlYK8Zl0A09lobAAeNt72fstQ5
 h5i/9g47E7AKcsx/xhddrJYwMxy4vMHxckzsfPEo5emYYzmvpdZS05O4xtxDtoHc+ad3
 SQYGDi+XXx3pK3+Ofy5APUbWR5T2RMzP/RI7bH1MrpQ1cbvqs2JCrPtXYQEtrzS5w3uz
 FIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rfQ+RiViECLNtr/c9/my/pnagCNTFLLUTJEjsLwzVUY=;
 b=gOI00SRUB31GUoMHL940uJX3gK5oQ9vjkcD6IsqO6CxMm7GEYGenYuSyjbpIQ6WfYb
 +940elX4OfFgj0yllJfbqfcsvjX1vzwdMnVkjBili6EuKKu2SHLEOSO8iH9RI28FRmeH
 XtDZFRqVTMj0iBmbc2cIydEGI4vQWF1ay4RTcSHJLtdYWICT5qTgdNnyD2XoxgjJ6crE
 GB4TSu/LQX7m+ADQEtzhl12gBMWC1zZtiJTZpnIT1g7vTVYytOJVfX6CXybnGJPezhmv
 oIBTSlPDiGfK+VJQ2ieUJpuc5bC2lncDF+iPIbeBsyCnidWo+iqyybMc0P33BLX5VFAm
 XN1g==
X-Gm-Message-State: AOAM532GbInUbyIcMHOw/nzIJ/3GemO/gD9jb2ofm6FI79QexkBUCxXZ
 hOr8Oq3xRUKDgnbrTrMFX0u4T46IJiCs5g==
X-Received: by 2002:adf:c605:: with SMTP id n5mr365321wrg.564.1638293580202;
 Tue, 30 Nov 2021 09:33:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r8sm21583972wrz.43.2021.11.30.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:32:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct calculation of tlb range invalidate length
Date: Tue, 30 Nov 2021 17:32:57 +0000
Message-Id: <20211130173257.1274194-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vjs+FfHjfrKv

The calculation of the length of TLB range invalidate operations
in tlbi_aa64_range_get_length() is incorrect in two ways:
 * the NUM field is 5 bits, but we read only 4 bits
 * we miscalculate the page_shift value, because of an
   off-by-one error:
    TG 0b00 is invalid
    TG 0b01 is 4K granule size == 4096 == 2^12
    TG 0b10 is 16K granule size == 16384 == 2^14
    TG 0b11 is 64K granule size == 65536 == 2^16
   so page_shift should be (TG - 1) * 2 + 12

Thanks to the bug report submitter Cha HyunSoo for identifying
both these errors.

Fixes: 84940ed82552d3c
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not marked for-6.2 because this isn't a regression: we
shipped the TLBI range invalidate support in 6.1.
I have no repro case for this issue, but this doesn't break
booting an aarch64 kernel, at least.
---
 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b317899a66..db837d53bd9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4519,18 +4519,18 @@ static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
     uint64_t exponent;
     uint64_t length;
 
-    num = extract64(value, 39, 4);
+    num = extract64(value, 39, 5);
     scale = extract64(value, 44, 2);
     page_size_granule = extract64(value, 46, 2);
 
-    page_shift = page_size_granule * 2 + 12;
-
     if (page_size_granule == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
                       page_size_granule);
         return 0;
     }
 
+    page_shift = (page_size_granule - 1) * 2 + 12;
+
     exponent = (5 * scale) + 1;
     length = (num + 1) << (exponent + page_shift);
 
-- 
2.25.1

