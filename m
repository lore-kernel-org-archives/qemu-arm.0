Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3457019ejx;
        Tue, 15 Nov 2022 01:08:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gMI06Osy8QNUlXlM8jn7/wuPDOxlcgLTxATsqDW+wdvSJevZGnyYpjlshFR01l2dyN4KR
X-Received: by 2002:ac8:66d0:0:b0:3a4:f2b7:6e5 with SMTP id m16-20020ac866d0000000b003a4f2b706e5mr16059827qtp.183.1668503325023;
        Tue, 15 Nov 2022 01:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668503325; cv=none;
        d=google.com; s=arc-20160816;
        b=G1b2PcmWllLRIx0GTFXNasFzQNmlIm3hyCYZElz8qT9bFHwYdnwZFG8ZS9k6flStCy
         maMiCwucAwb6NDKqxW5ueOcWuhigfcpYQBPF31Ku9akisfDvMOZsoz/LOKYo0IQ/FfES
         IQ9dbTbdbOFpjWU6PtZfGGiGsVMSEvUT/ItdNjpXa3F0vvcwD9U9FUqQXgQsWnTmQUAF
         9flHa3Bf27PNLnaTHnF9EHb9iOpNre504WqqiDqhDkD40q6CeSiwcbTIxoWXHJUoIa3z
         /c7xNGbbKFT+46lT+txQzBdFXV9RXHtdagHMdJNNp508O12vSSZXams9rico6d+Nz6tW
         otGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=mTV++JxWrUlIteZxkG/mhXeVEU8/lydAJOhbGyzC1LQ=;
        b=hQWArIy3Rwzju38sUDjEb4haIYLT3jh9ciFj1gXsICg1LVM398U713S1ECqZBsiHDb
         qr+OJSc/BvAAx9O18G50gJAAW6LCpVdItJkA1tYC7RijhrNcOjxMvjoFpt6dnxF+cWPN
         jOACj6GHuoOI/97JxH1cMkFO/9UgdMxT6/P/ecoY/niab/e7lIAB8lrvoThdkuU70pZ5
         8RnvpFlrmor/5cnTee/W2QYdHUz8sxyVrRdJQdVslerfIpbW9qjXS8No1+pVDsnTtG21
         ZFgz567iC5/NTmJljnph9p+BDT84QK67fXtRPRZYuHSaHgRJaZ2saYaBP4M/0ON9sh+E
         s9bA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t67-20020a372d46000000b006fa57ff8d78si6496389qkh.67.2022.11.15.01.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 01:08:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ourvH-0006g5-R5; Tue, 15 Nov 2022 04:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ourvG-0006eL-0v
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 04:08:02 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ourvA-000239-3o
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 04:08:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9F82A20574;
 Tue, 15 Nov 2022 09:07:35 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 10:07:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0045a193e4c-d70f-48b0-844a-6fd3c97aa405,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2e9b0f16-0016-760a-b498-d584515127fe@kaod.org>
Date: Tue, 15 Nov 2022 10:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>
References: <20221111124534.129111-1-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221111124534.129111-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6682b270-5844-4c4a-bf6a-6a35cf18fa0e
X-Ovh-Tracer-Id: 6257470209121225625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeefgdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghohhhutghksehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvg
 hmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdhmshhtsehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdifrghnghihrghnrghnheehsehhuhgrfigvihdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ZAjzpkLV8e4+

On 11/11/22 13:45, Cornelia Huck wrote:
> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
> 

For ppc,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
