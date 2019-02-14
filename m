Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp959081wrp;
        Thu, 14 Feb 2019 05:10:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY2yL0NnVn0rzQc+WE8GybUO+eVZwIks8/Yfr49QRJ/mkeWPdM0m/RcPj3Qy3GrKIp4foRP
X-Received: by 2002:a81:2942:: with SMTP id p63mr2983048ywp.21.1550149807714;
        Thu, 14 Feb 2019 05:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149807; cv=none;
        d=google.com; s=arc-20160816;
        b=v7G+c4BSdV30u6UwpOZLCmfXBg0+Z7wPxGBQ5hn6/4cwgtKeUYcfiGplQuhOIZteV2
         O/uqJLOV9w6sHC5q6USXM0I7NcQkHNxTG8sstBiFjxfsUSecNoyBXUE1Ztjhkv/+jbp/
         FqdPwjw6mT8zk2xQhZ0hrsefTdYXKpAIsHj128BStZDlo/ttXRwRmxBqxfvVZFEX1meZ
         Z1cuSkAwIukCaLvDq5IFzgFPoUV89LCBhNiUCQOBozR+ur24qcjIVm93N+OPrMqS+G3m
         SKO7fa6k9387XhwyaXPAqIxtDNSuQgODfDx5NDBMUs7vbhOVS0ELtIQMEYVkKXdCYaAY
         RmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=wekCw82j9f50dCxt5gl5FItSotVi6sLhdBFeaiqQhKo=;
        b=tfGdXNBf5vjlCyLmkeWP2vLPOx0/LFmwmIP5hb9hPh9o6DzKinxfl+ho+1DbnbEvH6
         25ZKOdqXWmMJn96CS2RLUzK/Shv3BISIXrvhxJMFsjiqqRFZgKPD21+KG/xgrpiwCB4k
         OwXe4FvvAoIyFJp8H9dBOeqpYmjWl31z1GnT+TF3ksl8IFScDdKD85lVDv6qXpl4H741
         JkOQd8GQvuLMi176QSNgni9Iq9F7POQ2M+3KJhBol1ATrfhm8ZfVdGChSkefkQKvaLCY
         zX6ORYeIR99/9o//63QLh1fQyVsntJSjlT1oixDpMse0h8lrR3wo3oCqm/QJcSyzPhdR
         3vQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dqpwalYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si1361225ybo.60.2019.02.14.05.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:10:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dqpwalYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGmE-00018T-TQ
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:10:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeW-0002xd-Dl
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGTv-0006PT-D0
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:12 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGTu-0006Nf-UF
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:11 -0500
Received: by mail-wr1-x441.google.com with SMTP id c8so6345766wrs.4
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wekCw82j9f50dCxt5gl5FItSotVi6sLhdBFeaiqQhKo=;
	b=dqpwalYpoOdX0v9Eo6ETIZqhPtP11s2vrH9gIEd+qkBF1xGqhSEExr01SjIMYRWOxz
	K5JQlg9R8SoJ/q6MnKBfGFC1Q4JUJQBDzVOAT4P23H3FYn1wDCa2Ecuvvtq2E9UuP/uu
	dyIn62bpU5HDBHMlv+mTIwGv257S0U/NSZf8APMogPY3a2ko2ZFMg7t52glQpcU4m4ii
	6hPm2cUABN+EMh8B43s0bRoOpRgN1TZ5r2o6hmtnh4scyLBUpNLGVOjLAOhd0EoIGc7/
	7J8vyi5ZF6aN6gGpjaDY3HeQO2zRO7yLLLutcVjAlCTa7TQZfoGHDYeSTM+vAi2cfsUj
	MRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wekCw82j9f50dCxt5gl5FItSotVi6sLhdBFeaiqQhKo=;
	b=ShRY6jYOvP32UyE2yM6I96qGN7sTcRd4OfF+EATRp7MElkR9BT/OAP5F0DetFULP/V
	Ws/orbkIkUTDQhjkUmqGpOzECF5QLHauHS+lO0131Q6MeJj2xeQKAs1ZeZfdalwdSgXZ
	azbVU966V9xGRPzreHFnxL+DN3SZkRpuFmFEhta3e23MhSRJjnWC2/EkiSUgmRsAmVuC
	MOSVI9yywCwLUlBodnSq/KJHutTYGAN9aW45/Z2G+c+EtH6GZEoAo9WUaePnSKWfRorL
	Ct3N0Bg9LahEV14eYXWVU+9tCBE+aCGxgqylUJaajHwpWYjSNLKDc1kuaEDM1vJTqR9c
	++Fw==
X-Gm-Message-State: AHQUAuZWpZ4Eje8N65pfCyrcUmmXGSQZCr6j1QYfnPtEEri6rFjzUnab
	vlTYTsaS9gS5SyfEmpli/mVlPQE8wNvvrA==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr2730632wrp.247.1550148669380; 
	Thu, 14 Feb 2019 04:51:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:53 +0000
Message-Id: <20190214125107.22178-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 00/14] Add model of the Arm Musca devboards
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/jxs5xxt5GY

This patchset adds a model of the Arm Musca devboards
('musca-a' and 'musca-b1').
These boards are described here:
https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-a-test-chip-board
https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-b-test-chip-board

They're based on the SSE-200 subsystem for embedded which
we already have a model of. The two boards are somewhat
similar but have a different layout of devices (Musca-B1
puts them behind a more sophisticated PPC setup).

I've tested Musca-A with the Zephyr RTOS's "hello world"
program, and Musca-B1 with Arm Trusted Firmware M.
(Arm-TFM does in theory support also Musca-A, but in practice
it requires proper QSPI flash device support there; Zephyr
currently supports only Musca-A.)

Zephyr getting started guide:
https://docs.zephyrproject.org/latest/getting_started/index.html
Arm-TFM build instructions:
https://git.trustedfirmware.org/trusted-firmware-m.git/about/docs/user_guides/tfm_build_instruction.md

The first half of the patchset is some fairly straightforward
bugfixes and enhancements to various devices; the second half
does the actual implementation.

thanks
-- PMM

Peter Maydell (14):
  hw/arm/armsse: Fix miswiring of expansion IRQs
  hw/misc/tz-ppc: Support having unused ports in the middle of the range
  hw/timer/pl031: Allow use as an embedded-struct device
  hw/timer/pl031: Convert to using trace events
  hw/char/pl011: Allow use as an embedded-struct device
  hw/char/pl011: Support all interrupt lines
  hw/char/pl011: Use '0x' prefix when logging hex numbers
  hw/arm/armsse: Document SRAM_ADDR_WIDTH property in header comment
  hw/arm/armsse: Allow boards to specify init-svtor
  hw/arm/musca.c: Implement models of the Musca-A and -B1 boards
  hw/arm/musca: Add PPCs
  hw/arm/musca: Add MPCs
  hw/arm/musca: Wire up PL031 RTC
  hw/arm/musca: Wire up PL011 UARTs

 hw/arm/Makefile.objs            |   1 +
 include/hw/arm/armsse.h         |   5 +
 include/hw/char/pl011.h         |  34 ++
 include/hw/misc/tz-ppc.h        |   8 +-
 include/hw/timer/pl031.h        |  44 +++
 hw/arm/armsse.c                 |  10 +-
 hw/arm/musca.c                  | 669 ++++++++++++++++++++++++++++++++
 hw/char/pl011.c                 |  81 ++--
 hw/misc/tz-ppc.c                |  32 ++
 hw/timer/pl031.c                |  80 ++--
 MAINTAINERS                     |   7 +
 default-configs/arm-softmmu.mak |   1 +
 hw/timer/trace-events           |   6 +
 13 files changed, 890 insertions(+), 88 deletions(-)
 create mode 100644 include/hw/timer/pl031.h
 create mode 100644 hw/arm/musca.c

-- 
2.20.1

