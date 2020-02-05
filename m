Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6149918lfp;
        Tue, 4 Feb 2020 19:12:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxr1OIi+dMMtk6m27xq0yrMeAr5l9x0dPq++YNosqcQdiWzeex/nbsQXbhwsvTuEkUGM/l8
X-Received: by 2002:a0c:fac8:: with SMTP id p8mr30835416qvo.47.1580872374732;
        Tue, 04 Feb 2020 19:12:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580872374; cv=none;
        d=google.com; s=arc-20160816;
        b=VYpE7CLMLVuky+sKXzMIMCqwPl5kFi4qTFtN6T3ywg+B21mSdhlAEwB2HDIga4W5Nw
         EO/r9aIgjw34CH4fy24pnywb9bA2n2GrP/jkBBeBzZ6qwQ5Lc+dRFPFGEvLwIJfrdLq1
         DS5OrlCmraJdzcoeFwen5HvFmtxpkR4ALlq4uNbIdFI473xpdjkoqvnIfSRofSoX3sUH
         rH+3wbWHNS6UYE2FuaXmvAXh9gZfBPzslbFvSm70fV5VAdSWGhU0NaGxr08gR7tU8dhp
         DhdpugWhVcAJA74dKw9olRKyiOGWgAFZLy+iAkxI8C69fSUE7Kpu0ze7SHObcmgiU2QQ
         6mkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qh2lAYN9mfnlZ3ypiOWt9zSlEsUPgnszltHhu5G8D08=;
        b=elo883+89MlaptZk+GgDcGUg0giNIPiAAChRojur0Ksb1LumGMpr0fMLSAvTloJ5Ar
         +dr+b9IgBZbna6SXG4m+gnn7uAN66MPQRNGT2/b7BR7lPqsczGY+3fgVejg4+UUe2e0K
         jQZJsHp3srYtezVk/u6BZTFGOHBxXsVLDPbRgEUr/fcDS6yQ4N3tEGQ1qxxwH9yFJ81x
         DM0ojn2vT8oYeD3unyhLyk4MkEbqx+mD54EHBP4iQIg+TpfVO2J9EsVoue228FMnOIdL
         dYHYB/F7Rb9P2qVeLhPWct30CRJO57lIbqDshLQE13uT5hFsudfKVNntbn/juw+OW2Pw
         6U7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WysVCNA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si14005868qtr.368.2020.02.04.19.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 19:12:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WysVCNA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izB7W-0005Hk-5A
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 22:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izB7O-0005Ez-FR
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izB7M-0003ED-0M
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21007
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izB7L-00039A-Jp
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qh2lAYN9mfnlZ3ypiOWt9zSlEsUPgnszltHhu5G8D08=;
 b=WysVCNA7dj63JIsiRlxATuhdBecPuxhVNnQhsgEbB9xv0u0eKZc2fpoO/MDKy9yvhICM0r
 ao4ve6HsHlSLoueeFTUXz7glayke5PLvm/yx4v47UY6hbmOESwOI/z60y9FmLp6Kn0Z4fQ
 Ponj04lOvCJVmTIJMxIdk9v4ZHG8i20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-BJ0emUVHMQePEzf_hckHfw-1; Tue, 04 Feb 2020 22:12:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EAFC1137849;
 Wed,  5 Feb 2020 03:12:39 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-74.bne.redhat.com
 [10.64.54.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F95F811F8;
 Wed,  5 Feb 2020 03:12:33 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH v2 0/2] Support NMI Injection
Date: Wed,  5 Feb 2020 14:12:25 +1100
Message-Id: <20200205031227.24355-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BJ0emUVHMQePEzf_hckHfw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZ8nORkhlmO8

This intends to support HMP/QMP "nmi" command. When it's issued, the
SError interrupt is injected to the guest. The guest is expected to
crash with it. The behavior is similar to x86: NMI is injected to
guest as error indication. The guest possiblly crashes and reboots
with the injected NMI. Note that the functionality is currently
supported on "virt" machine and {"host", "max"} CPU models only.

PATCH[1/2] allows to inject SError interrupt, which will be used by
the subsequent patch. PATH[2/2] injects SError interrupt when "nmi"
command is issued. With that, the guest is expected to crash and
possiblly reboot.

Testing
=3D=3D=3D=3D=3D=3D=3D
Start linux 5.5 guest with "virt"+"host", or "virt"+"max". The
guest crashes and reboot if "/proc/sys/core/panic" had been configured
properly, after "nmi" command is issued. The following error message
is given on "virt"+"cortext-a72": "Error: NMI injection not supported"

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
v2:
   * Redesigned to fully exploit SError interrupt

Gavin Shan (2):
  target/arm: Allow to inject SError interrupt
  target/arm: Support NMI injection

 hw/arm/virt.c          | 18 +++++++++++++
 target/arm/cpu-qom.h   |  1 +
 target/arm/cpu.c       | 59 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h       | 12 ++++++---
 target/arm/cpu64.c     | 25 +++++++++++++++---
 target/arm/helper.c    |  4 +++
 target/arm/internals.h |  8 ++++++
 7 files changed, 120 insertions(+), 7 deletions(-)

--=20
2.23.0

