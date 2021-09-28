Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5120428lfp;
        Tue, 28 Sep 2021 10:57:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo48P3hVqsHW62Jmke7OpyviA1yy4Fy6zEmJfgObNhlDQMObWm7JPXiaQhmoRSoMJoBbkX
X-Received: by 2002:ab0:31d6:: with SMTP id e22mr6086143uan.99.1632851851463;
        Tue, 28 Sep 2021 10:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632851851; cv=none;
        d=google.com; s=arc-20160816;
        b=yMSj5L2d3aAbq/uGfOuLo4IsLdaF5d2sKBHb+pSd9KBSSCH42HgBB5ao2iW3jy29wo
         csJ9/SBdx+ZS/vo2IUuz51J3a5xXrW+ClGdz882fBos13a+VxtA5ARnmQsf2z2pQlkwx
         T9rK6JMJNBq6JW0Hrz33qnU65KmYWTgjERx77CgcLZJDb35UsbmCBFp6BcNXD7uNbBK8
         dn5S4nxriBkcK1FDo5qxrIL8lVHd++7Z4DY7T7mhAiqP04l2MQx92h8WMDRRmsjV9BG5
         0RqSwpzWsMpPieEv4sk++aYCSjyQYR53+LlffgPIEfLIzeINQRjTcysv8AhTfkXj1QEE
         ycBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6olJ3Up6dvLMGwXFluEBLW+GsUxd5kkmN42dYrE/IGU=;
        b=o+5FrLZhOqTbifUVYljmbyU1mb7Z8AYPLDeiiaNHBkrFL0A5x83RtvyVxaC3UcDMgn
         Q1t81yAdbMCApXhzbQksGrjp3d+dAD1GAopR+N19zvHXp2EBGPi/tZgX6FUQ71u54VtR
         aIe+hS18rUB/k9LzfBpXh8W+gvouUpxMacd1G9QEa6sTV7MSqxUIKcUnfotR5k19TgRK
         b8luugltGDEjffmeUKiifsTwURUMYMgsNBar9jEX2BrGfN/kYMLykeAALVsrC/p2bLq6
         r3or77g3OFfwqrH9WVXwwFCWajknNygVssde8q4ibZO4Gs3+l9rTZDPTccfLJ1wzSFuv
         aA1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDPf4xKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si2955918vsv.312.2021.09.28.10.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 10:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDPf4xKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVHMA-0003zn-Pm
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 13:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVHLm-0003wA-OV
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVHLj-0006SU-MX
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632851821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6olJ3Up6dvLMGwXFluEBLW+GsUxd5kkmN42dYrE/IGU=;
 b=hDPf4xKRQ17r31jzSlt8FoGaRdR8iWQNKJ3ucv6Uo81JjqnvwZpL20Bgt8c1rXPX/g/QTJ
 +n5vSLwIvuv0rTjK3jMO9u1yoR6uoi6xDPtG5G881ZwNmisQV8NYPCkAGS41a4koEftuW2
 CJB1n7pPhcclgDXCaR9R902jP01UlFI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-g33L-akjMMK1YZ6LJobzdA-1; Tue, 28 Sep 2021 13:57:00 -0400
X-MC-Unique: g33L-akjMMK1YZ6LJobzdA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so1468451wmk.2
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 10:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6olJ3Up6dvLMGwXFluEBLW+GsUxd5kkmN42dYrE/IGU=;
 b=2Rr63m93Y5RcMulXY5CwLLAnvygrT6mlzGsN9OnY1UWx09nI/3h7/Z/CzJh/krmpP7
 Bg3MXliiitPIHQ7JgCrjM8TXm0oIYdgq90Jytr699k7aaTUgdM63HLuWMIP2sG3zy9uX
 GVZ4zlAR4Pm6nUXq/JIqI21Lmcsy4O6p+O1rUCqmOMVDzwPDLVmnrSlgVH+cN9X79rpu
 dwwElWWC53M8QssgG8KV2z0tfIWfpRgFJ6M766hr+rnHNOMgmBFBbW6nJn/2EsWha5aU
 cnBvW572YOOF4unjNbquo4u3+roIApRkgNQSBuUblknHtYPKATmyMD5z7oePSNtyAu+6
 /JYQ==
X-Gm-Message-State: AOAM530/qSqJwpHSXbGyvRvGwBm9/HVSUngEXPELNUtRZAvKSwzzWfKm
 knO+62CQns905Wo4JHftOAHyQPrAFtoweT1U8KAkBWBmahPQzla13mtCcSiwGavtwMwurWCjCJH
 SJ+6o0yj4uNhM
X-Received: by 2002:a7b:c151:: with SMTP id z17mr5931035wmi.178.1632851819332; 
 Tue, 28 Sep 2021 10:56:59 -0700 (PDT)
X-Received: by 2002:a7b:c151:: with SMTP id z17mr5931009wmi.178.1632851818997; 
 Tue, 28 Sep 2021 10:56:58 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u5sm21789251wrg.57.2021.09.28.10.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 10:56:58 -0700 (PDT)
Message-ID: <9e20c38f-4d93-0658-c309-499c8976adc9@redhat.com>
Date: Tue, 28 Sep 2021 19:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] hw/arm/virt-acpi-build: IORT upgrade up to revision
 E.b
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 imammedo@redhat.com, jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
References: <20210928172133.79665-1-eric.auger@redhat.com>
 <20210928172133.79665-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928172133.79665-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZhwDX+jv83p

Hi Eric,

On 9/28/21 19:21, Eric Auger wrote:
> Upgrade the IORT table from B to E.b specification
> revision (ARM DEN 0049E.b).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 47 ++++++++++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 19 deletions(-)

> -    /* 3.1.1.3 ITS group node */
> +    /* Table 12 ITS Group Format */
>      build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>      node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>      build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> -    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 3, 1); /* Revision */

Why 3? Shouldn't it be 1?

> +    build_append_int_noprefix(table_data, 0, 4); /* Identifier */
>      build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>      build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>      build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> @@ -374,19 +375,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>  
>          smmu_offset = table_data->len - table.table_offset;
> -        /* 3.1.1.2 SMMUv3 */
> +        /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -        build_append_int_noprefix(table_data, 0, 1); /* Revision */
> -        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 3, 1); /* Revision */

And here 3 -> 4?

> +        build_append_int_noprefix(table_data, 1, 4); /* Identifier */
>          build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>          /* Reference to ID Array */
>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>          /* Base address */
>          build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>          /* Flags */
> -        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
> +        build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>          build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
>          /* Model */
> @@ -395,35 +396,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
>          build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
>          build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
> +        build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
> +        /* DeviceID mapping index (ignored since interrupts are GSIV based) */
> +        build_append_int_noprefix(table_data, 0, 4);
>  
>          /* output IORT node is the ITS group node (the first node) */
>          build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>      }

Also, could the node identifier be a variable we increment?

