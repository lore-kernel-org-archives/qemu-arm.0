Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3670704lfv;
        Tue, 2 Nov 2021 10:02:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTk9x27x1tOYbM9xp6ghbjIEp2J8MfmBNsk3ViWRACeIC7C5Zk8sfMO810srqm30CdW2NX
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr5932478oil.101.1635872524665;
        Tue, 02 Nov 2021 10:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635872524; cv=none;
        d=google.com; s=arc-20160816;
        b=zoDNIoDZWDynSeiG4XiyesAOvjjwb/ChOEco2Lxu2NsYq6Ab3V0bufCr7NtuWgA7Ww
         xCX6f0vGx+63nHHwlFExCDNjwhgZIztlVOanxVDiQkiH3d/TqAzR3DouybADGajX4xUM
         HojvSSRKkadw6FicBxNOzDO5Pgvj9cuuxAwcvmvwY/RmfogRCb7KMTLEjhEKD6gahS+e
         ZmLZamkvna22/TcchoIs9P2IJK8njmqBdRWd/pKyz14SED59aDzgfdnaarji6rsVDU41
         7yxZPvVMmBcU4sohbN19uudR+bxLIkSv/AcMlIwPCewF2jP1i4NONWUpcXCNNn1yg8wI
         tecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=D4emukhoCN+Enh8/AnrFEhe4PDpKje06oPNISKIUfq4=;
        b=ow0WxVXZ/mgMQH7OeCZ/O/L1rwXS3rWz78uQqN+FhxgTYQ1wg6dxAJ6d/HjtTTFDwV
         zAjzocvZGeNtsEP9Y7RYO9JkachtkHt9k8+5GfeGzIoIOd8tcZl73WwrqjX/0Sbi1aAD
         JcudGm1OHdUMb/nTB/8Wx61YD9h4YdrdbgW+YtPOrYZbJc6z4I4QEDRa+b4w3jsMhnBp
         71Vm5BZfMnRjQvFwoGK53Xkoe4U+AC6awwqf7TyOFCRjEo+/+Vec9kE6nV+CUIzXIFMz
         uRmnXCdeUe4S1SOlLSGCzFCs3D9KVeK/WuOxGcFOo7uikC+nJl7Sfe917hjwRygV7tSZ
         MZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si8005434otq.244.2021.11.02.10.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 10:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhxAi-0005qL-0i
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mhwrg-0001cf-Os; Tue, 02 Nov 2021 12:42:24 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:33043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mhwre-0003hC-N1; Tue, 02 Nov 2021 12:42:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4559FC8D0B8E;
 Tue,  2 Nov 2021 17:42:18 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 2 Nov
 2021 17:42:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00112361067-4083-4f14-9435-dcced5980dc6,
 B20104FC050451C2D6F35AC557110BE97BB9458B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <e60b830f-aaf5-a465-c85f-17aee56bb1d0@kaod.org>
Date: Tue, 2 Nov 2021 17:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MAINTAINERS: Change status to Odd Fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211101183146.684471-1-clg@kaod.org>
 <CAFEAcA__8Rmrie2FSf+WOs987wZf4pa8rC5JXuyMA3WBQVe=Bw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA__8Rmrie2FSf+WOs987wZf4pa8rC5JXuyMA3WBQVe=Bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 52ad7b89-dd24-48eb-b708-7daacbeb756b
X-Ovh-Tracer-Id: 7667941318011882403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0h0jGGKWWQrU

On 11/2/21 17:18, Peter Maydell wrote:
> On Mon, 1 Nov 2021 at 18:31, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> I haven't done any Aspeed development for a couple of years now and
>> maintaining the Aspeed QEMU machines has been a side project since.
>> I don't have time anymore.
> 
> Thanks for the work you've done on this over the years.
> 
> I guess this means I should start picking up aspeed-related
> patches into the target-arm queue again ?

Yes. I think that's better. Unless someone volunteers.

> Are there any currently on-list aspeed patches that I
> should put into my to-review queue, or are we up to date
> at the moment?

My last PR for 6.2 should have captured them all.

I kept the FMC WDT2 patches in my aspeed-6.2 branch because I had
information from Aspeed on their logic and my modelling is wrong.
Other patches are not ready for upstream, eMMC for instance.

Thanks,

C.

