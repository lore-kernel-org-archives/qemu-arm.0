Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp317114lfp;
        Wed, 19 Feb 2020 02:17:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrCx7E75mj1DPvPR8+wD5dTvveqZ4M8OkzLSgZFrmr6l9kp8Z2MZzeD4ZMcSA+Cvrm5GAz
X-Received: by 2002:a37:a54b:: with SMTP id o72mr21346443qke.489.1582107450580;
        Wed, 19 Feb 2020 02:17:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107450; cv=none;
        d=google.com; s=arc-20160816;
        b=fltTmQnWXCKsJ42j34JCEg6dPdcxZTunEfFM22opkvt2X0mnp6r/srdbGJhVgQDwct
         hf1hybHuRr7x5VYijcBZxFb+Zt2Y6FJvIRXkICgwjFUWoJQw//HyeMC/l5S6qERpbs9D
         FKqRc7pC9MVPVKgYbRHVrziMPqGs5APm4Jn7oLYEms8DGiErFsPpl/muVkYG56nR640R
         3uBLCNTSTFdMsHc3/+VqXggyQUI48BYbMelwiEdN7QJhcoz170VPDDuDtjS/eTrBMdJr
         ufSDdLNOul6WskQQqhg0rVvicb45TalI72okLTfntxuCLaVpMmu9sYcryjqVkCCxeV9V
         46Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=cfiaZVU/wlkV0cASZkig+GBdWLpRxWv//T1pVuMhUbQ=;
        b=cUycFxaz3T0m2XQ35ldBkB7lW8Chqj1btfuLZ1666XuzIpy/9wX/IlK/eYO7XEFu+f
         x7fCcHqOuBY4vFpzVGgC3Edx9RhIqHq/fcds58js91HJ62RMUDl1SorwVQgskamky8TB
         sZET+4PrlLZhfqEg7Za6/HRx+2ws8p9XbWB6M5snjM3dW16/RsOdf9/wXLMa+CXR8NCz
         RjZp0gL7uLp26yQr1AB1DmL3iPoK7Yk68RuW+DYG902CnLiYPNC0wPX/c2va6Gwq+TTO
         ISf8ne3WGG0D1hXM1Hkx8/urNS3f0Vg6jVxeb7ltZ/NsoHeQpp5PNKZc4Svtut22VB25
         3YZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si725341qtp.117.2020.02.19.02.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:17:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MQ5-0003Lj-QJ
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPR-0003GS-OH
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:16:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPQ-0004mc-KY
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:16:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47483)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPO-0004iN-2Z; Wed, 19 Feb 2020 05:16:46 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mofx1-1joSmR1F6H-00p0ta; Wed, 19 Feb 2020 11:16:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Trivial branch patches
Date: Wed, 19 Feb 2020 11:15:55 +0100
Message-Id: <20200219101612.1033925-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DWEuROI5o9vosqpwP6BG19STXPZ1c4bZ1l3abFEEupUeGg/SHvn
 U2YGGOh5iF2r+VpvOaCT1Sjrbi0fgTB3746shs+yzKNSymH/BBC8plpl4GOHd2MQ0sFNjUO
 p1AzteCY56soEvXbcQWA3Cx+V/noL4Hf61nWZWA9MQvRm+PQEYLVR4zRnV9inDDdY5j+v0e
 xkZbfp7ArBmH1Vny41sBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5fVKbgXp3F4=:SDsfwZoehH39+FEyAxja5Q
 7Pd5UseZANsDD0GggysiWrTvsBUVNVrNgdXB2TV81wEgy23tCUJGCG0DPgvfAO9d3zLMIqOJD
 ehzsj7Pi3bWz6tP7sC4dnZPw8FFf8q0510KHVr5KFZ6NVRqVPatPMHIrTTWuE5y4Bolt2EeyB
 AXipSLiXLgQSgBHol0exaXKhCLPTYvaNC75J4BPidwaSySph1hM+7X/orL5cgL4254mBOe9BF
 JcMD4VpxRR5e5brdNZduIs/zY5SW3t370Q6AILpm4m8+0Lar9PRe0FowX/cWKQGIhBdEk+rHm
 hCTNz8DQpIaBTWcIoHI21I55fDpdfzFfUTlrqvFjcvGN7sc+t9kTQ1pra9nyKRWnKeMXcLeWs
 71TuzfpfaJ3qfxOvgAcq3H1jgnfuOkqSzPKAUp6pCpIkUJ8gWWoPXx+ALjrpgh1VPVUbfz0GX
 n1d1qmlwyxxmqDYUA+NSTsRPsCEeKFokLAxeZ78TiZJS0Sg+sppSXN6gPSOTqMJKcz2whC0ua
 i4yIaj+hLEUhM2ZvKoqK9wx8HyEENy5Sz82I3CzWntDxEn/1Q4S7pXmK+TyCDRvD4JFwQSOY2
 JgARlTiSPjsSX+rV0RXLIMncdR5hZYudg/RXnXt0AGYlkT1ald7h/Losnew2DfHEShj5IAzoH
 kJ1/JWNpo4YIMNtqCKHyc9aoKMaVtuTQgBgjhL4/NTpCZj+ON+ZMrsWwhvbkV2E1BFlEBn9G5
 Av3hO0OVIQxHcjY5sKHmuYvgh6lAkQokKlH5hN+iyTjZILxXOpxn60NkasKb2iG1ZTlM1zUM7
 KX2I6w/IjoAgCAtmbWKUDJr6ZgVuUWo0/PI8E4AXRTIHcRD00Wr/HpK/qT16MLiIQhRr4IQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2LbUpymTvCk

The following changes since commit 6c599282f8ab382fe59f03a6cae755b89561a7b3:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-monitor-2020-02-15-v2' into staging (2020-02-17 13:32:25 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to d1cb67841ca213802ee789957188ec87e8b7996d:

  hw/xtensa/xtfpga:fix leak of fdevice tree blob (2020-02-19 10:33:38 +0100)

----------------------------------------------------------------
Fix memory leak with fdt
cosmetic change in code and logs
update mailmap

----------------------------------------------------------------

Chen Qun (2):
  hw/nios2:fix leak of fdevice tree blob
  hw/xtensa/xtfpga:fix leak of fdevice tree blob

Michal Privoznik (1):
  Report stringified errno in VFIO related errors

Philippe Mathieu-Daudé (13):
  scripts/checkpatch.pl: Detect superfluous semicolon in C code
  audio/alsaaudio: Remove superfluous semicolons
  hw/arm/xlnx-versal: Remove superfluous semicolon
  hw/m68k/next-cube: Remove superfluous semicolon
  hw/scsi/esp: Remove superfluous semicolon
  hw/vfio/display: Remove superfluous semicolon
  ui/input-barrier: Remove superfluous semicolon
  target/i386/whpx: Remove superfluous semicolon
  tests/qtest/libqos/qgraph: Remove superfluous semicolons
  contrib/rdmacm-mux: Remove superfluous semicolon
  hw/display/qxl: Remove unneeded variable assignment
  hw/block/pflash_cfi02: Remove unneeded variable assignment
  hw/net/rocker: Report unimplemented feature with qemu_log_mask(UNIMP)

Yu-Chen Lin (1):
  mailmap: Add entry for Yu-Chen Lin

 .mailmap                    |  3 ++-
 audio/alsaaudio.c           |  4 ++--
 contrib/rdmacm-mux/main.c   |  2 +-
 hw/arm/xlnx-versal-virt.c   |  2 +-
 hw/block/pflash_cfi02.c     |  1 -
 hw/display/qxl.c            |  2 +-
 hw/m68k/next-cube.c         |  2 +-
 hw/net/rocker/rocker.c      | 15 +++++++++------
 hw/nios2/boot.c             |  1 +
 hw/scsi/esp.c               |  2 +-
 hw/vfio/common.c            |  4 ++--
 hw/vfio/display.c           |  2 +-
 hw/xtensa/xtfpga.c          |  1 +
 scripts/checkpatch.pl       |  5 +++++
 target/i386/whpx-all.c      |  2 +-
 tests/qtest/libqos/qgraph.c |  4 ++--
 ui/input-barrier.c          |  2 +-
 util/vfio-helpers.c         |  6 +++---
 18 files changed, 35 insertions(+), 25 deletions(-)

-- 
2.24.1

