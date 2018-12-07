Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp734890wrt;
        Fri, 7 Dec 2018 09:10:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VDS1bOCU43H90r+FRq+p3bt5DX/DP53F8sNlJ9AFEguA+KhuRKh/cFOZTodIktPGYgunmx
X-Received: by 2002:a0c:9418:: with SMTP id h24mr2846785qvh.216.1544202618659;
        Fri, 07 Dec 2018 09:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544202618; cv=none;
        d=google.com; s=arc-20160816;
        b=xzqvwOSEmLPfi0TUVwEogEX0eK/3kg3eTZrp3XsXC1uNUC/Zt+iGT1cE6CJ/Qks5De
         xJyXtUUSDDosgmh8TOwIEfGwKZeAloUmdZXaG33Mu+ycocQRJ5SmpS4YAGnFfCLEW31Q
         2T571oJdkystkO5xldJVkXXmweoIE5rKLELsdjMO4kzJMsKIL35g7UF5MfkTNcCcvu0X
         5Q+qt1rIpYuwfvHmElf8XC0dO0CdV5oHbUB8wxM/ST9SYXuiBztczTTkw2TK2c/vYrvr
         R3TBbnB1TDhG4xXnA3flpE9B6UCcuNr6FWnoyETyGWy4lh92fOXjM90MnWiQoLxCSYjR
         NtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=nFlW5Zb+LQ+jawsmxxR/bhr79Iqnd7mVh2FdYeSxmfc=;
        b=unPuH5SodOkwy3JEjmE6jl8+84mrqyrY2E2jCPgMdvlC9I57xDKgLcqH0NBqndUAYc
         lm9cZSqfr+f1LsMRp6v5+SBXeTEDc/i8S8nGKBzYxgwGvPjAWSJzRE0rcm64nfW6mWmZ
         qZRnMkJwK6EaEah802kk6uavb6HpC9uPkUzfMFHwaSPUNtedhXpjFRgrNIE2MMiq8KT8
         jiMXxO7bizyBaxH50jQx73wOZgLV+gRn/OClZaddRUOZ6BWwUDWE3oKYr1/Q+Wk3CiH/
         XVmgfA2oR4905WvnxmI+MQ3HQMlD2DGCdH1beJv9/Xu7hDy2BFhFepca24sTavUzkYjk
         3YFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si2491994qvf.112.2018.12.07.09.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 09:10:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVJdq-00048C-3a
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 12:10:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJY9-0005IA-BG
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJY4-0004rE-9G
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38149)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gVJY3-0004qU-WE; Fri, 07 Dec 2018 12:04:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0BFA7F6C5;
	Fri,  7 Dec 2018 17:04:18 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.154])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC0919C7F;
	Fri,  7 Dec 2018 17:04:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Dec 2018 18:03:54 +0100
Message-Id: <20181207170400.5129-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 07 Dec 2018 17:04:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/6] fw_cfg: add HMP 'info fw_cfg' and
 add_file_from_host()
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RLecNUYaqNVR

Hi, various fw_cfg easy patches:

- First patches are trivial cleanups (and add trace events),

- patch 5 add a 'info fw_cfg' HMP command to display comprehensive list o=
f
fw_cfg entries registered,

- patch 6 add fw_cfg_add_file_from_host(), a helper to map a file from th=
e
host (using g_file_get_contents). This will be used by later UEFI series.

Philippe Mathieu-Daud=C3=A9 (6):
  hw/arm/virt: Remove null-check in virt_build_smbios()
  hw/arm: Remove unused include
  hw/i386: Remove unused include
  hw/nvram/fw_cfg: Add trace events
  hw/nvram/fw_cfg: Add HMP 'info fw_cfg' command
  hw/nvram/fw_cfg: Add fw_cfg_add_file_from_host()

 hmp-commands-info.hx      |  14 ++++
 hw/acpi/piix4.c           |   1 -
 hw/arm/virt-acpi-build.c  |   1 -
 hw/arm/virt.c             |   4 --
 hw/i386/acpi-build.c      |   1 -
 hw/i386/pc.c              |   1 -
 hw/nvram/fw_cfg.c         | 142 ++++++++++++++++++++++++++++++++++++++
 hw/nvram/trace-events     |   5 ++
 include/hw/nvram/fw_cfg.h |  24 +++++++
 9 files changed, 185 insertions(+), 8 deletions(-)

--=20
2.17.2

