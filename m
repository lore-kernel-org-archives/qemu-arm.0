Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1012662lfa;
        Mon, 12 Oct 2020 05:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4rjVG0CymAiRiY23wao9wxAGScGgE0E67kI9PcSaPIFM+Lf94/BhMr4+yhsLollAXmsB+
X-Received: by 2002:a25:dc13:: with SMTP id y19mr32650268ybe.405.1602506728454;
        Mon, 12 Oct 2020 05:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602506728; cv=none;
        d=google.com; s=arc-20160816;
        b=lJOULpIZc1ZddPraey8Z/P153bSMWyCOc0U8bYxX35/RO5AFUKIgsC3S8E6EZH1XWk
         tcAxMuYgmUu4f5nFSAxR4kCB4IE3wCh08a9zFqLWxACKTE18PjOQRT//LQ3ibV8+SsL9
         iEolHRy8ENXlbeSv6TDJD3g0zvJX52HV+RjriWFO8/fDVYizWFxW0yIh6X0ik2Tl1RGf
         U9qRYDSL6xIzwMrsTm72+/XNgcVsZ9R+0sSqodO2QLCKyfV847i+SdtlCnVeC7+5ip57
         csQMPqmSb4mJe3k1q4OUUyh1pEHvFpBrtSaiMA7ZwmuqRZAdsJD8lloOkWQQ7WYSF6Kl
         YnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0VfM6Y1Z4oOM9AviCLT3C6cOeCH1n4rJ8RPo235glro=;
        b=JZ4U8xHZV9QBTLIJJ04fPYU5TtMxEZPgWefsYCsUvJjbB5Wrad4KImPML6OodTIRhc
         sFb0PYaHWcAjttrnm4lNc13eXumfXiqwNMu9CF5OtNYduZeeQMN/BS/5hJdtMtprRQBS
         Bmwx3gMpIp7ztw/ABEPiwVFF2Y5KpNIGTRmcv8mP9M98D0vevKI/QFmTFGAAaAE+t47K
         38BRyzK6E9zIsMccHKkj70fWjzHqJl2Z4ReTBiZH0+ZZ9Bj4crPyd8pGZsEf/wVL0K1m
         Jy4yyKLrS1fMYkrB+jmFp0VArzrS1uzXoY+xB1cIEW30iQHCmmpTkrcniqIPHzGKal62
         TGGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BqVfRC78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d135si14194214ybh.2.2020.10.12.05.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 05:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BqVfRC78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxCh-0004nQ-Mw
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 08:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCW-0004l6-3g
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCT-0008SM-6Q
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0VfM6Y1Z4oOM9AviCLT3C6cOeCH1n4rJ8RPo235glro=;
 b=BqVfRC78Yay5r9pQAjHpfkB3ZhHu0D3ht7SN2G6igkXLk9HuQ31kutBfViW4f4sZmLeTJO
 ebUxKFphxUSWueLzcWiC9BMVzbtr6r1rRCbn5AW8pETanUfjIDvXC480JHIOeD/LFk4U2l
 IvWNSSJw9N6pJJgEVNrvwMdkg87ECMo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Xu7XeWRRNu2QooT2FffSQw-1; Mon, 12 Oct 2020 08:45:10 -0400
X-MC-Unique: Xu7XeWRRNu2QooT2FffSQw-1
Received: by mail-wm1-f70.google.com with SMTP id r19so5714061wmh.9
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 05:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtSObLJfNIzbJcrgKRU5Cu+zNLd9lEQsFGBvfOC7Lok=;
 b=p2ehDc0Ppzv5FzWVJLh75e2C8uEEnynxXvqD18IgkNyYxsV2q8ngLUMCB25e2HoN+8
 kSA5DVCjxdPq9U07zcORsE9+Hc1VefWXJfoQ9fxOBHTxA1WwS0/FYnvJyyNzZZq53agr
 2viXh3PeLhYQE+ppRfIW+6/xUGUXYgEz1yYjZ1b4PZASmjBoLt4qUC/QEE663350YO+v
 mQtptp6VbMP0A4cNI7JjP8Yh0dDZR4HxTvSITwcnH1q0JeQB0EQgfAN7J+rWAiI1arPx
 YIiXbBDnLD7ENEyIDkKFDljChRwjdSANVBoa2R2Ux1XLhV9W2Te+iOKI4p4L/GTA0VCi
 WMHA==
X-Gm-Message-State: AOAM531aK7ghLUUZgDBaV0MDVR7KkbHc3QjyRTnw3eNFURYeOytMBIDn
 32q8NfRjyuV4FDJXkVVHQDxBfaFl0Amw69pagrdIgSW/5pNvI1IqNdps1c00hYZG9IuT0ltMFtG
 emP2w1ULeoJey
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137860wrs.101.1602506709371; 
 Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137815wrs.101.1602506709130; 
 Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d2sm14916054wrq.34.2020.10.12.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:01 +0200
Message-Id: <20201012124506.3406909-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E7GOD3ZuAleW

Trivial patches using the generic PCI macros from "hw/pci/pci.h".=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/pci-host/bonito: Make PCI_ADDR() macro more readable=0D
  hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'=0D
  hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'=0D
=0D
 hw/arm/virt.c          | 3 ++-=0D
 hw/hppa/dino.c         | 2 +-=0D
 hw/i386/xen/xen-hvm.c  | 2 +-=0D
 hw/isa/piix3.c         | 2 +-=0D
 hw/mips/gt64xxx_pci.c  | 2 +-=0D
 hw/pci-host/bonito.c   | 5 ++---=0D
 hw/pci-host/pnv_phb4.c | 2 +-=0D
 hw/pci-host/ppce500.c  | 2 +-=0D
 hw/pci-host/uninorth.c | 8 +++-----=0D
 hw/ppc/ppc4xx_pci.c    | 2 +-=0D
 hw/sh4/sh_pci.c        | 2 +-=0D
 11 files changed, 15 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

