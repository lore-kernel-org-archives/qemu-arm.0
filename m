Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2208554wro;
        Fri, 2 Nov 2018 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eq8Nv7VVVgJUoROiSesv7KG74Otl6u89y2vqxLJf7mPv7lMt9mYgNh/GxKjTjuLc8tIQU9
X-Received: by 2002:ac8:35b1:: with SMTP id k46mr1306679qtb.141.1541170499756;
        Fri, 02 Nov 2018 07:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170499; cv=none;
        d=google.com; s=arc-20160816;
        b=PxgWwG4Jnp5Jk8OYbRrrr5Kx793nqiNgxnMyIBC0/tK88jKZIbpDaWjquxN+JzHzGM
         B7oPxFN2ooBU2tSWibRm5eRQyOUWZ53U9J3l++ifG4NmgyQI846RLWomshWe9TJa9CRI
         VJRAHHg4/YyXCFFIzIr2h6LmAxfVht6faY2l5ft13gEdUXJsOA+bnaUZEvjS5fGNmCGJ
         faHcP9J5zNaaZqCOlO1w85qYPE3YfDwbGDftCxBwwunJOV1dTwq3ni0dIBFMDtnXHHF/
         aX727XE6U38sFpVspDCg5H79i5rWwKl33KxsUUryJyVfb8HjicuBa809IYEcZanBDywK
         S/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=epmZqdPe+6fOZPgK4iYzVuSYRpSiiunhcEoOuphPDzo=;
        b=eHSMgGPpfZSswCLAWElRah66VPiqFgLJiRztatC0bujLsOeMQ8fQYoIE2VbIytx+9V
         ZcdVxmgyRCoQCYdRIp7mq9h00qOWkwSqDgeP/gUKBh0FF2PfhcHKiHPU+xtqacCsCIl5
         CCZTG4DKjGEmB1bIp3YPXakSmtPEvu1nXSVExFh3eBmeZMaOQCf60FBLypj8j4AbcRP2
         ktS/Xy4IobRKxrkNspRXA02Nv89AIZZw3D80Mgt6Bpw/s630xBn8ko9K0PCgUdwahT4v
         e7uOB7Dzc2LOyuIRBNQg3mTu+fQ0qmPoe2lSZySVZ5Y1T0GLxoHOD0F48KEm5Q3OjIqQ
         PBFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MwOyoePQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m47si4727295qta.366.2018.11.02.07.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MwOyoePQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIaqh-0002GY-7v
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqW-0002Ez-AY
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0003I7-E2
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:48 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqT-0003EG-Gn
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:47 -0400
Received: by mail-wr1-x443.google.com with SMTP id n5-v6so2252708wrw.12
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=epmZqdPe+6fOZPgK4iYzVuSYRpSiiunhcEoOuphPDzo=;
	b=MwOyoePQIP+33H016YmqQxEsMMHLP8Y6sL1y6xNfNwC6ZKPz0f7IQw8GvyvM8HIH0O
	DOMunLzw0j30ZyBNUq1Onwn6TivH0ABoaFjQTl5MzBK21Tadir1mgFKtpnjxZhcfkr6G
	5bZQF93nrvOXdGrl0MvGQinLVcsgVNKSvlHr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=epmZqdPe+6fOZPgK4iYzVuSYRpSiiunhcEoOuphPDzo=;
	b=uexMN36cVknsE5Eg2ue3QRrI+ZT1RpjmTRUqLm676Zx+yxpgzb5gY4RBQEKfmEEGBA
	y8MfVOTRqkxuB7+vX7zzUhFDi+sXrO/rBRRIEvlX7lh7dRvYOwyL7vtluEPwVAtaqv7u
	GnzmPTbNajSxZRAQGEFwGDAWzQ4N8nnVGjef44ufLqFyWNVCUQ/sLRQh+VHPtBLi7jEl
	sIdrNCd2/lw54CpwSHTMk58HD+PjOgaB+PU3X9Y72vxDmJ1F9eGRqHvY9pmCuPFf5uPO
	N5IRS/A73gbhBKm1N0gOFVZWdltZT5WKPxjzVVWDJGusb4Jh7AClSz5jjkDPVqS+O6wZ
	u4Yw==
X-Gm-Message-State: AGRZ1gJ/9L5xuI+oBLuUheIZn+nLAu8nkiuU+NVv2YYUS6V9/MCcZp8a
	gkXHHBhlX6s69rf9bZs9+waxAw==
X-Received: by 2002:adf:aac5:: with SMTP id
	i5-v6mr9991988wrc.216.1541170478056; 
	Fri, 02 Nov 2018 07:54:38 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:28 +0000
Message-Id: <20181102145433.4553-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
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
X-TUID: rGQ0KUs4yD7g

My previous patch set for replacing feature bits with id registers
failed to consider that these id registers are beginning to control
migration, and thus we must fill them in for KVM as well.

Thus, we want to initialize these values within CPU from the host.

Finally, re-send the T32EE conversion patch, fixing the build
failure on an arm32 host in kvm32.c.

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

 target/arm/cpu.h     |  6 +++-
 target/arm/kvm_arm.h |  1 +
 linux-user/elfload.c |  2 +-
 target/arm/cpu.c     |  4 ---
 target/arm/helper.c  |  2 +-
 target/arm/kvm.c     |  1 +
 target/arm/kvm32.c   | 75 +++++++++++++++++++++++++-------------------
 target/arm/kvm64.c   | 69 ++++++++++++++++++++++++++++++++++++++--
 target/arm/machine.c |  3 +-
 9 files changed, 120 insertions(+), 43 deletions(-)

-- 
2.17.2

