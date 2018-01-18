Received: by 10.28.173.206 with SMTP id w197csp6870863wme;
        Thu, 18 Jan 2018 10:44:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBov6lWUS7hn5z1e3ANdQvieivLnck5N0UixmP/QMg/m9gS/fYrYKP48ft4IByPJoW+M44Ozv
X-Received: by 10.37.214.213 with SMTP id n204mr40392990ybg.67.1516301072659;
        Thu, 18 Jan 2018 10:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301072; cv=none;
        d=google.com; s=arc-20160816;
        b=L2FHxMtxXRp+k8PtAkfwS2RgGwtGK8G2MzbL3O/miWams8L4u1asfHZbXb+fuyHMNP
         Etj/1wMXAcCMB5+/aEthz9bWRBZYmnW7UPHU2/uawLqp+HEupD6JADVBx9hKVCRknT9q
         y78SbTcfnMkYcwhgembUsUbovHzWC7tWIz9vHprFlffz2346Vk8Wvcx/6k4exBqBFlGV
         oTUIugJlGRFByy4ZWZbHgnvNh1ywaLgas7NLnl344Alr+GyGiDFCVk/Zc/CaPO/+eyOV
         cool0aNVkT9KZV6EGpE0QpaV9Y/pV0KlzPetJ58DtAMqtODgrRYrznT5ISSCDqek5gP8
         +Qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=OL6rxAPma5l+vDLvUYLbQ+D3CFtVIdZp6SRxPEqngL4=;
        b=Bj2IikycXzz+Utv8BSmdzyh5yhnw8ChWOLsqRtECKQA0I7671G0nO4tGTs3BUT0oDu
         1SqN+/lflFw9vF/aIkFDVg1/Lj/+w4FCzN9jes46S39xM23A1tMhzxt+VR21F08UnJn/
         gNZ/GUxdkwq5s46U5bEA6zosfWN0V31u87oNRYr35/oq6XlAWXFyotOwGbZRsP7Xshj6
         1ECi+rNe5AKmG5M3zDOZhKpbVGcEVg0MnTWAbxz2emrAdYXRuCKlMYYr7PDscWOOyNjM
         zX8Id7kFwWavNEs8Z/S6YvmsQd9N/sF2g5/ekz6eh3evZZYwg6yreirynBiESxqYTa44
         MNGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aEAVRIn0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l28si1870877ywh.414.2018.01.18.10.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aEAVRIn0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFAu-0000Im-3b
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:44:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8j-0007TQ-EO
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8e-0002mN-Ib
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:17 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:39175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8e-0002lh-DA; Thu, 18 Jan 2018 13:42:12 -0500
Received: by mail-pf0-x242.google.com with SMTP id e11so15312245pff.6;
	Thu, 18 Jan 2018 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=OL6rxAPma5l+vDLvUYLbQ+D3CFtVIdZp6SRxPEqngL4=;
	b=aEAVRIn0l7yLgN0m32i128MnoHBw8rvdLMf9Ti2OsX5HTW/kIYOn/7aS+A3QMau53S
	tjOPirSLELNcTYv4JUiMjcpQ/GB+0KE9AyMDOVOJglp0sNAe/E8l2Oj5zShS5n9Pjnlg
	AM+R0otYvU70C5n0xQQXf+UAg7lkO9cFAYK+lTY6T+14CvHf9jKv7X1pJhQmRGRCMPo/
	lrITk22mC3uelel3InGplkxonv28eDIYmsGLQ2v9rJAtE239BVXd2KjllYbJ3fdbMxzV
	VT2D/2yqDJR0ISU/EOnnkGMffbyURq0wrNn2P8oJcTQKrLBUvjQqsFARpiwvs1Mag6wE
	XHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=OL6rxAPma5l+vDLvUYLbQ+D3CFtVIdZp6SRxPEqngL4=;
	b=ecOH9x2P2zFUxlPzgnrpoBwXa+rtUbLdm1nCZyzj+TcYmaswd2MJwfNNQzI3V4Z6bt
	DM8RR/UVESVpyAtZASxRUoQcyAXL7Da+uc72jweErvsYaWFBbZgn2G9CXANt1Njy81xh
	OSvVTOxaz7QOAqN39wBKg1BSR/U7zLBObQm7k040lBl9fzr5t5Gf2DJDyRHnBalDmcdk
	VX+uS/RohNQ59Sj0gflWoWRZU5t/kZ+oy7QENXmFJUNKLGK7JAC1B0vM5sa7zq4lXYG3
	wCwtqEVVFDNOxyvjWCOsAVKX7YFnyMqEoTOmajsKgDSMk5//TKR66UPR/tZ36zPHWzKv
	06sA==
X-Gm-Message-State: AKwxytfSkGNZsVmKvqO28aFapeSX+WBpriARqQc1dz1aSm3Ic5Rh+lAR
	WDpm3y3EjUeJqMNL0VJkmdwIr/o/UkA=
X-Received: by 10.98.153.197 with SMTP id t66mr9181301pfk.142.1516300930992;
	Thu, 18 Jan 2018 10:42:10 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	77sm13365512pfc.187.2018.01.18.10.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:09 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:37:44 -0800
Message-Id: <cover.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v6 0/9]  Add the ZynqMP PMU and IPI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dCR3QlPXjDP3


This series adds the ZynqMP Power Management Unit (PMU) machine with basic
functionality.

The machine only has the
 - CPU
 - Memory
 - Interrupt controller
 - IPI device

connected, but that is enough to run some of the ROM and firmware
code on the machine

The series also adds the IPI device and connects it to the ZynqMP ARM
side and the ZynqMP PMU. These IPI devices don't connect between the ARM
and MicroBlaze instances though.

V6:
 - Pass initrd instead of kernel to microblaze_load_kernel()
V5:
 - Fix clang makecheck error
 - Rebase on master
V4:
 - Rename the ZCU102 machine to just ZynqMP
 - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
 - Move the IPI device to the machine instead of the SoC
V3:
 - Add the interrupt controller
 - Replace some of the error_fatals with errp
 - Fix the PMU CPU name



Alistair Francis (9):
  microblaze: boot.c: Don't try to find NULL pointer
  xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
  xlnx-zynqmp-pmu: Add the CPU and memory
  aarch64-softmmu.mak: Use an ARM specific config
  xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
  xlnx-zynqmp-pmu: Connect the PMU interrupt controller
  xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
  xlnx-zynqmp-pmu: Connect the IPI device to the PMU
  xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC

 default-configs/aarch64-softmmu.mak    |   1 +
 default-configs/microblaze-softmmu.mak |   1 +
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
 hw/arm/xlnx-zynqmp.c                   |  14 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
 hw/microblaze/boot.c                   |   2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
 hw/arm/Makefile.objs                   |   2 +-
 hw/display/Makefile.objs               |   2 +-
 hw/dma/Makefile.objs                   |   1 +
 hw/intc/Makefile.objs                  |   2 +
 hw/microblaze/Makefile.objs            |   1 +
 15 files changed, 1275 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

-- 
2.14.1

