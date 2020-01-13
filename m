Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4071594lff;
        Mon, 13 Jan 2020 04:37:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzW3NJL3PHFDGOtwa6kXZM95KatbcxF61Ei5jzK5x8sizRpxr2aM4u7h7oTJ3miN0aDpjYh
X-Received: by 2002:a17:906:b296:: with SMTP id q22mr16506157ejz.63.1578919051281;
        Mon, 13 Jan 2020 04:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578919051; cv=none;
        d=google.com; s=arc-20160816;
        b=kkmBA0gEU0mZiSKxljBpsXRT5q7+Y3oTbCdMIMiZKJtVMq9A65U6YQF9E2MHWD37Xk
         JHrVUY7qqEEkPgkSW2JHAOKPEd7OP4/71sAlUqeJJH/YWRC2g4RLdtSl4mI/FUjE9jHa
         KgKLaZ6KlJOnU5z73XWwVPTRTOkZ0R7rsgHWqWvlhRqUdyv+SnlODUmFjAaXw4wj4bNC
         TEAlzV5sJiICqPlzUbobq/NFgeiHc12PY3Es0WPF8nrULLC490meBiICikggK3RGqUCm
         hG17/tbkA6yOEJX3M+xWq39m+G8An3eVRcTj+UX5ZGYSY3Ol/08S08qe2jacdrSrxZAC
         HXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=PPc1Xk2yvy7/cs1SbtCSLT4g2uYuUuhz/paLpBUWttM=;
        b=dW1S9XAMQp9xgkTCZQeGnOEHZ4n5jZs2HmBA0ihphu7WWk/pROd5FQpiMtDDOCygmV
         tSTsZQhvbPIFKTkP35XnwSP8znoGUB99rm7Hx8Sy+Pc8BfCHMX3j2HmNZgQJGheWudEc
         XopxS+IoJbdgXJDVaKIgExoUvDokXxLd8BsfE8aDgfHHdKLC/A5NLwSQrZ57BUG2ytPo
         hNO30PDUtPyLgkELozYmOhrdoc1VaEiKGw4pmpLR4Z8uTK3N+NHpTPQohyt9UR5SDoN+
         7UVfB0NAT/P9tuk5i+u6pnbJBk7d2zuX2QSp8D9CT3ZXIaHws7rqeTL5zWDpstvcr2ii
         PdYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U8BO576I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh6si6808866ejb.228.2020.01.13.04.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 04:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U8BO576I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqyyI-00083u-3Y
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 07:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iqyy5-00080n-OW
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iqyy3-0005PD-1i
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:37:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46447
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iqyy2-0005MQ-IP
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 07:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578919033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPc1Xk2yvy7/cs1SbtCSLT4g2uYuUuhz/paLpBUWttM=;
 b=U8BO576IzktRoak1AXNRY6UWoG18o6G7HK3SEGSUI2V+Culwrf6c17NJ+rbzBs/lku9icR
 kazTXkCzHo8fSmI6cwQzkR0GTbeE34p+oyeVDI71mFtr/XPzvOI82L0uhF/tSBzCl8UbDd
 ELxDLwJ+B6qAnZE+jmZprE6HZKvmCc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-5wh9VXhqM22ttng1CfXbBQ-1; Mon, 13 Jan 2020 07:37:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EF6F2EE3;
 Mon, 13 Jan 2020 12:37:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1A4087EC6;
 Mon, 13 Jan 2020 12:37:04 +0000 (UTC)
Date: Mon, 13 Jan 2020 13:37:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
Message-ID: <20200113133702.1dea867b@redhat.com>
In-Reply-To: <20191219064759.35053-2-guoheyi@huawei.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5wh9VXhqM22ttng1CfXbBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47Sv/4slhSZA

On Thu, 19 Dec 2019 14:47:58 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
> so simply remote it.
Could you make commit message more concrete so it would say
why it doesn't make any sense.

It seems to be there to describe root port,
I'd rather have PCI folk ack if it's ok to remove it.

> 
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> 
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c          |   4 ----
>  tests/data/acpi/virt/DSDT         | Bin 18462 -> 18449 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19786 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18449 bytes
>  4 files changed, 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd5f771e9b..9f4c7d1889 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(method, aml_return(buf));
>      aml_append(dev, method);
>  
> -    Aml *dev_rp0 = aml_device("%s", "RP0");
> -    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
> -    aml_append(dev, dev_rp0);
> -
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>      crs = aml_resource_template();
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32ec856feb388be4c 100644
> GIT binary patch
> delta 39
> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)  
> 
> delta 50
> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I  
> G{V4!>hYx%J  
> 
> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
> index 41ccc6431b917252bcbaac86c33b340c796be5ce..69ad844f65d047973a3e55198beecd45a35b8fce 100644
> GIT binary patch
> delta 40
> wcmcaUi}BPfMlP3Nmk=*s1_q}3iCof5t(P{ccXBfI+}XT|v(|RAjk`1(02g)*ivR!s
> 
> delta 51
> zcmX>#i}Cs_MlP3NmymE@1_mbiiCof5O_w*ScXBdy-rc;3v(}c2J1D>)o+IATC1|sb  
> HyBr$;t7;Fc
> 
> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32ec856feb388be4c 100644
> GIT binary patch
> delta 39
> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)  
> 
> delta 50
> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I  
> G{V4!>hYx%J  
> 

