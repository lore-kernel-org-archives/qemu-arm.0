Received: by 10.223.161.27 with SMTP id o27csp913176wro;
        Fri, 27 Oct 2017 09:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TEfbArtqJJtjiFWMn/vYq7F35wVSy7ZP27JZqDi2DEa587kixFIypKdP0LkQyU4U9UREgD
X-Received: by 10.37.212.81 with SMTP id m78mr750768ybf.446.1509121740946;
        Fri, 27 Oct 2017 09:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509121740; cv=none;
        d=google.com; s=arc-20160816;
        b=HjgD3fE7NWZl/QZkeXJT3PdQQK9+7Et4e8mfyWKfGvKlEFzckfRZ+hsRwSed3b4KVN
         a53l6s+7iNs2lGbbupga3GwprqZiQ4J+IVhWDvGUSpo5cgOnkIjiIzIf5lS7CCI08H2G
         nZq9NsOnausADdWas9PAyS1ayVcs9LfM4KLZcys0mL8qM05NJhVsNBWPF9+giIZiSsr6
         z3XRju92mRY52JKh+jJmEd7S2A0/j5jjdhZwpusvMHphHLeGnsXPtFeg/04ek+lR78TY
         XYJMH1Bt78dEP8bnYS5fuwdpdV8iHKGvBQtcUQH6/4AGflpWB277enPf/GUvJAMH3ZOS
         D67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=UGzFQ/ec0fI9VsjAHysuodjuF34ZvKdV0AauHMUiWog=;
        b=CaHbbeR9a6/xPa4QBrCFTQd5b6lMW5AV61kdQdZFt21fFyKqWdMJirn2bzwzaByb7F
         cAzGVP9KAh/SrRz217Ycd4oN/rgtFbUpNd2TZy9xWlao0v4diEbhlh1sA/LK81jrV5td
         v0dunyoWOEpF8Bf7vldcgpomc5R3ebvVyuJRx41eeoTNrBLnAXH08O2H3Hb6rvp+tkX6
         QZ2gzO+Zbub7bEPTapvTHaGE/KRFT0jzbGxyZ461UJDkNfoHes2qmV1cfd/66OnvH8OX
         iZv9EXEA0oQ2h5aPpOKOnWfDBT9PLSdggThmOIoBUVkTCCKc7MSKzU/LkNF5RecG+1qB
         KgoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TIr3cZjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si1190434ybc.241.2017.10.27.09.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 09:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TIr3cZjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e87VE-0006sV-7D
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 12:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V1-0006qt-Nk
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V0-00036t-N4
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:47 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:50983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e87Uv-00032h-OG; Fri, 27 Oct 2017 12:28:41 -0400
Received: by mail-qt0-x241.google.com with SMTP id d9so9102846qtd.7;
	Fri, 27 Oct 2017 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UGzFQ/ec0fI9VsjAHysuodjuF34ZvKdV0AauHMUiWog=;
	b=TIr3cZjErAi2txmNYoTrCpQA4f7y/I7PoXxl2JooPfMtJdIqA8anVFPaCb2v0ZfQDT
	FNKryPITG5gD4Ru9Hdhig/U/qVL/T1QaGB9P27gaRFgPTSv2Si8NwQffsDww97GtLjx8
	rTAriIJLs89LP0Cw6JWh+r2+l4UVc5Yel9vslHXv5IYcBpax6hlge0TRHuxWsemE2w8c
	4Pvtc+L5m4uikFEC0CTDEObila45GF30Ms0Uhulm8n+NdtEVSmMZ/Gsxdnc4S38o/VNE
	U94TXogzz34IdHf//T7l4LBAHyh33M7hHf2YwzaCeVe+vw8ifdN6FDPPuWXT4uAAk9W/
	BOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UGzFQ/ec0fI9VsjAHysuodjuF34ZvKdV0AauHMUiWog=;
	b=bKiiwZQRPD7hZaFW95fD0qyik5ZSyMPy5PWR7CZoxEbjacfe5fQZLszYaVXsVr47QI
	LxTgfhrMGYeALM97buF+rR79XXhK3OKo2zpZrR/Hr3HiiApRVtbLBTDfcapOBoj6GrNL
	3Iq0XPsUZj6W1XCZ/xeUrOFuxcZ6fH++Bwq5q/oJzA4xnz4tsVR4fgGFuFaWPhKcdB4Q
	M8rOqp4KrBEKu+jLKDMb0YTBdXr5yAlB46pxc8PQSbRmpPQ3OLuLOPL5y+yxnM3lJq78
	b5u6pj7CVliWjiG9zD5W39R/W0GFfX9kzNxqGzk8Z/m3N3VNCGUmuKz5I2hhpAn/FvIO
	kaig==
X-Gm-Message-State: AMCzsaVPo2V+kM3sDOLFVUfO8eJWChJ0I+kRsF66jf0mIGY/YwcXGtuS
	kPevIIevj7Y7qyxmIl+ZW9PvG0kb
X-Received: by 10.200.48.171 with SMTP id v40mr1753565qta.120.1509121720924;
	Fri, 27 Oct 2017 09:28:40 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	t126sm5152568qke.36.2017.10.27.09.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 09:28:40 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Fri, 27 Oct 2017 08:24:10 -0400
Message-Id: <1509107055-21978-1-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 0/5] arm: kinetis_mk64fn1m0
 machine
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5NYIZgWhhOze

From: Gabriel Augusto Costa <gabriel291075@gmail.com>

Hi everyone,

I made a new arm machine with some peripherals.
The machine is mk64fn1m0, a cortex-m4 microcontroller from NXP Kinetis family.
I have prepared a series of patchs to include this machine:

PATCH v5 n/5: It adds the machine and peripherals devices;
PATCH v6: It changes the Makes files to compile this machine.

This machine has been created based on K64P144M120SF5RM.pdf, stellaris and
stm32f205 machines, and reading the code of the other devices. Also, the
comments from community and special thanks to Peter Maydell, Philippe
Mathieu-Daude and Eric Blake.

The initial propose of this machine is execute a simple example, only
with UART0 in polling mode, and gradually adding other devices/peripherals to
this machine to allow execute an operating system like FreeRTOS or MQX.
Next step:
	-Execute an example of UART0 working with interruption.
	-Add a timer with interruption.

The code to test can be generated using MCUXpresso IDE v10.0.2_411, with the
option "Import SDK Examples", selecting "frdmk64f" family, driver_examples,
uart, polling.
The binary file generated is frdmk64f_driver_examples_uart_polling.axf and
can be executed in QEmu with this patch using the following command:
$qemu-system-arm -M mk64fn1m0 -kernel frdmk64f_driver_examples_uart_polling.axf
obs: I can send the file if someone want to test!

History:

PATCH V1: First try. Many errors, the patch is long with code style
	issues, change the files to executable. 
PATCH V2: the same mistakes.

PATCH V3: The patch was splitted in series of patch, without code style
 errors. I receive some tips about QEmu functions and others tips.
PATCH V4: Not send.

PATCH V5: Change the 0x%02X to HWADDR_PRIx on qemu_log_mask and added
	.valid.min_access_size and .valid.max_access_size
PATCH v6: misunderstood the process to add a new model, next patch will
	include the changes in the Makefile in the same patch version.
	
regards,

Gabriel Costa (5):
  arm: kinetis_k64_uart
  arm: kinetis_k64_mcg
  arm: kinetis_k64_pmux
  arm: kinetis_k64_system
  arm: kinetis_mk64fn1m0 machine

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/mk64fn1m0.c                   | 136 ++++++++++++++
 hw/char/Makefile.objs                |   1 +
 hw/char/kinetis_k64_uart.c           | 343 +++++++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   3 +
 hw/misc/kinetis_k64_mcg.c            | 208 +++++++++++++++++++++
 hw/misc/kinetis_k64_pmux.c           | 158 ++++++++++++++++
 hw/misc/kinetis_k64_system.c         | 274 ++++++++++++++++++++++++++++
 include/hw/char/kinetis_k64_uart.h   |  79 ++++++++
 include/hw/misc/kinetis_k64_mcg.h    |  43 +++++
 include/hw/misc/kinetis_k64_pmux.h   |  38 ++++
 include/hw/misc/kinetis_k64_system.h |  52 ++++++
 13 files changed, 1337 insertions(+)
 create mode 100644 hw/arm/mk64fn1m0.c
 create mode 100644 hw/char/kinetis_k64_uart.c
 create mode 100644 hw/misc/kinetis_k64_mcg.c
 create mode 100644 hw/misc/kinetis_k64_pmux.c
 create mode 100644 hw/misc/kinetis_k64_system.c
 create mode 100644 include/hw/char/kinetis_k64_uart.h
 create mode 100644 include/hw/misc/kinetis_k64_mcg.h
 create mode 100644 include/hw/misc/kinetis_k64_pmux.h
 create mode 100644 include/hw/misc/kinetis_k64_system.h

-- 
2.1.4

