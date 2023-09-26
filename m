Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp779696ejc;
        Mon, 25 Sep 2023 18:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyHD+7yuqiEzBPSddY/slKQZnB+Q9qKOPc535wz4vQn609fbmCKikghsoBln5YprlnS/HL
X-Received: by 2002:a05:6214:3108:b0:658:3e27:9906 with SMTP id ks8-20020a056214310800b006583e279906mr8220653qvb.8.1695692274309;
        Mon, 25 Sep 2023 18:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695692274; cv=none;
        d=google.com; s=arc-20160816;
        b=WiMHglKt3I7n5fsQyAefgNE2Yf4uOKgYzmsQ3XCbe7r1qOhnLVYKxbGk8n7zgFFEy1
         e16sMJP5zQbnIdoqqeA3+YcdUV4dB4XEsfTwgG1++AHdwXYb0Qcfu+QA9dqg5UI/oZuM
         8t2T/qeJo+lxEbVm58Gp+ey8wHkwSVIJsK25jJPQ9LAO1sXRDeSV6JCgQtb8e2iV6N2S
         UzAY03stRw7D+fW/NFZKrhnGMnTj6AHmdIs68Amve7QIuzNW5yDBQiy35HImcgpjLwgq
         ISjk02//6VDeitr88Jkus0QN9+nSsMg5HulNypUHiLjCE6Y3dYAuFtNXwB/oZdOgEVYf
         GLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:cc:to:from:date:references:in-reply-to:message-id
         :mime-version:user-agent:feedback-id:dkim-signature:dkim-signature;
        bh=eUvlcQOeL9mF99Lo5KFrW+4n7j6hw7J0tfzp62MyVOQ=;
        fh=+gA9jmq04uwJLrSHowsFShYeFf1Ksy5P36d8S85GSkk=;
        b=F2yct+e9HjJCNE/A4/E26qloGq31iOz1JQXkL6yjel1CRW6eRtM1vakmoiXNU0N1Oc
         J7Mu8NEPYDQYlMJuf+JxY+i0uT6SWeOyJv8sRONiKQmkhBpp5NkHPajEB+2z74yzbMO5
         2ERCX3I04J0MJNhJyasHJtNEoEzjufj8GE/t2sBsB90Gso7tVA/8u9RBwSiKnUadyhwD
         c48S2c2DTGRJV6TlhLqyqhQrnHlOAG5zGnYfKitulhmvXnQj0b2ZVSttOXR4m4d40r17
         +LUa7WMdcQwU7kUiIJq64K5cYY+yfnfpwiRajC8XNIhM9/yUsc/q3hnuIOE9A/weljv7
         op4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=lEGV0Z91;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b="fZ/CEbi7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020ad4524c000000b0064f45b8c035si6526013qvq.374.2023.09.25.18.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 18:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=lEGV0Z91;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b="fZ/CEbi7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkx0w-0003DO-Io; Mon, 25 Sep 2023 21:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1qkx0v-0003Cv-6V; Mon, 25 Sep 2023 21:37:25 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1qkx0s-0002Hj-OQ; Mon, 25 Sep 2023 21:37:24 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 393FC5C02F1;
 Mon, 25 Sep 2023 21:37:21 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute6.internal (MEProxy); Mon, 25 Sep 2023 21:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1695692241; x=1695778641; bh=eUvlcQOeL9mF99Lo5KFrW+4n7j6hw7J0tfz
 p62MyVOQ=; b=lEGV0Z91zUMUYM7zywmM7LLyCJU0nJUm5F81/r4bFVbOXvcdLpf
 oKwjWgesMrP1+2CfefMKI48pcArX514/NdmwEZGRMHCbhFVHvH7xuWDKafJKHts5
 cK+F6RTN+lF6rbh0Gmf/Z7rxxiRvvYE1+X/kmYbtVR3md520jDfu8G3VgSHaQhTz
 eiqks8OoH23TvQPo0Qp+w6NIAcV3qirq7jgEIPwj3dX4sYhCZWnI/gbeCLGV3CK7
 TJ+V8Nu/Y4hfGjf1uqhn1ViYlR5ddwORXHGKPvQTZktsq+PGx8FRCF1tG2zdw1Ry
 f1aFYow/sw9lzld6gqiXcJ3veujpn0LvtQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1695692241; x=1695778641; bh=eUvlcQOeL9mF99Lo5KFrW+4n7j6hw7J0tfz
 p62MyVOQ=; b=fZ/CEbi7WTAKUBzQt8b/reoAngcsyb242jZovE87MTx6Unim1Bo
 z2O3y+C8JcwTK3JBhOBdYBTTGqbVGDtRqUt6Us9Qj2d8qziU3Cio3zuia+KwpwRM
 RLl3lCU+xDpnTqgZqkZyFeYSVQ0U5iPNYVn1eRoBS99ZhD4QBavaquV6s48K1/M3
 alTb/taH09yCEowt/ZMCN2S7EVIXl5pc40MWPM4FDDGNbYRRraOqsyib4nY6Wmkb
 Ymn/D7nIBroLnw3GiTy4T/OxNibQFo07dV0cZgPdl/brrHBOpdQ5n5o75TiIQ1HE
 aF4LsCtxjq/DWAQW+I2LrnWutcWx6FF6Klg==
X-ME-Sender: <xms:0TUSZWWOP1DqlC-IkymcTEuNVCd00B3KSE-TkyPDsgbQC-eqRFlQLw>
 <xme:0TUSZSl7EGg1vSY4Dz1VL7XLmBBYzGAguwzOhVcFk11PzhwcCgSINwN2r5X2PRM_W
 eNFvqHOj1tn2sC-bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
 ftrfgrthhtvghrnhepvdfhtdeiiedthfdtvddvteehteeludelleektdeiieektefhuddv
 vdelheetkeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
 rghu
X-ME-Proxy: <xmx:0TUSZaae1yyhBZ8_QXkzLc6-f-PPiHNoSF0oe_mziPwH-doOb5-wOA>
 <xmx:0TUSZdUcQ0r9Id4Sf_QXZwLxTZ_I5On3sEOgLki6YndByw3jVbtCzw>
 <xmx:0TUSZQlpGnHu6VmdcNuv9CXX5-XxX1aYMqPbWw3vs5PDOrpmrChKCA>
 <xmx:0TUSZVwuvH31LRD0Pfm3MRDMIhw9pHPnr9-AM3Hy98FPDaWAY_8edg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DE9741700089; Mon, 25 Sep 2023 21:37:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <6cae3846-3dea-49c4-a8ba-23c88647b0b0@app.fastmail.com>
In-Reply-To: <c23dd1d8-a037-ed8e-30bf-6824ca3649c4@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
 <d383d716-2c9a-4d37-a35d-6f62bff9bf1e@app.fastmail.com>
 <c23dd1d8-a037-ed8e-30bf-6824ca3649c4@kaod.org>
Date: Tue, 26 Sep 2023 11:07:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6mJv0n0gh80j



On Mon, 25 Sep 2023, at 18:50, C=C3=A9dric Le Goater wrote:
> On 9/25/23 09:54, Andrew Jeffery wrote:
>>=20
>>=20
>> On Fri, 22 Sep 2023, at 22:51, C=C3=A9dric Le Goater wrote:
>>> Joel, Andrew,
>>>
>>> On 5/25/19 17:12, C=C3=A9dric Le Goater wrote:
>>>> From: Joel Stanley <joel@jms.id.au>
>>>>
>>>> The Linux kernel driver was updated in commit 4451d3f59f2a
>>>> ("clocksource/drivers/fttmr010: Fix set_next_event handler) to fix =
an
>>>> issue observed on hardware:
>>>>
>>>>    > RELOAD register is loaded into COUNT register when the aspeed =
timer
>>>>    > is enabled, which means the next event may be delayed because =
timer
>>>>    > interrupt won't be generated until <0xFFFFFFFF - current_count=
 +
>>>>    > cycles>.
>>>>
>>>> When running under Qemu, the system appeared "laggy". The guest is =
now
>>>> scheduling timer events too regularly, starving the host of CPU tim=
e.
>>>>
>>>> This patch modifies the timer model to attempt to schedule the timer
>>>> expiry as the guest requests, but if we have missed the deadline we
>>>> re interrupt and try again, which allows the guest to catch up.
>>>>
>>>> Provides expected behaviour with old and new guest code.
>>>>
>>>> Fixes: c04bd47db6b9 ("hw/timer: Add ASPEED timer device model")
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> [clg: - merged a fix from Andrew Jeffery <andrew@aj.id.au>
>>>>           "Fire interrupt on failure to meet deadline"
>>>>           https://lists.ozlabs.org/pipermail/openbmc/2019-January/0=
14641.html
>>>>         - adapted commit log
>>>>         - checkpatch fixes ]
>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>> ---
>>>>    hw/timer/aspeed_timer.c | 59 ++++++++++++++++++++++-------------=
------
>>>>    1 file changed, 31 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>>>> index 5c786e512815..9ffd8e09f670 100644
>>>> --- a/hw/timer/aspeed_timer.c
>>>> +++ b/hw/timer/aspeed_timer.c
>>>> @@ -109,37 +109,40 @@ static inline uint64_t calculate_time(struct =
AspeedTimer *t, uint32_t ticks)
>>>>   =20
>>>>    static uint64_t calculate_next(struct AspeedTimer *t)
>>>>    {
>>>> -    uint64_t next =3D 0;
>>>> -    uint32_t rate =3D calculate_rate(t);
>>>> +    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> +    uint64_t next;
>>>>   =20
>>>> -    while (!next) {
>>>> -        /* We don't know the relationship between the values in th=
e match
>>>> -         * registers, so sort using MAX/MIN/zero. We sort in that =
order as the
>>>> -         * timer counts down to zero. */
>>>> -        uint64_t seq[] =3D {
>>>> -            calculate_time(t, MAX(t->match[0], t->match[1])),
>>>> -            calculate_time(t, MIN(t->match[0], t->match[1])),
>>>> -            calculate_time(t, 0),
>>>> -        };
>>>> -        uint64_t reload_ns;
>>>> -        uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> -
>>>> -        if (now < seq[0]) {
>>>> -            next =3D seq[0];
>>>> -        } else if (now < seq[1]) {
>>>> -            next =3D seq[1];
>>>> -        } else if (now < seq[2]) {
>>>> -            next =3D seq[2];
>>>> -        } else if (t->reload) {
>>>> -            reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECO=
ND, rate);
>>>> -            t->start =3D now - ((now - t->start) % reload_ns);
>>>> -        } else {
>>>> -            /* no reload value, return 0 */
>>>> -            break;
>>>> -        }
>>>> +    /*
>>>> +     * We don't know the relationship between the values in the ma=
tch
>>>> +     * registers, so sort using MAX/MIN/zero. We sort in that orde=
r as
>>>> +     * the timer counts down to zero.
>>>> +     */
>>>> +
>>>> +    next =3D calculate_time(t, MAX(t->match[0], t->match[1]));
>>>> +    if (now < next) {
>>>> +        return next;
>>>> +    }
>>>> +
>>>> +    next =3D calculate_time(t, MIN(t->match[0], t->match[1]));
>>>> +    if (now < next) {
>>>> +        return next;
>>>> +    }
>>>> +
>>>> +    next =3D calculate_time(t, 0);
>>>> +    if (now < next) {
>>>> +        return next;
>>>> +    }
>>>> +
>>>> +    /* We've missed all deadlines, fire interrupt and try again */
>>>> +    timer_del(&t->timer);
>>>> +
>>>> +    if (timer_overflow_interrupt(t)) {
>>>> +        t->level =3D !t->level;
>>>> +        qemu_set_irq(t->irq, t->level);
>>>>        }
>>>>   =20
>>>> -    return next;
>>>> +    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0)=
);
>>>
>>> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where=
 it comes
>>> from ? Thanks,
>>=20
>> The inner MAX() deals with the lack of ordering constraints between t=
he match values. I think the outer MAX() is redundant. We should probabl=
y remove it. The match member is type uint32_t so it can't be negative. =
You did steal that from an RFC patch :D
>
> I did ! Fixed there :
>
>   =20
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20230922155924.1=
172019-5-clg@kaod.org/
>

Thanks. That one might be further down in my review queue =F0=9F=98=85

Andrew
