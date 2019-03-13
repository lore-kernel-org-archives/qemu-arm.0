Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1591684wrs;
        Wed, 13 Mar 2019 05:30:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7qinz1AKRdi9c9gyEyAQcdfk6mFC1LN0D6MfEBJhJKTEPEa4pU9GPA1e7KQQzgblRrs3o
X-Received: by 2002:a81:4506:: with SMTP id s6mr7632514ywa.500.1552480257616;
        Wed, 13 Mar 2019 05:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552480257; cv=none;
        d=google.com; s=arc-20160816;
        b=UkwlCLWGCxhaTBGNmOLjsOrljJWEYn/hsF9vHYcIPxN7tdI+h/Hs/mb8HqOM9xfmjD
         gbDc4TLCyFVgieuPFoLflkahutl3u5e1OvtxQC56MP4O+D08r9+AEPBxl/m/8nPk3ZwO
         2dmewIAsuvjmgzT83iTi3PGVno409ZrSI7YwoLGPuYarKgHxg2QhsaewCVLD23RbT1gK
         SGjnup83LkfRBLxlQEsoMTmkPwPAbP3q5O1h45mRcElXL/ZZYF8hlZkXov74d//PSQek
         1pR0pz14ywQZCTfhuE42+KmhhAyDp7UekTk/UdxL+mUUWb8+hPNQLyVw0WdIcf78wwwH
         RKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zAWj6ApMvLYwhestNX3bXF9iJ0DgC5/QMDa6NxLlPag=;
        b=s6vcpwcFn/90oG80v5+keKIl4P9My3kJasqXsSspCgLLN1B7Bv1+0Po57lT1L70J7F
         /fpXf+2nasgL2QeaMsHF029YeL2T3GJLcnPPMIeMfJV7kt3jLsK2Mo2HlKugEb+p7JBP
         jqr+7kgL6KLnLyLhXYF11naPOiSlhRzKb5sKQZ/mKCG+z5k+6ea7ayzqpg3BM6vjEDiD
         FjPOEFI1BguQ1+Aaf/XE3m6+fPo6GoaL9dNFMxkgcGjxnkd5yIo4pJZGpQcgfP6Zfjex
         66BGYfjGDb/x6Ors4rfZaiR1Y6U7xl4mefLOBSMCp3YMJHtq4qaHHu7G79C1Lo9HOD7d
         JGZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si6605644ybn.70.2019.03.13.05.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 05:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4329-0006JK-4g
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 08:30:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h431z-0006JC-T5
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h431y-0007RC-Rp
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:30:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h431y-0007QI-7d; Wed, 13 Mar 2019 08:30:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAE557C0AE;
	Wed, 13 Mar 2019 12:30:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFBCA1001E70;
	Wed, 13 Mar 2019 12:30:40 +0000 (UTC)
Date: Wed, 13 Mar 2019 13:30:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190313133039.516f3a60@redhat.com>
In-Reply-To: <20190313044253.31988-1-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Mar 2019 12:30:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 0/3] Extract build_mcfg
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MuxctvVkq52d

On Wed, 13 Mar 2019 12:42:50 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> This patch set tries to generalize MCFG table build process.
> 
> [1]: use acpi_get_mcfg() to get necessary information to build MCFG
> [2]: remove an unnecessary variable mcfg_start
> [3]: Extract build_mcfg to aml-build.c
> 
> Wei Yang (3):
>   hw/arm/virt-acpi-build: use acpi_get_mcfg() to calculate bus number
>   hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
>   hw/acpi: Extract build_mcfg

I'd add ano more patch on top
which converts from packed structure to build_append_int_noprefix() API

> 
>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 27 ++++++++++-----------------
>  hw/i386/acpi-build.c        | 36 +-----------------------------------
>  include/hw/acpi/aml-build.h |  6 ++++++
>  4 files changed, 47 insertions(+), 52 deletions(-)
> 

