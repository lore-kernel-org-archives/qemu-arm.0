Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3862099lfb;
        Tue, 19 May 2020 02:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw49VXPS9bWXEPih/KZcdjy8+FFA0msfmu8keHjFKk2Dnk1g6FzPsJYwXWVbLr1FPf1MaWT
X-Received: by 2002:a05:620a:1316:: with SMTP id o22mr19072109qkj.422.1589880986841;
        Tue, 19 May 2020 02:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589880986; cv=none;
        d=google.com; s=arc-20160816;
        b=Re83V89QlhSa9qJbgdkncJiuFjmadlWninT40odAPfG8Lymyv61+dCe4PqhZeY+6cu
         9FSA6CyjgsD5l3M7TBYBOmhXji5Pgw7xz7KGGDIjhGiSEoC5UljV78i3VUfJGvIhOWjJ
         W4z9BkUFH/eEahB5NgyMVbvOhOFl1RNcdKK5VbGQt6NX+oMq2Nn8WpPBphUnYnMp//Dc
         v4aS05cnqMvibqdiWAoTRwTLjdmv1xy29s8QCoPKhp8asCJOVea51AhGq9kjbm1t0rei
         pVJ2fbobfBQnI7YmNu4xNafAXJ54XA1uVXJ+dm3VZQ341pSLIkqg4bpWYb59t5WUwCkq
         XcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=DZDqZMh6xHsVLTySbcxeuWSCRMA58VzFbYs7YNk8rKY=;
        b=wFG4j4Yt08A8+AYFC6tk97zc3evKt2lT5SjQYw7T1Zo4WKuziiXPuvrVlDsgRqMC1N
         0LsCi/Efxs1X9Du6VJQ8HIif3sTtVLQQThPlWS7sW7qyVzXbWb7W3qeadvQwORLdKn+A
         54BQiVTXp0V3nWEvVhdx69vwa6/ld6nLf9nV0CovQgyDe3xVlaMFWCtm6tke1rxDFrwI
         gNcoXpniPj00Xz9kyDc1itg/LC0hPIOTWNm431EjlBVhx8iEB0VmnIuSYEvdiuf5BJAg
         ZvwsKWBwa8HWxNQGwtVh4Orm6FC78CRE5zNDdEDfvrMFA5gpeB35+NCoZiGxqb/RFndq
         1nMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t58si2358007qte.129.2020.05.19.02.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 02:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jayfi-0005oz-Bl
	for alex.bennee@linaro.org; Tue, 19 May 2020 05:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jayf8-0005Pt-1f
 for qemu-devel@nongnu.org; Tue, 19 May 2020 05:35:50 -0400
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:53303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jayf6-0007gU-UB
 for qemu-devel@nongnu.org; Tue, 19 May 2020 05:35:49 -0400
Received: from player789.ha.ovh.net (unknown [10.110.208.131])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 412A91654DE
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 11:35:46 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 1825F1289D8FE;
 Tue, 19 May 2020 09:35:35 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056ebaf816-57fe-41d9-80f3-70ed41fbb63f,3DCE2E61E2D7C1BA27EF92566E0C35A5904F621F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 05/24] aspeed: Don't create unwanted "cortex-a7-arm-cpu"
 devices
To: Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-6-armbru@redhat.com>
 <fbd7151f-159f-7568-77cb-7ce86f4948ba@kaod.org>
 <CACPK8Xf+Qf0BkOiDWj_wKXT-yF+2N0Ton01Nq7Xm5yie+fqqwA@mail.gmail.com>
 <87r1vg5vep.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <802f4237-8e2b-e322-a7ba-24ec33d7b99d@kaod.org>
Date: Tue, 19 May 2020 11:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87r1vg5vep.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12137482472405240782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.250.56; envelope-from=clg@kaod.org;
 helo=10.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 05:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vEAd4WtGfpxe

On 5/19/20 7:46 AM, Markus Armbruster wrote:
> Joel Stanley <joel@jms.id.au> writes:
> 
>> On Mon, 18 May 2020 at 12:24, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 5/18/20 7:03 AM, Markus Armbruster wrote:
>>>> The number of CPUs is controlled by property "num-cpus".
>>>> aspeed_soc_ast2600_init() creates the maximum supported number.
>>>> aspeed_soc_ast2600_realize() realizes only the wanted number.  Works,
>>>> although it leaves unrealized devices hanging around in the QOM
>>>> composition tree.  Affects machines ast2600-evb and tacoma-bmc.
>>>>
>>>> Make the init functions create only the wanted ones.  Visible in "info
>>>> qom-tree"; here's the change for ast2600-evb:
>>>>
>>>>      /machine (ast2600-evb-machine)
>>>>        [...]
>>>>        /soc (ast2600-a1)
>>>>          [...]
>>>>          /cpu[0] (cortex-a7-arm-cpu)
>>>>            /unnamed-gpio-in[0] (irq)
>>>>            /unnamed-gpio-in[1] (irq)
>>>>            /unnamed-gpio-in[2] (irq)
>>>>            /unnamed-gpio-in[3] (irq)
>>>>     -    /cpu[1] (cortex-a7-arm-cpu)
>>>>     -      /unnamed-gpio-in[0] (irq)
>>>>     -      /unnamed-gpio-in[1] (irq)
>>>>     -      /unnamed-gpio-in[2] (irq)
>>>>     -      /unnamed-gpio-in[3] (irq)
>>>>          /ehci[0] (platform-ehci-usb)
>>>>
>>>> Cc: "Cédric Le Goater" <clg@kaod.org>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: Andrew Jeffery <andrew@aj.id.au>
>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>> Cc: qemu-arm@nongnu.org
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> Joel, Andrew,
>>>
>>> Shouldn't we enforce a default/min/max number of CPUs of 2 for the AST2600 ?
>>> That's the SoC definition. The fact it is configurable in the Aspeed model
>>> was nice to have during bringup but we are now done.
>>
>> Agreed, we want there to always be two CPUs for the 2600.
> 
> Follow-up patch welcome!

I just sent a patch on this topic.

C.
 

