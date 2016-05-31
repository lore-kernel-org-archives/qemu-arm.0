Received: by 10.25.27.66 with SMTP id b63csp2116594lfb;
        Tue, 31 May 2016 08:09:50 -0700 (PDT)
X-Received: by 10.55.15.30 with SMTP id z30mr30755120qkg.187.1464707390338;
        Tue, 31 May 2016 08:09:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23si11066407qkh.17.2016.05.31.08.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 08:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7lIj-0005XF-KE
	for alex.bennee@linaro.org; Tue, 31 May 2016 11:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b7lId-0005VE-G4
	for qemu-arm@nongnu.org; Tue, 31 May 2016 11:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b7lIW-0007KH-Pf
	for qemu-arm@nongnu.org; Tue, 31 May 2016 11:09:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b7lIW-0007K8-JP; Tue, 31 May 2016 11:09:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24A5FC00C8E5;
	Tue, 31 May 2016 15:09:36 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VF9Yqs020781; Tue, 31 May 2016 11:09:35 -0400
Date: Tue, 31 May 2016 17:09:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160531170934.11f9c49a@nial.brq.redhat.com>
In-Reply-To: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
References: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 31 May 2016 15:09:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/6] acpi: simplify
 bios_linker API
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
Cc: qemu-arm@nongnu.org, mst@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1IIhsBUdhaun

On Thu, 19 May 2016 15:19:24 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> Simplify bios_linker API by adding file name + blob tracking
> so user would have to suppily less arguments which
> reduces chances of mistake by using wrong blob pointer
> with not related file.
> And also refactor API to take file offsets,
> which is what is usualy used in context of file APIs,
> (and as it's what actually current API were doing only internally),
> instead of using host pointers.
> I hope it makes it easier for user to use API without
> need to look at implementation in QEMU/SeaBIOS. 
ping


> 
> 
> Igor Mammedov (6):
>   acpi: convert linker from GArray to BIOSLinker structure
>   acpi: simplify bios_linker API by removing redundant 'table' argument
>   acpi: cleanup bios_linker_loader_cleanup()
>   tpm: apci: cleanup TCPA table initialization
>   acpi: make bios_linker_loader_add_pointer() API offset based
>   acpi: make bios_linker_loader_add_checksum() API offset based
> 
>  hw/acpi/aml-build.c                  |  33 +++----
>  hw/acpi/bios-linker-loader.c         | 179 +++++++++++++++++++++--------------
>  hw/acpi/nvdimm.c                     |  22 +++--
>  hw/arm/virt-acpi-build.c             |  56 +++++------
>  hw/i386/acpi-build.c                 |  92 +++++++++---------
>  include/hw/acpi/aml-build.h          |   7 +-
>  include/hw/acpi/bios-linker-loader.h |  28 +++---
>  include/hw/mem/nvdimm.h              |   3 +-
>  8 files changed, 235 insertions(+), 185 deletions(-)
> 

