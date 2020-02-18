Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5625549lfp;
        Mon, 17 Feb 2020 18:04:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhnTIbMnOrC0Wij0Q156Jl4s2SvtZiByAed7TOnQ16ocToQDVUFPmSDZFgjNdyRbSlVXb6
X-Received: by 2002:ac8:1835:: with SMTP id q50mr14946095qtj.210.1581991484919;
        Mon, 17 Feb 2020 18:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581991484; cv=none;
        d=google.com; s=arc-20160816;
        b=wNayujOVHSVvYeUpLIg+v/72+DnRFoE1L6jqbOwvpXatPmlKg7/vlcna8NKojvlUXy
         KvP5v9498NrEjSAhkUhg+pAwvWjQ/PqOLa8PPkCthphpwp2zKgV4ky9cUaImSxX97TML
         3Yh2E4PXkhD7lZu0D0wZCqJMtGy1NiVM8UtoBXXsNtjr2x2AYULnLnEx8NO6ktHfd9aY
         suLUFUKiPBX3anh0fivInLprKudvskb7cYtXVRI3xEJo9q8QstJpaabsuoeWMeweyTSo
         9BHZ0O2sOpM+4BDGTiKaXVXvcFEb/DIvseLPBsGwVxLL0a6DH6qASdDNj6zaLEa2Pscg
         2dBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yCHoUPvzYBVp9PdCimEQIUn/yQd6c7EaoL443PlojAI=;
        b=AVjR0YWavJQWh5K1f44WNbNS5d942wcLrb6MWx8na0yV6l23r+aI90o84j4ruetrm4
         I32fXIrzVb8/COKlLeYRb7Z3l+n3TL+F5xQNjc5wgdM2kJhUGfLs+onsOD8ZWYfb2uWZ
         o1b2CihpPpXZuQGfr4UugRYvrVORGHgxG5X3bZi01cu1+WoUZiDmg+cewiiYuuynigqv
         BT3PfnNN8Ytkbi1Qg6htrUuBsMbdBC4/MppdKJJFR24FqhSrIhd24X8O9+tPTWp19dEB
         NHjTlUZvyJlLB+TF1DP2uup2GiN1ou7YcZBbRkk5d4y0sZDtHKAPzysY1Qybj1UDYOZg
         zS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i5sAe4Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si1055468qto.310.2020.02.17.18.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 18:04:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i5sAe4Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3sFg-00043m-Bs
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 21:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j3sFY-00043X-Nu
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 21:04:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j3sFW-0007Pr-TP
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 21:04:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j3sFW-0007PV-Ow
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 21:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581991473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yCHoUPvzYBVp9PdCimEQIUn/yQd6c7EaoL443PlojAI=;
 b=i5sAe4TfxQO6QJzoP59e9YSWUi6vlMckMgA+5KmMz2bk1+LPjtvks6BSwszny4vjyXy2MD
 fakESI7hPhe02rxbNhi6D82v8AnTz0RBzAp6WRyo4GZdRH2oAjxD2OULP7XWooPNxu4ZqL
 /TY3PlBsh0zOX0RW2bJSNpcalBBv0y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-WQZxT-XiOJ2wV86sunPeDQ-1; Mon, 17 Feb 2020 21:04:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D8E13E4;
 Tue, 18 Feb 2020 02:04:29 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-110.bne.redhat.com
 [10.64.54.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3535A1BC6D;
 Tue, 18 Feb 2020 02:04:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] hw/arm/virt: Simulate NMI Injection
Date: Tue, 18 Feb 2020 13:04:13 +1100
Message-Id: <20200218020416.50244-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: WQZxT-XiOJ2wV86sunPeDQ-1
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
X-TUID: GyjTHLxcCw/K

This series simulates the behavior of receiving NMI interrupt for "virt"
board. First of all, a new interrupt (SError) is supported for each CPU.
The backend is either sending error events through kvm module or emulating
the bahavior when TCG is enabled. The outcome is SError or data abort is
raised to crash guest. In the mean while, the virtual SError interrupt is
also supported, but there is no users yet.

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
v4:
   * Correct the flag in arm_cpu_has_work()               (Richard Henderso=
n)
   * Check CPU_INTERRUPT_SERROR in arm_cpu_exec_interrupt()
     and arm_v7m_cpu_exec_interrupt()                     (Richard Henderso=
n)
   * Introduce ARM_CPU_NUM_IRQ to make the code of initializing
     the CPU's inbound IRQ lines atomic                   (Richard Henderso=
n)
   * Correct comments about ARM_CPU_IRQ                   (Richard Henderso=
n)
   * Update ISR.EL1 with SError state                     (Gavin Shan)
   * Include SError state during migration                (Gavin Shan)
   * Added PATCH[2/3] to support VSError injection        (Marc Zyngier)
v3:
   * Support SError injection for aarch32                 (Richard Henderso=
n)
   * Export the SError injection through IRQ line         (Peter Maydell)
   * Removed RFC tag as it seems in correct track         (Gavin Shan)
v2:
   * Redesigned to fully exploit SError interrupt

Gavin Shan (3):
  target/arm: Support SError injection
  target/arm: Support VSError injection
  hw/arm/virt: Simulate NMI injection

 hw/arm/virt.c                      |  34 ++++++++-
 hw/intc/arm_gic_common.c           |   3 +
 hw/intc/arm_gicv3_common.c         |   3 +
 include/hw/intc/arm_gic_common.h   |   1 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 target/arm/cpu.c                   | 113 ++++++++++++++++++++++++++---
 target/arm/cpu.h                   |  23 ++++--
 target/arm/helper.c                |  30 ++++++++
 target/arm/internals.h             |  10 +++
 target/arm/m_helper.c              |   8 ++
 target/arm/machine.c               |   3 +-
 11 files changed, 208 insertions(+), 21 deletions(-)

--=20
2.23.0

