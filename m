Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2357059lfy;
        Thu, 6 Aug 2020 23:20:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/dK6yi2/ZsLRUdcNgq6uPWRhNithNM2ySTnpZ6AM9S8LD5+Tdfd3vwVkMo4Ncq9XXGjfx
X-Received: by 2002:a25:d258:: with SMTP id j85mr18598444ybg.523.1596781204732;
        Thu, 06 Aug 2020 23:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596781204; cv=none;
        d=google.com; s=arc-20160816;
        b=GHamHJZQ1QX7CXT1EKMqzrp/ZKFqCNBQxbHnLq5i/E71Ov1DB/BB9m2afwxDCxswa2
         /wcBzhJ3xtyWKxBD9yTvK/ilw9v49eNa5nKFoWIyWkJAa5hLT5va+gvZr/exhHQVlZEI
         gVsEq251gyfjTqJlTeckSC4DZxAjxQFkfzIh2C2EMgR5bJXunNcE0//o7itQ8ldiTGWp
         DWKVtt7CBSuEyY+fqGmvECTrFxsbYXNAy9Uj4agolG47SdgZN0cgpxm4MbDtDZzYVgSL
         BAXXdaP/aGcJd6TThndTRJ77iX7zaj88j8wM9z9c5sCb/yJRtAwbhTnffIgfcjJn3SAB
         ogRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=etBFxVZ7/7mthW8CzVQQz+DsKwRaOeMt8XyqS1+/54c=;
        b=vhk3OsXzfjeNg+J0G/GsXw48ZEQJ/DU1TkU5rSx/AqYoZ2H/BNs8Ok6fNIlej+VpY/
         GESa6Bd8/jfYuKyAEOOSpuWXuFce/vq0JZhshxBr+MD5sky3urWtUyTPq/4t42V3QbWA
         i6mJ5n31faRsszkET8bI0WOM/GuduVTD66x4Kcdl+iCWtKDU5yOxOWQ+GWQm8MeE5dBN
         xcl1JTEhLTexR11IEpqkCgOF37OydfGFtk6ClqiBoaTz7FUmXPY6OZ46kxvEeNlCdupi
         GhksYKS/z/AwmwPhRFtWfTmK80GSQKBayMVpjono+HNTeA3R8RBdFcHbJAfv/3BnEOf2
         e5sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si7180860ybe.452.2020.08.06.23.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 23:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3vjY-0003Rh-3Q
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 02:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3vjP-0003RM-Tj; Fri, 07 Aug 2020 02:19:55 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3vjN-0004fC-6r; Fri, 07 Aug 2020 02:19:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id A0BEE549DB71;
 Fri,  7 Aug 2020 08:19:35 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 7 Aug 2020
 08:19:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0031770960b-1a96-47b8-a0a0-7a5bd0e392d1,
 9C6B65F6CFD3D723D723CC07BEDAC6F805E88D1E) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-5.2 12/19] ftgmac100: Change interrupt status when a
 DMA error occurs
To: Joel Stanley <joel@jms.id.au>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-13-clg@kaod.org>
 <CACPK8XdUOhLVDxjBJoAZmOxGafsHhajyhb1jXiVvY8BqqTxNQw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <82b357f3-c3b9-d3b7-fd1c-aea7173113c7@kaod.org>
Date: Fri, 7 Aug 2020 08:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdUOhLVDxjBJoAZmOxGafsHhajyhb1jXiVvY8BqqTxNQw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 642ac7b9-7b9a-4e1d-82c1-4b7f04ecfecc
X-Ovh-Tracer-Id: 17471433281763445542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:59:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qE6ErJKCb0e1

On 8/7/20 1:51 AM, Joel Stanley wrote:
> On Thu, 6 Aug 2020 at 13:21, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The model uses today the "No transmit buffer unavailable" interrupt
>> status which it is not appropriate. According to the Aspeed specs, no
>> interrupts are raised in that case. An "AHB error" status seems like a
>> better modeling choice for all implementations since it is covered by
>> the Linux kernel.
> 
> The datasheet calls it this:
> 
>  NPTXBUF UNAVA: Normal priority transmit buffer unavailable
> 
> Perhaps we should say this:
> 
> The model uses today the "Normal priority transmit buffer unavailable"
> interrupt status which is not appropriate.

done.

> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks,

C.
 
>>
>> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/net/ftgmac100.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 5c0fe2d8cb75..014980d30aca 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -517,7 +517,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>>          if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
>>              qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0x%x\n",
>>                            __func__, bd.des3);
>> -            s->isr |= FTGMAC100_INT_NO_NPTXBUF;
>> +            s->isr |= FTGMAC100_INT_AHB_ERR;
>>              break;
>>          }
>>
>> --
>> 2.25.4
>>

