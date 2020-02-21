Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2045442lfg;
        Fri, 21 Feb 2020 09:31:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6YaN/XGTMiug/0KxbuFPeadiXBOqsPW3TOVFi0ZUM0hJ+zW3yb11codlsVdMXw9WL8p/5
X-Received: by 2002:a05:620a:63b:: with SMTP id 27mr33062039qkv.159.1582306272250;
        Fri, 21 Feb 2020 09:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582306272; cv=none;
        d=google.com; s=arc-20160816;
        b=rMe3RYYVT/OQHwzYw1qrno1k7Eo3F3TWKkNDrDObbIDHHG3VuK77nKNN8lKtHFKT3/
         aapyAMTwUr+3K166Ysa0TIvkJFyI/LPQy2Y/a5231uQNsgBePh/ZAfVVUnm++fW7sit7
         fkkh9C401cx/sLy8smtI73lDT+tLQik6MVtmh6Lau7zflu1+yqK0WvKqH0ga8tFlh69L
         mV+/7NaJ+lPbeMqbpd1DueNbz9YAnjbWRIg+pQ9ruk1iNTkQaHyyQaey/B1ODHf6gkDO
         IQyxm/29lHsaKAlrSV1JF6pz0kumtQSZL86Jrs53xdi2jSpUb9jcZGfITgo04dsClV/i
         KDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=DW078fSvt/wxVo8MW6RkGmUKOq8LBVvtStTwUkCFZp0=;
        b=nGG48jC6uhdSIYR1H1t0UouuanwcFJoG43a1ZK6AzOjGWW+imHXCWFr+MIqD51linU
         aQeUTozYQV15W015ovLuhwhFuwK6zzes1R9+MaxcYzIGtjpuvxBkRNKEQ2Z11wn+GrL/
         /QV+hAkL0HQAK2Je9WIax55duv27gxbv5w95GF7RCvP1oWG51/UMEGbEHSBYS85rnSXL
         jGTgENtxgwrW5LR2kfPlOCYSzSUkNMyuE12TnMfCHfqLXCq6g1/4V8ARUYF+PAEjp+hw
         KsaFn59vZyK6HacqlV0ushHVmtbpzORT28TRa352RIQ4F+2wVGZIqvfc8plzldC9tykt
         mm/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sdx9Ohku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si1575621qtn.110.2020.02.21.09.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 09:31:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sdx9Ohku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5C8t-0005zx-8V
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 12:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8h-0005xM-Ci
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8g-0007vF-6l
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:30:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59621
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8g-0007uy-31
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DW078fSvt/wxVo8MW6RkGmUKOq8LBVvtStTwUkCFZp0=;
 b=Sdx9Ohkutd7brFHb2KRFfaTUbYq7Awab5eEak/ChNki0NndA0/2pRq+PsxXERHasvs6Pp6
 iN/Jc4tF+dcuzkApAcDlt52ZZ79ASPPjmPnKFtTfEB75oYRf2Gc+jPDVXz20C9EAHK1r8O
 9yWUpdGf3vmo5IA7NsEo3NDMUzpy25s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-MVPAtAY3NjysaXqlsxhJ6g-1; Fri, 21 Feb 2020 12:30:53 -0500
X-MC-Unique: MVPAtAY3NjysaXqlsxhJ6g-1
Received: by mail-wm1-f69.google.com with SMTP id z7so855386wmi.0
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 09:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAN0dTE3rfOWvsVoICSRFD9tmlR68qf+wBSCeU/ZbPU=;
 b=FDSuARjUoD1JHp7VfaXYJkknTcBY0cVttSJ2Qs84xscuDku/iAjkf/fuWapJ7J+V1h
 iT/8zaVRyrmZFSOs7GyZBYvQP/r/ImYLS5Qd+ksPVqY7h5qeQ/DTfWInjCL+IkwngLFH
 hksnQ9LtyXhxKKxPkFre02NBPA8apvENR4SVXvt9menK/gUqKJ82KBrbKfdrF5IQaRIz
 zqcfPeGS/Pvx9JHtjR6P3oOOh2F6q8BTkPa0tEdv9srogOIH9y49Ch0BhJ/lcjQWt65T
 Cc5g5La+0aJNJYb1//dHOULJMr131MdCrSHYyW05y+ffU/xDx9nLJ+AjI2FNFHbhpCC4
 siuQ==
X-Gm-Message-State: APjAAAUJ6gOQe0mj8PE/1Cg/rZFjhYDkG+3F09oxV3oum0BcdYy+nlch
 XpAhhiyIION//yB1TXWWWNAyRkNdkmufamCbElGWFIixGjoSNtWOMsBPiqlwOpriolyWSaCn/kj
 HKUN2AES5Zt34
X-Received: by 2002:adf:fe43:: with SMTP id m3mr52587972wrs.213.1582306252645; 
 Fri, 21 Feb 2020 09:30:52 -0800 (PST)
X-Received: by 2002:adf:fe43:: with SMTP id m3mr52587938wrs.213.1582306252393; 
 Fri, 21 Feb 2020 09:30:52 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:42 +0100
Message-Id: <20200221173049.18134-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /4gp+9uYgyEF

When a device creates a MemoryRegion without setting its ownership,
the MemoryRegion is added to the machine "/unattached" container in
the QOM tree.

Add a script to do automatically let the device take the ownership
of the memory regions it creates, and run it.

Philippe Mathieu-Daud=C3=A9 (7):
  scripts/coccinelle: Add a script to let devices own their
    MemoryRegions
  hw/arm: Let devices own the MemoryRegion they create
  hw/char: Let devices own the MemoryRegion they create
  hw/core: Let devices own the MemoryRegion they create
  hw/display: Let devices own the MemoryRegion they create
  hw/dma: Let devices own the MemoryRegion they create
  hw/riscv: Let devices own the MemoryRegion they create

 hw/arm/exynos4210.c                           | 14 ++--
 hw/arm/fsl-imx25.c                            | 14 ++--
 hw/arm/fsl-imx31.c                            | 10 +--
 hw/arm/fsl-imx6.c                             | 10 +--
 hw/arm/fsl-imx6ul.c                           | 14 ++--
 hw/arm/msf2-soc.c                             |  8 +-
 hw/arm/nrf51_soc.c                            |  2 +-
 hw/arm/stm32f205_soc.c                        | 10 +--
 hw/arm/stm32f405_soc.c                        | 13 +--
 hw/arm/xlnx-zynqmp.c                          | 13 ++-
 hw/char/serial.c                              |  7 +-
 hw/core/platform-bus.c                        |  3 +-
 hw/display/cg3.c                              |  4 +-
 hw/display/g364fb.c                           |  5 +-
 hw/display/macfb.c                            |  4 +-
 hw/display/vmware_vga.c                       |  4 +-
 hw/dma/i8257.c                                |  2 +-
 hw/dma/rc4030.c                               |  4 +-
 hw/riscv/sifive_e.c                           |  8 +-
 hw/riscv/sifive_u.c                           |  4 +-
 .../memory_region_owner_nonnull.cocci         | 80 +++++++++++++++++++
 21 files changed, 158 insertions(+), 75 deletions(-)
 create mode 100644 scripts/coccinelle/memory_region_owner_nonnull.cocci

--=20
2.21.1

