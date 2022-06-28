Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2987657lft;
        Tue, 28 Jun 2022 00:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3lrubHBX7opy2Ga8t1PjMTJCf4vtcH6/eK6R1Q+pHBpk9xVh1eZ38bsu+N5gRXcTT/NmZ
X-Received: by 2002:a05:622a:1391:b0:304:eb9f:aee6 with SMTP id o17-20020a05622a139100b00304eb9faee6mr12259439qtk.365.1656402677793;
        Tue, 28 Jun 2022 00:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656402677; cv=none;
        d=google.com; s=arc-20160816;
        b=DfB+XV1Q4bOq84ymAVvVo+CV6zMfKgOEtKgTD31eHGqTavfAmQsXDxGagh5BTLEOO5
         neo3e0DfTokklrq6hqlxAKfD34iAIlNresCnB9KwfOUDLSkF/Z6jen35QPzWI5dk959t
         g1adOJR9alsEU0xI2eFAsiUDFXvbIj1TunsWkDLyNlDDkoKoyi77tU3AW1zw7G5ORBc/
         XoeDuzNqYFOWhsFsaIvxWnQpoVS2Z0k+JwMP94drGtVccROs0mmhsQBzPP6I/pjd74VF
         P2ZDV2J1oragewVGh5z7wGdDwEaEcN+wOYGdPZQ807+NmiU1VohS7YJzyF8pQGci7Xuu
         5TCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=WG+zFKIMKp0ieFMpNtvmcwjg5LQblxtiuRqklkQCMZU=;
        b=PSfrX7WxFmtywME0aSljuJHt143hsjc/wmG/NxLMvzBl6qO7Cx6nN/AlvOVre4D2eU
         fc/bNpZPxB0l9zEuJF/aXiUFg2HYvGVrX4Pqe+juj1CG0vKxENNgC73jFMDDahctPv9O
         cgYFmQfuhoHBY2nfDZ1ERy1SNJCDnY8DJFgeL8ZqrqKdP+fUafVr2vPMNTme5fB2nBF6
         LwuOcpSBAqDz0z9yo7N6LZvUrCxHWdSc8xgeSPsY7clzgEuzf0UtF80zQO1h5jLg9DPU
         UuiYGSP+rZf+jLKp7bm92eDBwkiVArFwncbkayFmixqT6k+5dJ7GuZjBv7CBi4RiL/LT
         oPIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ef8-20020a05620a808800b006af4ccad9c3si1039628qkb.549.2022.06.28.00.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 00:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o660D-0003pe-5p
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 03:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65EO-0003mQ-Nz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:01:54 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:33951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65E9-0008NP-5k
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:01:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E734F224F8;
 Tue, 28 Jun 2022 07:01:31 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 09:01:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001ebcb30b0-f10b-43ea-b361-d5d7ac12ff25,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <33f3769a-f1de-9cee-d5e7-6d342d8a579f@kaod.org>
Date: Tue, 28 Jun 2022 09:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 04/14] aspeed: i2c: Fix DMA len write-enable bit handling
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-5-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 77004652-3483-4726-b093-1b9fa8ed88e4
X-Ovh-Tracer-Id: 12054728830562372460
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeggffggfehjefgudefieeuffevheetjefgleeukefggeetgfffjeehtdfgjefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: rVOmh2T1sHUz

On 6/27/22 21:54, Peter Delevoryas wrote:
> I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
> seems to be because the Zephyr i2c driver sets the RX DMA len with the
> RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]
> 
> /* 0x1C : I2CM Master DMA Transfer Length Register   */
> 
> I think we should be checking the write-enable bits on the incoming
> value, not checking the register array. I'm not sure we're even writing
> the write-enable bits to the register array, actually.
> 
> [1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148
> 
> Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---

Nice. Can you move this patch at beginning of the series ?

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


>   hw/i2c/aspeed_i2c.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 2cfd05cb6c..6c8222717f 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                                                        RX_BUF_LEN) + 1;
>           break;
>       case A_I2CM_DMA_LEN:
> -        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
> -                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
> +        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
> +              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
>           /* If none of the w1t bits are set, just write to the reg as normal. */
>           if (!w1t) {
>               bus->regs[R_I2CM_DMA_LEN] = value;
>               break;
>           }
> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
> +        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
>               ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
>                                FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
>           }
> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
> +        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
>               ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
>                                FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
>           }

