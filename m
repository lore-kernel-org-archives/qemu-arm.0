Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1012847wrm;
        Fri, 11 Oct 2019 08:56:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwe+G/Y6xea56GfOcjsi7+wa1zkoeehneUVCeNW1fGKiBJ2g6q3Hhy4hrmBoFBOvjXD/VjI
X-Received: by 2002:a50:ce06:: with SMTP id y6mr14395936edi.259.1570809366842;
        Fri, 11 Oct 2019 08:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809366; cv=none;
        d=google.com; s=arc-20160816;
        b=L1Iw2ewCF2xzjwczpl8Masxw5k5SPHxhaJ7WciNZrpdrrImuZUbvYVnYIcfdh5Ahp7
         v1LCP+li9q+91TAFdkRZ6gp+7VMRMDnZOiAlcIeNHw8auSaFhICzW9cL9/wGOaVcR6KG
         pVIfdMdHUTQh0BOLdr4RoMAne3nSCJ+l2qH+Jc4JaUIgqZKKMjUMTHCw0NWyEpptRAMt
         it785aM8TUBuAmiCCbOeACiqol8eKXu2pYGATM/i0KNmvHu6CoCpbeVJehkOTjBCuab0
         dvbVMpY64ru6E/IGgSGiLvf3VKMOinvRfxBUnQ+zpvTsAw/Xt8Mzv7FEoz/kiFCXPkky
         0jPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0PIckjc+jDPiUlR/QPCiF7wRLH0buusyiLHFkX56XIE=;
        b=l8JSVSQj1BOoUtuG6paPtPecx+Fw117/rYF+wrFv0x+XjIS495DDe3yfFG4tR7BLN8
         Oguhd4u9EjlCTzjBCP06by7Qiky3YxhVmTZEL7SPLh/tEZ/cxDEb4EWX5CFlaHKG+mbg
         HMsmkQQgxbvNoCxEhpCSDEcBhStySsiJHvIRewAAPU6KO/2ID2yBaoz0kPIypViRSPH6
         Vo7UAoLEHgDmi6lQlqd98dqa6bc3Z/ZXflOjIJxo/7oE+23fFAO2xQJOpXfXxL2Tlxm6
         OAqoDyLh3QQsMUqka5WHrjTrTZcd+ky/x9CBwBNYAov7Q8l25c6NNzwFPtiou7HXc688
         TkNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATF8CZGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz12si5257866ejb.193.2019.10.11.08.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATF8CZGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxGv-0002C7-4U
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGg-0002AP-6B
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGe-0007VN-Nm
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:49 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:41441)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGe-0007Ut-GF
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:48 -0400
Received: by mail-yw1-xc41.google.com with SMTP id 129so3642722ywb.8
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0PIckjc+jDPiUlR/QPCiF7wRLH0buusyiLHFkX56XIE=;
 b=ATF8CZGP3jKyOcu2xyN4V/rsokVjTh6f3oh+Gb6BUFfLFFDKfDk/RYHYEOWBkc839q
 NC/Fmc2OzXKJLp6dIjWMLJ+3ckcx6EUiSoTee8TStKHnbsSh4ZGLF6Ukd5eoCtr9X//1
 815PNZNU5W6DDgPWwe52/TMN0lc/C3j774yISr+cxu8Jo52BW3qjPINc+aW5YSiNgEk8
 aWStEtg2GwMZdwU1JymqzJITdhLJ7ODLBTczxHR7akaHh8HYPFDI7J6AfWZe3M9mdJDH
 PwE2lgYjzrs1zciE/y6xenlnjJX2Od4m7C+5WH/XWs8PGNtinWxXLhly8dTZq1lxb9sx
 AeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0PIckjc+jDPiUlR/QPCiF7wRLH0buusyiLHFkX56XIE=;
 b=U1ijvPubIRVBDsOjso0qjEilWOpirK8y+XCA2AwWz43ovyZh+8mPkk5B9cNP8oDNe+
 v7D152hxLRe2zG4njJg37LnRhtEHW7IWtHEzDZM1kBenx6RqIboeRpRMSMgEF01DzF9x
 SzPTS1avn0DQTu7sCQ501jwlQU6DVqa2MgVQac6Rh+uWU/0RwYVtQSLCwBTQWzJI41MA
 PnIkuLY3K3IUCYp3MAmqWW+Q0zwVggBQ/LAUsy57JOQOMGWOAD8YXUThgsm3dk8t1/HG
 7TeVso50LenwY/h6Q2LtkoVeL/9Io7JpWwxDUu96W2mQW6IS7umuQRKMfQqNDCALqh+n
 AsJQ==
X-Gm-Message-State: APjAAAUwS0OmFIr0AfRd6o2953b01MAwvAWmCQOGnZVhABxH82XJlO5/
 X/b4q+9BXR2b5V16f0rxo1lQzw==
X-Received: by 2002:a81:5b46:: with SMTP id p67mr2810079ywb.228.1570809347611; 
 Fri, 11 Oct 2019 08:55:47 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/20] target/arm: Reduce overhead of cpu_get_tb_cpu_state
Date: Fri, 11 Oct 2019 11:55:26 -0400
Message-Id: <20191011155546.14342-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QDvzHlH1yVft

Changes since v5:
  * Fix the debug assertion ifdef in the final patch.
  * Add more calls to arm_rebuild_hflags: CPSR and M-profile
    These become two new patches, 18 & 19.
  * Update some comments per review. (Alex)

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


Richard Henderson (20):
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
  target/arm: Rebuild hflags at EL changes
  target/arm: Rebuild hflags at MSR writes
  target/arm: Rebuild hflags at CPSR writes
  target/arm: Rebuild hflags for M-profile.
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h           |  84 +++++---
 target/arm/helper.h        |   4 +
 target/arm/internals.h     |   9 +
 linux-user/syscall.c       |   1 +
 target/arm/cpu.c           |   1 +
 target/arm/helper-a64.c    |   3 +
 target/arm/helper.c        | 383 ++++++++++++++++++++++++-------------
 target/arm/m_helper.c      |   6 +
 target/arm/machine.c       |   1 +
 target/arm/op_helper.c     |   4 +
 target/arm/translate-a64.c |  13 +-
 target/arm/translate.c     |  28 ++-
 12 files changed, 363 insertions(+), 174 deletions(-)

-- 
2.17.1

