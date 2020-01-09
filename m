Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2263009lff;
        Thu, 9 Jan 2020 07:21:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK9q/qZyJ0dcB41YNdhlrjlNepcarAW4URYwr8D5v4HnZpstPAMJBAFk9VK0kPnrEr/2pG
X-Received: by 2002:a9d:6557:: with SMTP id q23mr8466477otl.368.1578583314390;
        Thu, 09 Jan 2020 07:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583314; cv=none;
        d=google.com; s=arc-20160816;
        b=W5sLmfoXhGq33CDoCx8uJgLiaVoMZ90yg8Vk63E4yqKYvumNg4LdZLLCm/ZPhv0SID
         0zEweOzV75om3fuN+CDZmBM8FHueTj6PKNKLoV1Ge9ZQcQv7dXIwV2u6w5mnbFey7O2C
         fggD0NnXGKKCCH6mZR6CvU6ffKsVUTwW+xVzIufv5IP9wfIc+wm17dBrzZ1aFXMw64vy
         GuMrZPCb01QxwwyCjfPbpPHkG4AG2WYDl4aA1EYG1TzFE/15w4kXf1tod+/5FFuGD6YP
         cQSwzJmYZE2sd1uAAaU35VgkE65WRvlAttThr1WrmxG+hK81ubrOZN2MSLN3Hh/e3IFu
         KOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P5RGdQrGsYtgUOKj0M4myzDzBUaBMtcy1aS0kbUYf64=;
        b=lG2K9IEY+DlZniYVfIUDSMVNR8c2xGnk1450oIANzPg7R1NxILMCOXcsKo+DE42dTA
         iv521BRpDD+85/4pzwG9m6vQhM0CLSFFHSQLjtKe83IsUDVfY/DlmKPsbNMTHbIB0SK2
         wvtuQce2TPLC5ZJv2cxId25Vbgmt7qbJ/58J0nUam2ky39SQCdLNyjFYPWvYy1vx3+qK
         D/HIc9ll/0ZSm21DYi8vQgLIiYu7ZV9+uavr3YfrMqEoyI6RyYSMwLgzDjShH39ygzMN
         hRABd6hkUohv0kBj2VkYA+koFIIn60DKEsHW3vPx+ysL9wmQ7vlyDTbUXD4a6ubR77IT
         /FMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlRgdg4L;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.21.54;
        Thu, 09 Jan 2020 07:21:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlRgdg4L;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbgAIPVx (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:21:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28988 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727945AbgAIPVx (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 9 Jan 2020 10:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=P5RGdQrGsYtgUOKj0M4myzDzBUaBMtcy1aS0kbUYf64=;
        b=HlRgdg4L1OFxKuK1oL71gdPD2nLs5sEInQxTz/meMDlxcrBIgjIpGc5/87km2Q6QcKMaX6
        8tNR0boKB1PbNvm/vL7rZqs6Bquv9gU6Dn07jOadxA4vMJPb5hB5mO99TQrft2gxW9jXA5
        z7GY2FgOBhmKjwdp4kaglMzZYpyw1LA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Z6-I5PgHMWWbDGkeCQozUg-1; Thu, 09 Jan 2020 10:21:48 -0500
X-MC-Unique: Z6-I5PgHMWWbDGkeCQozUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD758C2BE1;
        Thu,  9 Jan 2020 15:21:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F14D27FB5C;
        Thu,  9 Jan 2020 15:21:36 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>,
        Juan Quintela <quintela@redhat.com>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        qemu-ppc@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 00/15] Replace current_machine by qdev_get_machine()
Date:   Thu,  9 Jan 2020 16:21:18 +0100
Message-Id: <20200109152133.23649-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZRw3Iv9WQEJ3

Blurb from previous question [1]:

  "hw/boards.h" declare current_machine, and vl.c defines it:

    current_machine =3D MACHINE(object_new_with_class(OBJECT_CLASS(machin=
e_class)));
    object_property_add_child(object_get_root(), "machine",
                              OBJECT(current_machine), &error_abort);

  The bigger user of 'current_machine' is the accel/KVM code.

  Recently in a0628599f..cc7d44c2e0 "Replace global smp variables
  with machine smp properties" we started to use MACHINE(qdev_get_machine=
()).
  Following a0628599f..cc7d44c2e0, a5e0b33119 use 'current_machine' again=
.

  qdev_get_machine() resolves the machine in the QOM composition tree.

Paolo answered [2]:

> I would always use MACHINE(qdev_get_machine()), espeecially outside
> vl.c.  Ideally, current_machine would be static within vl.c or even
> unused outside the object_property_add_child() that you quote above.

Let's remove the global current_machine.

I am still confused by this comment:

  /* qdev_get_machine() can return something that's not TYPE_MACHINE
   * if this is one of the user-only emulators; in that case there's
   * no need to check the ignore_memory_transaction_failures board flag.
   */

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg669475.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg669493.html

Philippe Mathieu-Daud=C3=A9 (15):
  target/arm/kvm: Use CPUState::kvm_state in kvm_arm_pmu_supported()
  hw/ppc/spapr_rtas: Use local MachineState variable
  hw/ppc/spapr_rtas: Access MachineState via SpaprMachineState argument
  hw/ppc/spapr_rtas: Restrict variables scope to single switch case
  device-hotplug: Replace current_machine by qdev_get_machine()
  migration/savevm: Replace current_machine by qdev_get_machine()
  hw/core/machine-qmp-cmds: Replace current_machine by
    qdev_get_machine()
  target/arm/monitor: Replace current_machine by qdev_get_machine()
  device_tree: Replace current_machine by qdev_get_machine()
  memory: Replace current_machine by qdev_get_machine()
  exec: Replace current_machine by qdev_get_machine()
  accel: Introduce the current_accel() method
  accel: Replace current_machine->accelerator by current_accel() method
  accel/accel: Replace current_machine by qdev_get_machine()
  vl: Make current_machine a local variable

 include/hw/boards.h        |  2 --
 include/sysemu/accel.h     |  2 ++
 accel/accel.c              |  7 +++++++
 accel/kvm/kvm-all.c        |  4 ++--
 accel/tcg/tcg-all.c        |  2 +-
 device-hotplug.c           |  2 +-
 device_tree.c              |  4 +++-
 exec.c                     | 10 ++++++----
 hw/core/machine-qmp-cmds.c |  4 ++--
 hw/ppc/spapr_rtas.c        |  6 +++---
 memory.c                   |  6 ++++--
 migration/savevm.c         | 10 +++++-----
 target/arm/kvm.c           |  4 +---
 target/arm/kvm64.c         |  4 ++--
 target/arm/monitor.c       |  3 ++-
 target/i386/kvm.c          |  2 +-
 target/ppc/kvm.c           |  2 +-
 vl.c                       |  6 +++---
 18 files changed, 46 insertions(+), 34 deletions(-)

--=20
2.21.1
