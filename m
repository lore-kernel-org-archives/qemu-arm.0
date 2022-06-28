Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2988184lft;
        Tue, 28 Jun 2022 00:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYiwmyoiXjv96szYqUa6QbZjIr7vp7lhAYRgGnrdm/uXMTyW9QgG6XJkJs/XmeVZko04gF
X-Received: by 2002:ae9:e302:0:b0:6af:591:d9a1 with SMTP id v2-20020ae9e302000000b006af0591d9a1mr10754588qkf.39.1656402740482;
        Tue, 28 Jun 2022 00:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656402740; cv=none;
        d=google.com; s=arc-20160816;
        b=l0JfNkQ1isHMRDNYX+CgP+zJUrshzc9BEOtwUTaWVJslkswEm8SbFHvN47jb2qf7gj
         x4FZlmRShQFjt+L2tC7ajiYy5ykYth2XbrKC/rACj5YJQk7JpvoqEaSCc9gz60UuVY0q
         hmQmuKN6ya+tpiqQaPWdWXxkjZs1Gu/rtJ6/lMoqC5C1L3iu2VizyyGFa5UbHE/z6PpZ
         fwfwhy1sEgoNExpsS1hoHNJmwGBY66JoJMMDkB8lbVn+cG/zAgDaSLa5v4Wu4QSpFkzQ
         H7rgQlcEto4JsRMOgzfjDqr9nuQ3AG1Mo9DcmmpaatVXvPh/bokRKgdgy78SkwIJlYRw
         Q97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=SzA5yXy6irH7dpgOBJkWSfIrkcdHSvszn0zYXlmZqKY=;
        b=W4Frs8DzlL2H2EfHUblF3UmwvQNwSfcuHJuI5mI8Vp+MbM2HMCL/aPxOjGAV9kSZyk
         bmAx1y3G7mWHroSlJZjqQladVOoRXolor/kzcEsCH4Y2qLshugh1OYXCfCOooQkvzgcn
         9dbEbX+BClOPAxb++jhdxdsv2ay+oynqGRdeOk6qbSIEJBzRXUWgWQETWr1n45uQYJze
         1u7v5qZwxbGP7H/tkMX3lh0oCeHQJbWXKyQghQIW0+QHCBtp99dpWNfNJsdnLPSACMhH
         dbe2wNZx2ksxDKwVUKDggmeGdXN+G7ilk27NPb6rv8ofF/P8yEdCXqfxSHRAj6skABcZ
         HIZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt11-20020a05621427eb00b00456390f6fb9si6665738qvb.414.2022.06.28.00.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 00:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o661D-0007BI-TA
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 03:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Ee-0003s2-E0
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 03:02:08 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:57655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65EX-0008OZ-8X
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 03:02:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 279F421E4B;
 Tue, 28 Jun 2022 07:01:59 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 09:01:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005895c8957-2589-4808-bd0f-b90e3e8fd341,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f1fc9294-28c1-7f21-0e8d-c2b136eda497@kaod.org>
Date: Tue, 28 Jun 2022 09:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 05/14] aspeed: i2c: Fix R_I2CD_FUN_CTRL reference
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-6-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-6-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 97289f3b-4ba5-4942-91ee-3e739c656736
X-Ovh-Tracer-Id: 12062328654720043884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
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
X-TUID: +D3nlQuyhCPF

On 6/27/22 21:54, Peter Delevoryas wrote:
> Very minor, doesn't effect functionality, but this is supposed to be
> R_I2CC_FUN_CTRL (new-mode, not old-mode).
> 
> Fixes: ba2cccd64e9 ("aspeed: i2c: Add new mode support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---


Can you move this patch at beginning of the series ?

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



>   hw/i2c/aspeed_i2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 6c8222717f..6abd9b033e 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -552,7 +552,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                             __func__);
>               break;
>           }
> -        bus->regs[R_I2CD_FUN_CTRL] = value & 0x007dc3ff;
> +        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
>           break;
>       case A_I2CC_AC_TIMING:
>           bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;

