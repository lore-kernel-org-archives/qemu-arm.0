Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5738273wrx;
        Wed, 6 Mar 2019 02:35:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4KstrfsN7EOTDRFiT/V+tk9biQU+Dum3rN2DgQQmJh2EayO62ivKSAKL40U6Q+L8OczwN
X-Received: by 2002:a81:11d7:: with SMTP id 206mr4677995ywr.267.1551868558486;
        Wed, 06 Mar 2019 02:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551868558; cv=none;
        d=google.com; s=arc-20160816;
        b=gvnRI5Ro9jhYHdXX7yj+J8Fs7St9t0gjdENsA20HlQU1+JUx9qTtj/xg/LoFHXiLFJ
         BAX1GlJ5fcEX45XxaqKkWUn8FI6F7gNBV+YPD9R+XWn1LbdKwWMHjK6eg7oWtLZhBFKp
         j6Vn8AiviJMblSuGCeAB+eAhPK+zZFHH0rPhbEW8y2XZMHH2KFN30AT3yQxxHYUOP0Sm
         1Q48SuDXYfwkVI4mWHjeB2p2JaXoeHdGVL08en62qazz/6Y1oEM5pwoIsI2e2z1aWC8f
         KZFXFYIvFZG97sNFihDAv0ZeuDClyWmSZov8nN69E7oI+V33UYvtSllT16beNiERY7yE
         wV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zZD8onaTdYcsnS/03cNEpLm3bmOuM2Xjdq3SfQQtLpg=;
        b=ZRwkN+lxpQomiP6IfBvD3VKmeqT8g4Lw7LBDRw+gY8T6jIkKtKU0NVj6G6dTsgwS5m
         69RAomMLYwXLe6Qlms5pTLNuse0Wujv11jOKxFIvGfLfMKFvy6yLp9TmxrXFv1+S9Un+
         dTT23mXaoey+HsAJJVmAg3D7IY5gNDsJ+CrTnOK0mqScJqtnZX2h2yqCETE1lWPgvH5h
         UpVNg2QnungjJgqiQ/WBawpmpTNrhqfoBYItFIdXUlGbQmmhy4tIcNzoy/id/PFHc5uB
         zMVDajQC5xlKOrldHjw1K/nXQQUIJ/p8WY5gVmD57lf/vXopFK/FbaQmUXbvaYwL3gyN
         y/Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f184si598079ywb.219.2019.03.06.02.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 02:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Tu1-0005dd-VS
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 05:35:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1TtB-0005B9-6c
	for qemu-devel@nongnu.org; Wed, 06 Mar 2019 05:35:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1TtA-0005Ox-8Z
	for qemu-devel@nongnu.org; Wed, 06 Mar 2019 05:35:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1Tt6-00057X-WE; Wed, 06 Mar 2019 05:35:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49587308213A;
	Wed,  6 Mar 2019 10:34:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6B46B47A;
	Wed,  6 Mar 2019 10:34:53 +0000 (UTC)
Date: Wed, 6 Mar 2019 11:34:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190306113452.688aae6d@redhat.com>
In-Reply-To: <1551823429-1440-2-git-send-email-guoheyi@huawei.com>
References: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
	<1551823429-1440-2-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 06 Mar 2019 10:34:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 2/2] hw/arm/acpi: enable SHPC native hot
 plug
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
X-TUID: JNH8IO4Imp3Z

On Wed, 6 Mar 2019 06:03:49 +0800
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
> index 1c84e87..e8e00fe 100644
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
>                                  aml_name("CTRL")));
ditto: fix indent

>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));

