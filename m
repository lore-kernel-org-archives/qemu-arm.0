Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4455301wrs;
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0EzSL/A+pvRHoekVfolvct4eTjGV2fY1uJ4Dc9U6DgU2ZwfzGkWsIEjaPBXxEje4WnMfR
X-Received: by 2002:ac8:3043:: with SMTP id g3mr28097665qte.37.1566335291701;
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335291; cv=none;
        d=google.com; s=arc-20160816;
        b=SFfeP2Ff7gIrH1eZd7vJK9acYNTGC/9Vp/GrGPmykKKY9lfEIWliOXAACveoblrgkY
         lFAEBfrV2tBPpjEnMLfyQuTg73gWyJ9tEPguoJKMHeHf01H2lJvp0jTw3krPC6tlfEHZ
         g1YUEQDaUqzz18vnXa+BRqojQYiVu8PICBjf/onhPYy3lWbjEGDLlzhO++YlvIs+ozIk
         kc2IYznVJho0UQDUx3d1vu/kz7kn+M38oDQNbq13x/JCXKDEQlKGsWOSanINbDz1iWq/
         b1ScTaAIahr/bNJWG5bdLyxfyqL3FJ/vv47oPK27QJNyJJrCqP2AYWlyuq1Trrobrnuw
         HoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=oxUnGqeWvwLIZfcZQxjlh7NTLJypY4u3oeTZofI/YEE=;
        b=w1a8mEM/3t0G2ourY3g3CNv+YGQGEhj/dSKepfbB9QVN5v/WvRu8MQfeOjCia2paBj
         uz470dJ1YnMjiOBb3myHWr9/H5CD3f7h2DK1cSeooeFe84XeGRLqLyPFu/5X3pu42UWZ
         N+nxs5mofSSASXQ6bbjQ3KrCFI5Pr5ty66nrIvrHqNbu7Bdc1o9oVFiRb13irvsQBpU8
         n4PG693RCsWJQX1bKUYGvnKRoOb6u01xgl+lXXSpxrYMwIEJg0oSAPC5uNMZ5lVF8s8u
         zBJ9YaXvBcCIObQe+zaGwWkg+vKC5MXjkfMMhrwQ4PfEZpyUrSZIpY56dicrnI5RngVx
         ngfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N+y+0uKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si11990683qta.229.2019.08.20.14.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N+y+0uKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BMQ-0000EJ-IB
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLi-0000AS-2K
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLg-0008Ja-PO
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:25 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLg-0008Ic-HN
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:24 -0400
Received: by mail-pg1-x544.google.com with SMTP id w10so10574pgj.7
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxUnGqeWvwLIZfcZQxjlh7NTLJypY4u3oeTZofI/YEE=;
 b=N+y+0uKch7/dYVasjX9hlWHOdpeGMPhFZCx4WnR6OXsSfc9P+HWXELC1AcdUuyr5C3
 a9hWxWIMEf9NuN6U9MLOYfyF1zQ2Rvh2hHm1JsRhWd0ivrPM0qESuxz2Knf8oLmr7mE2
 xXedyRe1dpG6Mb9n+dXCFMvWXqjWkQYj4k2ZuOZbCn1i3mVBuj2LNGQjbk16U56zMS1Y
 OlNFNLxHTxql3vM3Otlq2CosnbEPOWluls4Mq47iuZ/ueLrQPNshxhHPHvlXBHrrayxk
 0eRkHDJaPE3LNxsjWrdoa4R3CZn+fgZOn7lbmizuJHea6TzpD305S3fvS4l02SAt00PC
 Daqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxUnGqeWvwLIZfcZQxjlh7NTLJypY4u3oeTZofI/YEE=;
 b=CDr2n9yJf+DOgmk96I/VkbSg6ef0msa5kZPB0fuGy08s71lopGUab9uxUsJKievzMz
 FFswgdZXSrN7WUoTcmj95lBxJKcgLuLsCyb+1FOfhPADN+a5QZtj3CkfyHdKnPALxhqi
 Bo6MyGG4UOuTW0SjMa7CaYN9TirKU29UeujtyhO3vPCvpLtNMOQVRsrQTUCkdJxmjPlI
 GzYZlEu1nZ/tSFJIQFcm0D8Pp+Wd20zaYjT0dASjRuxY3K4C/ZvnpwuSiU0bfmKZBtAq
 gvRjACgQruOZF3LfkBynup6ShvChKk8HoT8jHRzQ/MKigMiL5EIiKqyBWQ0S2VJ0KCTg
 CW5A==
X-Gm-Message-State: APjAAAWIdhnMi8rQ7Y2zdVcF12OpeTskQ01wYsrxldvaOmiRo0jWXwK9
 uWJlcVkEMH3Xf2dfvJKsueoDoQ==
X-Received: by 2002:a63:c70d:: with SMTP id n13mr26228089pgg.171.1566335242880; 
 Tue, 20 Aug 2019 14:07:22 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:03 -0700
Message-Id: <20190820210720.18976-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v5 00/17] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
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
X-TUID: 1aJNbTPy9yA1

Changes since v4:
  * Split patch 1 into 15 smaller patches.
  * Cache the new DEBUG_TARGET_EL field.
  * Split out m-profile hflags separately from a-profile 32-bit.
  * Move around non-cached tb flags as well, avoiding repetitive
    checks for m-profile or other mutually exclusive conditions.

  I haven't officially re-run the performance test quoted in the
  last patch, but I have eyeballed "perf top", and have dug into
  the compiled code a bit, which resulted in a few of the new
  cleanup patches (e.g. cs_base, arm_mmu_idx_el, and
  arm_cpu_data_is_big_endian).

Changes since v3:
  * Rebase.
  * Do not cache XSCALE_CPAR now that it overlaps VECSTRIDE.
  * Leave the new v7m bits as uncached.  I haven't figured
    out all of the ways fpccr is modified.

Changes since v2:
  * Do not cache VECLEN, VECSTRIDE, VFPEN.
    These variables come from VFP_FPSCR and VFP_FPEXC, not from
    system control registers.
  * Move HANDLER and STACKCHECK to rebuild_hflags_a32,
    instead of building them in rebuild_hflags_common.

Changes since v1:
  * Apparently I had started a last-minute API change, and failed to
    covert all of the users, and also failed to re-test afterward.
  * Retain assertions for --enable-debug-tcg.

Richard Henderson (17):
  target/arm: Split out rebuild_hflags_common
  target/arm: Split out rebuild_hflags_a64
  target/arm: Split out rebuild_hflags_common_32
  target/arm: Split arm_cpu_data_is_big_endian
  target/arm: Split out rebuild_hflags_m32
  target/arm: Reduce tests vs M-profile in cpu_get_tb_cpu_state
  target/arm: Split out rebuild_hflags_a32
  target/arm: Split out rebuild_hflags_aprofile
  target/arm: Hoist XSCALE_CPAR, VECLEN, VECSTRIDE in
    cpu_get_tb_cpu_state
  target/arm: Simplify set of PSTATE_SS in cpu_get_tb_cpu_state
  target/arm: Hoist computation of TBFLAG_A32.VFPEN
  target/arm: Add arm_rebuild_hflags
  target/arm: Split out arm_mmu_idx_el
  target/arm: Hoist store to cs_base in cpu_get_tb_cpu_state
  target/arm: Add HELPER(rebuild_hflags_{a32,a64,m32})
  target/arm: Rebuild hflags at EL changes and MSR writes
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h           |  84 +++++---
 target/arm/helper.h        |   4 +
 target/arm/internals.h     |   9 +
 linux-user/syscall.c       |   1 +
 target/arm/cpu.c           |   1 +
 target/arm/helper-a64.c    |   3 +
 target/arm/helper.c        | 383 ++++++++++++++++++++++++-------------
 target/arm/machine.c       |   1 +
 target/arm/op_helper.c     |   1 +
 target/arm/translate-a64.c |   6 +-
 target/arm/translate.c     |  18 +-
 11 files changed, 341 insertions(+), 170 deletions(-)

-- 
2.17.1

