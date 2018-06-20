Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp752702wrq;
        Wed, 20 Jun 2018 06:12:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIqaQtUICK50SD1ig+2TVju72mmEi+ek1miSGXrDDH84x2twyMjcq4hATQ0X5+dMmJs+L8d
X-Received: by 2002:a37:5307:: with SMTP id h7-v6mr560208qkb.337.1529500338248;
        Wed, 20 Jun 2018 06:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500338; cv=none;
        d=google.com; s=arc-20160816;
        b=fl9QfZRimjWO6FiAGzYUotmf1wtbFRW4P5GjH3W4xWifMfCScD6AVV9mR8cRhexJzT
         ikOrPRtkFrKtf9gCzVxUYVXY3aSJUHBCLri0L0q5rFJlAjfM5ph+vikYFBimHb3YRjWC
         JuJ7EgcpljNzwIagfUOVt3aOwI32FfAJlqzfNKMu1NhM3L3LYctc1ZZZQeeEa/J7k+bx
         i86J8ropVpBv27l9xJmlYp2B5oPa1tpKSpiqXXV3473NwrFBjZ6TOpdn7JLXK98oAbPh
         E5JQDdTFCkOX4pY0/crn2ilJzPnDIrjCBKmSN3EHnZZAX9xOird2r3K3iT58dl/eSum6
         R0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=rj/v4TxtovWXgRUEtcAg2ansM7E5DSKwmajG5E2hIG0=;
        b=rgBJO7iNI7BMqw3BIjXJWEcZxVoyV87RjC21xuuDR4rAwMkuBcte3WzHlEixqRdS6j
         cUh/Geh5oxV1sp37uFOxdjNByEv3CUAiq0KdRhHQ+tKybmTbgpaNVsH7wwzaKFwyzyrG
         SZxy6Rz4rKYcEpyuMa/o3PKCCeJMwH0TtnYsQzM4YhmR9dhtw3tv+ySNz5jxwEkithLn
         xKK7d0W0ya3fOKUfd/JfRQfdhxuByJ2rJwIFmqUblXt6qzrzlTy3JF824K5JpRVQxMq4
         ShOwkJyTrQ5Sc4FtPDNr+R3+nWDLzK/WSe4S/XvfwLE8Dl5EJDBT17gAfuiZrttmho+A
         bHyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68-v6si2141938qkb.305.2018.06.20.06.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcuH-00080M-LB
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:12:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcpy-0004Oh-C9
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcpt-0005eT-DY
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53730 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcpt-0005eK-8N; Wed, 20 Jun 2018 09:07:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A48F94023826;
	Wed, 20 Jun 2018 13:07:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 697972026D6B;
	Wed, 20 Jun 2018 13:07:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:27 +0200
Message-Id: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 0/6] KVM/ARM: Dynamic and larger GPA size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, suzuki.poulose@arm.com, dgilbert@redhat.com,
	agraf@suse.de, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hrhn7h/UxUZc

At the moment the guest physical address space is limited to 40b
due to KVM limitations. [1] bumps this limitation and allows to
create a VM with up to 52b GPA address space.

With this series, QEMU creates a virt VM with the max IPA range
reported by the host kernel or 40b by default.

This choice can be overriden by using the -machine kvm-type=<bits>
option with bits within [40, 52]. If <bits> are not supported by
the host, the legacy 40b value is used.

It is an RFC as [1] is not upstream. This is not material for
QEMU 3.0 due to the kernel dependency. Also the EDK2 FW has a
fixed limit at 40b PA. Note at the moment there is no device or
RAM laid out after 1TB (40b) in virt machine model address space.
This will be addressed in a separate series.

Best Regards

Eric

kernel dependency:
[1] [PATCH v2 00/17] kvm: arm64: Dynamic & 52bit IPA support
https://lkml.org/lkml/2018/3/27/437
For testing, use my kernel branch:
https://github.com/eauger/linux/tree/4.16.0-rc3-Suzuki-52b-IPA-v2

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-ipa-rfc

Tests:
- On Cavium Gigabyte, a 48b VM was created.
- Migration tests were performed between kernel supporting the
  feature and destination kernel not suporting it

Eric Auger (6):
  linux-headers: Partial update for KVM/ARM
    KVM_ARM_GET_MAX_VM_PHYS_SHIFT
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_get_max_vm_phys_shift
  hw/arm/virt: Add virt-3.0 machine type
  hw/arm/virt: support kvm_type property
  hw/arm/virt: handle max_vm_phys_shift conflicts on migration

 accel/kvm/kvm-all.c           |   9 +++-
 accel/stubs/kvm-stub.c        |   5 +++
 hw/arm/virt.c                 | 102 +++++++++++++++++++++++++++++++++++++++---
 hw/ppc/mac_newworld.c         |   2 +-
 hw/ppc/mac_oldworld.c         |   2 +-
 hw/ppc/spapr.c                |   2 +-
 include/hw/arm/virt.h         |   3 ++
 include/hw/boards.h           |   2 +-
 include/sysemu/kvm.h          |   1 +
 linux-headers/asm-arm/kvm.h   |  15 -------
 linux-headers/asm-arm64/kvm.h |   6 ---
 linux-headers/linux/kvm.h     |   6 +++
 12 files changed, 124 insertions(+), 31 deletions(-)

-- 
2.5.5

