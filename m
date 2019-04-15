Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2735772wrx;
        Mon, 15 Apr 2019 07:20:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJ8um3n7whBdSNsAJVqgN3Jmmuwi5S5f1HhgJn7foOmqDvBONvbe5O0LmXhvKBxnrrPbhV
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr22027563wmb.85.1555338035562;
        Mon, 15 Apr 2019 07:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555338035; cv=none;
        d=google.com; s=arc-20160816;
        b=SYMG9kAITxe39elCgbu/pVOa5fALaje0C4E7uT0wVz0UBXgseFS1u0idNBmS4QXCyx
         AN8bjaAYN7+5svdCnouqYrBjYrO6BMAs0L0af2YUVGOjYC7IZwQHepXVpVYlU61QOX0m
         vOqeFQDLdx1mZDiJ58bAAmcWf2jdL86vj2+U8rIXupLs7ZGSfgRZsfyyVC9AlXAqGR11
         Xv74hFbnfINXICD2An3FwwGYvzXqMhAUoyxcvaU/QHcuHnOgbAJErtcpH2BjcHEGaz4N
         MdDbSeC6dfA+W/7KkXJCF0bOlKf1gZJ5O2AhbMmlueBYSatnX0xB8GbykCoTDzJQlHg6
         rmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=B/dxL+A9eV2hUsemkSPf62uRgwLSOfMGtZlj0+qc9gQ=;
        b=rnSXZwt4btYXi8osqNaTuXX90tqM34a5u6/4tZiAxvJt3YaBjCfgyB5MPIAHodByU5
         x1yiMGM3LQcNDLyGgYlbajoOA1OHE/+DlOaNUUUfKoPFs87QBYaNirtCCGMqRy09gp60
         sW84GzHqCG4fXTW2vmb10klmGQGgzrPI1ZsQK5Lmci7o0/zbBnxQ4YLqqmo4OvbI//lw
         RRv2N1YTsLOQY/1UCOYfXyN0gGA464hvByPGJL0lOXsvEkuSe9zP7QnWtnJ85HVi/cyp
         Rnz0dtLIpel5Nom5mtoWtr61Hke9OCKz8bGjxx3+6pB1TOtiF66neiFFS+ky5vhFuj+W
         3WWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y186si11196692wmc.69.2019.04.15.07.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 07:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG2TK-0006S9-LG
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 10:20:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2T9-0006Rz-0H
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:20:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2T8-0005IH-6D
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:20:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hG2T6-0005GD-6R; Mon, 15 Apr 2019 10:20:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BB7B306BB8F;
	Mon, 15 Apr 2019 14:20:17 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E8CE1001E85;
	Mon, 15 Apr 2019 14:20:11 +0000 (UTC)
Date: Mon, 15 Apr 2019 16:20:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190415162005.1ff9ca3b@Igors-MacBook-Pro.local>
In-Reply-To: <20190415070307.13668-1-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 15 Apr 2019 14:20:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/4] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6rV5F0k+wfkF

On Mon, 15 Apr 2019 15:03:03 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> This patch set tries to generalize MCFG table build process.

1.
series should reference not merged  dependency if any exists.
in this case "[PATCH for-4.1] q35: acpi: do not create dummy MCFG table"
or as alternative include and repost that patch as part of the series.

if you'd do the later then add your SoB last when you are reposting it.

2. series is not finished without converting build_mcfg() to
   build_append_int_noprefix() API


> Wei Yang (4):
>   hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
>   i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
>   hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
>   hw/acpi: Extract build_mcfg to pci.c
> 
>  default-configs/arm-softmmu.mak  |  1 +
>  default-configs/i386-softmmu.mak |  1 +
>  hw/acpi/Kconfig                  |  4 +++
>  hw/acpi/Makefile.objs            |  1 +
>  hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c         | 31 ++++++---------------
>  hw/i386/acpi-build.c             | 30 ++++-----------------
>  include/hw/acpi/aml-build.h      |  5 ++++
>  include/hw/acpi/pci.h            |  5 ++++
>  9 files changed, 76 insertions(+), 48 deletions(-)
>  create mode 100644 hw/acpi/pci.c
>  create mode 100644 include/hw/acpi/pci.h
> 

