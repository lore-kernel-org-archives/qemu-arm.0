Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1274418lfm;
        Mon, 17 May 2021 06:22:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfXkqnMpLUMpCfgpkChfA/hMJfyUzWHjoLYLgBB2cF1JRM6nE35iTZ9T4uYmwST4/wryLO
X-Received: by 2002:a92:ce07:: with SMTP id b7mr25368835ilo.94.1621257725664;
        Mon, 17 May 2021 06:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621257725; cv=none;
        d=google.com; s=arc-20160816;
        b=h67X0aEPStuKjxi8LeA9JIt4yD2neJevh/kOtPpxxA7kFrnluYrNHMcd32jsn7Wx5e
         iTXp8MBVg2dOk0EkPO0Aa+GxttTKcF5AKp/pbFKrekRDfWTSmFqiLNPqsny5w6nPWumB
         TzrwIoCbEO+S00nNRI8U/sr5n2ok4Ty4huWC4pDKWd2tq9T6+/HCqWxZZKn/FqYzn520
         lG7pV0PfHUDty/d8ctRT7pzJ1ewYUtaxxtp+XzAVXXrCeGkFbjW5VezOUqD1KoMC2ek0
         Oi7tWbGQnegD8LuGp4BNblJ1IyG5ahj1rcC43v5h2Ka/yVH6YKKKXEPSRyWnPTtVPG77
         SnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Xgwc50rx8bsAdGvYn8hrtVMjoCNbyWi98ymM2ZA0ZIk=;
        b=pFB7HtN+fa7C8vq/OVpeKHQsnu76OfNeQ2ZI78qjzidN2+t/royRKhXt8lgDL7+Rdm
         MdXUSt+h8PlfRtBrS+szI1IdJ0r9mwzMXZuPzk2MFssdLFDPG9kaujATg+UX29ggvC5y
         UP4f78d9iv5MGJolkIb6SoreLYwzpqTU93LPBMfk2aOHhb90bWuIy+c5CoONoE+XEfgx
         0JeZl3nIDyGQDTDPOS2Iaq+yFVvOapl5+3XTI9nwzu+RsjQbPrwSsfYl4YaeoKa3SR4m
         UilLNqshpS2SDO+j9p4unXcrn61t8SNoGpRJyu5F1UXUalYlRN+peqGiPjY5lg/tEYFL
         ZBJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si9776805ilt.118.2021.05.17.06.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 06:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lidC9-0000xJ-0X
	for alex.bennee@linaro.org; Mon, 17 May 2021 09:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lidC0-0000x6-RI; Mon, 17 May 2021 09:21:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lidBy-0005AL-6F; Mon, 17 May 2021 09:21:56 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FkKTj3RcyzCtBs;
 Mon, 17 May 2021 21:19:05 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 21:21:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 21:21:49 +0800
Subject: Re: [RFC PATCH v3 2/9] device_tree: Add qemu_fdt_add_path
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-3-wangyanan55@huawei.com>
 <20210517062741.t44x3gnlukczmjit@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <91dbcfd1-9a42-ed67-2ad8-45a88e703e95@huawei.com>
Date: Mon, 17 May 2021 21:21:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517062741.t44x3gnlukczmjit@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangyanan55@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00FSB2xuonYF


On 2021/5/17 14:27, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:28:53PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
> Hi Yanan,
>
> This looks good, but the authorship is no longer correct. You've
> completely rewritten it, so I think the most I deserve is a
> Co-developed-by and maybe even just a Suggested-by. When changing
> the authorship and tags, you can also add a
Hi Drew,

Thanks for pointing out this, I will correct it.
> Reviewed-by: Andrew Jones <drjones@redhat.com>
Thanks,
Yanan
> Thanks,
> drew
>
>
>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
>> also adds all missing subnodes from the given path. We'll use it
>> in a coming patch where we will add cpu-map to the device tree.
>>
>> And we also tweak an error message of qemu_fdt_add_subnode().
>>
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   include/sysemu/device_tree.h |  1 +
>>   softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
>>   2 files changed, 43 insertions(+), 2 deletions(-)
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
>> index b621f63fba..3965c834ca 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
>> @@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>       return retval;
>>   }
>>   
>> +/*
>> + * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
>> + * all missing subnodes from the given path.
>> + */
>> +int qemu_fdt_add_path(void *fdt, const char *path)
>> +{
>> +    const char *name;
>> +    const char *p = path;
>> +    int namelen, retval;
>> +    int parent = 0;
>> +
>> +    if (path[0] != '/') {
>> +        return -1;
>> +    }
>> +
>> +    while (p) {
>> +        name = p + 1;
>> +        p = strchr(name, '/');
>> +        namelen = p != NULL ? p - name : strlen(name);
>> +
>> +        retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>> +            error_report("%s: Unexpected error in finding subnode %.*s: %s",
>> +                         __func__, namelen, name, fdt_strerror(retval));
>> +            exit(1);
>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>> +            retval = fdt_add_subnode_namelen(fdt, parent, name, namelen);
>> +            if (retval < 0) {
>> +                error_report("%s: Failed to create subnode %.*s: %s",
>> +                             __func__, namelen, name, fdt_strerror(retval));
>> +                exit(1);
>> +            }
>> +        }
>> +
>> +        parent = retval;
>> +    }
>> +
>> +    return retval;
>> +}
>> +
>>   void qemu_fdt_dumpdtb(void *fdt, int size)
>>   {
>>       const char *dumpdtb = current_machine->dumpdtb;
>> -- 
>> 2.19.1
>>
> .
