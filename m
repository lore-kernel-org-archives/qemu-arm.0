Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5737144wrx;
        Wed, 6 Mar 2019 02:34:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCOj4Vai7X3+bN5/itONGshOM93MATy+RnAZKeBGkXtdg4e/pZhK71y8Hx1knn+x7uopIF
X-Received: by 2002:a5b:54e:: with SMTP id r14mr6176370ybp.214.1551868472854;
        Wed, 06 Mar 2019 02:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551868472; cv=none;
        d=google.com; s=arc-20160816;
        b=zSXSObfAe0S0vgefggBTYsXXK7t/+QZ4g3shCne0bS9ALM4/5HFoM8W6wTBEaUJnxZ
         W7TI8+Dpy9X8+JhVXgFfH4mZGoE6t4P6h7UWUsoerlhTl5IiSmMm4yo1aUOEMyieRlo+
         AA8X/U+Zt9nfEtBrKNqRopQDROsNpC0qECy7zziJSBL0qCwshdDBA6GD70hQSBw0y9dP
         V+qoSF36pL/Qa6hth9sli20wxG3G9+md/pNl4AV/pl1zIJFFpTw6yzAnq9cF0NCrjEIx
         FjCvH6TF6ZsvHL8XaUGknKd10L/0tj8JwJV8dCYYzhclKoTDx5DVSBO3iF6Vpjd1OBr7
         ZMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=juSLf71v/UkXOtAGK4yfhOJD8sTTW80Qn/aPvZAo81s=;
        b=PxnCVKEJg4wn4CvwI24QskqH2vZ0VsvbvVOt0lWlp/wADuAfQermunY+iNwIDkBLOd
         7HFLPN7Ynv/6E7RTNprpIIqaYldtLo83GyxCLPEDaoqQxeTx261bjrDd+3KcQhvaX9WN
         YiZ76YGOMpEPeiAbbliChSEaj1AQzBg7/pdrFbek9v/z8hczVtNoLQKfhG2ijqcLE3UU
         Fei+jY2Pv3atWIm/zqvr1rnJOwKiUBMyRi5FRVt/EVQqyLH664AAKtEv5v+CZ1t77oq2
         /P2h6pS3Ezat2hcdn76K1C53J7lG/IicT73JgXk7j1Y+f3YeTUEAEdEazOm4L/E/JFAL
         Gyiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si578815ywb.376.2019.03.06.02.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 02:34:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Tse-0004az-8q
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 05:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1TsN-0004Zd-4v
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 05:34:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1TsL-0002Nc-5S
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 05:34:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1TsH-0001gU-Aq; Wed, 06 Mar 2019 05:34:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFB9F8762F;
	Wed,  6 Mar 2019 10:33:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56C9F165D1;
	Wed,  6 Mar 2019 10:33:56 +0000 (UTC)
Date: Wed, 6 Mar 2019 11:33:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190306113354.5a98654b@redhat.com>
In-Reply-To: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
References: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 06 Mar 2019 10:34:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/2] hw/arm/acpi: simplify
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
X-TUID: O5dD5E1YbagI

On Wed, 6 Mar 2019 06:03:48 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> The last argument of AML bit and/or statement is the target variable,
> so we don't need to use a NULL target and then an additional store
> operation; a single bit and/or statement is enough.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 04b62c7..1c84e87 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -265,16 +265,16 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>      aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
>                                  aml_name("CTRL")));
pls fix indent in all such cases. I'd align it like this:
   aml_append(ifctx,
              aml_and(aml_name("CTRL"), aml_int(0x1D), aml_name("CTRL")));

or
   aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
                             aml_name("CTRL")));


PS:
When making multi-patch series use --cover-letter git option

>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>                                   aml_name("CDW1")));
>      aml_append(ifctx, ifctx1);
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
>                                   aml_name("CDW1")));
>      aml_append(ifctx, ifctx1);
>  
> @@ -283,7 +283,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(method, ifctx);
>  
>      elsectx = aml_else();
> -    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
> +    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
>                                    aml_name("CDW1")));
>      aml_append(elsectx, aml_return(aml_arg(3)));
>      aml_append(method, elsectx);

