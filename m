Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3528159wre;
        Tue, 29 May 2018 05:48:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLHhsfXaWLZbQh+0b6FcJwwMo5zqTzysvW5pI3sBEXZYV6zJpd6A3Eh5S2qH++wrRTV4U5I
X-Received: by 2002:a37:8b01:: with SMTP id n1-v6mr15450954qkd.69.1527598094061;
        Tue, 29 May 2018 05:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527598094; cv=none;
        d=google.com; s=arc-20160816;
        b=oVZOR+hFIxQsm/eaFGS22evJLu+HH7wPWKZK4How2axUz720/eaaQyHG2TZU19Z+Is
         CIhWD/XjqsIGFM7pY+5T5MoH6X23OsFznbYk0PpjSeVnr0ijwByq1RNy+d8DIbKF+Bp9
         FM/2UOHuybIuyKGtYg+w8vC1oxfXjPOUcdymhkbviTqDWpjg7wiaj6W9yy/YOUaH1VY3
         CoUAor89pDMsxxAilxpJrXRCEg+HhSNbm7pPNgZht7P5fzV8DPsGyXixyn6Z/rZQ23XS
         YaNTtSZ5rDAfuuiEsaj6jIHwudeEbErzGUVgUrak6XtxrOa8lK9aBInM6p0Of+wvdOP+
         xk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=3tOGIk5ShL8jqg217JNx/xpw2C19y3iS3A4kkLMGW+s=;
        b=Qrn4XeSIR6zVbkvT4ratR95lgnJZov3jzQH/77BirQf+bhv35NhRLsspx4hieVAV6B
         QVyVEyhZhXxAwKuYL6VFQfaDZNsGDUHQs7cQ8kcxprFRni8jepVCQvj38oLFFkL4ee/l
         npVQoG49IqsvnaegZ9YoovMUbqaZeZoEikCbilSdVvvPultADzNEG8G/kArcBrfsxg2s
         aIEG8z7m3hN3siTjBdtm00cEGoCw8d4cD9LiW0kJ82c9pGE/uHxzfHPIrwoe7qXpAq7j
         QHySVpN1jts/XyM2lR2BNYf0Ksco3E3rvpBQ7Aqexf2MXZCidBoNUU3zuBBeXLHGPmFk
         hAZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PqP80Woh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si1091711qvl.172.2018.05.29.05.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PqP80Woh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNe2v-0005TV-Fi
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1x-0005GL-Tz
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1u-0007Nr-TX
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:13 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:42900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fNe1u-0007MQ-Me; Tue, 29 May 2018 08:47:10 -0400
Received: by mail-wr0-x234.google.com with SMTP id w10-v6so25305366wrk.9;
	Tue, 29 May 2018 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3tOGIk5ShL8jqg217JNx/xpw2C19y3iS3A4kkLMGW+s=;
	b=PqP80Woh0foVIj6lbrYLGEBzoG4o0YPq9Es05vVd97o6jhmVvIRvOD2hVFv1bzdTPH
	Cyllb/QrRp2Pt4HVAjLTO/ktrPHb28YiU095vWJE9yL++afQqn/9cmjpD9/2HfVHtPgH
	ycz+FlZTONDRsLKoSqJx+U0IQLmB/TSaoaT6TM6qyaMazJxcq5yCpGahUWH6j3yDilrf
	2KSyOT84rxrSKww64RAiUL19g8v/QFqqrVDUFsjz0QZr6V7AKQAR8epJRc3DdPUxARa5
	ZLrR13b6+Z+b3DeGsNXj4PEV3gWky0h0iXu/K8uYXVYq+aOxZ++DLK2NCYCcD5ACgT9G
	Mg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3tOGIk5ShL8jqg217JNx/xpw2C19y3iS3A4kkLMGW+s=;
	b=ENcBcQOrvA9/mMvqwZEeNVNtE7oi2oUKP0/FXRjBbCPod4sllwIx6pLeMtNk1cB7dQ
	EzsbSsyZOdKBzuqN/StY6O4iO4Kgl1vxm1Nr4VY34scFdQl9VeO3IpASPcf6AmbzXhaA
	+WdYXxXcr1zgmSpNr1T6uqlc0l5HIfYToBHFgXYj8ocMKB4diClEj/y7Rj1pE86DmiGf
	/60eVneMo7Ts7ozBWbummTBhxEbEQ2Txbmf9UeEUhuojU/hLQFeV/NVPL8dqh+EgxrFE
	TTKBK1FLpPsfD66dAl8BoBkQ08WKKF3PHKhBeLyutDibDmNaS4k2YK94BRV45JMNiWxx
	3AWA==
X-Gm-Message-State: ALKqPweJUwoxqBAQuXHJYyYr8Yxf9V+l3z2HXAG3AnksT+MXA2RNEBc6
	OF8uL6j/O5Dqzt/Sx6udA9BYWw==
X-Received: by 2002:a19:c7c8:: with SMTP id
	x191-v6mr9058122lff.122.1527598029286; 
	Tue, 29 May 2018 05:47:09 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	j18-v6sm1591969ljc.11.2018.05.29.05.47.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 May 2018 05:47:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 May 2018 14:47:05 +0200
Message-Id: <20180529124707.3025-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: [Qemu-devel] [PATCH v2 0/2] xlnx-zynqmp: Change the Cortex-R5 for
 Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, f4bug@amsat.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0L2ezKXS2f9A

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The ZynqMP actually has Cortex-R5Fs with the optional FPU enabled.

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Update ZCU102 description to mention R5Fs

Edgar E. Iglesias (2):
  target-arm: Add the Cortex-R5F
  xlnx-zynqmp: Swap Cortex-R5 for Cortex-R5F

 hw/arm/xlnx-zcu102.c | 2 +-
 hw/arm/xlnx-zynqmp.c | 2 +-
 target/arm/cpu.c     | 9 +++++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.14.1

