Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3572959wrb;
        Tue, 9 Jul 2019 04:38:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykhEW+5pXN7ue1zbJPEszS2qmWCYl8X0VdY3u8mS3OHLDNphmjvBkoBhS8bVmQfsYmBf9b
X-Received: by 2002:a05:6402:1212:: with SMTP id c18mr7448755edw.7.1562672298369;
        Tue, 09 Jul 2019 04:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562672298; cv=none;
        d=google.com; s=arc-20160816;
        b=M99AkU8QOiAEMipxZNXBj+GfDJ/ueTIqzCVdmEqFEgAeIJgSScYcVTOyytbbkL/+Uo
         U3f/5jA/ojHereXnz5w5AKeImsVQzkqE+cIXupWz5gBsCGFvXwKUmiOY3opZmk2N1rHb
         OGc6Z7v1olrLGO9MDf9QdRXPOAnjUADzBycSydkAhnp9WG+67CzeZV/SoJeKsVAql2uJ
         Q0BuYD3wlkgzJslH1zg0+JAnaHBZKptbjIdh247Ham/f21ZvxaWE4OYGSAgiEZwSLM4U
         4oTPWqJKX1Fjyxi2gJwgkX3nqXA13UeT8HAwAjYVyKrLhRdoc9+iJxxGUUiYEMAf2AKY
         YS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=SFKGIpR4xP1WB4MxgsgdxCZ/R6SWO5pUtQH/8R3D+U0=;
        b=HOcJuoIVcmfDK9KPbNIDvv7Ulqa5K8zXIknQ9BPVuCbDUNxc4SRmCpHVfsPLjjS1Kz
         m35Dz8ltgA9SR3uTnuE1ZoS+3Zm08fe25oNoPddPrPFO8ISX87hvI5jNHLUbk1FvdO0d
         EC+IJfUElF9+sM6FKZ+a25s2CwXc1PUDSFZjVtC04ySKIxKPwy5HxIKCbzV+MXR6JZL+
         lCNxFuKtD87ON4FR5BcifRXpyB/vSZB7+pUPMS4K3gbp+DX6+V3fZxmQL+j47fquguPu
         0BdRbA8GbAOUEJrspPcuGp3EZ40BlDPQ0CC8R3Zz4dXO+y6vFtsvxXDELtRxDwQ4WXqN
         msmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rk18si12810113ejb.366.2019.07.09.04.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 04:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkoRt-0004gs-GI
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 07:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkoR4-0004TP-RY
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkoR2-00075q-Vk
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:37:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkoR1-00074G-Ua; Tue, 09 Jul 2019 07:37:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C49BB308339E;
 Tue,  9 Jul 2019 11:37:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B9592D2C;
 Tue,  9 Jul 2019 11:37:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 13:37:12 +0200
Message-Id: <20190709113715.7761-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 09 Jul 2019 11:37:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 0/3] hw: Avoid crash when reading empty
 RX FIFO
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sju8MaA/sjN/

Fix a pair of crashes, one is an audit of first one.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/ssi/mss-spi: Convert debug printf()s to trace events
  hw/ssi/mss-spi: Avoid crash when reading empty RX FIFO
  hw/display/xlnx_dp: Avoid crash when reading empty RX FIFO

 Makefile.objs        |  1 +
 hw/display/xlnx_dp.c | 15 +++++++++++----
 hw/ssi/mss-spi.c     | 31 +++++++++++++------------------
 hw/ssi/trace-events  |  6 ++++++
 4 files changed, 31 insertions(+), 22 deletions(-)
 create mode 100644 hw/ssi/trace-events

--=20
2.20.1

