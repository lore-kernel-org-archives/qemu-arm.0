Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8499328wrx;
        Fri, 8 Mar 2019 07:25:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7g9vuSrzqfQZhOx9gaaT7hzdCf4DlOCJCnLSd5tr6RY0LAjIeN2EU9t1Isfbog7BKhax0
X-Received: by 2002:a25:bf82:: with SMTP id l2mr16605874ybk.15.1552058742460;
        Fri, 08 Mar 2019 07:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552058742; cv=none;
        d=google.com; s=arc-20160816;
        b=MhBAU4SYyP9zI+VIEVxWP17Bn/8pYPFb+ePDEAgYcfHQPrcHjHcXTGSSAeF/AhHLhy
         KXWZa3EJ3GMDJdHealcHaSL+frH1tKqHViVgnTDUTf0ANivFda8gKtfpy+IWsEMgZR+X
         LS2dZ9v10RGwmEuqUD2xJAFeDqH9+fRb/awYG5fbNpU1AXac0qEcTKVy2kRcYyb60sUW
         cnOyprPrX48RBvQbP0vr6UdJd+ytgMKbcqrT47HJmDutfh8a26TFTVmp2BJKmrX8tJ7n
         yapkuu4mY0o7g0uOj79G7oVj9h5lRoeNCAAwTdOwzv1wz4eYpKOzT5mQoayisE1wlv2O
         9RSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=2pm8KxTIkawOuxV37zvCD91Bb7vALx0+xJ6kszj7Bdw=;
        b=sOljkQmEHgtmrase7WJ5c7QeemlcDAXqq+RIuvXMRZlQwEcIFvBzpi444zAAd1dFHB
         JyTLd+elNEUfOwyWgFObs3oU8tvYqnkrdVNdGLkPclZYHobJtEKfOXgnBuVpfJe5jEtL
         lo1UPXlFlxXrEGpZ0oCFGoxTQpM3u3/xeAJ0GCxqGhIi17nyEUKKom29g8VmpQeD8UP4
         HHqkJX0DzpLIrVNoCT0T7HghHamK+y0LH4ggT2md8fGfpOCoCm33HM56FvKT7NwKePUW
         7JAe6/0SYdglDkbljrp7tUhp7g+5uOQZDkazgq7aEvNQlLOLvD1FXvFByOTO4cka8974
         HtVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v79si4898540ywa.260.2019.03.08.07.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 07:25:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2HNV-0001AT-Rk
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 10:25:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HNM-0001AB-6a
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 10:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HNL-0003Is-C3
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 10:25:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2HNL-0003C2-60; Fri, 08 Mar 2019 10:25:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C89AC05D3F4;
	Fri,  8 Mar 2019 15:25:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC0485D704;
	Fri,  8 Mar 2019 15:25:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, pbonzini@redhat.com, ehabkost@redhat.com,
	richard.henderson@linaro.org, sbhat@linux.ibm.com, philmd@redhat.com
Date: Fri,  8 Mar 2019 16:25:09 +0100
Message-Id: <20190308152511.10882-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 08 Mar 2019 15:25:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/2] machine: Move nvdimms state into struct
 MachineState
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +AdJuRFR9pyc

As NVDIMM support is looming for ARM and SPAPR, let's
move the acpi_nvdimm_state to the generic machine struct
instead of duplicating the same code in several machines.

nvdimm and nvdimm-persistence become generic machine options.
They become guarded by a nvdimm_supported machine class member.

Best regards

Eric

https://github.com/eauger/qemu/tree/nvdimms_state_v3

Eric Auger (2):
  nvdimm: Rename AcpiNVDIMMState into NVDIMMState
  machine: Move nvdimms state into struct MachineState

 hw/acpi/nvdimm.c        | 18 ++++++------
 hw/core/machine.c       | 65 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c    |  6 ++--
 hw/i386/pc.c            | 57 ++++--------------------------------
 hw/i386/pc_piix.c       |  4 +--
 hw/i386/pc_q35.c        |  4 +--
 include/hw/boards.h     |  2 ++
 include/hw/i386/pc.h    |  4 ---
 include/hw/mem/nvdimm.h | 10 +++----
 9 files changed, 93 insertions(+), 77 deletions(-)

--=20
2.20.1

