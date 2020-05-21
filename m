Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1917163lfb;
        Thu, 21 May 2020 13:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0VcWPgBz96r6OaLkRv9X6EcDZZ3bYjv5WfULq+D5oko+Kk6HyEctecnE7KP98qd3YJTEC
X-Received: by 2002:a37:7904:: with SMTP id u4mr11747419qkc.297.1590093455675;
        Thu, 21 May 2020 13:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590093455; cv=none;
        d=google.com; s=arc-20160816;
        b=QaRDanEzPb/XzHlDH3JWDSDADff/RFhC/VFnvHsufL7eWMIwSowIGf1z028OwCoEG+
         AZ/gstPRB5tHMClcMJmwCIwk0Xu34J3k7nwRu+ZChec+CeKN51eYLguQwF4hu/MxveSb
         if12ApE01O/NDnm6ohifYoVdKSvvFvWm5gFnLvOewx1Z00ooZzbGMWlZD6aw/Qj8CkOq
         VPvSCYxjB1qEaFpyyFtQhVKv4qrlMiGcoHb4oYPhtJFZ2UYCDJEkTZevWVcClfxfL73c
         RsJfma5tcq7LSJef7brGJ0ZomBqYroKhwHVTOYeDa8ggcPBUQ6d4Ygy6/26P0OfzJFou
         MLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=tGxrjpstm4I7PAN/kuQkbl2KdvRqWXweBxIWEzXPUS0=;
        b=so5plEx/koeD6bOm+fQkrt5W3HivzAqo1vLIpfRuuahBqby7FOBXulvxdMHRDBsl9E
         O95YjVVuYQCObcg1LRY3kRQjdb1QT4G6wFy6+/B/tBcakneu8qR3aYvkKaTC6BnO5CDh
         pYTE7DhM+RpSxi5urBNuuEzf34uRGVE1VerHvCCXs7pdhnII+ZVg8c5PLrnEzi9svRkO
         5HB8bGgQ+7nPOQ722612g327zzcgLw7B6pF4MVxJiLBA3IIqilw6EvI3NQ9zIQM7eWzR
         QPpbeHYpyQIod8VPRUeEvp9WOvY11iyneYFAWKjvZF/C1ZSCBwIWzCSpbICa8+sTUHyA
         +HCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Rb9xo580;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q39si1824542qtc.192.2020.05.21.13.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 13:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Rb9xo580;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbrwd-0001CI-0v
	for alex.bennee@linaro.org; Thu, 21 May 2020 16:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31NTGXgsKCJU6H97CC3BD3C5DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--hskinnemoen.bounces.google.com>)
 id 1jbqlT-0005TA-PT
 for qemu-arm@nongnu.org; Thu, 21 May 2020 15:21:59 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31NTGXgsKCJU6H97CC3BD3C5DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--hskinnemoen.bounces.google.com>)
 id 1jbqlS-0001iz-Dn
 for qemu-arm@nongnu.org; Thu, 21 May 2020 15:21:59 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id 137so6521971ybf.7
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tGxrjpstm4I7PAN/kuQkbl2KdvRqWXweBxIWEzXPUS0=;
 b=Rb9xo580Cp4PkbnfGEYMeoLvbnxzM/jWkefINiY4AQhk+CTvp0DwP79x9bjZuKkztD
 iL2s1AokqH+yB7byGWfGE/FHIFItjUFyTtCQ4AX9+BGBL33flQNdxUoTKR2TyXEMA3CJ
 6ZXXT+U5gey0Xg0Chw2NiQPfzBSDFGc6vLcXDC8xVpfiCnhhYHBED0DTakRNuPMHKWo0
 SVWpGfceoA9LYq9wZCDrnPIZDEbKgd4t2tZC1YJ3/fR7puc5hncR1ml1+YzrS0/PC3OP
 6Z6UuXvaK+Bsz5xZ9RNjEQGqY4mkrSwzO7f2qWuevtb+SFVx5PcvQHDSl7coUP/b/ID1
 weXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tGxrjpstm4I7PAN/kuQkbl2KdvRqWXweBxIWEzXPUS0=;
 b=tPQokCRzs9vSmMJkWLRsAW8lUaSddBMx4VEvoYBe5CFvoRbPiBP+QYsYwmPYb+aAm7
 KZoGsdhL2cuu9u6487ziu7hH0r2gJBD5BM6gXx0QEZm/bxpP5wLzl2X6ow+F/NgYE/ZU
 88TZJ9hDK3ZXPVqsD8N2NtYsfWFCoxMzGiXvrYWX/ZDkFbN+hNjiCone0ivVnMuumkoY
 OodcrCxX5hwKzZPdqU158WkxDJbG1pL1V+k1LFWAy4ywL+ZpiDJgYisJ5nKauOiixm+I
 YjAe8BLWD7heJ+NQzbIF4m6JkG7Nooy/P4476yCZMLvD4tBiAHQzJ+RrZErSDDrpGBlU
 GSZA==
X-Gm-Message-State: AOAM532CP6d6G98gmMkP6DvhkrOIMULqm69M7btqe11bNrdewTzot3A6
 SFrWV9LQTUW+BGwXwwarUMAbuybd/krX427OYA==
X-Received: by 2002:a25:8808:: with SMTP id c8mr18042665ybl.159.1590088916644; 
 Thu, 21 May 2020 12:21:56 -0700 (PDT)
Date: Thu, 21 May 2020 12:21:27 -0700
Message-Id: <20200521192133.127559-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH 0/6] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=31NTGXgsKCJU6H97CC3BD3C5DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 May 2020 16:37:25 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AR7dhcx9ALmi

This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
a minimal Linux kernel. This includes device models for:

  - Global Configuration Registers
  - Clock Control
  - Timers

These modules, along with the existing Cortex A9 CPU cores and built-in
peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in turn form
the foundation for the quanta-gsj and npcm750-evb machines, respectively. The
two SoCs are very similar; the only difference is that NPCM730 is missing some
peripherals that NPCM750 has, and which are not considered essential for
datacenter use (e.g. graphics controllers). For more information, see

https://www.nuvoton.com/products/cloud-computing/ibmc/

Both quanta-gsj and npcm750-evb correspond to real boards supported by OpenBMC.
While this initial series uses a stripped-down kernel for testing, future
series will be tested using OpenBMC images built from public sources. I'm
currently putting the finishing touches on flash controller support, which is
necessary to boot a full OpenBMC image, and will be enabled by the next series.

The patches in this series were developed by Google and reviewed by Nuvoton. We
will be maintaining the machine and peripheral support together.

The data sheet for these SoCs is not generally available. Please let me know if
more comments are needed to understand the device behavior.

Thanks for reviewing,

Havard

Havard Skinnemoen (6):
  npcm7xx: Add config symbol
  hw/misc: Add NPCM7xx System Global Control Registers device model
  hw/misc: Add NPCM7xx Clock Controller device model
  hw/timer: Add NPCM7xx Timer device model
  hw/arm: Add NPCM730 and NPCM750 SoC models
  hw/arm: Add two NPCM7xx-based machines

 MAINTAINERS                      |  12 +
 default-configs/arm-softmmu.mak  |   1 +
 hw/arm/Kconfig                   |   8 +
 hw/arm/Makefile.objs             |   1 +
 hw/arm/npcm7xx.c                 | 328 +++++++++++++++++++++++
 hw/arm/npcm7xx_boards.c          | 108 ++++++++
 hw/misc/Makefile.objs            |   2 +
 hw/misc/npcm7xx_clk.c            | 210 +++++++++++++++
 hw/misc/npcm7xx_gcr.c            | 160 +++++++++++
 hw/misc/trace-events             |   8 +
 hw/timer/Makefile.objs           |   1 +
 hw/timer/npcm7xx_timer.c         | 437 +++++++++++++++++++++++++++++++
 hw/timer/trace-events            |   5 +
 include/hw/arm/npcm7xx.h         |  98 +++++++
 include/hw/misc/npcm7xx_clk.h    |  65 +++++
 include/hw/misc/npcm7xx_gcr.h    |  74 ++++++
 include/hw/timer/npcm7xx_timer.h |  95 +++++++
 17 files changed, 1613 insertions(+)
 create mode 100644 hw/arm/npcm7xx.c
 create mode 100644 hw/arm/npcm7xx_boards.c
 create mode 100644 hw/misc/npcm7xx_clk.c
 create mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 hw/timer/npcm7xx_timer.c
 create mode 100644 include/hw/arm/npcm7xx.h
 create mode 100644 include/hw/misc/npcm7xx_clk.h
 create mode 100644 include/hw/misc/npcm7xx_gcr.h
 create mode 100644 include/hw/timer/npcm7xx_timer.h

-- 
2.27.0.rc0.183.gde8f92d652-goog

