Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp485232lfg;
        Thu, 19 Aug 2021 09:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV7oSYjD+r/xwwVbZ0DTNBROh9QLjLoAjGVnULOnMZ6zPEjJISJKGuB22V+JuvuQhVNUHN
X-Received: by 2002:a1c:1b49:: with SMTP id b70mr14830058wmb.17.1629390880194;
        Thu, 19 Aug 2021 09:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629390880; cv=none;
        d=google.com; s=arc-20160816;
        b=Iw5nVwXZ7cDTeMlRu2GjbWlwulGq5X6jpD5xhCx8oyCj3cz92M2b6pqcjH4sHpOMAH
         9KZb3GpIj0d27G18wo9isncu2na8IwXpUVhScbxrLZcIJIkb0Ml3wqa/pY/ZLiHDYL60
         2QNDblLgZCz9BcXs2dMpIZqhHLXvJ7zBZj2uJeaS4k5if8o8qDAb0SitZtP0NUmL29j8
         +gJ0dC5kVqbKmypVWy7SGERn2rBoL3cmK+noVU5BUwRXbATdwWlxs+TU3ooikwVSa/V2
         pnCuAfi6JcpYhcOa7cNimL+eI6S8rjpzQ9SjLug+xMozh71Na+UJpKM9bgXx0vsjYQI7
         Sklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P40SZLAow2qKFOaot8Segjt7m5P0Tsh3DgGPbGXn+Zc=;
        b=x6jnrcIawuT6E0bA6JxrwZEaSmNWF9KQsI0aMvVpwWpWam97jH3F4N0k+rg6hHyPkp
         SfZNo2IIkpoG76R+ytrc6+p3pwKv+I/9qTsGiQTCAA5COs0qnyQBQ4ksQr+5s6l9m6nc
         mVHjM4Nmhp6eEVZlNmE+tNcO1h3t6DI4LlybgYQ4uYm1Ph/0tGbXD6wUbB/lDyF1chlL
         6i22ByYShcx9vu08yuZl3QCEOzt1b4wkSI0okaIZipHtq7pz4JQ/6AwSNuSuYUGWalUJ
         GXlZn6o8UHeMg27B27ReYmIJe6VlYhM0rhMBW5sJyyzDZs/kyMKxWuQ0g4/lBtXmGm3O
         j1jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TaOURbTn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si3460609wrm.221.2021.08.19.09.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TaOURbTn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGl03-00029X-9A
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzu-000279-RN
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzs-0005qd-Lc
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P40SZLAow2qKFOaot8Segjt7m5P0Tsh3DgGPbGXn+Zc=;
 b=TaOURbTnyXCGR6ZWYjsqNVfpEvOqGOcv8eIZFdeHb25JoyG7cdoIHsY9jtmohPaFiM4XUQ
 UFLTirP9UBD4mnGukiv35FaI69qTAkP1B+mKeVfZVHTKf7MtaITBst8DkgGyDbrAaAbihV
 K0Ib4uRBm7fSPSMvV9YPY1VyxuUVvgA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-gpiu_nP0M2WOZJ2LUntLMA-1; Thu, 19 Aug 2021 12:34:25 -0400
X-MC-Unique: gpiu_nP0M2WOZJ2LUntLMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so1695819wme.4
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgbSsE9quR7RENKnyXMZwWY+CLMoPahTuLam0TQ3O8Y=;
 b=b0gP640Cn8BTJuOfkWe6uYeJBrwsJ8EIm2gpAWgoHqVD5ZSH9ydU9zJkia0WqwD6RW
 iRbAFZp6TXWzo4dkau++cJxfwa/ezVaNVNTGpZZyhXLNJn2Hir5i5tSvufNY4H+k9JgP
 97ySOhx2BX+DfKAdgdRN6VYCTTFKnm6dbcnkOwn8WnSE3rvvSjdhzT5UWjQvOz6VQ3YM
 qHlXJI6GB6hhb0fkQm3hje3Am2rPLks9+E+3old1Tb1wwNcVOBYq82zf9kJsUD+sEBq0
 svBIlUOHKIaYtkiQQFSojASzPWRvMkm6KSb3lRgLrcBW/pitKA/kWwPHgMRdcFiWU8Di
 JA5g==
X-Gm-Message-State: AOAM531Vz+dCqAOpP8GpKOUNQWBg93axp55iCNTS3SLadzP5i3SUr2yo
 z0ebWA3ytgZEfexdrtIQdt3m3cvoKzdWnvrffA5QAhnaCpvsKLBugbWgshhVUiEw9ROofrGDEW0
 lFzUsSCkEvdgd
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr5131612wru.302.1629390864554; 
 Thu, 19 Aug 2021 09:34:24 -0700 (PDT)
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr5131594wru.302.1629390864383; 
 Thu, 19 Aug 2021 09:34:24 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z17sm3553511wrh.4.2021.08.19.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/dma: Always expect 'dma' link property to be set to
 simplify
Date: Thu, 19 Aug 2021 18:34:18 +0200
Message-Id: <20210819163422.2863447-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TDB2K+B7tdNn

Fix a qdev realization ordering, then simplify a pair of DMA=0D
devices by always passing a MemoryRegion property to the device.=0D
Doing so we can move the AddressSpace field to the device struct,=0D
removing need for heap allocation.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/arm/xlnx-zynqmp: Realize qspi controller *after* qspi_dma=0D
  hw/dma/xlnx_csu_dma: Run trivial checks early in realize()=0D
  hw/dma/xlnx_csu_dma: Always expect 'dma' link property to be set=0D
  hw/dma/xlnx-zdma Always expect 'dma' link property to be set=0D
=0D
 include/hw/dma/xlnx-zdma.h    |  2 +-=0D
 include/hw/dma/xlnx_csu_dma.h |  2 +-=0D
 hw/arm/xlnx-versal.c          |  2 ++=0D
 hw/arm/xlnx-zynqmp.c          | 54 +++++++++++++++++++++--------------=0D
 hw/dma/xlnx-zdma.c            | 24 ++++++++--------=0D
 hw/dma/xlnx_csu_dma.c         | 31 ++++++++++----------=0D
 6 files changed, 63 insertions(+), 52 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D

