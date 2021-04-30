Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp314859lfb;
        Fri, 30 Apr 2021 02:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCMM66n8UMWQ+EP4V2ef+8HwkhIrlEZYdqZvTq2sphj9jbP7na4vjgHBNZfyVlxD/ELFx1
X-Received: by 2002:a1f:4644:: with SMTP id t65mr4527723vka.0.1619775270641;
        Fri, 30 Apr 2021 02:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619775270; cv=none;
        d=google.com; s=arc-20160816;
        b=1DXxnzUhv+gWrU1w40PEls1O4s2dKy6eDF8ZaXGdOtAhPvGVJv2QN7+6Yat/zc8EVH
         9PLHLQNnCD2WgTcwy4r5sNLYF8W3lZlk1jlaZxY40R+sGpY6lztzcYyj55QrQQA51J5c
         fq3m+XkPEXoV83IDou4JFX1gMgHedCzF/hTqHDol4XQWcKK7lLUKDrXZufbsBiafqLVS
         TFpjEoo3o58deptkJEXtpbT8Zy7HV++mueAEL9/YLqMpRBLaHbGcw+TYhAZKInx9V/bk
         bGQHxzj/vgAEw8uAvALIlkZ67tNhVI8Vxx2Ov+QWHLXu+iyG05AQ6+80uiEPaPCbUhog
         GN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=K37z9HW1y38oYWhuO05i4ZKANGAsY0IZih55ljj4/Sg=;
        b=DR2L4rViIj922vXZ4QgqXwfZyHL26bdc6xy47NM5efAida0Q0iVwOF46E/WMOrzpN+
         Gt4tPLkVhYOOsmF6ybbN+4S4FXiIsQOcTXqe5u5nK844DZumrPueJKsxSQLZ88VkjsaU
         5Fea0+DllqMTOfPU/3YYN3abQVZBIQUuqbBmLON7CUKYmJhdAptWIR/4zKri4NlXpztY
         IqHm8z7+6TM+gMdJdfH/G+bEves/A56Mby6sqT9sv8aUOUVq/WjfF5y+k31D7kgn5itK
         zC8dxIiTlSh1AaqUJ8V/0wyY/5L3eh3Vfdd3OG7PtyhrgKytOG8wX43Fhdb1nzfFUlAv
         k8lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si991262vkp.15.2021.04.30.02.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 02:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcPXa-0006yd-0o
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lcPX0-0006xx-UX; Fri, 30 Apr 2021 05:33:54 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lcPWv-0007ez-OT; Fri, 30 Apr 2021 05:33:54 -0400
Received: from dggeml754-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FWnDd2nCJz5vL9;
 Fri, 30 Apr 2021 17:31:13 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml754-chm.china.huawei.com (10.1.199.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 30 Apr 2021 17:33:43 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 17:33:42 +0800
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
To: Andrew Jones <drjones@redhat.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
 <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
 <20210429110229.7jtz6hfrfvqdkrbx@gator>
 <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
 <20210430064125.3b5fjolwqculrjxz@gator.home>
 <20210430070131.kkavbosw27ze4iuh@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <dedb07c3-b6fa-ccb0-9d06-65c7866238db@huawei.com>
Date: Fri, 30 Apr 2021 17:33:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210430070131.kkavbosw27ze4iuh@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XuwrrAFY7V7t


On 2021/4/30 15:01, Andrew Jones wrote:
> On Fri, Apr 30, 2021 at 08:41:25AM +0200, Andrew Jones wrote:
>> On Fri, Apr 30, 2021 at 01:09:00PM +0800, wangyanan (Y) wrote:
>>> But I think the requirement for ARM "if even one parameter other than cpus
>>> or maxcpus
>>> is provided then all parameters must be provided" will be better. This can
>>> ensure the
>>> whole accurate users-specified topology. As you mentioned, if anybody who
>>> bothers
>>> to specify one, why not also specify the others.
>>>
>>> I can add the requirement for ARM in the documentation, and also check the
>>> parameters
>>> in virt_smp_parse. Will this be fine?
>> We sort of have to support command lines that are missing 'maxcpus' and
>> 'clusters', unless we work together with libvirt to make the change.
>> Currently libvirt will generate '-smp 16,sockets=16,cores=1,threads=1'
>> from '<vcpu placement='static'>16</vcpu>'. That's sufficient for our
>> stricter, but not completely strict requirements. And, I still think
>> 'threads' could be optional, because there's a good chance the user
>> doesn't want to describe them, so a default of 1 is good enough. Also,
>> given maxcpus, but not cpus, it's pretty obvious that cpus should equal
>> maxcpus.
>>
> We also still need just 'cpus' or just 'maxcpus' to work, since that
> already works now. So, at least these should work
>
>   -smp N
>   -smp maxcpus=N
>   -smp N,maxcpus=M
>   -smp N,sockets=N,cores=1,threads=1
>   -smp N,maxcpus=M,sockets=M,cores=1,threads=1
>
> since they work today, even though no topology is described.
Yes. I forgot this point that we should consider the compat.
> If we want to
> describe a topology for the first three, then we'll have to pick one,
> which brings us back to the sockets over cores stuff. Or, we could choose
> to just not generate topology descriptions when none is provided.
I find that both preferring cores over sockets and not generating 
topology descriptions
when none is provided can't solve everything. We can only ensure guest 
will get one
socket with multiple cores with qemu cmdline "-smp N".

But if we specify N cpus without any other parameters in libvirt xml, a 
qemu cmdline like
"-smp N, sockets=N, cores=1,threads=1" will be generated, and as a 
result guest will get
N sockets. In this case, we still can't avoid the silent change.

So maybe we should just prefer sockets over cores like the general 
smp_parse() and libvirt,
and let users use "-smp N, sockets=1, cores=N,threads=1" to get what 
they want if they
use version 6.0 or later.

Thanks,
Yanan
> Thanks,
> drew
>
> .
