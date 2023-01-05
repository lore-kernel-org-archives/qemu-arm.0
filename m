Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp466203ejb;
        Thu, 5 Jan 2023 09:14:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZbNeXHkWVSj9zAekHNtgC0H+x0WDxA7aO608fPqAPnQ4OtY0z8v4/ecSiUKPMYWgFe4dW
X-Received: by 2002:ac8:5e8f:0:b0:3a6:a292:286c with SMTP id r15-20020ac85e8f000000b003a6a292286cmr66885947qtx.18.1672938893761;
        Thu, 05 Jan 2023 09:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672938893; cv=none;
        d=google.com; s=arc-20160816;
        b=dtaoy1VjQGOC0r97eMn2WzvI5eW9tj4tIqr5tUCxJovVOJ/6wVZctzrV/rdLQaQwBp
         NQovW2LxeVZzB4MJ7GYR5ez95EAMf7uvjHUzdBaHzcR19H2mFRMH4KZfasMipEV5PZOl
         VESIrIWtVzSeWdZ8f8zxaKsj3ZvP8WWmNrZz8dzhVuOUsnOnu88nzRnftXzadcmn72do
         1Qf1Rya4Tw9MZbP9LWl+PlVIOIfFwI4xogsgWuVlOBWqkcWlS49GPuokknNKxOEtCnq5
         lqDoQpO0yarDvapdhER5F4TxUNpdfD5wXZ5cd67gftbKgbFbX8xM+zZPTGtzPJQLkKR2
         RizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=GSPyVKFcZAfwR9x2KvRSu4K9u8R1FO4W3hmkkvvmP8s=;
        b=pvSW60omH5/rDAkoCP2bPsWGuNDkeRoXq9gd8p6D4SsFsSJm41T6l+vj3D0+rbmjMk
         EN6g4dFsnXtObXZmeO7xotb14CaKjlFokZXBaowkkqt+dZ8Kkagjqmg8SDc5v3AwAPzL
         0FM5oxHE1y3eOf6fCXEEZcvaNKhIdOAtyi92x22dSDxFV3iTNHBR3ip3+GvxKoYXa2on
         ypYc/uhEWCiEdwVr/gL+p+EU0JPnKnOy+y5Uer3qHm4iinCFF+YyaX/botOWvU+RPp8+
         jiDtTF92SZrrafWcwuRYB3TelChZheJViKV0E4fjfApEQElfbOflz4UrX6a3paMd+xr8
         NAAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb4-20020a05622a598400b003a66da6141dsi20515918qtb.375.2023.01.05.09.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 09:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDTNs-00027L-DE; Thu, 05 Jan 2023 11:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTNd-0001zU-E8
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 11:46:19 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTNa-00088i-MA
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 11:46:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9286D2BB50;
 Thu,  5 Jan 2023 16:46:07 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 17:46:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ca819312-d85e-4184-a797-939cfb513576,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
Date: Thu, 5 Jan 2023 17:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Stephen Longfield
 <slongfield@google.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <venture@google.com>,
 <wuhaotsh@google.com>
References: <20221221183202.3788132-1-slongfield@google.com>
 <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3caab6bf-5f22-46d1-967c-d81128478f89
X-Ovh-Tracer-Id: 18360894207909727014
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhslhhonhhgfhhivghlugesghhoohhglhgvrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpfihuhhgrohhtshhhsehgohhoghhlvgdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TzCiM6jaAZj0

On 1/5/23 16:33, Peter Maydell wrote:
> On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com> wrote:
>>
>> Size is used at lines 1088/1188 for the loop, which reads the last 4
>> bytes from the crc_ptr so it does need to get increased, however it
>> shouldn't be increased before the buffer is passed to CRC computation,
>> or the crc32 function will access uninitialized memory.
>>
>> This was pointed out to me by clg@kaod.org during the code review of
>> a similar patch to hw/net/ftgmac100.c
>>
>> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
>> Signed-off-by: Stephen Longfield <slongfield@google.com>
>> Reviewed-by: Patrick Venture <venture@google.com>
> 
> Applied to target-arm.next, thanks.

Did you take the ftgmac100 also ?

> (Looking at other ethernet device models we do indeed want to crc
> just the packet, not "packet plus 4 0 bytes" or something.)

(There are some coverity issues in that area)

C.



