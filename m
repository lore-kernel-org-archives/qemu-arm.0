Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp557628lfp;
        Tue, 14 Sep 2021 03:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyubXRpWs2ss/YyncU0x1vFf1ccS9r8u22yFFUdunkX/BWBf6EhqzvW68MWQI+lrJanvhuL
X-Received: by 2002:a02:ca0b:: with SMTP id i11mr14086320jak.84.1631617116092;
        Tue, 14 Sep 2021 03:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631617116; cv=none;
        d=google.com; s=arc-20160816;
        b=vDKmiVIBnYXote+wkN/VWnWdlfCar698ddlvAJNa2iwW+ShBZvF2qDjLy64Bohi87n
         ZMnjoWfuTiy6IyIUu5XKgFrmBP0oQkIdll42/1u7fTzpHj7IHCrVks1kdsJ6DmShLyRB
         VzfI3PgVRQnfK3NLYKnASIrWEDWkBAGcFj3pxqdu2fQKKLbxUdms7iI7dFSMUYcFeypi
         JKYqmxZyCaPrs0KvsalZdEwa/Z7YHIorRdSbYO1v9ZCtcfK6e8y0EQvnoHiyMu4qU0Bb
         cVJnHZIwHEOVKikqz1Lkjf5wjODh+Xq17I0081DMEJT38cNG2R3Q7+0BWo+TCmfMmRmR
         0fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=EcuL3sdwUXcaICxvHc/pwLY+01VRYg5cGNJBeoNiTMg=;
        b=iPBcLc1tIzMDVDQcJu5FKTX2hRelKi/L5eHSS9EymqQhhL6mivOpTU/mGFoaKm948W
         cxEd0X3tsSFEiaM+oBGq5hhudv6G2cJfQxQuyhkx83ysEZCidBiJgqhCKlHq7tj5JHL3
         NJKundNzd8xBY5dYoJ7OUeqzptwfwcWtbtzV5VN4SAkQE8jpnBtJ9AnaN7JxvnplJkFl
         dzLS8DSzhufXGBbd7H99HpMXdjMw4LapDBtnUUGjScOLRjV1HxFf2qBiU28HBg7q3miu
         Gs/m8uoWuupiB6055Oxw7swhMWWbUMKDWiyal/m9GMgGKMvKWCYowiNS/PzhvgxDEjBu
         Qmqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si3941349jae.36.2021.09.14.03.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 03:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ695-0005qe-EP
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 06:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ68u-0005lr-3u
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:58:24 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:57537
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ68s-0005P3-AL
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:58:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 3AF2813B160;
 Tue, 14 Sep 2021 10:58:19 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 14 Sep
 2021 12:58:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0039650c354-146e-4964-8c5e-31bc637141b8,
 2B4DCE8296B83A4DEFDF4253AFCCF2A4AB0DDD95) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/14] aspeed queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913161304.3805652-1-clg@kaod.org>
 <CAFEAcA9CJekxghvjOpoweVNX6ebKz9yP27tP8OVsiR49T4XSHw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <22ba830c-47b2-a2b6-089f-3844acba7a4f@kaod.org>
Date: Tue, 14 Sep 2021 12:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CJekxghvjOpoweVNX6ebKz9yP27tP8OVsiR49T4XSHw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c8018112-66fa-4ea2-a11d-e70bf4531d3c
X-Ovh-Tracer-Id: 9244201186892942243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zilIHIAgxDG+

On 9/14/21 12:51 PM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 17:13, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:
>>
>>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210913
>>
>> for you to fetch changes up to d7add12e20fa8982f5932ff4dca317c5d2dfe7d9:
>>
>>   hw/arm/aspeed: Add Fuji machine type (2021-09-13 15:19:20 +0200)
>>
>> ----------------------------------------------------------------
>> Aspeed patches :
>>
>> * MAC enablement fixes (Guenter)
>> * Watchdog  and pca9552 fixes (Andrew)
>> * GPIO fixes (Joel)
>> * AST2600A3 SoC and DPS310 models (Joel)
>> * New Fuji BMC machine (Peter)
> 
> Hi; this fails 'make check' on 32-bit hosts:
> 
> qemu-system-aarch64: at most 2047 MB RAM can be simulated
> Broken pipe
> ERROR qtest-aarch64/qom-test - too few tests run (expected 83, got 31)
> 
> I suspect the new machine type has a default of more than 2GB
> of RAM, which won't work on 32 bit systems.

ok. I guess we need to change the Fuji.

Thanks,

C. 

