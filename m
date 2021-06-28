Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3893248lfg;
        Mon, 28 Jun 2021 04:14:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbVVuXMT4ZmdMIo2Y5dclV7AZSKlHVohsBIvzBG7eJfH36RepT5841Du0pFyG05sTV+k45
X-Received: by 2002:a25:580a:: with SMTP id m10mr31051907ybb.127.1624878863605;
        Mon, 28 Jun 2021 04:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624878863; cv=none;
        d=google.com; s=arc-20160816;
        b=YC5aWNCGELqVfXAjY94vmzk6pg60v7I2dn4iv92PyT2FrXYvDajlSPOpIwfML8nm3p
         pAqLC5rhuj+NuifT6RoM6VwIiQfgpVM4nUshKCnvweWQLsSoTaTER2bfecpJHE9oNDYU
         vya8tLXLvb2BASl+gz0jhPNeLu5GgdZWzxu5rDafhFrT1qeJI0eyj5kSN56D5k1fQoqG
         6KprU2p8NSltnq7PjCdlCsA6N+FW/1bMhf+TERWaeX39niBu1btg5z7GPie8IvzOY2S/
         sE+gBxsxq63w83BF5sYLrIZEGUtA+t7H0cAjopu1WkF9NszpUGDfsUW/a0E1lUXl3t3R
         4lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=eK39obCURo4SsvEJepV79TLQgO4PAETQ6K246H9EdwU=;
        b=RrEmtADfkqSY2gOKJUsrCcexBpWT9eeBgwnRaYNkpYJzgq2VzMdxyMamTsAr7P+tS0
         bWMOhnovi6jrPyYjWVG5R4B09ID2LtSQFzFuNryUwLjDw0V0Nj/jrMZGYU+GeXcqDvKi
         Q1dtgjqhr9qCTXx/i/y7kaTgFwaGmPmexIaVf4tRAu9N3lRLug5WXebTOPwiwi4CpdeV
         jj0nqYRPEr7i9uO+BO57UiZtJYk/WQ6x3JorJQ+M0UUIoXwxeTCociSl0kK4OaTgnDTa
         6V0onNCSlVVQyvz+RiOdesIr8VXCxkwmD1oDwMy8HI8OMRJ6rDnYO1GrLRqCnbgqJ+qq
         tSfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si14155255ybu.424.2021.06.28.04.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 04:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxpDa-0006dN-Vx
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 07:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxpDT-0006dA-9b; Mon, 28 Jun 2021 07:14:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxpDQ-0000q4-NQ; Mon, 28 Jun 2021 07:14:15 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GD4fV4TrpzZkFh;
 Mon, 28 Jun 2021 19:10:58 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 19:14:03 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 19:14:02 +0800
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com> <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <CAFEAcA9X9fYAFAux4h2n00kYpTgxkNcJg6Ako7s6ndU4KWTJyQ@mail.gmail.com>
 <YNHzqHMkfSWCHA3i@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <909af1cb-7e7b-7532-06b5-69cd9487e001@huawei.com>
Date: Mon, 28 Jun 2021 19:14:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YNHzqHMkfSWCHA3i@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DTsPuSjDGJuR

Hi Daniel,

On 2021/6/22 22:28, Daniel P. Berrangé wrote:
> On Tue, Jun 22, 2021 at 03:15:18PM +0100, Peter Maydell wrote:
>> On Tue, 22 Jun 2021 at 15:11, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> The QEMU man page says this explicitly
>>>
>>>                   For the PC target, the number of cores per die, the
>>>      number of threads per cores, the number of dies per packages and the
>>>      total number of sockets can be specified. Missing values will be
>>>      computed. If any on the three values is given, the total number of
>>>      CPUs n can be omitted.
>> Anybody feel like submitting a patch to fix the typo? Should read
>> "If any of"...
> Actually looking at the broader text for -smp, the whole thing just needs
> to be rewritten from scratch IMHO. I'll send a patch....
Do you have any plan to rewrite the -smp text in qemu-options.hx recently?

I suggest that we explain in more detail how the missing values will
be computed, so that qemu users can have a clear image of what a
-smp parameter collection would be parsed out if they are using an
incomplete cmdline and have read the man page.

Also if we all agree to prefer cores over sockets for all arches since
machine type 6.2, I'll be glad to add this change for the man page
and update the parsing helpers in next version of this patch series.

Thanks,
Yanan
.

