Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1104502lfp;
        Thu, 7 Oct 2021 00:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymV0itqjV9Bz1IL+Wtume7II2OTfgr3DRgF69TfTcoFlQZdTbE2V31AhONypHuur5+vHOD
X-Received: by 2002:a37:44c1:: with SMTP id r184mr2076922qka.126.1633591214469;
        Thu, 07 Oct 2021 00:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633591214; cv=none;
        d=google.com; s=arc-20160816;
        b=BgE87hIejwSnxz7uODdYmNJCjHZ9dDQpaf4PYiTz1TIF42VaCaBj5SCv46/yMxw8Vl
         HPnt+51C4Gh6Ot6xKz5k13Luqx0XW8Z22RLOoI9csOikkLaZ1pzBTw+EtzmJN3uurq4E
         iHwOCwyCTl71IC58rCEWru96JKic+cLK7VIg09SrcLsjnjklZR0lVT8BLVJCgA+AOCUP
         hsklZv5JheMsjAZEQNFijOffA43dligmaq5LR0PzH0sA7yUFsC8gxj/WW2HDi0oU3fsz
         Io++J1qQfW/eHeol23K5qiw7IwlAT3JaRsV2jNlCKNmDkG7rJ4y40rzOn+foVeDssjex
         MGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=nIYg9Hf7gWgxHqxaeuqdywWFpfqJG4aemKy5Bbp+HOs=;
        b=jZ+KC0mFXbokpYlPaZoj40S2nvL0/th43wvdU4xsEzwcQ3UxrUEjEn9eqWNVUfb8+i
         nloueVWpJpFW70fywv8dbbVHBM72SgjJUd3OeIYjrkggEOe7rMBYxnTDixwdHRrCPRjz
         RGVBjQkXBIII4pJtqBZgJ6nrOmDDOcEzJIRquhK0qljCPuasAGFZZZo7E1oe5nt0rQK/
         ndJXKrVKcZji7dTPmz+IPlmRocuublcGBn5N3lEo/STzM99W+DqnkdScssByV59Hx5fx
         R0NhMEixeNxIe30R+ul0qDbxYXtXXkm5cIhzMP7ogg3hP4k3L0gJAOvvGM29rEYboJKz
         ST/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IeOAsRul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si17272374qtk.383.2021.10.07.00.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 00:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IeOAsRul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYNhN-0002Ms-Qg
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 03:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYNaD-0001M5-ON
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYNaB-0002Hg-Hi
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633590765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nIYg9Hf7gWgxHqxaeuqdywWFpfqJG4aemKy5Bbp+HOs=;
 b=IeOAsRul1kuybsmcnJEvH1+0ZRNJYnSOFBDlurIkZZLhhyPtZJzhJH4oPMoh8zQXl+T/GG
 lwIQL2gbNm8NvV0gheWp7HBS29kE8CM79pIBdPef/NO1Fsi7cpGRWYKh/0S5DOZzFY+Rdk
 AkSaooeLgXPtzIZVWiSEBgSuPGL8wEg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-cK58IxwEMYek095rdmf2_g-1; Thu, 07 Oct 2021 03:12:44 -0400
X-MC-Unique: cK58IxwEMYek095rdmf2_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so4946683edj.21
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 00:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nIYg9Hf7gWgxHqxaeuqdywWFpfqJG4aemKy5Bbp+HOs=;
 b=sksLb7NXTbrU30OLsQvaBVJ+N6UcHgqGue0xQ+r17RgA02nI5MrcG6NWAk8N0pn0pQ
 StIgEZm3JK+EWaKw4tzTmZm3PjHJdavQlriHxXRbGJapArcDv5FKk5eRwPjaPRq1t+T1
 npNaIlwWvHS+FXyy8j/RdGONTLeRFGit49PYUhWK1l8u7lTm6LfPcQLWCCM1WqC+oQTV
 YTGB3Qi9WNtejgzmoTt8GOKPRljohcy7oqZ88xWn7cioog/vaj9xoP1qTusnwomkexS+
 iBpI9WLEhqxt6zxAD1ngZifxhNTY300TRqtMjasYixMS9Jsqgx/BxTx1K4us5/vdjWAk
 1SFg==
X-Gm-Message-State: AOAM531XVrn9mVgjFbRdt+AwkxGSNxt7zs/aL5AQtj6ZbM2xDOhMI5Aw
 UGnZxLeLDgJT8mrDluaYwq1Yxxgx/WgONvCcbZEqxz4cHl8Q+33CUfNqsO06lwpfjgQa94+RXeq
 csQOPApzseC2p
X-Received: by 2002:a50:d9c9:: with SMTP id x9mr4019849edj.179.1633590763312; 
 Thu, 07 Oct 2021 00:12:43 -0700 (PDT)
X-Received: by 2002:a50:d9c9:: with SMTP id x9mr4019805edj.179.1633590762982; 
 Thu, 07 Oct 2021 00:12:42 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id g23sm10963000edt.1.2021.10.07.00.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 00:12:42 -0700 (PDT)
Date: Thu, 7 Oct 2021 09:12:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v7 7/8] hw/arm/virt-acpi-build: Generate PPTT table
Message-ID: <20211007071240.oguohccws63w6ljs@gator.home>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
 <20211007030746.10420-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211007030746.10420-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qWxyh+f511Ol

On Thu, Oct 07, 2021 at 11:07:45AM +0800, Yanan Wang wrote:
> Generate PPTT table for Arm virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
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
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

