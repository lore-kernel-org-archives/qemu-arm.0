Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2640114ejb;
        Tue, 30 May 2023 22:59:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6F6vKAgG0sc8FzXW21rMV4gQTFdQALT2h3pSvWwQsSc2R9v+pXQ0rUJwPHd2gSFaxK44N7
X-Received: by 2002:a05:622a:1997:b0:3f6:c46a:79cd with SMTP id u23-20020a05622a199700b003f6c46a79cdmr5179790qtc.29.1685512775771;
        Tue, 30 May 2023 22:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685512775; cv=none;
        d=google.com; s=arc-20160816;
        b=Rxd79x1qv5rjhqu7sL3knEGz93n1bh62258NT9A/OfMv+Kg4mmfibLTWhMEzRye3Si
         J/k+KMHhF5kLmwebDqll3SaAVZZHtwMBJ9FbRlKT0K71VfC6OcXej7gLYFS8c6jKfVvs
         TBdHxvcqKl1RT6+oWNWoNwUGwJsWT9+sBSWMlM6d9ovAcRtRvIFZ+EWRZv7ockjWqOza
         aendK4XywamxTA95BCoYzEgBs620/FVDpuFym5Ui5//aerJev04ObCXFu4KI9LNa3ASZ
         26ssmpmiegngIobj2LZ44lRitYkbC7l1Uj6+C3eFsF4M6ef0ExzWtpyL3fT+BHbUsrwz
         rwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=OsX9iQwxenTZgewduapjYskAdqetyajqbge/20UHhdw=;
        b=Xujnyb8Eo021COAFGYY8flpVl98mQYSsYqfR31Mp9MyD4gTq7NkADCV2Ln5PVfnt4o
         2VuL0I47ncs8ADgSoFI+ZOBW5W+1s8/9+rZLiZu6+EoAXm6U3FvC39q0s/QVdRZ6p/o9
         l6qXuCIASzcmwPuqozS+KK13uLzAaIlSsk2wxlnwwcq2MWRrG9IPHu6sVACgfe3Ea4P2
         fZ69Y8/fvn9NTABB8pO6+MPyhQQkjPkwvh9uJVph+WoUaqwWXV8b+hH4eIjOr99V7wUY
         NlQeBdzoJnUsA8CIC08wzse6m8Qm/tJADjj9UhBTAD8hGqP48jIidZw2uBb/kDMAztZz
         salw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85951000000b003f6925f032fsi7730631qtz.197.2023.05.30.22.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 22:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Era-0005GO-EV; Wed, 31 May 2023 01:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q4Eqs-0004uy-BU; Wed, 31 May 2023 01:58:30 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q4Eqq-0003xn-L3; Wed, 31 May 2023 01:58:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 413CF20295;
 Wed, 31 May 2023 05:58:25 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 07:58:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00450903b1b-7065-4d3a-9a1f-2bcc50b61137,
 AD4A5C7A17A66D4AFB6DE796C11E1CF112258E66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9134f0ac-c533-720b-d97b-4a4accb1c92a@kaod.org>
Date: Wed, 31 May 2023 07:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Alistair Francis
 <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-5-clg@kaod.org>
 <dc9883f1-0d36-d86b-caf0-a54f18861913@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <dc9883f1-0d36-d86b-caf0-a54f18861913@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 3a09c27a-908a-4628-af25-ca57ea1d8d9f
X-Ovh-Tracer-Id: 16285297731720350569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekkedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LzqEb49yYxQ0

On 5/30/23 22:33, Philippe Mathieu-Daudé wrote:
> On 8/5/23 09:58, Cédric Le Goater wrote:
>> Boards will use this new property to identify the device CS line and
>> wire the SPI controllers accordingly.
>>
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ssi/ssi.h | 3 +++
>>   hw/ssi/ssi.c         | 7 +++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
>> index 6950f86810..ffd3a34ba4 100644
>> --- a/include/hw/ssi/ssi.h
>> +++ b/include/hw/ssi/ssi.h
>> @@ -64,6 +64,9 @@ struct SSIPeripheral {
>>       /* Chip select state */
>>       bool cs;
>> +
>> +    /* Chip select address/index */
>> +    uint32_t addr;
> 
> uint8_t is probably enough.

Yes. A uint8_t is more than enough.

Thanks,

C.

  
> 
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>   };
> 

