Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5675015eje;
        Mon, 17 Jul 2023 05:45:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH99d0HQZ+i4kjBTIkOryyuIe52O3J5rW1X13KawUoLl15R1KMfn1aXqrcJ7ULEj5mqXZNn
X-Received: by 2002:a05:622a:19a5:b0:403:c4ef:490a with SMTP id u37-20020a05622a19a500b00403c4ef490amr15361922qtc.9.1689597930931;
        Mon, 17 Jul 2023 05:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689597930; cv=none;
        d=google.com; s=arc-20160816;
        b=0+PrWxsLo+kwh+OuToFKVHoHKvmhzUKDkA2uLosSE53Pn/ivzYJ3hzBFeGNTJmHo9q
         +xxeoUH7EQdDriHWp8z6uLTPTKUQCpaIXvBMLX0jubvdBxJD+oxsoNZevNaY903jaxqB
         M5sxv69R2ALltUc7eNQcaCZ/31ZSrroP2uM5KyCLiydMM4RCO+ms9HDN2W7rajK3sYWt
         iKNjJ1B3rijS+AiuXAbt4W98ykv+uUVN9oXcyhmQplNMi020UBeKe0gQSb7nVBAyqB1m
         tYaIekU8s+Lu5u/lRE9KGwC5vlLsu0YEQcUonKhRKN4EnHy9kYqUN0XUDfOWqEkUUVyY
         WKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=XzLgtVVLHwnmkSSgPouLdLdfVgCpfCTRRRKkOdMq0RQ=;
        fh=dAu1SZl3l4bLd/yxb85dGClRgo++7sr9hD+u8uChkjc=;
        b=Wf7o8KVGztP1ixH1ZiAWNP1sIrKKqhZhvKc/IMxNN0955Wh8VDCyRo5HLHklbfWoWu
         Ey21FYyEyxXzbaqcvUd6X8IzZz4S3NrDEQmK1hlXRENvA5/NEXPv30O3lqJn4rXbQzUd
         xHYQOM1VZA14dVW6poXWjFwoZ7De6fox0lJc5I7Jhui4XC6BQME7s/IqjKeCA2cIuiT+
         WscrHlVj2dmlafDbj3upxckIWjm7YZparaJj45nj7BaIxVvw+J+cGgwzuMLPNbgxjMNy
         QULjkoDrpekbVpphHVJEL15qVkbSASZTcHMn5A1BQGWhFlVi8sKsjPcOffD8qywAkMQ6
         VlnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NjTJ2PHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05622a14d000b004009a86df69si8122144qtx.712.2023.07.17.05.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 05:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NjTJ2PHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLNbG-0005G0-Vk; Mon, 17 Jul 2023 08:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLNbC-0005Ev-3d
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 08:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLNb6-0007rP-FU
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 08:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689597903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzLgtVVLHwnmkSSgPouLdLdfVgCpfCTRRRKkOdMq0RQ=;
 b=NjTJ2PHScZnHqI5vTgATJEyJuKgTEWasYmpAUObxozznJZi9Lb+XD5ojipiZVH3MLwXmUg
 rphPgwYrJhfd3LyiptKdJ5wLkFIz/3s5veqHvxpRMYR6WV6fl4hlNVQkhUZsJ+Zkf1UmZb
 QAt6IR4r6FHPuIAF683AqyCTBTiSqL0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-qwQDesuxPuCR1FP458Kz_w-1; Mon, 17 Jul 2023 08:44:58 -0400
X-MC-Unique: qwQDesuxPuCR1FP458Kz_w-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51bef8bb689so6748948a12.1
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 05:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689597897; x=1692189897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XzLgtVVLHwnmkSSgPouLdLdfVgCpfCTRRRKkOdMq0RQ=;
 b=WybHESEmIxabGdwYaL2vWD+kcYtdeDefmFR/9jNAUTaToscWKNvvcDrhVUWvfXr92e
 YrmQBJQNFkYnsnrZryPr/L4qOYkMrLwzof/oDuUGo483/7Rx65cIeypfiyReTEwsSgV8
 nsPY2AohNnjkjNjy9NVWElSbZabs+PNr4JebtyDCoYCw/vJOjRg/7d3MjEhUdwO1vMDj
 5U2J7gaGQwbkYyB8YiHimA7o01qP/A2i9xll3kwbBZK5B0SczRr57jrBcEgZth+LVzbu
 BHBpqxNYqbA3W8I9PuvP4VEANoGnpOiF2cP360FtniITqUxdXPtLD4hF+XrhijumgQZc
 gLyQ==
X-Gm-Message-State: ABy/qLYpTj62t2tA7TBZHOE+lm2SZ7I57tMMHF3lMhY3tiHusMb/DvsT
 x8oeoA+LXzNtIMc5M7OtiQjcVwlYmGVSv2X/okZ3fAFTJQK8BHleispvkwczjO5KQuM73r0JdmC
 OY85HZDzpZGlD
X-Received: by 2002:a05:6402:3550:b0:51e:5aac:6bad with SMTP id
 f16-20020a056402355000b0051e5aac6badmr11822748edd.11.1689597897639; 
 Mon, 17 Jul 2023 05:44:57 -0700 (PDT)
X-Received: by 2002:a05:6402:3550:b0:51e:5aac:6bad with SMTP id
 f16-20020a056402355000b0051e5aac6badmr11822730edd.11.1689597897359; 
 Mon, 17 Jul 2023 05:44:57 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 y21-20020aa7d515000000b0051ff2b6139esm6323294edq.5.2023.07.17.05.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 05:44:56 -0700 (PDT)
Date: Mon, 17 Jul 2023 14:44:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Gavin Shan
 <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
Message-ID: <20230717144455.6f02fde9@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAFEAcA92QFxN0at+5rk7yrfk1sj3tX-GcfZYYY5_=210np_j4g@mail.gmail.com>
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <CAFEAcA-XK0U0bPuAf4K7avdJqnmcibFX_swY1Weo_Tn3wHJ1fw@mail.gmail.com>
 <20230714135004.230c05b2@imammedo.users.ipa.redhat.com>
 <CAFEAcA92QFxN0at+5rk7yrfk1sj3tX-GcfZYYY5_=210np_j4g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4zHat3Fl4MLw

On Fri, 14 Jul 2023 13:56:00 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 14 Jul 2023 at 12:50, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 13 Jul 2023 12:59:55 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  
> > > On Thu, 13 Jul 2023 at 12:52, Marcin Juszkiewicz
> > > <marcin.juszkiewicz@linaro.org> wrote:  
> > > >
> > > > W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
> > > >  
> > > > > I see this isn't a change in this patch, but given that
> > > > > what the user specifies is not "cortex-a8-arm-cpu" but
> > > > > "cortex-a8", why do we include the "-arm-cpu" suffix in
> > > > > the error messages? It's not valid syntax to say
> > > > > "-cpu cortex-a8-arm-cpu", so it's a bit misleading...  
> > > >
> > > > Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for
> > > > other architectures.  
> > >
> > > Yes; my question is "why are we not using the user-facing
> > > string rather than the internal type name?".  
> >
> > With other targets full CPU type name can also be valid
> > user-facing string. Namely we use it with -device/device_add
> > interface. Considering we would like to have CPU hotplug
> > on ARM as well, we shouldn't not outlaw full type name.
> > (QMP/monitor interface also mostly uses full type names)  
> 
> You don't seem to be able to use the full type name on
> x86-64 either:
> 
> $ ./build/all/qemu-system-x86_64 -cpu pentium-x86_64-cpu
> qemu-system-x86_64: unable to find CPU model 'pentium-x86_64-cpu'

that's because it also tied into old cpu_model resolving
routines, and I haven't added typename lookup the last
time I've touched it (it was out of topic change anyway).

but some targets do recognize typename, while some
do a lot more juggling with cpu_model (alpha/ppc),
and yet another class (garbage in => cpu type out).

With the last one we could just error,
while with alpha/ppc we could dumb it down to typenames
only.

> and '-cpu help' does not list them with the suffix.

both above points are fixable,

I can prepare PoC patches for that if there is
no opposition to the idea.

> > Instead it might be better to consolidate on what has
> > been done on making CPU '-device' compatible and
> > allow to use full CPU type name with '-cpu' on arm machines.
> >
> > Then later call suffix-less legacy => deprecate/drop it from
> > user-facing side including cleanup of all the infra we've
> > invented to keep mapping between cpu_model and typename.  
> 
> This seems to me like a worsening of the user interface,
> and in practice there is not much likelihood of being
> able to deprecate-and-drop the nicer user-facing names,
> because they are baked into so many command lines and
> scripts.
Nice names are subjective point, I suspect in a long run
once users switched to using longer names, they won't care much
about that either.

Also it's arguable if it is worsening UI or not.
I see using consolidated typenames across the board (incl. UI)
as a positive development.

As for scripts/CLI users out there, yes it would be disruptive
for a while but one can adapt to new naming (or use a wrapper
around QEMU that does suffix adding/model mapping as a crutch).

It weren't possible to drop anything before we introduced
deprecation process, but with it we can do it.



> thanks
> -- PMM
> 

