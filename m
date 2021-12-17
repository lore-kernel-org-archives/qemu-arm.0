Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp569907lfc;
        Fri, 17 Dec 2021 02:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfeLBNLY0ekRnJpGwaZLarQzUXP2NFpQuo9r9X3+XDWBuQC3M71bPCksGlE2tdHNRnYEpw
X-Received: by 2002:a25:2d6d:: with SMTP id s45mr3271761ybe.532.1639737229794;
        Fri, 17 Dec 2021 02:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639737229; cv=none;
        d=google.com; s=arc-20160816;
        b=sgdyc8VEA01wcZF2h7tiYCC9V8PmmBD9KiA2jakFJJR//j9u7WcDFn7RdONvBz8oZK
         SGBN28SxCf03/+HhSDQE3tDU7H2qb4cuVfdcLVu+gEOXs6GyGffqGKjtET95h918ATbA
         /AVaNJYxT9NOrId0lMEchFzpeo0mj4cEUrbvDMP4pY15F2mG4XJhBJQJWxvdPNLWlPkv
         9+ao86J765CQS87BJOpjUUvGAailg0lAcYIMXWV2HoPbG2kCt9asuJ/Dg2XydEM5Yay6
         5yxk2kgmg1PEFHZP5KK1/8iBy08FymU9Oot24lLCEX+i8Epjbsgc9wXQ9dClS8UWBuZb
         8nKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=jrP/zobAh1C4P3LmrM6orvac1Jb4/EPa+A7bgA469F8=;
        b=ofVol0R3j6tYra/t/PqKY7vj+ch2VXyKscQKsKkywIRc4w6qmjg9RNtzXMnOekO8qz
         Id9UVBCv0929uwOHwzI/tmekf6NQfevtHorZnu3O3NBEpYPbsxRjoxq+nt+YJ/E6gqhj
         LD5PgnJQKfbsHI2pI4JZHDaSnMAz3bv+e74NJQuxvZvFZ55n0QluHnSybOiHVhCiXegC
         /MR/Il4MFgImH02CzWJ11UHXdC49B62DI2MPAw2aWxMSTxTsZiPdBO0yC7PoEsqrv/3A
         XWNyF02kuRNsh1iroSH0Pk7ywRkgcPIZ2AhIEMuchmswJ2Pr1cU1XR166GMG5e/oEXB+
         rl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si8736616ybs.488.2021.12.17.02.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 02:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myAYW-0001WK-LC
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 05:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAYI-0001Tg-TY; Fri, 17 Dec 2021 05:33:26 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:55425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAYH-0003RF-9m; Fri, 17 Dec 2021 05:33:26 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmkfQ-1mFidv2HQc-00jqGG; Fri, 17 Dec 2021 11:33:09 +0100
Message-ID: <372de133-599a-3948-0697-feca24611f75@vivier.eu>
Date: Fri, 17 Dec 2021 11:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/net/allwinner_emac: Replace MII_ANAR_TX ->
 MII_ANLPAR_TX definition
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211122105145.1053455-1-f4bug@amsat.org>
 <60230067-bf75-0352-d5d6-93529c03aa24@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <60230067-bf75-0352-d5d6-93529c03aa24@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HWkhplR2HDexheGWILxeydhYny8rFKm5x2NbBpjlNWQGPBQVg9e
 2zZg2Qt26rTxNyTTNltlmFsfxEWFSsVUOm4obNt6t9w/el/Ql+unCrMiB3QxcRuVO5StNCB
 8WFRA83m/9vc9WxFQVWoiRQT8f1W0/2fJjR7Ij/UdVKYfGEB1lGr4kbwfL0R6CQT7IWfVgO
 24AGdo4B7JLF7i4RPtdHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMHc+MaJYaA=:tYNbEg6FeHArvq/rVpJYpq
 PhoHD9SUXyPoeTcRP0JnHKxGVfl7RTNNq82UD3O8TQGWy4iINavNsNfzZS0H4xFPvh7junLSo
 P9JznFEoVFZkAUs5WUdtEGZvIg56qG1VQ5LZxwB/839sD68xMkMQHpB6xauWiClkdF3zfq8Yu
 /JOiyhryI8Qh5/dQkzqddmWVugZrXuQs7M+1y61YTNluvo6ULIBzUpVIMHMkBUXrqyKgEBhPY
 yi/0fOsjIjdWcWidJQI4UFYOGxS3PAo5+5Sahc/JwDsmw4k8x3cyZgM2DG4ryiROp1brfPYXd
 h5gehnhBdcte7d7wfGtNEARUp+1w98YjvY+dQvcAloXdth1zftwGQQN0vZESZLoQ2LlEIuXIK
 H3ou6oJndVq4omEuWILiHQjBmw4JKe8NcbwnFAVymzHe525aXBtGMVT4+D0lIMB7MtDjyUhOR
 9i3ffXnWoWbLTncHw1nlXMbbGg89AmdOCre1uR5tNd2w51R6N+jlHq+h8HVvkq12idVxVwZ60
 XcjRS7sKjqO9pM6Nacnlx/w28pG9uuUXN/lO2TcuoAv17pM4r8J+oW/1rv/I0pjvwiGXIJa/g
 imjmQsyOis2mogfvq70P4my4SjHfPemItTD9ou3Co3p8hI6xiArtz3pfuDncjD4pw8q2X42+6
 U7h0K9B0H4wle1y8ZYZGjT1yCx14plJprUrrVb9Leb2YdZGkqBGOnT0bvadxeCn80CaE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Xznya4QLgUX

Le 15/12/2021 à 11:24, Philippe Mathieu-Daudé a écrit :
> Ping?
> 
> On 11/22/21 11:51, Philippe Mathieu-Daudé wrote:
>> While both MII_ANAR_TX / MII_ANLPAR_TX have the same value,
>> the ANAR and ANLPAR registers are different, so technically
>> the ANLPAR register have to use the MII_ANLPAR_TX definition.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/net/allwinner_emac.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
>> index ddddf35c45d..3aed92b8f1a 100644
>> --- a/hw/net/allwinner_emac.c
>> +++ b/hw/net/allwinner_emac.c
>> @@ -50,7 +50,7 @@ static void mii_reset(RTL8201CPState *mii, bool link_ok)
>>                   MII_BMSR_10T_HD | MII_BMSR_MFPS | MII_BMSR_AUTONEG;
>>       mii->anar = MII_ANAR_TXFD | MII_ANAR_TX | MII_ANAR_10FD | MII_ANAR_10 |
>>                   MII_ANAR_CSMACD;
>> -    mii->anlpar = MII_ANAR_TX;
>> +    mii->anlpar = MII_ANLPAR_TX;
>>   
>>       mii_set_link(mii, link_ok);
>>   }
>>
> 

There are  other uses of anlpar with MII_ANAR_XXX values:

  34 static void mii_set_link(RTL8201CPState *mii, bool link_ok)
  35 {
  36     if (link_ok) {
  37         mii->bmsr |= MII_BMSR_LINK_ST | MII_BMSR_AN_COMP;
  38         mii->anlpar |= MII_ANAR_TXFD | MII_ANAR_10FD | MII_ANAR_10 |
  39                        MII_ANAR_CSMACD;
  40     } else {
  41         mii->bmsr &= ~(MII_BMSR_LINK_ST | MII_BMSR_AN_COMP);
  42         mii->anlpar = MII_ANAR_TX;
  43     }
  44 }

Thanks,
Laurent
