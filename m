Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2808233lfm;
        Tue, 16 Jun 2020 10:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOUAYeIQ++WenKlArHAsY2JrfHXHhZdEqSpkifRpHAI11392qrV4qeUDGKzw6mwa5RNQ56
X-Received: by 2002:a25:7415:: with SMTP id p21mr5842550ybc.367.1592328064511;
        Tue, 16 Jun 2020 10:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592328064; cv=none;
        d=google.com; s=arc-20160816;
        b=jRIJEmVpyz4J/CXdrPwoaYoXACVy2+jOtcmd6C2LKbE5Afzr0gQsB8XMg39F/iTyCt
         HShZ0Rg9JbfhRMSlVbguGHW+kzkFn9GAZoNJMVaAOXXVzcTJWSC9EiY4YH3Hd3DrLRar
         BXNzbCEUUwPGylSSWBc+bCCOC0Q4rIEe3dYg7oNzXnf7YZ4pZW2Kkqm75Q5sxPI/1Z5I
         vtJr5CfVTaGuZDjHML03QtwNkDkYKjYV0YNLgNcnlf01M7uFOBBl2lZM5NlohFzG4vNp
         d3VNBfRzaFc6+V7uB7YCPZ6uNcReeZP77k0Rnd22dg08TxwVmOs7MEYesZXP7smrw6Mu
         tVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject;
        bh=Oy3Qbi1DJCOYH5os9zHpHG+3uQM0H/JgHWmsCWiHwX4=;
        b=tfyQqtRDCdowfY7K3Px16N6gN9slsgKh0YhWurt/mbtv+WA3FPIyV8ibRq9ark6uZp
         3/A0K8KMZjCqRSuxG6WWdi1uFqB4sYGNoJG4aN48flHE7OPJt/arxAvfNmA6KuzrbnFe
         Qeq7G3zbv4kWmOYrOoCpkes7bx4SPwFCHGp3BR/uCxLZvXrutjWqlFfkwQ1CWUHFr/Pc
         0IAprtKoMbhboyEanpEHjIoLPVHKSiJis69qZuNI+VpJ7is/M0uke8LEnbD2HZSZuhBX
         Klxj2IXxo3mS+E8zFo2Sf8Gzrak7/kjm14aU4LJmugLESmNTz92+WD68tRCmUoEkCJ9Y
         oJRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si16356377ybg.289.2020.06.16.10.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlFGh-0001q5-Uk
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlFBk-0002Fm-52
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:15:56 -0400
Received: from 5.mo69.mail-out.ovh.net ([46.105.43.105]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlFBh-0000Qa-O7
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:15:55 -0400
Received: from player699.ha.ovh.net (unknown [10.110.103.132])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id A21D593821
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 19:15:50 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 2DA1C1369E315;
 Tue, 16 Jun 2020 17:15:38 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002311f1b4f-21d6-40ee-9a57-c76899b6b693,EBFB3A1CCBA6C973625B067ACEBAD7C75398389C)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 1/2] hw/misc/pca9552: Trace LED On/Off events
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616094542.25415-1-f4bug@amsat.org>
 <20200616094542.25415-2-f4bug@amsat.org>
 <ce02c953-073a-3843-5830-930cc194117c@kaod.org>
Message-ID: <3181da82-6dcf-9826-5747-7601204faa9f@kaod.org>
Date: Tue, 16 Jun 2020 19:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ce02c953-073a-3843-5830-930cc194117c@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18322332138027584270
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheevheejjefhtedvueeghfeiffduleeijeehteeuvdfgheeikeevffeghfeviefhnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.43.105; envelope-from=clg@kaod.org;
 helo=5.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 13:15:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N/YaHtIYiDXO

After a closer look,

>> @@ -45,9 +46,15 @@ static void pca9552_update_pin_input(PCA9552State *s)
>>          switch (config) {
>>          case PCA9552_LED_ON:
>>              s->regs[input_reg] |= 1 << input_shift;
>> +            if (input_shift < s->nr_leds) {
This seems like a superfluous test.

>> +                trace_pca9552_led_set(input_shift, true);

This should be using 'i' and the output is not very concise : 

564609@1592326881.815616:pca9552_led_set LED#0 state:1
564609@1592326881.815660:pca9552_led_set LED#1 state:1
564609@1592326881.815669:pca9552_led_set LED#2 state:1
564609@1592326881.815677:pca9552_led_set LED#3 state:1
564609@1592326881.815706:pca9552_led_set LED#4 state:0
564609@1592326881.815715:pca9552_led_set LED#5 state:0
564609@1592326881.815727:pca9552_led_set LED#6 state:0
564609@1592326881.815740:pca9552_led_set LED#7 state:0
564609@1592326881.815748:pca9552_led_set LED#8 state:0
564609@1592326881.815759:pca9552_led_set LED#9 state:0
564609@1592326881.815767:pca9552_led_set LED#10 state:0
564609@1592326881.815779:pca9552_led_set LED#11 state:0
564609@1592326881.815790:pca9552_led_set LED#12 state:0
564609@1592326881.815802:pca9552_led_set LED#13 state:1
564609@1592326881.815813:pca9552_led_set LED#14 state:1
564609@1592326881.815826:pca9552_led_set LED#15 state:1

I would instead simply dump the contents of the PCA9552_INPUT registers : 

LEDS = 1111000000000101
LEDS = 1111000000000111
....

C.


>> +            }
>>              break;
>>          case PCA9552_LED_OFF:
>>              s->regs[input_reg] &= ~(1 << input_shift);
>> +            if (input_shift < s->nr_leds) {
>> +                trace_pca9552_led_set(input_shift, false);
>> +            }
>>              break;
>>          case PCA9552_LED_PWM0:
>>          case PCA9552_LED_PWM1:
>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>> index 5561746866..ed80d0d1be 100644
>> --- a/hw/misc/trace-events
>> +++ b/hw/misc/trace-events
>> @@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
>>  # grlib_ahb_apb_pnp.c
>>  grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>>  grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
>> +
>> +# pca9552.c
>> +pca9552_led_set(unsigned id, bool state) "LED#%d state:%u"
>>
> 

