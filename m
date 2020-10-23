Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp289718lfa;
        Fri, 23 Oct 2020 00:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsO5ga78gLBOom7QBCtBnPRMm0ubbF8Yx4uJ+2qJ7rMRXB3oz0PGXs4fbuKRnBSYtgVPeI
X-Received: by 2002:a25:820d:: with SMTP id q13mr1609448ybk.67.1603437170464;
        Fri, 23 Oct 2020 00:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437170; cv=none;
        d=google.com; s=arc-20160816;
        b=pz26G45ZCbBWCXCOIUDqpsLYoPbFWLWWahwiRkUNrmTUK+W7tm5oxcjdMXJTi79X05
         Uiy34Pa71SnYmYrm67FQyxTq4OLrU2XdkpNy6o//HYZpwa38BokJ977b9eG4zQAVbSxw
         +g7OQT6yWbM1skBHzjgqDRUw3CDKwqx28NuEtzNmu1j37ValrLpkBhlSbaSxM1JUfUfA
         nOLPzLvcYNrFQOuBOZPclIVtUQnoI3oEcgvokbdnEwnI7dwYPVkogmM9jGcT/14KyWT1
         rPav3CbL4KGUO5sCsZz3Ckt14ax9dZije5yosgZVyjspPTMpuscl9seP6+ccQACg0RK4
         SP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=d/oAIn3nkyhrnG3V7Kj8kK6d6f9GUUSepLt603/6FAI=;
        b=y7dTX1Py5qnDVIVF0Lkw5nozordNJ4dDKHOx29WZ15yN7r0HTiAJ8RVBZJSGmoKqYE
         aty/KqbeEwghpjN3iLP1QzTg4UQfcjr1BV6Cq8HuRqlrzRXOToQnURiGHlC8pnNvMwjx
         Zx5LdgWB0QQmsvufKOJbgqMdFhXaVtIsCHkOFLHBz+p7JnXTOpEyzof+nbztB1N24XpR
         XrDQpVjUBK2+qqO7aWZWpAqqm8jAcP8KQM/lMXsURV3HaozmzmACBHPRcCmrTh+19LTK
         KpVa7rENAy6U/IDQ1phqaaZnAPPmTErwRSXdSJb029S84+EG0UvhKQUmH0Qlh5Ak2jNL
         IPxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bbRuMAxG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si750341ybp.59.2020.10.23.00.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bbRuMAxG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrFp-0002nP-LY
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDm-000131-6h
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDi-0003e5-2a
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/oAIn3nkyhrnG3V7Kj8kK6d6f9GUUSepLt603/6FAI=;
 b=bbRuMAxGb4Ibk5jSc6iklRwhy0WrysCqMe7wEKTR+H/dOp/Z3QAWHagJ0CaVRC2Sr7RV+P
 vNOgpHy72JORYXt82SxheiXf3qnWErXHQYK1bhy4A+tzaNPu/OZcsfQLnZ7itzv9ZCdD8n
 gyjYPfrM4kfc4HfyFMCj7/jK2qjwk+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-_zzv-H9pMwGmD-alitzdhw-1; Fri, 23 Oct 2020 03:10:33 -0400
X-MC-Unique: _zzv-H9pMwGmD-alitzdhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE7F5F9D5;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04BB05B4A1;
 Fri, 23 Oct 2020 07:10:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D5F816E31; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] arm/virt: add usb support
Date: Fri, 23 Oct 2020 09:10:14 +0200
Message-Id: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52Zq2ON4nTxh

Bring new microvm goodies to arm virt too.  Wire up=0D
-machine usb=3Don, add sysbus-xhci in case it is enabled.=0D
=0D
Gerd Hoffmann (8):=0D
  tests/acpi: allow updates for expected data files=0D
  tests/acpi: add empty tests/data/acpi/virt/DSDT.usb file=0D
  arm/virt: add support for -machine usb=3Don=0D
  arm/virt: add device tree node for xhci=0D
  arm/virt: add acpi dsdt entry for xhci=0D
  tests/acpi: add usb testcase for virt=0D
  tests/acpi: update expected data files=0D
  tests/acpi: disallow updates for expected data files=0D
=0D
 include/hw/arm/virt.h            |   1 +=0D
 hw/arm/virt-acpi-build.c         |   6 ++++++=0D
 hw/arm/virt.c                    |  36 +++++++++++++++++++++++++++++++=0D
 hw/usb/hcd-xhci-sysbus.c         |   2 ++=0D
 tests/qtest/bios-tables-test.c   |  18 ++++++++++++++++=0D
 hw/arm/Kconfig                   |   1 +=0D
 tests/data/acpi/microvm/DSDT.usb | Bin 414 -> 426 bytes=0D
 tests/data/acpi/virt/DSDT.usb    | Bin 0 -> 5257 bytes=0D
 8 files changed, 64 insertions(+)=0D
 create mode 100644 tests/data/acpi/virt/DSDT.usb=0D
=0D
--=20=0D
2.27.0=0D
=0D

