Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2905067lfk;
        Tue, 19 Apr 2022 23:11:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQQJR81/MFO0sBBixXDysG+ZI7/qbceljcNbdqVQ6uEbj7VsZ3Z0ygHBESDpoatkBEobNX
X-Received: by 2002:a05:620a:1341:b0:69e:cd37:763c with SMTP id c1-20020a05620a134100b0069ecd37763cmr2937535qkl.284.1650435093462;
        Tue, 19 Apr 2022 23:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650435093; cv=none;
        d=google.com; s=arc-20160816;
        b=pPfDWhrqAvC5o2FTA8UkRzK93OqPHvi/M0qQ5g3/DWKnGuI6hGSt/lR4TQVBX4LqKh
         Jh9/2lNJpIEpPC8TjJHpZjSHraHHU7i91UGq/f6x0/reU8VAby9eK98T/oPkEG+cQrws
         iaSEuMAN50XbRkEN1hMYEMpzYq9oXVoypRLsv0jHR/7ZjFk5VL1Ut09fpyQjK0yfyYan
         THrPKI1z7NN9oBQiSYsFcJ22pHZXlgHTBua/xumiQ8u12q/Avyx0rjYNetS9PPUGuGWV
         o0gSCc6Bs6+mY4/E5ZSY6sxzal66Yuer9fQMnMlObV7KoQd2kCvfDBYq2TdqbDugXjLx
         20EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :wdcironportexception:ironport-sdr:ironport-sdr:dkim-signature;
        bh=G/FKczEqk//ay9aeZqIFOaDrNMURFd2PBs+yVndmDjQ=;
        b=BfI2A86WViIoCuPWTlsY2DdtVfbim/VxOfyifF/UQ7jVvSln4TY3J6SrJc5nh5mT2F
         bHM8i/vZdVJOWi+Ex/WRCSEAD94QQwFaTiz6x+f8nFELycLp1IPhIQLpD9fM6bvhn063
         7rJtRDwd0CKkq8gHJQUtxPlvDCa3nLGOax1AKeKCj77AFzQ3ipfUpGQG71Ir24QhalZO
         /aXBLM6Y3T2JMH1Y/8ciozoFdRQehH+xLuKLciedjlCsGz94DzcKZEbtGiaAzhQoUHKy
         PKJPUQfw0md+/6tiHeCM4tvxmIbU7oc5me6bLDIJIrx+YBj1F5DfShcqMVHPiuiXmX/+
         Va0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=BYlVwqmO;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=VT9CyLND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020ac8661a000000b002f3368b2417si251983qtp.601.2022.04.19.23.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 23:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=BYlVwqmO;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=VT9CyLND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh3Yq-0003Ek-VB
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 02:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3Gy-0007mj-Fj
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:53:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3Gv-0004Qd-SV
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433981; x=1681969981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7wWcJ5MQSvdiM=;
 b=BYlVwqmOiTDUmMfVx3PQgHVjc/YZmX1pK920MYX2FQ30PMBaSliKeRvP
 xghH7sB8p7+r83EF6NJfhv4/F0pe3LElA+O2Tq0kn6fpjgDZRQ8Ps8ovz
 iVd4qpiQxaddYYvdRVDzX0xZuO5/idh2NYD8/o4rdcOn1gneLkdX1OH4G
 81suX7RdXavxCld1K68okWzWvwi6YTR+2wVxaYFhN1gswliVIxmiABZhH
 lpsiA5qjJQ2Uy3ujGepe2BvpVLaZHVm2+eRETh/TpgFEArxofF6lPYsmN
 IMmOToAZ3OcKGz3LD0jEEWB1czUx80ZksDQvzWJqd3yiSQbxudTX1XpuT A==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="310304313"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:52:58 +0800
IronPort-SDR: PphUQw7FUqCoSy0qsZxNWXZ/ZMiONMza/lXqTJqbGicxSx6ZXE97lKFoyzO+CAlg+WMgukdLsX
 e6okuR6xinodGSc01ubstdDQwR9fYcKvwHyjtaFKs5wu72ZicOZIYztJwRipwTvojbfsoasNhx
 w9oTZsnj/3GdJiC/ZUqce0FAK1GywGRJC3xH4V1eAzTE8s1EVAsH0g0PXpNnSVBSDDxx87+Y9B
 Nmoaabm/jc44o/gTW1E9N6zl3wVRD3zm2T8jQhCFgNV3rcS0il6KeobjjrjccBu6p7JQtWOeCC
 EO1aniou5kLXCjj6V2MBytIt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:16 -0700
IronPort-SDR: akYX9nTme5VPU8kmo/hXJK7Gj//2xZG93yFwtpjE3ZF/fk0DwAp2soUAYpERvP38Jb2sBywR17
 4twCc8Nb/Qya5fu+0QTAsc7O0suBHw1Lzmg36IWtGzt9Yb7YilYcM0uzJtgjKWTQegmccB7dJV
 PmgfYcPW1DlPrBCAh460Yg0JVdAXW3znZtkBNwn7tQLEN5z1qh5Zlpw/mF90RxIGw9JSWwmCOd
 Kcw/p7mgFzzuFVmnHQdTFj2X2Zr0Sf1wWfw3tlV8Zb6coggLIF21HTG/fI8tBLo0+SRdUqKUqN
 9QQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:52:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqZy0RNSz1SVp6
 for <qemu-arm@nongnu.org>; Tue, 19 Apr 2022 22:52:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650433977; x=1653025978; bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7w
 WcJ5MQSvdiM=; b=VT9CyLNDtlpH7sgVfx6r0wh10ZqLGIOvRgIzdpQINV9YE5bd
 ow3tDO4RQs1LNPMpvImu6neqf1nyKSY96ShNBxOOT7SU3lGQz3hZZc3HLF4IEl41
 KvFCo17RYzkBbyVOE9MqjuI2UrQ/Uq6PE/p+ilkX6mpfal1gkKRWUqTi/g4wX8a0
 mMzIpNNTovnSjwjuSKsmHTCkDxhCdtQjOt6HXm436uYTtmhcXLoKgs8wF+J6ol6K
 OzJ8uCC3d3HKzc1tcsSUz6L5As8u2jnegsuc1CQnRKvbGNVvoVE8LdVTEtd7fBoz
 CMFYi2VzPVJo64aWyycX/BNNVKrnN359ICi50Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id M5wmFqI5Jp9X for <qemu-arm@nongnu.org>;
 Tue, 19 Apr 2022 22:52:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqZr5Qn4z1Rvlx;
 Tue, 19 Apr 2022 22:52:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 0/6] hw/riscv: Add TPM support to the virt board
Date: Wed, 20 Apr 2022 15:52:42 +1000
Message-Id: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: +fifToy2FUs4

From: Alistair Francis <alistair.francis@wdc.com>=0D

This series adds support for connecting TPM devices to the RISC-V virt=0D
board. This is similar to how it works for the ARM virt board.=0D
=0D
This was tested by first creating an emulated TPM device:=0D
=0D
    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \=0D
        --ctrl type=3Dunixio,path=3Dswtpm-sock=0D
=0D
Then launching QEMU with:=0D
=0D
    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \=0D
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \=0D
    -device tpm-tis-device,tpmdev=3Dtpm0=0D
=0D
The TPM device can be seen in the memory tree and the generated device=0D
tree.=0D
=0D
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942=0D
=0D
Alistair Francis (6):=0D
  hw/riscv: virt: Add a machine done notifier=0D
  hw/core: Move the ARM sysbus-fdt to core=0D
  hw/riscv: virt: Create a platform bus=0D
  hw/riscv: virt: Add support for generating platform FDT entries=0D
  hw/riscv: virt: Add device plug support=0D
  hw/riscv: Enable TPM backends=0D
=0D
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0=0D
 include/hw/riscv/virt.h               |   8 +-=0D
 hw/arm/virt.c                         |   2 +-=0D
 hw/arm/xlnx-versal-virt.c             |   1 -=0D
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-=0D
 hw/riscv/virt.c                       | 312 +++++++++++++++++---------=0D
 hw/arm/meson.build                    |   1 -=0D
 hw/core/meson.build                   |   1 +=0D
 hw/riscv/Kconfig                      |   2 +=0D
 9 files changed, 221 insertions(+), 108 deletions(-)=0D
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)=0D
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)=0D
=0D
-- =0D
2.35.1=0D
=0D
