Received: by 2002:a05:6214:13e2:0:0:0:0 with SMTP id ch2csp1947941qvb;
        Thu, 21 Oct 2021 00:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzffYF7FnwY/KPegCG2JuKXgc0QQ5A1vSXxVJSb1RV8uGh9p71tfCgQDN63HmrUik5S1x4b
X-Received: by 2002:a05:6808:2094:: with SMTP id s20mr3374748oiw.68.1634800076444;
        Thu, 21 Oct 2021 00:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634800076; cv=none;
        d=google.com; s=arc-20160816;
        b=K0MoK+XXXB1LxNBr5WBAupClEnSHRC3rDzEKBGP0jOAFrefVM6QprL6+XoQRz44xAU
         GtsvPG1efSnH8Y9JdjIj5wh1xYAW8knsAs3EK1raQj4EW0lIHM7DNZCkxpCPOovtoail
         sd/4ttBWGXsVc9k7go90coW2LtCkr7rIkZYfJsRPdLartZzUZf1NnOr+kAtcd8TnVXux
         yue2HkAA/KVGHVbs+nfeoSqJ3XhWQbSHiDPleYLZtfLHa+kGYfNNgEz+a5KXpma52R6M
         wK9zhk8m3dg/a9N37svC38jktOyr/nD3wOZlUmf6NyMqWwFeuV+rdJMFOkK9feLjb8R1
         t0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J0fis1N/8TcRv6BRJ+wZkmX6tftiObhn1CHJI7yUOjI=;
        b=fsMidViVT3o5549uiubMC8NY57VYk0URWrHNSRDN16VPiPpPw+KbzzS1v0gAtkZ0XX
         kca98qzLbVa2cy2ETMoBOTWQWm3qXBP9Sl6ruD3a180RnKS+GZcY2dQjr7o5guDjyJ6q
         frOl2Idf5J3oZdsgh32mlTdKr5UESYBFS5xxMyY9IENzW0D8VjownOxb3vg0sUB+8/li
         Z5CA8em3S3c8FL52xpqu8qTmj4J5O78eloPptsqLjM3frB8QJ+52+1c83oV2Pi2+xtQl
         AaOiiCBx1GhoUMPgS3yT19QjCRChALt8TCi846bJQdQ2Q9MKwcjW77pM4Hxb10yGF02y
         R1MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="CwA/aNEt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si4625246otw.22.2021.10.21.00.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 00:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="CwA/aNEt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdSB9-0007lS-NV
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 03:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mdS7k-000501-NY
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 03:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mdS7e-00032L-1v
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 03:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634799857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0fis1N/8TcRv6BRJ+wZkmX6tftiObhn1CHJI7yUOjI=;
 b=CwA/aNEtepDzy1d2g8QhRsUsWFvd5P6Yb7KKsDj6fSgPJboA5CrWHcJpX0mwia/mPX0oLw
 cyKXHnjs+CgoSFus0x15WAYVTKT22yqrBX1Q84fgJ1JBJ3jJ+qLaNM7UOTHPv/xu7moX1y
 N61GjFK5uOTAkY2Vyjp/2x0rbJh4lAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-l7s-O13dMniarR1KFPbzNQ-1; Thu, 21 Oct 2021 03:04:06 -0400
X-MC-Unique: l7s-O13dMniarR1KFPbzNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so10983186wrd.5
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 00:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J0fis1N/8TcRv6BRJ+wZkmX6tftiObhn1CHJI7yUOjI=;
 b=xXBzAEz2cQuASmINLUcY05wLzD43g5o5u4oFVxSDed7BIx3Hh3r+ROkWKDSWRRO3dX
 1dj7pERcQdqNNBwGdQL56Rap91ELxMbIZLVK4cK6+REp0tyweU69jmyvzhs4pBOrqTFA
 9xQ6rIBJUvl5GTrurisVt5MZ0CrGyilKYXd3+EBmeXtNbMSakPfLcfUuzdLmGMRYF4m6
 1hD2o719VrgZe6us+AgyAEnGuaQbQOGOMWOMDlGSNlBcQEdr9TjdE7GCRFanIL8smN+Q
 RNafrgWez81M8yR87nE7kVC+slgMTFDEL6ISKcr+UanhyghSNfLTqDnEqG2mycpWWB8B
 4+NA==
X-Gm-Message-State: AOAM532n+oKAXFOX/FQymIzJgpzl7X0i2FU0wKqmYfJ0hAqSEIs9txYJ
 /inihzdFEjrnR9bq2B3GoHYnZ3liaFGw0t5b5I92rqmsbmYxm0QpRMlH6i29GP1eLAylzHO/UD3
 Z6ed0Aj2W3Mtc
X-Received: by 2002:a05:600c:2198:: with SMTP id
 e24mr3728081wme.164.1634799842316; 
 Thu, 21 Oct 2021 00:04:02 -0700 (PDT)
X-Received: by 2002:a05:600c:2198:: with SMTP id
 e24mr3728038wme.164.1634799841925; 
 Thu, 21 Oct 2021 00:04:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id 133sm7188800wmb.24.2021.10.21.00.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 00:04:01 -0700 (PDT)
Subject: Re: [PATCH v9 5/8] hw/acpi/aml-build: Add PPTT table
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
 <20211020142125.7516-6-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <833280d0-4d03-e2fa-aaa7-2cb54111a103@redhat.com>
Date: Thu, 21 Oct 2021 09:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020142125.7516-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: YD1/vpFsAUQM

Hi Yanan,

On 10/20/21 4:21 PM, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Add the Processor Properties Topology Table (PPTT) used to
> describe CPU topology information to ACPI guests.
> 
> Note, a DT-boot Linux guest with a non-flat CPU topology will
> see socket and core IDs being sequential integers starting
> from zero, which is different from ACPI-boot Linux guest,
> e.g. with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces:
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces:
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not mandatorily required for PPTT
>     tables to be used and, due to the limitations of which IDs are
>     selected described above in (2), they are not helpful for QEMU,
>     so we don't build them with this patch. In the absence of them,
>     Linux assigns its own unique IDs. The maintainers have chosen not
>     to use counters from zero, but rather ACPI table offsets, which
>     explains why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> So in summary, with QEMU as the vendor for the guests, we simply
> use sequential integers starting from zero for the non-leaf nodes
> but with ID-valid flag unset, so that guest will ignore them and
> use table offsets as unique container IDs. And we use logical CPU
> IDs for the leaf nodes with the ID-valid flag set, which will be
> consistent with MADT.
> 
> Currently the implementation of PPTT generation complies with ACPI
> specification 5.2.29 (Revision 6.3). The 6.3 spec can be found at:
> https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 59 +++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  3 ++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 5195324585..b3b3310df3 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1994,6 +1994,65 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>      }
>  }
>  
> +/*
> + * ACPI spec, Revision 6.3
> + * 5.2.29 Processor Properties Topology Table (PPTT)
> + */
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0;
> +    int socket;
> +    AcpiTable table = { .sig = "PPTT", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data,
> +            /*
> +             * Physical package - represents the boundary
> +             * of a physical package
> +             */
> +            (1 << 0),
> +            0, socket, NULL, 0);
> +
> +        for (core = 0; core < ms->smp.cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (ms->smp.threads > 1) {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (0 << 0), /* not a physical package */
> +                    socket_offset, core, NULL, 0);
> +
> +                for (thread = 0; thread < ms->smp.threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI Processor ID valid */
> +                        (1 << 2) | /* Processor is a Thread */
> +                        (1 << 3),  /* Node is a Leaf */
> +                        core_offset, uid++, NULL, 0);
> +                }
> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI Processor ID valid */
> +                    (1 << 3),  /* Node is a Leaf */
> +                    socket_offset, uid++, NULL, 0);
> +            }
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 3cf6f2c1b9..8346003a22 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -489,6 +489,9 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

