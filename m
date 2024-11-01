Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp477998njc;
        Fri, 1 Nov 2024 07:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWVjT7x5Be4OVDktNN8Zscf6/3MtV/8jr4Z4x/rSUk5SxjR2IXQzqlnlaVacKZlt5BDq2yR5BbTdFgQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHNW3tpdVd26VYoGY2CkGZqJcePRHFs4i/9B5UQl0owNIUmqaKRAjkg5xsLiQvHyhWFDMUI
X-Received: by 2002:ac8:7f53:0:b0:460:bb95:5934 with SMTP id d75a77b69052e-4613c0296a0mr291167881cf.32.1730471360363;
        Fri, 01 Nov 2024 07:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730471360; cv=none;
        d=google.com; s=arc-20240605;
        b=FVG9WRY0fD9WwfEd9a0aTrST5HGivfpnBaoY/q8u2n9u2IAfAutTvsCzUA+KEqH62Y
         1FCFIaeDxV1Y98zivZx/nxaSi5ibv9cg/fgaz1RhD6jIGSu7iAX7TWBsswu7h65g+pSr
         nc2EUM4WNJ8ocD4JQkA204oonl0uACKqAGmd9mwDqAQFRJ4JAG4hFXKm/5GsNwR6SaSy
         Sgb7F5ODSKVlBxmdqn+kacRee1PA8rGbrJf/Txo7oFcgzHEFb03ZR64whiyyyiRlsVi2
         jrzy6Azw1fkolxwCg1wEJn4bt8vpx4uLn+v06ESALRpo1H8Oofpsao4/ilJ/F08M7Q7F
         P/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rIw2bXExAoZZovk1iS43hhs09Tuxcy3vz1/d1nFAkTI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eXwCu4AzgjkThfrmbKtCtrtQ0qTj6kRFvBtzKGfwkIkQhfU3FSoepUHS4d75N72WrT
         O/TmmApNHZmWJmzRAfsTZ6iEY9YMMzg0lLa+zpcoRlMXGy9JZuw8NIL81luLK/tXAStY
         KJ4VcAUXFYWOTuea5h+EuufEl3e7wTmiWLj2HGqcST4S0IFfDLVmFSPo0bcHN8b+4vnd
         BwoL2DROZjt2USLIUr1Nv6Ub00Twaobuhxspu7+F3dNYBA/yZvlmPIgASm1IYdwtgCO6
         swyTpwO589Nq2uXmDQl2mW4J62hF1duvY8Kn8KE7faosdqWuGg8asnKA2jsXMtElvr5H
         yz0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBVx9Vg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad241ca9si46833861cf.563.2024.11.01.07.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 07:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBVx9Vg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6sdw-00024a-Fe; Fri, 01 Nov 2024 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6sdu-00023y-MS
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 10:28:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6sds-0001vX-SM
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 10:28:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so1180576f8f.1
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2024 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730471327; x=1731076127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=rIw2bXExAoZZovk1iS43hhs09Tuxcy3vz1/d1nFAkTI=;
 b=hBVx9Vg+Jp4tU3UVVgmWQxG25x7Wy9RtgOMBw4GjUY9gw4Y3Gh0SigdH23Yc3/xRXP
 bKQ01/6uVX3o1W5ore/fSeG3lNffCRIFrBxTmgHnp1k+0yBDGzJIESeWNSYKVaLyDc89
 W9683laryHy2L8hPLt/CvYwCDAKG084Nn2r45+AK6ZL0/6bjyq5t2Ql+AAB2AqiV5aTL
 aGz5wrRI8Ze2EbtQkZxr9aRja95SxjFBe8kenn6IsSVapUq7Qlv+uGPi6Xwyi9ZQCzQn
 +vmsqaBG7YLopuK4RZmzjDhVWzHmRQyLxHlL717mvU5PSizfIpOUjL+Wp+RbWnr2hK2B
 b7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730471327; x=1731076127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rIw2bXExAoZZovk1iS43hhs09Tuxcy3vz1/d1nFAkTI=;
 b=fPpKOYyGouIW8jx9uqin5C28W4wcQjwJcCPEvOwISN+L+kAoDbiuMiljnSEJXqZAyE
 GuV9OhXOuxinPxcE2bJmdS7219RbLm8+OvTz2XwxCtQLNeiRdz9jeFVBZO4YbMmTd7Pm
 curn9Uo56YpxYLTYEPeILd4u2lm/GiFtBjP2m/io3Wj3kGeAjeW1TQDaN9HnM3lITRn1
 DkeZYShSwQ44J96x0taFFXSBo8UL0235gZzClQre7R9j45H/U56kR7zNRxut3kaj37Ik
 V3mICr+k+1ujdx7pEeBhXZK8BF1QWSXtReodwOdk+xU94IIkrVWbZog922WRJ4c+4ZX+
 1GRQ==
X-Gm-Message-State: AOJu0Yw7KBf/UxQbbNFsinbPInxUhWbDTpg5UjedHnXN16JY2wIsCoiP
 lIIoRKgbZaT54VBeaKhZe27RYqsgbIbbzjue8f6YvziQjfKNSWg7K0yD0Hy6a4q39Nt623CCgVR
 L
X-Received: by 2002:a5d:5f41:0:b0:37d:4f1b:35d with SMTP id
 ffacd0b85a97d-380611ff128mr19187954f8f.48.1730471326641; 
 Fri, 01 Nov 2024 07:28:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd74f132sm97724275e9.0.2024.11.01.07.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 07:28:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix EL3 AArch32 MMU index usage (again)
Date: Fri,  1 Nov 2024 14:28:43 +0000
Message-Id: <20241101142845.1712482-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jqMAE9DnzxGQ

In commit 4c2c0474693229 I tried to fix a problem with our
usage of MMU indexes when EL3 is AArch32. The problem we're
trying to fix is:

    Architecturally, when EL3 is AArch32, all Secure code runs under the
    Secure PL1&0 translation regime:
     * code at EL3, which might be Mon, or SVC, or any of the
       other privileged modes (PL1)
     * code at EL0 (Secure PL0)
    
    This is different from when EL3 is AArch64, in which case EL3 is its
    own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
    have their own regime.
    
    We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
    do anything special about Secure PL0, which meant it used the same
    ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
    where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
    controlling register when in Secure PL0, which meant we were
    spuriously generating alignment faults because we were looking at the
    wrong SCTLR control bits.
    
    The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
    we wouldn't honour the PAN bit for Secure PL1, because there's no
    equivalent _PAN mmu index for it.

The "spurious alignment faults" part is
https://gitlab.com/qemu-project/qemu/-/issues/2326

Commit 4c2c047469322 tried to fix this using what I described in the
commit message as a "more complicated approach", but didn't get it
right in several ways. Full detail in the commit message of patch 1,
but the major visible problem was that regime_el() would return 1
even when the CPU was in Monitor mode; this meant that page table
walks in Monitor mode would look at the wrong SCTLR, TCR, etc and
would generally fault when they should not.

Rather than trying to fix up the multiple problems with the complicated
approach, this series first reverts that commit and then fixes the
initial problem with the idea that commit 4c2c047469322 describes
as "the most straightforward" approach: we add new MMU indexes
EL30_0 and EL30_3_PAN, and use the EL3 index as EL30_3. These then
correspond to "Secure PL1&0 at PL0", "Secure PL1&0 at PL1", and
"Secure PL1&0 at PL1 with PAN", and parallel the NonSecure use
of EL10_0, EL10_1_PAN and EL10_1.

thanks
-- PMM

Peter Maydell (2):
  Revert "target/arm: Fix usage of MMU indexes when EL3 is AArch32"
  target/arm: Add new MMU indexes for AArch32 Secure PL1&0

 target/arm/cpu.h               | 48 ++++++++++++------------
 target/arm/internals.h         | 41 +++++++++-----------
 target/arm/tcg/translate.h     |  2 -
 target/arm/helper.c            | 68 +++++++++++++++++++++-------------
 target/arm/ptw.c               | 10 ++---
 target/arm/tcg/hflags.c        |  4 --
 target/arm/tcg/op_helper.c     | 14 ++++++-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     | 12 +++---
 9 files changed, 110 insertions(+), 91 deletions(-)

-- 
2.34.1

