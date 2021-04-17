Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp899109lfr;
        Fri, 16 Apr 2021 19:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNe4mnTNLNZW9ub7sJidg5f7Ejj3IVuf8h/j0mE1gACvXn1dbty2F0s7rsF3J2PRKvZ0Hs
X-Received: by 2002:a92:ce90:: with SMTP id r16mr9654731ilo.220.1618627021315;
        Fri, 16 Apr 2021 19:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618627021; cv=none;
        d=google.com; s=arc-20160816;
        b=buvA2tYHXs7BuYfQMYqWUkPIrpszLvM5kb0/ERXYEdOUTCUAIYu1nsp/jIG6qduUdk
         wuEAKZn0p2eqdT9cqBGBWFeJMAdzmf52nUB3Bo0KWvg3aOmbqsd0kM6tlKs6reTIoDFV
         pZVcAAbCSjobXPm01zfHkRvJZJoZELz1/AUhXe9hqUqXTb1L886tiICAkmAUoDJPYvFY
         sd2dYy3IqvCIqTTelwWXGp2vFiMlAbu1j7UYaAKHw9684KDuY5TLa7nc7FeEq/oEhXL+
         AIF6EgE6PIPFo2RZhLSj23ODtgvmFhdPLVfld04Hx28TPRl0oY5E1BQqIOp6ENCnRJFU
         61Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=3itfYt4Un4Bh5UIBBUqPg4l5K19qg0MZGJ3oNoVwD8U=;
        b=ZdYoZqfL9X6l5M/v/PwUFkuAYmHrGyT0yxqSnZVRYPydWdIKwXuLCgTOX8W3NZ1tHU
         UhEZINL4rWIssd46F0Ve8Reu2MIPbxtTlrbGFCK7926UobG7g7K4ZMZcLKViss9o3X6U
         MLxmefNEjvZGn8Ckt4wodXfUn/BYS3pe6JMQPvXOsvxCu9+8rNAJKCek4l0bn3NwtI33
         J+Q//ghqAaaPRPsDAzS/X957DC8stynOlU7FWkn0ZS7xxPc3H2okkOajOxp00gBwo0bz
         FzOOlJeMVpE7MjQ6k3NuUlBm03EudblQhd3gJi37Btv/i/qNwbH/psrSmwyF2KXFaACf
         0/qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si4371802jat.35.2021.04.16.19.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 19:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXapQ-0004x4-E6
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 22:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lXap8-0004wg-09; Fri, 16 Apr 2021 22:36:42 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lXap4-0000VS-Oo; Fri, 16 Apr 2021 22:36:41 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FMcbX3C9fzRWxZ;
 Sat, 17 Apr 2021 10:34:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 17 Apr 2021 10:36:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Sat, 17 Apr 2021 10:36:20 +0800
Subject: Re: [RFC PATCH v2 1/6] device_tree: Add qemu_fdt_add_path
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-2-wangyanan55@huawei.com>
 <YHkYD+cCl9/GCxwJ@yekko.fritz.box>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <cd3408c2-6025-7a44-bbf6-d675467c5749@huawei.com>
Date: Sat, 17 Apr 2021 10:36:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YHkYD+cCl9/GCxwJ@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /5jY99YxaqPO

Hi David,

On 2021/4/16 12:52, David Gibson wrote:
> On Tue, Apr 13, 2021 at 04:07:40PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
>>
>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
>> it also adds any missing subnodes in the path. We also tweak
>> an error message of qemu_fdt_add_subnode().
>>
>> We'll make use of this new function in a coming patch.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   include/sysemu/device_tree.h |  1 +
>>   softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>>   2 files changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 8a2fe55622..ef060a9759 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>   uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>   int qemu_fdt_nop_node(void *fdt, const char *node_path);
>>   int qemu_fdt_add_subnode(void *fdt, const char *name);
>> +int qemu_fdt_add_path(void *fdt, const char *path);
>>   
>>   #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>       do {                                                                      \
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 2691c58cf6..8592c7aa1b 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -541,8 +541,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
>> @@ -550,6 +550,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
> Getting the offset for "/" is never needed - it's always 0.
Thanks, will fix it.
>> +    p = dupname = g_strdup(path);
> You shouldn't need the strdup(), see below.
>
>> +
>> +    while (p) {
>> +        *p = '/';
>> +        basename = p + 1;
>> +        p = strchr(p + 1, '/');
>> +        if (p) {
>> +            *p = '\0';
>> +        }
>> +        retval = fdt_path_offset(fdt, dupname);
> The fdt_path_offset_namelen() function exists *exactly* so that you
> can look up partial parths without having to mangle your input
> string.  Just set the namelen right, and it will ignore anything to
> the right of that.
Function fdt_path_offset_namelen() seems more reasonable.

After we call qemu_fdt_add_path() to add "/cpus/cpu-map/socket0/core0" 
successfully,
if we want to add another path like "/cpus/cpu-map/socket0/core1" we 
will get the error
-FDT_ERR_NOTFOUND for each partial path. But actually 
"/cpus/cpu-map/socket0"
already exists, so by using fdt_path_offset_namelen() with right namelen 
we can avoid
the error retval for this part.
>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>> +            error_report("%s: Invalid path %s: %s",
>> +                         __func__, path, fdt_strerror(retval));
> If you're getting an error other than FDT_ERR_NOTFOUND here, chances
> are it's not an invalid path, but a corrupted fdt blob or something
> else.

Right, there can be variable reasons for the fail in addition to the 
invalid path.

>> +            exit(1);
>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>> +            retval = fdt_add_subnode(fdt, parent, basename);
>> +            if (retval < 0) {
>> +                break;
>> +            }
I found another question here. If path "/cpus/cpu-map/socket0/core0" has 
already
been added, when we want to add another path "/cpus/cpu-map/socket0/core1"
and go here with retval = fdt_add_subnode(fdt, parent, "cpus"), then 
retval will
be -FDT_ERR_EXISTS, but we can't just break the loop in this case.

Am I right of the explanation ?

Thanks,
Yanan
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
