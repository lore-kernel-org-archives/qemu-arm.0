Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3896027lfm;
        Tue, 23 Jun 2020 01:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSFQdiVY65llYI3ss5xqq3hiEYNZNUOb9jLpcjhhyuzhwpSwhu+PiOSaxvkc485G+1zFk8
X-Received: by 2002:a25:a443:: with SMTP id f61mr33008685ybi.225.1592900102211;
        Tue, 23 Jun 2020 01:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592900102; cv=none;
        d=google.com; s=arc-20160816;
        b=PwBoZThj4asqbFRsQxry9qgitpxuXcjwdcwMcT1YNpnSaFVts6h6g6p8tLxGEkeyeJ
         vJgHloKYTvnwMrioJi1gKjR79gPny3CGM38gDNO4rfdIpHLoY3EVxS7KQW1+uzy+FXet
         h1XPBwRP5+/PWI4guuuEFJsv8zIlkqMWsFWfkO4FErm89qVFfmFqglWkp6UdNJoU0Brz
         9T2xZJG95Kgz7uWgfyrzsz/0U45tK7N9fyXi93olR/T2rmdh8mcXrxzpRU3RAn9V0/Ju
         svaWzwbi8S6b9BvsowwsX2fpPO/5ol3T82UmLSP+GiL3ubLnentxA7ofoXgLC827O6zm
         m1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=3P6eqhBwNSfNs0/DhRGtLuQl6SC7AInyf3qPC0S3zMs=;
        b=jSYrASQxCIQ6pkJr3smRGth30cDF59ZncC4Onqm3r+k8WQyd/NynQu7zuMTOSr9YHS
         FyLjpyA96RK13bNX+YRF/CfwQpU/RXrjbUjxnXwd8LJGSq2mXOuu1P5afTxbR2bNGLiV
         r0Er3rnPtQAD616/UrM1w8JSI6BS/TWLapXGvuzNWatMgPaWgobCy0w6h5OC4y1qOBSv
         1wihBLie2I8Z7McGfyyw40/sPN/ks2oL88uk7qCyeQfrYdBN6v794rZLTHiyw/9NZawZ
         U1tH1aRX4ZkgCeF7Wp8M6xsqdg0QG7zIGaBg90rFxNilTheeOCtXPgTI02w7kim/6A84
         hwRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si16567389ybl.37.2020.06.23.01.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 01:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jne57-0001CX-Hu
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 04:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jne4z-00019P-OU
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:14:53 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:40231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jne4x-0005uk-OH
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:14:53 -0400
Received: from player728.ha.ovh.net (unknown [10.110.208.183])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 163231712C4
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 10:14:48 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 7BB2F138E9B3C;
 Tue, 23 Jun 2020 08:14:40 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002dc86aef1-dfda-4ef9-86ed-df1d4e2690f6,EED1DA90FC9B795DFFB5AB62ED4F19E3D36D96F8)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v6 0/9] hw/misc/pca9552: Trace GPIO change events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200623072723.6324-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ff9aec64-419c-330c-bbd3-3b04be70eadd@kaod.org>
Date: Tue, 23 Jun 2020 10:14:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623072723.6324-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13400460694721760171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekgedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejleduuedvgfefteeftdeikeeutdffgeetvdetgfeuteeghffgueejtdeujeegveenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.41.146; envelope-from=clg@kaod.org;
 helo=1.mo68.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 04:14:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EEisCGnPkJcp

On 6/23/20 9:27 AM, Philippe Mathieu-Daudé wrote:
> This series add trace events to better display GPIO changes.
> We'll continue in the following series by connecting LEDs to
> these GPIOs.
> 
> This helps me to work on a generic LED device, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg711917.html


Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> 
> Since v5, addressed Cédric review comment:
> - Move pin_count check from realize() to instance_init()
> 
> Since v4: Addressed Cédric review comments
> - Extract PCA955xClass
> - Add/use pca955x_pins_get_status() method instead of keeping
>   cached value in PCA955xState
> 
> Example when booting an obmc-phosphor-image, we can see the LED #14
> (front-power LED) starting to blink.
> 
> - ASCII LED bar view:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace pca955x_gpio_status
>   1592689902.327837:pca955x_gpio_status pca-unspecified GPIOs 0-15 [*...............]
>   1592689902.329934:pca955x_gpio_status pca-unspecified GPIOs 0-15 [**..............]
>   1592689902.330717:pca955x_gpio_status pca-unspecified GPIOs 0-15 [***.............]
>   1592689902.331431:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****............]
>   1592689902.332163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*..]
>   1592689902.332888:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........**.]
>   1592689902.333629:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690032.793289:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
>   1592690033.303163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690033.812962:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
>   1592690034.323234:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690034.832922:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
> 
> - Only display GPIOs which status changes:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace pca955x_gpio_change
>   1592690552.687372:pca955x_gpio_change pca1 GPIO id:0 status: 0 -> 1
>   1592690552.690169:pca955x_gpio_change pca1 GPIO id:1 status: 0 -> 1
>   1592690552.691673:pca955x_gpio_change pca1 GPIO id:2 status: 0 -> 1
>   1592690552.696886:pca955x_gpio_change pca1 GPIO id:3 status: 0 -> 1
>   1592690552.698614:pca955x_gpio_change pca1 GPIO id:13 status: 0 -> 1
>   1592690552.699833:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
>   1592690552.700842:pca955x_gpio_change pca1 GPIO id:15 status: 0 -> 1
>   1592690683.841921:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
>   1592690683.861660:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
>   1592690684.371460:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
>   1592690684.882115:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
>   1592690685.391411:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
>   1592690685.901391:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
> 
> For information about how to test the obmc-phosphor-image, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg712911.html
> 
> $ git backport-diff -u v5
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/9:[----] [--] 'hw/i2c/core: Add i2c_try_create_slave() and i2c_realize_and_unref()'
> 002/9:[----] [--] 'hw/misc/pca9552: Rename 'nr_leds' as 'pin_count''
> 003/9:[----] [--] 'hw/misc/pca9552: Rename generic code as pca955x'
> 004/9:[0010] [FC] 'hw/misc/pca9552: Add generic PCA955xClass, parent of TYPE_PCA9552'
> 005/9:[0007] [FC] 'hw/misc/pca9552: Add a 'description' property for debugging purpose'
> 006/9:[----] [--] 'hw/misc/pca9552: Trace GPIO High/Low events'
> 007/9:[----] [-C] 'hw/arm/aspeed: Describe each PCA9552 device'
> 008/9:[----] [--] 'hw/misc/pca9552: Trace GPIO change events'
> 009/9:[0003] [FC] 'hw/misc/pca9552: Model qdev output GPIOs'
> 
> Based-on: <20200623072132.2868-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (9):
>   hw/i2c/core: Add i2c_try_create_slave() and i2c_realize_and_unref()
>   hw/misc/pca9552: Rename 'nr_leds' as 'pin_count'
>   hw/misc/pca9552: Rename generic code as pca955x
>   hw/misc/pca9552: Add generic PCA955xClass, parent of TYPE_PCA9552
>   hw/misc/pca9552: Add a 'description' property for debugging purpose
>   hw/misc/pca9552: Trace GPIO High/Low events
>   hw/arm/aspeed: Describe each PCA9552 device
>   hw/misc/pca9552: Trace GPIO change events
>   hw/misc/pca9552: Model qdev output GPIOs
> 
>  include/hw/i2c/i2c.h      |   2 +
>  include/hw/misc/pca9552.h |  16 +--
>  hw/arm/aspeed.c           |  13 ++-
>  hw/i2c/core.c             |  18 +++-
>  hw/misc/pca9552.c         | 216 ++++++++++++++++++++++++++++----------
>  hw/misc/trace-events      |   4 +
>  6 files changed, 202 insertions(+), 67 deletions(-)
> 

