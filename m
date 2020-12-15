Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3420028lfq;
        Tue, 15 Dec 2020 03:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLo8ZlgU24hNaTO2X2lNmIUklMVDvPN4Sm7urzX56u8RJ7v4tOnpiwhFbvbaYBEfSai2GB
X-Received: by 2002:a25:1541:: with SMTP id 62mr17520933ybv.484.1608033216243;
        Tue, 15 Dec 2020 03:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033216; cv=none;
        d=google.com; s=arc-20160816;
        b=gwruCk0p0STbgMBWCVVgep4HBHpZqAd3vVawyYj/VDWkgEfwu7112fQLZHhmwlAUM+
         drDqlhS5CV+RDqj2nbRLNPXtf8ddZ37C29vFWvjZVG3zhu/F9ivJt6t78M/d9UPcd9bF
         9qvLYsXFnZPL5BJiiR2XAEtdMUP1I7iPovwePOx7GCVuZbKp5cSBmKNG9/Ys+2JiwX8B
         rEXl8OVDNs/Z869/fJhDRIFY1WAZ/yI1n1SlnwZ9Lf1uSf/BjHj052sRJnlG++AtQeFH
         7XqX/aN/TdAxE8lSde7EbvFvQHJJAkyRAyiim0H+dnZfD7sTjedIygTNxQjwcn2vFm51
         kw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b7X6ZhZmPEPT6XQXiQmgvsmnwZH585qSvwPbBOJ9qas=;
        b=R6SkNrUXZ5uIti5KeNaWCAf3SPlQ0Puav4AxT2q+x2MDffr5gmhHYDPe6oo/isr/Sr
         uZ5AfJgTo/2e5/sK/0jrxNjMqI9qruTQyecfW31X0jYLLniqoTDG3FEQZauSO1a22MJ5
         x34QXfDBLnYhGXiohJlMYZzvUnxUCe+oNFxqBz4T1UuspD4mA7MxqgvuRALsCgc4Fe/a
         jSXS2bqjfsJgSYgQQuhC8XNeK9iqMILMvQp2ApbaRFbJgUkCm8Yahe5txsz9s+dRf/D5
         antsxlBkVTzyKjoErCadq44N50Vn7gnp0ec+7LY+imwhPuqe0fMupzvA2uXCcZyDaqY/
         fHQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NKUCxXld;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si20449394yba.279.2020.12.15.03.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:53:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NKUCxXld;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8tb-0004Qo-Ky
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8oy-0007D3-Nz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:48 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00017A-2Y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id g20so10064439plo.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7X6ZhZmPEPT6XQXiQmgvsmnwZH585qSvwPbBOJ9qas=;
 b=NKUCxXldd5nyjD5lv1zo3Xcl5gQnPQuM4pROL5Yb/l5QK9GwCqxJV8oCGDigFf5uBu
 eAEVdIQT/7CrrTCFI+ou+mnj8DArkYxqKRzMADWLGvOiKknedENnSBpxVHQq9tG97eA7
 LirF/GExiBvdNgGRgRWfWpdHBeNdiutQUbpPHqhkRs+OValriLMcmKWCVBg0QTvnPQ26
 PHDHBoiIQOCoMXTGurxFYACCGkIYG+XrCfyxz3GCGZQrkLU+zWjTi5fIa64knRfZ9wy4
 VZ55e8OQ85hg4OpymJED52OXcbhXQ5OUQ8sZA1G8Vz0Nc5Zy+ld8HKybrp+bf7mEEHHh
 S3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7X6ZhZmPEPT6XQXiQmgvsmnwZH585qSvwPbBOJ9qas=;
 b=O56l/FVavhZX/GEtNfFioa4yaldt5LzqUoNumbzjmj+qGTfjcEpyYyrmvqTXmuc0O0
 C2f0urLO9UcGwrkMtGm0hYXrGMNM16WfBEcfdo/wZdYEHJ9FCDuGJ9WGgdyQ89XXeTjG
 HkoGVo3/ksDi+kwoToKHwdRAvw7wC16GqOL4vhvxk4oLs5JID8bSAidJxwrO2air9BmA
 Sz6q5n8WjAFRzXDo4O8Dso52b+wvSWPQVq2qEyhVT20Uwdi8R7qn8/T0EP8FrVlHozXt
 7HTNPKkRRyy1M8YUJO6IJuDeRr8YzJhQK6ekVyoJLzenk5rdLAbbxRB7wEJJ5eLHxYzD
 QuyA==
X-Gm-Message-State: AOAM532A4EqnnnmdgOUSUMxnf5jUxzAcClNRIdWZou6LyJWFFR4VBCKL
 EVWqSFFX6SA0gZHFKJEPytKb0Q==
X-Received: by 2002:a17:902:e904:b029:db:c0d6:5823 with SMTP id
 k4-20020a170902e904b02900dbc0d65823mr26719343pld.11.1608032924392; 
 Tue, 15 Dec 2020 03:48:44 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:44 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 5/5] target/arm: add aarch32 ID register fields to cpu.h
Date: Tue, 15 Dec 2020 11:48:28 +0000
Message-Id: <20201215114828.18076-6-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=leif@nuviainc.com; helo=mail-pl1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMj4QOw+kbyG

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efa977eaca..fb81eed776 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1823,6 +1823,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR0, VMSA, 0, 4)
 FIELD(ID_MMFR0, PMSA, 4, 4)
@@ -1833,6 +1835,24 @@ FIELD(ID_MMFR0, AUXREG, 20, 4)
 FIELD(ID_MMFR0, FCSE, 24, 4)
 FIELD(ID_MMFR0, INNERSHR, 28, 4)
 
+FIELD(ID_MMFR1, L1HVDVA, 0, 4)
+FIELD(ID_MMFR1, L1UNIVA, 4, 4)
+FIELD(ID_MMFR1, L1HVDSW, 8, 4)
+FIELD(ID_MMFR1, L1UNISW, 12, 4)
+FIELD(ID_MMFR1, L1HVD, 16, 4)
+FIELD(ID_MMFR1, L1UNI, 20, 4)
+FIELD(ID_MMFR1, L1TSTCLN, 24, 4)
+FIELD(ID_MMFR1, BPRED, 28, 4)
+
+FIELD(ID_MMFR2, L1HVDFG, 0, 4)
+FIELD(ID_MMFR2, L1HVDBG, 4, 4)
+FIELD(ID_MMFR2, L1HVDRNG, 8, 4)
+FIELD(ID_MMFR2, HVDTLB, 12, 4)
+FIELD(ID_MMFR2, UNITLB, 16, 4)
+FIELD(ID_MMFR2, MEMBARR, 20, 4)
+FIELD(ID_MMFR2, WFISTALL, 24, 4)
+FIELD(ID_MMFR2, HWACCFLG, 28, 4)
+
 FIELD(ID_MMFR3, CMAINTVA, 0, 4)
 FIELD(ID_MMFR3, CMAINTSW, 4, 4)
 FIELD(ID_MMFR3, BPMAINT, 8, 4)
@@ -1851,6 +1871,8 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_MMFR5, ETS, 0, 4)
+
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
 FIELD(ID_PFR0, STATE2, 8, 4)
@@ -1869,6 +1891,10 @@ FIELD(ID_PFR1, SEC_FRAC, 20, 4)
 FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
 FIELD(ID_PFR1, GIC, 28, 4)
 
+FIELD(ID_PFR2, CSV3, 0, 4)
+FIELD(ID_PFR2, SSBS, 4, 4)
+FIELD(ID_PFR2, RAS_FRAC, 8, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
@@ -1983,6 +2009,8 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
 FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
+FIELD(ID_DFR1, MTPMU, 0, 4)
+
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
 FIELD(DBGDIDR, VERSION, 16, 4)
-- 
2.20.1

