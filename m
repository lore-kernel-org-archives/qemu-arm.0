Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1244684lfl;
        Wed, 16 Feb 2022 10:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztepPF2PBSVwYKdww3diPVgq+bJAyMPyTu3vLwdyNy8GEST35rZFczj4aBBndCuwcIlHEl
X-Received: by 2002:a25:a329:0:b0:622:5214:69ec with SMTP id d38-20020a25a329000000b00622521469ecmr3368349ybi.600.1645036050044;
        Wed, 16 Feb 2022 10:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645036050; cv=none;
        d=google.com; s=arc-20160816;
        b=YKdGtcBrVXuw6WIG/NDDROiTSm21/3pSNEDDN3R/FbGelb2tkNccYDYkl/wjILy7lB
         k4f0bjNlgVxHKcg0CQJfumqz77VqPOAXz4d2i6L97wiBig8lGA4xhcUBbLNkxrNQ55Gi
         iTjinSTBzeoeCi6OThKnRwxBzmG5KWKkhbdWN1kzvTEAk+/B2m4kq0DLegxnAfat9sLk
         JdujeCdrOI0w56C581JDdneGsjJx+8EfJ3q3xSCG6ur3H0xGs56mczc6A0Nu8BgHuePf
         Dem72a9tTt00dH+amxa1WUnh7muiO+wLwWitBCxjnzhsCjVFymrjVoiWDXxmlN/G6MYo
         gr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=r+YgHGwFPax1FUNSCNvzxDCUVq5ImnLpu3aR7U63VFY=;
        b=0gSZy5nGDWbD8opKkaEsXKvuFCE0a4oVD8HZP/O2x8IcTRl7GMNx20dJvngNgxAgXi
         FhJYV1YAYq5bfobZnCHgiaXI/iizB7a4GAwW6og8FDgL8cFRwJT1ubf0DtKZTyvdO5Py
         S5oPuX4f0XbxHfEQ1ADYkCxcETG3oxEiJNxpBZ9K1/aGqRD0MGGTYy73SrV1WeYVOpNA
         /pAt0NsyB9xIKX6+FbbvrStTmWV01gvEGsRxCpxz+l6k8iWhSFEd//YwsMiKH1SIDUT2
         MSLgWnSIZr42kuuooADchA9lZsJORiQ38JpZtq973XW7vef4G6bVwlilWOUvB5u6GzKn
         WsxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q81si2915944ybc.737.2022.02.16.10.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 10:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKP1V-0007Iy-EZ
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 13:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKP1R-0007IL-Lq
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:27:25 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:48185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKP1P-0000nE-G7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:27:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C01D820BA9;
 Wed, 16 Feb 2022 18:27:12 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 19:27:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001acf52506-8023-4576-a2ab-1ca8780858a9,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6981675c-3630-94a6-514f-03aeeb8a015f@kaod.org>
Date: Wed, 16 Feb 2022 19:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] arm: Remove swift-bmc machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-2-clg@kaod.org>
 <e356a02a-133b-8aac-b28a-9daf8c27c3a7@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e356a02a-133b-8aac-b28a-9daf8c27c3a7@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ba49a27f-40bb-44ed-ad15-55928d895e6a
X-Ovh-Tracer-Id: 4755801206598241062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2lNWB+KB+fAd

On 2/16/22 16:02, Philippe Mathieu-Daudé wrote:
> On 16/2/22 10:21, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> It was scheduled for removal in 7.0.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Message-Id: <20220216080947.65955-1-joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   docs/about/deprecated.rst  |  7 -----
>>   docs/system/arm/aspeed.rst |  1 -
>>   hw/arm/aspeed.c            | 53 --------------------------------------
>>   3 files changed, 61 deletions(-)
> 
>>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>>   {
>>       AspeedSoCState *soc = &bmc->soc;
>> @@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>>           aspeed_soc_num_cpus(amc->soc_name);
>>   };
>> -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
>> -{
>> -    MachineClass *mc = MACHINE_CLASS(oc);
>> -    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>> -
>> -    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
>> -    amc->soc_name  = "ast2500-a1";
>> -    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;
> 
> Can we also remove this definition?

Indeed.

Thanks,

C.
