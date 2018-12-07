Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp785450wrt;
        Fri, 7 Dec 2018 09:58:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UUld6oDHMucnc5JBUEISqKP3rdJfQ2ru2YzakfsqPwI/y6LImvByljOO7Gz8n+1MjmlRUj
X-Received: by 2002:aed:25a6:: with SMTP id x35mr3007037qtc.228.1544205491918;
        Fri, 07 Dec 2018 09:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544205491; cv=none;
        d=google.com; s=arc-20160816;
        b=CUR52iPdP/aGuO0yQUljR5yYMFQQn5UWe0sOwGUDdhH0lib7KUCRZ5hF7tXRmLhV5p
         +7WoSNCzmHmg2qaFdfehOBJZfQ/NvyrEo2KQJzGQZn5hMpl+lhFQ9eJ6czJfmTUme+nZ
         q/ZpX7isuVHTp1CzUaahUIzVU8vWsNRUgJlMKl1B9UapofFIoJOWK0fD0xYP1OvkKM4B
         1//DgiTOxgMVnANrdhfgAAi6LVjWcsoKGNlIiDpgZOlaPi8tfEL6M57Se246cITsoBUW
         A1MubTHs2qqXpF+NyubXLzX/UXiz1y7x6LuXNdJ9d6AZBLTeCHruV45Ox/YZIZbwwSuX
         bwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=8TfGh1WPKI6GKhBQ9kibbmzfzYl5BrF8LrV5TTMfEfA=;
        b=tVBwtqkDuglomaAinmQyH/nWpPhpBjihe6VysZIsygUUUK0ezHGkPCRrZ9zw/10PwA
         Kk5u+B0VgOTZPN1rQ7+7LWII28pLHk/BcRqyMBerca/juSmhPH2ER78EP9FH8gjqOUIE
         TD65sBgoRljaYTT544ShesjS0CGUhznHe+AON6lSa69YnyfKIx05elT3N0wP+eFKQw12
         AeUvSCyueNHPAJwgplvnD/fox7vvj+O+/loIVqkk50lVvbA2N8Ys9y81OntM4veMndhj
         UIhEI+CsdQxDLLTfHrGjbnUfq3herii72zzYmP9K08T1Ug75bvAOB+yqI/dkdgam1DMX
         sSaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w90si318858qvw.209.2018.12.07.09.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 09:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVKOB-0008FN-Fc
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 12:58:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gVKNk-0008Ci-ER
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 12:57:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gVKNj-0006Rx-LT
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 12:57:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gVKNg-0006O7-F9; Fri, 07 Dec 2018 12:57:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C40023154875;
	Fri,  7 Dec 2018 17:57:39 +0000 (UTC)
Received: from redhat.com (ovpn-124-251.rdu2.redhat.com [10.10.124.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B720C600C5;
	Fri,  7 Dec 2018 17:57:28 +0000 (UTC)
Date: Fri, 7 Dec 2018 12:57:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181207125716-mutt-send-email-mst@kernel.org>
References: <20181207170400.5129-1-philmd@redhat.com>
	<20181207170400.5129-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181207170400.5129-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 07 Dec 2018 17:57:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/6] hw/arm: Remove unused include
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LB09Drpy7ZkR

On Fri, Dec 07, 2018 at 06:03:56PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..98d7f7cf20 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,6 @@
>  #include "target/arm/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/loader.h"
>  #include "hw/hw.h"


This file uses fw_cfg_add_file, looks wrong.

> --=20
> 2.17.2
