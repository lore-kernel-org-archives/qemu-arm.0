Received: by 2002:a05:6214:13e3:0:0:0:0 with SMTP id ch3csp1656778qvb;
        Thu, 17 Sep 2020 10:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYSc2xyOPf56M/MEMEoGlfYHXvPXoHWIVDzYfY8xKpCePcb/yk93zDHe5/YRNm8QH6lQKq
X-Received: by 2002:ab0:748e:: with SMTP id n14mr13287014uap.91.1600362332615;
        Thu, 17 Sep 2020 10:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600362332; cv=none;
        d=google.com; s=arc-20160816;
        b=bem0RovpVIfI4oR7CqkzmPBnuFu3VKDBaTW6hMcagSImX8uhZ6pOJcuPqzVtO6koK+
         0audsyfLs5xJDN0B8sPlNgwqrU7rQYVuaDlRu9wfyqyWFOdaFQJzdLtj0FkvfUPN8Vtg
         PCqVw1al9/NzhjNwGobMEOwOJT6N36gLlPbU/Wv3rki/cjFESZ6J1yF2WDD20Y1LlNW9
         DPWbMPLUqk+XpmIMf88b9uFYKJxa3NKcGQoYihL40Z7DWEszY8CugWPiT3WAeQiji2/m
         v5vXS75ZrT3DpYK0t2805OoOMzHQ3r+jUoT/RZX943TLsgPopX9cHXVpluYPFh2+ZRsA
         GgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=4l/CKTt+rFIyqgOWynJ5zSqnVe4MEVaE1yhkFm5T8IY=;
        b=yugXV0lLdNjrKuB8uj14JcmBae06UEjgIO+3D2hSBaTiikh/Am40yprfzkw7FwQpO4
         tZUQPtuh3inseAAcu9rzMXLukRtqLdX/VtMGAZ9TUqKMWzt6bAfNFB93Z51BXP18ouy3
         rOcz2F262NMjxIlK+Htwnq6gcw4hG9tgtivwoMPz3N9tfZxgzgmNNbAXPAidtAbBJ+BO
         PaVak37n6QePq8EcjF3vHy9XXLbeM2jTEKYVpf+7unPHNDhwsE8+yv/OBhafwM9kkpAj
         WJvEw54CBsulKx0G/hqakN4PACcD9q5Rq/j4RLAWX5nMvRostoSTeoc1lpgJoPH481wq
         idZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si131411vsa.289.2020.09.17.10.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 10:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIxLg-0007YA-1m
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 13:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIxJy-0006Mh-0Y; Thu, 17 Sep 2020 13:03:46 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:48151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIxJw-0005ek-0C; Thu, 17 Sep 2020 13:03:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.64])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id ABBB762C261F;
 Thu, 17 Sep 2020 19:03:39 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Sep
 2020 19:03:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e665840b-41c7-424d-a326-2d6e643fb57f,
 FF1720B74B3888C93CA5040C1F5ACCC945AC33B8) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/arm/aspeed: Map the UART5 device unconditionally
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200905212415.760452-1-f4bug@amsat.org>
 <e640309b-b694-e815-d64d-40dd453e52ef@amsat.org>
 <5e27c1f9-6d11-fa62-ba71-0020ce9d595b@kaod.org>
 <07b21d1d-fb5b-efb0-50f2-54a4b86df444@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4648c188-cacc-c532-857c-f0206f60e109@kaod.org>
Date: Thu, 17 Sep 2020 19:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07b21d1d-fb5b-efb0-50f2-54a4b86df444@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3561077f-3dce-4517-a17d-727132410fa7
X-Ovh-Tracer-Id: 10874785728916392742
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeehtdeviefhgfeugfevjeeiveefvedtvdehhfejleduveejieefhfeffeetfeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 13:03:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RA7sB4ZopIRB

On 9/17/20 6:57 PM, Philippe Mathieu-Daudé wrote:
> On 9/16/20 7:51 AM, Cédric Le Goater wrote:
>> On 9/15/20 7:23 PM, Philippe Mathieu-Daudé wrote:
>>> ping?
>>
>> It's reviewed : 
>>
>>   http://patchwork.ozlabs.org/project/qemu-devel/patch/20200905212415.760452-1-f4bug@amsat.org/
>>
> 
> Yes I know :) This is part of my routine to check if a
> patch hasn't been confirmed to be queued 1 week after the
> last review, to ping the maintainer (because some
> automatically flush patches older than 1month in their
> mailbox).

ooh. That's brutal.

>> I will send a PR when I have more patches.
> 
> Ah OK. I didn't know you would keep merging the Aspeed
> patches. Since this was a single patch, I thought it would
> go via the usual qemu-arm queue from Peter.

sure. It could also. Fine with me. I have only three for the
moment. 

> No rush, I just wanted to be sure the patch was not lost.
> Also, once a patch is queued, I understand it is the
> maintainer responsibility to keep rebasing the patch
> queued.

yes. I know. I have been taking care of Andrew's ADC patches 
since 2017 ... cough cough :)

Cheers,

C.
