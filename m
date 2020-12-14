Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2701646lfq;
        Mon, 14 Dec 2020 08:21:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzviUW21OJTVlsVQj6O8tiMVoReO5VoiJTZFVZUoCM5IrxubuhSxdJ0oJEsrwnBqrwUOrNV
X-Received: by 2002:a25:d44:: with SMTP id 65mr37109802ybn.260.1607962878351;
        Mon, 14 Dec 2020 08:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607962878; cv=none;
        d=google.com; s=arc-20160816;
        b=zLOZmKo1ZD/NlkYtPEjCtv1dhz410vyYNoW/lN+m4T1LyHgLe0swTnNuafkOw4BAZT
         AjekkgV5K8F5V4fqCypns4U86XzHk5LfaXAlPGCFLdvG5ioGcfpGQLPja/ZsFF9Hjpk6
         RbopusLXsEYM3jNZb8gouNd27FstHACj4tQxO3XnO/m0W3cW2GsnZgOrWl8EcZfowFID
         eaC6VdhMLhEH/BNYQThDNskySSwMDAEeFTFK2adGqLugRTSJz5L1c5L5H6x866CDpTZQ
         5jb+JoZf5RgzZASBGEh3R5Z7zVVk6+Ao7l3v9kPh5q1a2PSy/KvYbIu6eEerBTWk+RRB
         XATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyIU165AX2GxY4aGtpCSEudJnMqksPyH9EfdrIdS0wo=;
        b=A6e2z+A8JmLGvSnL1Jiy8DsOecCSh4NfmfRQ8V5Ap9Swww3UsndiES0hhXpdM7MY8q
         2rVV/el84mKxYDqmMtCEjN1jwjePArmJcvuDSTG8jKB5vq4wUODY+BW1Z16h/azoQ0fY
         9Vqy3f9Kh4q2hL/EpTNJhNl66QzVWL8OITw055jYwjP/EWb/PBzdWrMFbUbYKLQXI0kw
         DPKY4C4beSav7pKEtd/d7Mf4xD6PWyex50Nh+/QOVnwGV4Xmi7Fz/BexPnCyDXLBI1NQ
         /G5WOdLxXxhw5t7yEO17wnklBjjkqHXnZr0dRZpLwo1nF9QX/so6ahB9fezMqu6CtCRV
         bHUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jYVwRQl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e72si17318167ybb.173.2020.12.14.08.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 08:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jYVwRQl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1koqb7-0002em-Lw
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 11:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqab-0002dp-5h
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 11:20:47 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqaP-0005Vo-Ts
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 11:20:41 -0500
Received: by mail-ej1-x644.google.com with SMTP id b9so23332729ejy.0
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 08:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyIU165AX2GxY4aGtpCSEudJnMqksPyH9EfdrIdS0wo=;
 b=jYVwRQl2q8Wb1gtdfcH/iyy8zJWjBNP3UU9BX3nb88euvplUNtTWGAh3/yfWX/2izV
 3GiDlrJ7tepboVzVzzxRMGkKIAHobXKKKAk7zS8t7tMx5mtdgoMXgi+1FeIjYuhIMXNU
 THF3DiFR6uuVnHju1MiRxsl7UJ0Sr/xYKZyPuEXTkSeVImEg09Iq9NWbY2YZuacLYFh8
 OM9WFx6RTGExMxL7YZKr9CQL6Z2aM4GDwkYj7axac/nLgq3tlaxxjzfZkf0EmbwkEPhp
 JUrhYTvIFppkGOjvJsT/sCCoE2/gYx1UDZHfT7vWdNR4gxwhdO6TFaWFjJuq1ua+8Gsl
 DEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyIU165AX2GxY4aGtpCSEudJnMqksPyH9EfdrIdS0wo=;
 b=AaYf8hTI48eZ3kuNAg7WP5nV2oxfnhCM3V+Qu+FAdFbq4pn4/XBAdKeKLI78Hclaiy
 LCauaNRZa8yXrnFNlS8xtVJGhCBEPoxRloPnqAPlIt0f2UQzKMVsnb45uybU4P83xMPX
 nuadjtklkf4g9YjoRBqChtIgJyDYsakiWSuG6CuXtcuBWZD0yDAnSfyeY2Pt3xJOeSEl
 knn2F4uJqEQy2hmgfoqQeedcN4hZo3fYGIT4UVnVh4zaGe01t+JrV2YKthpZbFvRAxmB
 bgWEKNmPvrczqcdi1vKltWjHvfMyJr98ochAtZsg73dq67rL8mwMN6u9g34AbDlQzqTO
 Bwkg==
X-Gm-Message-State: AOAM530sd5bK7njqbrC7PZ7IGP0q/wgHFJhocvVBue7DGM9PWP0Z01To
 UzSTPS0FoGcasF6iF2YHAa8b6qWPlEVGmU2D0PGEpQ==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr23015276ejf.407.1607962829786; 
 Mon, 14 Dec 2020 08:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20201127071803.2479462-1-ganqixin@huawei.com>
 <20201127071803.2479462-2-ganqixin@huawei.com>
 <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
In-Reply-To: <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 16:20:18 +0000
Message-ID: <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZvd5tRyOu1P

On Mon, 14 Dec 2020 at 16:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 27 Nov 2020 at 07:19, Gan Qixin <ganqixin@huawei.com> wrote:
> >
> > When running device-introspect-test, a memory leak occurred in the a10_pit_init
> > function, so use ptimer_free() in the finalize function to avoid it.
> >
> > ASAN shows memory leak stack:
> >
> > Indirect leak of 288 byte(s) in 6 object(s) allocated from:
> >     #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
> >     #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
> >     #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
> >     #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
> >     #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
> >     #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
> >     #6 0xaaabf57415e8 in a10_pit_init /qemu/hw/timer/allwinner-a10-pit.c:278
> >     #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
> >     #8 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
> >     #9 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
> >     #10 0xaaabf5b94680 in aw_a10_init /qemu/hw/arm/allwinner-a10.c:49
> >     #11 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
> >     #12 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > ---
> > Cc: Beniamino Galvani <b.galvani@gmail.com>
> > ---
> >  hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
> > index f84fc0ea25..be211983b0 100644
> > --- a/hw/timer/allwinner-a10-pit.c
> > +++ b/hw/timer/allwinner-a10-pit.c
> > @@ -279,6 +279,16 @@ static void a10_pit_init(Object *obj)
> >      }
> >  }
> >
> > +static void a10_pit_finalize(Object *obj)
> > +{
> > +    AwA10PITState *s = AW_A10_PIT(obj);
> > +    int i;
> > +
> > +    for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
> > +        ptimer_free(s->timer[i]);
> > +    }
> > +}
> > +
> >  static void a10_pit_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > @@ -290,11 +300,12 @@ static void a10_pit_class_init(ObjectClass *klass, void *data)
> >  }
> >
> >  static const TypeInfo a10_pit_info = {
> > -    .name = TYPE_AW_A10_PIT,
> > -    .parent = TYPE_SYS_BUS_DEVICE,
> > -    .instance_size = sizeof(AwA10PITState),
> > -    .instance_init = a10_pit_init,
> > -    .class_init = a10_pit_class_init,
> > +    .name              = TYPE_AW_A10_PIT,
> > +    .parent            = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size     = sizeof(AwA10PITState),
> > +    .instance_init     = a10_pit_init,
> > +    .instance_finalize = a10_pit_finalize,
> > +    .class_init        = a10_pit_class_init,
> >  };
>
> Please don't make unrelated whitespace changes like this in a patch.
> We don't line up the assignments in this sort of struct -- this is
> deliberate, so that if a new line is added whose field name happens
> to be longer than those used already, the patch does not have to
> touch all the lines in the struct to maintain the formatting.
> Instead you get a readable diff where only the new line changes,
> not all the others.

Hmm. Having said that I see that the other 6 devices touched
by this series did use the line-up-the-assignments style.
Anyway, the style this device was using is the right one.

thanks
-- PMM
