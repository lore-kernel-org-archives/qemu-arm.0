Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5491041lfy;
        Mon, 10 Aug 2020 11:16:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrRe2kgOqdt4pTlv+DNTyrKMDKPMIU++Pawqt6BYBokrm8C8TIazFkO3rnDmgBFeA9i5QG
X-Received: by 2002:a25:d102:: with SMTP id i2mr43870906ybg.398.1597083408720;
        Mon, 10 Aug 2020 11:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597083408; cv=none;
        d=google.com; s=arc-20160816;
        b=qOJC/qacFMYnbQL0KBHxCPX81DqIqcXHT+HiVgNpU0L+UdJ0vz8ZoDjMHVSwwExkin
         /wTsyAAJbCtXCjAqkC38a4PM6NM7HW6YfcIDClmbfNMDmP34wHuYIKs0SZdtABs8Wvb7
         QhlxllJQTEF5s5xEM8RG2RWnv8Qcml7D8KOodzTH+bezbmoDPjiscf7uvs8uGNUZO6Kg
         ozFyXEEiywGvIoaZBBobGDoJncqvBVGc4/GO2yj5010TOfjfed+bxt5ohaW2LI+MhaSY
         JgvO4wnFodXmgzATBtxB3O30rZzcnyZGSscZFdftTlH3XkuzJcD73jMyzR/oyKKWdDG9
         u+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=cI9SKwD+5g3syt/TS+e8QgukSE8rUhSpt0LMGErUhAc=;
        b=eSufCHJLmij1SKOV07O3cT6LovoyBC7ZK5mze80Il9418pQ2II7d0grt6QFJLxxNeW
         FiTXkhNEtDPlQ50jrZYdnpYECTpNoskB0o3fEuVDfDLW4rHMYmXQWp/VxR3MVcosHMDB
         6SrbvYThT20aIWQtog2B2LBzC53IEN0/MQ/cIot0XlnQXaPk/QFiafJW11zNcaExTGp6
         dCBJwXMY5/v+sjQ2I7GtjiNpOP6Po/eFEq/URm0GhqV1QAMNsI7jwm4mAkgcMSYv5FvK
         XYjsV2lFJtG0HA2JJIZGl3z9qM9+fOBImsoRQ+xc1tOvbRqMAHOcoAwMkuS2zBkWvSNq
         j8tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a143si15747524ybg.289.2020.08.10.11.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 11:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5CLo-00023Y-2M
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 14:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k5BPw-0002N5-EZ; Mon, 10 Aug 2020 13:17:03 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k5BPs-0003qO-Vz; Mon, 10 Aug 2020 13:16:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0DA514F1EE1B;
 Mon, 10 Aug 2020 19:16:52 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 10 Aug
 2020 19:16:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0042267ea21-cd4a-464b-b59f-e1945aa7b541,
 EF638D8D103391F16F38E39CF07A17906BAD491E) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-5.2 08/19] aspeed/sdhci: Fix reset sequence
To: Joel Stanley <joel@jms.id.au>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-9-clg@kaod.org>
 <CACPK8Xcy-OzbQ4oiLaq96VzROSsmnmSAa0dytRcCVp2ot+mQnw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ed71987-6247-2098-4e48-9c5d59a74353@kaod.org>
Date: Mon, 10 Aug 2020 19:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcy-OzbQ4oiLaq96VzROSsmnmSAa0dytRcCVp2ot+mQnw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 520d3da4-3c70-4563-bd7a-c8a84d46aa21
X-Ovh-Tracer-Id: 9296555531368696614
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkeekgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 13:16:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Eddie James <eajames@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dqf/kwWjc/Lh

On 8/7/20 1:42 AM, Joel Stanley wrote:
> On Thu, 6 Aug 2020 at 13:21, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> BIT(0) of the ASPEED_SDHCI_INFO register is set by SW and polled until
>> the bit is cleared by HW. Add definitions for the default value of
>> this register and fix the reset sequence by clearing the RESET bit.
> 
> This is mentioned in the datasheet but I couldn't find if software
> depends on the behaviour. Were you just trying to make the model more
> accurate?
> 
>>  #define ASPEED_SDHCI_INFO            0x00
>> -#define  ASPEED_SDHCI_INFO_RESET     0x00030000
>> +#define  ASPEED_SDHCI_INFO_SLOT1     (1 << 17)
>> +#define  ASPEED_SDHCI_INFO_SLOT0     (1 << 16)
>> +#define  ASPEED_SDHCI_INFO_RESET     (1 << 0)
>>  #define ASPEED_SDHCI_DEBOUNCE        0x04
>>  #define  ASPEED_SDHCI_DEBOUNCE_RESET 0x00000005
>>  #define ASPEED_SDHCI_BUS             0x08
>> @@ -67,6 +69,9 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
>>      AspeedSDHCIState *sdhci = opaque;
>>
>>      switch (addr) {
>> +    case ASPEED_SDHCI_INFO:
>> +        sdhci->regs[TO_REG(addr)] = (uint32_t)val & ~ASPEED_SDHCI_INFO_RESET;
> 
> I think bits 24 and 25 should be writable too?
> 
>         sdhci->regs[TO_REG(addr)] = (uint32_t)val &
> ~(ASPEED_SDHCI_INFO_RESET | ASPEED_SDHCI_INFO_SLOT10 |
> ASPEED_SDHCI_INFO_SLOT1);
> 
>> +
>>      case ASPEED_SDHCI_SDIO_140:
>>          sdhci->slots[0].capareg = (uint64_t)(uint32_t)val;
>>          break;
>> @@ -155,7 +160,8 @@ static void aspeed_sdhci_reset(DeviceState *dev)
>>      AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
>>
>>      memset(sdhci->regs, 0, ASPEED_SDHCI_REG_SIZE);
>> -    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] = ASPEED_SDHCI_INFO_RESET;
>> +    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] =
>> +        ASPEED_SDHCI_INFO_SLOT1 | ASPEED_SDHCI_INFO_SLOT0;
> 
> If we want to be super strict this is true for the "sd" devices, but
> the "emmc" device in the ast2600 only sets slot0. I don't think this
> distinction is important to model though.

Both slots seems to be activated on all three SoCs. Am I looking at the 
wrong controller ? 

Thanks,

C. 
 
> 
>>      sdhci->regs[TO_REG(ASPEED_SDHCI_DEBOUNCE)] = ASPEED_SDHCI_DEBOUNCE_RESET;
>>  }
>>
>> --
>> 2.25.4
>>

