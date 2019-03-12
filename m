Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp210271wrs;
        Tue, 12 Mar 2019 01:27:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTf9R1kllTP0JKhSqYd1Afad0IaUNuOs6ov7qds/BiA76qoFxOx7KTuADJ+5GMRrC96yOR
X-Received: by 2002:a81:5ec5:: with SMTP id s188mr3559595ywb.381.1552379242034;
        Tue, 12 Mar 2019 01:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552379242; cv=none;
        d=google.com; s=arc-20160816;
        b=OwV2XxPC689VzjoVgg28gSkxFNxb1UxtfSqsEwt76zgH53slTZbS8TJf16PRNxqoQf
         2MND5LGn9HRumJcJvoFo6gSYwQ4iNRZ3rmii/QoVea2jrSs+ocu8X6y29V1jjGpTNINp
         0bjYrbd/JSyfAFhmKHm73Iuqkew93ZGy7LkbkX/ouGV8FKm0PheUZyhalhdLfA83R+U6
         cPPriy2w7Y8lG7lMsnsDgmPz1HmVhfUkB7s+rK9B0z7PXWp2vP0wLIBEIGhm2ffpOeTe
         9Um9nZQDzJpEIZMPOSKKwH31G2Q+lasLeczqZhQyJ0X2xms8GOk8HNUd9ATOvr2s5I3N
         kpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=t6ioNSbNh4OiPQk6fM5ApqdJmjWn6l161TvEm+Rtxpo=;
        b=ucSJdXvDH99ATuUW9cTfOGbiY7Lg4MEvgX+mXGGjtsms+11w5ArgdgABrHQS1kDEH/
         h4rGidn4SGZh89BNA8j/BVWqwMBTRTMEfF97WA59kUNRP6JFuX6gysYnN+PVCXqSGPU+
         WcbaDs6Cprw5yoWN4OL8CRTXjjDuhp2P6YVf6wnG396d5oCF9R8DepmJC3SelPGv9oqO
         +uH/XRZQlcXRfHtbVreASMKK9MVblPOKzdPUehr3ygKoUkHMSGinOFozNCZNc9WSYAWZ
         HjquRhlZAkW1+2UMKuJm73c1c52yFMSV2Dzznnc61wT2v19DZ144wtzVgp0OdRprZquo
         AVZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k141si4502699ybk.488.2019.03.12.01.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 01:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3ckr-0004pJ-8g
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 04:27:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3ckk-0004pD-6L
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 04:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3ckg-0001DP-Fj
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 04:27:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3ckf-0001BM-4I; Tue, 12 Mar 2019 04:27:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 174A5C057F5A;
	Tue, 12 Mar 2019 08:27:08 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6864919731;
	Tue, 12 Mar 2019 08:27:02 +0000 (UTC)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190312074953.16671-1-richardw.yang@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <dfa4937a-b059-afd6-0489-90c35eb67cce@redhat.com>
Date: Tue, 12 Mar 2019 09:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190312074953.16671-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 12 Mar 2019 08:27:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: use
 PCIE_MMCFG_BUS to retrieve end_bus_number
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
Cc: imammedo@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rkV5vE19Dm0c

Hi

On 3/12/19 8:49 AM, Wei Yang wrote:
> This is more proper to use PCIE_MMCFG_BUS to retrieve end_bus_number.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
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
> 
