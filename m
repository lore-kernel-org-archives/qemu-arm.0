Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp624357wrd;
        Mon, 20 Aug 2018 05:24:38 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPydWqOVGj2ZmdLaNoCtep1T3m7FgDLnvCadl+JBq1iRon7IVfmow9kdgHVJvD6WsRRv2tBq
X-Received: by 2002:aed:2496:: with SMTP id t22-v6mr43336023qtc.44.1534767878365;
        Mon, 20 Aug 2018 05:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534767878; cv=none;
        d=google.com; s=arc-20160816;
        b=NYZMp3i2JuXC6+bmZsMy6GP3zVc59v2q0URbTY5JBN1QYWfzloaxiHUiOY2WEiitup
         jyXfyOhkxhVpXjb7UIYQvqAIlcZnpFNrzRTdXdj/HBNdIpevg7R6LHjVgx9jEZ8ABCG1
         jdhf4xzCySx27vU+VBUruWbGu783v/NthKEA0GmYwxbJm7BFnxC4ysQzAj1J4lJdjqF+
         YgWeXEko+GfQN43HLnGH67a/MbUkJSSiY93o/MKFdS0yAp9xrs+U4uhtqhrFPQG2gSta
         J+nNbV+32mduuwE4sbscR1PV+hP8v6+qxAtOIfI+GPGg7dsd/V6Y8hY6oJKGO6CIfKSm
         5Egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:from:dkim-signature:arc-authentication-results;
        bh=eTqYZf1VQ8w0alLr3dlFBYin3ZtdWr3RXKfk3Lay7i4=;
        b=nHfQTlkZOk4Pr51aprnG5rlQEQrFsUtDl6qDySYReMq5s26RkZW/iLL5JlxnH35HYt
         dAQWz9ulQfuuaiNji10sJwF3oC646FqRVH2UN9Wi8tLm7gKrluK1kx44yWqqQgSDMpr4
         NRRxbTJobLcJcUkBw21JDgo9wCCXzWUC3H88FqDaI7rOT0kZv+5/HrsuVHarJdQiiD1z
         EpdRhR6KyoAPVzOvvcgbvDOHO36xzByoldASL5pyhj83TnJJaFxtXhDn4Oou+Yi49wjk
         Sx0tAhV1lbNKvNg+Ea5l0d1g/iwTYikzN80ZkjN6xKCUr2W7Kv/qZZlX82s8wPlfmPZc
         ig1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@isystem-si.20150623.gappssmtp.com header.s=20150623 header.b=ADz5Hcwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9-v6si909058qvk.183.2018.08.20.05.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 05:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@isystem-si.20150623.gappssmtp.com header.s=20150623 header.b=ADz5Hcwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frjEb-0006K9-Rv
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 08:24:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fri5M-0007Cr-40
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 07:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fri5I-0001AK-UX
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 07:11:00 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:39985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marko.klopcic@isystem.si>)
	id 1fri5I-00019k-Jx
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 07:10:56 -0400
Received: by mail-wm0-x244.google.com with SMTP id y9-v6so13530505wma.5
	for <qemu-arm@nongnu.org>; Mon, 20 Aug 2018 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=isystem-si.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=eTqYZf1VQ8w0alLr3dlFBYin3ZtdWr3RXKfk3Lay7i4=;
	b=ADz5HcwmNMvdBvok2EtAh3tvJjbQvi3xAwaNmcPcNoyTL0mwLjY75qlLMa4zLU4vM+
	skw2Ki6tq595CRYg8tYuK+20t7/1MfZ/bpFxXe3dMfldBqevaExGeEOeR2WV1mHbzeiZ
	QVbJJmKjFDWJcP1F8IFkk6L9NF5gvYohK5OoXhAi49WrOZEKDdWerGLXDdq4JjVtCTr4
	PlAN28+fXQUGeMSBrmSp0Z4ajUKsVnPD19Anyli3oiog/P9VOKe5wEgGiOoWIIWYrdAY
	LV6cgeNx3da+IaGkRVPH6/BLBQiWCDRcIpPuSubPtGSBJ82bYPG6xLuS3ln6d5hh8IOD
	fDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=eTqYZf1VQ8w0alLr3dlFBYin3ZtdWr3RXKfk3Lay7i4=;
	b=V3tclWbcbwAgHiJpRrDPxg5uHhxQOBqfVqAS3nVCoq3XavH/07tjWF16aX9mL7ILGc
	olBZnLaIHVrrJJSb4KlxpDF4sxzTOzKLKnXRa9ZZPpwFkdGZO/n1Gy9aWjIfv40rJBNg
	1heDLoelnDCWDGgobrj1NAjt94t7iVBK2R2qQgP+G739oV4LpPmPk9qofsUMheXUXSNz
	KnKqb88Qe1sNzErUCWrpotDk0IXLJakcHcT2IdxhSlGZPnMyB/0Ls3dB7/npg4otbDD3
	l4qDUxUujyVlBKhf0oDWpGOKuHDJXd1//zzmy+npZfs957uFeOg78d5k5QtUTdPfGDWO
	E+GQ==
X-Gm-Message-State: AOUpUlHrRh8++fTp1Bw+IykwuoyGokIFf56OZzE1l76a85VSpO8IofI5
	3RYnDJyljlZtUFdUDfivSU8/Cw==
X-Received: by 2002:a1c:55c2:: with SMTP id
	j185-v6mr26037488wmb.104.1534763455048; 
	Mon, 20 Aug 2018 04:10:55 -0700 (PDT)
Received: from [10.1.2.132] ([77.94.130.182]) by smtp.gmail.com with ESMTPSA id
	m207-v6sm12468099wma.31.2018.08.20.04.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 04:10:54 -0700 (PDT)
From: Marko Klopcic <marko.klopcic@isystem.si>
To: qemu-devel@nongnu.org
Message-ID: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
Date: Mon, 20 Aug 2018 13:10:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
X-Mailman-Approved-At: Mon, 20 Aug 2018 08:22:52 -0400
Subject: [Qemu-arm] [PATCH] arm: fix reset operation on netduino2 board.
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, mjt@tls.msk.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mAgXbgcSGunA

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Because roms are located on aliased addresses on netduino2 (</tt><tt><tt>Cortex
        M3, <br>
      </tt>STM32F205</tt><tt>), PC and SP are not read from loaded
      kernel, which means</tt><tt><br>
    </tt><tt>that the first reset fails. This fix adds additional call
      to reset.</tt><tt><br>
    </tt><tt>See more details in code comment below.</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Signed-off-by: Marko Klopcic
      <a class="moz-txt-link-rfc2396E" href="mailto:marko.klopcic@isystem.si">&lt;marko.klopcic@isystem.si&gt;</a></tt><tt><br>
    </tt><tt><br>
    </tt><tt>---</tt><tt><br>
    </tt><tt> hw/arm/netduino2.c | 27 +++++++++++++++++++++++++++</tt><tt><br>
    </tt><tt> 1 file changed, 27 insertions(+)</tt><tt><br>
    </tt><tt><br>
    </tt><tt>diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>index f936017d4a..a2f102b14b 100644</tt><tt><br>
    </tt><tt>--- a/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>+++ b/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>@@ -25,6 +25,7 @@</tt><tt><br>
    </tt><tt> #include "qemu/osdep.h"</tt><tt><br>
    </tt><tt> #include "qapi/error.h"</tt><tt><br>
    </tt><tt> #include "hw/boards.h"</tt><tt><br>
    </tt><tt>+#include "hw/loader.h"</tt><tt><br>
    </tt><tt> #include "qemu/error-report.h"</tt><tt><br>
    </tt><tt> #include "hw/arm/stm32f205_soc.h"</tt><tt><br>
    </tt><tt> #include "hw/arm/arm.h"</tt><tt><br>
    </tt><tt>@@ -39,6 +40,32 @@ static void netduino2_init(MachineState
      *machine)</tt><tt><br>
    </tt><tt> </tt><tt><br>
    </tt><tt>     armv7m_load_kernel(ARM_CPU(first_cpu),
      machine-&gt;kernel_filename,</tt><tt><br>
    </tt><tt>                        FLASH_SIZE);</tt><tt><br>
    </tt><tt>+</tt><tt><br>
    </tt><tt>+    /* </tt><tt><br>
    </tt><tt>+      The following two calls are a workaround for problem
      with rom on aliased</tt><tt><br>
    </tt><tt>+      addresses on STM32.</tt><tt><br>
    </tt><tt>+      Kernel is loaded into Rom objects, which are stored
      in loader.c. Roms</tt><tt><br>
    </tt><tt>+      are copied to memory in:</tt><tt><br>
    </tt><tt>+      </tt><tt><br>
    </tt><tt>+      void rom_reset() {</tt><tt><br>
    </tt><tt>+        ...</tt><tt><br>
    </tt><tt>+         cpu_physical_memory_write_rom(rom-&gt;as,
      rom-&gt;addr, rom-&gt;data,</tt><tt><br>
    </tt><tt>+                                       rom-&gt;datasize);</tt><tt><br>
    </tt><tt>+        ...</tt><tt><br>
    </tt><tt>+      }</tt><tt><br>
    </tt><tt>+</tt><tt><br>
    </tt><tt>+      However, since CPU reset is registered BEFORE</tt><tt><br>
    </tt><tt>+      rom_reset(), SP and PC are read from memory BEFORE
      roms are copied to</tt><tt><br>
    </tt><tt>+      memory. CPU reset also checks Roms for data, so this
      is normally not a</tt><tt><br>
    </tt><tt>+      problem, but in STM32 PC and SP are read from
      aliased memory, and these</tt><tt><br>
    </tt><tt>+      memory addresses are not mapped to Roms. Since ROMs
      are private in</tt><tt><br>
    </tt><tt>+      loader.c the only option to copy Roms to memory is
      through reset. So we</tt><tt><br>
    </tt><tt>+      first have to register Roms for reset, and then
      trigger system reset, which</tt><tt><br>
    </tt><tt>+      copies Roms to mem, so that reset vectors are in
      memory, when</tt><tt><br>
    </tt><tt>+      qemu_system_reset() is called again from main().</tt><tt><br>
    </tt><tt>+     */</tt><tt><br>
    </tt><tt>+    rom_check_and_register_reset();</tt><tt><br>
    </tt><tt>+    qemu_system_reset(SHUTDOWN_CAUSE_NONE);</tt><tt><br>
    </tt><tt> }</tt><tt><br>
    </tt><tt> </tt><tt><br>
    </tt><tt> static void netduino2_machine_init(MachineClass *mc)</tt><tt><br>
    </tt><tt>-- </tt><tt><br>
    </tt><tt>2.14.1</tt><tt><br>
    </tt><tt><br>
    </tt><tt><br>
    </tt>
  </body>
</html>
