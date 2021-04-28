Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp296980lfb;
        Tue, 27 Apr 2021 23:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw25sve3549sMVhtD35F89BtgJhcd6QxNWjV2brzmVB288R1/N+1ni2ydYGRg1NxH6dovs4
X-Received: by 2002:ab0:3482:: with SMTP id c2mr22159531uar.122.1619592510949;
        Tue, 27 Apr 2021 23:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619592510; cv=none;
        d=google.com; s=arc-20160816;
        b=eaCHuSp25gSUfOyIw3ZWRmjCA97yjTg0TunrywbYXZyq5xKGVgwfrDGG2rIwl9g3Un
         c4hqN46kc1bjFwI7vGD0SK1M9CUDR9CAkmQkziAAeRm4AKsyYhdKhwdAEBWhDmLnvWsQ
         wgWOkD1+1n+YkNxaIl7QT9p5OrJHqetYsQuP218SM/P0jGDk/lCLpvjJ6wbsQFNB9R+w
         z4fODhvJEMsCl8ULKA9Toz7H6Xiz70I2qysQwyg9euWLW+5gYk6uYhY0GnVHRhD6f2+0
         i7XPyK/2m6Cn4iOHqYfTU7pdcJG837Ltfsm3EpxZ/fbAQCeZlciDfdnXW6uKqlFjH6DM
         KPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=RyLrEnSUpdNDTDQ3c1lXBLxF/bYeWaxjJa6YU6jGYzQ=;
        b=COHlIA6ZN3ec+DuXoK0FIW5SRUPDlzSzsCbAH/oF5vsCeldIjEjI7DEw+B3vvY7m3v
         AwLIHPJiGLQ0iVEP4dAc3XJZkvmx4rMZE306gZpbFpuZKd6OCp3iSiWQfnNMWPkD4zr4
         DeoHmrGwvipljbQk2Yk2i/jDjnRBLWMojAlfxYvc5SVnI0lY8y0/wR3WAp4UTZKTpYWA
         ZEdIlQhky0kysJAjq1lte8Ih8k7xuB4YNw6E/pMtyzqxWxwwqHi9LgN89Zqkouc+gk8u
         Zlb6shz3I+i46BhWqCxgzlEWR2pXsaiN3LM7EGoli6cMsVCls45s4UDBDlVmhp8cgNEW
         2g9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si1203447vkm.74.2021.04.27.23.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 23:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbdzq-0004nt-7o
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 02:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbdzN-0004m3-Bw; Wed, 28 Apr 2021 02:48:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbdzK-0004AI-7p; Wed, 28 Apr 2021 02:48:01 -0400
Received: from dggeml715-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FVTfP5JCtzYd6d;
 Wed, 28 Apr 2021 14:45:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml715-chm.china.huawei.com (10.3.17.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:47:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:47:50 +0800
Subject: Re: [RFC PATCH v2 3/6] hw/arm/virt-acpi-build: Distinguish possible
 and present cpus
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-4-wangyanan55@huawei.com>
 <20210427145036.snne6xunr6cnyxln@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <c20966ab-9784-a761-417e-6d20a09ebc7c@huawei.com>
Date: Wed, 28 Apr 2021 14:47:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427145036.snne6xunr6cnyxln@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FS1y5aQniooW

Hi Drew,

On 2021/4/27 22:50, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:42PM +0800, Yanan Wang wrote:
>> From: Ying Fang <fangying1@huawei.com>
>>
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. We then ensure only the present CPUs are enabled in MADT.
>> Furthermore, it is also needed if we are going to support CPU
>> hotplug in the future.
>>
>> This patch is a rework based on Andrew Jones's contribution at
>> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html
> Thank you for this credit, but I think I'd prefer a Co-developed-by
> tag instead, if you don't mind.
No problem. I will add your Co-developed-by tag and you deserve that.
There may still be something inappropriate about credit in this series,
but I will try to make things all right.

Thanks,
Yanan
> Thanks,
> drew
>
> .
