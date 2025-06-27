Received: by 2002:a05:7301:7bcb:b0:175:48d7:c728 with SMTP id wf11csp1017270dyb;
        Fri, 27 Jun 2025 07:05:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA6Cq4ro/THpNSrOp7cpoxk9JGCr6o2WwAwTBFIiNy/4oxczGZUyyLSSXQuMs4JcPbxG0wVFdsMXkiYw==@linaro.org
X-Google-Smtp-Source: AGHT+IHRB/FcNeuZTwN0rVO+Df5qC6SlgOe57q9bv/C0PPBShM5wzHoQpIk5GpchZIqCFndMTojV
X-Received: by 2002:a05:600c:34c8:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4538ee6110bmr39838835e9.30.1751033140049;
        Fri, 27 Jun 2025 07:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751033140; cv=none;
        d=google.com; s=arc-20240605;
        b=M7w/0yVMJUJEUdBJzdWn05Li8iWY5Tcl6WS1ZvEDemC+o8dMUeWavGa2Z9t3IlO4EZ
         V738H/o2K3yZLGGXiRokAYeDbZZmJ/RmjmCB0SCe6LI3eH39KEAMrVuAbN7QNAb0qtLI
         yeT9Sb84OFAwNY5e2l4VcMehwTxHm1pdgOJl1PwZau+CuiQ+ZHUTvaZbrMKW3HpQ3A60
         OVuekjY/xVD8rHvF15klPXV1Of3bJFsybjXCdW7XdJe0jITJzGcY5kgPvuOtJ5lEEiul
         HH8mG4dWQrGA2l8QU+TaUw3HseCgKMAre94MXRtV1eajMN3F1DAvo6QwVQ/hdQPxC5B9
         4zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qiUHlUwRTtOeycYenbTYku29+WxK2EOQMBu5/2LMQhM=;
        fh=DaaftrYvunqFIorYK5BCCXuSakwlgX0MBkQnT67jyhE=;
        b=V+BomQl/rUlSe2Lg/UzhCsXN84DiCfRlE4Hr/38sKuth1tPQraAmFrBW9qTTuF8hy3
         SSMmQ9WbAGfr7CfNpRJ0drQByT3GI+KLnkppI1+UaTuXHelA7SAyFXYK3BCU6wDcKCeO
         R00J5BXU1P/9xFEPS6xiymfAaqAb/uYgitvP+7Wrp+y7gpvZYr1Qu+hvWlLa9xd9MFUX
         IuHxMt1u3gZEDeD1n4BLK2XANIVtJtsUBBKkw77+QPhvcC/KeZ+la3apemygjF5rW5dZ
         cfL4KhEqXfEPApPjkWTYG6Tphu0lGLlyVWNH4qBtMS4vEFZey6ZWsDvxrJk3sPdnM5YQ
         AFrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlCJIlTx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0822132si1651908f8f.857.2025.06.27.07.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlCJIlTx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751033138;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiUHlUwRTtOeycYenbTYku29+WxK2EOQMBu5/2LMQhM=;
	b=PlCJIlTxYC0Dxj98TIQHwSJgWee3Ypg32PZBtMvEHj2U5zlupZTzqSuMNOnS2fq6nm+dh9
	RJCNHK4UM1Jh6QbBGBC3W7g+IqG9V7wQTor/oGy3ndEC728S0QzfHd7jEYV7NF4Uxo2gNr
	Op+nRNkAZu3w5Ev3DotEhjTNUz6Hxr0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-crzTNV41O8W1F4eOHU9QOA-1; Fri, 27 Jun 2025 10:05:37 -0400
X-MC-Unique: crzTNV41O8W1F4eOHU9QOA-1
X-Mimecast-MFC-AGG-ID: crzTNV41O8W1F4eOHU9QOA_1751033136
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso1428273f8f.0
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 07:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033136; x=1751637936;
        h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiUHlUwRTtOeycYenbTYku29+WxK2EOQMBu5/2LMQhM=;
        b=nWoMvXeKHJAxYhhVX3Jx2gn8fWkvCF6p4xPGKx9tgKqAmQCRJAuQLNKd7uj5gVk7fc
         /Cf/ZjneLC5nlD5pZfSxnrKvxBUehLnCv18J/edae7lEq9erPbWagSv+cz8vYqgY7AFo
         /OxPLL5dCrICMgj2BlYTVRdvarsRxHCmI97FpHeYCh9orCxL8smdag/J9CXKga2P50YP
         7ZxVqgftUfgSnJIRKj8Wkee7JnyMQAo/IRy6sVE/im2FYS7sbWo5Cgr7lCtno4N8y1NM
         jhayGyHGSaKqL7I/avC5BTG29osWUTgekGY+AlY5ITMxgMZ4J167Tngr+RsCKYuW7nws
         7hMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQDoQAPUlkxIjr8yrAGVJpUhEg8xUQcrRjGHPl6mLIKhNoyf1ADa0K86gy/BHnkFsVPRbLXmpkhe48gQ==@linaro.org
X-Gm-Message-State: AOJu0YxTdyGxNVJZhfTA7FkwNK7NJhmnGNYvK5RAechlWVjbCn5ewkdP
	ZkOeVsUeKLggg24MLZZ8ERC8SuVbQqyBlGjKX2BxTSgKNo+IcXxPCIsiXKlri0qSb8xl0wSd2rW
	YTn0J/NsEAkI1Q56eYz0yJL5ePbXjoH5Go4dKZqoo9uStfuONjSHdhc7qww==
X-Gm-Gg: ASbGncvwriXQuarsvC4NF9du5ifUJ9D9E4vGAEseApCwH4YxdAs8Tr6/i+ii2UTtYw2
	6XblCXVPv215PvEDGpQAGST6iuDFRHZ9ejx1rRh/gXPkJLHbxK3AbyyZicydCa/jwbp1Ck9QNrH
	vAh1ptu7U37ytF9GmH/rkiF1XrSL6xPSuTCgSkLPy3z0ioQBlQELP7ga72zitYM+K0m2t1EsmxE
	Lk4qeUtsJjCYOEbK8mT/Y/ysP/QSjmYcIgO3BXc/0lhm2tzpREJ5Q4Zt9LzyNhbz2EimFkuIegH
	4pv8HG/L5G7B1rfPnvJfW9Af5QgmoG4oHrXx4PhspwhZKx+jFO53lp9MRGZVGLC36G+gZQ==
X-Received: by 2002:a05:6000:490a:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a91846d660mr3331158f8f.52.1751033135329;
        Fri, 27 Jun 2025 07:05:35 -0700 (PDT)
X-Received: by 2002:a05:6000:490a:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a91846d660mr3331077f8f.52.1751033134556;
        Fri, 27 Jun 2025 07:05:34 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814a6275sm56990555e9.1.2025.06.27.07.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:05:33 -0700 (PDT)
Message-ID: <c98c9d01-ccd9-4e3a-a24e-9a42cf1b4b8e@redhat.com>
Date: Fri, 27 Jun 2025 16:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] hw/arm/virt-acpi-build: Improve comment in
 build_iort
From: Eric Auger <eric.auger@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
Reply-To: eric.auger@redhat.com, eric.auger@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-5-gustavo.romero@linaro.org>
 <adf5e6e5-e0e3-44f9-949c-620aea3edfa0@redhat.com>
In-Reply-To: <adf5e6e5-e0e3-44f9-949c-620aea3edfa0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pziGXtX2czzJ_7GwaCTlBtu88_GcJpAziaU4Gk72m5w_1751033136
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: FLhxryUTCbRZ



On 6/27/25 3:57 PM, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/23/25 3:57 PM, Gustavo Romero wrote:
>> When building the Root Complex table, the comment about the code that
> s/table/node? or do you refer to the IORT table?
Reading the IORT spec again, both terminologies are used, ie. node / table

So please ignore my comment

Thanks

Eric
>> maps the RC node to SMMU node is misleading because it reads
>> "RC -> SMMUv3 -> ITS", but the code is only mapping the RCs IDs to the
>> SMMUv3 node. The step of mapping from the SMMUv3 IDs to the ITS Group
>> node is actually defined in another table (in the SMMUv3 node). So
>> change the comment to read "RC -> SMMUv3" instead.
>>
>> Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>  hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++------
>>  1 file changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 9eee284c80..e9cd3fb351 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -370,7 +370,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>>          build_append_int_noprefix(table_data, 0, 4);
>>  
>> -        /* output IORT node is the ITS group node (the first node) */
>> +        /* Output IORT node is the ITS Group node (the first node) */
>>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>>      }
>>  
>> @@ -407,23 +407,36 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>          AcpiIortIdMapping *range;
>>  
>> -        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
>> +        /*
>> +         * Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3.
>> +         *
>> +         * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
>> +         * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
> s/table/node
>> +         * ITS Group node.
>> +         */
>>          for (i = 0; i < smmu_idmaps->len; i++) {
>>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> -            /* output IORT node is the smmuv3 node */
>> +            /* Output IORT node is the SMMUv3 node. */
>>              build_iort_id_mapping(table_data, range->input_base,
>>                                    range->id_count, smmu_offset);
>>          }
>>  
>> -        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
>> +        /*
>> +         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
>> +         * node directly: RC -> ITS.
>> +         */
>>          for (i = 0; i < its_idmaps->len; i++) {
>>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>> -            /* output IORT node is the ITS group node (the first node) */
>> +            /* Output IORT node is the ITS Group node (the first node). */
>>              build_iort_id_mapping(table_data, range->input_base,
>>                                    range->id_count, IORT_NODE_OFFSET);
>>          }
>>      } else {
>> -        /* output IORT node is the ITS group node (the first node) */
>> +        /*
>> +         * Map all RIDs (input) to ITS Group node directly, since there is no
>> +         * SMMU: RC -> ITS.
>> +         * Output IORT node is the ITS Group node (the first node).
>> +         */
>>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>>      }
>>  
> Besides:
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Eric
