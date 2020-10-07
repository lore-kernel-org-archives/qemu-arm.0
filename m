Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp140826lfq;
        Tue, 6 Oct 2020 23:35:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7o3V282eTT7q3CgitDB/wayfvL/NXq8UcKYJpGDGizy0tBW9RY5HZJzK3KQge5W2LsaVu
X-Received: by 2002:a25:2313:: with SMTP id j19mr2342245ybj.190.1602052504705;
        Tue, 06 Oct 2020 23:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602052504; cv=none;
        d=google.com; s=arc-20160816;
        b=cQ5bTSMTqaU9Sgb0aAdgz6uxqCezPbwQhtzW2OHdK/UEON6gKH26vrsyvc5gRulr5J
         5oCJvZjDJCqRS86kZOJ8OJfqfanrB1JVVTniMl+873Y70WMsIojSGDkIBvARBkfabpBX
         X0cfah/NTRRYKSpIMn+d6rypjVsHwok6ZBSgnE+paC1d12G/vfZrDBiz3Ab5bvcOeJwt
         1nbGhRGQEq3G7VqbGbWEL8q43yCqgM8Sz3odhFn2Ts+XmYn8phNRAtI6TR068usrBctJ
         8Z+NGaEehwuRMKiRJwbt/63rHYUNNUVN+xxClN2ezbaul3yY2/0pzOAYvHLpzGACDEqN
         rqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=C4RnnhfPtfgPHY6vqDpE6JZAcJm+1iLW2lWdDf+ZsvY=;
        b=zT73CN8lE7T1m4T644y3X3GZdgT6u3cMs8d5UPscjw1FiVlzha5Diw6rWLUWys2RJC
         CD21P2fd5OpgkRr7B2/q2rwiXQit/IbzYcYC8TqIF/ACKphXKo9hq9DYlJBjO7TgAd3O
         o1NCZe55MPh2hwVA++k7XZlMOfI1xhncSWAiyrTI1729U2xMbKQBRhXfaH4zSPZ5fVSu
         LWqJR1I4dtZWTSQjEbBpiphXhDb44s6hGEq9q8kobnXBVnpePnltjsJ8Wp3f5HPPC8FG
         xi1KVmm9ZvQ27M4HWxIhPgh5o8YC1LLOcrI9IFpYgdk2djMBbyEPOvt5hI//XL9zAHCE
         48cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j66si1226624ybb.93.2020.10.06.23.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 23:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ32W-00071N-4x
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 02:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kQ31U-0006ZK-8W; Wed, 07 Oct 2020 02:34:00 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kQ31R-0004Fz-KQ; Wed, 07 Oct 2020 02:33:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.121])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 13BD062CDFF9;
 Wed,  7 Oct 2020 08:33:53 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 7 Oct 2020
 08:33:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00283e6032c-6ce9-4096-a9f9-397f3eefb726,
 A1FB6DEFD4FFF4B2E39ADAD8D1A9CF0B60FA0B96) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 0/9] 5p80: Add SFDP support
To: Joel Stanley <joel@jms.id.au>
References: <20200902093107.608000-1-clg@kaod.org>
 <CACPK8XdsX1hfNTw+Eb-=u2AXc8Ww5wVwU0mRnRo=p=d_VBTA0A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f01f9079-aa22-b84d-1b6d-681bbf410408@kaod.org>
Date: Wed, 7 Oct 2020 08:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdsX1hfNTw+Eb-=u2AXc8Ww5wVwU0mRnRo=p=d_VBTA0A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 357e581e-74ce-410d-912f-7b8db6d31a87
X-Ovh-Tracer-Id: 7012104623920614249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 01:59:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HE7TJXnQz/t0

On 10/7/20 3:43 AM, Joel Stanley wrote:
> On Wed, 2 Sep 2020 at 09:31, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello,
>>
>> JEDEC STANDARD JESD216 for Serial Flash Discovery Parameters (SFDP)
>> provides a mean to describe the features of a serial flash device
>> using a set of internal parameter tables. Support in Linux has been
>> added some time ago and the spi-nor driver is using it more often
>> to detect the flash settings and even flash models.
>>
>> This is the initial framework for the RDSFDP command giving access to
>> a private SFDP area under the flash.
>>
>> The patches available here :
>>
>>   https://github.com/legoater/qemu/commits/aspeed-5.2
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Joel Stanley <joel@jms.id.au>
> 
> Note that these need to be rebased on master; there are some minor conflicts.
> 
> These patches have proved essential in debugging a recent kernel
> regression. Thanks for adding this support Cédric.

We have been discussing offline with Francisco of a more subtle approach 
to reduce the size of the definitions of the SFDP tables. I agree that 
the current approach is brutal (and efficient :) but I haven't had time 
to take a close look at his proposal. See below.

    typedef struct SFDPSection {
        const uint32_t addr;
        const uint32_t size;
        const uint32_t wrap_sz;
        const uint8_t *data;
    } SFDPSection;
    
    #define SFDP_RAW(start_addr, vals...) \
    {                                     \
      .addr = start_addr,                 \
      .size = sizeof((uint8_t[]){vals}),  \
      .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_RAW_WRAP(start_addr, _wrap_sz, vals...) \
    {                                     \
      .addr = start_addr,                 \
      .size = sizeof((uint8_t[]){vals}),  \
      .wrap_sz = _wrap_sz,                \
      .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_TABLE_END() { 0 }
    #define IS_SFDP_END(x) (x.size == 0)
    
    #define M35T4545_WRAP_SZ 0x100
    
    static const SFDPTable m35t4545 = {
        SFDP_RAW_WRAP(0, M35T4545_WRAP_SZ,
                      0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
                      0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff),
    
        SFDP_RAW(0x38,
                 0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
                 0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
                 0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
                 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff),
    
        SFDP_TABLE_END()
    };
    
    uint8_t m25p80_sfdp_read(SFDPTable t, uint32_t addr)
    {
        if (t[0].wrap_sz) {
            addr &= (t.wrap_sz-1);
        }
    
        for (int i = 0; !IS_SFDP_END(t[i]); i++) {
            if (addr >= t[i].addr && addr < (t[i].addr + t[i].size)) {
                return t[i].data[addr];
            }
        }
        return 0xFF;
    }


The SFDP header (SFDP_RAW_WRAP) contains the list of the SFDP tables, 
the first being the BFPT at offset 0x30. It would be nice to be able 
to build the list in the header from the different table definitions.

C.


