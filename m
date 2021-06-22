Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3021832lfg;
        Tue, 22 Jun 2021 05:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1GQTChbxeUPf90n5TECa3rNr04OZJiXv7UWLntpLlGatVb84pXqa5cD4EfEmbOzEnfrBA
X-Received: by 2002:ac2:5e64:: with SMTP id a4mr2708743lfr.657.1624365207000;
        Tue, 22 Jun 2021 05:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624365206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrCCqlv9Su26eDqKcCmqe8Rgp/wJzqy16+yymC0Nq6QxZZvs3iUsNRwPcegApW4JE7
         3miv6yg8I7G9KZsfgn5Nlb2bZ6gAF7YEwOJy/zxREP6EQIgGtBkFQ8kP8SgkxtLqDsnh
         /fZIy/MN3xmv0llZOlSOKzy5Qyt2Pjbqc4PAX9SaZkFbaBxqC7gdEwzCadcQn+2wQ0xm
         +I/LFArJs9ziipdyN4zJ2aIMN4umbbSCQoqgCLly6cLSWHgi9W91fJ1fec6KSvZwsTim
         gZM57FXqktEu0ou2rpzdrEHCgioe4M5iwOrphp1FxcGZ7+zZ60FI7TJXDKWkRExGhC/l
         rBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mppc1vGZcxWeNW7Q77NUMhKTb6ODtzj+ATHxyiwq5U8=;
        b=tbjaOgETyl9G41rogUZD5uOscSFw6qr29TqzKpkIxVjiMs2snRwFVZ8IzLcH0mcLn1
         YucdorvCAFMg3quFDTQeHaRJyBq2TZXFGbz1onravg+zLR+tghtG1Z/R+gCbu7EM1AQC
         dMPDc8WmgdNalTq4T2ZscF23zYpM9vgzQ500xvdaOgyLLdvt0bmKQHottUtFOiZksZSG
         /TbRR9VLKYQlmBzqsDsxcJZPCvuYShnPgPZxXXlXwAPCX1abPPXZfqxCAinQeoYwWPK7
         MWsVg+WLYYf0fU5XDgkeykqgbHHabhQ+Dvi+XgTx8ZaCXAEELzm/aybLggNj9boRGfAa
         kesQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22si29356646ljk.66.2021.06.22.05.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 05:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvfao-0006cD-1X
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 08:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvfZ2-0004YT-UZ; Tue, 22 Jun 2021 08:31:37 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvfYw-0002qt-Hu; Tue, 22 Jun 2021 08:31:36 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G8Qc65DCHz1BQQB;
 Tue, 22 Jun 2021 20:26:14 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 20:31:23 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 20:31:22 +0800
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
To: Andrew Jones <drjones@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com> <20210622114634.crjqusw6x6oj4j6v@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
Date: Tue, 22 Jun 2021 20:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210622114634.crjqusw6x6oj4j6v@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1V5kOOgwFp1X



On 2021/6/22 19:46, Andrew Jones wrote:
> On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
>> On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
>>> Hi,
>>>
>>> This is v4 of the series [1] that I posted to introduce support for
>>> generating cpu topology descriptions to guest. Comments are welcome!
>>>
>>> Description:
>>> Once the view of an accurate virtual cpu topology is provided to guest,
>>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>>> e.g., the scheduling performance improvement. See Dario Faggioli's
>>> research and the related performance tests in [2] for reference. So here
>>> we go, this patch series introduces cpu topology support for ARM platform.
>>>
>>> In this series, instead of quietly enforcing the support for the latest
>>> machine type, a new parameter "expose=on|off" in -smp command line is
>>> introduced to leave QEMU users a choice to decide whether to enable the
>>> feature or not. This will allow the feature to work on different machine
>>> types and also ideally compat with already in-use -smp command lines.
>>> Also we make much stricter requirement for the topology configuration
>>> with "expose=on".
>> Seeing this 'expose=on' parameter feels to me like we're adding a
>> "make-it-work=yes" parameter. IMHO this is just something that should
>> be done by default for the current machine type version and beyond.
>> I don't see the need for a parameter to turnthis on, especially since
>> it is being made architecture specific.
>>
> I agree.
>
> Yanan, we never discussed an "expose" parameter in the previous versions
> of this series. We discussed a "strict" parameter though, which would
> allow existing command lines to "work" using assumptions of what the user
> meant and strict=on users to get what they mean or an error saying that
> they asked for something that won't work or would require unreasonable
> assumptions. Why was this changed to an "expose" parameter?
Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 
[1] of this series.
[1] 
https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/

And in the discussion, we hoped things would work like below with 
"strict" parameter:
Users who want to describe cpu topology should provide cmdline like

-smp strict=on,cpus=4,sockets=2,cores=2,threads=1

and in this case we require an more accurate -smp configuration and
then generate the cpu topology description through ACPI/DT.

While without a strict description, no cpu topology description would
be generated, so they get nothing through ACPI/DT.

It seems to me that the "strict" parameter actually serves as a knob to
turn on/off the exposure of topology, and this is the reason I changed
the name.

Thanks,
Yanan
.
> Thanks,
> drew
>
> .

