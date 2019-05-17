Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2109794wrg;
        Fri, 17 May 2019 10:41:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhX0vgnqc//7k1m5Z7KuDh910cHVy74fxl9LTdU/cI+KwHP4ejmpqOpeL21i3CA1JjIR3H
X-Received: by 2002:a50:8ed8:: with SMTP id x24mr59337450edx.183.1558114875466;
        Fri, 17 May 2019 10:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558114875; cv=none;
        d=google.com; s=arc-20160816;
        b=mO6La+9gOB+r8qQhfBK5wZkTW4JVFUu8oVJXKxcrCIMF+0oirdzkpPY+LigjmV2YPT
         3xKbXq2Nu+X3hqHBs+31rD02s3iOGKbx9jSc6/RKyzypUz4MurARhOKRd+0kbzffcrdr
         ItD57ck5ewIBCiiMER+vaogmUXr+B6vsuf71ZpkMhWKQDVJ5GutU2Ud7BZaqDXzqDGCF
         3Cm9G0zGooPqKnYsnPjt7IkZEob/a+ocOxDXc+FexeYYoIqixrfox6fXHUotpEj7SrcX
         wW2xIYvy2z0LsJIWcxxuOtFjB0+E9LcF04GiJg/xd7aOQHGHez9Y1NCOM7xVSPb7dvNb
         6WIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=YOpfEDFzZy4Bh83FC8/CXHXQeQcGsenvuDmMohFWPoI=;
        b=zjyKzJxXZWwuihEL/RMwcOqfQ+YK5HhEkDx03yIrqCWX7c/TcRd0BXTlwXWdLThUnR
         GclrBBaCyZ9DQu3ZTL421NLfeFScx8IyhaC7hwm47l9EuiOZJgWwgqgUZshuRDmZOWXf
         oQXs0mDJ80vkbnsKNKtUBnaBLnvoL8KN9UyXS+PJIVLAgWm+1Kd+nlHDdgkws+vJOq7S
         XNuMyrKvGC5ifL2ALArKRDrin/pOgw78LSS61kztL/w1lZNfUipDDgWkDPfA2mfvrfzM
         7ewMkXo34ArDrEo22I28uxoddP5ZPG7UxJrCpalhVG9r03UHrJKY9MiujlomDCNkmab9
         74lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCAtE7GF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si8131070edh.128.2019.05.17.10.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 10:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCAtE7GF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRgr4-0007tk-Ed
	for alex.bennee@linaro.org; Fri, 17 May 2019 13:41:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqo-0007t9-Tt
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqm-000364-HY
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:40:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRgqg-0002s6-H1
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:40:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id d9so8045228wrx.0
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOpfEDFzZy4Bh83FC8/CXHXQeQcGsenvuDmMohFWPoI=;
	b=DCAtE7GFpnydgbppUYAk6frtkYM8Hl5MB/EWbn3aiA7giY6H9T03J1KsQxR0+cBagf
	NK8daIaolG4lG2pVVwlC2ez162rwQ5Fsa29F9Cs9Pvp8Mx+omNv5o7+F0QS+Y/8opErV
	+VTBCnFS/XmntN5oy3/EH824AReQMt8kdmSKl2qfwxyrU4GnOksbCbhrfYs3mk6WcGFX
	J2lHHqj1H8M/dr/o5aNH2t3LcucKypbqlzwMphbpVbiE/I5/k48slWgbOa7XzdoThOOE
	lSVD60+baZjRIlK9Zpgr9LNwEt0JL7mSqGnRDJk4IYmgFd2bNM/rh/eKrrCZR9KYcUNt
	GzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOpfEDFzZy4Bh83FC8/CXHXQeQcGsenvuDmMohFWPoI=;
	b=f8L4Z56kX65jcHRJU+ilmqa3JUBGd+yaVGvQTR8xExXqy41YFUh3Pod7qF7JH5PkfX
	L+EFa3pOBZnZDLM9RqslZtBcOnI6dn/87TTFdk981+rKzNdtrVC30MFgF4tNwKlvzBKo
	RiQGCNkj/NEpOD/vPfGXhR0fCu8F9H9IrdDJcTcNq29Ia1Eod5Nhc1NRax6bIjTXPbW2
	kXSSK1//VMx5jixIyFu6TfK4FjuCVDGLrfATnq7jy83SonHuKH1lfledy7ciydhEKxqG
	/latbJ+3uw/MTy2d0D2VqjymbeYegCw3r02Tz4bj8sv79PX+bZeYox9+B2w+5gHitkgJ
	nxSw==
X-Gm-Message-State: APjAAAXTNkizgmbbdY6egN0J0A1pkR6xmHPdG6x5NKvLrSYRv7nTeYT7
	UjuvIQM+iqoJ4ByA7TLuF2nwec09jXs=
X-Received: by 2002:adf:ba10:: with SMTP id o16mr26325374wrg.89.1558114849009; 
	Fri, 17 May 2019 10:40:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y18sm5418641wmd.29.2019.05.17.10.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 10:40:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:40:42 +0100
Message-Id: <20190517174046.11146-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-arm] [PATCH 0/4] Disable FPU/DSP for CPU0 on musca-a and
 mps2-an521
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5btTxmuj0IFX

The SSE-200 hardware has configurable integration settings which
determine whether its two CPUs have the FPU and DSP:
 * CPU0_FPU (default 0)
 * CPU0_DSP (default 0)
 * CPU1_FPU (default 1)
 * CPU1_DSP (default 1)

Similarly, the IoTKit has settings for its single CPU:
 * CPU0_FPU (default 1)
 * CPU0_DSP (default 1)

Of our four boards that use either the IoTKit or the SSE-200:
 * mps2-an505, mps2-an521 and musca-a use the default settings
 * musca-b1 enables FPU and DSP on both CPUs

Currently QEMU models all these boards using CPUs with
both FPU and DSP enabled. This means that we are incorrect
for mps2-an521 and musca-a, which should not have FPU or DSP
on CPU0.

This patchset fixes this (fairly minor) inaccuracy by
implementing properties on the CPU to disable the relevant
CPU features and then wiring them up through the armv7m
object and the ARMSSE SoC container object, so that our
IotKit and SSE200 models behave by default the same way as
the hardware default does, and our Musca-B1 board model
forces the FPU/DSP to be present on CPU, as the hardware does.

The 'neon' property is not strictly required for the M-profile
issues described above, but I implemented it on the CPU
object because disable-neon and disable-vfp interact
for A-profile CPUs.

thanks
-- PMM

Peter Maydell (4):
  target/arm: Allow VFP and Neon to be disabled via a CPU property
  target/arm: Allow M-profile CPUs to disable the DSP extension via CPU
    property
  hw/arm/armv7m: Forward "vfp" and "dsp" properties to CPU
  hw/arm: Correctly disable FPU/DSP for some ARMSSE-based boards

 include/hw/arm/armsse.h |   7 ++
 include/hw/arm/armv7m.h |   4 +
 target/arm/cpu.h        |   6 ++
 hw/arm/armsse.c         |  58 ++++++++++---
 hw/arm/armv7m.c         |  18 ++++
 hw/arm/musca.c          |   8 ++
 target/arm/cpu.c        | 179 ++++++++++++++++++++++++++++++++++++++--
 7 files changed, 262 insertions(+), 18 deletions(-)

-- 
2.20.1
