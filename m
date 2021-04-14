Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp6178458lfr;
        Wed, 14 Apr 2021 13:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCTjYOZ+0f8jjJVm91siTOLWpTVZh0zKbVbWfZ0j8Bsf+yoI+0EYu0PqrN7aVMuGqLQmmR
X-Received: by 2002:a05:6638:24cc:: with SMTP id y12mr19977455jat.138.1618432393717;
        Wed, 14 Apr 2021 13:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618432393; cv=none;
        d=google.com; s=arc-20160816;
        b=vLo9Xrdtd+r7IeJSBSeEVf+LxCru4rAnmdRgHbdLFQe9E6V7ikxNu4Xz4f8KV5ryLq
         dtnZrnsy4gSDFy7P2myGbarYr6tMWQSk2/bq9W18NFE9lB1OWlCcbkBH6p+rL7pXiENO
         7wPnKW4ffAkgIOvDnog4xR6lINOjQlWCL7zCGRrr3R94Sj6KNE/giuH+7XPdL6chRrky
         ptAGyltciS+VO5vSdI6hOOcIUgxuIdztcyJKmSkjWYwzeFUO/yGXYRVjGISzF5TiwS63
         +BonQvXdx63Iuc5Pw50kfk/gYrdnBdv/vXahZp6X7K05KBYNe20v6Q22VW3xGZYU5cjv
         UuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=OLB3+PW+usE0uivpk/5WOQnHeURqQpL1qML3odejfOY=;
        b=0H1NmfGS0TVCJiQuIKZq8SEIfldLhFbWG9oHKiBadf3SXHBrxAiPUxNUe/mvdSeTC9
         ub8G6n6mDGw57l3i6I5/U561WA2Ay44gvmrbQUO7D+rZ98dz8mmo3Yvy1u+rsJfDX8qI
         co6xg+R6Zb+9xdzGix4ssKmGwGI7i5nZgYKlildY/zntUYgPz8EpCtV/XVBUWEX5C574
         b+5LgGFg+YW1zl/JjSXwaI7PZqf+ev3+0pwINA9U7C4h8Smw+IkaFqPfEjwJ0PniYUmf
         O5uFK9Mr5JqWrzW2nRRdfpdXMQWY+5T+EnOVbb+cG2vj9eajBc87o4n3n1RDFGLxpaBQ
         oXqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xGRSVj4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si500427ilt.33.2021.04.14.13.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 13:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xGRSVj4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWmCG-0005C9-Sx
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 16:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBl-0005Bw-PT
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 16:32:41 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBj-0004nC-HH
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 16:32:41 -0400
Received: by mail-qv1-xf42.google.com with SMTP id bs7so10100146qvb.12
 for <qemu-arm@nongnu.org>; Wed, 14 Apr 2021 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLB3+PW+usE0uivpk/5WOQnHeURqQpL1qML3odejfOY=;
 b=xGRSVj4duVTp2C/wt/+zytLge3Ml/+j8fET56eVD9PZ2bs8kCHIpbdL5FtZJ4RiZFA
 of8gPqtAcXErP8KP9k+KTH8zKd4bI2j77banHjIvds6U8WYdFISgO/r2Z5Ln+dqmORWv
 jp40cEpVaZUbUmZb9MhKWX5V0rHY3HkJJSi7fhhRVWFEYnAnPCCPQIz6XXC+Ldzyc79a
 SPwikrjNaYhsW3ns13e3rtD2avj4o3nPnFpZOKGOLJZiROvfwJpWbYfe+L+pgVOZdLXw
 kQd5PsffSrUF9XX3NgUm92pstr94xRIMyz/sZZRysZmztt+UVhEdoG+nDwtf1wmw24KU
 R9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLB3+PW+usE0uivpk/5WOQnHeURqQpL1qML3odejfOY=;
 b=cEeMBawjO85lrKfdIHUaPVeaHVp7thqQUTqGF2b0NKgmyDXzWFUPry2bIfh+7bPoDO
 uzwm1vnMlYnc7xHeB3PaYKalLV/3rGtnys9cCeAMOi3g+s6xVspm7+o35zA3/XccI5zA
 8vbsr/drLsXTLOXrFUN0KYOmwH6HgeR7E01u7QHPebcRHMK05iCgvgIyjgkB81zyPSFN
 A9YXRTdG05chgwFhMX+cxHMhz5KpBXU+M/ikano/i9Ni6H4+2vhdrelUAe8GJml5AilA
 sno2wRxLlXb1RfbraX/hCJssMYBrRQaj7RiS4Di1HWMNJ7xn04SvIqLIkiVowxIPkLD8
 c+0g==
X-Gm-Message-State: AOAM532iaH3SHsSyXns5yvSP0yFikIzSqO6FwLyt1yWW+ue+5JiWiJRY
 2KCu8SgCwrpN1QYOpb8zBBkZDA==
X-Received: by 2002:a0c:e9cd:: with SMTP id q13mr135268qvo.3.1618432357940;
 Wed, 14 Apr 2021 13:32:37 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:37 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 0/4] Add support for FEAT_TLBIOS and FEAT_TLBIRANGE
Date: Wed, 14 Apr 2021 14:32:27 -0600
Message-Id: <20210414203231.824-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf42.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: slN/hu166sp6

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v6 to v7:

o Fixed the tlbi_aa64_rvae1_write the tlbi_aa64_rvae1is_write functions
  to pass the correct value into functions which use an ARMMMUIdx.

o Fixed comments in helper.c which referred to non-existent instructions.

Testing:

o Booted Linux 5.11 - verified the previous assert failure in qemu is
  resolved.
o Ran checkpatch.pl.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 371 ++++++++++++++++++++
 5 files changed, 555 insertions(+), 3 deletions(-)

-- 
2.26.2

