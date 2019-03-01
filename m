Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp473736wrx;
        Fri, 1 Mar 2019 02:44:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwrQMxcsgAX8Y/9PqqMCBJWCs3PKH2pXENnSH1cbLlK7uOat1jj8X4ODyZM0iQ+aQF61cA
X-Received: by 2002:a25:5a55:: with SMTP id o82mr3417676ybb.513.1551437071677;
        Fri, 01 Mar 2019 02:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551437071; cv=none;
        d=google.com; s=arc-20160816;
        b=bJFA1KqIgeg0jGeK3fWvxV7AYbzGS+zMGOurqKirbcnOE8gsOt0u7fBLasrnD5FF4Q
         L7KxAgXdghdOlJjrLK1gwfDEMk0J4yRRi23h/3uyTCSHr/McRAaTGGhac7+Y6LK8GLmm
         LuaXY2ui9N/h7zqrREYsOySNaI7awyGIVYrE59bD/q1Z48BuIy+3PNBE8GRHUeShDK7i
         tzoJCa/AYS8gdfIMM7ss4G+lrK1b5tifoqkJQ7TNCiIz/fzQYLe6l/lFCbPXkw+7s7f3
         nKroV0lCulC9tlH9FazmTjlwkT94e1JtHY5hHyVjE9hthap3uOrgs3LkdjPele7Wv29t
         fIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=uSr/6Xc2ZNDNdKwZGKIi+a5xXpZAH7hYyNjVjUPBkMY=;
        b=aKrFI+grqbKsSks80Op/6eOQ+6W9y59UJWqKTYfNpM565iLKghNU8EJaQeZ/ymq9qz
         nFEwXHBxfUd8n5LoySohkCnuTWT3ULbJIpkFMFX6WIIPkCqJkSHx9GsXscD9VeQneBF9
         Zrhe9SIF3UwPmtpGASbyscXKsDSejz6WvlI1UYswLBrYA5XvcuYty/Wlc8Vc38286/2P
         4aASl5sz89l5fJWx5hJ4k1tr71hKcRUBNlBj3F/IGtsDj0q77HzDodI2Q++vqqc8rVdF
         BqOmZ0oatChqcpBYFRho7yyuztuJxWYIsbuwqooukpnY1Q/YM0k+E1UeoHETV/eV+mCr
         liNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si10031763ybq.106.2019.03.01.02.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzfeZ-0000LN-6U
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfeO-0000Je-FH
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:44:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfeM-0008HW-7V
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:44:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzfeK-0008D6-7s; Fri, 01 Mar 2019 05:44:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0147DA0B97;
	Fri,  1 Mar 2019 10:44:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 362071001DE9;
	Fri,  1 Mar 2019 10:44:06 +0000 (UTC)
Date: Fri, 1 Mar 2019 11:44:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190301114403.1e8324f4@redhat.com>
In-Reply-To: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 01 Mar 2019 10:44:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/acpi: enable SHPC native hot plug
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
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQCLkQHTvl2n

On Fri, 1 Mar 2019 10:28:30 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> After the introduction of generic PCIe root port and PCIe-PCI bridge,
> we will also have SHPC controller on ARM, so just enalbe SHPC native
> hot plug.

Just out of curiosity,
An understand the need for SHPC on plain PCI but in case of PCIe
why native PCIe hotplug isn't sufficient?

> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 04b62c7..7849ec5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>      aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> +
> +    /*
> +     * Allow OS control for all 5 features:
> +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> +     */
> +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
>                                  aml_name("CTRL")));
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));

