Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp359945lfg;
        Thu, 25 Feb 2021 05:39:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm+laXx/JeMbBEEZDfgYwTyfWDhkcB/NtEcAKpXE/ocOpWYYcE6QmkgIvTN6i6wUn7ZcZs
X-Received: by 2002:a6b:ea04:: with SMTP id m4mr2635069ioc.160.1614260392202;
        Thu, 25 Feb 2021 05:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614260392; cv=none;
        d=google.com; s=arc-20160816;
        b=VnxfoF9P+pjhGhN1F6/nKW6KfNRD72UiBn2Xx7sDssVONcrdG0QtCjv+n6EJ4ojJtX
         tYAOzZu9GL+0AnrohPil7mOhP0s5e6tGVAHoL5O9zKs8hTIqv7JRE0k3KhD1+ydaTcQc
         knHvGrZEetFQXEgrr1694r7kpboSWfHD0fzX7ML8iGX+VBEYAtKxpMw8P4/ihZgX72aD
         jcGhhjtGYKnVntV7D67X94KgJCUHVYBAy/fJLR6y5di5pTGkeuGJMq88j1W/t/up+nHi
         9VsXSLOtydOrgnxs8RDIAGHYjdV+gGYc5Ylo6Xy8c4uBLIyGixbiA9YM4cYdPO3vjlv7
         BZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=tTomktFi5T/2L7syvd8sGW9PDd42rRdOSM8d1BgENcQ=;
        b=CJUHVkao3rcdZBu0ik81tt6s/pb1Y76w733dm7Y0ncLnxoFt8i5fn6qgwmLOZ2GBP7
         7xYsiZ5iR9qI9ckLQ9/RWmFcBBGOoLSmMDvRVQomZnWSUXtpJ83iYip9YIWHWaeY9Io5
         /av6UefEvjzmrtq8K06mRxY7ma3XjwfZn0/6ILch/F6XcrJJ8mx0s34O/4aoyyJbciHq
         XzrSPAoH4VotuzcXh+hXc1x5eChYh5DdQfozIc2Eiod9VgDO2ofbl2h6VfUqLyvcxM32
         26DJLeHxv2JaxYGhkImJjUiySlFgTEd8ZfRWmw55hj1K5b2csUsjOomZIteAojZPh+kj
         q7Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si2592156iow.32.2021.02.25.05.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 05:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFGrv-0003uW-GE
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 08:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGrd-0003TD-Um; Thu, 25 Feb 2021 08:39:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGra-00068B-8P; Thu, 25 Feb 2021 08:39:33 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmYkY1JHrz16C8y;
 Thu, 25 Feb 2021 21:37:41 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 21:39:08 +0800
Subject: Re: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-2-fangying1@huawei.com>
 <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
 <278b7b03-f463-61b6-111d-1e840df22eae@huawei.com>
 <20210225132536.ns4fheaik6vt45si@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <ce24abfe-8b4c-9e70-d772-7eee9ae5ad22@huawei.com>
Date: Thu, 25 Feb 2021 21:39:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225132536.ns4fheaik6vt45si@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pfeOaTiT4wdZ



On 2/25/2021 9:25 PM, Andrew Jones wrote:
> On Thu, Feb 25, 2021 at 08:54:40PM +0800, Ying Fang wrote:
>>
>>
>> On 2/25/2021 7:03 PM, Andrew Jones wrote:
>>> Hi Ying Fang,
>>>
>>> I don't see any change in this patch from what I have in my
>>> tree, so this should be
>>>
>>>    From: Andrew Jones <drjones@redhat.com>
>>>
>>> Thanks,
>>> drew
>>>
>>
>> Yes, I picked it from your qemu branch:
>> https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa
>>
>> So what can I do to make it "From: Andrew Jones <drjones@redhat.com>" ?
>>
>> Can I made it by using git commit --amend like below ?
>>
>> git commit --amend --author "Andrew Jones <drjones@redhat.com>"
> 
> That's one way to fix it now, but normally when you apply/cherry-pick
> a patch it will keep the authorship. Then, all you have to do is
> post like usual and the "From: ..." will show up automatically.
> 

Hmm, I know cherry-pick can do that. But sometimes there maybe
conflicts, so I have to backport it by hand and copy the commit
msg back, thus the authorship may be lost.


> Thanks,
> drew
> 
>>
>>> On Thu, Feb 25, 2021 at 04:56:23PM +0800, Ying Fang wrote:
>>>> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
>>>> it also adds any missing parent nodes. We also tweak an error
>>>> message of qemu_fdt_add_subnode().
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>>> ---
>>>>    include/sysemu/device_tree.h |  1 +
>>>>    softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>>>>    2 files changed, 44 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>>> index 982c89345f..15fb98af98 100644
>>>> --- a/include/sysemu/device_tree.h
>>>> +++ b/include/sysemu/device_tree.h
>>>> @@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>>>    uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>>>    int qemu_fdt_nop_node(void *fdt, const char *node_path);
>>>>    int qemu_fdt_add_subnode(void *fdt, const char *name);
>>>> +int qemu_fdt_add_path(void *fdt, const char *path);
>>>>    #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>>>        do {                                                                      \
>>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>>> index b9a3ddc518..1e3857ca0c 100644
>>>> --- a/softmmu/device_tree.c
>>>> +++ b/softmmu/device_tree.c
>>>> @@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>>>        retval = fdt_add_subnode(fdt, parent, basename);
>>>>        if (retval < 0) {
>>>> -        error_report("FDT: Failed to create subnode %s: %s", name,
>>>> -                     fdt_strerror(retval));
>>>> +        error_report("%s: Failed to create subnode %s: %s",
>>>> +                     __func__, name, fdt_strerror(retval));
>>>>            exit(1);
>>>>        }
>>>> @@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>>>>        return retval;
>>>>    }
>>>> +/*
>>>> + * Like qemu_fdt_add_subnode(), but will add all missing
>>>> + * subnodes in the path.
>>>> + */
>>>> +int qemu_fdt_add_path(void *fdt, const char *path)
>>>> +{
>>>> +    char *dupname, *basename, *p;
>>>> +    int parent, retval = -1;
>>>> +
>>>> +    if (path[0] != '/') {
>>>> +        return retval;
>>>> +    }
>>>> +
>>>> +    parent = fdt_path_offset(fdt, "/");
>>>> +    p = dupname = g_strdup(path);
>>>> +
>>>> +    while (p) {
>>>> +        *p = '/';
>>>> +        basename = p + 1;
>>>> +        p = strchr(p + 1, '/');
>>>> +        if (p) {
>>>> +            *p = '\0';
>>>> +        }
>>>> +        retval = fdt_path_offset(fdt, dupname);
>>>> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
>>>> +            error_report("%s: Invalid path %s: %s",
>>>> +                         __func__, path, fdt_strerror(retval));
>>>> +            exit(1);
>>>> +        } else if (retval == -FDT_ERR_NOTFOUND) {
>>>> +            retval = fdt_add_subnode(fdt, parent, basename);
>>>> +            if (retval < 0) {
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +        parent = retval;
>>>> +    }
>>>> +
>>>> +    g_free(dupname);
>>>> +    return retval;
>>>> +}
>>>> +
>>>>    void qemu_fdt_dumpdtb(void *fdt, int size)
>>>>    {
>>>>        const char *dumpdtb = current_machine->dumpdtb;
>>>> -- 
>>>> 2.23.0
>>>>
>>>>
>>>
>>> .
>>>
>>
> 
> .
> 
