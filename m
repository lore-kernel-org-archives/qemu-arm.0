Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5416628lfp;
        Tue, 4 Feb 2020 06:19:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+33q5VQgkLgYX86m75yx1OEmeoPgFJAuh5rDznu2cCVNVY2b9/1w+4EGW6HaYclBVhcI4
X-Received: by 2002:ae9:e109:: with SMTP id g9mr28478957qkm.141.1580825967773;
        Tue, 04 Feb 2020 06:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580825967; cv=none;
        d=google.com; s=arc-20160816;
        b=0D6Gygsu0MgPU3jyiRTZ1eBbKp9+qjvS5+vXOcYFdVsfYjQNCgaLm94niklKlAMzKJ
         Kt1FaAHRQXgMQEzyIgUZj1NeSdTrJdpo2Lk/078Dmsl9/gFjFyULlEvCo3DI7bzoVYsg
         GmZXb45MYywqlt+9jL1gEK2O+NvuNtWez30SxUo+ltYwcezq4AXc9v2EOpJeu9frBIuZ
         CWIlNL5VDnJ2QZ0w/+LBAhbNHeew2VliQr1FtMLjrJs6n9MEcIBpczOAfuXqLBxo+S3E
         08gNhj9q3pNlZb+hF0UZFPcvY3a1cUhRxrKq3nBI4wL22JPkxzkhocoDJRdwWGqc6eti
         b1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ftb1eK4A7nz9bJZumLSepoTRLBcPi3e0VP/9N7S47X8=;
        b=C7h62HlwHL+Du47nKSyot1HPmcjsbD2WT7GIvifXe8xzL/R1B3oQzHHkFE2c11dLol
         jtVA/qBA/LIw249IQNxM9v9S1X+p9Zl2EhDL4utgN2G5idCGqQqr6T1XTR1J1YU1O7is
         zTN2TbFGDVSUxlKE4DG7jnheKmJxqTmxSKCyp+lGZgcUe08aeNiGYibbpmS7CbzbgwM7
         kPPNEwnLI4GVxygQAAywsIyo5G3fwAaEPiC+oevfIjGD4L6bD45ljDKoUqXtzJIJzdqy
         m+vlBxn5UfpSaDiwlej/QoII9I9AoH4UPiTvfyV6wRdZC0bQrugA8+vF3/5IDPCk/i9T
         rSQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3HimXrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si12348274qkk.39.2020.02.04.06.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 06:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3HimXrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyz31-0004tN-73
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 09:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iyz2r-0004qI-NM
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iyz2q-0008Nu-F9
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:19:17 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41173)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iyz2q-0008I8-8F; Tue, 04 Feb 2020 09:19:16 -0500
Received: by mail-pl1-x642.google.com with SMTP id t14so7332294plr.8;
 Tue, 04 Feb 2020 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ftb1eK4A7nz9bJZumLSepoTRLBcPi3e0VP/9N7S47X8=;
 b=i3HimXrFKb/AYK4EG3lbKUc05czkyC4ivnW60CpkSwPQ9KxKELFCkF358WC2vRIoZi
 Wij7dl3wkha73MIdlmOa6FfELyZ58BJNv/K8gWjXYgAy6+JpKKI1R8nS2Tizcj3/0sGi
 Q++g9fFzlY3sgPwWLfOP0fPddjbD/drWXCG/islo8iD+BB8q+Pc2vJ7ymJpNcL6lPPjT
 wazplvUk2GhQx5GW09LLelntL2BEwpgzgGtEjlUmklPtmwxebpuMea3WnKOD6h7ddci8
 RPOamyndlVFeglxIvanVoXgi2TusFAWFJUbIAlPil5L1jE6KVaeScqCueeHTwteRxtpf
 4Z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ftb1eK4A7nz9bJZumLSepoTRLBcPi3e0VP/9N7S47X8=;
 b=KqYCY9J5fOHoj4j8H35k9YxY6LPN2Co87rqu1T7ZRncL4MXhXib/t3Og1UNvrG3fA4
 45eEixXL/FQAhWZvxO3JkgXdhcvEnjCLXw0wjedOQQQhu7p8iYgtpDfMbAl9UeSTotJI
 0FvghMp+EmpWlYXW8muKk+/xxMNHsQ43g2FxcCC32EujbJHCVnsT/IIYmGhVBNZPsWP8
 LEX6hgymnH3rbkV0ufMeBHAqMIla0l52nfd5l3XdYZ+yHqSIo2NxEEmfB1UuikxHW28w
 AKjFA2NShwA+fX9u0BJ1Bz+7k0W63t3j8wMey6MRr9AxCCD2i35mfzH0rojB3qCUBmj5
 HDrg==
X-Gm-Message-State: APjAAAU0ONDSUcociuktQnThoYnxUFvhiWsutwcfE236SS2WfAJ1UdWm
 Y93E0WKaS3J+FQd0cRNHiy0=
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr6516742pjv.40.1580825954257; 
 Tue, 04 Feb 2020 06:19:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t65sm24462939pfd.178.2020.02.04.06.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 06:19:13 -0800 (PST)
Subject: Re: [PATCH 3/3] aspeed/smc: Fix number of dummy cycles for
 FAST_READ_4 command
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-3-linux@roeck-us.net>
 <329f6d24-6d47-4e2e-1a66-7683bc0529a9@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <957018b6-4b38-4acf-da8b-dbe2fee24ec3@roeck-us.net>
Date: Tue, 4 Feb 2020 06:19:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <329f6d24-6d47-4e2e-1a66-7683bc0529a9@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R8SFTropoGF/

On 2/3/20 11:45 PM, Cédric Le Goater wrote:
> On 2/3/20 7:09 PM, Guenter Roeck wrote:
>> The Linux kernel recently started using FAST_READ_4 commands.
>> This results in flash read failures. At the same time, the m25p80
>> emulation is seen to read 8 more bytes than expected. Adjusting the
>> expected number of dummy cycles to match FAST_READ fixes the problem.
> 
> Which machine are you using for these tests ? the AST2500 evb using
> the w25q256 flash model ?
> 

Correct.

Guenter

> Any how, it looks correct.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Fixes: f95c4bffdc4c ("aspeed/smc: snoop SPI transfers to fake dummy cycles")
> 
> I think commit ef06ca3946e2 ("xilinx_spips: Add support for RX discard
> and RX drain") needs a similar fix. Adding Francisco.
> 
> Thanks,
> 
> C.
> 
> 
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/ssi/aspeed_smc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index f0c7bbbad3..61e8fa57d3 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -762,11 +762,11 @@ static int aspeed_smc_num_dummies(uint8_t command)
>>       case FAST_READ:
>>       case DOR:
>>       case QOR:
>> +    case FAST_READ_4:
>>       case DOR_4:
>>       case QOR_4:
>>           return 1;
>>       case DIOR:
>> -    case FAST_READ_4:
>>       case DIOR_4:
>>           return 2;
>>       case QIOR:
>>
> 

