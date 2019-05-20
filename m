Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp720726wrg;
        Mon, 20 May 2019 15:56:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo5wchmEe0tIEfs4qkCEHeTBYLilUH6yxNxRnYHq5YUegnKHqasD/UwJLjrTeNC3S3RuFl
X-Received: by 2002:a17:906:f12:: with SMTP id z18mr61962532eji.234.1558392986513;
        Mon, 20 May 2019 15:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558392986; cv=none;
        d=google.com; s=arc-20160816;
        b=xKXrxMuMTuSEYAj3UFr4pppKSK627hQxfH83QN9CEacY+tNzzuI28vEY2bBl/fLSsd
         ZvFdQuZIXSzOADRU2nROMRSEqJOsQolXgBW9eWz4fgr58xe+uZiDLSoQpadihen8T3x8
         VwTZdTN7phXbuzxQUQdbT8JgnWbFWdTJ95jkw7f86keNHgV59I9fHGjOHyExmLuU3kWf
         9j9f2jOHjkQFF5jvIwktK3jH7WfwALFsgngV22mCMAxSENHEsI7TdZrkgVhcYTukNPDj
         yDDhoeI40zr+RTzhtejzcE9maxhrryYw8EGrZJb8o2UBDdFcpCEDBK1zSmtqgIgpA/SI
         isMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=GkKH3srfLOfkbuG17YwZEDhkPkMS2JTDDH9PJ0Iz6m4=;
        b=Md4zr3nXQtrVvF1VPYs212hFXo/WA07+w46f0w9WnqiBLWEnYKwtfqdDJDMCNPWkOc
         Z6pr45kgpziu+gH1ru40RIZ6QJsT1XqKiCh8a4gy7FZX5H6I8Q0nsKG1K9+2gnUwASPM
         P1Rsb2vkuQe68D6Pq1jX1OvlqvEyZKhZnUGfJw5wNNUp8f61j1UIJhS74dWX/XkmiIic
         vw/4imasPdkpHrEaKpE6oOgCdKgFqQlxAesKG6NnBBgluwObq/lNF6as9V1gUgQ/ye5x
         0O5RZNC+TTjYtVSZAYI4YlyCFV9gRrUrExTPMAnPaoHKGP/sQVulFo5OjXCAcxR2TnFX
         nnbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv25si1499100ejb.383.2019.05.20.15.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 15:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSrCj-0001EY-Hf
	for alex.bennee@linaro.org; Mon, 20 May 2019 18:56:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrCZ-0001EO-0Y
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrCX-0000O0-S2
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:56:14 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrCX-0000DH-Ly
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:56:13 -0400
Received: by mail-qt1-f195.google.com with SMTP id m32so18368382qtf.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 15:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=GkKH3srfLOfkbuG17YwZEDhkPkMS2JTDDH9PJ0Iz6m4=;
	b=UFMnrk67Miv+QRlGQTA0pY5pkpVz7mCxu4FxchReXViUL4XLl5zrv1hWqiP50vSsez
	iss3r+K4mvfR00Na55N9e+UgzEpHDJjWaT+PUe9EZ8wmDv3vQOcdRSJOCfTG6Ghcym//
	xO3bacEbcSHQjkCdZ0/3RLmBaamIry+TnFPa6w5ZU2IEq9tmDBfiUSXFtVtYgAysA9tm
	qD0j6O8M2YLt6VJN0S5cFOHL62ibQT8lVgHh1NJV3f16dJ2ZRy24NktzTrE4Eg21CbKt
	8Wa92tT8lvfq82cuiUR3jUpvaQ/7sy5HbSwz2tVNnvk1QoGBxiBeyQHhjHME4KRHF/l3
	tUDw==
X-Gm-Message-State: APjAAAUB882uRw8m1Gl7bYeYoCKlgmb/VP8knGv7abdzxj95zYCHwW4Z
	9/le2DfQvz+IS4S5dAAVfz191g==
X-Received: by 2002:ac8:3598:: with SMTP id k24mr64667758qtb.46.1558392956921; 
	Mon, 20 May 2019 15:55:56 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	x3sm10466098qtk.75.2019.05.20.15.55.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 15:55:55 -0700 (PDT)
Date: Mon, 20 May 2019 18:55:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190520185508-mutt-send-email-mst@kernel.org>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520005957.6953-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
Subject: Re: [Qemu-arm] [PATCH v5 0/6] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
	imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwFkxPoCtedA

On Mon, May 20, 2019 at 08:59:51AM +0800, Wei Yang wrote:
> This patch set tries to generalize MCFG table build process. And it is
> based on one un-merged patch from Igor, which is included in this serials.
> 
> v4->v5:
>     * ACPI_PCI depends on both ACPI and PCI
>     * rebase on latest master, adjust arm Kconfig
>     * miss the reserved[8] of MCFG, add it back
>     * make sure bios-tables-test all OK

So I am merging 1-4 now - they are unchanged from previous iterations.
You just need to repost 5-6.

> v3->v4:
>     * adjust comment to give more information about MCFG table
> 
> v2->v3:
>     * Includes the un-merged patch from Igor
>     * use build_append_foo() API to construct MCFG
> 
> Igor Mammedov (1):
>   q35: acpi: do not create dummy MCFG table
> 
> Wei Yang (5):
>   hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
>   i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
>   hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
>   hw/acpi: Consolidate build_mcfg to pci.c
>   acpi: pci: use build_append_foo() API to construct MCFG
> 
>  default-configs/i386-softmmu.mak |  1 +
>  hw/acpi/Kconfig                  |  4 +++
>  hw/acpi/Makefile.objs            |  1 +
>  hw/acpi/pci.c                    | 57 ++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                   |  1 +
>  hw/arm/virt-acpi-build.c         | 31 +++++------------
>  hw/i386/acpi-build.c             | 44 ++++--------------------
>  include/hw/acpi/acpi-defs.h      | 18 ----------
>  include/hw/acpi/pci.h            | 34 +++++++++++++++++++
>  9 files changed, 113 insertions(+), 78 deletions(-)
>  create mode 100644 hw/acpi/pci.c
>  create mode 100644 include/hw/acpi/pci.h
> 
> -- 
> 2.19.1
