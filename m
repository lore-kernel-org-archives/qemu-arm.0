Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp168675lfq;
        Tue, 12 Jan 2021 22:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgAo8VnbYfzYnXd7WqA+bSWvy67PaU1V/a5Oaf2RyYgWgfgmEIAm+aP6ftCLjMQOKaeO8F
X-Received: by 2002:a25:65d4:: with SMTP id z203mr1245384ybb.232.1610519376369;
        Tue, 12 Jan 2021 22:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610519376; cv=none;
        d=google.com; s=arc-20160816;
        b=H2vA4TE+rIVLi77/QHip4UMWNmKK7TIyIkIFPdmDpTBmoDVOAht49QZO7MsfBPzCS0
         y3+rvhYxe3gaYpHCvrp0BGfLCTu0cQ66TOmmcVr40pvEwXUNh6tadbaEt2ore9Xx41+j
         ilXEL7/5OuSnE00I9DRS7oyxIn3u1w2KiGq+b2BMIEvWqtykRRn6dBCYO6u4lbSaQEOg
         N+VCzQDTsvTZoZyzMvWdnb27kg7rDFY57cU83vpp8L+KnEFQTM3rZjeEz731GbYGaoCU
         Jnfel2srUPWzRyXYDQmCQNlBO3FhbjQ6IA4bWfqgiJPLLE7vPZ5f+CtvjyArGylK3WK0
         Xm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T7qIiA2TxHKspGb/1E//xY6dg2vkOf+MJQ6vthvW+io=;
        b=frm+tFNkDHEf0y43QNao9glrsGFCkiXUFhXhoSzMVpr1mAGli2muBnPeTL82H6T3uo
         4MVnOh2Qkej08ayCJZEExDn6QnPWZbpkCdr3MOhA1kbi7hjVgAcnyKUnenEpW6DX0hqn
         nxR1UfmfweNIkO2I4wI1C2xTPo+9UgMtAG+zRkT/v/CTkRnyc60Xl7f3iz4xNPD/0RIH
         g2viJjzfMmFNwFfoomd3b8Z573JMIVnJzK1KX9sHuFt9nm4/LoH/Anysx08aTZlI+OdT
         HXRhGiZpVBgHAJ6rmNK6sTnwejJT9W9ubQC67MWTDpL0cBFleTTEhn6Ifcw/r0CA4nB6
         /agw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jJ6Ws/2w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si1207776yba.276.2021.01.12.22.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 22:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jJ6Ws/2w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzZex-000603-OG
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 01:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcS-0003xr-T3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:00 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcP-0007E0-QU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l23so527195pjg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 22:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T7qIiA2TxHKspGb/1E//xY6dg2vkOf+MJQ6vthvW+io=;
 b=jJ6Ws/2w+p97yRAO18F8fzwrOqQQ6U4ayRQ1xdosoE51b9ptNJpM7p5cNKpPHd/Uaw
 iTKtxO7cjcceaLErOI3OJdGAv8vLmPaatOKufTaziBwKDNfucPj1TPsDtINPwc59Fk0p
 n6bl/g6vny2kgpSIy0elhzMF/6S8slJO2RgkKWv2Wf1CXD/1cO5KUwSgkYcQrcCL1RBZ
 UiTkzaOoEbVOSxaK7A+smRTJzrRbpoGTiQMRTcdH+q2Y9tscpgJ6awPjjZuRj5Ib8iFA
 v2Bf4wQOWP5A4Dd1rOo5dqtIsfrYPIjm051xp+bFYJrPdINZYfCe+ENPL4mwy6yM6M0m
 2eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7qIiA2TxHKspGb/1E//xY6dg2vkOf+MJQ6vthvW+io=;
 b=JyuCh2bKB60cZ3mr+Y8W5oQZ86b6TMI4H/+bEp+trXilSWghCloNLx6CvAuWgwJIA4
 3u6DHwAGJwNcRLNSGQWylw1SJy9bpjS/2TssQxOHR/1sM5MugNAgNv1QqqDDD+2bFqjj
 sgrBNK1IhMgcuRT02pVorBByOnMI4h6VA76bDw1ajJaJuOmrc7rRqDSrLHdq50LI5Rzh
 a4uys9jMN2CdYtQJlvO3KhjphlUM9C9stffDk9tY0gmM/OkYMD2WTIHnnYvHGOCD6Rx9
 5OXo2SQVu45HTR2Bzfk/v+kLEb9zROp/xibLv3iLResAEp2+dJkSWbkj/Xo1XZafmLQK
 NuCw==
X-Gm-Message-State: AOAM533yylCv1r9+Am86rY4TzX4PjDigHqc+HlQvMReBZxpdcQymkJqF
 xIfNlReGc3SgjbkX3/N4AQh4B8AIJC35zw==
X-Received: by 2002:a17:90b:128a:: with SMTP id
 fw10mr594858pjb.113.1610519216224; 
 Tue, 12 Jan 2021 22:26:56 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] target/arm: Introduce PREDDESC field definitions
Date: Tue, 12 Jan 2021 20:26:47 -1000
Message-Id: <20210113062650.593824-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3be/9seBh04G

SVE predicate operations cannot use the "usual" simd_desc
encoding, because the lengths are not a multiple of 8.
But we were abusing the SIMD_* fields to store values anyway.
This abuse broke when SIMD_OPRSZ_BITS was modified in e2e7168a214.

Introduce a new set of field definitions for exclusive use
of predicates, so that it is obvious what kind of predicate
we are manipulating.  To be used in future patches.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5460678756..73698587d6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1312,6 +1312,15 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/*
+ * SVE predicates are 1/8 the size of SVE vectors, and cannot use
+ * the same simd_desc() encoding due to restrictions on size.
+ * Use these instead.
+ */
+FIELD(PREDDESC, OPRSZ, 0, 6)
+FIELD(PREDDESC, ESZ, 6, 2)
+FIELD(PREDDESC, DATA, 8, 24)
+
 /*
  * The SVE simd_data field, for memory ops, contains either
  * rd (5 bits) or a shift count (2 bits).
-- 
2.25.1

