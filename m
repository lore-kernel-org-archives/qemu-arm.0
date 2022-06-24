Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp98029lft;
        Thu, 23 Jun 2022 23:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1torBwAeqDEsLazm5Nq7pex2MsZqu04RKpOKY+C9DwtSOj12A30cLIqkGTYnRuCzCY0th0Y
X-Received: by 2002:a05:622a:3:b0:305:22cd:5235 with SMTP id x3-20020a05622a000300b0030522cd5235mr11526513qtw.177.1656053770139;
        Thu, 23 Jun 2022 23:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656053770; cv=none;
        d=google.com; s=arc-20160816;
        b=UvYDFC2zXRIaeBFcF2L3csOFdOjo0aMwfYYu7ZYoEKSKcDyVQTO6DdB+TSay+VUPhc
         k7H7ej8CPvTcPJQ81ERwO7jY1PjOZrLVQNKXZR+x+rIrSjepCUlXK9oJTKUEVetGiNgQ
         mbpzDoy3oM/ncgWec7M+EcWd8iSYjIrUiIbJnGxFvv1/6j9zSORnD3QyTMJurRh2+a9c
         uGLFT1d4WEmSL3fnZT02yI2eCLRBD70jPFvUM7q8JO3a2Ck0Whhe6XgNDBFkl+nZAFVP
         BLnwOybFX/akifyiYaTMfkTur0QDWW0RVXfx/zOIEmOUb4CIVsu24FTACb7rW20G4SU9
         6nRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=tCga6ftbFFwm+CcFAcaz0sxhkWmp0pbVhHQI0indsgU=;
        b=lQYHb0ZYTAegMCXdo6V9QKfSNG4kRUBD+iKxObYwn6xgYnYPPcmJKla2HLZ1mKM3dM
         SwZx/VkRi341wwI484q6ILvBK3NPbQrSIeK8I2WytvbnrbWZ98Wbgl04WoIhNmHfy/R5
         LVcCN6SCSHtRZOaFdj26R5mTa5BVz9AkcNjqUfWoS9HxZvDj1gt+nngiN8WUYZl7NTIb
         ImEhBZzGg7rTu55llHQSPbPupZjXuxhaA30k8yghtMXlHbZTOkthXVgbF2et4OWA1/DE
         nOeYViojtz4zuQwRTx9mcJNaEMMxFDWuQzZS9KnAL2CYRLIGy9lbK7vtCR1zLz7Pz+FY
         hoiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j192-20020a37a0c9000000b006a6ca1ed8bbsi1205101qke.604.2022.06.23.23.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 23:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4dEf-0000xH-Kw
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 02:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dDq-0000vq-CC
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:55:19 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dDl-00052Q-So
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:55:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 911131109BAB7;
 Fri, 24 Jun 2022 08:55:03 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:55:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0046d7203b2-9411-4f57-b4ab-39e769465d25,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9093f275-8062-7992-293e-1c5c129fd228@kaod.org>
Date: Fri, 24 Jun 2022 08:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-2-pdel@fb.com>
 <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
In-Reply-To: <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cc83149e-aee2-413e-8d10-82d8b6c2f00d
X-Ovh-Tracer-Id: 6901484954357697504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejheeiveeuledthfehheeltedtgfetkeevgffguedujefgfeejgfetueelleegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpizYHwJi1kn

On 6/24/22 08:36, Cédric Le Goater wrote:
> On 6/24/22 02:36, Peter Delevoryas wrote:
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> 
> Please merge this patch with patch 2 in which the "memory" property
> is defined.

Ah no. That's another link. I don't understand where that was done
before.

C.


> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   hw/arm/aspeed_ast2600.c | 2 ++
>>   hw/arm/aspeed_soc.c     | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index f70b17d3f9..f950fff070 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -294,6 +294,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>>                                   &error_abort);
>> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>> +                                 OBJECT(get_system_memory()), &error_abort);
>>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>>               return;
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index f530028874..06e5629800 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -247,6 +247,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>       /* CPU */
>>       for (i = 0; i < sc->num_cpus; i++) {
>> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>> +                                 OBJECT(get_system_memory()), &error_abort);
>>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>>               return;
>>           }
> 
> 

