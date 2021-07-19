Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3965697lfc;
        Mon, 19 Jul 2021 08:54:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfVDLHRZJYXsTC4z11BIH4IIvSteuGgNZ9Esx7fuKlClIT8D6RN3tUgdLKm/1PZCCQ9Eyi
X-Received: by 2002:ad4:576b:: with SMTP id r11mr25358408qvx.28.1626710090776;
        Mon, 19 Jul 2021 08:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626710090; cv=none;
        d=google.com; s=arc-20160816;
        b=C2YRqOgCfn1YCzwFMGNctt+HeplcP4PlbLcLpCJt7/A95QrHLJ8kIdxXi3tbDUeKKu
         imVdi49fEObch+a2ram80nx5SRwotfOGp8LCwLj5Oq8XtuEoaCFKJMb3BsST/ZymGGm2
         0ptBdTONFUKJ1yGCW9tKjpKcmFxNFNPEws0gXyuWN9Vw5mQOILOr7RDT9QwTrzjvYgSA
         oyCwCgyTvhtsazgPGQyYitZxyAxL+Wdw70xzhkP7rOdR0LPu+DCTwC+A6rnvDlKi82Ji
         AX7N203Py7u/+eNznYAzXlGEirAInT2JgkFbHWeCUul3WYl9I6HQdDhYaC6o4Yn56d84
         VKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mPQqKJz1Igq3W3k5hZBa82HmK/scaJ5Z3Ga2MdkpxuU=;
        b=hfhn9LTInD/cujb2BbOjuy7CQTkf5vheC9SSgRo3knbrPaxpIJpb+QyFwUdYB3X7es
         JaXf/wWvDHJZqMXUtjAEQIV1Bn7uh1qrRbSE7GIzI5c4L4ko6XRbokIvi6hjVrUtiocM
         YxuVJwFY+EKfgO4v79xRprwnp1qwKcZz+fVkTz4Uzy3Z0CV1Ac+/CUg0wwosGt/7xqyA
         Jc9VZW6MErR94d0rNSN/aq7NTHxo6Kn6l5Z48u0+gKYSZ/EvMjIHsOaTlnEPDwfrHfrX
         Yhh4rQZ8+7V1MDrBtrxxpFtEexCYXg5oF+bubW9chZsZHD6X2wNX+C/AEe9YgdOyXYmG
         nDJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si132012qko.145.2021.07.19.08.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 08:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5VbW-0002uW-3N
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 11:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5VbF-0002sF-HK; Mon, 19 Jul 2021 11:54:33 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:37959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5VbD-0000Ie-TC; Mon, 19 Jul 2021 11:54:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id B9E21141550;
 Mon, 19 Jul 2021 15:54:28 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 19 Jul
 2021 17:54:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003338d0860-5698-44f6-88f9-8bde95653a14,
 5C81DEF932CE68F5B4ADF8C6EB3FE0DC56E33E11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 2/2] watchdog: aspeed: Fix sequential control writes
To: Andrew Jeffery <andrew@aj.id.au>, <qemu-devel@nongnu.org>
References: <20210709053107.1829304-1-andrew@aj.id.au>
 <20210709053107.1829304-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bc2b4ddc-5b50-94eb-c137-c719019cd581@kaod.org>
Date: Mon, 19 Jul 2021 17:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709053107.1829304-3-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3c9c5b80-cbf5-4cf4-abc9-9f81b8f99117
X-Ovh-Tracer-Id: 11543851747007761315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Q+jVrPqiXMh

On 7/9/21 7:31 AM, Andrew Jeffery wrote:
> The logic in the handling for the control register required toggling the
> enable state for writes to stick. Rework the condition chain to allow
> sequential writes that do not update the enable state.
> 
> Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/watchdog/wdt_aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index faa3d35fdf21..69c37af9a6e9 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>          } else if (!enable && aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] = data;
>              timer_del(s->timer);
> +        } else {
> +            s->regs[WDT_CTRL] = data;
>          }
>          break;
>      case WDT_RESET_WIDTH:
> 

