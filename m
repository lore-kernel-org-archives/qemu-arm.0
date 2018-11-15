Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7192018wrw;
        Thu, 15 Nov 2018 08:11:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5eFsMpo5YpMLaFgprKR8IY6CRZ/Spzz+i9InYW91GMtYbN4TEw5O+AaMF4rBYIZX7PQazGl
X-Received: by 2002:ac8:2502:: with SMTP id 2mr6618082qtm.53.1542298271260;
        Thu, 15 Nov 2018 08:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542298271; cv=none;
        d=google.com; s=arc-20160816;
        b=HtQeZiZwHyUXEqNAoUKCRiPa4uJ5M/39e5w1siaJukfWDuHQPKrKoQ0D7uhy9BHe3d
         LAtG5jf47GouxrQR5XLSYB+5XEBaS+fa85Cgp+E8whkw2h6uhfgcifHwlBAAW4kvlWGP
         /0+BlsIuTC3ReEQoa0KXDZLgp9PHObqC9BDzVYvQl6aoEPO5STbeGvcnHZasUSE8IeXt
         7JOjQtXUCb1xDULf6huf7Uw/uIcT2xkMcxhlzjdejGME2x6zdU66VFMnhhlGGzeyqib2
         j5T9jGs8L6POICFiaIjIB/MMllcLJ6UOxjFLMIfmUMEtIv1n4hVGoCIfdNk/LAJF4/hD
         cs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=2jHyO/+tJycnvI7D/iroDUPvNTnIfnNR1rY53JgX5aI=;
        b=QiufqQrE3+T8KS3zyjqFUMNYc5VAqzdddPNn6E58Ek59ZkA3Mlfs4yo7bmnMu8oqh8
         aLVNoS/T7UmnAGGZ2m9+WucgK3tGNtDHk/6ct7aZCcVhEQQNFk/krLBs28872GPzfA22
         zwBXTEOcKB1RIJkMZ3gvdg2VfHwF1+fJKZ3K4EUGX7eSiOO+sNx+lYgLj5oAQTP4EUau
         pekDLB7QMe5FV8n8HRA5BpYk8bsmR9Oos9PcQV1l4uYXmlvEsSUbgJ8Pt35ornYsjQPc
         PVMHGQGo9ciDSsEAswr26JzWEPAfr3gm077icnYl2rPUCV6WbkBogOmnkygKYQIjCm2b
         hE0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b50si1811093qtb.258.2018.11.15.08.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 08:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNKEY-0007fp-K8
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 11:11:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gNKEQ-0007fW-Ca
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gNKEN-0001sB-8t
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:11:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gNKEL-0001nC-4Q; Thu, 15 Nov 2018 11:10:59 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 552C388319;
	Thu, 15 Nov 2018 16:10:49 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C555B105B1E6;
	Thu, 15 Nov 2018 16:10:11 +0000 (UTC)
Date: Thu, 15 Nov 2018 17:10:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181115171009.3d59a535.cohuck@redhat.com>
In-Reply-To: <20181114132931.22624-1-marcandre.lureau@redhat.com>
References: <20181114132931.22624-1-marcandre.lureau@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Nov 2018 16:10:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] vmstate: constify VMStateField
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, quintela@redhat.com,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, "open
	list:PowerPC" <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEvS/7iM2lN9

On Wed, 14 Nov 2018 17:29:30 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Because they are supposed to remain const.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/migration/vmstate.h |   6 +-
>  hw/display/virtio-gpu.c     |   4 +-
>  hw/intc/s390_flic_kvm.c     |   4 +-
>  hw/nvram/eeprom93xx.c       |   6 +-
>  hw/nvram/fw_cfg.c           |   6 +-
>  hw/pci/msix.c               |   4 +-
>  hw/pci/pci.c                |   8 +--
>  hw/pci/shpc.c               |   7 ++-
>  hw/scsi/scsi-bus.c          |   4 +-
>  hw/timer/twl92230.c         |   4 +-
>  hw/usb/redirect.c           |  12 ++--
>  hw/virtio/virtio.c          |   8 +--
>  migration/savevm.c          |   7 ++-
>  migration/vmstate-types.c   | 119 ++++++++++++++++++++----------------
>  migration/vmstate.c         |  31 +++++-----
>  target/alpha/machine.c      |   5 +-
>  target/arm/machine.c        |  12 ++--
>  target/hppa/machine.c       |  10 +--
>  target/mips/machine.c       |  14 +++--
>  target/openrisc/machine.c   |   5 +-
>  target/ppc/machine.c        |  14 +++--
>  target/sparc/machine.c      |   7 ++-
>  22 files changed, 162 insertions(+), 135 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
