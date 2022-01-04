Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10674877lfb;
        Mon, 3 Jan 2022 18:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnEkkFy/+SLmGkKQX9Zxl/qNcUGKH9SsPTEv4gPr9kBZI2HB9zrFYVchJ3gJ+y/s/rbTWN
X-Received: by 2002:a25:4196:: with SMTP id o144mr53309959yba.419.1641262537894;
        Mon, 03 Jan 2022 18:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641262537; cv=none;
        d=google.com; s=arc-20160816;
        b=OSr4gZXpCY97OWDmBmh+m4xvEWeeXQg4oVo/tFZb8f+8V19T3wS8CL2E/u2gt3B2Oo
         Ub7kZs3lT4g3dN9WzzLS4xl2LkJK30LEm8dLTe9BuL+vZK/HDCenVSsRzImXwYquvbqT
         beL3QuqwsqhkPqTqELQuwyYC8AexIt4VVvm1k2aSd+87ihNJsRT725kZT4Osl6urvtIE
         oRpC9e1grm+L09HrDc4THa7NaFtye+0aWE5e+ndRB55LKfPUiKAAaE9dloZb0pIpl6Je
         QyHZOlLKRB9JSBa+r7URw/bhfB6AFhgPB7fPKxCuukx+Pcz0TADd0HOE352IR2n4oNqc
         I+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=9IKXLScx3qnzvoa4k2UsqGqOduKUBDl33Mt111ucR18=;
        b=Il7OJlSRoKevh72jqe7CWRD2DF1sROFZgr7UBK6A5tbfXrAmNm+BZOgRlYINDkRkZh
         aQ7kcS0uLW5fow5U6tFQWEXtxdgWEqEzEW43qxNLd50k6cEJ952rt0v4xecUhi1p9BFV
         5Jr+yF9ibrDCdRs8ROkcY+FOk91uyx7UezzEOKBkVLZ7/Uus2OrOuGcykD7TLiLInziE
         e0fThmajh7d98ZY912/JcvcXTKp8G94S9Sgg4YoQOtf3jYJZhtDwRHXf25JgQWxwkRtr
         g8dvHZbRABpsPRQKYrbvGVo1gAwbTLdnqknimhrzkrWEo3OnPzgltLKGUu3TXpeY6XlI
         E+ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si23793708ybc.636.2022.01.03.18.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 18:15:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4ZMP-00024q-Bj
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 21:15:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZM0-00023r-Gm; Mon, 03 Jan 2022 21:15:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZLy-00086L-Cj; Mon, 03 Jan 2022 21:15:11 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JSblq0PFVzbjmB;
 Tue,  4 Jan 2022 10:14:31 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:15:03 +0800
Subject: Re: [PATCH v6 6/7] hw/arm/virt-acpi-build: Support cluster level in
 PPTT generation
To: Andrew Jones <drjones@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani
 Sinha <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-7-wangyanan55@huawei.com>
 <20220103113238.g3vk7nxmgefxe2gn@gator>
Message-ID: <845ec56e-7a06-3774-2dab-c50040b59f4e@huawei.com>
Date: Tue, 4 Jan 2022 10:15:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220103113238.g3vk7nxmgefxe2gn@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-arm@nongnu.org>
X-TUID: tfzoTo7GvY/Y


On 2022/1/3 19:32, Andrew Jones wrote:
> On Mon, Jan 03, 2022 at 04:46:35PM +0800, Yanan Wang wrote:
>> Support cluster level in generation of ACPI Processor Properties
>> Topology Table (PPTT) for ARM virt machines.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3ce7680393..5f91969688 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -840,6 +840,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>               0, socket, NULL, 0);
>>       }
>>   
>> +    length = g_queue_get_length(list);
>> +    for (i = 0; i < length; i++) {
>> +        int cluster;
>> +
>> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> +        for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>> +            g_queue_push_tail(list,
>> +                GUINT_TO_POINTER(table_data->len - pptt_start));
>> +            build_processor_hierarchy_node(
>> +                table_data,
>> +                (0 << 0), /* not a physical package */
>> +                father_offset, cluster, NULL, 0);
>> +        }
>> +    }
>> +
>>       length = g_queue_get_length(list);
>>       for (i = 0; i < length; i++) {
>>           int core;
>> -- 
>> 2.27.0
>>
> Looks good except please do s/father_offset/parent_offset/ as I mentioned
> in an earlier patch.
Will do.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
Thanks,
Yanan

