Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1566017wrs;
        Wed, 13 Mar 2019 05:04:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlrmkaZtcv8RSFvXEaatqkEGii28Ut5w0MqMVAH4XyNt1soI31WmWzlWhITR15rqZv6pUK
X-Received: by 2002:a25:af52:: with SMTP id c18mr34371052ybj.162.1552478693345;
        Wed, 13 Mar 2019 05:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552478693; cv=none;
        d=google.com; s=arc-20160816;
        b=hoZWNsEcUT9cWEZ4vQNC0qgPDM0Enb3WKDBdGejttOHcmj/Y5FkH8KbdcSrkAWkmUz
         27hSA0HR487NlNtZSmu4XoLfwS59wfpnvsZoXqMnXGRrwQp6rkQ1+eCcHpIylK/TeC2/
         zhq8TmLiaLfZO6di1vJv28D8qk6XNBbRrHpOHD538pF3E4bHggtRhsq126/my5kyFO+6
         c+rlmQb526+Ggi8XE3HymE6P3coQo4AQqJYSSZPDhTNhYbc26cbP7fcztWl8a6/GS5s2
         OnjFE8Ux5cIC4RZ/HPqAzT2D5Uygq/6NXMJgcrlQCIp+7J+oeDp1Teczb+XWbsXR0xI+
         QEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7jDfaPqV6PBVkatu+rDR2Hy1YwHUJuOYpFI7do5XfHM=;
        b=J83HzlS7HOAp/BUxePMeOG649wWriLUAxcK0zEYd3xwJjqrGq4tt1Fjj/nEtmQGz3X
         h3rTk5KKoVPdy9Ix0LvZEVM61m0rCRBZS8CrsMyeDGJB2eY7ejJ5Kqvmvf/q/zLZYQ6y
         03i2xyHFJxH+Fa/fE2TjB2F4hGWlbJThXkxAkUlXdjgmX5NRMy4EPUdj/vkaeAFJyC9j
         /xjvF9cFE6zdk82FYYXjmihnoPICYeEsb6l1nMAJNXWD7ggK84Rhlny728gdSFn2l3hi
         7D7XRea36OlrMTUsFNgWCy6npV/yC/OCJ6NBoD1TO8+AfGgcr7JnpjNMYu8FDM2nHvMq
         578w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128si6246917ybf.416.2019.03.13.05.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 05:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h42cu-00056b-Jx
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 08:04:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42XC-0000x7-85
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 07:58:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42NH-0008FX-Op
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 07:48:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h42NG-0008EN-IB; Wed, 13 Mar 2019 07:48:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7BD23089EF0;
	Wed, 13 Mar 2019 11:48:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 540E766077;
	Wed, 13 Mar 2019 11:48:38 +0000 (UTC)
Date: Wed, 13 Mar 2019 12:48:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190313124837.5082bd7b@redhat.com>
In-Reply-To: <20190312074953.16671-1-richardw.yang@linux.intel.com>
References: <20190312074953.16671-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 13 Mar 2019 11:48:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: use PCIE_MMCFG_BUS
 to retrieve end_bus_number
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
Cc: shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U9mKv2fLogUD

On Tue, 12 Mar 2019 15:49:53 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> This is more proper to use PCIE_MMCFG_BUS to retrieve end_bus_number.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7e2e4885b..57679a89bf 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -560,8 +560,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
> -                                          / PCIE_MMCFG_SIZE_MIN) - 1;
> +    mcfg->allocation[0].end_bus_number =
> +        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
>  
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>                   "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);

