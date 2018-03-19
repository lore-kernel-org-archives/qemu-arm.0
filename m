Received: by 10.28.91.67 with SMTP id p64csp2789111wmb;
        Mon, 19 Mar 2018 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuVUBTMK4Bxfk1ltidJ+f89V++Du81cSRbO33MjD0KxcGMgS9tKEIMdiK/lbY0ChNhcpl6X
X-Received: by 10.129.131.215 with SMTP id t206mr7275915ywf.93.1521476174989;
        Mon, 19 Mar 2018 09:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521476174; cv=none;
        d=google.com; s=arc-20160816;
        b=a6uGVm+rlreGY0XFyF8Ds9gBKFoFz7gPBFQRPcbUleJnyUyNlbCg90KTVIExGZpHWj
         Wx+Rq990GI0H9fwKqGiOmme6H+TUBkyPuwM6e4+VPaEU7pVoFd0oFJosE1STcT2loM2V
         psPmQYZRFL3gNYdXsz1soppyor//8OMIPjSXJ0jHYlysHkihqmIgjivc3lY+tpnvVf5v
         hBJkkRkDgVURHxN8PqaGuSOrhrY06QAkCy5GtCfmMuhzP4OwljIBB2zA5hv2c7JR9VMD
         iv9xZtaYfLltWkGbbonf9FMdPRWn7+cwt0YQwc5Xr81Qg9XihmhUJsS85IbFTdvWMoJK
         cUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=1sGL5mSyCUemikTAEc/k6XhYB+snRlg8XZtZF06DE9s=;
        b=ow6iHwEHon+9TEVDGoNun9oNMeUcUE4sDpGmQL5+ppx7rnwr3ceA+ZeZr6CR4TT+t2
         eHGr5vwtig1oAf+hZX3cj9FDIkWH00SLGoc6QWsNuEgjkzfw/h/aiH14NG6WDmXMduCf
         5InvJWPftXkfpRUVsKgyJlR4xrCgQ26GdrBh/jvnrlNB84+BK+n4q2MQGx5gvQRdIsn/
         wVtq0XPCrrnyFGO8Mqdwfv5lRB5rW4az+0OYswRYbc6pwyuM8VRMPPk1QvEGCHXeXhBl
         ZI6i+35+H3AtstlKmYDpuqETNHVFI0WawhxzlJhJF7pTQ2hy9IOT2vsN9pwCyA8EqVVf
         EbAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si362007qte.480.2018.03.19.09.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxSI-0006v5-Ea
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxS6-0006uo-WF
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxS6-00007r-4N
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:16:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1exxS5-000077-TH; Mon, 19 Mar 2018 12:16:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1exxS2-0002tJ-59; Mon, 19 Mar 2018 16:15:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 16:15:54 +0000
Message-Id: <20180319161556.16446-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12 0/2] bcm2835_sdhost: fix interrupt
 handling
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
Cc: Pekka Enberg <penberg@iki.fi>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5/CbyRqOgDih

This patchset fixes the code in the bcm2835_sdhost device
so that it raises interrupts in more plausible places.

The Linux bcm2835_sdhost driver doesn't work on QEMU at the moment,
because our model raises spurious data interrupts.  Our function
bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
called with s->datacnt == 0, even if the host hasn't actually issued
a data read or write command yet.  This means that the driver gets a
spurious data interrupt as soon as it enables IRQs and then does
something else that causes us to call the fifo_run routine, like
writing to SDHCFG, and before it does the write to SDCMD to issue the
read.  The driver's IRQ handler then spins forever complaining that
there's no data and the SD controller isn't in a state where there's
going to be any data:
    
[   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
[   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
(continues forever).
    
Move the interrupt flag setting to more plausible places:
 * for BUSY, raise this as soon as a BUSYWAIT command has executed
 * for DATA, raise this when the FIFO has any space free (for a write)
   or any data in it (for a read)
 * for BLOCK, raise this when the data count is 0 and we've
   actually done some reading or writing
    
This is pure guesswork since the documentation for this hardware is
not public, but it is sufficient to get the Linux bcm2835_sdhost
driver to work.

If anybody has other OSes than Linux that use the sdhost SD
controller (not the 'Arasan' one, which is a different bit of
the SoC) testing with those would be appreciated. If anybody
has documentation for this hardware that would be even better.

With these patches plus the previous set, I can get the Debian
raspi3 image to boot (though there are a lot of warnings relating
to the pl011 UART for some reason).

thanks
-- PMM

Peter Maydell (2):
  hw/sd/bcm2835_sdhost: Add tracepoints
  hw/sd/bcm2835_sdhost: Don't raise spurious interrupts

 hw/sd/bcm2835_sdhost.c | 51 +++++++++++++++++++++++++++++++-------------------
 hw/sd/trace-events     |  6 ++++++
 2 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.16.2

