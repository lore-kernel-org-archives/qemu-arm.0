Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp705029lfg;
        Wed, 17 Mar 2021 12:27:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDbQwUN69R5wmv7s9YrJl5tIBqpq8T97LjDIapDoe7UEk5ax6KkYONvOta4ETbF51P/1xE
X-Received: by 2002:a25:2983:: with SMTP id p125mr2724661ybp.369.1616009248568;
        Wed, 17 Mar 2021 12:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616009248; cv=none;
        d=google.com; s=arc-20160816;
        b=Itp8MJHYWVwQ3/H3tupJM4M4syO/CTIjTG2zrkObNKM/rpb5gca9bE6pHOS/I8bNkv
         fiANxfz/HPmWY/WBm+Q+gsNAMgUC7COV929mCQbvEqtHeyAQYO+QnfBxFPczWP3q8PJu
         ord1gPXJZc+ifnUSxY/1kLF6lxKElhsqA42u892vcgZ4sKBfkHjQZ2dUmN1QkMQwXcIw
         9F6HG4JMiiRmro+S/c3difeXsQT74Clndz5ZEoTBVCB1SkWIdS6qA7KCiTRF8zpw1apU
         6d6TN2nNHZc2Ttj0ZTDSdodXTbLGwMa3WAsJIWrgKWcA1p1eK2lVbcUnYoss1KJOsZLQ
         IB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=IZDlGmMdtSlJeSG/FvND5amhflt7nCgF5a4Vjvj4gwc=;
        b=dhbSpMhFNBjmH/QPrDWp7OgNwhTYeFYo0gYH0pCbaFAZ1qQcp3+hZvv1nu7+ojHOw8
         c19Qrk/FZoViezdt2syR+u0W2Q63H7wnau7iDG/2vvKioxRSeuastKlemHqUaHYTUYzf
         uYH71Gfsv2nXEhSQqtgH3x3E6e6cR9M/Yv3lvGJrfXJyuiaukE6LofR3lZYShofD9ths
         t/QELXGtdOLr5LE8EaNl/cNIgIr0KXQobcVr32t5IBSAsUM4WIsUbjuZPQZ2Dr29Ys5l
         V6QqcDQwh4Esvq6FuS1c5RmANteZQeORdFuQ0UGNqq5VxsusGEryl5wLKdyIkUpGJb9q
         vs4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b79si21811149ybg.251.2021.03.17.12.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 12:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMbpH-0004GB-WF
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 15:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMbRy-0005hl-UY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:03:24 -0400
Received: from 5.mo51.mail-out.ovh.net ([188.165.49.213]:44396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMbRs-0004g5-Mw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:03:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id A57B2274A32;
 Wed, 17 Mar 2021 20:03:13 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 20:03:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052b3110f7-87aa-47c3-a1b4-d3208367bcb4,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
 <871fce3d-8b3c-bcce-6170-9010b1ed7d5c@kaod.org>
 <38ba72b0-ca80-11e9-3933-1da563748a83@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fca7093f-ac77-e72a-edce-fa93f774a571@kaod.org>
Date: Wed, 17 Mar 2021 20:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <38ba72b0-ca80-11e9-3933-1da563748a83@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 349db3b3-fdc6-4687-bf9f-2e102ae769a9
X-Ovh-Tracer-Id: 5940529386346089403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnDOGluTouuC

On 3/17/21 8:00 PM, Philippe Mathieu-Daudé wrote:
> On 3/17/21 7:30 PM, Cédric Le Goater wrote:
>> On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
>>> The flash mmio region is exposed as an AddressSpace.
>>> AddressSpaces must not be sysbus-mapped, therefore map
>>> the region using an alias.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> That does the trick but you need an extra change in the model. 
>>
>> The fixes are in my aspeed-6.0 branch on GH and they survive the last
>> patch of your series :
>>
>>   [PATCH 5/5] memory: Make sure root MR won't be added as subregion
> 
> I wondered about changing DMA_FLASH_ADDR() wasn't sure the tests
> would use the flash.

The acceptance tests (not merged yet) download firmware images
in which u-boot does DMA accesses to calibrate the reads on the
flash device. 

C.
  
> 
>> I will upstream for 6.1.
> 
> Thanks!
> 
> Phil.
> 

