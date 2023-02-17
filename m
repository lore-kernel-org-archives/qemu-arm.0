Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1282181ejb;
        Fri, 17 Feb 2023 00:27:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8uS1ozoeS5IKZxi+lTlDzCsGVj/d8Jc51RTugTmqGVFs0RdFzLEoeSL09WM+ONdjm253l5
X-Received: by 2002:a05:6214:2407:b0:56e:fe7b:8bc2 with SMTP id fv7-20020a056214240700b0056efe7b8bc2mr8869832qvb.32.1676622427977;
        Fri, 17 Feb 2023 00:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676622427; cv=none;
        d=google.com; s=arc-20160816;
        b=LaKQisihiil3N02tr+oopZrJte8dSNk64DtP86mJlkpHC0pCMB+DzeQkgKiUENYf8J
         ZGWRbg7ztnbGvquYNxZ9FV7T9YUz/xKvsdxxTQ+jBu9iFNvEW1jbFT496uvFkUt1ttfK
         Njzh60CsfiksGtL7B7+qiHWui8kBHDo/cP+7ddtWIM4NMp5vCQI2I+5EdNA32p/q+9ou
         FozwxQNXIx0jf2jK12t6c6Tb67r99WMETeLCTuoo738MTlL0mWe+Ll4DQn1ZYSId8xaB
         i3uVPuSlbCQiV/d9PRDScRUPti26XyM4+CXD1ICu25w+AubReqbLYl3tXQ0Jz1JhPLL9
         uM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=rDCTkLRnAu2OersRZQFJt41eayhmZEwk4cYuC2nwriY=;
        b=iNwrItge7yMc9h26VN+hduFi8uCy4ePV3etYmGQ7JnJq/PGla1dnTvhDNgj6VM4uQO
         DmXdE3njralkD8BaWdPdTBAPyHyYcPr1ckFArx+3fYflBXxBPWbydaRbp5+KJYoL0rTJ
         cLOOuSYGBKSx0wBUAwh2gY6L9EN/irQxhlEOK7/d28skegvOgvVAMXTR7NWUuklkA7wI
         Mspreqp7fQPrd3JGgTuT/esb/i6nVAflNuSbOxLXIEGPlGxjl8tu1pM6Cf6DGzn8re+z
         NG1oyAnfqSsAqg31qJz4+VZi9zopwa4RarVyjDZHy99tizXiDC/xLGSn+rtA0+crQTCH
         J/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de44-20020a05620a372c00b0072d5c9daec6si3333756qkb.12.2023.02.17.00.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 00:27:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSw4y-0007Eh-Qi; Fri, 17 Feb 2023 03:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw4x-0007EB-4n
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:26:51 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw4v-0005lD-3L
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:26:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9CD3A207B3;
 Fri, 17 Feb 2023 08:26:46 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 09:26:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055da8626f-0d22-44fc-9463-3169362b8339,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cf4f3bee-a02f-3fc0-f86e-dccbda7a7613@kaod.org>
Date: Fri, 17 Feb 2023 09:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>
CC: <qemu-block@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <01ff80e9-c564-5566-5405-b2ca26dfbf09@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <01ff80e9-c564-5566-5405-b2ca26dfbf09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4217542f-066d-4169-a46f-66d92e029410
X-Ovh-Tracer-Id: 4199043706563431276
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpoh
 huth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4FwDeSMCCuXz

On 2/15/23 11:45, Philippe Mathieu-Daudé wrote:
> On 14/2/23 18:18, Cédric Le Goater wrote:
>> Hello,
>>
>> This series starts with a first set of patches fixing I2C slave mode
>> in the Aspeed I2C controller, a test device and its associated test in
>> avocado.
>>
>> Follow some cleanups which allow the use of block devices instead of
>> drives. So that, instead of specifying :
>>
>>    -drive file=./flash-ast2600-evb,format=raw,if=mtd
>>    -drive file=./ast2600-evb.pnor,format=raw,if=mtd
>>    ...
>>
>> and guessing from the order which bus the device is attached to, we
>> can use :
>>
>>    -blockdev node-name=fmc0,driver=file,filename=./bmc.img
>>    -device mx66u51235f,bus=ssi.0,drive=fmc0
>>    -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
>>    -device mx66u51235f,bus=ssi.0,drive=fmc1
>>    -blockdev node-name=pnor,driver=file,filename=./pnor
>>    -device mx66l1g45g,bus=ssi.1,drive=pnor
>>    ...
>>
>> It is not perfect, the CS index still depends on the order
> 
> Quick thoughts here:
> 
> TYPE_SSI_PERIPHERAL devices have one input SSI_GPIO_CS.
> 
> TYPE_SSI_BUS could have a "cs-num" property (how many
> CS line associated with this bus) and create an array of
> #cs-num output SSI_GPIO_CS.
> 
> TYPE_SSI_PERIPHERAL could have a "cs" (index) property;
> if set, upon ssi_peripheral_realize() when the device is
> plugged on the bus, the GPIO line is wired.

yes. I would like to check first the impact on migration compatibility.

Thanks,

C.

> So we could set the 'cs=' property from CLI:
> 
>    -blockdev node-name=fmc0,driver=file,filename=./bmc.img
>    -device mx66u51235f,bus=ssi.0,cs=1,drive=fmc0
>    -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
>    -device mx66u51235f,bus=ssi.0,cs=0,drive=fmc1
> 
>> but it is
>> now possible to run a machine without -drive ...,if=mtd.
>>
>> This lacks the final patch enabling the '-nodefaults' option by not
>> creating the default devices if specified on the command line. It
>> needs some more evaluation of the possible undesired effects.
>> Thanks,
>>
>> C.
> 

