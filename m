Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3973643lfb;
        Tue, 8 Dec 2020 04:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrMIBFUvPxPEsgl+4gOHUICHFRrvgx7ZpgE2urBYrCZj6Eyb23HdAPFH7bvsui2DuifN42
X-Received: by 2002:a25:7909:: with SMTP id u9mr21860685ybc.333.1607430454943;
        Tue, 08 Dec 2020 04:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607430454; cv=none;
        d=google.com; s=arc-20160816;
        b=Qul/dXLAmCRFoTd/nnXrFkzVE2D5VoghabySDauYu6apA7HnDScBN621ZLN4mAw8QF
         ZhbqL3lP1wG6lsPnSQjUngC1Y2neJPEbFB07nIYc3im+9JCnW2RWsNWR4y+Oqr/EjUsY
         LYRP1OJFw82OzhbNyYtwsGtZJ4A4SxWMH58X+tkyGn474VAkb2CcHiPUJ0JnxGhGAmEc
         PaT3w10LPsOevJPJqqOGyffXcHHEcprJJzCRHcFsoxFZ6COUQjiLd3oc5sYX41iT7Fss
         9cXU3sXSpdCeFfpidHAptx1YXv50voU4fZIUgEUjfgQMlSxLh2x4T2I/AQ6pNNA492Ub
         1gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VJyK9Dku6QtLgbsw5adpDcTstA66S59krX4mFmun8KU=;
        b=iEeeqJUJUyy5i11E5YP3gxgFdroxhQujWYIkC7P0EJZIIjdDePzUlSEoldANR0v68e
         xOBdhso5BNp+7cmYbnUyqliI+hO9nqQKEWGIOTd+oS8ifIZI7kUqiOHr+HNCbiO1U+of
         kXig2Rs37GzvkHasAwq88+4VmOcTjcMKl8a4eecQkbrleeX2o+8cegMtu+lLX40RzWTb
         ipKn17QZcV2Xi2vkILbLe5XDDX7SQdYJrh4I35vtmS2wFFScPlkPllq7Wvh8TPKodSdn
         isPGBOYHKN1DhaTdrVn/s2rVSh5ADzNER9HwZ5q8cLcz4IAHqbn+cYlGrcF0ozlzRzcd
         Wv7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=J5VJH565;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si12500959ybc.210.2020.12.08.04.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 04:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=J5VJH565;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmc5e-0002VC-Bl
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 07:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1a-0007Sg-Ol
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 07:23:22 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1Z-0005nP-Aj
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 07:23:22 -0500
Received: by mail-pf1-x436.google.com with SMTP id 131so13745819pfb.9
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJyK9Dku6QtLgbsw5adpDcTstA66S59krX4mFmun8KU=;
 b=J5VJH565XkS9uzlkCcwXEGZoYvCD71vyT6mmtn0IvTtRMCVkgOhS4NO1QCRcqpeZ74
 1bv8JO2DWzF75K4KAxs1SpHMKofdTwMkNwHWdxusGyW0RRdwqhhBqhBSKZ98+7Kcsfed
 zhBk6DA/HJ+A4xwX/shsfmsueJ52e2ENHYDO007n1e1AHeMOyjpPQLqaPg1LZD4Uje1t
 Gn198lPqMYZ2aA5hXtMN1ZX5KlNfpSs0cwi5pWxOB8vMcp8byg/cxFNBSQkYSBe3e7/G
 UT2tW65MCAExD6FMFn2YTCqn2BlAGkH3GQpwbcNiHuQns1Ur65VQajzj1mtryThaFM6z
 uoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJyK9Dku6QtLgbsw5adpDcTstA66S59krX4mFmun8KU=;
 b=CzXndhqr6mZAjcs3v0/29fXHsEl3UxtUAkVExUDPnKrM+wQNg6kfcF/CGAUodi3GCA
 AgndwQQuqVKzHClYOqaopx1a+fMaul2zJrZBkH/Pe5KJMrSqObSv8o+LK1eIreX4IX1T
 qSYv940xW0qUqnwjdgGnfABlM/DQ2ZWmNBy0mO/uxnxv1o72lBDT22qLIgZvdhKevZO/
 aHC6p178alRl53jdx+E+gaHsBmbun61RiDlBRmleXcPWsxUyhxbxaH/jfk62jY885lDC
 6eGU6zVm3izQ2lSiGfcsCjh2iD30ApVznp0zZo9g0q9O2qNRUUiVPeb2qdVLRxNGpHhf
 OMaQ==
X-Gm-Message-State: AOAM531CW62IpQ8UF3PY3+ivYddfDa8U6gomMUSnoCtDNVdt87AP73yD
 ME5yQ+E77JV227HmiZWtVQoELvVLcdDQKbvqop3tGXhtoLr/HXrVW+y/OpvuvAnpIjFk1CLLfNJ
 TXW2QA7qvu2hE3XqylqgpWM3tKf4SCWoXzg16C9/ai4pKcKZFLE9PeX9AWzy+sllO
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr4102627pjb.128.1607430199842; 
 Tue, 08 Dec 2020 04:23:19 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:19 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 4/5] target/arm: add aarch64 ID register fields to cpu.h
Date: Tue,  8 Dec 2020 12:23:05 +0000
Message-Id: <20201208122306.8933-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=leif@nuviainc.com; helo=mail-pf1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HF30hCt+hcSZ

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e9e8061f7..2a12a5ce92 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1863,6 +1863,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1873,11 +1876,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
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
@@ -1891,6 +1901,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1900,6 +1912,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1926,6 +1940,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1

