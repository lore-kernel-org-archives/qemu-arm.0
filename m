Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6099332wrx;
        Wed, 6 Mar 2019 08:36:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwq1zX/6jP50NTt/pv2xtY+wGWrvxdIij/mJ9Wq+ChvAptNw3k+Q9IDNTPnyPSc6Nc2N9ws
X-Received: by 2002:a25:cd44:: with SMTP id d65mr7642943ybf.144.1551890162342;
        Wed, 06 Mar 2019 08:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551890162; cv=none;
        d=google.com; s=arc-20160816;
        b=oDQD+iw0nRApPYYzDtJdxOGcvuD77BgZYvVH2CJlJcrvm8+zFWllWaiYjs/sihbfgC
         pxi1CVdZqfRyAF871vwumVuiLie7OJNfhH2Qp2e8jkzvIesWPMkOriJUITCKGhuu1RlP
         M8i27YZFMHb2oU/Cy70dQQuI/L02v6DEZaGZGh68xFFBLDNfKw97G1djh0t8OTZhiYTe
         ofBFK/TYX6DHGsqsCxlOk8ZLA7WNkYII5wqj4fsxxLS4VBLj3t+GiOpf2wDjRCc3eMBg
         KPTZoKrvDrqBcQ7fVBxLFai4wtD7s5k22t45WXCgx1TjO7rOFajdxb23c6Bi4qQy9Wln
         +KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=CkqJnR10ntEJoyq5r6Ju9+2nBIGLcqz6IHRJ7WSIYII=;
        b=UoQtb1Puo2B3MtoLOx1qTEMOfO6HYCgsCTVSxHxtOL6kOjofWJ0a4wG32UaD3C24ht
         vEbCO8flhyzNtB0RQMa8NSNvWwp+4AXEh1SXHv51Hp8rGcJR3TzkYTMRULl+GgyjfHF3
         2YbS3om01zFHMe3S4RoMTOxJu39iqOxzx9RKuJ3Aa1S+KmrXYxUWAruUfzY15OaX7vQZ
         0CYiC43Y8pjQ7VkmCvo7XF5+iJsnB+n1ivNmdyFivkeIZ7AUIcXs96nmA++0yELh/UXV
         dqG+kurrWEgPsCHWENHoYsyAU0K7dbbL6jZiTxUaZ++WnrTnwsohTylwmghhAQF3HDeP
         4JVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z131si1129519yba.144.2019.03.06.08.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 08:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1ZWR-0007WH-57
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 11:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZWF-0007Ut-Rk
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZWF-0005bS-31
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:35:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1ZWE-0005b5-RY; Wed, 06 Mar 2019 11:35:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0EB1309EA78;
	Wed,  6 Mar 2019 16:35:45 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FF651001DF0;
	Wed,  6 Mar 2019 16:35:41 +0000 (UTC)
Date: Wed, 6 Mar 2019 17:35:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190306173539.4c4f0983@Igors-MacBook-Pro.local>
In-Reply-To: <1551879417-21031-3-git-send-email-guoheyi@huawei.com>
References: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
	<1551879417-21031-3-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 06 Mar 2019 16:35:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 2/2] hw/arm/acpi: enable SHPC native hot
 plug
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHJKcTt2qDWW

On Wed, 6 Mar 2019 21:36:57 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> After the introduction of generic PCIe root port and PCIe-PCI bridge,
> we will also have SHPC controller on ARM, so just enable SHPC native
> hot plug.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cebec4c..b6fef28 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>      aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
> +
> +    /*
> +     * Allow OS control for all 5 features:
> +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> +     */
> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
>                                aml_name("CTRL")));
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));

