Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp696885qvo;
        Wed, 1 Sep 2021 02:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS56h2K99q07sfqMzoCB52QQjZvaOTH0Ruillaohjl29Ov7hm28ZL+bjTUhdXaX3t0kRGL
X-Received: by 2002:a05:620a:1655:: with SMTP id c21mr7528831qko.187.1630488672878;
        Wed, 01 Sep 2021 02:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630488672; cv=none;
        d=google.com; s=arc-20160816;
        b=ziQIJmTOQlN6sN2sbQblGmC3T/q/6yyQMK8l1+iiM3xk9kzywGcUdwhFbBlRIuhyBj
         AEK3FGcHDnXjmfC8Bkaob1A1saih0tJanI5XaA71/qpMZf4dpgVc7hgVcPHfjsgbMymV
         B/0/sRcEDNLNqcSkMVY+I9IZuYxoLRjHm94KjhXUK1q+cCRJLMMMIiJJElYgyUMuwBP/
         9RLPbgEGzXaoNW9jHoNzxta9ZdtTgWtjN+bqkWocbIQYfJ8yMav+QCx+6AZ5fWIwUM+R
         i0aoLPa06yqjj61TeNpeTk/YQjXlUs0SbCIWBUj1hSg2KB0HmOMMDUtWhbxujVCbp5ts
         Hgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=n8dtP1rmhY05bbq6UO6DXfAoQOoGzrUdiHyXHg7KXnI=;
        b=T3UWRkYStjo4qjNv1bSVPrftLfLDHbxaHMc37F55d97xmhdwNiR3ou4LJlxbKTpswm
         fhxf66Xd7yG9qWGtnZp+ixUqwJrClNgFKJq+5j8EcHec9t2AJ/aj6nqma5ZiOeKT+Mn/
         AQwr9frw0FtLZMKKJMMFf1V2zSrqaSmrMGsk5B+Csm9QnD8Z9grE1bn1AFMsGMx4qP+a
         vBFkA5wLV0EvbDUG0eGdcc4k20me5lGozabEKS1xdBmQdX+Gd3GSy9BpJXc79/909+Mi
         31nN7LSpe2J+NqUdYUWz52KHcFDmyKFrbl8Hr9vA8AEgoAH6ajmHQGuRfO85hlBJcpIz
         R73g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si13639467qtj.181.2021.09.01.02.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 02:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLMaO-0006d5-Ci
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 05:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLMZP-00063N-R8; Wed, 01 Sep 2021 05:30:11 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLMZN-00073Y-9t; Wed, 01 Sep 2021 05:30:11 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GzzDy6GSHz8xCf;
 Wed,  1 Sep 2021 17:25:38 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 17:29:53 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 1 Sep 2021 17:29:52 +0800
Subject: Re: [PATCH 0/1] hw: Add compat machines for 6.2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210831015426.101188-1-wangyanan55@huawei.com>
 <CAFEAcA9_DC+5gtScF1EjyqBc+Z7p-4ZtKb8k93QwRoT2gZtqqA@mail.gmail.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f6666eb7-f69b-59ed-1bcd-65960c02ce28@huawei.com>
Date: Wed, 1 Sep 2021 17:29:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_DC+5gtScF1EjyqBc+Z7p-4ZtKb8k93QwRoT2gZtqqA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jhOmoEkfnO/M


On 2021/9/1 16:02, Peter Maydell wrote:
> On Tue, 31 Aug 2021 at 02:54, Yanan Wang <wangyanan55@huawei.com> wrote:
>> This patch adds 6.2 machine types for arm/i440fx/q35/s390x/spapr,
>> which is originally from [1]. Here resend it separately and hopefully
>> it can get into upstream first, so that some other patches currently
>> on the mail list which depend on 6.2 machine compat stuff can be
>> rebased on this.
> Thanks for resending this; I'm doing an arm pullreq today so I'll
> put it in with that.
>
Thanks!

Yanan
.

