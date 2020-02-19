Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp119278lfp;
        Tue, 18 Feb 2020 21:39:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaefXdGX0ME8IwbLcybENU8W0FEcsAsgiylIN05Y5n+gAfWuwTo0OokSnW7+Cqx6yri5uY
X-Received: by 2002:ac8:5208:: with SMTP id r8mr20712821qtn.131.1582090791929;
        Tue, 18 Feb 2020 21:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582090791; cv=none;
        d=google.com; s=arc-20160816;
        b=0NAMJmqZ+ezYEDmeiaSPSjLMHhJ+H2DKKsA7YkwKSW4MYZXWRXkHKowmuGYc1fXiVZ
         S8v690pldrDdEltm991fVymU27KNS8/L/j14pFUI7k4faQKZZv0KFEgHfNwfE3j2/MPN
         ZWoW5sTgZ3/gpfrVMYYDFSnA89i8wB02QqNe0VCh89Rxzvi6dGhO6x2u0v0+5uSNh+vx
         2/4hm2NBZmWvJ6QTwPSBihN7yBm6C2kxIehOYXI8MP9u25OJAlGszUeacuX7c98e+/6p
         OO3POEHKiRsz/J1i3Jo/2Dp343WZAUhG/+QwFTsJYyhRIdbcJdtx9PiGQSAaxxaW8A+8
         nwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=WlPV3+jNYYOuY1TkZNpjt+QDv0r2ASQkdsh635MOKKs=;
        b=sVtM32mOzCvYTYJ/ONPIUdnpUNGyKqo0uPlVqNPZBPqzkuOGiLpee/LLQA6YAjNG4T
         HU1eHOf04HWBNomCd9CHlKD6WvXrXHJpf+1qkVnwG+mATC+P4UT73JDlbaBng6Zv1xKD
         lH4VB3kSnTYxBr1FZUr8SdMYsFxLScIA6CdO+cW8Mr4ItL5u31ZRsVHrZU9hcunT2QCT
         wylLNXm6mSDVsFzedsxExLJbEvr77c+GquqbSZq9tN8r1AkCI5czWq+i99/pXCUTQhGH
         VAaP0fx9kujxBloQ9uWxWufgNTsK6NTw6kN7BCHxTDG7JApGClPUYZdIedr1jlwxpS1Q
         ya3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si453698qtv.103.2020.02.18.21.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 21:39:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4I5P-0005C7-D6
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 00:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I5G-0005Ba-Al
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 00:39:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I5F-0007WF-BV
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 00:39:42 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:56612 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j4I5F-0007VC-00; Wed, 19 Feb 2020 00:39:41 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8BAA0F32D9837593EF5A;
 Wed, 19 Feb 2020 13:39:38 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 19 Feb 2020 13:39:29 +0800
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
 <20200214122810.GE3283@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <9c4ea6f9-0fe9-19ae-964d-a01799879f54@huawei.com>
Date: Wed, 19 Feb 2020 13:39:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200214122810.GE3283@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ey/169xkmjLw



On 2020/2/14 20:28, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> At the tail stage of throttle, VM is very sensitive to
>> CPU percentage. We just throttle 30% of remaining CPU
>> when throttle is more than 80 percentage.
> 
> This is a bit unusual;  all of the rest of the throttling has no
> fixed constants; all values are set by parameters.
> 
> You've got the two, the '80' and the '0.3'
> 
> I thinkt he easy solution is to replace your parameter 'tailslow' by two
> new parameters; 'tailstart' and 'tailrate';  both defaulting to 100%.
> 
> Then you make it:
> 
>         if (cpu_throttle_now >= pct_tailstart) {
>             /* Eat some scale of CPU from remaining */
>             cpu_throttle_inc = ceil((100 - cpu_throttle_now) * pct_tailrate);
> 
> (with percentage scaling added).
> 
> Then setting 'tailstart' to 80 and 'tailrate' to 30 is equivalent to
> what you have, but means we have no magical constants in the code.
> 
Yes, this is a good suggestion. Though this patch is not the final idea,
I will apply it when throttle approach is decided.
> Dave
> 
> 
[...]
>> -- 
>> 2.19.1
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
> .
> 
Thanks,
Keqian

