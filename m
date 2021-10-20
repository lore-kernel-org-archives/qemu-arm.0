Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1459652lfc;
        Wed, 20 Oct 2021 04:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+cabY8rznlfS/2Nf/MRXYwmfzP0W5epqwHlfMCx9Z9iqR8Utg+PGDvObE+eDRi9KmpAFY
X-Received: by 2002:a05:6102:161e:: with SMTP id cu30mr18351961vsb.16.1634728303986;
        Wed, 20 Oct 2021 04:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634728303; cv=none;
        d=google.com; s=arc-20160816;
        b=w2p35Um+Z2E5/cEGtTPKH4vINYoqj+6u1gky013zkkhl4+ydN+hajel+M8sishV4La
         A7TGVd9vBW/Cc8Ve92e18m01i3fNiQkYF0CyOdk0i5kf7T7gyncjpWf/bs+CJ15MEDng
         VIyC9kwFgwZzvO0of3QheFv/W8ug5gY3Tam3pi6llt5Rx4QXaBVSvEk5wm1k1pJKQ570
         iit+oYKzS4Mde0TtwUjuz8oiRHaTDBJb2Fn5ndjSIf5q11ILSngAk7jOjgp9Bf7MSHME
         TL5LWok98WwW8fb3gjpYR/r5PRbnFRo7ezYDSF3IqOKUjhGWV1IKN38prztL62C5Ws16
         dBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sHArnnmZn6y1qiZCM8dcXDPGcn7445v3TSZrguf7cYc=;
        b=KL4X+eIN2C9deXi0+y/924z4g9cIQbIFLsB3E+nFUsuhN9KtlNjEbFB6zHBJ0ISzjI
         bkiWFUalsM9PiDpeSfQWueNLORo3KDv3YFNbUgJZjgHyNBjTdrmhf7ajI5GteX7/jBPN
         WAdfcvv1WnRHZZjaeEVT3xBIOUOh+3cYihTQlYOX1w/+pqYax4VuETCjYOJrUNgI4gIl
         mvVYsC9u/6KOL5Rej0j9SO3suNjibDdw0IeGtVdGEAKGJv8EusU5t/8R51JTSC+NC2k4
         ClRLnGr80AGuSiqokMK4DkhbjA1/npr/vuWJkTCj4HjmEsqLj0RyP1n4qOAQLo33K/Id
         KwMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0l9tRNt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27si2142323vsj.336.2021.10.20.04.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 04:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0l9tRNt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md9VX-0001oO-7K
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 07:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md9VJ-0001ld-IK
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 07:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md9VF-00033q-VR
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 07:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634728284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHArnnmZn6y1qiZCM8dcXDPGcn7445v3TSZrguf7cYc=;
 b=M0l9tRNtPWpT1Z/82wr910Z4KMlqhV3k1/rFkJiboOay7Z7Zrxhb423oZZmeOGN/zCl4JZ
 T1bFVXCzpDhL8mYaplETOPfy4IFCUa7oJZA0CwIzVzwZ2rJC88oc+rE7Zq9Phjcp3VDZvM
 8pHe8uLfBbhE2pLRxhw3NqfzspGVWwQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-dl-x1gIBP4Kqg-mIEBbHfQ-1; Wed, 20 Oct 2021 07:11:23 -0400
X-MC-Unique: dl-x1gIBP4Kqg-mIEBbHfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso2035998wmq.0
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sHArnnmZn6y1qiZCM8dcXDPGcn7445v3TSZrguf7cYc=;
 b=iTwvaw3Zy12/3gBmxDkJp0gDMnlq7HxD0fcfAVNE7DHMJT19xXjdw3TiVY8IfSFMW/
 KGiAA2lbhQsTllSHhUq18P7+yTpJ9jehmPZSNOrD9X6ORX00q6HUpAiXJoSMD2dtjibm
 GRrDdka7kX1CCgigeWwHk0i2lBm4bQvhKi0iyzIoBQEPuV7P0Qb4Kquxyauf/2WyebT4
 ux6WABnOdFaWF2gfwW0aMKOT+G8uybqL+QHTf1gLQZ/noeTMvYvnj+GYg8sjZSDW9tXo
 oWTSB3+rGjD0Vgok/cS4mMBpNps5qT0ufnwEoEMwydQdMQDa8POsP170EnHjGhf8DnGS
 2Img==
X-Gm-Message-State: AOAM531WV1FDs8W+OjQOiIsR2YS24Ra1/lcGUhmJ6Y8g7M3g4dtvFA/s
 DJBE7/yrj4aqN8WHa3Y3QJU5r0MVdx8rMbjb2Jza3xmyODkS9wOcTEaDmRWYyru58WV6Iw9LTQw
 P5UxBLPn39PR1
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr12925203wmc.93.1634728280538; 
 Wed, 20 Oct 2021 04:11:20 -0700 (PDT)
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr12925159wmc.93.1634728280180; 
 Wed, 20 Oct 2021 04:11:20 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e9sm1726388wrn.2.2021.10.20.04.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 04:11:19 -0700 (PDT)
Subject: Re: [PATCH v8 5/8] hw/acpi/aml-build: Add PPTT table
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-6-wangyanan55@huawei.com>
 <316edbd3-2235-efb1-7176-e3f477aec6a4@redhat.com>
 <1f4eaecf-8718-fc8a-5366-7e32945b9953@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <2651e5c8-8cd0-e912-2f62-f7393bf49aa3@redhat.com>
Date: Wed, 20 Oct 2021 13:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1f4eaecf-8718-fc8a-5366-7e32945b9953@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-TUID: /9lwTvg2rJ42

Hi Yanan,
On 10/20/21 11:51 AM, wangyanan (Y) wrote:
> Hi Eric,
> 
> On 2021/10/20 16:02, Eric Auger wrote:
>> Hi,
>>
>> On 10/14/21 3:22 PM, Yanan Wang wrote:
>>> From: Andrew Jones <drjones@redhat.com>
>>>
>>> Add the Processor Properties Topology Table (PPTT) used to
>>> describe CPU topology information to ACPI guests.
>>>
>>> Note, a DT-boot Linux guest with a non-flat CPU topology will
>>> see socket and core IDs being sequential integers starting
>>> from zero, which is different from ACPI-boot Linux guest,
>>> e.g. with -smp 4,sockets=2,cores=2,threads=1
>>>
>>> a DT boot produces:
>>>
>>>   cpu:  0 package_id:  0 core_id:  0
>>>   cpu:  1 package_id:  0 core_id:  1
>>>   cpu:  2 package_id:  1 core_id:  0
>>>   cpu:  3 package_id:  1 core_id:  1
>>>
>>> an ACPI boot produces:
>>>
>>>   cpu:  0 package_id: 36 core_id:  0
>>>   cpu:  1 package_id: 36 core_id:  1
>>>   cpu:  2 package_id: 96 core_id:  2
>>>   cpu:  3 package_id: 96 core_id:  3
>>>
>>> This is due to several reasons:
>>>
>>>   1) DT cpu nodes do not have an equivalent field to what the PPTT
>>>      ACPI Processor ID must be, i.e. something equal to the MADT CPU
>>>      UID or equal to the UID of an ACPI processor container. In both
>>>      ACPI cases those are platform dependant IDs assigned by the
>>>      vendor.
>>>
>>>   2) While QEMU is the vendor for a guest, if the topology specifies
>>>      SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>>>      core-id the same value as a package-id, thus it is not possible
>>>      to have package-id=0 and core-id=0. This is because package and
>>>      core containers must be in the same ACPI namespace and therefore
>>>      must have unique UIDs.
>>>
>>>   3) ACPI processor containers are not mandatorily required for PPTT
>>>      tables to be used and, due to the limitations of which IDs are
>>>      selected described above in (2), they are not helpful for QEMU,
>>>      so we don't build them with this patch. In the absence of them,
>>>      Linux assigns its own unique IDs. The maintainers have chosen not
>>>      to use counters from zero, but rather ACPI table offsets, which
>>>      explains why the numbers are so much larger than with DT.
>>>
>>>   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>>>      match the logical CPU IDs, because these IDs must be equal to the
>>>      MADT CPU UID (as no processor containers are present), and QEMU
>>>      uses the logical CPU ID for these MADT IDs.
>>>
>>> So in summary, with QEMU as the vendor for the guests, we simply
>>> use sequential integers starting from zero for the non-leaf nodes
>>> but with ID-valid flag unset, so that guest will ignore them and
>>> use table offsets as unique container IDs. And we use logical CPU
>>> IDs for the leaf nodes with the ID-valid flag set, which will be
>>> consistent with MADT.
>>>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>   hw/acpi/aml-build.c         | 60 +++++++++++++++++++++++++++++++++++++
>>>   include/hw/acpi/aml-build.h |  3 ++
>>>   2 files changed, 63 insertions(+)
>>>
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index b7b9db6888..0d50e88e9d 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -1990,6 +1990,66 @@ void build_processor_hierarchy_node(GArray
>>> *tbl, uint32_t flags,
>>>       }
>>>   }
>>>   +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
>>> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState
>>> *ms,
>>> +                const char *oem_id, const char *oem_table_id)
>>> +{
>>> +    int pptt_start = table_data->len;
>>> +    int uid = 0;
>>> +    int socket;
>>> +    AcpiTable table = { .sig = "PPTT", .rev = 2,
>>> +                        .oem_id = oem_id, .oem_table_id =
>>> oem_table_id };
>> Table 5-149 of 6.2 spec (6.2 May 2017) tells the rev shall be 1. Or is
>> it an erratum somewhere I did miss?
> Yes, the revision in 6.2 spec is 1. And it's 2 in spec 6.3.
> So just to be sure, should I use the oldest revision ?
If you need (and use) features (such as flags) introduced in 6.3 then
you should say the code complies with 6.3 and update the above comment.
>> I would also add the spec version in the commit msg.
>>> +
>>> +    acpi_table_begin(&table, table_data);
>>> +
>>> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>> +        uint32_t socket_offset = table_data->len - pptt_start;
>>> +        int core;
>>> +
>>> +        build_processor_hierarchy_node(
>>> +            table_data,
>>> +            /*
>>> +             * ACPI 6.2 - Physical package
>>> +             * represents the boundary of a physical package
>>> +             */
>>> +            (1 << 0),
>>> +            0, socket, NULL, 0);
>> I see we set an ACPI process ID but in the meantime the ACPI processor
>> ID valid flag is not set. I am not sure I fully catch the meaning of
>> this latter but just to double check if this is done on purpose.
> Yes, it's on purpose.
>> Maybe
>> wort a general comment as this also happens below.
> The ID of the container node is invalid and ID of the leaf node is valid.
> The commit message by Andrew has explained why (reason 3). I think
> it may be clear enough to explain there why we don't need a valid ID
> for the container node.
>>> +
>>> +        for (core = 0; core < ms->smp.cores; core++) {
>>> +            uint32_t core_offset = table_data->len - pptt_start;
>>> +            int thread;
>>> +
>>> +            if (ms->smp.threads > 1) {
>>> +                build_processor_hierarchy_node(
>>> +                    table_data,
>>> +                    /*
>>> +                     * ACPI 6.2 - Physical package
>>> +                     * doesn't represent the boundary of a physical
>>> package
>>> +                     */
>>> +                    (0 << 0),
>> would rather say (0 << 0) /* not a physical package */ and same elsewhere
> Ok, thanks.
>>> +                    socket_offset, core, NULL, 0);
>>> +
>>> +                for (thread = 0; thread < ms->smp.threads; thread++) {
>>> +                    build_processor_hierarchy_node(
>>> +                        table_data,
>>> +                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID
>>> valid */
>>> +                        (1 << 2) | /* ACPI 6.3 - Processor is a
>>> Thread */
>> So the references look globaly confusing to me. Either it complies to
>> 6.2 or to 6.3. Looks ir rather complies with 6.3. To me, this needs to
>> be clarified.
> ACPI 6.2 in the comment means the flag is introduced in the spec since 6.2.
> The same, ACPI 6.3 means the flag is introduced since 6.3. Maybe I should
> just drop all the version-prefix in the comment ?
Yes I think you can drop those comments and just upgrade the global
compliance with 6.3

Thanks

Eric
>> I would also add the reference it complies to in the
>> commit msg.
> Ok, sure.
> 
> Thanks,
> Yanan
> .
>>> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>>> +                        core_offset, uid++, NULL, 0);
>>> +                }
>>> +            } else {
>>> +                build_processor_hierarchy_node(
>>> +                    table_data,
>>> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
>>> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>>> +                    socket_offset, uid++, NULL, 0);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    acpi_table_end(linker, &table);
>>> +}
>>> +
>>>   /* build rev1/rev3/rev5.1 FADT */
>>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData
>>> *f,
>>>                   const char *oem_id, const char *oem_table_id)
>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>>> index 2c457c8f17..b92706388c 100644
>>> --- a/include/hw/acpi/aml-build.h
>>> +++ b/include/hw/acpi/aml-build.h
>>> @@ -493,6 +493,9 @@ void build_processor_hierarchy_node(GArray *tbl,
>>> uint32_t flags,
>>>                                       uint32_t parent, uint32_t id,
>>>                                       uint32_t *priv_rsrc, uint32_t
>>> priv_num);
>>>   +void build_pptt(GArray *table_data, BIOSLinker *linker,
>>> MachineState *ms,
>>> +                const char *oem_id, const char *oem_table_id);
>>> +
>>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData
>>> *f,
>>>                   const char *oem_id, const char *oem_table_id);
>>>  
>> Thanks
>>
>> Eric
>>
>> .
> 

