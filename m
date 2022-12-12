Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3373136ejb;
        Mon, 12 Dec 2022 06:27:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52pqglUNepttkqXs8xF1Z0p5Hs7yWqWO7e3f3aLGJY2Z23+X87EhAlzKPh1SnMuQGzeAdT
X-Received: by 2002:a05:622a:110b:b0:3a7:ef75:62c3 with SMTP id e11-20020a05622a110b00b003a7ef7562c3mr34730837qty.44.1670855246182;
        Mon, 12 Dec 2022 06:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670855246; cv=none;
        d=google.com; s=arc-20160816;
        b=jEnIthKbacIAqIGIDbSCasTDj3bEgilt8zQsJMpMgeUV24sGCJFuz6ln9j6BrRQmhR
         kYxrZIGcwBj7yp219YzCd4z7rBkHENTAu7+cxJlsZIPDKK7W5wJvVCgYbLQY7uQZbMt/
         paIU5X2ohrCIFopTSl82rn0BHu1BPVmStsopOpr5bwvRRwqN2IRCdzP9AzZLYbOE/gLS
         bHny+aLfWud+e2lChWoWJ/DcS4rtRTfYUXR0hQI8kNSOuWMIOVPXTWGiHnI6PD2hZ0eg
         oWQGBE/gI27QPKN4zp/nKLJXUKxKhfAmbGb/nJnSQzrsw0LBl/FfYmHjywX3E12CHvXj
         32LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=kt7Ghylf7rGQFKKAbtd2vnJIMc4YhVzESoBE7byDclo=;
        b=rTE/SEinoJEWw7uJrjdGO8EXHis7gok6pO0P/GsHMego9pslH5vc9By+PUE0xv4y2l
         juwoBo/nVALPKRJMDbquop9PXkUzCDQDTrnMVACdV2ydGmF4YJIYUyjF76zuZJTrXxP4
         4fOxEJ08hKqpr0yNlricJuxCPGJRlS8ON3y6yvX8JdZLfSdGIBD7mSVkygCjAdiJgz+2
         ZmXleo+MHssabCLthQYqjBpQP50DVDHM/+K92R6qmXXAc5mLiTmsOr9okJsyLez1fpDc
         yrKUPTJgi8p2c3zSA9UHJsX60e7vbjaoaHHcLSQzMAKtcfCZ7tw/Dp6LSFFzjs3Um1HV
         WfZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PKwbZ6gR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020ac86042000000b003a6861d838dsi5245558qtm.551.2022.12.12.06.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Dec 2022 06:27:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PKwbZ6gR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p4jm3-0004YC-6P; Mon, 12 Dec 2022 09:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4jlz-0004TX-JA
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 09:27:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4jlw-00063d-GC
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 09:27:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so3307597wrz.12
 for <qemu-arm@nongnu.org>; Mon, 12 Dec 2022 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kt7Ghylf7rGQFKKAbtd2vnJIMc4YhVzESoBE7byDclo=;
 b=PKwbZ6gRCupbG9MC6qrqbpPaWPFxdOjW5QKnQ1jNc/j/IsAimbus1oXNu5aJMLfDRc
 7zYLI5IuMb+/1IBrrB/xio2rjkm3ENG6giK7yIhyvLrtQU6x5luu4bUnBogMmlxfM4je
 RBhTLBh4yk2GNDkIPYFzXTbJsMBv4PpP4YLN0sWDhhZ8D+l133kgjcTIF4uGJHcy/ybY
 ok9uSfOBbY534eSQjmpUGsd5xfsKRXkCsdTarSnSWg38zRby6lGKc+oyqDhiY8z4fJSV
 iP8gVTCy68iNAusu1H92N/IROnimvxAK0lRkXjq4PbXMNopUSRq2fQL2BjIs3+5a0xxo
 ubqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kt7Ghylf7rGQFKKAbtd2vnJIMc4YhVzESoBE7byDclo=;
 b=ziekm1rDcsk8BOPHbCguulo8CQxtIHpkN7S722MYkx+O/aRm8DUR/k6QMbx7SRIoOF
 uUmya1Ai6s5vX+s9KFJC2kYtJD5qWQJZ/yatcGgSdEWrqpoAKVoUX9pBfwD255iagqIt
 C/XTHtYKQ6UyeaR+o3d0QmZjKzvx9SOHGQpPGuvFp+15Gi/PPEgWAuSKiOWEK9sQ+Zdy
 b5OxTWoZCXrCKeTcrBSNHpI9EdiDOTWwobgyl6hIbutFlh8Tr7icOzri6dMdy7ksqDJw
 S5ND46Is7UI4uocUqkAZy+mtcvlECL2bR8CmYRvah/b43XwNaymi7jxeues9whef8yi4
 VyQA==
X-Gm-Message-State: ANoB5pkm+KFoDIFhR/gpyajsxKAc1XfQGMk1NlTd0YPOMyj05d4CuT/i
 O4bKPF7nkMmemN+Ym904hrcqfzdaOEHIPFJW
X-Received: by 2002:a5d:690c:0:b0:242:3fa4:8217 with SMTP id
 t12-20020a5d690c000000b002423fa48217mr9952194wru.50.1670855229958; 
 Mon, 12 Dec 2022 06:27:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d500b000000b00241fde8fe04sm9033524wrt.7.2022.12.12.06.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:27:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Tobias=20R=C3=B6hmel?= <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH] target/arm:Set lg_page_size to 0 if either S1 or S2 asks for
 it
Date: Mon, 12 Dec 2022 14:27:08 +0000
Message-Id: <20221212142708.610090-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6U408LR5ToxD

In get_phys_addr_twostage() we set the lg_page_size of the result to
the maximum of the stage 1 and stage 2 page sizes.  This works for
the case where we do want to create a TLB entry, because we know the
common TLB code only creates entries of the TARGET_PAGE_SIZE and
asking for a size larger than that only means that invalidations
invalidate the whole larger area.  However, if lg_page_size is
smaller than TARGET_PAGE_SIZE this effectively means "don't create a
TLB entry"; in this case if either S1 or S2 said "this covers less
than a page and can't go in a TLB" then the final result also should
be marked that way.  Set the resulting page size to 0 if either
stage asked for a less-than-a-page entry, and expand the comment
to explain what's going on.

This has no effect for VMSA because currently the VMSA lookup always
returns results that cover at least TARGET_PAGE_SIZE; however when we
add v8R support it will reuse this code path, and for v8R the S1 and
S2 results can be smaller than TARGET_PAGE_SIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Specifically, this avoids bugs for v8R if either S1 or S2
MPU is set up with region sizes < 1K.

 target/arm/ptw.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb2..2e7826dc29b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2655,10 +2655,20 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     }
 
     /*
-     * Use the maximum of the S1 & S2 page size, so that invalidation
-     * of pages > TARGET_PAGE_SIZE works correctly.
+     * If either S1 or S2 returned a result smaller than TARGET_PAGE_SIZE,
+     * this means "don't put this in the TLB"; in this case, return a
+     * result with lg_page_size == 0 to achieve that. Otherwise,
+     * use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly. (This works even though
+     * we know the combined result permissions etc only cover the minimum
+     * of the S1 and S2 page size, because we know that the common TLB code
+     * never actually creates TLB entries bigger than TARGET_PAGE_SIZE,
+     * and passing a larger page size value only affects invalidations.)
      */
-    if (result->f.lg_page_size < s1_lgpgsz) {
+    if (result->f.lg_page_size < TARGET_PAGE_BITS ||
+        s1_lgpgsz < TARGET_PAGE_BITS) {
+        result->f.lg_page_size = 0;
+    } else if (result->f.lg_page_size < s1_lgpgsz) {
         result->f.lg_page_size = s1_lgpgsz;
     }
 
-- 
2.25.1

