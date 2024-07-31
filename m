Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp323786njb;
        Wed, 31 Jul 2024 05:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnXCM3CchHHYVqrZBA/vw5OG27Y4wofhvIVFEwRftayWKiEXHmo1OlpFLT/G+TUHbz9gHApfLN+Lt57y4VvCpwLY2wc/MG
X-Google-Smtp-Source: AGHT+IFWIwV5xmVbWmmwopGVuAeL7eJHvWSGzBNKUDzsKjnC18UIqgqT2ZWCglhgNPmq/4cCbYCN
X-Received: by 2002:a05:6358:6416:b0:1a6:7604:b2bc with SMTP id e5c5f4694b2df-1adce46416fmr2186302455d.21.1722429138842;
        Wed, 31 Jul 2024 05:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722429138; cv=none;
        d=google.com; s=arc-20160816;
        b=bJA7kjgETh46kFkGVR+mbqAxzyS/e9oBxR4hVYtZxncjkeYlf5Hs80GsGU9dkIDws1
         KFY78gPElbP2rF09e8tNsj8nxEA4UuoJl81DHr3Q3O6640/B+JrbMQw7kUrhdIZcubL4
         MwwnbummZQqppRP726tPVfgkDTOas0QCAYA8gJfUC+obTz1tDJSNLL7ZtgVBZk5WFnSQ
         YPg8EU9WmVfXYBjNF6UPEohKoL4ED0HZhrVEGO57bDZLv0ILkvrFe+iN7vYUQem79aA8
         ZzwV+d1ESZHLKrOyjoh4jAB1Q3CnxOOhI23wOLA0rky+IKTkEHpHAV+t1dBEH/sIDJJu
         svoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PsOY+H9IgTzBmgl/ajqI0HCJu3uo8YUxMvM0GB+ieW8=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=wkD4RY2UUJ0+6ZPwMlln8/n2/2Y9h1RyTBUZjOxyD6uZSeMeBLXrTRG3v3qw8yVnNN
         9r/xjSFAbnp2gM7c5otVtZho5dVpvINApUoEo1VaUeNv7QczvT8L9Vxv08bAmK1fX6vH
         q7GB+EMIAzK2oO1NET+J8Peb2QD40c/WE20L8KWUTJjMWder9cxqTiiQcbc8TS/e8N2m
         oBmlSka5LdvezA87SPGeXJGngUVNS/hTar+AH3plWH54KQiJzlRtdzrzju6xkmfgwnzs
         35y/piKf6PRCih6wuRvWoJVe8xpK+j0uFb4L33Woyk9jTko1KnZNz6FHJtmHlQknNmiu
         +NRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/vCNpJi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3faa99b8si152656826d6.328.2024.07.31.05.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2024 05:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/vCNpJi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZ8Uz-0001e2-LJ; Wed, 31 Jul 2024 08:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ8Uw-0001c9-3Q
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 08:32:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ8Uu-00044y-HA
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 08:32:05 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso8268738a12.2
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2024 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722429121; x=1723033921; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PsOY+H9IgTzBmgl/ajqI0HCJu3uo8YUxMvM0GB+ieW8=;
 b=K/vCNpJiWQ9I013fevSpNP8KyADV6bPoHa45OTnrgkHS2TauvpgMxKgaJEvHPJBqL3
 au268BQX/drKuRNLxoqjFq8/k/mlvlPUKjnfh+0+J7qKjCI0Ci/azWqgnXpeTCGmIJjT
 RA5hC2BO3oDb/5iGa1zXwOJgTfvNqRKcFTeK6L+1Z3c4VxsxRPlJgNd0A8HZSF5ifQKN
 S1Jjd/Yh3WtJw5LpqLuA42fIYgYx83NMu6KqtlUjouptSi8wPJ9sdTsjxPojk4kuCaMf
 NJuIJx0fKv9CafD065rp8RlM5YyYHiRuLmySpJUprhce73ZKsAutfF/4cvFNmc9WO4Ps
 vM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722429121; x=1723033921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PsOY+H9IgTzBmgl/ajqI0HCJu3uo8YUxMvM0GB+ieW8=;
 b=HK4Vz54ObTNA5cD7N9Ub5w2FyuZQyfVgvuFZncJV+lyqcFF4lhpX4tlbnHXiFrsh9u
 SbU0XK4KXJu3hnoLFv9MdwpwTkqiQz8UsZU7EWuarkfmsotFXO/fs/EGQ5Ql4rpRbEGE
 DbV63k4XkVPs1Yjk63LhSpxyfI6UZo6gg2oL6RdiWuoW08yNncpzeaEtuIKlLrQnZ4nf
 pxmN3VuejErNl63TQ0E0F8m/6r/ReXuajT5BaADOmTyne6DCNyNRgxDz1yVuw5+0YSts
 Ee2PU6sQk2i02tm1bstA452pmKR2LlFfih3txYDQB3aw0xxk5ZbRjRvpNKASs/Oqv//+
 s3jg==
X-Gm-Message-State: AOJu0YyKLVgcMIWmZYFLrYUs48PCKj6/JqbISOdT5sLY/qLltskaQHMF
 snwyLJsMQngV6t+OuQwVOHEMPfpAOndSDU2p1iAERNiJzH2ScADGYqiT79zDs/cmrfbomvLdSdT
 eAb07TajpK3cuHhfaz9L1a8hp0+x+JOvgY3+TYg==
X-Received: by 2002:a50:9f4f:0:b0:5a1:8984:977e with SMTP id
 4fb4d7f45d1cf-5b0202ef5a3mr7414957a12.8.1722429121203; Wed, 31 Jul 2024
 05:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-4-peter.maydell@linaro.org>
 <a1c3324c-6065-44cf-ac52-f7038f99680d@linaro.org>
In-Reply-To: <a1c3324c-6065-44cf-ac52-f7038f99680d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 13:31:50 +0100
Message-ID: <CAFEAcA99xqywkp7sLoKUxQVNydqUyCSMNbW2B=dOB=HjtWho0Q@mail.gmail.com>
Subject: Re: [PATCH 3/8] target/arm: Pass env pointer through to gvec_bfdot
 helper
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kiJWGDtM7vhO

On Wed, 31 Jul 2024 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/31/24 02:03, Peter Maydell wrote:
> > Pass the env pointer through to the gvec_bfdot helper,
> > so we can use it to add support for FEAT_EBF16.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/helper.h             |  4 ++--
> >   target/arm/tcg/translate-a64.c  | 27 ++++++++++++++++++++++++-
> >   target/arm/tcg/translate-neon.c | 35 +++++++++++++++++++++++++++++++--
> >   target/arm/tcg/translate-sve.c  | 15 +++++++++++++-
> >   target/arm/tcg/vec_helper.c     |  3 ++-
> >   5 files changed, 77 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/helper.h b/target/arm/helper.h
> > index 970d059dec5..aece9fd4aa7 100644
> > --- a/target/arm/helper.h
> > +++ b/target/arm/helper.h
> > @@ -1027,8 +1027,8 @@ DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
> >   DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
> >                      void, ptr, ptr, ptr, ptr, i32)
> >
> > -DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
> > -                   void, ptr, ptr, ptr, ptr, i32)
> > +DEF_HELPER_FLAGS_6(gvec_bfdot, TCG_CALL_NO_RWG,
> > +                   void, ptr, ptr, ptr, ptr, ptr, i32)
>
> Because env expands to TCGv_ptr in the translation context, I suspect that you can use
> that here.  Worth a try, anyway, so that
>
> > -void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
> > +void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va,
> > +                        void *envp, uint32_t desc)
>
> this doesn't have to use void *.

I thought I'd tried that, but obviously I didn't hit on the
right combination of types in the prototype/definition.
This does work, so I've changed the patchset to use it.

thanks
-- PMM
