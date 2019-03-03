Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2997729wrx;
        Sun, 3 Mar 2019 15:38:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGoZARaOf7Pbc2mVKnvY72BO5Ud76TUd6W6rIJIMFyFruhV+3igTSPr/+AncfQ1/7KSO/c
X-Received: by 2002:a25:3252:: with SMTP id y79mr9580086yby.460.1551656338309;
        Sun, 03 Mar 2019 15:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551656338; cv=none;
        d=google.com; s=arc-20160816;
        b=Omm5/K3muZP7VFq/nH6OUKC1pl69i1QhF/PKG/vKrRB9x42OJqes7ybBApBZL3wqvh
         QPMaNV77bNWpGkn66KyEDKS//7HE5XaybtrDabcJ78BNGrywZL1o7qy8w3mtihQq2YfU
         gjOmAmAqDQXCw93QYOuWDSjIYqVKxp9RTq7mEqUfsrFR0dQjv5aO+q/kgPZyFEOZ5uPK
         SFam8TXs+ZIZmiozip6nyu4wMaJfR+kntb4Vui2p7o3/3UYKDdOpnYmV/1e26mhI52KO
         iYo9aBeasBmZk6N/mqbTO2POA46JoAG0RBXXc3Yw5gB2fzXjLZqmZNiOY3rN84tRcJkE
         xbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=lOZO1INMAc5rxqhnF7RWN5LpyJmXoBTGOvhOqJMkcDo=;
        b=fqwRhWEtl2ZzVsv7bJle3e12AI0U6os+K1QtTbuoGNkwbgLuDUR2YiWavAIBWJWMpj
         /iDVNyolmS4Aee3zIOBYMWppQmDv7DSfYtNvqmS1UVl+hXK4EbiPoKPM2Vh3wuhgUOlW
         gE5mnpyqfxFsJrRSaggkH0TYvsPjFy+wwOa9pfkxShAHj3OOYMEOOVs57afetlQAfIJU
         gXDgbwo2o9fG6zk1ayvyCfD/ZxtyiJwbav6B19EYodQvQga5oHNJju1S9cOq3CSI3ODm
         SYiXauuYLjvdebnD0i0cu4GUoa8NWF++QFqrG8Od4SRlHGlBo1P5siGQn5CVlpCyuH/G
         +j2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g125si2477883ywe.96.2019.03.03.15.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Mar 2019 15:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0ah7-00026U-P1
	for alex.bennee@linaro.org; Sun, 03 Mar 2019 18:38:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h0agy-00026J-6L
	for qemu-arm@nongnu.org; Sun, 03 Mar 2019 18:38:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h0agw-00084T-Pp
	for qemu-arm@nongnu.org; Sun, 03 Mar 2019 18:38:48 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1h0agu-00082i-RM
	for qemu-arm@nongnu.org; Sun, 03 Mar 2019 18:38:44 -0500
Received: by mail-qt1-f193.google.com with SMTP id s1so3413134qte.5
	for <qemu-arm@nongnu.org>; Sun, 03 Mar 2019 15:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lOZO1INMAc5rxqhnF7RWN5LpyJmXoBTGOvhOqJMkcDo=;
	b=D2zjMrz53xfIqSBjTgFI9vHXhKUU6XYlff1rjiXD1zX4HbW8E4yUqZuloEO161MZ1X
	0MC/GNMali04ETUP8KW++Iekreso/F0RyYNdbbBqSe/9a2gpe++iuGagbN7v68ZNqaqa
	0dAqqwHXbdp5CCu03dI5VNNkodlAaKw4mU7LuD+K7IVc7XfEZImbz+/XtCDmBCpA9ifq
	h7/ivgRI+SF6k73DldZiwSgWY2Cgu5MGgT8qK1HSbXA/xBDhyUva8QaCpVSMCNpUJBNk
	rb5OdothygevmHTopFVt/aRdeczLCdrJ84vAY59u9yKxLh5dRdD/R/kmbgBJTiOFiWkt
	jWwA==
X-Gm-Message-State: APjAAAWpdqpbKMW1uZGYprAOVtF/Uws+9QLvJq4kQAfBvp1idousz3w8
	52IO9wUT49E8Ernql2RNL+ucEQ==
X-Received: by 2002:a0c:8b50:: with SMTP id d16mr12102310qvc.233.1551656322676;
	Sun, 03 Mar 2019 15:38:42 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	d51sm2988032qta.31.2019.03.03.15.38.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Mar 2019 15:38:41 -0800 (PST)
Date: Sun, 3 Mar 2019 18:38:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190303183805-mutt-send-email-mst@kernel.org>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.193
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eps+GJa6/V91

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

I don't think you need two Signed-off-by lines.
Besides that:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Pls feel free to merge through the ARM tree.

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
