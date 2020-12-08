Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3972852lfb;
        Tue, 8 Dec 2020 04:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOuLDD/dxp8cS4o4dHu+/9bKAiuQF2OL5NH1lt6jiXGF4vCOSt+VABK7aZ8x0pWtJWdgu1
X-Received: by 2002:a25:b0f:: with SMTP id 15mr15989077ybl.4.1607430382038;
        Tue, 08 Dec 2020 04:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607430382; cv=none;
        d=google.com; s=arc-20160816;
        b=uK8xPEyKKRFdgfrlSXvm/+IvP5fN9aVg8zf47Ty6j1jH4EibPzH1+eypexhHMHeHKk
         ZpCY7W1bH8bg241ezMRV6KjUDnsxSgtSa1fauGHxOj2lG0+1lL9KaJCJgYuGDFGERp58
         1QjYpvqJO5NYsNIL33dyVUT4GxCBIa/5Q/z7qDXsA80pVAt44hDCZuDUPhnlM8ewTWXV
         qaChOFxzUzbWHjiXaTWrde7q/TrYbOozB2KOFnqsbYIMXDs2tfwPFkIGEVV/rirTyQQY
         2Lo3PDnRe++xvu01eDyX6tHhPnYQYlGVSNy3821lFtUwWi5BUofp4Ae9BkFeu9wtjfO8
         WgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iBbkZq6ClnBw+To4SaPmaZqw/tjsXjd3Cb3nT5r7/Hk=;
        b=K4qMa2w6U6wpSaehbvrsp9D4ecCzBppfupiuqYWcWQ8RuIbqPJztPmVuPVDOmsCrCV
         YfVx+TvfVePxPzPqeAbTQcEn9i76MyacmCEPaieTsa868eaab+BPgcGUDY2DyNJpWP99
         imsPlnUBWmzI7fHvAqseNsN7ZV9zwRNVr02eUX72eX6Ubk7fvhvQoNUo7Ab3YkBm/68F
         c2xHxgcUC4bVh+B85iNUZ/2rAtGAZO7iZnJcl6HDUXXscuq6eoyQwXrYUymZnNns6xYn
         x+tjAC/qcMC/dt7fg/Z7Y4SoKG+vJpQbGO3RAhYLNNw3ZLBf/eWJDlTnrz5askqyAB8H
         3PNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mxP2ej0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s31si19355704ybi.63.2020.12.08.04.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 04:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mxP2ej0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmc4S-0001kj-Uf
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 07:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1X-0007PM-Di
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 07:23:19 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1U-0005kS-Jx
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 07:23:19 -0500
Received: by mail-pf1-x443.google.com with SMTP id 131so13745560pfb.9
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBbkZq6ClnBw+To4SaPmaZqw/tjsXjd3Cb3nT5r7/Hk=;
 b=mxP2ej0OgWNdtmMQKrr+oMAiIAjz5F3CPPoYABFoM7LaiNJ19o8xGjphKmC9s+Lhu1
 i57BV12ess8kC2tFG9M8GOkQSRUd9gpNadrN/vWEHhox1U5NBMvTmfAGeG1K+wXc0mtr
 olHQS+RieZ7Dy9l1nWXnPFUz4pOMWnoGrdsurZ4NH8+ak/34b5YwPjazp7PDPgrGS3ix
 QkOQscEjLobxFOMr0OjSEhOwvjsJd1wW/s1Rva93by1r1MrpAA/C2CBMpMuPsd7wJ1G2
 JgUX20GWfG+WkohCgXm5U3gKb2kgx5YboPX3a7hIBzJrotRcsAENpTFvgd8WcWrQGDjb
 MoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBbkZq6ClnBw+To4SaPmaZqw/tjsXjd3Cb3nT5r7/Hk=;
 b=JVVyKvxmATOS8RJroq13BUphYUXPUSvk0mHrNIVAurWAL/cVP55T6/t6T3FMaoDlyj
 QcKs7WFbUrh4CDIdf8gH9fffgDlAg8UxBcJNnbCUkYL7mNTKelGdeVL3Tn6Rv6QXV8nC
 f58JOYpDX8/xxYU4wb9h1gcjjImSC+2655j6emLp9LUCTFrWRwfxA5y1KdjHN3F/RAos
 9Q59yjpqYKvsL8hu+niEtTP988RvrjhsAzPJ5APkHbu7yRfBetRob4dBzmx2DVvT7O/O
 wFoVXKEGapumI7j/+gy9L6qy8QMdJKfCXQeZ+sSI+n/IufZr5CN5dwoKG6PgOfiL0JnT
 A4SA==
X-Gm-Message-State: AOAM5313OghFPM2fwAWNdV9Y+d5h+7fjbg1tcIgDF5yGmRaqaq5Wy4g+
 vkPLtSsNaWyif/YUJ3Ma08tZ2TT5mIScL+YFmctYO0FLqGNd0GFKdo/QbEOC2xO8T8P8v2S0llk
 P5aJRmA716rJmkNGtfRKfN09wQ/ejzM80+8gZ/EJZXTS+7YUGOZGhOWcb4q+mWhMl
X-Received: by 2002:a17:90a:73c2:: with SMTP id
 n2mr4160187pjk.37.1607430191954; 
 Tue, 08 Dec 2020 04:23:11 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:11 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/5] target/arm: various changes to cpu.h
Date: Tue,  8 Dec 2020 12:23:01 +0000
Message-Id: <20201208122306.8933-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=leif@nuviainc.com; helo=mail-pf1-x443.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGqseWSaozGv

First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).

Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
by the ARM ARM.

Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
I was unsure of prefererred naming - Ttype7-Ttype1?).

Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,

Lastly, add all ID_ (aarch32) registers/fields.

Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
submitting shortly, and some of those features also exist for aarch32.

Leif Lindholm (5):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

-- 
2.20.1
