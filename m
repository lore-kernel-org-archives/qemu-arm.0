Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp81937lfi;
        Mon, 18 Nov 2019 06:05:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxW4Y7tWAI7S9fGrkVZFQvbnvFnvTPu/vgJRs3WwRygkaqSC89BhuysqOVISgHtofP3S2Za
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr20511207ljb.22.1574085937658;
        Mon, 18 Nov 2019 06:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574085937; cv=none;
        d=google.com; s=arc-20160816;
        b=vkVIh+vYGnRYmuvbsgpAn1MGyd8FFqd03tU5u5PjwRes1C3Ze85KRbVeOrVQYp7fX0
         ZSBxfyPn+mafOSJXIzMV0t6yOZKKyW5p6lqRzce8Bz7U/JNvq1LnBx4OscC6ysaLvvwA
         BnDqWciH543Botvn/UoeaA8O/l0DdXEMxttwBuW79RmNaahyxGjAc1KHvBW+BoK8a6Pm
         0ujM/u/jfO5fs5q+6g3avzDJHyy1T9R3QKWpk3/66LS1i+M/wtKUtgPA6pCoss4OmleL
         EWshmqr97vEvsTqvBq25bJ4ggpBx6afiGxTEO89A9JeDeJRjIBc4LJLH1PUeaHHRvocL
         sjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=NiBEpvauD0Ug1YeDqZF/8YwUXtPzyqOEkkVo9AknnTQ=;
        b=RpJvMWszWF4F5lxoY3WvzMSAHPSW+gV5KhzEZviDX6Tcx2f0SI7v8oNcBnOrZkdlc5
         Li2zKv4h6BGW0XX7OGQtiliZmIxABgIRiE+P4Gucf+ZH8EY8TfTkZpfhVd0Mmt2xALks
         fUGfVKbheMC1bkBp8d+DJYCSK8H7MtWAOSjmkCCO/Qc9w2gFS+SXQ3QjT5Zmlms7ilWW
         sTPGx4yQBKEem4HCT0WcZ0EU5t9XqpBhjmzz6F+Zn2c7TrjSggbnSuD1SrFKjnHa/14i
         DlBf+JlgJVff3hKKmn6DqnjDVT1aJGeLGn/40w1rPXcvER18NuyUhdWO40QnAt9kmkUW
         QNyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23si15187495eda.167.2019.11.18.06.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWheq-0002v3-I7
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iWheT-0002sg-2m
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iWheN-00062B-S9
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:05:12 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:42916 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iWheN-0005xl-F3; Mon, 18 Nov 2019 09:05:07 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 797483DE5C60F08CB2BF;
 Mon, 18 Nov 2019 22:05:01 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 22:04:54 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
 <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <be5d5996-0329-a34f-7528-503b98b112a4@huawei.com>
Date: Mon, 18 Nov 2019 22:04:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WBpioxUEAnGW

Thanks a lot. Please take your time.

HG


On 2019/11/18 21:35, Peter Maydell wrote:
> On Mon, 18 Nov 2019 at 06:55, Guoheyi <guoheyi@huawei.com> wrote:
>> Hi Peter,
>>
>> Could you spare some time to review the framework and provide comments
>> and advice?
> This patchset is on my to-review list but there are also
> a lot of others on that list...
>
> thanks
> -- PMM
>
> .
>


