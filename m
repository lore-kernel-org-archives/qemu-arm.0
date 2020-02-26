Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2856062lfg;
        Wed, 26 Feb 2020 02:04:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhe/lVTqZoGy0w65uwKQRWEu+9UC098D9EHb8/5guFVzf+UvLJ4NGDaBF4Kd5fwZddde1Z
X-Received: by 2002:ac8:43c2:: with SMTP id w2mr4171249qtn.376.1582711488211;
        Wed, 26 Feb 2020 02:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582711488; cv=none;
        d=google.com; s=arc-20160816;
        b=XTQVjrL/Gr2R9HKILhyWgbHCwNMi8lNgdIb5bI1MKYbLzQRfxmr90BEq1idpecTolD
         4/hJLLFb158cgtZURsK7iCaTPuWgfT49/DjltPZjpVvHvTEbb8o1X9ihj3qjD9vj7P9H
         EucSNKQPzlxsTeymz5Cp9zA7m8CZG9Jt1QAjQLhykRICEiHVDElPosokB+NZuInCaJtX
         0r+619UDoQFxn0TEjTkB/Ccav9v8qynpLRef7qSzEdiFb2+sEWMevYzEdDkAufJ/wJY1
         TzY8Cpszlvn1bP0jX9d44D2icwZnswtwvx6Ja7tAmEXs8a1FcxXR2mxf1QGnx1zBFK+8
         6ZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IBROLuFPhqzKOPd8gyMxNRb9dw5nHSwIh9zOG5fnXsk=;
        b=qMRcLA9GRgkUcm7RXYc21yABig9LRoBQab4PmHmA+xYR/OK2V8nxymCbBErFewU0NT
         mpDtFyEj9vGfUHAPPKp1Yu7qyVt2l0krDZAvZ94oQIpreZZyhiri/9fzmpSI2fJWfcDL
         TJaUwgGkYSc0r/2LK3V85mrXCr3nWdBPHT+XyOjY01tmp0JIgKVzF8mjX+JhhU9k+vaB
         DKfW4fKdWDdVLX8BLt/xHrEnxEqMnq6jVPJZt8rx1J4ePgJPppaoJZYon4WggksDOzU0
         Y6k+47WWsPQIvg/VNfbQbSLw1I7o3Sywm8JRhvbbkKn5xOn71HOhL02fkGJsR5LDLgrk
         di/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbetMoRu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si813528qto.220.2020.02.26.02.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 02:04:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbetMoRu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6tYd-0003Nb-LU
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 05:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6tXd-0002xW-4L
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:03:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6tXb-0007c0-VG
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:03:44 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:39172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6tXb-0007Wh-NH
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:03:43 -0500
Received: by mail-oi1-x234.google.com with SMTP id 18so2439658oij.6
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 02:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBROLuFPhqzKOPd8gyMxNRb9dw5nHSwIh9zOG5fnXsk=;
 b=wbetMoRuM1Wwsl+qrYWKuMKwCiTX6C0+V49Inh2/flIIYJLPOdzb/oy2pGLs5J79P/
 qloNBpRgyL6FKp6wwWWZh5A/pt+ZjpreyVmEcGTCsloOr4zDt1JXGtojbehVosBWR9Vt
 t0DxoJ5ksqOJw1FeBn8KxVhgwsur9LXwblRj3P99o/RnJvSyo7cS8Sfz9djlIF/bBI9r
 d+uOjt6ebR7TAjPQI0kYNL9m2UYb8FClsscqluKGpPexAFa/q2pbrliIgz9C0RadrpBG
 ogcvaeJq/qxYZOw0LBmEXcrtr0ccsl8udmsTWXnHCMNT4g/ftM+QGBCSX+aL9BAXqIJp
 U/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBROLuFPhqzKOPd8gyMxNRb9dw5nHSwIh9zOG5fnXsk=;
 b=lMW2dZZuQ0BbqE8kYhip1tr9WTjnbGt2qXmc/wQ2MtnqEW9MgESIrG2UacY3v7q9Yf
 cHJ5+Y2QrxVV87omI0OqyWlTzwDFIzXXqmYeAs1zG49RPUzFSwz4lG8WMan0XCI1/Dy5
 crPtnHQpknvGnNW07hMjDbN1DHZjnJyJSxYpC1LbzAyFNLhjk/IGwnQdfb8bVC9M7kC4
 vJd5I6k5GwIxyiOoxni95v/wtSsfsX2D6Fxut+287gJwqHitWbQnkGth+uFNMhomqOCx
 yqXq4tBA0dHQdUcIdQ15fMUXEfH57J+SpAMRVBvssm/wVJcKZVLPkOtbWhLQGs93qyPh
 OWmA==
X-Gm-Message-State: APjAAAWRGLQ3q+BGi3eVRkyNOO0sEVpCm67spzAJ/+qb27fGy998PV+y
 DqEgoEQlfNak50Lje0oYWBVIMuJ81YmpBgn4lYFqmw==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2524890oiy.170.1582711422423; 
 Wed, 26 Feb 2020 02:03:42 -0800 (PST)
MIME-Version: 1.0
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <20200226101948.786be4b0@redhat.com>
In-Reply-To: <20200226101948.786be4b0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2020 10:03:31 +0000
Message-ID: <CAFEAcA80K+h-nkiHrh15mmgomBaqDpdhRwb34zwKqF31dp3KDw@mail.gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLMdGgx6b+FC

On Wed, 26 Feb 2020 at 09:19, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 26 Feb 2020 00:07:55 +0100
> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> > Hello Igor and Paolo,
>
> does following hack solves issue?
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a08ab11f65..ab2448c5aa 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t tb_size)
>          /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
>             static buffer, we could size this on RESERVED_VA, on the text
>             segment size of the executable, or continue to use the default.  */
> -        tb_size = (unsigned long)(ram_size / 4);
> +        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
>  #endif
>      }
>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {

Cc'ing Richard to ask: does it still make sense for TCG
to pick a codegen buffer size based on the guest RAM size?
(We should fix the regression anyway, but it surprised me
slightly to find a config detail of the guest machine being
used here.)

thanks
-- PMM
