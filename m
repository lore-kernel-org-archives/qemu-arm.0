Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp443113wrw;
        Thu, 8 Nov 2018 09:55:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5fD9rDaDdUtumhvviaW2i1r2NHqvG5pRXgc0jIs5BTFhw/7SVOBv3jFTwFcsmXbWlQ32oQx
X-Received: by 2002:a37:7b43:: with SMTP id w64-v6mr4985834qkc.43.1541699722443;
        Thu, 08 Nov 2018 09:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541699722; cv=none;
        d=google.com; s=arc-20160816;
        b=z0+Xn4MbRomr8kHPlpzFBlCa7P0Qyq0lhdBrjcKSd5m+9XbK6qnEbGK8Bpdxeeu4GI
         cpRcXpsN3z+QZUeyTVy1KDOv+R8AbyJDvFV7+OJN/uMOpBLQdElkq1+RV0A9E/576RkO
         7HERPIh3akU1eXA/T0brpfZDk79XnCFJP8e1jA01wtvDYvhCYaS2il9VWBMrBSnTscve
         wlNw8I+4KDDuZ2eyewMQ7TNQNS6zKkKPYYcEmHP7aXuiD8V+Jsy5MOIG2viTwHBJXm7p
         hmg41no53GpYtR3rcqeoQ7L+pu+A8Lj0pYAakJZynd+FHMaYw3crfhbzdjUUU1b0igR8
         v9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=etFtGCaF2qN0AFujDnG4tp2Dno86F6FFNyzI4Fax+4s=;
        b=Fk3i9Alepg/wpBvZlu0/JqEqsxcwyx8EIA7eqgJQOYn01zWzpCNh+3rc2ZtWgfzX0W
         RIyCny+d7avh4brPmVkhNBMUS059zx5S/ZUU5TF/ktD+KhCQz5EcosRYgpkv3XA0PJj3
         1Xhdl+uYApMqdxy74TLE647eH/QILDoo14yl0721xI6typOF4m8F4g1TTNXTnboTXW/z
         ZCSvQLZy76u8xCtYlJmGpsTc0mKKG4pUcF+gTEikKvnYY0d/hws+VJ+aWTPtRYsHSPUz
         qe6nHA67R3bcqx4WJDmkOWJdUS6XQ+xmS5wzau4wDn7ia5qvECudF18EtxYIedMkln5P
         KS/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9ktrA3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si64089qki.14.2018.11.08.09.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 09:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9ktrA3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKoWY-0001ty-1j
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 12:55:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0001c8-De
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW3-00089I-7H
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW2-00087z-6W
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:51 -0500
Received: by mail-wr1-x444.google.com with SMTP id r10-v6so22208904wrv.6
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=etFtGCaF2qN0AFujDnG4tp2Dno86F6FFNyzI4Fax+4s=;
	b=Z9ktrA3jjinnNXC+EMoGZ0oPnQMuc7c1XYoEknm53ZS8PbHr+JooCvD9+gW9z2ygaQ
	G2EWiMyKIoNc5r05qBsZrCpC1H3gz6Jy3/12uY6OJSIMc5j//vJfmctz43JXu8Dp7rZ2
	vahyOEz8O0U+FyzeRdF7q/k3m3CQeUeELswrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=etFtGCaF2qN0AFujDnG4tp2Dno86F6FFNyzI4Fax+4s=;
	b=jtFYOHi0C4A1E7W1OUTgjHIlWi1RmFR8Mg3dJrzaf85+ZBinW38Qn8KFOVjuhcocfM
	2sjq6Wug2eZ4UGJIcVmzdDlrqxT9SyveOzGtP1AXn5PVk0IGUf9Z8LPuRV/LmagAi+eA
	0wVh7I4+EZXyIXB02s2HyCcfsmT/L64iCIb91kpZ79mHCfTrIAKWKTwJDfpTrqJWG2xg
	jHWDbxkcaHxN22BKEnqGOI608dhcGye6iDVphsiCS1bp2iIb04SVS4SSDtX/gT/dNg/k
	UCailLNrcpTOsuFxTphlHsb9fgDPubVyjty4plb1nU1bK7ceKWPpY6RQes79xHedcIbd
	I/mQ==
X-Gm-Message-State: AGRZ1gJW8sTz/D792oG6yUcm63j/WqY66btgn9En0qDk0IxVBh2ERibx
	VWlhX0Pys4dJhf6m2EnaoLYQ9Q==
X-Received: by 2002:adf:c90e:: with SMTP id m14-v6mr5177502wrh.6.1541699688758;
	Thu, 08 Nov 2018 09:54:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:41 +0100
Message-Id: <20181108175246.13416-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v3 0/5] target/arm: KVM vs ARMISARegisters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FwOnKmELM9q

My previous patch set for replacing feature bits with id registers
failed to consider that these id registers are beginning to control
migration, and thus we must fill them in for KVM as well.

Thus, we want to initialize these values within CPU from the host.

Finally, re-send the T32EE conversion patch, fixing the build
failure on an arm32 host in kvm32.c.

Changes, v2->v3:
  * Work around sysreg read failures from old host kernels.

Changes, v1->v2:
  * Remove assert that AArch32 sysreg <= UINT32_MAX.
  * Remove unused local variable.
  * Add commentary for AArch32 sysregs vs missing AArch32 support.


r~


Richard Henderson (5):
  target/arm: Install ARMISARegisters from kvm host
  target/arm: Fill in ARMISARegisters for kvm64
  target/arm: Introduce read_sys_reg32 for kvm32
  target/arm: Fill in ARMISARegisters for kvm32
  target/arm: Convert t32ee from feature bit to isar3 test

 target/arm/cpu.h     |  6 ++-
 target/arm/kvm_arm.h |  1 +
 linux-user/elfload.c |  2 +-
 target/arm/cpu.c     |  4 --
 target/arm/helper.c  |  2 +-
 target/arm/kvm.c     |  1 +
 target/arm/kvm32.c   | 75 ++++++++++++++++++++----------------
 target/arm/kvm64.c   | 90 +++++++++++++++++++++++++++++++++++++++++++-
 target/arm/machine.c |  3 +-
 9 files changed, 141 insertions(+), 43 deletions(-)

-- 
2.17.2

