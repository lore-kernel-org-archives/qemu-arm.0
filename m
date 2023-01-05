Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp479055ejb;
        Thu, 5 Jan 2023 09:36:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupaXcyKK5heS9VvrFMymJzNr3ykeoASx+1f7rIjWJ8JMYoQk8VA0eEG7qUb/NncfQrLwnI
X-Received: by 2002:ac8:468f:0:b0:3a9:7568:fb92 with SMTP id g15-20020ac8468f000000b003a97568fb92mr71703168qto.50.1672940197080;
        Thu, 05 Jan 2023 09:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672940197; cv=none;
        d=google.com; s=arc-20160816;
        b=l7Wx/Z+6TQosI9N/02CmS0PPNKvE+z+dvBPVEWsU7uWbNEd5eUTdXNiTQp1cImlJwH
         Tf9EJMW4DFHubbt1X8tetu0EsA0YMRMteC2fTz4ArR0ufHt3kbbMhZx1MiK2CsRd/we7
         uaDSJkTgAHlYFIzC1d6Fa5tZOxrCEkLf/GwlcsEbQbM7snucAmWwvsru0T1YxWtlw6uz
         6EpIDZOVl9n1IyM9UqavNfbLcv8TFzy5arILJv3gw8hsGYHK+FGSAANftVTQ883xt9HU
         LTVd2x+j5k3oEBkc3qZbZq9W0uDJo1VDf4rxoXLQeqgrXN+O42K6c9f6CuPxWQAJHAOa
         zPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=loz5G0mKweAQkAM/NG2XncpxZKN3RWUnmLJO7UGacqU=;
        b=iMWF/3GaOouoI6ApiuYXaesd+/yWggCgUc9npaO2BF3eWojGOhNaP87CseIEfd/+Wj
         NLhWK5Et7Ic1MM4NixDoUuQwrOacrj3aVSxFKUJhshmy1/aoXDfBunBAqPIUXbh2/MQA
         Ve1vABDLx3ko/m+Z/NrZLnsioURbvfENUIxEpbnZXSAInMH5wJGdDKna3cICfkTbJTH1
         A41LU08+I3woWKoF8Zf/15LD5zy0EmbzWuk6Ua58fnXkg1HSjTuDEhXzo5RGXagnuXVO
         ylGd20lqvQOcIpuLgUD/zMsohQHV4/TADDYc1VyudRlyswqpWv/iPDIi0MP2btH7dQbq
         s/Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac84886000000b003a819e3c525si19627282qtq.338.2023.01.05.09.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 09:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDTjn-0001fu-Mu; Thu, 05 Jan 2023 12:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTjf-0001cp-9o
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 12:09:01 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTjc-00072w-IX
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 12:08:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0148B1512E47E;
 Thu,  5 Jan 2023 18:08:52 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 18:08:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d6536e9f-f428-473d-be39-9d4df627c58b,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0ad1b1d3-d67e-416c-bfc7-65909eb9a559@kaod.org>
Date: Thu, 5 Jan 2023 18:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Stephen Longfield <slongfield@google.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <venture@google.com>, <wuhaotsh@google.com>
References: <20221221183202.3788132-1-slongfield@google.com>
 <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
 <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
 <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: aaaa4fab-650e-415b-8232-23aebdbd41e9
X-Ovh-Tracer-Id: 298363477798062886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdfffeevuddthfdthfelvefhgfevffefuddvvdetteekgeffjedtjeevffffvddunecuffhomhgrihhnpehtrghrghgvthdqrghrmhdrnhgvgihtpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhslhhonhhgfhhivghlugesghhoohhglhgvrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpfihuhhgrohhtshhhsehgohhoghhlvgdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpe
 hsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
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
X-TUID: bBAQXzGs2o4J

On 1/5/23 17:50, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 16:46, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 1/5/23 16:33, Peter Maydell wrote:
>>> On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com> wrote:
>>>>
>>>> Size is used at lines 1088/1188 for the loop, which reads the last 4
>>>> bytes from the crc_ptr so it does need to get increased, however it
>>>> shouldn't be increased before the buffer is passed to CRC computation,
>>>> or the crc32 function will access uninitialized memory.
>>>>
>>>> This was pointed out to me by clg@kaod.org during the code review of
>>>> a similar patch to hw/net/ftgmac100.c
>>>>
>>>> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
>>>> Signed-off-by: Stephen Longfield <slongfield@google.com>
>>>> Reviewed-by: Patrick Venture <venture@google.com>
>>>
>>> Applied to target-arm.next, thanks.
>>
>> Did you take the ftgmac100 also ?
> 
> No, I missed that one (patches arriving over a holiday
> period are more likely to get lost). ftgmac100 is aspeed,
> can you remind me, are you handling those patches at the moment
> or would you rather I took it through target-arm.next ?

The flow is low. I can handle them.


Here is what I have gathered of interest for the 8.0 cycle [*] :

ba1f0f30e6 tests/avocado/machine_aspeed.py: Update SDK images
394467a569 tests/avocado/machine_aspeed.py: Add shutdown to the SDK tests
f2941822a5 tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board
beb01f33da hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
126f0870ff hw/arm/aspeed_ast10x0: Map HACE peripheral
4251463a5d hw/arm/aspeed_ast10x0: Map the secure SRAM
d8ab4e2235 hw/arm/aspeed_ast10x0: Map I3C peripheral
47ae570bcc hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
b361c08ed3 hw/misc/aspeed_hace: Do not crash if address_space_map() failed
68e35c6359 hw/arm/aspeed: Use the IEC binary prefix definitions
83008870c8 hw/watchdog/wdt_aspeed: Log unimplemented registers as UNIMP level
7bc127b231 hw/watchdog/wdt_aspeed: Extend MMIO range to cover more registers
6b2a6a8b67 hw/watchdog/wdt_aspeed: Rename MMIO region size as 'iosize'
186cd4db58 tests/avocado/machine_aspeed.py: Mask systemd services to speed up SDK boot
7e37fc7efa tests/avocado/machine_aspeed.py: update buildroot tests
0411291f96 m25p80: Add the is25wp256 SFPD table
5c6cd67647 avocado/boot_linux_console.py: Update ast2600 test
8d965c9276 hw/net: Fix read of uninitialized memory in imx_fec.
e4e4a89ea3 hw/net: Fix read of uninitialized memory in ftgmac100
6b0eef46c7 aspeed: Add Supermicro X11 SPI machine type
5386d8eec8 target/arm: Allow users to set the number of VFP registers
c83bd61b34 m25p80: Improve error when the backend file size does not match the device

Not all are ready or reviewed yet.

I also hope to get some cycles of Philippe to merge eMMC support in 8.0.

C.

[*] https://github.com/legoater/qemu/commits/aspeed-8.0


