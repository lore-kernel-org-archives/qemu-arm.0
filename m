Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5263839lfg;
        Wed, 12 May 2021 11:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxnwy0HgeMjlfjyFtYD6cm7WvYQ+6i3Rnq2GwZCklGSt8oLwgu6/K8Lpdfqr0MggmlA0g0
X-Received: by 2002:aca:f5d0:: with SMTP id t199mr8605874oih.50.1620843990032;
        Wed, 12 May 2021 11:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620843990; cv=none;
        d=google.com; s=arc-20160816;
        b=Fb5iYnj51RX68a+gWttoDarSPLVQTogWIxNh7/zkvSLqfujbCR81r7GoZAXinNYCNi
         mL5E+zfixmIjDMa7L9TOAOCNipNsd1qIk3EWCNgwWzCKCntz+fqLLEMPAdbmP/2KZbwT
         hWoEEgC7nv+ASouQUcGz9WlnscNpVGscgQe2BUtPUBIUF/EjW5ELiGH6iqCDJfby5rq8
         5s9eahvYvDlEFTlWai0FFCEQ60q1U24tnatz4v2INW0tuaPw2PUeukAMvZgSjqDfleGa
         U3x9khswW/ibG7TbHSHNr3yodRzzR6ugysJDf3lAuwazK75fVbiXKYzwIh5TvHxDF2Uo
         iYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ChjRyYgxYB/o6Ut2yXtF+G8QdpZUARwNHpLx2DM8b0s=;
        b=Us9snhSsXt9IPBtrck2oR3Oqm3mxzBwVzkGXGKRyDFfAhFMSfxRrP0+B8+m071/R9r
         ksXduQQy4poEg8XpCEE2i/G3qlvW3549gVaXCCw+380zMKu9eCM5NhUZLhFwtlc7dZ/C
         PQmVZl31jcaZC8hQpyEQO3gbRXLceEUC6CNorpXvt5s9Vg2cgtfuLcr0MLrhdVHHPyzS
         pJ1XPustqyOdf2egXLv0Aaw138OAE6zTByM9XOuU9fGkYTRPoEsdzZMb6Vw9P9qsfct9
         Q/jdbWPvpMu+MXpFV+iwqH/w5rvGtAEtoAMXhpaBfjD4I8qyC3Tn047U8p0p4MfUsa67
         qFhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=w9kOJFH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si702337oib.23.2021.05.12.11.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 11:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=w9kOJFH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgtYz-0007EE-1V
	for alex.bennee@linaro.org; Wed, 12 May 2021 14:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWQ-0005xA-6A
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:50 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:45930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWO-0005nd-3t
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:49 -0400
Received: by mail-il1-x134.google.com with SMTP id e14so20928335ils.12
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChjRyYgxYB/o6Ut2yXtF+G8QdpZUARwNHpLx2DM8b0s=;
 b=w9kOJFH+sLQ9Fz0gUYLM6tZlFHx5jZNtYVqiQlOjysTOInC8zHbrfJI4w+Z2Nr9A+q
 4HWXNGTH6zD9qNtVNBUI1b14wN5z0HSOiDEnNz841EIHUexUcCJ3J9DkKqAg0SaoUC3I
 8vToIZt8h5pIQU5rQ6mippwsaAmbiu4+I4WNCKf4/wfthDlrTOpOSbY4d4av/Ur5U6eE
 vpvEfQI1tHRZ38J/Doi3bCYY9hypq/eOQhWaOoLAH1CIsTzYtDC/xyHFkogS9hfhffNo
 cFh4bAncMudcSt/fz6df6uymqxVTrbycmGFOos5prR+8UjDbZdnKi5n+UvUMTq9389vG
 nbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChjRyYgxYB/o6Ut2yXtF+G8QdpZUARwNHpLx2DM8b0s=;
 b=SfbRr/UAUhpvTUqggAnaMSWFNbDos/e/FKOEE/KFCqigmTKfZr3pjY/+V2wFIb9Oz9
 V59JGd4rLMuIcBlwVpvvyLaEX7yLetOTFkcHD4wCEedw+tcmZfnB4aZXiID2c0NN1H1I
 Vt+xQTnbvczLJHs7q1pN2hx3zUcITWwza9ZkVaixE0D7Bs+OheYfvfOFKIVI9S1cLmlt
 1jCNoKww6BQmlaI/CxXSxb9Uha3XtcHBhTge6DoyyKEH2STI06e/hKFL6qxMLfzNYt2J
 Yn+sftibIw3VVxDYSmKFEaSvkLyr0QCybAFMMgcA52ASLELuFWaasNSxFG/7Xxl9N/oV
 5Bcw==
X-Gm-Message-State: AOAM531NhggExoh4A3bfXVIscLScFga1ZFFebzPRJPERcsRiQ6eoyb5l
 lszozKDKz69WxKEreDRov8ZTFA==
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr778263ilv.253.1620843826043; 
 Wed, 12 May 2021 11:23:46 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:45 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
Date: Wed, 12 May 2021 12:23:34 -0600
Message-Id: <20210512182337.18563-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x134.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sFz3ogYtEGtH

Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.

Changes from v8 to v9:

Dropped patch 1/4, because Richard's 
'accel/tcg: Add tlb_flush interface for a range of pages'
patch replaces it.

Fixed page_shift calculation.

Added do_rvae_write and vae2_tlbmask functions.

Moved RVAE*OS entries from the tlbios to tlbirange table.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 target/arm/cpu.h    |  10 +
 target/arm/cpu64.c  |   1 +
 target/arm/helper.c | 324 ++++++++++++++++++++
 3 files changed, 335 insertions(+)

-- 
2.26.2

