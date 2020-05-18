Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2987729lfb;
        Mon, 18 May 2020 05:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIYwhnsPZBPpjDTc2q+tj3yGf2vxW6uL/LfQiSl5ZB8vvCpHLub2n5kY/lzPlLMXkuawjr
X-Received: by 2002:a37:5d6:: with SMTP id 205mr16303008qkf.105.1589804782181;
        Mon, 18 May 2020 05:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589804782; cv=none;
        d=google.com; s=arc-20160816;
        b=HIExIbGyEeXhGsNs75/HCs969r6DC1JXfNdQyeoEh2FM46pjJEkmOpPuVHumLg++8J
         //L8o6Erduiozk+LQ7AbwMc6bg0wokAlhPc/lSTXIyTP0ucPnxRu0a8/NRqWhnvAHe5c
         uqkFgYRhZvoeaBWojRE1IDq4auqJg6WIib1rnbXEOStLjZrx4eYQS0OVdfdQAfg6kmIL
         wHrxRtbEpeks6oaGxFPA4PD2HOFkhidkAa3oUlIb1EFFXeF4cbhyxUQIES6b0cxCbeQN
         P44K0vIH8JjtIOqJKnQIqgmRIzqQqFIB39A+ggOJQE7wmCnSX7uBH3QsvCcVe2HgMi4P
         NPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=8ZhSJYOjinVrE2hLI5WycUdLAxPHRJqi6EsEivgBELQ=;
        b=IDyG3tD+9JG9trR2jIn8RJCiNj/KYA0YbnUcAjzz3rWLcGp+A6fmuN+drrl42xVhFh
         VB5fKgTNnFDyibcZyq4Fyqg3xSqm299N3sSsJ5TbM03ALEYNd2L9qw5z9bNTqyb/E/SA
         rktyNlKKZHoU1Tp3gXqZXKaCHdssuOLVKF51j5Vzwb6sDCKvdWRSk1nHcKyyOChYkto9
         OoBXucZ8Pq6VHSoPd5PQLE3XRXDbo1ZJUx/Xdh/VThKXn/C5nBS23x2PYSpYSifPs8U1
         1bPmqiQnwp4rcceekFf6Hjc+y3Kh+FancODAGowZ+5qBs+0TcuqW+fT0W3d9whe8KZ25
         7I2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si5476417qkj.93.2020.05.18.05.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaeqb-0003i4-GU
	for alex.bennee@linaro.org; Mon, 18 May 2020 08:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaeow-00021d-0D
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:24:38 -0400
Received: from 13.mo1.mail-out.ovh.net ([178.33.253.128]:57410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaeot-0007i7-GD
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:24:37 -0400
Received: from player688.ha.ovh.net (unknown [10.110.171.49])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0C5BE1C16CE
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 14:24:32 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id CE9B512635C4A;
 Mon, 18 May 2020 12:24:10 +0000 (UTC)
Subject: Re: [PATCH 05/24] aspeed: Don't create unwanted "cortex-a7-arm-cpu"
 devices
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-6-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fbd7151f-159f-7568-77cb-7ce86f4948ba@kaod.org>
Date: Mon, 18 May 2020 14:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-6-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9115285646275480496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.253.128; envelope-from=clg@kaod.org;
 helo=13.mo1.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 08:24:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dnpkJG2fIOIq

On 5/18/20 7:03 AM, Markus Armbruster wrote:
> The number of CPUs is controlled by property "num-cpus".
> aspeed_soc_ast2600_init() creates the maximum supported number.
> aspeed_soc_ast2600_realize() realizes only the wanted number.  Works,
> although it leaves unrealized devices hanging around in the QOM
> composition tree.  Affects machines ast2600-evb and tacoma-bmc.
> 
> Make the init functions create only the wanted ones.  Visible in "info
> qom-tree"; here's the change for ast2600-evb:
> 
>      /machine (ast2600-evb-machine)
>        [...]
>        /soc (ast2600-a1)
>          [...]
>          /cpu[0] (cortex-a7-arm-cpu)
>            /unnamed-gpio-in[0] (irq)
>            /unnamed-gpio-in[1] (irq)
>            /unnamed-gpio-in[2] (irq)
>            /unnamed-gpio-in[3] (irq)
>     -    /cpu[1] (cortex-a7-arm-cpu)
>     -      /unnamed-gpio-in[0] (irq)
>     -      /unnamed-gpio-in[1] (irq)
>     -      /unnamed-gpio-in[2] (irq)
>     -      /unnamed-gpio-in[3] (irq)
>          /ehci[0] (platform-ehci-usb)
> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Joel, Andrew,

Shouldn't we enforce a default/min/max number of CPUs of 2 for the AST2600 ? 
That's the SoC definition. The fact it is configurable in the Aspeed model
was nice to have during bringup but we are now done.  

Thanks,

C.

> ---
>  hw/arm/aspeed_ast2600.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 0a6a77dd54..6ffa587a7f 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -287,6 +287,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>      }
> +    for (; i < sc->num_cpus; i++) {
> +        object_unparent(OBJECT(&s->cpu[i]));
> +    }
>  
>      /* A7MPCORE */
>      object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cpu",
> 

