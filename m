Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1360684lfu;
        Wed, 27 Apr 2022 16:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTshtuGqne/IYQoF08CLV6ZVOqrY1nZh7lio/gF3zIGk9hHNhvvmVBHIqO6B/D4CDUMm1j
X-Received: by 2002:a05:622a:6184:b0:2f1:e213:9c7 with SMTP id hh4-20020a05622a618400b002f1e21309c7mr21051350qtb.467.1651102975927;
        Wed, 27 Apr 2022 16:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651102975; cv=none;
        d=google.com; s=arc-20160816;
        b=zM5whSMXVBix6xjNRZ8kBHySdpnop5Al9PqkrIJH22n3tWniRAbwte1xUzc9LjnKXO
         vTrZJfPUPVfK2ATnPehUmDEZBGkS2Rbypb6Sx3TPEpB0cFizgJTCb2jLf73rnLq0xixy
         zGP2RQMVcEpX96Je5qO89S/TK9ju2USSTNLN6gcF3zGQqimaC4udJkxOgoTtfEl+7Z1n
         5zwcj6AiboPvkX/nSk/Nw9YNKo6Ct4F2L6nqywQgKiuhmGxpkRFlHaf9tYTd2YHSsFFL
         JRSnbpQqmq1WXUeWvF/hZgBWbYXW7HISeo6TYy/tvadKSvGJtWcQI0mJXXep/M4ApG9e
         1K3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :wdcironportexception:ironport-sdr:ironport-sdr:dkim-signature;
        bh=0snzb0u+v+Dex6ZZp/Pf7XzUM5sODUVIGpP0eAa8rIk=;
        b=dyL9G+W3KHeLprPIDqJhkYt4gVIXo53vSEnc6kLSCknZXMxun/Y9XSJsKnWnUsvio8
         jSaCbR9Gv1wUiZT1sjjW8fld8X6WHrw4pMcJgmKcMDcPHgc25E4DecWHRpQ6awElBs0+
         0u1OTMYRhD6nSsyGqc9BKB7sjSx7Sg+awImGs0D9tPxZNI3p4LKYpCOBx9MyMGLRSsej
         yFYpzzNOTSXQNu/EGMMNrF3Cjx7q7JdT+uQ1A8KsknLKoO0VI/CKbSuZKtkq8jhlvC1u
         aagL7kvWBHE/NFYZmQeM+6C3r1hNk4Cib/kYTzWHMcmNb+HBlXhR2T8Jt63IRTqOLr+D
         JOZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=G8wNQmPR;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=e1EYaUxI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05621421c800b004467570be01si1076528qvh.276.2022.04.27.16.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 16:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=G8wNQmPR;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=e1EYaUxI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njrJ7-0004gi-Dp
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 19:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIJ-0004bs-WB
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:04 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrII-0004Sr-5y
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102920; x=1682638920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY+YvOoS6ba6w=;
 b=G8wNQmPRHqwKF3JlEBGrESkwYNem1P4O5hXZ/9Q+J/9eC3nK5iurujZE
 j8/0btOzKyV1m4MII7kMMtGlTgfqwrl3aCpVFrMXANy1VwupE9Ex564YL
 eyCLUfujt/6DVkf0Bm2TNt6ud1tbDdHoB2xwrPFnP2cGLLryIuFtCe4AC
 lAdbOV3x7ynDXHJRl4bbLTk34vvj9xWFh64kX9/Z4apBxBUh63s5fnb/2
 XtailcgUBYLkiSPvqUV2FJw4WGYLWdNh7fstgea/2FhI4n02DhfnqtJFi
 pUww6AjzANz7Ny8HqithcVuJSrvHmfiwAVCoMoLUXhQwwjZFBhoWcQcZp g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="203873199"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:41:54 +0800
IronPort-SDR: dbp0SHWVXoElC8DXCa9ydg+i4Ysn97i2h3+5J//M4lK91alodVKLzxra0MutBf2DUBaeUaqXFh
 fIF2pXesJKdAIBsbvXwx9g24H58fk/HM8kUI0LQyfEFZPMB9IUXUz/lzz4s1gbcT8veP8BFZW9
 RlTY0vmGqQvh3EqwAXD3vFgMkTae0Z92ISyv5a86dNZq6CUG17nG/5IdurGJjSULzunI34W74b
 7YQRh3P6kk8DeC0fu9neKfvtuuyBu2l+bSLnGxtPobm9sjV2tv4998RW7m2Hut6K4bLfjzUK4t
 W6goKotWv4LFDow2unHw1hKr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:05 -0700
IronPort-SDR: cfhzux4Lv8iqXtNzY6JPFl827cBhSurtxBQo7ZVU9pQSV8Rt+qIsOosAchHB9dAR3uecI/kipL
 qzDgKvFHkjQEEN+N8OXpMHL8iU1f8tHzcUvUrkNMw9bBtXCzNNaiI0CY00Fb+nqdWS5FEeAr30
 NGjJn9O3xhJMQxWdDC57gbidXYvGU2N6aqD7Ew8VPO1iMDO1xb9PAFuWqpYcmGkOhl+6fy5wcd
 MfhdEYGIeFtqFZ82PndcQBgbt30V2uDVn/8vDdSIvJpWIKYONRQBgn8AwnNA59tUawsKwiWpYm
 fko=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:41:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZz759S3z1SVp0
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 16:41:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1651102914; x=1653694915; bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY
 +YvOoS6ba6w=; b=e1EYaUxIfMsLJBl6RiwPW3+wAnCLy+MU8lOWxjzSXIgg9g8i
 +jqG4ubZzgZk5b+PNRwGp7DdLtv2CjwKV2pDeLC3ErUb11StGwS/8WLD03eHQ/bs
 pQY6nNfx9qjKhLoUxUxHlvfCB1k52rnkLEk1bkDmjrYq674g/ThadZDVDaZFeL3G
 ldHUu9XtdWmIGCHN8vyo74yt0271DxnpmjkMT1YYuAFHn5GwPuRpRVXkQrCQUrUj
 UR9Y6n5F1c2NroQR1HN0XSpwRBaD8Ja8mxtMgMRUGEHnJCtlrE7QQb2etvFNkAaM
 F0F4VU3riEANATNzFy4qYncyko3cbim5yve4UA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7_Sp2Y_yGWMn for <qemu-arm@nongnu.org>;
 Wed, 27 Apr 2022 16:41:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZz254Pvz1Rvlc;
 Wed, 27 Apr 2022 16:41:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 0/6] hw/riscv: Add TPM support to the virt board
Date: Thu, 28 Apr 2022 09:41:40 +1000
Message-Id: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fmvVVv22dIl/

From: Alistair Francis <alistair.francis@wdc.com>

This series adds support for connecting TPM devices to the RISC-V virt
board. This is similar to how it works for the ARM virt board.

This was tested by first creating an emulated TPM device:

    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
        --ctrl type=3Dunixio,path=3Dswtpm-sock

Then launching QEMU with:

    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
    -device tpm-tis-device,tpmdev=3Dtpm0

The TPM device can be seen in the memory tree and the generated device
tree.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942

Alistair Francis (6):
  hw/riscv: virt: Add a machine done notifier
  hw/core: Move the ARM sysbus-fdt to core
  hw/riscv: virt: Create a platform bus
  hw/riscv: virt: Add support for generating platform FDT entries
  hw/riscv: virt: Add device plug support
  hw/riscv: Enable TPM backends

 docs/system/riscv/virt.rst            |  20 ++
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0
 include/hw/riscv/virt.h               |   8 +-
 hw/arm/virt.c                         |   2 +-
 hw/arm/xlnx-versal-virt.c             |   1 -
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-
 hw/riscv/virt.c                       | 317 +++++++++++++++++---------
 hw/arm/meson.build                    |   1 -
 hw/core/meson.build                   |   1 +
 hw/riscv/Kconfig                      |   2 +
 10 files changed, 240 insertions(+), 114 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

--=20
2.35.1

