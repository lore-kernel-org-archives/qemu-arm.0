Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4980170wrm;
        Mon, 21 Oct 2019 12:07:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdsyI6otiZYt4BLZsheHOyvrJ8x+ETKS0CoitU9fcVZswYwyiLC3VsTBPaxGNZT6jrbsJu
X-Received: by 2002:a17:906:1c48:: with SMTP id l8mr8272070ejg.203.1571684845429;
        Mon, 21 Oct 2019 12:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571684845; cv=none;
        d=google.com; s=arc-20160816;
        b=qKvkIZhK2Nb7lv+jjK7TGT2oJm+XH5QtftRTt1uWxADR0+Lv7X5DBSnlHdseiMuGCq
         YGXAFTmAwo3/fSaf+DaiMXFCte4Hb4Uaw3qldrwdNmkRVgIp4bmKyBAl9iYVsFoGSRiz
         q73/WLC5iYgwPL5aMq7lVYF4Lzs5TGd5hh3mJW8YlXuNsD/XeettbdDCbsiqeEb4iHbQ
         3xY3+qN4kKmGIrr19snMgXGuqAcuifO1AViIA96/e3uAkTcbQ0cpQCh58CSa2CLnAFcM
         b7bLy4XBJ0WnScaPt/z8C32yPc7c/T+JxJKuw6y75yrySa+xfaI5hnR3OakhCSFfS5vX
         U8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=x6WSQf++IXMV4lLVOQZRebwL1vu/eSofy5b/RT7dHT4=;
        b=UcXXDX7uLKNZ0qBfOBhhBgiqdduGJ/EvaUGZacq3CkU52U8PC4rTWB1tie56UNLsAp
         mH+bLQKtwxOYJIVTVHGgE/42UX8Fus1cB4fJqTMjeEfECJUahirBv9ODV1riLJl0uoLj
         kpAp3f8WEI4qQK17iBvY+2jDG98qYIIQ4q2T1WsTWe9QVDw/Ksh0bFpdUktlLgBur1od
         83CseuCQ55nxTMkkqjzw99urmJXy1UGVr64H7uSOVgUPowjU4WSBg6TR7ZpZvSOR9spB
         W2joFOGCIBkkOXxzXDuUheAyBKOocue8jgp6PIMGnrV6pM/44B9CtsgzD2fIJRGpck/x
         iXeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2KwOzWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26si10157709ejl.292.2019.10.21.12.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 12:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2KwOzWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMd1X-0003kn-Sk
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 15:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1K-0003ka-Ep
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1I-0001pa-Ue
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44179
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1I-0001pC-EB
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x6WSQf++IXMV4lLVOQZRebwL1vu/eSofy5b/RT7dHT4=;
 b=Z2KwOzWa3kRyK5C0AdW+504AxT3W+Kmob6NeJ3nelJRB7/C23si8+gLjNofWscmRyvFqa9
 7+qVOncH9h/NTWIlzclDeTyYRIwEX9EaGqdKSxbbLqS2+/bZF0b3mpWhCGDy0ea5EIGhTl
 MaXoF40HXFP4UrvKK6ch11h5RlOyF1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Bm8gS4xrN0WTstTyGhgVFA-1; Mon, 21 Oct 2019 15:07:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C286800D41;
 Mon, 21 Oct 2019 19:07:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8110196AE;
 Mon, 21 Oct 2019 19:06:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/6] hw/arm: Create the RAM in the board
Date: Mon, 21 Oct 2019 21:06:47 +0200
Message-Id: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Bm8gS4xrN0WTstTyGhgVFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1ALBWoyqU5v

Hi Peter,

This series contains the ARM patches extracted from the
"Let the machine be the owner of the system memory" series [1]
reviewed by Richard.

These are cleanups moving the creation of the system ram at
the board level. The other series will enforce
memory_region_allocate_system_memory() get called with a
MachineState argument, this preliminary cleanup is required.

Regard,

Phil.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg05085.html

Philippe Mathieu-Daud=C3=A9 (6):
  hw/arm/xilinx_zynq: Use the IEC binary prefix definitions
  hw/arm/mps2: Use the IEC binary prefix definitions
  hw/arm/collie: Create the RAM in the board
  hw/arm/omap2: Create the RAM in the board
  hw/arm/omap1: Create the RAM in the board
  hw/arm/digic4: Inline digic4_board_setup_ram() function

 hw/arm/collie.c       |  8 ++++++--
 hw/arm/digic_boards.c |  9 ++-------
 hw/arm/mps2-tz.c      |  3 ++-
 hw/arm/mps2.c         |  3 ++-
 hw/arm/nseries.c      | 10 +++++++---
 hw/arm/omap1.c        | 12 +++++-------
 hw/arm/omap2.c        | 13 +++++--------
 hw/arm/omap_sx1.c     |  8 ++++++--
 hw/arm/palm.c         |  8 ++++++--
 hw/arm/strongarm.c    |  7 +------
 hw/arm/strongarm.h    |  4 +---
 hw/arm/xilinx_zynq.c  |  3 ++-
 include/hw/arm/omap.h | 10 +++-------
 13 files changed, 48 insertions(+), 50 deletions(-)

--=20
2.21.0

