Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3040325lfp;
        Sat, 15 Feb 2020 04:24:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzbnCb8NxLcczxxBsi4tw35faOJrZ3Y7QCfj388kzLLa00mcHnRMRKIg4x3HWVT5QzGyqz
X-Received: by 2002:a05:6214:450:: with SMTP id cc16mr6037427qvb.175.1581769449556;
        Sat, 15 Feb 2020 04:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769449; cv=none;
        d=google.com; s=arc-20160816;
        b=TpnXN0Kn/DoQNlzhHAlQG6z0LJBWjfTfa4EepKt23y6a38hySy50AJvtPXUMP10s3h
         XCvvNNBSZSSXIn/Gm4QegyvcSRsRLV168gGreWwdj5ZhQe65si73kLRdUI1oXnR+o+7P
         u5ZsdMPFmKGjQWLXkePCQNqduiFxEYqJUsHJgGx7mug05j4fSqVuWFfAzxIUeVQU+9wG
         bHgAseyugVI/mrjAKO4krwU6PcOU2vYwuQsZS8DwjQZy2F2YSrq4CDm073vAtyltAtzI
         /V4yNEkuPjFgjlm9crhnFKX8XwzlJQB+iMVvALwYIfDwNKk6AFGZRneJILyYoDlRZRyJ
         ko5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=8C62QGnIr96+4MztDityiyQWSkkPM89tJTShALemV3Q=;
        b=HO1M/3Uco9itgJKkaPbTJEavp65xZGgSfml4EfiI607WbbFzEse+/6B0pUnIOdSegd
         5C/NEqFuUNHMjG5NzKJX4DD8dDGoRmkK9yvuaBtWGxMr79zwyhlAoGcB5WqOLSLProy0
         Ad4KBblMRBeSS94oFhIcnYIwdA4xJocOQm9llADA3GbB5rHoruyqWK7XKmARbJ8rJwnt
         v+huLex3eGbhw4j87oftFhdBKfpsMOCtrDHcKihvwPoOfRNNeoKTatbV72Id0nO5pVRf
         tRjVWI4vf7C7GfQ8nQPvEd97c59eTVTzP7X3XnBJrULGi0GaP+JLZtmGGz1//ckuEeH/
         DCnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vSbx8Yp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si1299389qko.372.2020.02.15.04.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vSbx8Yp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2wUS-0004Ej-W9
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 07:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2wUK-0004EW-GA
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 07:24:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2wUJ-0000wy-G5
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 07:24:00 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2wUJ-0000vk-9I; Sat, 15 Feb 2020 07:23:59 -0500
Received: by mail-pl1-x644.google.com with SMTP id y1so4901810plp.7;
 Sat, 15 Feb 2020 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=8C62QGnIr96+4MztDityiyQWSkkPM89tJTShALemV3Q=;
 b=vSbx8Yp0ed7T+Wqr/xdC2gMAsY1HrKkaKTN/6PrMoujQtqBQoJHZqh9ilc1WYJtaZz
 xdJFrqfSFNEODgkCs5OIHZz2PANHzYRgC5tRtasNpRq6uCg30T0+ZBT0yfXheafU1YM1
 QT3YNLRHxxIrhESVAq4YTOrce9JVFHzdUr/k0n2+Jlf2LBV0/hNMPdSeW+n4soZBF/PD
 MRWZ2P/VQIRRk2XsPMcRaqunoI1m2dyOOu1iXrnskH1HZQTj9zZFedQGAh2n9AHH8cKG
 L66MxjMKjM0h/J7H+otuGiL9v0I1ycXc5rl36+Vegd/wRr4NUuuYDrAOpCA8uwgsk9XP
 +sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=8C62QGnIr96+4MztDityiyQWSkkPM89tJTShALemV3Q=;
 b=AVcOL3hNkXOeghJ5mu5XFgn1w/UmHrp5l2YRbOwclu85IITPIm3qCsnxL2tG6tmIoB
 xxUNmmn6N5fJm5tDPJ057/ZGRAzmZgasIXNxBzgXOLWCzP3eDa1aSrjOHAGjAcb4FptA
 0lTBVKYa7Ug8wFNoETqg6o64nYmVgV+Rf8jDvH7f+iPdld7IyZPmYbyTsFezNSEwkKf9
 n1TPttVgw0435cFbtxe6RA5cHhZcicEAlUdpmOn/ZPBHP018WolSInFYP3uJIpT+h0hT
 8X5HuBcBNp9MJOkzY47Zrl0zWfAnUe9AWIZS0NqimJaM3cQpEsXAojeGYricQ3d1K+Kx
 TAdA==
X-Gm-Message-State: APjAAAXCz0uL4Gq42ERBt2h6z/U0WplRRp8Rvz7Ou+2ys1ToRHNR1/bW
 rKEaElYm3vEuUElKT9xMxLQ=
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr9281746pjv.45.1581769437579; 
 Sat, 15 Feb 2020 04:23:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id o10sm10488193pgq.68.2020.02.15.04.23.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 15 Feb 2020 04:23:56 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/xilinx_zynq: Fix USB port instantiation
Date: Sat, 15 Feb 2020 04:23:52 -0800
Message-Id: <20200215122354.13706-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Zzg4WLo4rjS

USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
Linux expects and checks various chipidea registers, which do not exist
with the basic ehci emulation. This patch series fixes the problem.

The first patch in the series fixes the actual problem.

The second patch removes the now obsolete explicit Xilinx
support from the EHCI code.

v2: Introduced summary

----------------------------------------------------------------
Guenter Roeck (2):
      hw/arm/xilinx_zynq: Fix USB port instantiation
      hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,ps7-usb class

 hw/arm/xilinx_zynq.c     |  5 +++--
 hw/usb/hcd-ehci-sysbus.c | 17 -----------------
 2 files changed, 3 insertions(+), 19 deletions(-)
