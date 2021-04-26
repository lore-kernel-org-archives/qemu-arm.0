Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4119941lfb;
        Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv42pX2C4/nR3ULx6BmPafVoERKJRRcWE2MI1Qzi4OLSir7yW11hA3YYxnGtVfjdnrO66+
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr16464323ios.67.1619465741395;
        Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465741; cv=none;
        d=google.com; s=arc-20160816;
        b=p3hs/es+ZGui3Lfh6y2R5QcyfIYo/0M+bAf2AWDAQYSVFIhs1MdXEPN4VHCnZR8sLa
         lcS62P6UUbXaUh87YZCHuwwGdOuXJfpp6IPB5oL/OLXDBjk2vSBlYRYDKC+rWh1xU9sj
         XOwq6PphlIIMUq23CvYtpSbyLrLwPMy7banQP9DgSdSpJBRBvKNST9aFBkQOe3LjjTp+
         hviX3eXwUgELiSoZq5K/kSOdrk3P53Y/IXu3dY7Pfeg/eL51hlr6rM9dyy5r1e40NBHR
         D8kyMzaW/TDn5ohCcgRTqknejSW4sxL4SY6fRUQDC181AJM60gTDDGIMy/PeYFskmIFz
         VY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rGYmFGSpmD7SNs4Dd7dBqyBwJ1kX06sUPV1mfcAm/hs=;
        b=umVOxPizOEYa/zJicPdP9a7SdD1J8JQGAF1t1U5o5RGQd3V7O8BNmpT32CPcveZ+2d
         WzG0cq7+O6tp6w5MUrghBxyRdSXy3Y73spxRrKBi3yu602RT21t4ksRL0x/RK1xBCwoZ
         C9YmZlWbO6w76TbangaAFY9Zqy4bREhQo3QnMNpdiuvIOBDPlRKu87yFtT6I3X559qaK
         eGlX2GzG0A1KPKki7zXqQShD99g3eKeRfz83tDKWfhj/h36YazluKj0QQC5ckiJCWP/b
         +2ZTn4TiTL6SUWNX8o8JrGTfLmbmLCi0B9cdkUAYIvEng65cz9aQvFvU/q+p072WQQWw
         +WDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fsQH2rk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si946971ilu.162.2021.04.26.12.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fsQH2rk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb71A-0007zs-Kh
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb710-0007xX-68
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb70w-0008Kv-Gq
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rGYmFGSpmD7SNs4Dd7dBqyBwJ1kX06sUPV1mfcAm/hs=;
 b=fsQH2rk90rmH3TDtLE0hU8fe3CijGlopGY2XrWZICzU4nxu7qFbwsFgSGNLlpiuXLu6V3A
 eEhVVQJSNm4atEk6SM+3aW6whLw4u1X2eUDP4sVnSjzGTHGKKSk13ApogdbqM/WZBWQMwF
 w0gle9WcBAkVQwSHNpD9+X9cEam/0aM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-RktVxzmBMxeb1PfEJoco1w-1; Mon, 26 Apr 2021 15:35:23 -0400
X-MC-Unique: RktVxzmBMxeb1PfEJoco1w-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso16051890wrf.11
 for <qemu-arm@nongnu.org>; Mon, 26 Apr 2021 12:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4tlfJuIet0+fqLYBCB2+24GYS/bGOp7U/9QFRE9R4U=;
 b=pf8TiUPodscS0MzZhxO+LWxBFnHy525Fc4Ikf5LidE/HLv53ohkXKpoqKZWG8wcyZz
 UwTIt/KLmSM+fIcHcGGGVbwEP+KMMuDp53DjwjA+Y9pSwLbzjfKOSXKn7KqfE5Nau7G6
 uCLq7aruoc50chQHQaDmaqNAsg7ZO7PtK24nBfgwd0RqSrg4eANJG/Y1vWjjNP7XFbeq
 puqUtVfuSwp096IAdfL9YlK9fI8U4xFlJA0jo9WPnfS4lXzjrZaXmwosl70CmtS4KVIx
 VWfWmKPp2FWiVmDHjuyVBMenkpH2HRB4mChDTEpn6l9kTwTekPG+lEAI7Wti3xH/ASMn
 35eg==
X-Gm-Message-State: AOAM532VehfB/VtcRpmSSLDiwsouP/V1M5KEE84GsCCy9o+Mypw2HAbk
 PLBepgtZuEC22fOgd4kxUH+rariU78driXlTmAAtREBhDl9klO6ASB93B38WhkaBsZCo4fhpsBp
 X84/i/fh6IdTg
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355716wmc.150.1619465722306; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355704wmc.150.1619465722130; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm1324888wri.41.2021.04.26.12.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/nvram/fw_cfg: Do not build device if not needed
 (Spring cleanup)
Date: Mon, 26 Apr 2021 21:35:13 +0200
Message-Id: <20210426193520.4115528-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /jfVej8pAv4O

Hi,=0D
=0D
Quite a trivial series around fw_cfg:=0D
- enforce the FW_CFG Kconfig symbol,=0D
- add missing Kconfig dependencies,=0D
- explicit machines using the fw_cfg device,=0D
- allow targets not using the device to build without it.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  stubs: Restrict fw_cfg stubs to sysemu=0D
  hw/nvram: Rename FW_CFG_MIPS as generic FW_CFG Kconfig symbol=0D
  hw/nvram: Declare FW_CFG_DMA Kconfig symbol in hw/nvram/=0D
  hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG Kconfig=0D
  hw: Have machines Kconfig-select FW_CFG=0D
  hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub=0D
  hw/nvram: Do not build FW_CFG if not required=0D
=0D
 hw/arm/fw_cfg.c      | 19 +++++++++++++++++=0D
 hw/hppa/fw_cfg.c     | 19 +++++++++++++++++=0D
 hw/riscv/fw_cfg.c    | 19 +++++++++++++++++=0D
 stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--=0D
 MAINTAINERS          |  2 +-=0D
 hw/acpi/Kconfig      |  1 +=0D
 hw/arm/Kconfig       |  2 ++=0D
 hw/arm/meson.build   |  1 +=0D
 hw/display/Kconfig   |  3 ---=0D
 hw/hppa/Kconfig      |  1 +=0D
 hw/hppa/meson.build  |  1 +=0D
 hw/i386/Kconfig      |  2 ++=0D
 hw/mips/Kconfig      |  5 +----=0D
 hw/mips/meson.build  |  2 +-=0D
 hw/nvram/Kconfig     |  7 +++++++=0D
 hw/nvram/meson.build |  2 +-=0D
 hw/ppc/Kconfig       |  1 +=0D
 hw/riscv/meson.build |  1 +=0D
 hw/sparc/Kconfig     |  1 +=0D
 hw/sparc64/Kconfig   |  1 +=0D
 stubs/meson.build    |  2 +-=0D
 21 files changed, 128 insertions(+), 13 deletions(-)=0D
 create mode 100644 hw/arm/fw_cfg.c=0D
 create mode 100644 hw/hppa/fw_cfg.c=0D
 create mode 100644 hw/riscv/fw_cfg.c=0D
=0D
--=20=0D
2.26.3=0D
=0D

