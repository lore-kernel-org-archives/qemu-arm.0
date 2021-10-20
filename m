Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1318572lfc;
        Wed, 20 Oct 2021 01:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg2YjfxQ5duhvBVUX3Mb3RquMTXyOiD6rpRhvxnJ+1jV7sRlKkYHzadmEevgONOSmmWGUz
X-Received: by 2002:a05:6130:328:: with SMTP id ay40mr5705158uab.60.1634717154278;
        Wed, 20 Oct 2021 01:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634717154; cv=none;
        d=google.com; s=arc-20160816;
        b=qUj1dCqKI80btKKl2flYDvZ/PynPi1nIHylJpvS4R9MATbBgOspFC7cGaHXP3jSUcO
         TXQIOsttHFMXpwSoL54qjBZZ14+KEF+aPXi3RcinDzFYZOcFDeXf2npBJS9ohP9QyxLa
         wBx2MTsFEX2QkgLshOXthNuF9ERiFxS/yWPZGnLFqPu8x9vGgHFT15Qa21R9uQMfYAF9
         ifUpRejfFySuaB8i48iaJ9Y5viVltOuoUUmLegBHjOstLArj8rmfNa6RVYiEkr9VkgBG
         fhuZnmc+CKGjAApO215dgHRApX2vngdNxy157bZNSAHdyvzVNFU9AeiB+j+IU3iP3gCp
         GNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hwWPIg0vwvy7V3XTnW2cfbDyNpTX7D7BIv9wmbJB/ic=;
        b=NjnfLYgX86w8ohu0YgKXG24AGiOXSOw/nmDQ/g4YECBSWy8xB0SpW9cbcDQNpmYqqJ
         ESURNJmgWsLXYf1nROGWWLqHc4qWnt3Ho1sdMepILoheizZMnmRwTaGoKR02P9r+jFRC
         TMLELZRGuVdr3Sj9OUxfhoaJ/ZEWczVF6vPnlVopNIYCE14ahz7Wl4jgRLDUQDS55Dfs
         WQJ+52q4av87AEy9mNlFKdViucB3ErWA4qwi/0lb6iu2QvZ1u4BuB4m8OKCFN2FhXHdD
         whiYONC8kxUfrpYFrBSmAxCajO3asvfLX+S/9qrUoQIFrYHm+vlsOAe90Hz7nHudAPYU
         26mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HM81HsH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si1611127vsr.90.2021.10.20.01.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 01:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HM81HsH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md6bh-00017U-GE
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 04:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6b9-00016E-C6
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 04:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6b6-0007EH-9F
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 04:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634717115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwWPIg0vwvy7V3XTnW2cfbDyNpTX7D7BIv9wmbJB/ic=;
 b=HM81HsH5lgpt3LpSVS5gxBovebkKusKDKNyptHBr/upjOAEuf0ra0pkVtsTP2bpkxJEOzG
 uOQAfTwHEHjK4I46bGFkCk/7EPs1vJnSLw63NDYx3vSMqdAymDQuhwpk6yGk7dVROgQ17K
 6op3WYBAliFXCKXHPXjIud/l7dQNqFA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-xPIPoO1lOj-2WFJluljJnw-1; Wed, 20 Oct 2021 04:05:14 -0400
X-MC-Unique: xPIPoO1lOj-2WFJluljJnw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso2181928wmb.5
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwWPIg0vwvy7V3XTnW2cfbDyNpTX7D7BIv9wmbJB/ic=;
 b=nXU1BwFXAd4LGNSU69Uk/c9B9x4lblDVeT950rljUEYeiHs9alToqggiBZon1roqOa
 YYm9QULiohg9D3JShxOReqWcQsU+j2RN6gbOT8tOk0Zqnuozkj86t6/l0r6CBYUrWgwr
 GH0HZBV6nCgOl6DZJgC86ceIy4XBJHatMPOmdGGoRzUIacff9AYWEhEopc0IXD19svio
 m50TjHFF9uuar5ZETkqC6SXCGoR7IR4bKPEhPz/dBdyYhYpl+ykt1i7MS9CQOtzfx/GD
 vIg5FA00MDAIicBqF0yMiUZznawErnNrMs+HoBkl75Xwboqcn/G6bPlK0+t4ayzibsl6
 mr2A==
X-Gm-Message-State: AOAM530SuW64aUZwiplloNTvvmAhsd0V1GUJ2KXZmsI/KLUIxsFoAGoW
 KugZE+UUtOAPKcu9M0d1wLEol+xQycf4yxUSLCWJX1g3Y6Ets0+FXG3w6J6iA8lzpzCsCJn32s/
 BEvkfr9dIiZ7s
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr1744235wrt.363.1634717113425; 
 Wed, 20 Oct 2021 01:05:13 -0700 (PDT)
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr1744207wrt.363.1634717113247; 
 Wed, 20 Oct 2021 01:05:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o10sm1408905wmq.46.2021.10.20.01.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 01:05:12 -0700 (PDT)
Subject: Re: [PATCH v8 7/8] hw/arm/virt-acpi-build: Generate PPTT table
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-8-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
Date: Wed, 20 Oct 2021 10:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bhhwb4iGGXdN

Hi

On 10/14/21 3:22 PM, Yanan Wang wrote:
> Generate PPTT table for Arm virt machines.
Generate the Processor Properties Topology Table (PPTT) for ARM virt
machines supporting it (>= 6.2)
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..658a0a5d39 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -875,13 +875,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (!vmc->no_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, ms,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> 

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

