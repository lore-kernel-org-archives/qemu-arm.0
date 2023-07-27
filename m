Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1413902ejb;
        Thu, 27 Jul 2023 09:29:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTApqrda2koRzuWO9VNhQXbyWaR4I8gsWJvPTia1napyYIimWzicSEmpOOvDki0XUqPlDc
X-Received: by 2002:a05:622a:15d4:b0:403:b1ef:6ac5 with SMTP id d20-20020a05622a15d400b00403b1ef6ac5mr604042qty.56.1690475378229;
        Thu, 27 Jul 2023 09:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690475378; cv=none;
        d=google.com; s=arc-20160816;
        b=vOEz/MK/gPoR9LZ8NhtxxZCcDkKmJ6YFjVS+7xA8j1GMQWAflY658HV+uYy8DB4kw0
         ODulpeNzmq9W0CEeMsVkbCkPxlVwFFTAoT8/7cPbRTV+PjRsXEajxLhyf9lI8+1sf5Pf
         NPBFJgjcPZdEENEsYyPcRgYlGmRifFDpCjM9HFeA9PTzICKEAJOkX+157MZzw4qdL5aF
         7BAMMyXIkHYJIgWlc7C6cg7LsnUyZ+HkYf6o0JHCfTmimHUa1X5SO0UrwVM/FDFQcQm1
         M0W2y0hqyK9VNtt7smJbX9+ncrt5LaTW+L0RIE8vN98jE1V0q3ot4PDBN93g6gY61Gcv
         GOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V36/DHcWI5oDYfiNaB4fBVaYDTTuSZ7njmDgF6uH6ZY=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=STmyvokdOsVWoNkpAHb0bnwrRREnPZ5AQGTaF3jyVAYaEFDLsw9MpudK+LB0DGRXmG
         RZG5/3aqE4Rz82Ix3i7wwQAR/QVMM6lrcWVXfCGX/J4C6mKRuy41qLnflnl4r92LRuTB
         h6jJivVTGxO+n2PReadCb5CIXwC2ITDxh+dO8NNhFMTIXOZui2bAG6NHIlu3ODQYRsoG
         d7HZwt8lPPt9SJ0U84BBjY2J+tkqJ1iYXWJhsQ0ooZAXHM/l4YPHvLJMWPcspdDLU2m1
         70NQ4T2Nosr8vCn5AMv09dFOwfYZ1DAVeFp44Cvdxp55qn4XJNtxaLZEojJF+DiwgKnv
         gyTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2slxnvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a05622a008100b003f38c9bd035si1050735qtw.782.2023.07.27.09.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 09:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2slxnvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP3mF-0003Jt-Vw; Thu, 27 Jul 2023 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3mE-0003JA-H7
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:23:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3mC-0007e3-RH
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:23:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso12987465e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690475023; x=1691079823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V36/DHcWI5oDYfiNaB4fBVaYDTTuSZ7njmDgF6uH6ZY=;
 b=S2slxnvTwXBHnvncqwDbsc7QtMvDuJYrGSM3uxbAwINLV8SvdsPar4hG5alc7EpejT
 zwEzTbNysDFgdSI9HnyWnZHlzsfWP4I4uoh7Bu2mXlXn2A5ATQN31kaBmCrizyWEoLxb
 Qnu14RAUerQObUMgnJmZFSuidJRWgIVwgQtwOPVZfXCPGH86C4l73mEUa+cPT2IbYaLh
 9wlf18coqllWVjZWjiItjXkN7k/seqXr+gHbF6GwigAw4em8SufnPrfsKslYtvsX3ysI
 bg/ggG3tZUbAggsdLkAtrjD9thC56rsAoBrvTn+fQ3bq7rkDzXBRZy1MluinjQYyU2nN
 GTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690475023; x=1691079823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V36/DHcWI5oDYfiNaB4fBVaYDTTuSZ7njmDgF6uH6ZY=;
 b=GY78F/Qo179eyQjHsOwT7klIXdW7WNuJ74ukuo/ZJpk3ArXaChQWNheVQjVUIDon4B
 6uiBh3abie6JLT5TZNrl2VMLpL6dY3RVUWj+Mx+ofbP91sutEmEJV9LoY3j7gfSL/eIz
 tHboSqM0jSKu/8GI/+YRMulykqIV2nu4VfQ8jA0ibEjkSnJvOqDzJz4/i23JR3M+alvS
 H575rfsPGPask5B3/F2nbynAZJgCGdf5RteyMe+lOgsx02stPlpOUFnwS+5f+z4e85lf
 3ZLYjTk462RWSTfyePJUupTq19pLrlERtPxnjIxVbSFfgH2AeHV46QwEnIm99NiLzreD
 9KpQ==
X-Gm-Message-State: ABy/qLa+fApEnWUolK9RGHdQvcrOe90Ckj2d6Hj8Ok4ZOsLzQDyHCeLy
 SvAeFZ8TNPxAHfmbUGsObD+dQYr8gk1qtzVyg49Ftw==
X-Received: by 2002:adf:d0c8:0:b0:314:1a09:6e71 with SMTP id
 z8-20020adfd0c8000000b003141a096e71mr2010900wrh.53.1690475023256; Thu, 27 Jul
 2023 09:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230726030450.757462-1-chris@laplante.io>
 <20230726030450.757462-4-chris@laplante.io>
In-Reply-To: <20230726030450.757462-4-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 17:23:32 +0100
Message-ID: <CAFEAcA_K+Rzt8=0apiyO5tB3EwTRJMo8afKu3wkb2=jAsyLvmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] qtest: implement named interception of out-GPIO
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xTlAn5lS+a7N

On Wed, 26 Jul 2023 at 04:32, Chris Laplante <chris@laplante.io> wrote:
>
> Adds qtest_irq_intercept_out_named method, which utilizes a new optional
> name parameter to the irq_intercept_out qtest command.
>
> Signed-off-by: Chris Laplante <chris@laplante.io>
> ---
>  softmmu/qtest.c        | 24 ++++++++++++++++--------
>  tests/qtest/libqtest.c |  6 ++++++
>  tests/qtest/libqtest.h | 11 +++++++++++
>  3 files changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 1c92e5a6a3..7fd8546ed2 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -397,8 +397,12 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>          || strcmp(words[0], "irq_intercept_in") == 0) {
>          DeviceState *dev;
>          NamedGPIOList *ngl;
> +        bool is_named;
> +        bool is_outbound;
>
>          g_assert(words[1]);
> +        is_named = words[2] != NULL;
> +        is_outbound = words[0][14] == 'o';
>          dev = DEVICE(object_resolve_path(words[1], NULL));
>          if (!dev) {
>              qtest_send_prefix(chr);
> @@ -417,14 +421,18 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>          }
>
>          QLIST_FOREACH(ngl, &dev->gpios, node) {
> -            /* We don't support intercept of named GPIOs yet */
> -            if (ngl->name) {
> -                continue;
> -            }
> -            if (words[0][14] == 'o') {
> -                int i;
> -                for (i = 0; i < ngl->num_out; ++i) {
> -                    qtest_install_gpio_out_intercept(dev, ngl->name, i);
> +            /* We don't support inbound interception of named GPIOs yet */
> +            if (is_outbound) {
> +                if (is_named) {
> +                    if (ngl->name && strcmp(ngl->name, words[2]) == 0) {
> +                        qtest_install_gpio_out_intercept(dev, ngl->name, 0);
> +                        break;
> +                    }

Named gpio-outs can have more than one line, the same as
unnamed ones (you create them with
qdev_init_gpio_out_named(dev, pins, name, n) -- there's an
argument for how many to create), so I think this is_named
branch also needs to install an intercept for each one, not
just for 0.

> +                } else if (!ngl->name) {
> +                    int i;
> +                    for (i = 0; i < ngl->num_out; ++i) {
> +                        qtest_install_gpio_out_intercept(dev, ngl->name, i);
> +                    }

...at which point the code looks pretty similar in both branches
of the if(), so I think you end up with something like

         if (is_outbound) {
             /* NULL is valid and matchable, for "unnamed GPIO" */
             if (g_strcmp0(ngl->name, words[2]) == 0) {
                 int i;
;                for (i = 0; i < ngl->num_out; ++i) {
                     qtest_install_gpio_out_intercept(dev, ngl->name, i);
                 }
             }
         } ...

(g_strcmp0() can handle the NULL case without having
to special case it -- this is how qdev_get_named_gpio_list()
finds entries in the ngl list.)

Apologies for not noticing that on the first round of review.

thanks
-- PMM
