Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp737908lfq;
        Fri, 8 Jan 2021 10:54:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5IKnVRZI7uHnC4+bUsyw9XoALYKwTIJwkloCmp/KH/X9qMEIKKXVdr+D3srXlEMhLK/qQ
X-Received: by 2002:a25:42d0:: with SMTP id p199mr7791724yba.352.1610132066622;
        Fri, 08 Jan 2021 10:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132066; cv=none;
        d=google.com; s=arc-20160816;
        b=jHKOy44V5rIH/UnvPq8urUp93KlSmPktvJFMpvr/dZjptFQB6S4fkoYALHdUcKpvj2
         CCPdrPprADV4cjVVQs9ZmVYD0DnQThMHYC+1SQbWBMAtrDWlW/qZWvwmZ9gRcdFAYaK7
         0mRlrE9g6Rb2pqNjJFnKMnmSURc2MRaAPXJIQfAhDzRdv9hJPWkLRyfG71GP97AED4Hn
         xfS8fLVk7kgI6oFPnJKuNHgI1ZZ8M6mxu1GxdqDtxlCtPmEXdv/q5nlmN6sQfCa2KPVm
         lEvc6rc8ZhTRI0gPt1aONBld6i/IWZqtZultIY+6e4CGJ87lOefcYPKVXEVtJUf1VbnY
         5N/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G9DNKOB4bf/aDdhp+8z1U9qK/OVof8+z2xA07VIxIrg=;
        b=O8nTKyoMQ63LVDYk94Syw6lcvy33s5bqWMhDSLd8YrFLEg2F81rghbCXo5sJMjJ0MU
         qsEHUY+mxK+Y0rTET+56vjQAfcoVkckqZhjcy7WeC3D0Et6ilQW3OAI3jSgSbCJ1CEm/
         cEYzMSzJCacQ/q+RtfYDl7CGGIHdYIH0RMJ0Ptv7GZaXH4XExS4zYG0Z8BCZeyNnM3UE
         UvlOrfg8a4ookzUxYgmbhMvWhhQfyQEkiWEvKRsVxLRgZmOl19oTAGKKX70CUa2HEBBf
         scDnSSIkERuQYwzTuz2S/dgfDwimogGoeFizvqMFFg0oLPPljFqrEFsekK488yQdjoU8
         o1Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=wJKRhsG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si9487387ybc.407.2021.01.08.10.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=wJKRhsG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwu2-00067A-1T
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrk-00028y-Vt
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwri-0000v8-F7
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id d26so9927001wrb.12
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G9DNKOB4bf/aDdhp+8z1U9qK/OVof8+z2xA07VIxIrg=;
 b=wJKRhsG4HvJ9BBuWBhyh3QW5KEC6FQgj0xXAQYW8f5P4m923gPdc51UruCvPJg/zRE
 Z8YDQMWshw28YxIrdySv+xtWEJLgOaMAidgHptRzAlt+VXajSAnuUfTC4vtkIjqYjcal
 yC8vsqB9x3LcR1DIK9EAY627IWdIin34FD5v39yXCWYj+cB0dqss0v4eD63zpPJUuWJd
 7gkaIlv/ApgWcbSzvMYKWAudMynX51Qw44RO+nkXhfDd6lvUEGpTVI8GzGLHfWWWJfYs
 dnszaox+sHIkNVB5zqlg0tM0Auvjzk+qIr3aS3VW+ANYk/89rMh9pfU8It6lDY9pvhiT
 UC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9DNKOB4bf/aDdhp+8z1U9qK/OVof8+z2xA07VIxIrg=;
 b=V3JZWRskY4Av5F1jHgumy2nC5Tc2sJmhgJvMtjVBkiJxHQkJ3TEeV5dgC4TzXxFajf
 /4edIUTABOhZsMPdEzd3Xyq/lauqd7DLm+E+uFYzZBheJM73yyWKtlEM1jmGtqFp95Y1
 YBWmh/NuMro0261spKTSttr4pKAXy+MmlRTzMTeL/FlcRfxBen3OpbMcANgjOqRbL2Z9
 IcHvtUULMQLBbMiVntsKw6P7skfeY11xQsBGNUa4Za4OCLRKIVTp41lBxhPM0pBJ+D5n
 Egw8nXO7KH0MfhhGM2gC8uYbLinrHz8KeOnc+5p/3bQP3b+lh8YhAoLdsSK/E1PyuL7Y
 i5mQ==
X-Gm-Message-State: AOAM530ZnS9fZOnUks4MWWyA6M2EHksPgUgWnVu+u4V4twsDx6yhlkPW
 ZAXAALGx/TVF9saPMyw3Fl0tvQ==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr4907450wrn.316.1610131921052; 
 Fri, 08 Jan 2021 10:52:01 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:52:00 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] target/arm: add aarch32 ID register fields to cpu.h
Date: Fri,  8 Jan 2021 18:51:54 +0000
Message-Id: <20210108185154.8108-7-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x434.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DzzuqC/yyPy3

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8300341a26..af3cce51f4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1830,6 +1830,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR0, VMSA, 0, 4)
 FIELD(ID_MMFR0, PMSA, 4, 4)
@@ -1840,6 +1842,24 @@ FIELD(ID_MMFR0, AUXREG, 20, 4)
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
@@ -1858,6 +1878,8 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_MMFR5, ETS, 0, 4)
+
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
 FIELD(ID_PFR0, STATE2, 8, 4)
@@ -1876,6 +1898,10 @@ FIELD(ID_PFR1, SEC_FRAC, 20, 4)
 FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
 FIELD(ID_PFR1, GIC, 28, 4)
 
+FIELD(ID_PFR2, CSV3, 0, 4)
+FIELD(ID_PFR2, SSBS, 4, 4)
+FIELD(ID_PFR2, RAS_FRAC, 8, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
@@ -1990,6 +2016,8 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
 FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
+FIELD(ID_DFR1, MTPMU, 0, 4)
+
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
 FIELD(DBGDIDR, VERSION, 16, 4)
-- 
2.20.1

