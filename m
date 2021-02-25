Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp323697lfg;
        Thu, 25 Feb 2021 04:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsVGD2C0kFv8Je5chQjI3COAd7y4kW7EOIAdaLX0rRs3ace5dcgO13JkmtUSujUU19EaHt
X-Received: by 2002:a6b:7a4a:: with SMTP id k10mr2558795iop.8.1614257723114;
        Thu, 25 Feb 2021 04:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614257723; cv=none;
        d=google.com; s=arc-20160816;
        b=sERRNT/0uvntffBy48v1la7mDgT+ql5yjn82PFiopZp3O9CMuscs+rRD6g7HZnGSWm
         lcZ/PLXKOhRpLbjZ3oT62Kh4kfvzq7zknWCzwrGWjn1yc89PfOh7XeBJCKvXmuMeNbNA
         NMX1nMhacI8TgIRQVOsU1cVP+XFiJKb7U6Burua2eT7NtfEm4VLBvFqhZzZophcyL+5O
         +2gD1tI8bbhu/RxoUnHhDXS/H1RHxhXl2b8xYSIQmUHFUo66tNQ6b210rd5/e0IjIaj3
         KSNxBLbntDgJ2nUwjG8M1p5cahS4dZwyQ97xKzMhsP8PMWKtK3Xx/e4I2z10Au041RaP
         cWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Om46bTbJRjiOMd2naKySMIukpACteUosyDxPQic5Uck=;
        b=PnGSXZb9VzrKKGsVqO6NYfgdRiyAObas+YVsypUvUPef9qrN2ri+ADmHpmbSKWiJCV
         jNRNMkdJlYX5EWeGg0uOpnGCUpvtlHXLNxzNnSBec5jLbr5vpK2q6pVsOPFIdW5iPnbL
         0hhYc5W+J+ZYGgyeDd8/qWtdzIcjlwSjed8vyv6rxSCPvbaZbyWNaiWHaD0Dwstc0nQc
         +En0MDzSoI1IZ0SiMoPsQ+Q+E5OhZUl9Hb4qVJoBqf5hArOx0H6XsyOkHmrBYd+A7p3r
         RhI3A07DcCfNWInlHu3ls9gpQqq11eX70VHcu6kcmaNBXM4wmIy6ZbLIZ6P4YHZtX73Z
         ncQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t123si5435417iof.39.2021.02.25.04.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 04:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFGAs-0006fP-9A
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 07:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGAV-0006bU-WC; Thu, 25 Feb 2021 07:55:00 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGAS-00026M-Eh; Thu, 25 Feb 2021 07:54:59 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmXlF6TrFzjRrM;
 Thu, 25 Feb 2021 20:53:13 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 20:54:41 +0800
Subject: Re: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-2-fangying1@huawei.com>
 <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <278b7b03-f463-61b6-111d-1e840df22eae@huawei.com>
Date: Thu, 25 Feb 2021 20:54:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jOF0ceF5lgd3



On 2/25/2021 7:03 PM, Andrew Jones wrote:
> Hi Ying Fang,
> 
> I don't see any change in this patch from what I have in my
> tree, so this should be
> 
>   From: Andrew Jones <drjones@redhat.com>
> 
> Thanks,
> drew
> 

Yes, I picked it from your qemu branch:
https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa

So what can I do to make it "From: Andrew Jones <drjones@redhat.com>" ?

Can I made it by using git commit --amend like below ?

git commit --amend --author "Andrew Jones <drjones@redhat.com>"

> On Thu, Feb 25, 2021 at 04:56:23PM +0800, Ying Fang wrote:
>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
>> it also adds any missing parent nodes. We also tweak an error
>> message of qemu_fdt_add_subnode().
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   include/sysemu/device_tree.h |  1 +
>>   softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>>   2 files changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 982c89345f..15fb98af98 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>   uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>   int qemu_fdt_nop_node(void *fdt, const char *node_path);
>>   int qemu_fdt_add_subnode(void *fdt, const char *name);
>> +int qemu_fdt_add_path(void *fdt, const char *path);
>>   
>>   #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>       do {                                                                      \
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index b9a3ddc518..1e3857ca0c 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>   
>>       retval = fdt_add_subnode(fdt, parent, basename);
>>       if (retval < 0) {
>> -        error_report("FDT: Failed to create subnode %s: %s", name,
>> -                     fdt_strerror(retval));
>> +        error_report("%s: Failed to create subnode %s: %s",
>> +                     __func__, name, fdt_strerror(retval));
>>           exit(1);
>>       }
>>   
>> @@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>       return retval;
>>   }
>>   
>> +/*
>> + * Like qemu_fdt_add_subnode(), but will add all missing
>> + * subnodes in the path.
>> + */
>> +int qemu_fdt_add_path(void *fdt, const char *path)
>> +{
>> +    char *dupname, *basename, *p;
>> +    int parent, retval = -1;
>> +
>> +    if (path[0] != '/') {
>> +        return retval;
>> +    }
>> +
>> +    parent = fdt_path_offset(fdt, "/");
>> +    p = dupname = g_strdup(path);
>> +
>> +    while (p) {
>> +        *p = '/';
>> +        basename = p + 1;
>> +        p = strchr(p + 1, '/');
>> +        if (p) {
>> +            *p = '\0';
>> +        }
>> +        retval = fdt_path_offset(fdt, dupname);
>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>> +            error_report("%s: Invalid path %s: %s",
>> +                         __func__, path, fdt_strerror(retval));
>> +            exit(1);
>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>> +            retval = fdt_add_subnode(fdt, parent, basename);
>> +            if (retval < 0) {
>> +                break;
>> +            }
>> +        }
>> +        parent = retval;
>> +    }
>> +
>> +    g_free(dupname);
>> +    return retval;
>> +}
>> +
>>   void qemu_fdt_dumpdtb(void *fdt, int size)
>>   {
>>       const char *dumpdtb = current_machine->dumpdtb;
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 
