Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3418844lfq;
        Tue, 15 Dec 2020 03:51:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqGK+jk26Ch8dYCXKdBNkBBJ9m8u0YfopBK0WgjRqmf8TNNh/RCHEHXee6gWjY6JjZu5WY
X-Received: by 2002:a25:d0d4:: with SMTP id h203mr37858081ybg.274.1608033089563;
        Tue, 15 Dec 2020 03:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033089; cv=none;
        d=google.com; s=arc-20160816;
        b=g1af1u3QJw5PKQqv9eUVLySpP9/L64dFsxbeFQc99t2FWrPqhz7mTc6WeCeDvB3uN7
         XF3AqdFgKDY0Bwn14xWVNvyEO4G+1hvF3cLeSEzKoKQNg3rbntFR2+K1lzp/sgUmOHLN
         ZwapfmA+TkA6RovblKLTOwbKXrHh2PwJObsnMaftLdWe9DDu2BR/8AhNHSK6nQYq9aZU
         jtWEgeT3Fn+inF2gs2egg+1MPBa29OB0WdWSIPv65iRPiesJjcUD+YhfHQIpL4vZxzIh
         mExTwWkLpE+eYYRfby+5eGNMskv7FCpizSsHrs3KYAOjiNDle49O0K4Z7KOaL1uEuUtI
         pyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=junQgOuTu5FDmmp1xNv+EH03SvWJS5HmFQLLzAJVkgQ=;
        b=zxXo65/q/HtXacMf1dwcqltJtH1luvkOFdt1uKT7OwlegRaDWGqztWA+YQANEzgOU8
         dIPdTEm5VJuqbxx4EhT4R7RwuqvQH2x1TvS5wjwbd0V2lPp7EdVFM/VhuQgYZ0ushTdv
         qMQJ3WHOH5SKjZVnGBcuwoxrd3cdsHtUhGNlvcls8VuhSV/TXqH5B9YIAcKHUfin0kr0
         T8gl1uy3EmQ3r3OukoVJ/p7eeCLCNAsmKGxYsRRGRb/l9ni9LFVhiVXtAxZTJMBJ0s+T
         DxlvAr2zUY8RQ1zxld/9MFvtzlAmisjOnJXg0SPHmbsFK4gUapMBbF5iv0lpddyap8dA
         vLbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mIitDwFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si5838214ybn.462.2020.12.15.03.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mIitDwFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8rY-0002U5-VQ
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078V-Cb
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ou-000168-Vd
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:46 -0500
Received: by mail-pj1-x1036.google.com with SMTP id n3so1961575pjm.1
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=junQgOuTu5FDmmp1xNv+EH03SvWJS5HmFQLLzAJVkgQ=;
 b=mIitDwFbwPIzJnuRc49MU8EBnkQtkt39LRKLJeW2v2Nvo9czdTTTqkxwK9KabuVqyJ
 8HYWDmHMNdGaFcq+l6gen1I8ymfHqK5qjQ/0ngGVz0Pw2qV/oYwqPHUQrEsTSjfa6l8G
 HHalsWtj26CqXb/wX+lZqgef/pZ+Hd+G7cbDzKCC2Mv5t6Q9KPs5cX5cUqkDtHyx2oms
 o4wOflcAKy8Eijh8ryKV3j1u+/4iRD1R9PujPb3/dg4UgHgYewnF2L51d8ilO70UGbCX
 +sOGPi4H44K8gX4b6lMoXNJ1B/cyJZ1qEdw+uknE4nSJI9XxMIhGPX+JPl+uorEDExQW
 bbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=junQgOuTu5FDmmp1xNv+EH03SvWJS5HmFQLLzAJVkgQ=;
 b=uiUW40RxoV9PcPJXfFhvA9qokFv5bHmMU8VXZt3K0cbKw3U8jZFKz0vZ/VFCQuYeF7
 mG2nHDoZd5Gx+Lqtl189FBXcSxWCLNvzJiCQfiMLzK+sSPI+3+n0OYpqimzQoYogBGTW
 1RByEF9eppZQUZ9AUpcUuTQpx8vx9DtinboirxgwAR9hG+LosikX42w1zgEN20xQslX5
 6LtjAjZ+zyZVlCANn7k9loJVAy7kPHl1fHJa1tJlBb3Ov6qI/KMnkl6B0xSrMG9QVcdL
 HXJAt9VLxTpi0a6c95yMHCxei8nWpn2ueI67mLOlGbk8+gdC7ldj9MTEaLyr2l4kq8N7
 0hXQ==
X-Gm-Message-State: AOAM532cVXG/VKR8FP7oV3ayYWjBsLc0IO6rbRJRh3wNMRyFZx9amWnk
 5yknSPsqyMDGHUkjYSTIQJsBy67JO5Vo4bSAvzrSrWnejDOOTV0ILfUZMwmtutm/KuhVRUXAFUX
 GIBvgPmyGqq8P/OHd852l6CiBANfPXIYqNbS0VlMmvhbFBx76ZYR4G5Fphu9t4unF
X-Received: by 2002:a17:902:8643:b029:da:d5f9:28f6 with SMTP id
 y3-20020a1709028643b02900dad5f928f6mr2276740plt.8.1608032922480; 
 Tue, 15 Dec 2020 03:48:42 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:42 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 4/5] target/arm: add aarch64 ID register fields to cpu.h
Date: Tue, 15 Dec 2020 11:48:27 +0000
Message-Id: <20201215114828.18076-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=leif@nuviainc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ma2dqOooLnzI

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 90ba707b64..efa977eaca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1895,6 +1895,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1905,11 +1908,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
+FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -1923,6 +1933,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1932,6 +1944,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1958,6 +1972,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1

