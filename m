Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2711224lfg;
        Mon, 2 Mar 2020 09:58:42 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuQmG6niqhCCRe2d9Bcj/7d0R9o3Q9G1SpAMXbb8p8vH8+vlvZbSrHrRNnkgywcA2hE6lED
X-Received: by 2002:ac8:6f0f:: with SMTP id g15mr825574qtv.255.1583171922699;
        Mon, 02 Mar 2020 09:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171922; cv=none;
        d=google.com; s=arc-20160816;
        b=MjYf3PFg+J6g0ONwfG8Z3VxY7veKiBtVGp31VGy7/s8GPWd/Kd99SpzlQN7KkMPr8/
         lXFcnBVAcE/t8aLgzD7PGFVELxD9B+xifQjBgsSEySXBntWpn/QD4uUplvMhL23V6RnX
         u+qqq4YcW9g8TuiQinhrYe0GBlz2y4ovMe8jR2OFfEhPsd34og0WqUGUv3wVeYy0ws+s
         LA5gQIom0jfYXey54UGDbfjOj90GOZwVS/gE3GWgJV+5Gtn74839C5giHbMAKVYcvc3q
         StTyT469LwjKFDFryAm/IKaEA7GeWjXjNFYAbHt/jduU4jifnriBKN9p2PojhrzjPFQt
         T/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9C1wlp8smjmp404ViBx+09KVCvZn3cMFmruSUtBUGyI=;
        b=xNMtyEilWjdxs4Fc4Mcchgx5Jmfp0tQJM8jJtXbWNVQzVEZxesO/em6+mcmWEZpFgK
         Kv24PiQZTOsvJ07iga5gd9ZPB9C2ZVyU2yJlL9DGYC/RuRQatiqY6acfE6GwimZ3NyJA
         8x++I/1zpO/oBU41KGy2p6Gm6OCyKy5ewtrd+ZWb+0ViNjc55AxO/vPOOr38usvlO7Jv
         8De9V+62OtYXIBTIS8Sfw8CmZyC6Vdy6Gi2JyjwWI++zyXa7yZk1zgtH9u5GmaNidXBB
         7OJ4Ykdqq81QGDKUXZKBSHwUwmjbOqVNsBMf18Yo6i4BN/iOIXsJGmjrONQbw3oc6fz/
         LCBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rx6Enlj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si2767941qkn.4.2020.03.02.09.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rx6Enlj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pL0-0006b6-5h
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKs-0006aM-Cw
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKr-0007X0-40
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:34 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKq-0007Wi-TJ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:33 -0500
Received: by mail-pg1-x532.google.com with SMTP id z12so184702pgl.4
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9C1wlp8smjmp404ViBx+09KVCvZn3cMFmruSUtBUGyI=;
 b=rx6Enlj24DsMW9PHpcIavuaDcnAp6zntEtNmcmQ7NGyUvsIj6oHq71izN4zK2zNSU8
 O+1fKfdKJNFEfPvqU08vmz9vt6hw/jznXzhSG1B9p5c/drlDnXOa0jMIqo08h5A9Qp6v
 Uf66eKXlhfGX5n4QmdrP7ZavC9PoRKXw6DadMUmpLsd0QYNo3nW3iue50pr0NyytAC2m
 ALopL3ND3jiKX16spYPhu/0cf9BwHUhMvPc/7drMJth+sDbRCrC7SB/Zb9eMPONms3Gr
 9bYlK1wpz67JBZbcdbb+aDD1/h5ahqbjIghzJ6QMcaj5i9gD9JM8Z0aFXVyDEFQJCFNe
 GIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9C1wlp8smjmp404ViBx+09KVCvZn3cMFmruSUtBUGyI=;
 b=iBcFuDKo3V8QUhmYEYS2WQ1rX4gEVGar0+uV/n77+NpjHyntKgjfw4k55K3mg0T5Lj
 IML48oEF1We9R3BJapWmSpqX0wrkW8pbEhOnd2Yd7J/CLYPokIgskGGp2T1GJPwtuhQR
 N9If7X9m7McqqwdWLxhyo4wUtndrnVBBCe3KJQBCcNlIsB09ufZSb2quDyG01he/aU/t
 Rw1Q8CtUKQe2WVa3QgYCOHtx1d3wJQ7JOEYY9O5E177LzlHjKAbtBRSDkOTDkGz9THd/
 APlMyfhHDHTXtoJY8bhpys942Eq9lsA83yzfMS9W3mpWfFZupVf13Ax1Xf3dgINYDDrL
 /EfA==
X-Gm-Message-State: ANhLgQ135IAOLBDjP+xdpJIi04HQ5MLLuCdGsEGulqLJzezWhywocZu3
 Dmr8xCSrAkLvoODRfBUwPnDqaw==
X-Received: by 2002:a63:df0a:: with SMTP id u10mr112178pgg.282.1583171911542; 
 Mon, 02 Mar 2020 09:58:31 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] target/arm: Misc cleanups surrounding TBI
Date: Mon,  2 Mar 2020 09:58:20 -0800
Message-Id: <20200302175829.2183-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
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
X-TUID: 730CSJIl3WG/

Changes for v2:
  * Improve commit message in "Optimize cpu_mmu_index".
  * Add "Introduce core_to_aa64_mmu_idx".
  * Use it in "Apply TBI to ESR_ELx in helper_exception_return".

Blurb for v1:

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


Richard Henderson (9):
  target/arm: Replicate TBI/TBID bits for single range regimes
  target/arm: Optimize cpu_mmu_index
  target/arm: Introduce core_to_aa64_mmu_idx
  target/arm: Apply TBI to ESR_ELx in helper_exception_return
  target/arm: Move helper_dc_zva to helper-a64.c
  target/arm: Use DEF_HELPER_FLAGS for helper_dc_zva
  target/arm: Clean address for DC ZVA
  target/arm: Check addresses for disabled regimes
  target/arm: Disable clean_data_tbi for system mode

 target/arm/cpu.h           |  23 ++++----
 target/arm/helper-a64.h    |   1 +
 target/arm/helper.h        |   1 -
 target/arm/internals.h     |   6 ++
 target/arm/helper-a64.c    | 114 ++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c        |  44 +++++++++++---
 target/arm/op_helper.c     |  93 ------------------------------
 target/arm/translate-a64.c |  15 ++++-
 8 files changed, 182 insertions(+), 115 deletions(-)

-- 
2.20.1

