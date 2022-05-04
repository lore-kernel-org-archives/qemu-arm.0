Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp148568lfj;
        Wed, 4 May 2022 00:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoRLKgtDXg5ZKUxAlujNodTjH3BiRYj8sgI9nRlplyI4sLX6VJhAKIlkceNfjLurU4ZEDl
X-Received: by 2002:a05:620a:470d:b0:69f:b40e:4980 with SMTP id bs13-20020a05620a470d00b0069fb40e4980mr14758512qkb.18.1651649659529;
        Wed, 04 May 2022 00:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651649659; cv=none;
        d=google.com; s=arc-20160816;
        b=QQCSLR66z2lCStK7vkdksiAXvYCYlpVOD8te3P4kERWhK9Zwc/mVNAwTq4IC5uZMiZ
         srfLhmODWxulW4/ev7E9LlOa96GQ8ZANKHTf17eFo8qSju0xz8pkanYhgV6KZ7bHE+EB
         Sru808vAc6YEeaKWdtdNCkHRaUeiWqmhl7fa+/0ri1IjxbjCB2l7ha1BmXJbOgxJ+HZq
         1e8ZSXKRlTH+xZrdLhv+DShZITxHpLvwfuKMQRZk+DpkMOAjYHU9si4iKgj61K+bWV8q
         kQYwww3NEC5WhpekCLh5kB3O8S+gsI6fVtW7GlZiwK7Z4bFsbvqjd4wu1PVCiznrUcVF
         Z5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=5F7jzCM9aI5IbMdj7vjF1sF1CHJ7ow7pawGkV//bJ9E=;
        b=GjZf0ACJcLNJ0eVNjzuh2RJ4AZkGlE8gC2uTQX7MCLpg5QdtsUVMRclr4YLGjzIhcE
         acTePR2XIKIyP4Etmdl1oIHDp+8zOFaZDzTRxusjUEbWqf1COaiUHmvQox2XXJbEY7mY
         Oc1SwyOHaJjpAAV3fVfBIRq2obozojzZoG1rtFKdTOI0teq1b/un+QUEbVivhhGXqt2I
         9HOSjfAKQINwFBf+YGP1BzjTpXpuiHUb4jhDYqIivAT3LUBJt6Um5ntYKJ3zuOiK1LvL
         kj8FccHX8H/K67kf7pOJ1IjOo5dfMhNbLCeg8HwFLNsZiR7PmDZ06raXkR4F41IYPxTL
         NgLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020ac85d8a000000b002e22bbe9f4esi9303410qtx.158.2022.05.04.00.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 May 2022 00:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nm9Wc-0006ed-V5
	for alex.bennee@linaro.org; Wed, 04 May 2022 03:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nm9PI-0001dc-Tu; Wed, 04 May 2022 03:26:45 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:57577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nm9PG-0004J2-TT; Wed, 04 May 2022 03:26:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 47E0B21426;
 Wed,  4 May 2022 07:26:39 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 4 May 2022
 09:26:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d605532e-2f39-4147-9167-6343b7212c7e,
 6B2DFAB2A66AAC820148B8778CE376EF5247917D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <3d9de3d0-8690-7665-5328-2a18167d566c@kaod.org>
Date: Wed, 4 May 2022 09:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
References: <20220503204451.1257898-1-pdel@fb.com>
 <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
 <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ceebc710-f481-4fd6-ad5e-0b5e464ba6ce
X-Ovh-Tracer-Id: 3075677074327964640
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bMKoJ7HvILlL

On 5/4/22 00:47, Peter Delevoryas wrote:
> 
> 
>> On May 3, 2022, at 2:35 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/3/22 22:44, Peter Delevoryas wrote:
>>> Hey everyone,
>>> I'm submitting another Facebook (Meta Platforms) machine type: this time I'm
>>> including an acceptance test too.
>>> Unfortunately, this machine boots _very_ slowly. 300+ seconds.
>>
>> This is too much for avocado tests.
> 
> Erg, yeah I figured as much. I’ll just resubmit it without the avocado test then,
> if that sounds ok to you.
> 
>>
>>> I'm not sure why this is (so I don't know how to fix it easily)
>>
>> The fuji has the same kind of problem. It takes ages to load the lzma ramdisk.
>> Could it be a modeling issue ? or how the FW image is compiled ?
> 
> Yeah, one reason is that Facebook OpenBMC machines have an unnecessarily
> big initramfs that includes all the rootfs stuff, 

Indeed,

    Trying 'ramdisk@1' ramdisk subimage
      Description:  RAMDISK
      Type:         RAMDisk Image
      Compression:  lzma compressed
      Data Start:   0x2047da18
      Data Size:    21938373 Bytes = 20.9 MiB

That doesn't help for sure.

> whereas regular OpenBMC machines have a smaller initramfs right? 

yes, about 1MB.

> I don’t entirely know what I’m talking about though.
> 
> I think most FB machines have moved to zstd compression recently though,
> but this one may have been missed: I can fix that on the image side. I’ll
> also experiment more to see if it’s something wrong with the image, or possibly
> a regression in QEMU. It would really be super awesome if it could boot faster,
> so I’m very motivated to find a solution.

there is something else because loading the kernel on the fuji takes
much longer than on the ast2600-evb and it is the same size :

    Trying 'kernel@1' kernel subimage
      Description:  Linux kernel
      Type:         Kernel Image
      Compression:  uncompressed
      Data Start:   0x201000e0
      Data Size:    3659848 Bytes = 3.5 MiB


Is uboot doing some special CPU configuration which would slow down
emulation ? Try profiling may be.

Thanks,

C.
