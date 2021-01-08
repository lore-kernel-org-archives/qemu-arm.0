Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp737105lfq;
        Fri, 8 Jan 2021 10:53:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl9cYZTa1Oybb1yhS+dPbkR6KdZemYnQqZPhxpRcuGLto7By712RTq7jQFZ7JQvNgayk1C
X-Received: by 2002:a25:4f55:: with SMTP id d82mr7559547ybb.466.1610131980997;
        Fri, 08 Jan 2021 10:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610131980; cv=none;
        d=google.com; s=arc-20160816;
        b=clTONcLFOCaL0LElFdq2FTEGUwDohGMtck+BYNsj//X2hB5/B8Hs1I0PenWZTymwI3
         L9f7fVf6QEnzu5H0FfqfUAPxOCtxA8Lu6sWXyNkdXBJnutQsS2lXUpc0qnlNEEhy5CCD
         Drq3mgXUkBDdTMHskrT4zCx6fyosXl3ksEBM3D5Dh3qmXY8++1WpV1pIJLrfwryzf1/8
         nUNdYRR165EZNWbWOxKp5W7gF/aSbYUcB9YT4AcBz97iQ1SbzDNCjrzruygedA0bMfIh
         gG9WBVFPJNDAnuFP++2jCxymn8iVTKL27albcWEaXOAL61LyakOnUKr78Xufp+nmVAPH
         4ZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jBQ465cDwNWEY9JJSZIV4j2V7wZd54tnbvPI3yNzMNM=;
        b=cbz13fFnp/8F0I/JZxRs4kVflZpndTwPhQq6utIQI3rD/uXvg0/BUOZCLLb/e2/0zB
         ok8FTyKFBmQ1n4ybmWrK2B1Rm4Ex8KjQLBtjOjbZckHlG6E17CmqDG7D4Um28Pem22NP
         QQxMYuRvYEg4z9oyKH8p9cKUH9vwqsPnd6ebrvcCTTtG3IArl86BjVp2b1XoE9w8yHqy
         7uDmUl5ZJf9XjnuBX6a1ez61GM71L4h/nd/aUxfCPXPdBNeB1hU3hB7p0wXveQwmHeFH
         5da2fR3gGMmonVQKdO73GLABk2Gj3YbHqW6ucU6fVWoLBPdJTM1h2u+if26Klti22+9y
         FxXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=vp8Ofeqf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si11027672ybk.154.2021.01.08.10.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=vp8Ofeqf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwse-0002WB-C0
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrk-00028u-V1
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrh-0000uw-Q1
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id r3so9987775wrt.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jBQ465cDwNWEY9JJSZIV4j2V7wZd54tnbvPI3yNzMNM=;
 b=vp8OfeqfLFLbNMdMqRns1yMGUKLSVz72PkW0vPlqPz+zSbelo1mAwvheuK0x1g3Qm8
 DhTzu5SRn9sDQ8rQG0ZeEMc7F71HZcOUqJlfZNoavr1eNWi1impQYbIWpiC4foH4aBR0
 R8pUpQJNrYroeIEm5f9sV7YLEJFL3fvRSqoI/t2k5pV/DRt5SMZteQt42a6zWRulw6c2
 HVAWYMfhnac/i2tSMHOPlIj71yAa1S1kmaFCG+Gx/m9i31mbY5Nbnn8pYHbdYxFnX1kM
 FdGUvV0wjxLxtSLTfgbkK2AhHosiv+Uh+wdzd0zNT7MrjCa57B8lTeaRhXVMmvWN7Km1
 CnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBQ465cDwNWEY9JJSZIV4j2V7wZd54tnbvPI3yNzMNM=;
 b=MIrFNnHPzE4FYCWSIwAr9CjCraJAdmTvu1z4pDnGsKkYov+PEH/43pyBeUfEvkf3FU
 liNNI9oj4aTqMpEHfq8X8DXflf/ol2n6AQG1Sr4X5FFT2PNyGAcFvVbulWJTERVbT8L1
 C+LDOdg7LUSSaSOXVFA+boFdz6+CnMIWwRpWbaqnKOK1Sde/Qk+N9R4JOBoYWx6mg5kL
 fnpSvw41Ki/OYH8ms6TKwaBEq2CBi7ZO0sSRpuM2NhrdOtfZ6vQw+8oqttoeVcsloD1U
 iLScrrzX323UYG1gBkxR56GnEGkwLH+StboRMvlv0GDLUQPqnFyEAw0AaCb3fcYHeLVg
 QyJA==
X-Gm-Message-State: AOAM531kEujZctG+N5EhUZZTD9Hljy6dSmiqXxqoPqtHPdX378215N4O
 hST/aBO6ZX1j3/G/OZ9GCibu4CloVGWLzu5AEbKwfLoHdne9BTHKtuhluzxBFR57pJn/M7IZm4v
 aArN+hFfaLGrBVoxNyjymxOWKkX11xr36bA9RVHVSRVBkF81E6le5gffLafA1KJMvApG/dw==
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr5090150wrx.53.1610131920213; 
 Fri, 08 Jan 2021 10:52:00 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:59 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] target/arm: add aarch64 ID register fields to cpu.h
Date: Fri,  8 Jan 2021 18:51:53 +0000
Message-Id: <20210108185154.8108-6-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0EJPHzVeS9tN

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18c1cb02bb..8300341a26 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1902,6 +1902,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1912,11 +1915,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
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
@@ -1930,6 +1940,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1939,6 +1951,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1965,6 +1979,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1

