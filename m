Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5183030lfm;
        Tue, 14 Apr 2020 09:33:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypIzr8nSbe+G5nBmj/lDTA7Lz+7z4HGGsppSfg/JWeTO4yDXM2USSKZ4PeVL1yL8euLAev2H
X-Received: by 2002:a05:620a:20dc:: with SMTP id f28mr22265183qka.216.1586882010549;
        Tue, 14 Apr 2020 09:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882010; cv=none;
        d=google.com; s=arc-20160816;
        b=1CAsrIHPUhdXpb6TdxlNA7Cq0Jmy2ykrxA2mA49C6cfJaRlsIpybQCiRj7AYu8IViS
         wXQExMJ6MNCbsN4EYYs25R4rD2k4aTmWSNjjKYqhTUE7LVXuxsgx8Rwo6a2/8oeCVcfO
         UPCd98jTaET82NngnwejlMF4TTkQIrrbOXDZBMtHpk017N+gsuC/GxT+sXe5vrUd49k/
         cdHrmdwZYsE6henQurpMYv9qJn2fgAMXAZX0QJ6wa6o5d0bA0yDfu630CaFSXiyVbPjd
         QlYk89gJxm04UhqW6U9ZXyaeXOD8VWy6iJQg+tBB2BEaSp+38UAO4eh8jbSk9bgs4wif
         Un5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WpXqVRWnwC/7fduD19tFiabBEgGygCctCEDBIM8aWy0=;
        b=UtlakBZYDtOucQynOScuafo16Od5hrXdfQvG4K2NSirqVy9Q/whXivwbc5v+aU9AyI
         Ba8WiUYmgnoVMHuAA66tUUXtsVSlCSh/37ksw9dJxmwxu8qmrXBm9uKxuDUGsiKATuFB
         +YY+nMZLTmUWJNfrYTxMAD8vnR3lw2+h9mZ7fz7Jdkly7+hbjKiZtNixxi9o/zTyhmQX
         TJpdkutf6+h9xCxjChsNoHHCphXsWb7NOs9SOCcGn40PPmxTn7TBYnDHMF8+w33vf0EA
         ukhqRS9AriXhmVLvnGIoPXioIA6bYWaMNw4CRYHS+Qy30JdYhiXNl3dx5btK1gAVzvBL
         U+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=alUJg5GD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si8223719qkd.113.2020.04.14.09.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=alUJg5GD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOV7-0001EK-Ua
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOR6-0002oN-RR
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOR1-0008Qd-7Z
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:29:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45127
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLeU-0008AT-VO
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WpXqVRWnwC/7fduD19tFiabBEgGygCctCEDBIM8aWy0=;
 b=alUJg5GDp2rof1gWIFzWwR9WTU7KyOxoRcwyjG8dnUrAko2a3bqc0i5kBgAMSDKZkl1j3y
 WkHgzB2YRieRlzbWMKCQkmCFuU1Cf1lD3IUEA+dg5O3UPKh0MR2891VzVDzPaGBkIV7sCx
 NWd1TnlDZfw4qgdIFHezQpAjSyfJP2Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-BtaH6OwHOpyRK6Vsmvkfbw-1; Tue, 14 Apr 2020 09:30:56 -0400
X-MC-Unique: BtaH6OwHOpyRK6Vsmvkfbw-1
Received: by mail-wr1-f72.google.com with SMTP id g6so8658540wru.8
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uc7TJUs/ixiFyqutC9VIpB13KeQ267/XOs+rA8uW20U=;
 b=tNYhJOYHHoqgDQ0Ne9WAqxrN0MiGSfnzSTclu5r5SCVCy8DH8TlN7HRN5CDYkAriSa
 SpIQ+sVC+Z8nvu+Dpz6b8B9L4Oj9jWOIIh5RSTAaOCqj4UCb7CKO1BeWUYZWzyA5piZl
 IRP3zfh6THkN6TCk6bLwJkkyKWaR78NixJKuG/MRtk9NyoWrusGBB1lmmpRalngqldgL
 EpWjkJEExXbytfA+mRqGgBgceDTwq9sRRUyHEo97bp/1bOZPclMUXotnPlSf1BJigvHM
 Az07txH0sFlspLygd52APXWHy2JrkJXwDA+vQKNniYoEi1z3CA+oTG30LboZG3KuiZKw
 XdXg==
X-Gm-Message-State: AGi0PubXwY1OSYuwdxPnmRspcE5q0zlpvkFyCUHvPh5mQB4mCiHO01rU
 ZnHVnhbCdFtig2td4t/My/IWGBfIUE0po7zQBPGaPNcqqmuRqR3/2USE0xFCn2qzjdKddEBRHhx
 vM8vjGBDSaK6K
X-Received: by 2002:a05:600c:29c2:: with SMTP id
 s2mr12029751wmd.111.1586871055575; 
 Tue, 14 Apr 2020 06:30:55 -0700 (PDT)
X-Received: by 2002:a05:600c:29c2:: with SMTP id
 s2mr12029726wmd.111.1586871055365; 
 Tue, 14 Apr 2020 06:30:55 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id v1sm14490755wrv.19.2020.04.14.06.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:30:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 00/12] various bugfixes
Date: Tue, 14 Apr 2020 15:30:40 +0200
Message-Id: <20200414133052.13712-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r3xz6kyq5t2h

Collection of bugfixes for 5.0.

Only vhost-user-gpu/grlib_ahb_apb_pnp patches are reviewed.

As 5.0-rc3 is tomorrow, I thought it could help to gather
them and resend altogether.

Regards,

Phil.

Mansour Ahmadi (1):
  hw/block/pflash: Check return value of blk_pwrite()

Philippe Mathieu-Daud=C3=A9 (11):
  Revert "prevent crash when executing guest-file-read with large count"
  qga: Extract guest_file_handle_find() to commands-common.h
  qga: Extract qmp_guest_file_read() to common commands.c
  qga: Restrict guest-file-read count to 48 MB to avoid crashes
  vhost-user-gpu: Release memory returned by vu_queue_pop() with free()
  hw/openrisc/pic_cpu: Use qdev gpio rather than qemu_allocate_irqs()
  hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to AHB PnP
    registers
  hw/misc/grlib_ahb_apb_pnp: Fix AHB PnP 8-bit accesses
  hw/display/sm501: Avoid heap overflow in sm501_2d_operation()
  gdbstub: Do not use memset() on GByteArray
  gdbstub: Introduce gdb_get_freg32() to get float32 registers

 qga/qapi-schema.json                    |  6 +++--
 include/exec/gdbstub.h                  | 22 ++++++++++++++++
 qga/commands-common.h                   | 21 +++++++++++++++
 contrib/vhost-user-gpu/vhost-user-gpu.c |  4 +--
 contrib/vhost-user-gpu/virgl.c          |  2 +-
 hw/block/pflash_cfi01.c                 |  8 +++++-
 hw/block/pflash_cfi02.c                 |  8 +++++-
 hw/display/sm501.c                      |  6 +++++
 hw/misc/grlib_ahb_apb_pnp.c             | 11 ++++++++
 hw/openrisc/pic_cpu.c                   |  5 ++--
 qga/commands-posix.c                    | 29 +++++---------------
 qga/commands-win32.c                    | 35 ++++++-------------------
 qga/commands.c                          | 33 +++++++++++++++++++++++
 target/arm/gdbstub.c                    |  3 +--
 target/sh4/gdbstub.c                    |  6 ++---
 target/xtensa/gdbstub.c                 |  6 ++---
 16 files changed, 136 insertions(+), 69 deletions(-)
 create mode 100644 qga/commands-common.h

--=20
2.21.1

