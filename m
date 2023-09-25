Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp212609ejc;
        Mon, 25 Sep 2023 00:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpWafNDb1xiTc7kCveo4lkaihdosZjOz2LN8gV9Lm+QPuhFISJQGlM/rsRAlSGe6MqowMz
X-Received: by 2002:a05:620a:4083:b0:76f:6c6:f080 with SMTP id f3-20020a05620a408300b0076f06c6f080mr7034646qko.37.1695628522526;
        Mon, 25 Sep 2023 00:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695628522; cv=none;
        d=google.com; s=arc-20160816;
        b=m989SehIGqXAA2v5q9cPA4YskZhsBs79f/i/5VGxSpoXGdpWMIOsXan+bdIaQLCIyT
         RWB8BxZfPfIdbJtsABqP5QX5dFQHNFMcmIaEVVXNU79itWQ4WlruvOi9yB/id4f/MF3e
         WxT/JFNGXo22uXJReRgzE3B1I1qGMyxOGS+XcmcHsqJl4ri+ap1MT1lV5heWQs+oEa0u
         hO1xYY6LncHNErhMGny+rCIC7fj5AdDXI3QX5sMOY/aNQjTTiDRSibDFwN8IcNNS6Kux
         MzqDLN6EU5k4/8DqDs242n+BbXdecRE+kS1+/RkWE0AuJbK23+FRpvT4FlO2bEZYBb0s
         NSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:cc:to:from:date:references:in-reply-to:message-id
         :mime-version:user-agent:feedback-id:dkim-signature:dkim-signature;
        bh=jLNP+IiQeJxqe1bMZpnsjrykdz024eGbeU+AnS+VeGM=;
        fh=+gA9jmq04uwJLrSHowsFShYeFf1Ksy5P36d8S85GSkk=;
        b=coQsEkMnhi+vki6qvRGfcmctUGZv3Au8+vZyraMKH9qHo9mnYpx/Hsm8GSQEhiorYV
         RIA9zV5Or9C/ezsHsEKU+04wkmlTNBVLIQqL+0rJ5XRxTaK2cdy1XhBzHMftQbFOTBCL
         HdHIaviR9G4UKhf+IDOohCBUjAzmPgTFsypDcFCt+vWNz4Yd+dx2rUnhxbNTK9iHCxlp
         KSkbrvXOTqcR6hSH22L1UH+IzUJWYu5pBaZu85VAnFLrIeoFIYGU8deWT5K0u+FpDLUe
         PGMIG/0AH7Zg5dARwi2jIx2iWLHuUeS3gMDAlagU+Bm+RhOyPpu7d6f+OZDbph11v8rk
         zIig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=bjswqRtf;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=h1baGSFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs7-20020a05620a470700b0076c8f7e327bsi1816431qkb.775.2023.09.25.00.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 00:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=bjswqRtf;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=h1baGSFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkgR2-0004MP-L3; Mon, 25 Sep 2023 03:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1qkgR1-0004Lq-Md; Mon, 25 Sep 2023 03:55:15 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1qkgQz-0007R5-EN; Mon, 25 Sep 2023 03:55:15 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B9F35C269F;
 Mon, 25 Sep 2023 03:55:12 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute6.internal (MEProxy); Mon, 25 Sep 2023 03:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1695628512; x=1695714912; bh=jLNP+IiQeJxqe1bMZpnsjrykdz024eGbeU+
 AnS+VeGM=; b=bjswqRtfZB0RVfjG7MA01g4Pce+pftfwshddTnHrvZp+NBsqjP9
 rDWG4qMJD6VoCuoLyDIaWpJyxzZyl95LHJkBPzi7gV7xnWsKEuDiRVJY7Tbg7dih
 V81kQVAiW5lOW54D0sg2PNMnNb/05jawUpYiEsgcEwJ+IOqW9VbG88izMbWot6Jp
 T90bRI/BNFS7N2u3VKdYd5/Yn+fUW6VrKPQEW0AMnYvA98G7XVrl3KHU59Gq8+YI
 7HNqXSp7xCSfal3TnqZn3v3ND2kd7AYMETHGbC4g6T1y5jMJi6+yPjePeJKbV0/M
 fPYMqKsvao7fiTfsZGBxPG3H834TuKSRo5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1695628512; x=1695714912; bh=jLNP+IiQeJxqe1bMZpnsjrykdz024eGbeU+
 AnS+VeGM=; b=h1baGSFfFdvcbh9jCwHgECEB4N2bJQKVBzlYFkEo4hqw4S22s01
 naUadxdoVVf9XXKB204b+GO8r6kMtROMGun0NSYyYavaIBUoJ+UlNbvgb5iec4sp
 bYOUQPlqPAOWiTyub9VlZEwaYLRJn8eNDHCxrPK4EcwSDitU6/i/WFLNYCnXg4rg
 DwpL0BuYpwpw5VMVjfj6/yKs96OZHQPbCUG+Z2DyEHyvRn+cFOESb3TxTtqk7vBT
 7kFHybsDnM+/L1fZNns9osBbezhRK5HIHrQcrQdsmbRWBQ4Dp2sxUDUbC8dhmNGk
 gyvnU8R1JkAOzMQ7V53oJ4pLW+l9hmAb32w==
X-ME-Sender: <xms:3zwRZcCBlkozVh040oY1fhVtfeyviGXo_V0BNfyFcWLWXT7-wP50Ew>
 <xme:3zwRZejanV_-ir9UQfPOSJyxdDDjsJOtak09Lui_IPGKvVz5-n8y7Qhd_XDJ30eKY
 WYFIB1d8Fp4R8tw3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelfedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenuc
 ggtffrrghtthgvrhhnpedvhfdtieeitdfhtddvvdetheetleduleelkedtieeikeethfdu
 vddvleehteekueenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruh
X-ME-Proxy: <xmx:3zwRZfn8In5_ZO6MNX6tcbr3ItB3yaDLri7PuuoYCF0WOg1mEUxFiA>
 <xmx:3zwRZSzYnIzsSuuBtHjX0bItE-Ma_uGJR84WlPN1t81D1W4BS1aChg>
 <xmx:3zwRZRRX03UwebOfk2a2Xl7vhPfV42Ml8p3bMui9wYYoWeYMEyXCoQ>
 <xmx:4DwRZceyAjIuo67qAH1B7EqDlWMwvl6tkvzyOB_yyd0WOvOYOV9Z_w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3A0721700089; Mon, 25 Sep 2023 03:55:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <d383d716-2c9a-4d37-a35d-6f62bff9bf1e@app.fastmail.com>
In-Reply-To: <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
Date: Mon, 25 Sep 2023 17:24:49 +0930
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
Received-SPF: pass client-ip=66.111.4.27; envelope-from=andrew@aj.id.au;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-TUID: kW6O0kmT3d5c



On Fri, 22 Sep 2023, at 22:51, C=C3=A9dric Le Goater wrote:
> Joel, Andrew,
>
> On 5/25/19 17:12, C=C3=A9dric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>=20
>> The Linux kernel driver was updated in commit 4451d3f59f2a
>> ("clocksource/drivers/fttmr010: Fix set_next_event handler) to fix an
>> issue observed on hardware:
>>=20
>>   > RELOAD register is loaded into COUNT register when the aspeed tim=
er
>>   > is enabled, which means the next event may be delayed because tim=
er
>>   > interrupt won't be generated until <0xFFFFFFFF - current_count +
>>   > cycles>.
>>=20
>> When running under Qemu, the system appeared "laggy". The guest is now
>> scheduling timer events too regularly, starving the host of CPU time.
>>=20
>> This patch modifies the timer model to attempt to schedule the timer
>> expiry as the guest requests, but if we have missed the deadline we
>> re interrupt and try again, which allows the guest to catch up.
>>=20
>> Provides expected behaviour with old and new guest code.
>>=20
>> Fixes: c04bd47db6b9 ("hw/timer: Add ASPEED timer device model")
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [clg: - merged a fix from Andrew Jeffery <andrew@aj.id.au>
>>          "Fire interrupt on failure to meet deadline"
>>          https://lists.ozlabs.org/pipermail/openbmc/2019-January/0146=
41.html
>>        - adapted commit log
>>        - checkpatch fixes ]
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>   hw/timer/aspeed_timer.c | 59 ++++++++++++++++++++++----------------=
---
>>   1 file changed, 31 insertions(+), 28 deletions(-)
>>=20
>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>> index 5c786e512815..9ffd8e09f670 100644
>> --- a/hw/timer/aspeed_timer.c
>> +++ b/hw/timer/aspeed_timer.c
>> @@ -109,37 +109,40 @@ static inline uint64_t calculate_time(struct As=
peedTimer *t, uint32_t ticks)
>>  =20
>>   static uint64_t calculate_next(struct AspeedTimer *t)
>>   {
>> -    uint64_t next =3D 0;
>> -    uint32_t rate =3D calculate_rate(t);
>> +    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    uint64_t next;
>>  =20
>> -    while (!next) {
>> -        /* We don't know the relationship between the values in the =
match
>> -         * registers, so sort using MAX/MIN/zero. We sort in that or=
der as the
>> -         * timer counts down to zero. */
>> -        uint64_t seq[] =3D {
>> -            calculate_time(t, MAX(t->match[0], t->match[1])),
>> -            calculate_time(t, MIN(t->match[0], t->match[1])),
>> -            calculate_time(t, 0),
>> -        };
>> -        uint64_t reload_ns;
>> -        uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> -
>> -        if (now < seq[0]) {
>> -            next =3D seq[0];
>> -        } else if (now < seq[1]) {
>> -            next =3D seq[1];
>> -        } else if (now < seq[2]) {
>> -            next =3D seq[2];
>> -        } else if (t->reload) {
>> -            reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECOND=
, rate);
>> -            t->start =3D now - ((now - t->start) % reload_ns);
>> -        } else {
>> -            /* no reload value, return 0 */
>> -            break;
>> -        }
>> +    /*
>> +     * We don't know the relationship between the values in the match
>> +     * registers, so sort using MAX/MIN/zero. We sort in that order =
as
>> +     * the timer counts down to zero.
>> +     */
>> +
>> +    next =3D calculate_time(t, MAX(t->match[0], t->match[1]));
>> +    if (now < next) {
>> +        return next;
>> +    }
>> +
>> +    next =3D calculate_time(t, MIN(t->match[0], t->match[1]));
>> +    if (now < next) {
>> +        return next;
>> +    }
>> +
>> +    next =3D calculate_time(t, 0);
>> +    if (now < next) {
>> +        return next;
>> +    }
>> +
>> +    /* We've missed all deadlines, fire interrupt and try again */
>> +    timer_del(&t->timer);
>> +
>> +    if (timer_overflow_interrupt(t)) {
>> +        t->level =3D !t->level;
>> +        qemu_set_irq(t->irq, t->level);
>>       }
>>  =20
>> -    return next;
>> +    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>
> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where i=
t comes
> from ? Thanks,

The inner MAX() deals with the lack of ordering constraints between the =
match values. I think the outer MAX() is redundant. We should probably r=
emove it. The match member is type uint32_t so it can't be negative. You=
 did steal that from an RFC patch :D

Andrew
