Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp736660lfq;
        Fri, 8 Jan 2021 10:52:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSt8pA8M75/bZcIuKTwlDn0R7zU5ixXDjEoawHaStc819TpdrvM7BxIqU/jfU2lgL4otFp
X-Received: by 2002:a25:6dc3:: with SMTP id i186mr5091257ybc.254.1610131939141;
        Fri, 08 Jan 2021 10:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610131939; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/+TPVUWg2abeox7rZD4cCkyCIOyJhc0oJ90LU3Iyog+C+VxDIJhU3ec5N1WlFpqpu
         8ZmIYe84MGDaf6qzsVXUTedwSYE1gSBpvAVlfd5DbFyg5ouzMfgT1tZvOoE6a6g3OH2o
         nA2U7HW9UYYLd1ClqlWgv/TP59zR4DkmPhZUy7tqSzSRje/NprmxtXldLs1AsBuulxfI
         EXhma1QJffOJf3wnNCZjWYnEgTDA9OHN9YHNnkLnyi4UwWOuldiNML5LrbRvO5nCw+Pq
         tEB/0Iu5CaMk0/F01tc7kAB+Y+CpcU+TQh/Yc26iQMCjKCzOMu8t2EIBV6zqqr8fXZ4o
         80AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=AcoXdrrQcxeAFhHhxtwxElcM60mUZAzjqTpSoPTvLh4=;
        b=Qsg9E0kufFU9LkB8ecHNCE/97Ev8HARLcCmBKNRpw5IpICfsc/obMkwT0QmIVNqb+Q
         HpVg6Ni6opIQVfKsv212+l1hbGcxhBUyoQP3oDCSj1bBtO9TYxBaFM0VPWwpeTeBYFfR
         Qa0ut5rseuL5f8a4qFK7ZiOPLWKlPBeu3fDFc+LGeXCxdGDEOwNFH2Hrd9xMNtqw7Waw
         x9xUhq2F/iaLhX9IgxuS1zPw6YCHkeYKfKP8gVcooAZFA2JCB2q7BSCMwjn/IhsuhRxd
         Y5x0d19Cj02nP2unjJeqsF8IOUCxuzh7OLASiNXCFlcjAyEY0gduGvAWJNU7W9+b60b7
         sPdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=hC4C6LQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si8914829ybd.172.2021.01.08.10.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=hC4C6LQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwry-00023H-GM
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrf-00022a-91
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:51:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrd-0000sB-CH
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:51:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so8615677wmz.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcoXdrrQcxeAFhHhxtwxElcM60mUZAzjqTpSoPTvLh4=;
 b=hC4C6LQOdtDEKJXxG2+zbxD2AnHBsOEWwTjrveojRTVMyNpC/pMXz/tXE9r61Jo2jR
 HjfUfKSBAPdotbHCvEBKBhccltfTZNZIzP30dO+fItSR+7Mh82vuoDzJTlvht/Mor+Qy
 AwNuUSzbkmARxV+ijLdQc+ftUoQ38iebVWJ1zxgCjOFq3adUzgXyedWJIz6YBpRV3gd3
 z3l10EmvjfA1thHZcGnQv8mRpYDKYCNefm4AtZl1SR08uDteDcM3JVSQdwEhchyyBKvM
 HUJPytFPWVISAhUa3Z+5F5H4qTf17c+2WJJ1KcJgDXivbOyZbcRAMjmfxoeF0GRIIQVH
 C0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcoXdrrQcxeAFhHhxtwxElcM60mUZAzjqTpSoPTvLh4=;
 b=VaiXLzoulftg3b9bbJaILMsGVxX60Hk4J2547gnmLUp0tSJFEUPnOrZBmzcmFl5sMp
 kAkgfEPSWbuNJ5R1P63JeNPhFaok2b7JF2v9hsGKyOh0kLkJ/HYB/qnvKfXNEl8xd7hj
 EENKRIfiVilZYzNr6dxlyJ3QHqZ1UaMpYrgVIB3yePqjfr22+Xvy79Sg2RC2tTisiHPa
 aYJ0fEfc4bvCl1cqQgHrJ5B4eaZ9LbOrYWXME4BD88+vCUlC4nfwbr7l6UUZ0YxnMEvY
 nu2qEmAmXFJp0ZrGRd7yPfULJrDcxOh19sRXrqj+47h63NWGHmxSP6co7GauZqAD7bh2
 oyaQ==
X-Gm-Message-State: AOAM5313EfTIAnlMzHJhudVjQZnUnLhIF7qj1V46MR/egcSQp8D7o6Ab
 hAWPPR5SzanT5G7svAZfY03cYw==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr4239075wmn.157.1610131915578; 
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] target/arm: various changes to cpu.h
Date: Fri,  8 Jan 2021 18:51:48 +0000
Message-Id: <20210108185154.8108-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32f.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ty7htxsY7r3l

First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).

Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
by the ARM ARM.

Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
I was unsure of prefererred naming - Ttype7-Ttype1?).

Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,

Lastly, add all ID_ (aarch32) registers/fields.

Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
submitting shortly, and some of those features also exist for aarch32.

v2->v3:
- Add missing R-b tags.
- Add separate definition for CCSIDR_EL1 fields when FEAT_CCIDX implemented.
- Add patch extending also ARMCPU.ctr to 64-bit.
- Rebase to current master.

v1->v2:
- Correct CCSIDR_EL1 field sizes in 3/5.
- Rebase to current master.

Leif Lindholm (6):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: make ARMCPU.ctr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

-- 
2.20.1
