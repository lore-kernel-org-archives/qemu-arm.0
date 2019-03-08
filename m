Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7805820wrx;
        Thu, 7 Mar 2019 17:33:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXXZQwCCDBZmlkD4GVM8ovZR2L2S+3uyFAsss1X7iQsm9AGW5YzMlBnzQMBwIZPyd3kevZ
X-Received: by 2002:a81:6f8a:: with SMTP id k132mr12549050ywc.469.1552008786783;
        Thu, 07 Mar 2019 17:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008786; cv=none;
        d=google.com; s=arc-20160816;
        b=iTFUJK+ShlmWpDJZqa/Hb9B22MiXQDNpQUG3w5DKzM6V/eqFILJXO3a+jx4I5prueS
         wjSEPIApsWMJG50GjphpkWc5qeUIQ2v1niu6OGeYNP10eu5j4lAYhFoeRpf1j4Fj3Q3i
         7VXQ6Lbt3AABRNffnmwu4qTu/f3y0sA0b4Ztacm0SmXQiQXrf4dpbSrZT6R5aupztZ/J
         zuZB98YLkemInuCBA/N0/LtCpsqwTM0oxagVa0UVuIVdoF2pPQo0YCihaA9MfI3c+OZy
         7xu77+NsCZN5pG9VIUpS0pO5Askl5XZvfAsAZK9ZOzU3DPUqaJRtHoLkCZGqwTVA3+6D
         Or0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=rsSr7BVeumYrMNPQWp2STEGQv9y7WIuvhYr6W4Xch5s=;
        b=RIRwafSmk5452e2N5n4xApdUhUwUHTozkyi9/3d10NuWni3RzZKrRdl9fNOp0L+Pc5
         MrbGj0Qy6hFO/ln5HRiJ3LbwB4oE1m7D5QPY+dvw04NLAOk84xFgxHxcut/63FYI87E1
         7VYPCNfyaI2hJsvGsvE0jKT48B5keWKLisRLfOMWEuqvHjdIHGRetT0eqSDhqQfLkMGf
         PsPKbyY1dkxTm0YPo4sq5PiOueMOjWRjjbRpbIprNZZto0AV+9ie+zavZtm55YFAk2PV
         RsSv3UE39TXd+6g+We4Jf/ZaNB1GOWwrQWaunwb6IDvk9bQUtI0zEWWoj0xnjVLNwyNL
         60Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h190si3754276ywd.330.2019.03.07.17.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24Nl-0001sM-9B
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24NT-0001ro-Oy
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:32:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24NS-0008AV-LY
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:32:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24NP-00083X-A3; Thu, 07 Mar 2019 20:32:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50ECA87649;
	Fri,  8 Mar 2019 01:32:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC5960BE5;
	Fri,  8 Mar 2019 01:32:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:04 +0100
Message-Id: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 08 Mar 2019 01:32:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/18] fw_cfg: reduce memleaks,
 add QMP/HMP info + edk2_add_host_crypto_policy
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: laX1wp6WD9iz

Hi,

This series consists of:
- trivial cleanups, add trace events (was in v1)
- add QMP/HMP commands to display the list of fw_cfg entries (reworked fr=
om v1)
- add unrealize() method and deallocate various buffers (new in v2)
- add fw_cfg_add_file_from_host (was in v1)
- add edk2_add_host_crypto_policy (new in v2)

Since v1:
- Addressed Michael and Laszlo comments.

Please review,

Phil.

v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html

Philippe Mathieu-Daud=C3=A9 (18):
  hw/arm/virt: Remove null-check in virt_build_smbios()
  hw/i386: Remove unused include
  cutils: Add qemu_strdup_hexlify() and qemu_strdup_unhexlify()
  hw/nvram/fw_cfg: Add trace events
  hw/nvram/fw_cfg: Use the ldst API
  hw/nvram/fw_cfg: Remove the unnecessary boot_splash_filedata_size
  hw/nvram/fw_cfg: Add fw_cfg_common_unrealize()
  hw/nvram/fw_cfg: Move fw_cfg_file_slots_allocate() to common_realize()
  hw/nvram/fw_cfg: Free file_slots in common_unrealize()
  hw/nvram/fw_cfg: Add reboot_timeout to FWCfgState
  hw/nvram/fw_cfg: Add boot_splash.time_le16 to FWCfgState
  hw/nvram/fw_cfg: Keep reference of file_data in FWCfgState
  hw/nvram/fw_cfg: Add QMP 'info fw_cfg' command
  hw/nvram/fw_cfg: Add HMP 'info fw_cfg' command
  hw/nvram/fw_cfg: Add fw_cfg_add_file_from_host()
  hw/firmware: Add Edk2Crypto and edk2_add_host_crypto_policy()
  hw/i386: Use edk2_add_host_crypto_policy()
  hw/arm/virt: Use edk2_add_host_crypto_policy()

 MAINTAINERS                             |   9 +
 hmp-commands-info.hx                    |  17 ++
 hw/Makefile.objs                        |   1 +
 hw/acpi/piix4.c                         |   1 -
 hw/arm/virt.c                           |  11 +-
 hw/firmware/Makefile.objs               |   1 +
 hw/firmware/uefi_edk2_crypto_policies.c | 166 ++++++++++++++
 hw/i386/pc.c                            |  28 +++
 hw/nvram/fw_cfg.c                       | 284 ++++++++++++++++++++++--
 hw/nvram/trace-events                   |   7 +-
 hw/ppc/Makefile.objs                    |   2 +-
 hw/ppc/fw_cfg.c                         |  31 +++
 hw/sparc/sun4m.c                        |  19 ++
 hw/sparc64/sun4u.c                      |  19 ++
 include/hw/firmware/uefi_edk2.h         |  28 +++
 include/hw/nvram/fw_cfg.h               |  42 ++++
 include/qemu/cutils.h                   |  33 +++
 include/sysemu/sysemu.h                 |   2 -
 qapi/misc.json                          |  44 ++++
 stubs/Makefile.objs                     |   1 +
 stubs/fw_cfg.c                          |  19 ++
 util/cutils.c                           |  55 +++++
 vl.c                                    |  10 -
 23 files changed, 792 insertions(+), 38 deletions(-)
 create mode 100644 hw/firmware/Makefile.objs
 create mode 100644 hw/firmware/uefi_edk2_crypto_policies.c
 create mode 100644 hw/ppc/fw_cfg.c
 create mode 100644 include/hw/firmware/uefi_edk2.h
 create mode 100644 stubs/fw_cfg.c

--=20
2.20.1

