Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2191582lfm;
        Sun, 28 Jun 2020 07:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWfwxld1RltcNzGgC5FEdGZaAe0QMVzOHEEN0fnccpABCTBnrufAcGJSPszQGJ4Y7QEag0
X-Received: by 2002:a25:e797:: with SMTP id e145mr18194091ybh.107.1593354285895;
        Sun, 28 Jun 2020 07:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354285; cv=none;
        d=google.com; s=arc-20160816;
        b=xI6wVpoHowJqBQot7oQmExQdXGFFX4RF6L54JTxXNV8dsZ3+CizCtUFLm04I7Ws1EY
         01q56V1uYZfNoWw+xw0BA2lIBPC0xA+ySExHd14sjBpJDokT1QQs9oZnhkABQKBvtkSF
         Lr2a1sfmIjjcsvmDSqnMV/PctHvBe1cDZbOCS3yExNCaLoO9JmbLFF+ziBfAIpqrMTDf
         8xgOPuTUX+NFPeA4hAuWQGt+FmOiOTBdTjSukx6AXxISagtSBRAWzZOvTHV/gFSuHzlI
         A9oVnO8VW8Q2gXb36EnYjqR5qJnlcVmTSfC9/wIdpQZN85Lf9qvdm5fYhRbFRtkFxy6K
         1SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yXrx6SW8zqKj/mn32mzyhphYQKvlH+oGrD+d4c8vj0g=;
        b=ishrq7TsEyjzWfyMEDrwd/9Xy+X0PYdGq4op6B+LP058SDvEaFYBI+hMkPXrSqUhbL
         SMWNi7k+WKwnEa/1P0VcbVOSY9t+/aQPqsBp1F3epBulqlZtPmVEvCqT0RDGZZY0gIwz
         HrNgbPlix3pQJaI9B4jEpi+UXs1QqjPk9SmZRYx5N4lTHmaR7b1GjtChWZOBILCOxFLr
         9gA6naSXZWuqxHoYCptJ3EIsN5EoebUuGSr/dKP1HSrQLzbPyZjdatGv5neY3tWb7BC0
         q02nYQLddouG+oyu7cSdnQbmjPDnPjBui4SyQo/iKRENpJDcjAP8WgGmleZraVm1mfU3
         gJ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzoFlmRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si31292314ybu.365.2020.06.28.07.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzoFlmRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYEf-0005tR-6H
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEW-0005t1-6H
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEU-0004dj-5m
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h5so14036296wrc.7
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXrx6SW8zqKj/mn32mzyhphYQKvlH+oGrD+d4c8vj0g=;
 b=ZzoFlmRpbFUQJRDfBTohtiDu6p0UdmU29K1sfmee3gZMwdsjoCa9ehwVWje+5InaB8
 HBZx5Of1KiLtLB+bGUV81w08aj0rz3hoy+L5QyRBHd/KvfgDgvqGuroaCtd98KBcsMHy
 3B0eKA9j2C3piPgCt9gw8vf8UbAyYTA2IVhgcchIKHTP7xzzgOPFBYFF1EvvfmEeiiOj
 vJMuNlFdH5hAwBWwHjJPEViKR/tGOivbzV1m9uWCbKFSQgHE6je9YIedeMNzWHUkPxkf
 FdCXx3zlouOfme1sTX7fLlsLAxiX3Nk2FxkW1SmjUFKVDzdAd4P15oTmdfRyN7D04eBl
 MZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXrx6SW8zqKj/mn32mzyhphYQKvlH+oGrD+d4c8vj0g=;
 b=ay0wQHo/KhBZP7W4YPbjLy89yb4fB8dAGwN2Mh0W2B91TrLxdAKkJKNoLfmTFb4vMe
 JaLX+I1UlWndiSNFKiK/pGYlEzZFvqNmtMa3+dYi4N+msM+uv1c9bzMCsnYlqKjxKSYA
 fhjiLPkHiZM0ZmWtqHiceRKz6tCkN2rZiqcGZTM/cbv7A//5ws4f90XmJook+0KcZ06z
 jjnrG+qbYADZ0PfL2FTyrZNxOFgBpsIb9bXHp6iY9m5yhwpsLPr3yOtGgFQslnLqmOr+
 KM1zISGdQCaO9QWYwgiRf0e42OjrjeqoAmcvnFfO3HMm722fm3dVXCI+KsftYRFDbFeM
 XHxw==
X-Gm-Message-State: AOAM532qFyYrzZbj09nRANN1PYJFsvNHO91HLX5unM722+uWztG3oB1H
 Wy2n3Ft/hDtvQVFOgf+a+gsXgyrbYj54Sg==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr13888580wrn.166.1593354272269; 
 Sun, 28 Jun 2020 07:24:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/17] spitz: fix hacks, fix CID 1421913, various cleanups
Date: Sun, 28 Jun 2020 15:24:12 +0100
Message-Id: <20200628142429.17111-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5gKvLkHvYSEd

This series of patches makes various cleanups to the spitz board
family code; the main driver here was fixing the minor Coverity
nit CID 1421913, which is a complaint that the call to
qemu_allocate_irqs() creates memory that is leaked.

We fix this by replacing the free-standing irq array and
callback function with a proper QOM device TYPE_SPITZ_MISC_GPIO,
which can have its own GPIO inputs and outputs which we can wire
up as appropriate. This also allows us to remove the ugly
file-scope variables that pointed to some of the devices on the
board so that the old callback function could prod them.

For this to work we need to add QOM properties and input GPIOs
to the max111x ADC devices so that we can control them that
way rather than by direct calls to max111x_set_input().
While we're in that bit of old code we take the opportunity to
get rid of its call to vmstate_register() and to give it a reset
method and a header file so we can document it a bit better.

The last few patches are unrelated cleanup that I noticed in
passing: we reduce the use of the zaurus_printf() macro in favour
of LOG_GUEST_ERROR logging for bad register accesess, and we
get rid of the old FROM_SSI_SLAVE which can be replaced with
QOM cast macros.

Patch 1 removes the hardcoded tabs in spitz.c, because they've
escaped our usual "fix as we touch a file" policy long enough,
and it's easier to do a wholesale detabify of the file before
starting.

As you review this series you might notice some other things in the
code that could also be cleaned up; so did I, but I felt that
17 patches was quite enough to be going on with :-)

thanks
-- PMM

Peter Maydell (17):
  hw/arm/spitz: Detabify
  hw/arm/spitz: Create SpitzMachineClass abstract base class
  hw/arm/spitz: Keep pointers to MPU and SSI devices in
    SpitzMachineState
  hw/arm/spitz: Keep pointers to scp0, scp1 in SpitzMachineState
  hw/arm/spitz: Implement inbound GPIO lines for bit5 and power signals
  hw/misc/max111x: provide QOM properties for setting initial values
  hw/misc/max111x: Don't use vmstate_register()
  ssi: Add ssi_realize_and_unref()
  hw/arm/spitz: Use max111x properties to set initial values
  hw/misc/max111x: Use GPIO lines rather than max111x_set_input()
  hw/misc/max111x: Create header file for documentation, TYPE_ macros
  hw/arm/spitz: Encapsulate misc GPIO handling in a device
  hw/gpio/zaurus.c: Use LOG_GUEST_ERROR for bad guest register accesses
  hw/arm/spitz: Use LOG_GUEST_ERROR for bad guest register accesses
  hw/arm/pxa2xx_pic: Use LOG_GUEST_ERROR for bad guest register accesses
  hw/arm/spitz: Provide usual QOM macros for corgi-ssp and spitz-lcdtg
  Replace uses of FROM_SSI_SLAVE() macro with QOM casts

 include/hw/arm/pxa.h      |   1 -
 include/hw/arm/sharpsl.h  |   3 -
 include/hw/misc/max111x.h |  57 +++++
 include/hw/ssi/ssi.h      |  31 ++-
 hw/arm/pxa2xx_pic.c       |   9 +-
 hw/arm/spitz.c            | 507 ++++++++++++++++++++++----------------
 hw/arm/z2.c               |  11 +-
 hw/display/ads7846.c      |   9 +-
 hw/display/ssd0323.c      |  10 +-
 hw/gpio/zaurus.c          |  12 +-
 hw/misc/max111x.c         |  87 ++++---
 hw/sd/ssi-sd.c            |   4 +-
 hw/ssi/ssi.c              |   7 +-
 MAINTAINERS               |   1 +
 14 files changed, 474 insertions(+), 275 deletions(-)
 create mode 100644 include/hw/misc/max111x.h

-- 
2.20.1

