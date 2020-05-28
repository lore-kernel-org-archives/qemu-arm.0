Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp483025lfc;
        Thu, 28 May 2020 05:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLnu4gx4OFNfiw7Xi7sBqTDworOiVvAGtksR+qgMy10uyYg2CVsjei/KDZ9z5snOQBENoM
X-Received: by 2002:a05:620a:526:: with SMTP id h6mr2470622qkh.338.1590669407223;
        Thu, 28 May 2020 05:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669407; cv=none;
        d=google.com; s=arc-20160816;
        b=SSKIvQEvMS6DO+YFSNo7/CsFCu/DvxuqiRwwiY+fmgp31XnELAnSFOSrJfcKpTPKVr
         lLpWHaGUo4n8lXXHSm3bKRTfcpe6vbtm+aSzwqn8mXUWy2APocJa3wmYPXJlqGKiIB/5
         CP46xP3+0ACV6ahyORmgnPXJp125ujZMDqejM1XosLZl3O0O5yjHK8EdL/x2RMILqC8o
         4HPlb22ST5xDwTQIuCyww9BEXRzED5L62OwSria5aG0pEPEzLu5VaE4yf5FR174YUBkZ
         nvCtZHeDP4rYV5ZT3Hgton6URrwep25m3VOG9hzmFjCAIlTcMoZKUjNYp3N0oYCsoNVG
         qULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=mVjZqVP0wAt2HnF0eXAfdRGW3Pml22lYIIaHBGNUwSg=;
        b=q8nFR+83By5o5mfdUI0erAunUYVTpraHbaRhZBDek11OXkBJXlG9yJhaa2xxpJe09Q
         17bis2/P+zA4wzWnU8lDKpYBjG3sL4E1fmWlCqWcsqbF3c8gxo6RXkmL2PruZy9M1DBK
         Nr5ZdxIuTzquRBFgbRsTsgu9CTafqJwqoJs21BnzHnETHbd3xMo8Xc8vFxmbFcP3S9bI
         BFdpWoqpoWaoCBBXAX/QaAU3i6hLsuC80A6yloXdK9ttlE77MSzBVYq6G5o3DsF6v/8t
         xXqiCemfkT/1R5U6Gu08nvkhiaInSzV6SeJdFn7lJ7BJMHCcFsX43qc5i6bG+HA/Uta7
         xwkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OetrZItr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y25si3433210qky.41.2020.05.28.05.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OetrZItr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHmA-00022d-JZ
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHln-0001Qr-2v
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42758
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHll-000584-I4
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mVjZqVP0wAt2HnF0eXAfdRGW3Pml22lYIIaHBGNUwSg=;
 b=OetrZItr4n6kU20Gm0pe6tvTbTVv9TZTPQifJKfUH1q3AsFzZ95JclK5V0sVQy+Af14TkP
 52GnnnUSUYbreh46DSjaBlNg7wI+ACsUiJp492NL3ldQI37OTuoMoDDSuObedCVx8kZT6c
 zRlowFiwzBsIplS6Uo+tEf5kVBASbis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-6xIn2NcANOmoCGYmTlSLFQ-1; Thu, 28 May 2020 08:36:18 -0400
X-MC-Unique: 6xIn2NcANOmoCGYmTlSLFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E964B8014D4;
 Thu, 28 May 2020 12:36:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 650AF10013C3;
 Thu, 28 May 2020 12:36:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 589CE1753B; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Vga 20200528 patches
Date: Thu, 28 May 2020 14:35:48 +0200
Message-Id: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sj6qd+F2aLt+

The following changes since commit 06539ebc76b8625587aa78d646a9d8d5fddf84f3=
:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-hw-next-202=
00526' into staging (2020-05-26 20:25:06 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20200528-pull-request

for you to fetch changes up to fa0013a1bc5f6011a1017e0e655740403e5555d9:

  sm501: Remove obsolete changelog and todo comment (2020-05-28 11:38:57 +0=
200)

----------------------------------------------------------------
hw/dispaly/sm501: bugfixes, add sanity checks.
hw/display: use tracepoints, misc cleanups.

----------------------------------------------------------------

BALATON Zoltan (7):
  sm501: Convert printf + abort to qemu_log_mask
  sm501: Shorten long variable names in sm501_2d_operation
  sm501: Use BIT(x) macro to shorten constant
  sm501: Clean up local variables in sm501_2d_operation
  sm501: Replace hand written implementation with pixman where possible
  sm501: Optimize small overlapping blits
  sm501: Remove obsolete changelog and todo comment

Philippe Mathieu-Daud=C3=A9 (14):
  hw/display/edid: Add missing 'qdev-properties.h' header
  hw/display/cg3: Convert debug printf()s to trace events
  hw/display/cirrus_vga: Convert debug printf() to trace event
  hw/display/cirrus_vga: Use qemu_log_mask(UNIMP) instead of debug
    printf
  hw/display/cirrus_vga: Use qemu_log_mask(ERROR) instead of debug
    printf
  hw/display/cirrus_vga: Convert debug printf() to trace event
  hw/display/dpcd: Fix memory region size
  hw/display/dpcd: Convert debug printf()s to trace events
  hw/display/xlnx_dp: Replace disabled DPRINTF() by error_report()
  hw/display/vmware_vga: Replace printf() calls by qemu_log_mask(ERROR)
  hw/display/vmware_vga: Let the PCI device own its I/O MemoryRegion
  hw/display/exynos4210_fimd: Use qemu_log_mask(GUEST_ERROR)
  hw/display/omap_dss: Replace fprintf() call by
    qemu_log_mask(LOG_UNIMP)
  hw/display/pxa2xx_lcd: Replace printf() call by qemu_log_mask()

 include/hw/display/edid.h    |   1 +
 hw/display/cg3.c             |  14 +-
 hw/display/cirrus_vga.c      | 119 ++++++-------
 hw/display/dpcd.c            |  20 +--
 hw/display/exynos4210_fimd.c |  46 +++--
 hw/display/omap_dss.c        |   2 +-
 hw/display/pxa2xx_lcd.c      |  26 +--
 hw/display/sm501.c           | 313 ++++++++++++++++++-----------------
 hw/display/vmware_vga.c      |  18 +-
 hw/display/xlnx_dp.c         |  14 +-
 hw/display/trace-events      |  10 ++
 11 files changed, 301 insertions(+), 282 deletions(-)

--=20
2.18.4

