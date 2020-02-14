Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1498474lfp;
        Thu, 13 Feb 2020 22:00:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNPGPgYa3lkoewbCyH0JkwYyrvBjb7qPWmA33UPdxqUKMpxkaBggIS27UgjXUlkcLamdwp
X-Received: by 2002:a37:7245:: with SMTP id n66mr1114643qkc.202.1581660017598;
        Thu, 13 Feb 2020 22:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581660017; cv=none;
        d=google.com; s=arc-20160816;
        b=ylfXESnhIFe4J+Kx/KTIl7qyBbqd0TeQNENKhsg1mWzRpQK7w3aZQtOm3oCN2QAOcg
         6LvSIGvfelpC7GBREft1rKuWUtZ3mL5iT+q3rgjvGBCyTbNwEx6/osELCbxSZG0AnHaJ
         LEJDWQR3ZziIPbF9OmPfKWStALBLk5wy6uS447xg4kJS+oGDhWu/s9GSUxSceE4jPppf
         plJhHLETYILIFMg2cdyE4MQnZBrWbFSbq59Z27Xat0+nibgitmXb5Kj2RWCJwfLyLxuz
         xPe3oG6SRefAJKIomsTpxABdpo14o3rspXP7h5qELw7fIttk0ddGUpLNI8GD8cXdWC1J
         Fqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=k17MgG0DMNlivzXLB/4xrLFHebz8qedy1MC8AxtAf74=;
        b=jCrcxQuJ95Tcl4sKUV5sdzzx+Ybnp64HGs9D9hWEodi8AIC2zRYt/WA1rO44pZVjBo
         KjUg/dq9TajiAdV6FEQL/bqINdd9KWMhjzQJIFjgHPlv9w0OovsgiiDnYIzZubEN0B3y
         GihG7zJOAhMUnfywnUGOhhSe9Z/fgFLwLTTuFBq3Xof2p+fuQPleaTTNEybiZCC9eUUH
         A1/h4QZgbRLmub1NaAQrpCVAVxqXclamV71FqVtEvAdfhRxOrtm7MjhuhKimNST7qOOq
         9qI8QfoGBDosDpG/TrkGg53HsV91YhfmI2wjwK4qOuLPtxuLLw1yGN4u6hAKGydUx4Q9
         le5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jHNBDR0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si2345630qkk.353.2020.02.13.22.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 22:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jHNBDR0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2U1R-000801-0l
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 01:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j2U1H-0007zk-Rg
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:00:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j2U1F-0005BH-VL
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:00:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23271
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j2U1F-00059p-P9
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581660004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k17MgG0DMNlivzXLB/4xrLFHebz8qedy1MC8AxtAf74=;
 b=jHNBDR0TPohGWy+bHMnosDJPhvqECuJiXhCupwxIR4SAtG1DBU4+HiDPiHIbJ69VS1GHs9
 nN0TRK9MIFWT1U3ztRgyKTVd5lkMZljOHlXsl6pxQeH/O5sPwYJOTv1jSWEzYE3pTMIFi/
 Iyfjx64t5NeCcql8YaQ9im21MNvfvVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-VEKe6VICNtqezMQTwUAdMA-1; Fri, 14 Feb 2020 01:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236F8101FC62;
 Fri, 14 Feb 2020 06:00:01 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-93.bne.redhat.com
 [10.64.54.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99AD81001B30;
 Fri, 14 Feb 2020 05:59:54 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/virt: Simulate NMI Injection
Date: Fri, 14 Feb 2020 16:59:48 +1100
Message-Id: <20200214055950.62477-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VEKe6VICNtqezMQTwUAdMA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, richard.henderson@linaro.org,
 eric.auger@redhat.com, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+4eJc8G+Sic

This series simulates the behavior of receiving NMI interrupt for "virt"
board. First of all, a new interrupt (SError) is supported for each CPU.
The backend is either sending error events through kvm module or emulating
the bahavior when TCG is enabled. The outcome is SError or data abort is
raised to crash guest.

For GICv2 or GICv3, a new IRQ line is added for each CPU and it's connected
to the (above) introduced SError interrupt. The IRQ line of CPU#0 is raised
when HMP/QMP "nmi" is issued, to crash the guest.

Testing
=3D=3D=3D=3D=3D=3D=3D

After the HMP/QMP "nmi" is issued in the following 4 environment, the guest=
 is
crashed as expected.

   Accel     Mode                  Crashed    Parameter
   ------------------------------------------------------------------------
   kvm       aarch64               yes        -machine virt -cpu host
   kvm       aarch32(cortex-a15)   yes        -machine virt -cpu host,aarch=
64=3Doff
   tcg       aarch64               yes        -machine virt -cpu max
   tcg       aarch32(cortex-a15)   yes        -machine virt -cpu cortex-a15

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
v3:
   * Support SError injection for aarch32                 (Richard Henderso=
n)
   * Export the SError injection through IRQ line         (Peter Maydell)
   * Removed RFC tag as it seems in correct track         (Gavin Shan)
v2:=20
   * Redesigned to fully exploit SError interrupt

Gavin Shan (2):
  target/arm: Support SError injection
  hw/arm/virt: Simulate NMI injection

 hw/arm/virt.c                      | 34 ++++++++++++++-
 hw/intc/arm_gic_common.c           |  3 ++
 hw/intc/arm_gicv3_common.c         |  3 ++
 include/hw/intc/arm_gic_common.h   |  1 +
 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/cpu.c                   | 69 ++++++++++++++++++++++++------
 target/arm/cpu.h                   | 17 +++++---
 target/arm/helper.c                |  6 +++
 target/arm/m_helper.c              |  8 ++++
 9 files changed, 122 insertions(+), 20 deletions(-)

--=20
2.23.0

