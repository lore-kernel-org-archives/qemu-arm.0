Received: by 10.25.208.211 with SMTP id h202csp1444357lfg;
        Mon, 7 Mar 2016 07:28:46 -0800 (PST)
X-Received: by 10.140.249.6 with SMTP id u6mr31042737qhc.83.1457364525827;
        Mon, 07 Mar 2016 07:28:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a82si116358qkb.98.2016.03.07.07.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:28:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acx5R-00066O-7e
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:28:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1acx5J-00065Y-WF
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1acx5G-0008IX-0d
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:28:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1acx5F-0008IM-Rx; Mon, 07 Mar 2016 10:28:33 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 38CAF2572;
	Mon,  7 Mar 2016 15:28:33 +0000 (UTC)
Received: from redhat.com (vpn1-6-83.ams2.redhat.com [10.36.6.83])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u27FSTeL011202; Mon, 7 Mar 2016 10:28:30 -0500
Date: Mon, 7 Mar 2016 17:28:29 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160307172758-mutt-send-email-mst@redhat.com>
References: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, guangrong.xiao@linux.intel.com,
	ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-arm] [PATCH 0/6] acpi: simplify bios_linker API
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vSvcxfmucYzK

On Mon, Mar 07, 2016 at 04:19:02PM +0100, Igor Mammedov wrote:
> Simplify bios_linker API by adding filei name + blob tracking
> so user would have to suppily less arguments which
> reduces chances of mistake by using wrong blob pointer
> with not related file.
> And also refactor API to take file offsets, as it's what
> actually API were doing only internally, instead of
> using host pointers. I hope ti makes it easier for API user
> to use API without need to look at implementation on
> QEMU/SeaBIOS. 


Thanks!
As we are in freeze, I'll probably defer this until after the release though.

> Igor Mammedov (6):
>   acpi: convert linker from GArray to BOISLinker structure
>   acpi: simplify bios_linker API by removing redundant 'table' argument
>   acpi: cleanup bios_linker_loader_cleanup()
>   tpm: apci: cleanup TCPA table initialization
>   acpi: make bios_linker_loader_add_pointer() API offset based
>   acpi: make bios_linker_loader_add_checksum() API offset based
> 
>  hw/acpi/aml-build.c                  |  33 +++----
>  hw/acpi/bios-linker-loader.c         | 179 +++++++++++++++++++++--------------
>  hw/acpi/nvdimm.c                     |   6 +-
>  hw/arm/virt-acpi-build.c             |  51 +++++-----
>  hw/i386/acpi-build.c                 |  89 +++++++++--------
>  include/hw/acpi/aml-build.h          |   7 +-
>  include/hw/acpi/bios-linker-loader.h |  28 +++---
>  include/hw/mem/nvdimm.h              |   3 +-
>  8 files changed, 222 insertions(+), 174 deletions(-)
> 
> -- 
> 1.8.3.1
