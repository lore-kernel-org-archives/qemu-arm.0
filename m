Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp989142ejc;
        Thu, 26 Jan 2023 23:43:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9mL2I/gimRPXVUBN9wBoOSfkT3jDzYX5kJ3tLgGOghFU85h+W9moGr4UIpmEerMQMoqMml
X-Received: by 2002:a05:622a:14e:b0:3b4:d5be:a2e0 with SMTP id v14-20020a05622a014e00b003b4d5bea2e0mr16810967qtw.20.1674805389526;
        Thu, 26 Jan 2023 23:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674805389; cv=none;
        d=google.com; s=arc-20160816;
        b=W3oQVpeZ3gkFHj2oZZ9k83zNnJmvV+KrVxQC92rq3YchUVaxtbHxFmqn8mhdl5009c
         JSTWuL0q7ay62IUvW9M6R51OJ1jb8Scy3PYrSuYJapVSGbnuSR8ZzSQMnn1mXuYp2IDH
         CR4xspja2vVz2RuAqEToE/VkyFQPj10rTsmPd3wU+fEmdTRVrGG/Pt5NdTucf9/Yol5C
         CyIbcZrAF9APYNem0tXD1kTHOUw7vAGExbLu3oJpGqkJS2BRacyOTUfTzOqTVeM2yPim
         RFAMgWaxcRabDIm+4c/acYzs188+SDe+JflWA653/Cjbm9VSgY4BPxldEf9Tvo7r57pe
         6a0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=gJRacnEKcoZQbvD1OStN9uuKZKNpea2nbfExD8S+5CQ=;
        b=jd3/b9f7wA0QntKc8zCQj9bMFbO9EovIM/QeLJgZPlnyjFbRTHeHnhoc56pqrmZ8Zi
         RivOozd66oCkZaK7hNk0i3Smw5BjSlzThjJD+fPLC7GKu0SFLonC9MAwP42udTPBbRtm
         A893Wzl7wU7gGiTE7UASQCEKO3kc+7+qEx2GSZ+COTu8lfSCd5dZC9/WxLMvQaXeruxF
         icwoWa/f3oMN4gw+iCDz4uDPjT0FIuN9Ai5+YB32p+MxdJuAyVGgqfEMNSCmgYsSpYGF
         G9WIqBdJX24wywRlW19Z1GMUU0k3NlrEbVzFVfG+MzV0kGWZjzdlW2M+61dyVUdePmIM
         BRQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05620a12af00b0070653a79378si2327821qki.720.2023.01.26.23.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 23:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLJNx-00050a-Py; Fri, 27 Jan 2023 02:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pLJNw-0004zs-2p
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 02:42:56 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pLJNu-0006TM-DK
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 02:42:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A2CE62BD67;
 Fri, 27 Jan 2023 07:42:41 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 27 Jan
 2023 08:42:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0047d354e0b-cbc2-44da-acf1-2bb7daf51f6f,
 4F8A7C4722844CB30BAFF044D0CF817181D4FB1A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b10fb5c2-5d3c-e4c0-431c-0842f0b00bb8@kaod.org>
Date: Fri, 27 Jan 2023 08:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, Corey Minyard <minyard@acm.org>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <hskinnemoen@google.com>, <kfting@nuvoton.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <philmd@linaro.org>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev> <Y9Gg15hBJ/aQgd3e@minyard.net>
 <Y9Gn5iLM87MKycMn@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y9Gn5iLM87MKycMn@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5ed96d96-79d5-40a8-89bb-ae9ade2475f1
X-Ovh-Tracer-Id: 9255178710007188402
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddvhedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhmihhnhigrrhgusegrtghmrdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinh
 grrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +ta9q2DG9771

   
>>>   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
>>>   {
>>> -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
>>> -    DeviceState *dev = DEVICE(i2c_dev);
>>> +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
>>> +}
>>> +
>>> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
>>> +                                const uint8_t *init_rom, uint32_t init_rom_size)
>>> +{
>>> +    EEPROMState *s;
>>> +
>>> +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
>>> +
>>> +    qdev_prop_set_uint8(DEVICE(s), "address", address);
>>
>> Why did you switch from using i2c_slave_new()?  Using it is more
>> documentation and future-proofing than convenience.
> 
> Oh, yeah that's my bad. I was probably doing it so that all the qdev_prop_set
> calls to the object are in the same place, but I probably should have just kept
> i2c_slave_new() and initialized only the at24c-eeprom properties here, instead
> of initializing the I2CSlave ones too.

Will you send a v5 ?

Thanks,

C.
