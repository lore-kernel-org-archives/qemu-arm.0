Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp616013lfb;
        Thu, 9 Sep 2021 16:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIzItZkNxC2rwLz6wsz8H/BMuMIO4Th9y3N4j0Iit1ePqdEQn6g9sER5jX5/HKNZBa5yN1
X-Received: by 2002:a67:6d84:: with SMTP id i126mr4092513vsc.2.1631228988511;
        Thu, 09 Sep 2021 16:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631228988; cv=none;
        d=google.com; s=arc-20160816;
        b=Vgs+RYTWOmyvUmDfV25GhM+9HVVK8MqtDXvJ7ezRMJ1NZw2QemcKI0q6HsLbLBsv39
         ykZRQHSZ0MHXuexzfMbaoZIbiRwr4O+o8pvnOBSszoKp1URtXzKMYI+WiSvONyMlGazi
         zQoKLnqx0H7/9EwkhN/UR8x9ORQbvZmzw1vFRhdaZ1tPsExasvahPPsO6+OTBZrkDpk1
         0grS0ori3/wNTJtXXJgQVN4YbEQOOsfrONBucQpyumHS09KyXaDhFwfQ5M0KB8LYOkLG
         LIFoP3ErmCjsgF6Iy/DYyStvAQib2It1waL4i45sTCfvVBEvw9sts3iY63ZPkI3sJ2xc
         yheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=rVJ1VxbyIUxfIoxlACN+EEQraZUzQ4oIXvT42LkdnR0=;
        b=P9dwEFWf43ud98YesqPvi01Ln14/QV1h16lTR7XfCTOkpzyOw9k/SDQC9hJnxD0NxS
         uFtxLJNvgLaK6AAL67txNRsHKzZYo6wMQAOINivspCWABVlekan1ciLGyYOAFFwSQwMt
         /KDKZQcLQrIZGFTCfqAYDgYHiQDWre4XcFkPJcilDAjIyA4xtW2wTS3I6ZoNCa6ejG+w
         b5kSrZUnaQNJokwC/lYkxBbChtPMZWmBBMG0gZEIxE41saDtpWFPMASOICIB6tIlbWJ3
         SV01mBkSTN4DTp7Y6h+CeefYwxtDwZue7IVycFOu8u64daUZHVbdkeCuj0bxr1XZzV3K
         0NyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="taz/ymyd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si1294068uae.248.2021.09.09.16.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 16:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="taz/ymyd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOTAx-0007SP-Km
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 19:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nZM6YQgKCL40ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8U-0004Uk-36
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:14 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nZM6YQgKCL40ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8S-0003VG-Ah
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:13 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 u7-20020a632347000000b0026722cd9defso19874pgm.7
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 16:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rVJ1VxbyIUxfIoxlACN+EEQraZUzQ4oIXvT42LkdnR0=;
 b=taz/ymydJkOjMiVN8+iLW8G0cBbNFQ/dQ8z1tBoyufK/D8YVPFwkUGF/P+dICrV6Ft
 QtrORoewOj/o2+lVhvYVyUreffSQqebdrhzEM7T9bpJhIC7UvK1jY/Ovh2EEymdmeAHp
 yTI+yiodSnnxkhsDeyZeQpiAHWTV8HxWWpljIm1+IaBw2auaHW6i9C2sFg1RTt4VR/VO
 TDmpQvl3cOOvtGGPExjTyyaMPBHgUGZs3yG9gnvAWqmU8BZO2tu9P33jCP5cOL5VJOnJ
 tQcRzO7eGjzCogxur1/TgUM+0cqz1+KsKunNJy0nfJ/kdyC7OWl0dgAbBpaBRuJ4XkBg
 U2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rVJ1VxbyIUxfIoxlACN+EEQraZUzQ4oIXvT42LkdnR0=;
 b=tNTh9JjgBhoNvaQa8BIf6J2dL6/WfGhGHvj9yfGpxov1PNXR/4NKEZufDym+Sh6CW9
 o5v81Wy8IrInfD2PlrFu7483CMlIPExw7SlN7qWKORJJbMi8ABm5HbXUgQ2tll8d03ad
 kyPp9Rw2A2Vcv47NmHSOxGGogxV9wHjJYF5M0ukkpq97giFJfzBK6dRsVqyffNxLBvBX
 Ia99hL64hCfO8MyDgnjmeuv1wcZstw964K2MSx2o/Usby4rtIqEnPTcMXnzKEttB4qBD
 pXKEI28LUQjo8m6A3yOuqvmQcyXzmWoaRq9tpZ3GJkMWbS4SvgDH4fN7XkQbJ6EWJzR6
 ItPg==
X-Gm-Message-State: AOAM5325+zCJnr+Qszm0xq6k4iGaqk3gH7FMd0b6FEmxzYRIp2L4IrzX
 yH3oD/TfEIBf0uF+/AEahbofF6fmhjuz4A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:69a4:: with SMTP id
 s33mr6022689pjj.217.1631228829502; Thu, 09 Sep 2021 16:07:09 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:12 -0700
Message-Id: <20210909230620.511815-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 0/8] Handing IPMI for emulating BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3nZM6YQgKCL40ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9XN/pz847Zl

Baseboard Management Controllers (BMCs) are special
processors that monitors state of a computer, often
used in data center servers. They often communicate
via IPMI. As a result, it is important to emulate
the IPMI interface so that they can connect to host
machines.

This patch set aims to refactor the existing hw/ipmi
and make it handles both Core side and BMC side
emulations. We also added the implementation of the
KCS module for NPCM7XX BMC boards that work as a backend.
We have tested this patch on various NPCM7xx based
systems and they can communicate with a host that runs
`ipmi-bmc-extern`.

The structure is as follows:
Patch 1-3 contains some documentation written by
Havard Skinnomoen that how the emulation of existing
host-side IPMI and the new BMC-side IPMI works.
Patch 4-6 refactors the current IPMI code so that
they work for both host-side and BMC-side.
Patch 7 adds a new ipmi-host-extern which represents
BMC-side emulation that is similar to the current
ipmi-bmc-extern.
Patch 8 implements the KCS device in NPCM7XX boards. It
works as a backend to the ipmi-host-extern device. Since
the direction is different we can't directly use ipmi-kcs.c
for BMC emulation.

Hao Wu (5):
  hw/ipmi: Refactor IPMI interface
  hw/ipmi: Take out common from ipmi_bmc_extern.c
  hw/ipmi: Move handle_command to IPMICoreClass
  hw/ipmi: Add an IPMI external host device
  hw/ipmi: Add a KCS Module for NPCM7XX

Havard Skinnemoen (3):
  docs: enable sphinx blockdiag extension
  docs/specs: IPMI device emulation: main processor
  docs/specs: IPMI device emulation: BMC

 configs/devices/arm-softmmu/default.mak |   2 +
 docs/conf.py                            |   6 +-
 docs/specs/index.rst                    |   1 +
 docs/specs/ipmi.rst                     | 170 +++++++
 docs/system/arm/nuvoton.rst             |   1 -
 hw/arm/npcm7xx.c                        |  10 +-
 hw/ipmi/Kconfig                         |   5 +
 hw/ipmi/ipmi.c                          |  15 +-
 hw/ipmi/ipmi_bmc_extern.c               | 417 ++---------------
 hw/ipmi/ipmi_bmc_sim.c                  |  47 +-
 hw/ipmi/ipmi_bt.c                       |   6 +-
 hw/ipmi/ipmi_extern.c                   | 429 +++++++++++++++++
 hw/ipmi/ipmi_extern.h                   |  90 ++++
 hw/ipmi/ipmi_host_extern.c              | 170 +++++++
 hw/ipmi/ipmi_kcs.c                      |   8 +-
 hw/ipmi/isa_ipmi_bt.c                   |   4 +-
 hw/ipmi/isa_ipmi_kcs.c                  |   4 +-
 hw/ipmi/meson.build                     |   4 +-
 hw/ipmi/npcm7xx_kcs.c                   | 588 ++++++++++++++++++++++++
 hw/ipmi/pci_ipmi_bt.c                   |   4 +-
 hw/ipmi/pci_ipmi_kcs.c                  |   4 +-
 hw/ipmi/smbus_ipmi.c                    |  12 +-
 hw/ipmi/trace-events                    |   8 +
 hw/ipmi/trace.h                         |   1 +
 include/hw/arm/npcm7xx.h                |   2 +
 include/hw/ipmi/ipmi.h                  |  54 ++-
 include/hw/ipmi/npcm7xx_kcs.h           | 103 +++++
 meson.build                             |   1 +
 28 files changed, 1733 insertions(+), 433 deletions(-)
 create mode 100644 docs/specs/ipmi.rst
 create mode 100644 hw/ipmi/ipmi_extern.c
 create mode 100644 hw/ipmi/ipmi_extern.h
 create mode 100644 hw/ipmi/ipmi_host_extern.c
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 hw/ipmi/trace-events
 create mode 100644 hw/ipmi/trace.h
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h

-- 
2.33.0.309.g3052b89438-goog

