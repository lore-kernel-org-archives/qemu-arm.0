Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4553018wrv;
        Mon, 5 Aug 2019 17:05:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLps1EfW1SaAozLVV/t1+FUm31VlcAV5t7jUeTS3lSyQYW5c+QI8u5NfY2R8wn+wZZEgRL
X-Received: by 2002:a50:e619:: with SMTP id y25mr922004edm.247.1565049918801;
        Mon, 05 Aug 2019 17:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565049918; cv=none;
        d=google.com; s=arc-20160816;
        b=WcTJaZ0wuhhJhH+kDFF2PCtJIdSMlVEyKHYfdRQ4XO2/m9NSLyJZTRd+MCPkdRnWku
         JeHqRT43ub6SC+4jXZqV9YhrJRx690gu4hl88Y5Sf0PhKiEJ475qxXyOq0MiiIengWgl
         i4WYzo3ucpN69OOit5G984zO6LNa/NjQhPBJiVEiVnR/s/yi8XtlxIG4EU5gCvSRyUZR
         GgAXcN1BCSFC7Zb1OUNq6gK8gHaSnkQqUeOPVKZhBJCxraCai0AZLCl8Pe0WsVGPHhR3
         1PjyXW4xYq2D7WQFbvmTLV/rN6hxklAuT5sfrKKxkL+AVOjFiD3W1UpDnD4JhSJZQhlj
         18/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=R+6Mvp82E0p6yB/libxbibUQjbVuKcqpL4edZewcAUM=;
        b=NBb7PJ/VW9RkfsR2G+bWYoXOfrOp9/3/XMjYFywvewjVVZ3jYUraK0nK6b/64ToYpt
         Vs2AEhSG3AA6o8RtpDAYbxs2Xjv/1pGmdDijNzml3XmvFCzWBgzfyECB9ZXgNb7z93pL
         TnvX+yy0wBd80CI/Nn2cQ8MU+FkpOr4wGKmmIDj8MO1mOcteRADiorWkWUsWqZn8DaPK
         HQEbIZiZka9D6b5pvdSBKYr4LRzoktoQdDAFc8/W8AP8L4/i2Tpm0UxHYrlBRF7Pk9ke
         /1LRkyN/KVLMxEBnUpCcEXXcN/j+AZCV8KWBC4PYVWbRoBFaMwPiIzMWCZ08JvReN2Re
         85Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TC0/4oct";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si23604303edc.258.2019.08.05.17.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 17:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TC0/4oct";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1humyb-0003va-UF
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 20:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33611)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1humyX-0003vP-1A
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1humyV-0008Dc-Pz
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:12 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1humyV-0008Cc-Ib
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:11 -0400
Received: by mail-pf1-x441.google.com with SMTP id 19so40446040pfa.4
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 17:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+6Mvp82E0p6yB/libxbibUQjbVuKcqpL4edZewcAUM=;
 b=TC0/4octsAFEwyWOWZmMJbyVxDCiiIZz70lFfhc1WCV07Ovs0pP11cEe3JrS1zXb6j
 vPIcOREW7ql4OIafmbgxzRU0q2BdMkBlRTbSAXUY19yIwDVpD8RpJet4hg+ZQWeRxN51
 ZQ6fKszWHIlzqE20SZknMNC5EMJoAtSIszRvJ+j17VxPhAYsP6iR3fI7r4dht+xNt8fi
 Ibsbk4APXOPfYMHY9QEN6HeNzK29a88S3HQ5aAptO918BiG+d8F/go1z5UgkSe7x+UgL
 JbkdmofWVQRG7SDrFsRsapeSaZ0tWnzaYmX00IU0N7XgMrCGsWrHvdOirUiEhQYmJKNP
 Iqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+6Mvp82E0p6yB/libxbibUQjbVuKcqpL4edZewcAUM=;
 b=D22SuDf44J1MdDlhetowlobxVl4lE30N9OM4+t/FDespWeGVQwml7G0+zSoY/FKLXE
 wVpDd/BaVv/kc7P7X/H+nhVpSTyKA06fZpufSCuhiUgEFYfk4K8qZaVwXGHW+VRlf8QT
 kTcThpTcon72w/UpMWUIsk9orMkccoBl6BzqucZr6TZl+5P8WHGeMxXb51X9Vddz0b16
 BNvcYFi0qlo224H/UDcI8QRgMhA5G16j5wF/Ja1y64VTodwCWyH3kox8VesuXtodAgtd
 VurkRuKb9Kjr2nzuw+/UfPhNLqsBoTzPoLLxuKgu9Oc0GhU8kHv8Ml0e3GZkeKjVxsGk
 7rcg==
X-Gm-Message-State: APjAAAVmG1jOb391PE1mSaAo0GBcNSwPlQgHNA6kB94FPcDG233VQh3T
 WixzGdNDa5Jfd4WDQE4YHhSVUg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr289075pjb.138.1565049909624; 
 Mon, 05 Aug 2019 17:05:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm92149782pfo.138.2019.08.05.17.05.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 17:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:05:03 -0700
Message-Id: <20190806000506.10833-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 0/3] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXr+siYtopqp

Version 3 was back in February:
https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg06002.html

Changes since v3:
  * Rebase.
  * Do not cache XSCALE_CPAR now that it overlaps VECSTRIDE.
  * Leave the new v7m bits as uncached.  I haven't figured
    out all of the ways fpccr is modified.

Changes since v2:
  * Do not cache VECLEN, VECSTRIDE, VFPEN.
    These variables come from VFP_FPSCR and VFP_FPEXC, not from
    system control registers.
  * Move HANDLER and STACKCHECK to rebuild_hflags_a32,
    instead of building them in rebuild_hflags_common.

Changes since v1:
  * Apparently I had started a last-minute API change, and failed to
    covert all of the users, and also failed to re-test afterward.
  * Retain assertions for --enable-debug-tcg.


r~


Richard Henderson (3):
  target/arm: Split out recompute_hflags et al
  target/arm: Rebuild hflags at EL changes and MSR writes
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h           |  35 ++--
 target/arm/helper.h        |   3 +
 target/arm/internals.h     |   3 +
 linux-user/syscall.c       |   1 +
 target/arm/cpu.c           |   1 +
 target/arm/helper-a64.c    |   3 +
 target/arm/helper.c        | 334 ++++++++++++++++++++++---------------
 target/arm/machine.c       |   1 +
 target/arm/op_helper.c     |   1 +
 target/arm/translate-a64.c |   6 +-
 target/arm/translate.c     |  14 +-
 11 files changed, 254 insertions(+), 148 deletions(-)

-- 
2.17.1

