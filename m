Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6400489lfb;
        Mon, 28 Mar 2022 03:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2CRqasi6BU/1JQyhr9ZcOIRuidKTc6dD/+DzCtY7rfCnU4Ue9jjgRcFHuYKjPZXOOv1+4
X-Received: by 2002:a05:620a:2488:b0:67b:a6a6:b201 with SMTP id i8-20020a05620a248800b0067ba6a6b201mr14672693qkn.580.1648462973234;
        Mon, 28 Mar 2022 03:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648462973; cv=none;
        d=google.com; s=arc-20160816;
        b=YAI9N2AIpbF4sTEoWoKgLAvNGA7ImBEDoFWH/PHqMycq3W+PgKdWUM53meYknz9KWf
         n+QzQpeYAdG9CsTO7MIMcWq58MH4drcY79IU5MW0pv+8zoFVfBgB057lOpn6YVN10vYx
         dqNsGlNczXOFCReEELsytgfLy0eSeAslUkgu10U4BYupXHDDbsVMIELp+9jWNaZZpi43
         GGhTPga+w03hJLAFEnYMmSpMOFz4c9jBBUhUWjl0PkiTUJobfzt8NRayPIQ2Dh0lSu/V
         g0VvDm1Wi7SUFFHSvRaUJPNWOVpPh+FyJ+dmbHMnM3XMxGh512f+buOUK3JDxDqjdtlC
         yF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=V4OCN1eOgrOy7ECoescUvMzt573CjARf4CVtS4ozLLQ=;
        b=JHIoSR52GjWBJiMCgZ/RFL/6vuZS8dZQuLYjszbp1kd4JvPn6CqVDJ7imnptgMm2ZX
         +JLMqXOl41qWKgABDFz4Iyu4BOTEuTm5BYj7TOdndnmv1m55sJjcwyByzG7VzpeMgHpf
         1g5lMzzNJ4xJQDNeW3YRp39hDtQuOgGcnJujJXyJ634bssQ5K/YGsvOp14b5GyT0GpnX
         1x2JV5t/VD9bqZgOVvf307D/JZ6kEfikE0dKRY5x9BJhC+VrecRdqNet0Mo7YIUpDpRe
         hC4/Dei75r818yXkg3HjoAgw9kEPvjYprqlKapDCN1E/3TmxeEM/qxlTz5KcvyzxGHXf
         /6gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJ8rRiPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5-20020a0cdc05000000b00440e46a7bd4si7070089qvk.114.2022.03.28.03.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 03:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJ8rRiPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYmWS-0001Dh-NS
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 06:22:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYmWB-0001Cg-C1
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 06:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nYmW6-0000uh-Dc
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 06:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648462948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4OCN1eOgrOy7ECoescUvMzt573CjARf4CVtS4ozLLQ=;
 b=FJ8rRiPu6JGxFnMPVqA803VbgROG+LRWKAGm59sR2x3PoHf29YcKd480upINbtmWOcIaTm
 Ezpnt7OUoyePuqaCZ9l0Gee3JElYkTazcNUI8TGXIwyUHNjKkT4eO+YJeXul7p5/CLbKyJ
 BOzxGzh5cZURvJHSDQy1tOFb676AIHQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617--A1M71D7NGmOMCBAtfViyw-1; Mon, 28 Mar 2022 06:22:24 -0400
X-MC-Unique: -A1M71D7NGmOMCBAtfViyw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2dc7bdd666fso114388067b3.7
 for <qemu-arm@nongnu.org>; Mon, 28 Mar 2022 03:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V4OCN1eOgrOy7ECoescUvMzt573CjARf4CVtS4ozLLQ=;
 b=HbprSMOUcGP1/VelsO78RLEaYLuGjGf7EeGJ0x2MqpFdqflJjANMuLusV9pVjSKFCg
 pk3lvVUgU6A5c5d3chARFWnYKqNJ4h0jjG39DD4XxOcNAyuKFUOUYXOcO6H25fltpvMJ
 65IxsGpaMY/YUhhouEcWYMfQv8ifcjvRDLiJ6PZv9XDyAWYwZ074tjq/rpb1NlF009hz
 XduqFzbMANz3FqdBG1op8cfF6uxOw7ATG2olvus8/1PZ3oPmvMyPKeesqO4xICPZf/B6
 8K57Uhs91HXa127YxfJO1AKDlos7EzckROu5UYSyoHpeMn/Ifn6EARoIT3ROxoXxKUrA
 nOsw==
X-Gm-Message-State: AOAM531ydOFxCEMkPf1rPT9qvyRM9W9U3IXDB4YV8ALZb+BpqqrMikO+
 f0EZ95OqDWwS1eNSIcKvQqFzoTM1j6PwzqYP66esrY+k4VSxEHV2luGbrCUZ4XuycK1gJHmint0
 1QOnvGcdOgz3yynAZaK8uUu0NS5Po
X-Received: by 2002:a81:7bc6:0:b0:2e6:3a20:2e09 with SMTP id
 w189-20020a817bc6000000b002e63a202e09mr24428886ywc.312.1648462943781; 
 Mon, 28 Mar 2022 03:22:23 -0700 (PDT)
X-Received: by 2002:a81:7bc6:0:b0:2e6:3a20:2e09 with SMTP id
 w189-20020a817bc6000000b002e63a202e09mr24428867ywc.312.1648462943615; Mon, 28
 Mar 2022 03:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-6-marcandre.lureau@redhat.com>
 <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
In-Reply-To: <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 28 Mar 2022 14:22:12 +0400
Message-ID: <CAMxuvaxHgVy-JA+XzAKJ4cjGYefpxyE_fmMLRqzPQPjVQKV8yg@mail.gmail.com>
Subject: Re: [PATCH 5/5] s390x/tcg: fix format-truncation warning
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OXPLvKDD0CkI

Hi

On Mon, Mar 28, 2022 at 12:59 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/03/2022 10.47, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > ../target/s390x/tcg/translate.c: In function =E2=80=98s390x_translate_i=
nit=E2=80=99:
> > ../target/s390x/tcg/translate.c:224:64: error: =E2=80=98%d=E2=80=99 dir=
ective output may be truncated writing between 1 and 11 bytes into a region=
 of size 3 [-Werror=3Dformat-truncation=3D]
> >    224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "=
r%d", i);
> >        |                                                               =
 ^~
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   target/s390x/tcg/translate.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.=
c
> > index 5acfc0ff9b4e..a082342a0424 100644
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
> >
> >   void s390x_translate_init(void)
> >   {
> > -    int i;
> > +    size_t i;
> >
> >       psw_addr =3D tcg_global_mem_new_i64(cpu_env,
> >                                         offsetof(CPUS390XState, psw.add=
r),
> > @@ -221,7 +221,7 @@ void s390x_translate_init(void)
> >                                      "cc_vr");
> >
> >       for (i =3D 0; i < 16; i++) {
> > -        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i)=
;
> > +        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i=
);
>
> The compiler is *really* too stupid to see that i is in the range between=
 0
> and 16 here??? ... that rather sounds like a compiler bug to me than
> something that we should work-around in the QEMU source code. Considering
> that you're using a x.0 release of GCC, please file a bug against GCC
> instead. If they refuse to fix it for GCC 12.1 or later, we can revisit t=
his
> patch, but currently, I really think this should be fixed in GCC instead.
>

I opened: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105080

Although I think the "workaround" is simple and would avoid users &
distributions having to add --disable-werror, and possibly miss other
issues.

