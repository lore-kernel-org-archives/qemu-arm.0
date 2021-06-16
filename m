Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp487497lff;
        Wed, 16 Jun 2021 09:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL1lmRXMmaVMUtPnXNtPTkasHWfZobbFRXBKVn4zXwUoIHlBYXuT/I9nmmsC8Wvo1lo9X9
X-Received: by 2002:a17:906:cc14:: with SMTP id ml20mr264885ejb.515.1623860082054;
        Wed, 16 Jun 2021 09:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860082; cv=none;
        d=google.com; s=arc-20160816;
        b=bj1NUOZvU2ReleQCAtxuoZ2ixfvBOZdVYFh13zN1Xlxtcp2+wFIsqrt8WqRS+HXYrS
         STtnRfraeEWFfWsrrLqXN+QVh6dowHiWCroiMDNtrAvCjO41EMoZJqsXt5vNyt6zn4O+
         MXZV5WYAzMnF2I0ZC6aebY7wUCGzjJcX1VzjHaXguYSfdQcD2+1H5Ylx+WIdreDLmVYT
         Np+M9UfxLWWdskcsXsZFz/b5KE2hXfdUr1RkIC36FTHrHljEW6jbnkTgLiONFIoEeMnK
         mHlZHVtTBCY+V/mjT69TIGtGfIEzur/jeS84TTnle12CmJcPZdkWISIVNxWE6DNGkuKT
         ocVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=uI7EBv0jj9+GiVTjrqxKvPzX6O3I8/xNn/berB0WuHs=;
        b=0E17jtEMqiYKzK8s2H7hTIerEVfiOaiyPnok893DHZBKpMAWQigjMt9XmOf0TcsnxQ
         DeFar5GFE1I5gxDN1OXG5kbxxWM8OsIdc146PgEMK3Iip+9YOfOyV5HmHuXXVcE2eQ7H
         wNdvnS/VoS0cXWvZYGTnm1Qdp6R1QvbkMNJkn1RFVRX3EGfefZLNQmMtj/vMf4CI5Hfx
         96cSsuN3WLT6Z+xkS9jVRiZLnP4ZpoQwAhMKAeeL6/Nb7tSZe9Lvi80lO3WZsU87pSXF
         jI7Bte6Iy1JIWtGF/UO//wXtBUjrJA9IBKFdIztw0VI8HitjYB1MMxfU2AJu+FE3wp/q
         6QaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cPOnscp/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si2622015eju.85.2021.06.16.09.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cPOnscp/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYBd-0001KQ-2W
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBS-0001K4-3b; Wed, 16 Jun 2021 12:14:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBO-0005hf-PF; Wed, 16 Jun 2021 12:14:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso4503647wmg.2; 
 Wed, 16 Jun 2021 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uI7EBv0jj9+GiVTjrqxKvPzX6O3I8/xNn/berB0WuHs=;
 b=cPOnscp/Q2hzTxEdazmqWSLbj8u5pMyoNwvR+2gwJk2qM9BLhZXiN7dYWr679Gpunb
 i2fA1QSVTp0NEm+4Hihrwo1ig4BSXSgMKZL8A/1y6XoQf1JXg8g8VQ2Skpl69sB+cfjo
 dmkZyIZ56mgolVMh7QRQzuF/knlV20418SnYBG6IHhrQkFSXCI16Bfg6Pq0KlzvkFVTy
 HR6S1j+3BOWs1ACU8GiOD+0MiQomSfsdnMDK/7MaDcaYd1kr3WcB0EAitgLCcHb0L6E6
 77LpIbXHuuE6Ak+AS8SubfpSUIajbrkklLc62P9SRZmWXMgvmQY1npkb8ITrNm0DUnWG
 7COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uI7EBv0jj9+GiVTjrqxKvPzX6O3I8/xNn/berB0WuHs=;
 b=CBCpdNF01d4PqsS9kqxmfZx+tEoQw+PqdCNyz/TANJOhiTVfT3oxkoztPvNtYzJcCj
 TW1qpXfwaIlpqqvb9pR6Py0Nf2621ZCRNZMmaqgDPZoMXCqG7f2KZLMKp2/ecQGVHCGz
 GzdU5dsgECO8Wh3taC/AtcZMfR4IWMmX1zd9Apbv1FeMc5Gp2L61GXUKMqbXIV+B8sqJ
 KT9kvvs6K6wjSyFGH3yBWjCvnryMuOOs2jiUu3xWAC/zTC2lct/7y2WHf0K09LulTQdU
 FNPtHPqmR2qsIzL/LXU7M0B9KwD6X8ZVwdfq8x0GV751/aCK8UzgfzkbEBjx2xbv6shB
 vwNw==
X-Gm-Message-State: AOAM531kWE0UT37rSG4fFKvVOqSyvcyoHSa50qcob4DQS0m1ttpRu8G5
 fK32tAFYOKSWkqh0zOQ2kfZxo7AezN58Zw==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr12158690wmq.93.1623860060849; 
 Wed, 16 Jun 2021 09:14:20 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z10sm2212350wmp.39.2021.06.16.09.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] hw/i2c: Remove confusing i2c_send_recv() API
Date: Wed, 16 Jun 2021 18:14:05 +0200
Message-Id: <20210616161418.2514095-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WsjLy7bDlzM3

This is a respin of Zoltan's patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html=0D
=0D
Since v2, tried to address Corey's review comments resulting=0D
in a i2c_send_recv() removal and code easier to review (to my=0D
taste at least).=0D
=0D
Supersedes: <20200623063123.20776-1-f4bug@amsat.org>=0D
=0D
BALATON Zoltan (1):=0D
  hw/i2c: Make i2c_start_transfer() direction argument a boolean=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  hw/input/lm832x: Move lm832x_key_event() declaration to "lm832x.h"=0D
  hw/input/lm832x: Define TYPE_LM8323 in public header=0D
  hw/display/sm501: Simplify sm501_i2c_write() logic=0D
  hw/display/sm501: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c/ppc4xx_i2c: Add reference to datasheet=0D
  hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/misc/auxbus: Fix MOT/classic I2C mode=0D
  hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT cases=0D
  hw/misc/auxbus: Replace 'is_write' boolean by its value=0D
  hw/misc/auxbus: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c: Remove confusing i2c_send_recv()=0D
  hw/i2c: Rename i2c_set_slave_address() -> i2c_slave_set_address()=0D
=0D
 include/hw/i2c/i2c.h      | 21 +++++++++---=0D
 include/hw/input/lm832x.h | 28 ++++++++++++++++=0D
 hw/arm/nseries.c          |  3 +-=0D
 hw/arm/pxa2xx.c           |  2 +-=0D
 hw/arm/spitz.c            |  4 +--=0D
 hw/display/ati.c          |  2 +-=0D
 hw/display/sm501.c        | 16 +++++----=0D
 hw/display/xlnx_dp.c      |  2 +-=0D
 hw/i2c/core.c             | 56 ++++++++++++++-----------------=0D
 hw/i2c/imx_i2c.c          |  2 +-=0D
 hw/i2c/ppc4xx_i2c.c       | 15 ++++++---=0D
 hw/input/lm832x.c         |  2 +-=0D
 hw/misc/auxbus.c          | 69 +++++++++++++++++++++++++++++----------=0D
 MAINTAINERS               |  1 +=0D
 14 files changed, 149 insertions(+), 74 deletions(-)=0D
 create mode 100644 include/hw/input/lm832x.h=0D
=0D
-- =0D
2.31.1=0D
=0D
