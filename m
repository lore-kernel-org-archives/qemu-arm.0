Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1089746lfg;
        Mon, 24 Feb 2020 19:12:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwH9jAQqGVmTHTmXfsYIu7LbDv652/Xi8cX8d/UEaT3oqrLHy45kv2TIcK/IV2QhLteT/r7
X-Received: by 2002:a37:6c5:: with SMTP id 188mr53765895qkg.277.1582600363901;
        Mon, 24 Feb 2020 19:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600363; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/orLHAt4DrbDl9PuN9py438r1UcFkJgaUIILrtEyKNNLm9ltVmzzPxYb6pw89AEBb
         fL5y8A4VKilmFHO0rXM+gN2DIFeISFqiLHt4BZlIAJs4n338ynakZOC55nGMFFUq+1Gn
         01qqhAcUUD2sVKB40Fw5Grqh7KPtSFrJU8/8CwLrP3EZ55Jt4Tc66okQOudKgTT+7C2q
         tCzcg5JZVYawzsp/hQuAOorwKMXavg0jadTHseD9TPOOnsSN0soX/7CmDf8n0JGuQ+ti
         1RS7vgWJQptMqkAbDm/RtsFZRSv1Fn7fGbmG3Oa9JU9/GUhvr6ChV9g+Ygo6LDhu0JZI
         jjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gr+IW3tVLO2ZQy7a3f3KRrgoIj/Adh7ezfztRLmO/DQ=;
        b=fwruCfzRSnVvkVnwsFaSpIMEY0mhho/57S2dZiy0jwm7UQldyEjVymhjpMlChTgUnR
         ZVIDJw0/wcdRnQ+Y87ZBCLFqakaiyiDr+RuS3soUqEB6OT8+FONVLovpaoVqu2VxfsXd
         p0x8n25DlCNFJBfFzf7zBjKP4R19+BKAN8rqtwgIG1sreGcXhZxhRcHg1zRWNxHsfEFT
         OfFKCpnTgvtbEknOgHJhC+evzzJTFeC8X3J3ilAn4VXHkICf2uWXZalCOINnSTntSrK3
         mLhsZr3sdNp/jmsVnaGRXsk+EwA1QnwMdWFKG61UIOKU0BTlwHJo3gWZHDDQSVX+wNGO
         Y6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhAalsFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19si6095617qvt.65.2020.02.24.19.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhAalsFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QeJ-00017a-C2
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qe3-0000sl-VV
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qe2-0004iZ-MF
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:27 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qe2-0004iA-ES
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:26 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p11so4879709plq.10
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gr+IW3tVLO2ZQy7a3f3KRrgoIj/Adh7ezfztRLmO/DQ=;
 b=OhAalsFlpPaT5DQI0l8JEA3vAJ4o7YMrb5LmuKPLdn5qkmsOVu9L4NPnhplQBR+lCy
 OA9QcmkpTD+xy1WrUlI2IEl9mGjdWpIpbQocusO36PWg04EBYfVGn9Az5cHurgPJqG5N
 lxa444xCd1Q7xpGyIyjVtCw608gJ9BZBbDN9YUKsOS93OF+2zhaQlTyIymCVLWYvhTsG
 nm/WKp3m0GKFFrfLt/BGwW1LtXXn1dOXGywpq95xmO7xqQi4+6ra1ivBoD8nGXOFs5Uf
 b4oKoCWyp4MzwJxAglhO1y7M3/d9lbZErtyLFKpfNCw/Dvul/uDvoZlzUyRApBQ8bkuC
 +HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gr+IW3tVLO2ZQy7a3f3KRrgoIj/Adh7ezfztRLmO/DQ=;
 b=I09b8d93IDOoKB+rmEvBy3omP3ui+fslhkO6aTXf+sGG1o7MM7yXh5mn+X1k5Og+5a
 ffb/Rxs09claIwysFvU3vRqQbz1AVH3RFwsdswmh/nx+JKDXRMTrwlbxGJ++ABcUfNxM
 2ob1B+WjNhbY4c5iA5dQUcJ3bLyTwka/mRZITseR++rHMmd+cL2qbvD2kAnL4MMCYJfJ
 mVhz4/rVebze7nz/uxETTpCm+ya11PkKGvaC3c61w2LN/V4oKkKZStexSGlOwxqvjlYC
 bf9IMfQN7KOcQSRejghs5iWRrAs0zCsm90nPDc4Zml6xdSE8c7egRselMUF4ERdeRw5l
 5RhA==
X-Gm-Message-State: APjAAAXwA6Ukv4Jt8yRl2gL/LQB4Zc65HauhE2IzkTeOhgO8WONScrce
 r5fJ7x081f5yXrL8pSiqDmwoWw==
X-Received: by 2002:a17:90a:8586:: with SMTP id
 m6mr2608886pjn.121.1582600344948; 
 Mon, 24 Feb 2020 19:12:24 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id gc1sm884747pjb.20.2020.02.24.19.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:12:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/arm: Misc cleanups surrounding TBI
Date: Mon, 24 Feb 2020 19:12:10 -0800
Message-Id: <20200225031222.15434-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62a
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4UT2FIrMc/kQ

We have a bug at present wherein we do not supply the memory tag to
the memory system, so that on fault FAR_ELx does not contain the
correct value.

For system mode, we already handle ignoring TBI in get_phys_addr_lpae,
as long as we don't actually drop the tag during translation.
For user mode, we don't have that option, so for now we must simply
accept that we'll get the wrong value in the siginfo_t.

In the process of looking at all that I found:

  * Exception return was not applying TBI in copying ELR_ELx to PC,
    - Extracting the current mmu_idx can be improved,
    - Replicating the TBI bits can allow bit 55 to be used
      unconditionally, eliminating a test.

  * DC_ZVA was not handling TBI (now only for user-mode)
    - The helper need not have been in op_helper.c,
    - The helper could have better tcg markup.

  * TBI still applies when translation is disabled, and we weren't
    raising AddressSpace for bad physical addresses.

  * SVE hasn't been updated to handle TBI.  I have done nothing about
    this for now.  For the moment, system mode will work properly, while
    user-only will only work without tags.  I'll have to touch the same
    places to add MTE support, so it'll get done shortly.


r~


Richard Henderson (8):
  target/arm: Replicate TBI/TBID bits for single range regimes
  target/arm: Optimize cpu_mmu_index
  target/arm: Apply TBI to ESR_ELx in helper_exception_return
  target/arm: Move helper_dc_zva to helper-a64.c
  target/arm: Use DEF_HELPER_FLAGS for helper_dc_zva
  target/arm: Clean address for DC ZVA
  target/arm: Check addresses for disabled regimes
  target/arm: Disable clean_data_tbi for system mode

 target/arm/cpu.h           |  23 ++++----
 target/arm/helper-a64.h    |   1 +
 target/arm/helper.h        |   1 -
 target/arm/helper-a64.c    | 114 ++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c        |  44 +++++++++++---
 target/arm/op_helper.c     |  93 ------------------------------
 target/arm/translate-a64.c |  13 ++++-
 7 files changed, 175 insertions(+), 114 deletions(-)

-- 
2.20.1

