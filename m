Received: by 10.223.134.117 with SMTP id 50csp5261930wrw;
        Thu, 28 Dec 2017 00:20:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBovsgUjKz0RvRqkFALX0BBHXInowDGcCpwNfq+iOY9HiPeSPJ0MJoB+LdxpR6M1PbCqRc9d2
X-Received: by 10.129.119.86 with SMTP id s83mr2180755ywc.302.1514449226542;
        Thu, 28 Dec 2017 00:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514449226; cv=none;
        d=google.com; s=arc-20160816;
        b=smheNBUVGhAnaB77EnNELnvY1BHnjBRhQEzlt/q0Vv7c+EeSQLw8/JUjRRxWDEcuSD
         n/dr3cKo9HCzlv3G46SxDfdHLEmT8/PQlZJmZw4WFN/0PgwMNz81n/rYy2XCjLbpyasz
         6AEWQ3VBA1/D0IqW3a35uCGzPSEUrSHUzit/msKtYx9WAbsBvq9DatTW4OK/+X88ylGg
         fYD6aLxwBDshz+rkpvDHrnuCeY+CfFskwtSuca9+hGHie3X2K1NuG0z3DoQbzVrYNcy7
         iIKlmpieQdW0jhv7rhJ5oyK2pWp/Iz0qqhXtXu8NHPXP6yNxPqjZlVvX0dX6qe/3jvEM
         vA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=W5K1DIurVr+EsP8SMoQlVPxetLuS7WDDwMDezLfHovg=;
        b=hKRQqo6tcfnEJ5COPj5IoIdA53abYDJ8wyD/htiD2zUuBABaxZyUI19HOvdwnMn2Uc
         rabuwB5A4fn/XHWH8NxCgFNWDh4atLguBexOmb+wqgcDYo2RsCtsJirMMA2LD/vobVQf
         Qw4YJVeumIFCkt8zXzPcfsu8OipeburZBWY2rrnnUWXEo6sxqYyYsI46KcoHOEpv7MwK
         8hKN9HErsO5zTyqq4J6ZpDrh/xYRbPYheCxt5imiTGiNpg2vOov4+yd4zRmJaJsl27JT
         piKXWYage8cMRfX4+eAq4EWSvrt7FyMe9O93Ia7/e1dMi7BQ8LWonkQWI2z4AfQLGB9/
         Qw/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k39si4703594ybj.327.2017.12.28.00.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Dec 2017 00:20:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUTQP-0005ja-Vq
	for alex.bennee@linaro.org; Thu, 28 Dec 2017 03:20:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eUTQG-0005j2-Pm
	for qemu-arm@nongnu.org; Thu, 28 Dec 2017 03:20:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eUTQD-0002v8-CW
	for qemu-arm@nongnu.org; Thu, 28 Dec 2017 03:20:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eUTQD-0002sD-6y; Thu, 28 Dec 2017 03:20:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E15DC821C1;
	Thu, 28 Dec 2017 08:20:10 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5415F614D0;
	Thu, 28 Dec 2017 08:20:09 +0000 (UTC)
Date: Thu, 28 Dec 2017 09:20:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20171228082006.xvmw6y4oxkcadenv@hawk.localdomain>
References: <1514423680-11132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1514423680-11132-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 28 Dec 2017 08:20:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3] Virt: ACPI: fix qemu assert due to
 re-assigned table data address
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, lersek@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M0IbnIGpnJcJ

On Thu, Dec 28, 2017 at 09:14:40AM +0800, Shannon Zhao wrote:
> From: Zhaoshenglong <zhaoshenglong@huawei.com>
> 
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. If we use
> the old value, it will assert.
> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
> Assertion `start_offset < file->blob->len' failed.`
> 
> This issue only happens in building SRAT table now but here we unify the
> pattern for other tables as well to avoid possible issues in the future.
> 
> Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
> ---
> v3: unify the pattern for MCFG
> v2: update the commit message according to Andrew's comments
> ---
>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
 
Reviewed-by: Andrew Jones <drjones@redhat.com>
