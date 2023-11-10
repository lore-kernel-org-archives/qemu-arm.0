Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1087776ejq;
        Fri, 10 Nov 2023 02:21:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWvC8+Mp4R5eUiQalVyt9RnjvdaPxZQKrtTKIVtIM5khK7rKhOqRV24spM6NiSx2U1B96Q
X-Received: by 2002:a25:ad06:0:b0:d9c:a485:332b with SMTP id y6-20020a25ad06000000b00d9ca485332bmr7480779ybi.4.1699611713198;
        Fri, 10 Nov 2023 02:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699611713; cv=none;
        d=google.com; s=arc-20160816;
        b=d2qVnaDgR/g8ZnXFdyGOOeebeK3iKZ439CGwznC9o73GbQEq7FDsRnv9HZ9q0FBYDy
         XOE16cvI0P9wJFyuJbOAnxiG5lpfpSYEvqk49nw6AJ9IH8f/AlHbeoWQLSuIWTRKZSZb
         lJ6rDSXcTDNIMP3Q4W52VvDuRuiazo9BXx95NSP1fv5IF/Ezn5wG9Ndfy3MnygA3azgG
         vmV7Y1U3Rl3OhrIyDzeoYLE1FhcVS+Upt0CN16BE0zJpRyPnnSKP6eEjUOxPRedLT94e
         EVV9jp7+ciX0Fr5iIpfYPcRgB7vLY9p6nkbbVtpqS/q2ANIR+E+YRAlAT8JPWKHzFh12
         SA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LqHY1rM+nJijkVtRNRAZWGeNV/wqoJqulwCB5qLr/y4=;
        fh=+cXu/u1gi8FLs40kD85giOgg2zmUaEFQn2Fp3TN2jNA=;
        b=lE47eX6cCW1Dtpn8wshBUbo+eJGagxCW1K0IiqniDdvJv+Q7ruwWHVS0mhxZCYYVEk
         s1cAUKDArJdMy3SlBPb6PjlJYk+hfdrp7Kv99q2e7L884IRoinPQl16OZn5njjn3ZPng
         IodmXsTS59JhV/uLnyC0YUpl4TLLJSK5eTilyv6tqD3rn8Jp7KrGiDu75HOMqx7E2VoF
         MiOIGM5h5605Guoravi7ONvTVl0obunEm+h+dRfgDsXs3BmhHxQjhGO0ItclO5jgrWjg
         UP2zqVcpqX1O6btqPZ7QZlu/H9qMhXQshwknz7HZ11w7vXWp581ToPI+lCopbF+NVXSF
         LAzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibq1QfZj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a16b000b007788b84dbc7si4277435qkj.496.2023.11.10.02.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 02:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibq1QfZj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r1Odd-000407-Q1; Fri, 10 Nov 2023 05:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1OdZ-0003zl-Qw
 for qemu-devel@nongnu.org; Fri, 10 Nov 2023 05:21:17 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1OdX-0007tz-Tk
 for qemu-devel@nongnu.org; Fri, 10 Nov 2023 05:21:17 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5437d60fb7aso2963112a12.3
 for <qemu-devel@nongnu.org>; Fri, 10 Nov 2023 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699611673; x=1700216473; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LqHY1rM+nJijkVtRNRAZWGeNV/wqoJqulwCB5qLr/y4=;
 b=ibq1QfZjiC41nploVvtIV9UazPqmOakfhqm+EVSE2syEjEK/kno4rVt8nd+lNpV/cs
 CstuO91P9Ifk2EpriO6LcZLm8E5rrWigPKIRcEQl6rnzuIw0tRL8KMyNZ6AimjAJd04H
 C7zDDcZiQJCD8TSjaE7/d/t2XZF/fGtaS8qsXmDZboRt/dzga/hu7aqUjxVKHqtgQzs3
 VJ+Bzh4S8kLu9epQbRRdgZgokzERW0HTezHymYAgvMb4Nkpgw/m8poAPbqByM7jeab2s
 4rdbh5ITyp6ulgOk56Iu/+ErQb8y+4dqHYPE/pike0K1ZPK2bDZ6GRW7pIgqQIDHoPhM
 t5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699611673; x=1700216473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LqHY1rM+nJijkVtRNRAZWGeNV/wqoJqulwCB5qLr/y4=;
 b=ZkLnL+G1UhFmooFYOBPuW41zix7fhP6seE3C6nohkxV3dtW1WGXPMY8fZ36HftFtHc
 z9MXCeSVRnBillxleHK6cuDhh4XgjD+m88b7P8xzFIKsgnj8JPdIKGwshsRWvzBPxYYr
 D0RzAYjwdLxkZ5k0BAOUbQyicf0B8LBeBF/Lj5s8hcsBCTMYIomXItKxAsrTrqyCb2md
 B1PQ3rwbFFlGz2o67M2hXa3p0tFFX+b1HVRf4jiHn75OgXW1kVoamAWbokLbds+Ptm6u
 2ozp8/4ncb+KVtEMcWAZd4uGtUssWrTsC/JnmYzRQs58GkqkNmF9YxT+M81O8NxGqVU3
 rGRA==
X-Gm-Message-State: AOJu0YzM9OD+9gKIlCAMcK+gNh+J/K1rVrecls3XdWogYLR7DXxbWXQi
 Mh9A53ugQvem5MFkOEKJFjCMMVIbO0cAQUu0WikQhg==
X-Received: by 2002:a50:8714:0:b0:53d:f072:7b0a with SMTP id
 i20-20020a508714000000b0053df0727b0amr6661245edb.39.1699611673413; Fri, 10
 Nov 2023 02:21:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
In-Reply-To: <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Nov 2023 10:21:02 +0000
Message-ID: <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "open list:OMAP" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X6JRHu13G47G

On Fri, 10 Nov 2023 at 09:16, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Ignoring the return value by accident is easy to miss as a bug. Such a
> bug was spotted by Coverity CID 1523899. Now, future instances of this
> type of bug will produce a warning when using GCC.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  audio/audio.h      | 2 +-
>  hw/arm/omap2.c     | 8 +++++++-
>  hw/input/tsc210x.c | 8 +++++++-
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/audio/audio.h b/audio/audio.h
> index fcc22307be..b78c75962e 100644
> --- a/audio/audio.h
> +++ b/audio/audio.h
> @@ -94,7 +94,7 @@ typedef struct QEMUAudioTimeStamp {
>  void AUD_vlog (const char *cap, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
>  void AUD_log (const char *cap, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
>
> -bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp);
> +bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp) QEMU_WARN_UNUSED_RESULT;
>  void AUD_remove_card (QEMUSoundCard *card);
>  CaptureVoiceOut *AUD_add_capture(
>      AudioState *s,
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index f170728e7e..59fc061120 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -614,7 +614,13 @@ static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
>          s->codec.card.name = g_strdup(current_machine->audiodev);
>          s->codec.card.state = audio_state_by_name(s->codec.card.name, &error_fatal);
>      }
> -    AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal);
> +    /*
> +     * We pass error_fatal so on error QEMU will exit(). But we check the
> +     * return value to make the warn_unused_result compiler warning go away.
> +     */
> +    if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
> +        exit(1);
> +    }

This kind of thing is why Coverity's unused-result warning has a
lot of false positives. We shouldn't introduce extra code like
this to work around the fact that the tooling doesn't understand
our error-handling convention (i.e. error_fatal, and the way
that some functions report errors both via the return value and
also via the Error** argument).

thanks
-- PMM
