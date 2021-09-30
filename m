Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp932335lfp;
        Wed, 29 Sep 2021 18:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgR344HWzTGlk4oGajezNmdlrNIEAQW/2ZYP7VOrAu6Au/gpZic+KDWGU7o4pCODFq3zj+
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2729767wmj.40.1632963756200;
        Wed, 29 Sep 2021 18:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632963756; cv=none;
        d=google.com; s=arc-20160816;
        b=LHoWaCQZ/fKF3CgvI9f3byPyVyYFsBykixddjFnvVwJvG4NiKI0AYjG6Q7/81ki6D7
         GiJbZId54EsjwXWx08YA1B6TvXLFGOYxJhXDwjsj6wjoH3U85OpLxSd7I3Qw8Y7PMQVR
         4q9/Yi5zNponkpwjvuFGMR+g92oZKZWxT7EFWfxeTseUE7heZI7wtEW2NRdjyMWvFupp
         awlopzI2GU9nLxOiI0uP2agXD0Hh7dDA2LAMq2pHLR09Q98dbZftay29f+QuTxAku8lX
         eee2M+QaCEBSyxz14045bZVS3AGSfgs2EyxA4kliwGqWvOT+qMJIsF+Vff1EMreZMVpe
         SwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=qufw16eTNJnO7GLcddr6rqDIEqzVGRSb4e6cj7E91Vo=;
        b=UtmH6usNPQKYLGul3CEjWnVzeC8rdIkzBj5TO6Cr7bWuzkHnK5xFTTmOotfR3SNq1w
         P4XvrJ/bbrtIcoDefTc9gnYxRdMoCdLI3eXq7Fp2JXIQWF8gQ1b1WtFfeF7PP/5DRoY0
         OM4rnyeN9Y1PISo7cgZT+S4BQlMN8jaEx6D6N1Y/NqqOD2xD+2cnOIrR0kKW4893mqiE
         wBmkaDQ/GoMxRn7ltTlfaJiXYlTRSmXxlvXWYczTOLubWyYO6AefD7s+azt/0aCnkb4X
         Z6DrXuZxAlOxc+SjcJOH6am3U3XgLfQrVKNvTIX+LQPiH4vYTYb3tgC9cqnht3qaO0Wy
         yXTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si1908402wmq.7.2021.09.29.18.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 18:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVkT5-0006bD-D2
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 21:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVkSl-0006ak-3B; Wed, 29 Sep 2021 21:02:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVkSi-0001Fl-3V; Wed, 29 Sep 2021 21:02:14 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HKZg03wR6zWXw5;
 Thu, 30 Sep 2021 09:00:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 30 Sep 2021 09:02:04 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 30 Sep 2021 09:02:02 +0800
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
 <87sfxntp5x.fsf@dusky.pond.sub.org>
 <f0df8f93-0214-58cd-4304-20afd2e150ec@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <46cebc00-9e64-9f32-3cf3-9e8edfec285a@huawei.com>
Date: Thu, 30 Sep 2021 09:02:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f0df8f93-0214-58cd-4304-20afd2e150ec@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPyDXtGAvaSl


On 2021/9/29 22:57, Paolo Bonzini wrote:
> On 29/09/21 16:46, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 29/09/21 04:58, Yanan Wang wrote:
>>>> Hi,
>>>> This is a new version (v12) with minor update suggested by Daniel
>>>> and Philippe. Two new commits (#1 and #16) are added. Thanks!
>>>
>>> Queued, thanks!
>>
>> Could you amend PATCH 16 to drop ERRP_GUARD() in machine_set_smp()?
>>
>>
>
> Sure.
>
>
Ah, sorry, I missed that one line. Thank you for fixing it locally.

Yanan
.

