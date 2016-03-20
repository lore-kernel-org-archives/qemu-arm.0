Received: by 10.25.208.211 with SMTP id h202csp918697lfg;
        Sun, 20 Mar 2016 11:31:45 -0700 (PDT)
X-Received: by 10.66.175.110 with SMTP id bz14mr39640334pac.41.1458498705545;
        Sun, 20 Mar 2016 11:31:45 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 12si14427596pfk.55.2016.03.20.11.31.45;
        Sun, 20 Mar 2016 11:31:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751485AbcCTSbo (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Sun, 20 Mar 2016 14:31:44 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34735 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbcCTSbm (ORCPT <rfc822;kvm@vger.kernel.org>);
	Sun, 20 Mar 2016 14:31:42 -0400
Received: by mail-pf0-f193.google.com with SMTP id n5so26282751pfn.1
        for <kvm@vger.kernel.org>; Sun, 20 Mar 2016 11:31:41 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vVXTNkQ59/VCc9/CxSo4R4sc5jKQDlu+ttwjg1g1Wrg=;
        b=GVk+5+Y5j8tS9wfwlmhIdFlkj9OrspQXXCIxm/aDa764gYUrW46/mPJ8dyj7BnW7F2
         4J4vDTMw9GUQKHhMSPIOzC3AJvOwr9AzMdJk/bOfeyTq+4pukZtR75d2mBvCtuD6UM8N
         AguWy5eCdZnyI8Y8n33hmTMRviwAUcd6XF4X34ujI/2chi/p4yypAIoOjgCkDXxqpksF
         kd7xSisWXRBZqwrLRmRYuiN7ctWHH43mRB6NTwTfzMtIuyLARUWeJjwEXuGqHpx2OcKP
         0h5JHchPkXrvZpwgIPOriIC9l7018Vo7QapJn6eByNofFfA2wYcoERuzGHsM2z+HOEfE
         03+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vVXTNkQ59/VCc9/CxSo4R4sc5jKQDlu+ttwjg1g1Wrg=;
        b=QtNJ8xjI8/TewZHNNC73KYGuzWpHK/iyj7r7ZZ145y++8i2B1IMEJjnkH6zxhnozgo
         aIKaaBk2LY/LzI+j/IgkD0PUkvk6WxzhfuNe7XSUv2wgavI7kZBk3eOo9u6SvyeCNMB1
         flkQPmbRfv9xNAwBNw9DaJngFqEMC/bhpjGWhM2HosLUNiY7ErEaWft2Jth8aBr5c3zQ
         iwyfBFnqKQHuOp5Gqw69Qpg14OTIurQthgjedOffMplqMGt3tFe4y7py30Jm+qTTLa0o
         Rj6D3KGjMTZtrtv5PKY6D4o8q6G5TXmCE7c8SPuCKasyQuLGoUe+nXbBgaGJ6siuluKB
         suRg==
X-Gm-Message-State: AD7BkJJRIPLJ3M1P+p5qX2GMEFc46KXxHrijBTjse7pLJYTd4ATun62d8Xi9Oe0e4ix6jA==
X-Received: by 10.98.10.25 with SMTP id s25mr39125359pfi.158.1458498701472;
        Sun, 20 Mar 2016 11:31:41 -0700 (PDT)
Received: from rutuja-HP-ProBook-4430s.pune.wibhu.com ([117.223.109.169])
        by smtp.gmail.com with ESMTPSA id cq4sm34957172pad.28.2016.03.20.11.31.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 20 Mar 2016 11:31:40 -0700 (PDT)
From:	rutu.shah.26@gmail.com
To:	qemu-devel@nongnu.org
Cc:	kraxel@redhat.com, samuel.thibault@ens-lyon.org,
	stefanha@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
	crosthwaite.peter@gmail.com, rth@twiddle.net, mst@redhat.com,
	imammedo@redhat.com, peter.maydell@linaro.org, balrogg@gmail.com,
	jsnow@redhat.com, alistair.francis@xilinx.com, agraf@suse.de,
	jasowang@redhat.com, blauwirbel@gmail.com,
	mark.cave-ayland@ilande.co.uk, cornelia.huck@de.ibm.com,
	borntraeger@de.ibm.com, armbru@redhat.com, lcapitulino@redhat.com,
	qemu-block@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND 
Date:	Mon, 21 Mar 2016 00:01:23 +0530
Message-Id: <1458498684-32509-1-git-send-email-rutu.shah.26@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <[PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND>
References: <[PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: MxKHuROoaMco

Example given by Paolo Bonzini,

timer_mod(fdctrl->result_timer, 
	  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 50));

NANOSECONDS_PER_SECOND makes it obvious that the timer will expire in 1/50th of a second.

---
 audio/audio.c             |  3 +--
 audio/noaudio.c           |  8 ++++----
 audio/spiceaudio.c        |  4 ++--
 audio/wavaudio.c          |  2 +-
 backends/baum.c           |  2 +-
 block/qed.c               |  2 +-
 cpus.c                    |  6 +++---
 hw/acpi/core.c            |  4 ++--
 hw/arm/omap1.c            | 17 +++++++++--------
 hw/arm/spitz.c            |  2 +-
 hw/arm/stellaris.c        |  2 +-
 hw/arm/strongarm.c        |  2 +-
 hw/audio/adlib.c          |  2 +-
 hw/audio/sb16.c           |  4 ++--
 hw/block/fdc.c            |  4 ++--
 hw/block/pflash_cfi02.c   |  8 ++++----
 hw/bt/hci-csr.c           |  4 ++--
 hw/char/cadence_uart.c    |  4 ++--
 hw/char/serial.c          | 10 ++++++----
 hw/display/vga.c          |  6 +++---
 hw/dma/rc4030.c           |  2 +-
 hw/ide/core.c             |  4 ++--
 hw/input/hid.c            |  2 +-
 hw/input/tsc2005.c        |  3 ++-
 hw/input/tsc210x.c        |  3 ++-
 hw/intc/i8259.c           |  2 +-
 hw/misc/arm_sysctl.c      |  3 ++-
 hw/misc/macio/cuda.c      | 16 ++++++++--------
 hw/misc/macio/macio.c     |  2 +-
 hw/net/dp8393x.c          |  2 +-
 hw/ppc/ppc.c              | 21 ++++++++++++---------
 hw/ppc/ppc405_uc.c        |  4 ++--
 hw/ppc/ppc_booke.c        |  2 +-
 hw/sd/sdhci-internal.h    |  2 +-
 hw/sparc64/sun4u.c        |  4 ++--
 hw/timer/i8254.c          |  4 ++--
 hw/timer/i8254_common.c   |  6 +++---
 hw/timer/mc146818rtc.c    | 14 ++++++++------
 hw/timer/omap_gptimer.c   |  2 +-
 hw/timer/omap_synctimer.c |  3 ++-
 hw/timer/pl031.c          | 10 +++++-----
 hw/timer/pxa2xx_timer.c   | 18 ++++++++++--------
 hw/usb/hcd-ehci.c         |  5 +++--
 hw/usb/hcd-musb.c         |  2 +-
 hw/usb/hcd-ohci.c         | 10 +++++-----
 hw/usb/hcd-uhci.c         |  6 +++---
 hw/usb/tusb6010.c         |  6 +++---
 hw/watchdog/wdt_diag288.c |  2 +-
 hw/watchdog/wdt_ib700.c   |  2 +-
 include/hw/acpi/acpi.h    |  2 +-
 include/qemu/timer.h      |  9 ++-------
 monitor.c                 |  4 ++--
 target-ppc/kvm.c          |  4 ++--
 53 files changed, 143 insertions(+), 134 deletions(-)
---
Thanks,
Rutuja Shah
