Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6097916wrx;
        Wed, 6 Mar 2019 08:34:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIcqpHjqdnze3BvZjT1h0Dh+UlULVKl8a2X1VE8GyRcPCYTyxSJzuTWUyMuUbJd3xGNspr
X-Received: by 2002:a0d:cb88:: with SMTP id n130mr6314097ywd.454.1551890083987;
        Wed, 06 Mar 2019 08:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551890083; cv=none;
        d=google.com; s=arc-20160816;
        b=GM/KWhMtueFQP6Hfwk/V7KzdGdaslcG8JZSOEEkZPVQqPvHNwueefujxBqKCPz0r3X
         BmkkxDyM2AIKODxgUIS4iDysZqNGYrCipeMcA+hT7GUfMBBUpEEuH7dZnGOEg8cxyhon
         S5h/YHaLq9bVzsA+AWam8SpU32FVRDm4nj5vabKdlxhvqnyCRNb7JxHRJlLYcNVqoqpc
         jbywqTYFdiG0p3QptDlgUUtfoB+sNSazWM9dn306CpvEGvj9dfFJ+rRSLlJcwsRQdU//
         GOtjfni8DsL+R6uq+nmflHAp4CGNzj9x3eeJqs1NSPDFUwEXJO3O71QbfPcc6d4rA1x3
         bUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=xs9AeMS0Ritw79M1bHFm/kWBcvGAITXQR7UbFEFEfXo=;
        b=voCzW4Etvmwuc0/UhsajAPxJxgfkLNoFYrgxf2ex1V+5LslutxZF77yxY0awiv4FMI
         TpAF+J0OUrtL7+90ci9LHc0gHaeCT+Fc4TFevZcZBJDu6I1FcWFWQBcBo8FWU92IGddH
         EC/DP/O1Ik8aPEawWrwDxIXYy0juUxCSyTw7jelcJ4jwppFczDrTRIFdcapA+SGPbHVi
         Pnb9lAi8MQFRyIZDiG4Nu41G9wkgtBT6ZalLmWWBDo9oFh549YYBVXN1p/6t4rwwp6vY
         0PfPv5KzKnRxc6IpX5suDlXja2Tke6rfLb91TVxw/ZElEQjgCUv0fgj3KVRJtUYxlNL3
         9RcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si1113160ybg.260.2019.03.06.08.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 08:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1ZVD-0006mT-DH
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 11:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZV3-0006mJ-LL
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:34:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZV2-0004p7-AF
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:34:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1ZV0-0004li-D0; Wed, 06 Mar 2019 11:34:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E145230917AF;
	Wed,  6 Mar 2019 16:34:27 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D042F60C7F;
	Wed,  6 Mar 2019 16:34:23 +0000 (UTC)
Date: Wed, 6 Mar 2019 17:34:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190306173420.3614a38b@Igors-MacBook-Pro.local>
In-Reply-To: <1551879417-21031-2-git-send-email-guoheyi@huawei.com>
References: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
	<1551879417-21031-2-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 06 Mar 2019 16:34:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/2] hw/arm/acpi: simplify
 AML bit and/or statement
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
X-TUID: WAMCC+W7l2QW

On Wed, 6 Mar 2019 21:36:56 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> The last argument of AML bit and/or statement is the target variable,
> so we don't need to use a NULL target and then an additional store
> operation; a single bit and/or statement is enough.

s: a single bit and/or : using just aml_and() or aml_and() "

With commit message fixed up:

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7e2e48..cebec4c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -265,17 +265,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>      aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> -                                aml_name("CTRL")));
> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
> +                              aml_name("CTRL")));
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
> -                                 aml_name("CDW1")));
> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> +                              aml_name("CDW1")));
>      aml_append(ifctx, ifctx1);
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
> -                                 aml_name("CDW1")));
> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
> +                              aml_name("CDW1")));
>      aml_append(ifctx, ifctx1);
>  
>      aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
> @@ -283,8 +283,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(method, ifctx);
>  
>      elsectx = aml_else();
> -    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
> -                                  aml_name("CDW1")));
> +    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
> +                               aml_name("CDW1")));
>      aml_append(elsectx, aml_return(aml_arg(3)));
>      aml_append(method, elsectx);
>      aml_append(dev, method);

