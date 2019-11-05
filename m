Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp811879wri;
        Tue, 5 Nov 2019 06:45:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7i4MQujlr+Jk0OzDyPB5WtSAALhRYKc+pCuz2sLywMAd+AaoFUfNAv+t9MeGYhXmLaAG8
X-Received: by 2002:a50:b558:: with SMTP id z24mr36322011edd.67.1572965132481;
        Tue, 05 Nov 2019 06:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572965132; cv=none;
        d=google.com; s=arc-20160816;
        b=QxlzPCYkH34w9BpY+M2fPplOJWE9fKqchHv5uPpr8eg7gryz5Lrxe456bAWX6P0sz2
         na3bLan/w+pWG+Hle0lm+OveUMA9nH4RgrYJA8GkyGMKIGotlJ9A0C9OYyq/Br61snGw
         6LzyVLjnASR38Zs/mSkZ+QDRa9BjuTyLm/Hw/mPt1x3Mxpu0U8Om1VngDnX4YKItWtW7
         e2Ea7sn0bGDyMJN0hD48rzBYDNbm3AnuLGVNbBX57R0ajDSPc3WC0PFih7c0s3wkguN/
         s52sMo/XD7ZN+Q9p5IyvREPHG9cwW9buuWvEDadsd/+q71ifYm9u4wc6S+TuFWENV62k
         Qucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=aysMg4nh4fJ7NXrUZYzsM++TRf3f0i5u9kUF8ty62+A=;
        b=c/xgxIb7Uk08yznsjDVhJ89gwghDAkk9tu5KOM17svvmJBOIvBRjA6KBihzORuxBt/
         pTViekI2s+/Ha6fVbcZo61p+iFfBdHH/yekpQgfLQo/KnfgEc9EGH1oqbL7wcz0b2AB1
         d0HNk7DvYKTL3GBbgDsmC1blIOJeNlL+VFwMxtAtNzsR2whaFZvnaoqn2Tj9X6Ha7Pso
         Yg5g2rynkIrXY0S0Kx3OVVFy07w4Apb5ios6AhbRP4TvuRp2SPF4nbMrYvZrKPADf4CZ
         QoegmgOSxIIBYf3ZSdHELLiBjWOGXZY81DdxP3IpOKX+6Xf1nII9rE+3pe5duaULqzrG
         APjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hh12si13050575ejb.343.2019.11.05.06.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 06:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS05L-00026U-IH
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 09:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03K-0008Ng-5y
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 09:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03J-0002iA-55
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 09:43:26 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34973)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03E-0002fS-LH; Tue, 05 Nov 2019 09:43:20 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7v18-1iWxrR1i5q-0053TC; Tue, 05 Nov 2019 15:42:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Trivial branch patches
Date: Tue,  5 Nov 2019 15:42:43 +0100
Message-Id: <20191105144247.10301-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ts98NfmfLnlsGeB7aeJ8lq36UwPs48GJqE0eLgOW0C9sAWmiD0o
 A+bEsOAg3Py4/VEjzLFyHEeW7gV4jDIo9Qxq+PKmuFAtCyaNV0Xu+iyYd2cmQRurTGwwZyD
 eAbdmiUQv/wMO1FDdYmuB7ZWXrh6SeWel3GrRu37pSYrriexBpdho5bC3O5k0ZEUpqCwCuM
 PHbrzpTPBN7148ETqrsPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HiWFcm3zl4c=:9Havqf+6M3eDHoN+3p5uq/
 S/DOD4piNU4EaSkrAYOo2HCCpmKaEdPxO69KJV9sSJvIl0qTxqse6tdHd2A/v9Egq2LDYzKZ+
 CMado3YPPoSGwAibKayV2kfqUbfwcCZW71G2M4cp2UNB2BbBdv6hDARJmUUJObXLQw6xb948J
 ifhlkmHnw70f+Yne2CuyoZjyotn60Jb1sttZiM24BtRiuR+HzRO4d+PqsR576oix8q/QxH5TB
 /2O1s/M1M5aCyhYgl+jYx/wW63Qgs6oXsA95KY+np4rAgIXDmB/FwTtUFvdGu3/qDm0n4Zms5
 L4WCcocizQ+Gbw/Xt4/xhjL/v0iJ1TUSe/DVGpOopUMKCH+BqCIPH70FGx01DB7R1ziDZCQxG
 MQqJBwWhUujr0d+jLvGSGOvQffG9uLdTzAIpknwYGjiB3HHBtRwCwGxJlkFeo5vXgsLvVoJYE
 BA7TIU8QDXaockqseH2kdE9h3zVOi02jjzadX1NbrJEOyfzdermQnt9jykdDbGWAMOCsXTg9N
 lLBPTpFAUDf9XYuKr7RtkVgvAwzQBPUt/86dWR/TKE5J0AtmK5YS9DQmxzq3ySO7pPdDIjNeJ
 SyTHkq4JPv157lZdN2+Z/7PiaHBmWdMs+MR2X0D5RkLPZDUX69xJTMoyvwHz2nbt8del5xw0x
 9O/U5EgBA5Jptz+hxkU8T2y+jWwdAiDk58VKgjA8kRQbXkI/wNhMs2r8jl0+1yUC1CtfG3XGk
 3C0oa/3Fi5zUUKHkOedbJMPy01xbbo0Mj2QB+0QO8ZB5G4puCEOdsmUtZbh/O4E/eE5OtZ4M3
 CJ4NNEtgjAoOREhJWhx8QClAVZnUgbzsQFEOykmIANRJKdEsTZYk4l9xJgT7P1uDEwOdGbuzk
 SssoIYkyNKfVWjPRnpUkIa7kSycgYAeae6eer+wk8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIHjLzc4WiTD

The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:

  Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to a37a36a11b584e083b1c578f1d60e6e0f7878d5f:

  global: Squash 'the the' (2019-11-05 15:06:09 +0100)

----------------------------------------------------------------
Trivial fixes (20191105)

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  global: Squash 'the the'

Greg Kurz (1):
  qom: Fix error message in object_class_property_add()

Philippe Mathieu-Daudé (2):
  hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP registers
  hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses

 disas/libvixl/vixl/invalset.h       |  2 +-
 docs/interop/pr-helper.rst          |  2 +-
 docs/specs/ppc-spapr-hotplug.txt    |  2 +-
 docs/specs/ppc-xive.rst             |  2 +-
 docs/specs/tpm.txt                  |  2 +-
 hw/misc/grlib_ahb_apb_pnp.c         | 12 ++++++++++++
 include/hw/xen/interface/io/blkif.h |  2 +-
 qom/object.c                        | 10 ++++------
 scripts/dump-guest-memory.py        |  2 +-
 9 files changed, 23 insertions(+), 13 deletions(-)

-- 
2.21.0

