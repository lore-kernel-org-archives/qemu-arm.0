Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4020497lfm;
        Mon, 24 May 2021 18:11:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDNhzDQnirVZNuIK+vzN87coz3Q3J2STy+55DRiFM9cEzMSioc5KvEaWvfRPX4POZ9uM7J
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr24210932vsl.9.1621905116841;
        Mon, 24 May 2021 18:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905116; cv=none;
        d=google.com; s=arc-20160816;
        b=iv+pFA0coc1cyomgPEl8PxYWCxqHN7q0Tn5jSbK/u0mWcTuSkLWaqjHKa1cRsQVeVe
         lXUNdABYUNsFpdXxhmU5VEdqj9Uexi8LYN377c9PHUy3CQyVp4ifddzB1+NDtjplspMx
         tiB2bt6n9qIJ5jg8ugCMzBPt5rg7CBjhnUs8BSIKcHdZZtbNIuJtG0E7rhWj1/S/E+dg
         X6UIwe1CpCYSlj/mq2qa/hCyoulV5z8pybZ1q+YSRuqVTmlqvy1RZoU4wdF8hhtznZsL
         CaXFnZ05D5PCNV/6ksLQrSr6ZaSeXb70mzpbm5bTUI5zHiV2VjZSIm5FrqEs4pDDzqvk
         c2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KUNHHrwNpMX6FZ/Id7bckirr0h/yO5yVC29ynoS1sek=;
        b=Y9VKemZu6QytpRHR9sBOFCT2ZChKgiz8qZEaRzLu6XjrWWw3COJ9kfBgY8zYOUV08/
         3AIiVXdSh5HgmXRe+qXCG5dc9ajlL3jyq1xXxezB585mtdCPgrbxWB4JIMwstG8I12xe
         bGQvkCgSu9njzl8x2lNf/EwvMXTCxxqp4oHZ9Ww3eKEx5BCZrKipULxjr9QEd2Qu9iGa
         8LxMUwf7y7BLjJ4bnWE+B8TCywyC1eeavOvsayy30s67+h2nOKbnlGOOY3tDf3E0eefJ
         gsV/SK5Pl3r9EYo8f3R9dW7VOnx1c4uwvYybXwMEmWCuucVZm2HCxe8mVbHMLUwOf69J
         oR1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jAsr3wLn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si1951812vsf.54.2021.05.24.18.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jAsr3wLn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLbw-0007Om-6P
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUW-0001XN-8C
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:16 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUN-0001hG-Oy
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:15 -0400
Received: by mail-pf1-x434.google.com with SMTP id y15so10875295pfn.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUNHHrwNpMX6FZ/Id7bckirr0h/yO5yVC29ynoS1sek=;
 b=jAsr3wLnq718wsfb96Q6c+5GsXNQ/4W0rVjJeESdtUZMfbsgqh1qL5Z6oTWwrCmeNO
 OYaUr8a2z6jifQ02/URsWolld9E/4OkGIujBNoEyI+8YdpHYlp4n3oSl8diowWuKHKyE
 g9OG1AQZ+pyfvispYdVFumrZAVxGOPDGlKHAW9YJ9C73yFUVKpUu8+XXP2kjPRjNp5Ne
 4BGWmNdgDgSNUiMP4C1hWxeCdJS9Q4gteDYVTgv/rrAuqU8oT5sznFJn1YWlHnSJHnze
 nvTQvAHSAresrK16NBGq5wTGRzHTDLRvp9CvbUGMebsiwkIT+L31392/LQZMb5/7AOqQ
 NsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUNHHrwNpMX6FZ/Id7bckirr0h/yO5yVC29ynoS1sek=;
 b=ZA3uaJa0zzZ7dwMSaldnYlI4A+MoX7QaehhtDiWU2SY3z6U33tLX7/Kxu4Q9qeB1Gj
 VgNZlpccGnWPIX39w5LdUVFchBuCcFo48uYo4FWK5Yv1aAz0WxG9zpHfsEs/an4kdeqk
 ROLxNDhGIbVe/e+wjVffrEuYnVy8mMYnwaUFxAcGfMLDgoSkWF3+8htUQGMJHNmQ6Yf9
 x+e4PiT7jJTxIwloouZVRzKGdbfUlVi1dHM8ouwZnlCRmR1EBsmrI6boCwV4FdOWWC7T
 NhPYTdmpjLhJTMSQ8N0pf2mEt2y5UjdR2OdudhPwaWuAN1TsjSMonLbeXBuDJr1KZXK1
 tZNw==
X-Gm-Message-State: AOAM53099yKZiGInZD+7hOMnDlWLZSKCba6/FSX9FaIMS4ssWWCuZfKx
 j8gzyDUTcJsoMyAVX/wMIe5M9Hc/JaAmhw==
X-Received: by 2002:a63:af57:: with SMTP id s23mr16469666pgo.393.1621904646427; 
 Mon, 24 May 2021 18:04:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/92] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Mon, 24 May 2021 18:02:37 -0700
Message-Id: <20210525010358.152808-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLg+yA9jp1Y5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22983b3b85..ae8323adb7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,3 +6016,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1

