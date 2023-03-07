Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6153330ejc;
        Tue, 7 Mar 2023 08:38:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8LSRjfJ+gzgHLdV3LDde/dyNJ1jAJeXSGqgQ+5wLFS82NbeuCx3Kf7N+/qFpdjUa+7Y4H/
X-Received: by 2002:ac8:5f8b:0:b0:3b8:6d3a:5ed4 with SMTP id j11-20020ac85f8b000000b003b86d3a5ed4mr25639223qta.67.1678207105553;
        Tue, 07 Mar 2023 08:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678207105; cv=none;
        d=google.com; s=arc-20160816;
        b=cu+wk0ACvHL9V2C3Xi+A6JlRKohC9vPt/C8NN+p5H6+d7QmAeIe24QMM8JpUsSjjih
         xnbgqBVAvzChsObz2jHypL0t2dm9q3td4x1y1xjkfSeyoV7jTMZowvWvRdmIdNNl4U3v
         iYC60EDHblV1blDwVhVKddwOC/0aVXqptaFCPa/rFnmcMRnaR4emBcNgAdz5tCyiWeXM
         gIP2fOmIRzRgNfQBE4Cnd2huynzgIq+/41F6NsO3Ef0NCC/z7oxtPXSgLRMMMsfudsnh
         ny/sl49rHXaii0OgCDcvnsE4GNu4X5JASBvq0PniXQxCRNp5LR5jukNUtlM1dF/f+zy1
         TUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ioUZbq+3oB2yNDO1bgjEAObr5IvjBdpqAQxcTDjPFhs=;
        b=c2wxn3O7S6ZEXFWzzpr8wuYAW0yrneDRbPkohozzt/Iq9f9mFfwK1+WCfw97qSuhga
         R7ncKRK6yxbhzTzhQohfOPAR7MI8FdSKrCQPb5FYtDyoQhj60kh5KrHHSU6COR3vqIxn
         hLH5yC+jJCpD7qdQUh+KxHEkdeUeEQQJGm02FWheF52vPkufIv0cgsZjWVRn+2EyxwLm
         q/MckpS4lfFvgLz1mQQ9frjHh6iQVVRXhs6H1pMFP6TcusmyRZ9Ln5FOnoSyXyYM+36P
         2PS60nxfJvrggWA8MDS+ZRfJGUJ1xjgP7Am7YyTShqSo14w3iFq1va8XQz1ZgXlWzYlt
         krxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c67-20020ae9ed46000000b007426a245545si9605912qkg.173.2023.03.07.08.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 08:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZaK9-0007cJ-5J; Tue, 07 Mar 2023 11:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZaK7-0007aE-EK
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 11:37:59 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZaK5-0003Nq-Nx
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 11:37:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DF34D211D2;
 Tue,  7 Mar 2023 16:37:51 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 17:37:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00137bf3014-d49a-4b2d-9f0f-35ae05992ebc,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef54354e-f3c6-37a9-1ddd-42caca106b44@kaod.org>
Date: Tue, 7 Mar 2023 17:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 2/5] pflash: Fix blk_pread_nonzeroes()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230307155528.3655534-1-clg@kaod.org>
 <20230307155528.3655534-3-clg@kaod.org>
 <be44cfd0-d107-76a3-abe5-fba82d15a646@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <be44cfd0-d107-76a3-abe5-fba82d15a646@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 00ca6a21-b2ce-436c-bd50-87ee1f7e3e44
X-Ovh-Tracer-Id: 7520729905972612003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeikeehkeehheejgfffkeffveegleduffeiteejuefgfedtjeekgefgveffveeigfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpkhifohhlfhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-TUID: /6/SxnnU5bYX

On 3/7/23 17:22, Philippe Mathieu-Daudé wrote:
> On 7/3/23 16:55, Cédric Le Goater wrote:
>> From: Kevin Wolf <kwolf@redhat.com>
>>
>> Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
>> of reading directly from the root node of the BlockBackend, it reads
>> from its 'file' child node. This can happen to mostly work for raw
>> images (as long as the 'raw' format driver is in use, but not actually
>> doing anything), but it breaks everything else.
>>
>> Fix it to read from the root node instead.
>>
>> Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
> 
> You missed:
> 
> Tested-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> Fixes: a4b15a8b9e ("pflash: Only read non-zero parts of backend image")
> 
> by 3min:
> https://lore.kernel.org/qemu-devel/c5c82d88-df2a-e968-4d81-0da1cfa2ab09@maciej.szmigiero.name/


yes :) I waited for the CI to complete and didn't check my email before
sending. If I respin, I will fix.

C.


> 
>> Reported-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/block.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/block/block.c b/hw/block/block.c
>> index af0710e477..9f52ee6e72 100644
>> --- a/hw/block/block.c
>> +++ b/hw/block/block.c
>> @@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
>>               return ret;
>>           }
>>           if (!(ret & BDRV_BLOCK_ZERO)) {
>> -            ret = bdrv_pread(bs->file, offset, bytes,
>> -                             (uint8_t *) buf + offset, 0);
>> +            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
>>               if (ret < 0) {
>>                   return ret;
>>               }
> 

