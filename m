Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp649910wrx;
        Fri, 1 Mar 2019 05:54:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOESKjOOxOoxqRDpFLMlXe0VLfmPfXylFA1TsZPGkET11D3V8HPrJBKNfL2jCY5oRMGUVc
X-Received: by 2002:a5b:5d2:: with SMTP id w18mr4394164ybp.6.1551448447418;
        Fri, 01 Mar 2019 05:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448447; cv=none;
        d=google.com; s=arc-20160816;
        b=SeWZMjrEJQOdSNJuW6im98eZnJSyYMqZsdD/0vJL/QrAT74WxOZ9um3sWrEHGDzRWh
         1BpVPIxu7luegR/2forV6C4nmmOlGvouBf8dkVjBCMcn60+e4IPlqzIzDhZ8vH+OIfPa
         mX/ZQzq2bRB2MLKkDDvY0vMJ/NOBU6JGvcN6JW7r0lUXRRvEsshhFGsZpIv2fM3T7w67
         e4CtZ+4Roi2HHCcRld54BhZX29WJNdkYkB8jxRxyRTd84badDpBKLBItdagTLvxKc1Ym
         JpiCzZuX6LqdZ6yganSfPlFlug6Omw/B5Ns8WoSO+Z82JiSswmbVoBYLZ219Y+/e0Y1o
         i8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=dv6Y45eRAwx2cAjUXKYaKVAb+JOLGdH/SQChx0uvDaQ=;
        b=kyMCUHIelxiWCQ5mKKzp+cy2TiHp6JKcK+JVBzJAWsuOCPmTGoqvMZDHWzqg/4vMrv
         BjTjXxvXYR6kA4U0v8RQJXTyBCkqM6nXbpAH9H8HcKl0GWv/aFEdGROmPBQD9+TBRgW3
         Aglu/tl6a5c/BW+qaq7b4JuPsiU/ddZMztD1pjNvRNX8GcSWXi0oWaVrcoi+IeVMES+R
         RGRhYVRRqlgY/36ukcYk10YHQrVT1iXHs/V6Lri1e3yuEwgfujWEyv3Hh8e+vFGdC7A/
         y+06OcbhdrXxnRvunxYSbA0esNHwzwBK57WnCbXSNSSndIwQVdJj9JkLxKbHf5vOFp35
         5qeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c206si11769607ybf.177.2019.03.01.05.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzic2-0007PH-O1
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gziVx-0002uG-Mw
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:47:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gziVr-0002ig-Ar
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:47:49 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38255)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gziVq-0002ec-WA
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:47:43 -0500
Received: by mail-qt1-f196.google.com with SMTP id s1so27744882qte.5
	for <qemu-devel@nongnu.org>; Fri, 01 Mar 2019 05:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=dv6Y45eRAwx2cAjUXKYaKVAb+JOLGdH/SQChx0uvDaQ=;
	b=hyIJS+HB2Wlpem/ogCwaz/bs+4BjoFq09IjZeZWe5BibY1NatTtIlhTfCjoLMw2GLm
	L43R9CixRDoVMwkKmvPNkBPz+QrBcC3dYM2cBs/WDdTPQM5sptbXsZ/R5lxQffNK06nz
	ok+iltsLUZZzrjPSk9AbU1PtCz6EpJfnO3ZFPfyzKNwEI9gCtRKWnitaqOG8Ic4b11/R
	/FqhsMkDGQ6t2QUkUxnIXOPgSBCQVi/B/MjeLU+vADKBW/LbNuyGlU79fJj8GePID+8Q
	2PhmVwg5qwQ8M8DQ9qF5ZqT/OPApYdWlQoCZAsjGQ9IliQIJqa4oFN/UsESApMCvPJwX
	U6Qw==
X-Gm-Message-State: APjAAAWdlVsOw5XEAcBuOnuWPRFaEl6JZYUzCLrXUCbNhifHdFBB4oJT
	TEWJ0SwDb2EVoYEEsfvk1f9Xjg==
X-Received: by 2002:aed:2a56:: with SMTP id k22mr3964523qtf.85.1551448059861; 
	Fri, 01 Mar 2019 05:47:39 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	r22sm13712032qki.43.2019.03.01.05.47.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 05:47:38 -0800 (PST)
Date: Fri, 1 Mar 2019 08:47:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190301084619-mutt-send-email-mst@kernel.org>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: Re: [Qemu-devel] [PATCH] hw/arm/acpi: enable SHPC native hot plug
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dxBBBQueXyjH

On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:
> After the introduction of generic PCIe root port and PCIe-PCI bridge,
> we will also have SHPC controller on ARM, so just enalbe SHPC native
> hot plug.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Signed-off-by: Heyi Guo <heyi.guo@linaro.org>


So when OS enables SHPC, should we block ACPI hotplug events?


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
> -- 
> 1.8.3.1
