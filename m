Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3727575wrx;
        Mon, 4 Mar 2019 07:27:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4hSF4m5a3O9lOSzY7Ta+86cyePfEYjfQvyC209D97CjkPqnAieELUbm0YHJR19qGUrfxu
X-Received: by 2002:a25:c947:: with SMTP id z68mr15091103ybf.522.1551713270180;
        Mon, 04 Mar 2019 07:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551713270; cv=none;
        d=google.com; s=arc-20160816;
        b=aRLw+flUiLRXXyNt2hopMoHRXJ/NLoZGbXHFoWOx0rrkvjs8v5nNbJDf63+XLdhXoC
         JYHtRJ0XHrs5D8XIX2V0BJZSdhjTdrtEP0sH0m7x0KS3K0+4nPSvaWzZwrBu03NmznTw
         rqcn1wWsLisGRVjmwnl2UQZ75leKEUjMnssXUwuntXZXojHJ9OufJuZcWSUvV9+qL4GZ
         /Mjf9ZIL+9VjcIv5miooi7YPxFVzEFeyZ3aGaYgBpPG76BM/e8Ic2onHsn2xSbnRMixl
         9J7CCHngZJkIy3PFFc+JwM0WZId1tmceCCmQzf0H4uUhjiUxknQHg5I615ay98C/4Dk6
         FViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Yborkn+y0gzbdoUNNrQ48bsdIz9G7oacaT+JQYBk69U=;
        b=vIoKI6ohsay/4Hmk0NsZAOQjNWkA/xVyYh1MIjMubvEqQVrpjZdspGlfewX1oXVenD
         Ik71TIS0gMPxF99f0LuQJf4YosXPA8hqlwG2QEys1t0ztzFjEDPt/9QFpmiT0UZwld/F
         BylltgRel1mYNrEKktUhktNwXt3FkZDuLBoHZItFRmtFnNHbwi5ie6AggVdX3LRMySdM
         xPrUjn4rcgEbp1gUrVcatatATonp9MevUEtBX/5rLAT2ZikwwWm5y2E/1i2eBO1Kp1eX
         rcoq4B0+kiwea8f/mbS7OXk4pHl8aPwDVoVZRcZC9P2x/AzRHf+hBP4zVvDdY3ftkMWi
         dJ6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p83si3475362ywp.229.2019.03.04.07.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 07:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0pVN-0006Lq-I4
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 10:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0pUv-0006Js-6v
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 10:27:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0pUu-0004ug-BN
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 10:27:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0pUs-0004oT-5e; Mon, 04 Mar 2019 10:27:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E8F381107;
	Mon,  4 Mar 2019 15:27:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 657F86085B;
	Mon,  4 Mar 2019 15:27:13 +0000 (UTC)
Date: Mon, 4 Mar 2019 16:27:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190304162711.105e09f2@redhat.com>
In-Reply-To: <1551705934-28745-1-git-send-email-guoheyi@huawei.com>
References: <1551705934-28745-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 04 Mar 2019 15:27:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] hw/arm/acpi: enable SHPC native hot plug
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7rsAXJ8fS/5

On Mon, 4 Mar 2019 21:25:34 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> After the introduction of generic PCIe root port and PCIe-PCI bridge,
> we will also have SHPC controller on ARM, so just enalbe SHPC native
> hot plug.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
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
aml_store here is excessive, you can use shorter variant that x86 uses

 aml_and(a_ctrl, aml_int(0x1F), a_ctrl)); 

the last argument of aml_and() is the target var where to store computation result


>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));

