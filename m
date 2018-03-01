Received: by 10.28.91.67 with SMTP id p64csp1591271wmb;
        Thu, 1 Mar 2018 00:58:32 -0800 (PST)
X-Google-Smtp-Source: AG47ELto7nkxZUmLbSRink/BJvrKdwBMFKd0QCesTXDPCDRazOna6pBt5Bs13dWRgMb2zPXhkZR0
X-Received: by 2002:a25:af8b:: with SMTP id g11-v6mr601294ybh.134.1519894712589;
        Thu, 01 Mar 2018 00:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519894712; cv=none;
        d=google.com; s=arc-20160816;
        b=NcbYefDKaxDKXfuSGefsUbQ+JYGAuD9FVcNAQG7UkP6BYXUSoBUYbk/DuGBCYLnTTS
         9qObXrxSypkf0Bbbb/1OyfZkKiPeubiwUP5jH9Mj2j/U1IEs7ikHnrXWman7kmXoXKlH
         MOEHjz6tW3BW+QVCT1svM6tPa3Fz/98ff5we5qJ9SmAAwisvVltTxV112hQe5Aq0civN
         6uDxRD8iGi04RSPmKFO/FMwtu1no+haSuwueMQdLYjl0kNpchkA9be+jB7YEl7/mKux8
         lFONpwyXx8olyXxf33vEUMwETT5A68fkk7o3rSWDqx7lpEECtRAViK/LeS3Mtm4XHPf5
         dAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=PveKfCTazys7i5QlZDz8CMTl3ucQzJxC+LOjbLYX0E4=;
        b=bhtZVZ5DHlEWzJ0GE+dZtdmOszBD8G7xlJ81zLUg5mW16AaNBMuQobn/8ufwppHgSC
         svVcln/46FZtIn+qpjJDcRPEEmxDEXH9bzAuv2fdRT2E6ZjsTuSPWL7LTAysykUPBLXF
         q9s1JPkteUphm1HXXZLiKydq+uU2m4RQ2i97LAf/Eo3G4pmhJbm6Fg8CLcE7n2XqjQqs
         gXCBp71vAFqIPwiXqSjW3zenod0IYEikSJz2rl7bI17TZ8AjV69MEuyWrwSfUKuJdKRt
         bSgcCEVKEr/0eb/+LdFb8ET06h0uCa87/E/UUw7uD5Qg0gwnY6j0nUxuEwrnDkEoyaIY
         rt0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7-v6si572376ybe.822.2018.03.01.00.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 00:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erK2p-0001vM-Vc
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 03:58:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJxZ-00060q-NH
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 03:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJxY-0001rT-Kc
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 03:53:05 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37114 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1erJxT-0001nG-5P; Thu, 01 Mar 2018 03:52:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6621B4026789;
	Thu,  1 Mar 2018 08:52:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDAC9457D;
	Thu,  1 Mar 2018 08:52:51 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a4ca1d71-d46a-9d56-d974-69c57d3c7c5b@redhat.com>
Date: Thu, 1 Mar 2018 09:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 08:52:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 08:52:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2 00/10] generalize build_fadt()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gv+bzYv5ZgbU

Hi,

On 28/02/18 15:23, Igor Mammedov wrote:
> 
> v2:
>   * fix typo in "acpi: remove unused acpi-dsdt.aml"
>   * split ACPI_PORT_SMI_CMD into separate cleanup patch
>   * s/pm1_/pm1a_/, s/c2_latency/plvl2_lat/, s/c3_latency/plvl3_lat/
>     and fix conflicts in followup patches caused by renaming
>   * conditional FIRMWARE_CTRL, DSDT patching is introduced in
>     the patch that makes build_fadt() generic instead of earlier
>     "pc: acpi: isolate FADT specific data into AcpiFadtData structure"
>   * update comment to mention that build_fadt() supports 5.1 revision
>   
> 
> 
> Series first cleanups ACPI code around build_fadt() and then
> converts current packed structure approach to a build_append_FOO()
> API, getting rid of error prone explicit endianness conversions
> in code and making build_fadt() look more like APCI table declaration
> from spec, which should be easier to read/maintain. After that
> build_fadt() becomes generic enough that we could drop ARM specific
> implementation and reuse generic build_fadt(), reducing code
> duplication.
> 
> PS: tested only x86 which has make check coverage,
>     ARM was only slightly tested. 

Tested-by: Eric Auger <eric.auger@redhat.com>
on AArch64 with a rhel guest.

Thanks

Eric

> 
> git tree for testing:
>   https://github.com/imammedo/qemu.git fadt_refactoring_v2
> 
> CC: "Michael S. Tsirkin" <mst@redhat.com> 
> CC: Shannon Zhao <zhaoshenglong@huawei.com> 
> CC: Auger Eric <eric.auger@redhat.com>
> CC: qemu-devel@nongnu.org 
> CC: qemu-arm@nongnu.org 
> 
> Igor Mammedov (10):
>   acpi: remove unused acpi-dsdt.aml
>   pc: replace pm object initialization with one-liner in
>     acpi_get_pm_info()
>   acpi: reuse AcpiGenericAddress instead of Acpi20GenericAddress
>   acpi: add build_append_gas() helper for Generic Address Structure
>   acpi: move ACPI_PORT_SMI_CMD define to header it belongs to
>   pc: acpi: isolate FADT specific data into AcpiFadtData structure
>   pc: acpi: use build_append_foo() API to construct FADT
>   acpi: move build_fadt() from i386 specific to generic ACPI source
>   virt_arm: acpi: reuse common build_fadt()
>   tests: acpi: don't read all fields in test_acpi_fadt_table()
> 
>  include/hw/acpi/acpi-defs.h | 136 ++++++++----------------------
>  include/hw/acpi/aml-build.h |  23 ++++++
>  include/hw/isa/apm.h        |   3 +
>  Makefile                    |   1 -
>  hw/acpi/aml-build.c         | 140 +++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    |  39 ++++-----
>  hw/i386/acpi-build.c        | 196 ++++++++++++++------------------------------
>  hw/isa/apm.c                |   1 -
>  pc-bios/acpi-dsdt.aml       | Bin 4405 -> 0 bytes
>  tests/bios-tables-test.c    |  82 ++++--------------
>  10 files changed, 294 insertions(+), 327 deletions(-)
>  delete mode 100644 pc-bios/acpi-dsdt.aml
> 
