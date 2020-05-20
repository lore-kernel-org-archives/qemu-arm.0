Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp297313lfb;
        Tue, 19 May 2020 23:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBWVWEnlvNEq+saNbQFfFOff1MlP4rxbq78x936rYSE7kFFaqzQbYl6aeY3ekn3qxMxmK0
X-Received: by 2002:a05:620a:951:: with SMTP id w17mr3329597qkw.371.1589957403263;
        Tue, 19 May 2020 23:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589957403; cv=none;
        d=google.com; s=arc-20160816;
        b=LQXD/lcbhzr8JIBD9ahLtLaNvxcfFsHT85+TQTUVjA/P1BG55ffu7KjFq5PMOqQqQL
         FoTnsos/XBkkvyn/xLpmmt0bI9dKUqY4tChiq11cgDjrqYWC/GhC1cAhFihp6esrWVGC
         5BvdQohDN5U9iP2vyhXz9pQiZPXW6RZSibQcq94Dm2hAl5W2daSUQoZBSFRS+PsFmXpc
         nMZ7EmbEMTafqjdWvcK2H1XL7i+yEECSVqmsuZpKAfEVe2C0amG1CoE9JyorZ+SllF+r
         27waVgLAsV7eEO1Lm+DFKRpR1OFG5MJHDcCwoI7jh8Z3PbjWMPsKOWGUG1PRR6tGKITb
         EuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=enWYZD75AO1ehX3bR2TjQ6Ri7YEcPJcTp55txvRW0VM=;
        b=JdL2NSn9vlQChxxkKu8r6Drc22jf9Bq0BmISlx2YCv/eR1p23JM5aOWcXg0so/5aPt
         ZRB4CbWJcyjcbHB2ynkp14ivCs1AxtACw/fnzFGTB/3vwGJRUR4097FIZMml+AqoAS62
         QOVy1ClsjCZMWbiTY/WqUUTY9i3Wii5z37yUuqBr5o4RZJut+/SluE4hPLFy8G8Gn4Sc
         HeRPjzgCdFqbD/oBqodlHOcgvNIcBW+hOBEGMLEIKgeYAdgbPy8krU3QXoQFZSI0lg2N
         XEg9q8O+7uTUSxOd9sku2jT29U28Kxz0UYH/Uc5TyBlpG/Fz1tANZlp55AzRzSWyYrgQ
         jliw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f39si933339qtb.174.2020.05.19.23.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 23:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbIYE-0001cF-Nv
	for alex.bennee@linaro.org; Wed, 20 May 2020 02:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jbIXy-0001bU-JT
 for qemu-arm@nongnu.org; Wed, 20 May 2020 02:49:46 -0400
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jbIXw-000161-V0
 for qemu-arm@nongnu.org; Wed, 20 May 2020 02:49:46 -0400
Received: from player799.ha.ovh.net (unknown [10.110.208.83])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4BCF41D6975
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 08:49:42 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 5AFD2128CAF35;
 Wed, 20 May 2020 06:49:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a1f800db-7aa4-47f4-b128-588218e7a4d5,208050372AC47BB4B8F4DF084FF080F941447DBD)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] arm/aspeed: Compute the number of CPUs from the SoC
 definition
To: Markus Armbruster <armbru@redhat.com>
References: <20200519091631.1006073-1-clg@kaod.org>
 <875zcrunn3.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a47b9601-22d3-b46d-67ed-943bcbc1c3a8@kaod.org>
Date: Wed, 20 May 2020 08:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <875zcrunn3.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15205559720638385107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.58.226; envelope-from=clg@kaod.org;
 helo=3.mo2.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:49:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKPpYTwrdxrK

On 5/20/20 8:27 AM, Markus Armbruster wrote:
> I figure this replaces my "[PATCH 05/24] aspeed: Don't create unwanted
> "cortex-a7-arm-cpu" devices".  Correct?
> 
> Let's mention it gets rid of unrealized CPUs then.  Let me try.
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Commit ece09beec457 ("aspeed: introduce a configurable number of CPU
>> per machine") was a convient change during bringup but the Aspeed SoCs
>> have a fixed number of CPUs : one for the AST2400 and AST2500, and two
>> for the AST2600.
> 
> Please add something like:
> 
>   When the configured number of CPUs is less than the SoC's fixed
>   number, the "unconfigured" CPUs are left unrealized.
> 
>> Remove the "num-cpu" property from the SoC state and use the fixed
>> number of CPUs defined in the SoC class instead. Compute the default,
>> min, max number of CPUs of the machine directly from the SoC class
>> definition.
> 
> Suggest to add:
> 
>   Visible in "info qom-tree"; here's the change for ast2600-evb:
> 
>      /machine (ast2600-evb-machine)
>        /peripheral (container)
>        /peripheral-anon (container)
>        /soc (ast2600-a1)
>          /a7mpcore (a15mpcore_priv)
>            /a15mp-priv-container[0] (qemu:memory-region)
>            /gic (arm_gic)
>              /gic_cpu[0] (qemu:memory-region)
>              /gic_cpu[1] (qemu:memory-region)
>     +        /gic_cpu[2] (qemu:memory-region)
>              /gic_dist[0] (qemu:memory-region)
>              /gic_vcpu[0] (qemu:memory-region)
>              /gic_viface[0] (qemu:memory-region)
>              /gic_viface[1] (qemu:memory-region)
>     +        /gic_viface[2] (qemu:memory-region)
>              /unnamed-gpio-in[0] (irq)
>              [...]
>     +        /unnamed-gpio-in[160] (irq)
>              [same for 161 to 190...]
>     +        /unnamed-gpio-in[191] (irq)
> 
>   Also visible in "info qtree"; here's the change for ast2600-evb:
> 
>      bus: main-system-bus
>        type System
>        dev: a15mpcore_priv, id ""
>          gpio-in "" 128
>     -    gpio-out "sysbus-irq" 5
>     -    num-cpu = 1 (0x1)
>     +    gpio-out "sysbus-irq" 10
>     +    num-cpu = 2 (0x2)
>          num-irq = 160 (0xa0)
>          mmio 0000000040460000/0000000000008000
>        dev: arm_gic, id ""
>     -    gpio-in "" 160
>     -    num-cpu = 1 (0x1)
>     +    gpio-in "" 192
>     +    num-cpu = 2 (0x2)
>          num-irq = 160 (0xa0)
>          revision = 2 (0x2)
>          has-security-extensions = true
>          has-virtualization-extensions = true
>          num-priority-bits = 8 (0x8)
>          mmio ffffffffffffffff/0000000000001000
>          mmio ffffffffffffffff/0000000000002000
>          mmio ffffffffffffffff/0000000000001000
>          mmio ffffffffffffffff/0000000000002000
>          mmio ffffffffffffffff/0000000000000100
>     +    mmio ffffffffffffffff/0000000000000100
>     +    mmio ffffffffffffffff/0000000000000200
>          mmio ffffffffffffffff/0000000000000200
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Patch looks good.
> 
> Preferably with an improved commit message:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> I'd like to pick your patch into v2 of my "Fixes around device
> realization".  May I amend your commit message as shown above?

Sure.

Thanks,

C.
