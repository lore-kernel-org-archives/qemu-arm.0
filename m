Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4863410lff;
        Sat, 21 Dec 2019 04:36:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzjn/rDbtsoN7p7SPD0cUDrRLqtMk3uDrydAPGGJ3enUlMVsPGBluxDVuN3yCS47TKDh/41
X-Received: by 2002:aca:aa15:: with SMTP id t21mr5262977oie.177.1576931780461;
        Sat, 21 Dec 2019 04:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576931780; cv=none;
        d=google.com; s=arc-20160816;
        b=HneY5nB9AyrAj5eSVd7fivSG1VVDvk582N73rm8XTmUXBWdaKCZEu2Pu17m0vQRc5p
         QWvy2H3dRPSAf64A1Blx2RCrqqKlqN24WEWqz4/p/NHH5d3ZX6tAPGU1pKkHtoiyHBq2
         7uqKs9KXELigZ70PfcMdfYZxK4sx+Wtlht8wCXb/zjKXUQ/KAYPmwPB2FOgmkBzDEM6i
         Y39FlZjUyI/mx2ADplTJnq/bOohtBCx9RHfbOw67AG6WLl02y+KAgU+0Zh3+Njlumr16
         PUonb+zI5FF/nSkHW1QgR3DNoLn+GoPWqA7gUYSAebYacatHRrvOfhrRPCgC7FPMSdVY
         0Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TVGpgVsMjDmq16vaw4najvodwdC33SEMsgFjfDNmdiM=;
        b=aCvPurScPWQveXo0OvXWzkNB1F6GqrNhjxHWnRVsisJuD1Pe5hN3CV6O49uqgrEnns
         mJy+RRwLW7ijnIpvNKf2kiPM4Ma3mCITIYgqSgK3ZCcvfnsRWqVoU1i4b0zTzfHy8dqc
         f9blN92MEd4cXiCqVygsj4jHiQvxRUdh0lQfBG218Yz2cxQ9O1LofEbNhrZBE0ISbbGr
         j6t22aME7iWfvmD6nsdtoqaSCQFv2PTJcTasO6aA7W+T2dGdPMge9h+N6TMIoW31rMMO
         O/WYNCU7NOJGRO4Dde1+B7fcZn6ooeNwzUCeWmqBqXMa8c/ok4GwCfWs7r5czm69bK0U
         s1oA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h203si6281511oif.3.2019.12.21.04.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Dec 2019 04:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iidzX-0004t5-LJ
	for alex.bennee@linaro.org; Sat, 21 Dec 2019 07:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1iidzO-0004sy-Nj
 for qemu-arm@nongnu.org; Sat, 21 Dec 2019 07:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1iidzN-0000Wd-AC
 for qemu-arm@nongnu.org; Sat, 21 Dec 2019 07:36:10 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48738 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1iidzM-0007xw-Lu; Sat, 21 Dec 2019 07:36:09 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5BEC98C9039688F26A78;
 Sat, 21 Dec 2019 20:35:53 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sat, 21 Dec 2019
 20:35:46 +0800
Subject: Re: [RESEND PATCH v21 5/6] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To: Igor Mammedov <imammedo@redhat.com>, Xiang Zheng <zhengxiang9@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-6-zhengxiang9@huawei.com>
 <20191115173713.795e5f63@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <38f13f15-960d-3e56-78f5-42b1ec61a322@huawei.com>
Date: Sat, 21 Dec 2019 20:35:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191115173713.795e5f63@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, wanghaibin.wang@huawei.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, linuxarm@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, james.morse@arm.com, xuwei5@huawei.com,
 jonathan.cameron@huawei.com, pbonzini@redhat.com, lersek@redhat.com,
 rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCeSzHv49rMw



On 2019/11/16 0:37, Igor Mammedov wrote:
>> +
>> +        /* zero means OSPM does not acknowledge the error */
>> +        if (!read_ack_register) {
>> +            if (loop < 3) {
>> +                usleep(100 * 1000);
>> +                loop++;
>> +                goto retry;
> as minimum this loop can stall guest repeatedly for 0.3s if guest triggers BQL,
> until it handles error.

I think reparations for 0.3s is reasonable.
1. 0.3s is the worst case to repeat, if guest acknowledge it in before 0.3s, the guest can not stall
2. if the previous error is not acknowledged, the next error will be lost, error handling(safety) is more important than others.


>
> (not sure what to suggest here though)
> 
> (not sure what to suggest here though)
> 

