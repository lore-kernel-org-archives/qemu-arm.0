Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp775302ejc;
        Wed, 10 Apr 2024 23:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD0/F4wYgILpzI0h3/GMie9jFcUbUNzggdCIp7U/S3Tc00Q3epTdH4WSi4aZFxXLF+UDjKna2d0W6q7C6O2bLElEODMpOQ
X-Google-Smtp-Source: AGHT+IFkiQcrVlfoqaCCMLD4OSUd32JNynlb6928HQXeLjCRSJS2/yrDpCF5VABZqdwMH5xVrPfk
X-Received: by 2002:a05:620a:387:b0:78a:6bfc:1b06 with SMTP id q7-20020a05620a038700b0078a6bfc1b06mr4824133qkm.67.1712818753303;
        Wed, 10 Apr 2024 23:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712818753; cv=none;
        d=google.com; s=arc-20160816;
        b=tG7OJ/dPbM7og+BMVkt30q2j2dBhgDWR6tLgQ3FFk1FZ2XSiGo26QHxbw7f/D2/wjC
         qfw4A8BlFpmmOX29WoS2sPjj3iyPzqQ9hCUBgyNtxfzR+z/ceQG1dutmS92JDjSchz97
         CMLT4WZucwNbjSlTPP/xe/8/0PKklxWKGu9U+7uOLSIzCokEAgzyKqVJjdikjLLi8IF0
         TRaXetydWRKOsvTXbYWKqtJdDIoX4GwGMPtKL4cLn98PDcJXZ17yToLP5yZrHY4STFS/
         e6uFqwkkw713LXnWR3Ou/XOQiwJvoCX7+SgJKNst4wPclWeVXE6AzSKNQzld7DnP0xaE
         myHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zKQlQMKGHLsEbVrn+FLiDMKKW/n1F18R3/TKAj/jonI=;
        fh=3rGCESa9ua6myFzddPFqXjvPAFUFZIfoBMVyz04rz2M=;
        b=JPcdeQO5vVXcoYxwXpAPIeqyPGM2+Q4CLImmPK2l2XXg9K13Uwotw5w8kT/qxDTntY
         8pdgeYUIiSL+3X7z2N9CpKx2AH9QUWPhgQKDUgNvoBNR62yiuspHGJcrbgyJUjvSqnnl
         P27MkmklM/vO0g8oAlTh1dwuVj84J82u1wIUAZyMyILUcmlnrsdGESvc2xFNCoI1JZTv
         mL+v2T4XZbI+4Mgbv1CaPpmhrvghfX+oL6D8+DNp/VXmm2Z7CeW7BxtBonSnNTO50o2n
         3QiendfJ5+ofuhS1x/kt0UETJbyi+CPiFFHcVoD0+LIKhyBljtlUboEBUTS+pmqxEeY6
         1niQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnunOFvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br41-20020a05620a462900b0078d6e4e4763si1042995qkb.307.2024.04.10.23.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 23:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnunOFvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruoOb-0000lu-9G; Thu, 11 Apr 2024 02:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ruoOZ-0000fn-AP
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 02:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ruoOW-0001IJ-Jy
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 02:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712818726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKQlQMKGHLsEbVrn+FLiDMKKW/n1F18R3/TKAj/jonI=;
 b=gnunOFvUaDDZREAsLN5HwkHuSoPd7LrlQhicQMASFq4jmKBWks6B9SoKDxMkGfjM5z74cH
 ueFQKMoFBAjMbyFNg6desysUolEzzLywLC3b9My5Y8AZm0hjzzihQNSWtetP+73x5Ny/JH
 0GL/DJFQHuo8rfc/j5QaxqAfnJU3IJA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-Xe_qgAE7NLKf4wA9dRNacw-1; Thu, 11 Apr 2024 02:58:45 -0400
X-MC-Unique: Xe_qgAE7NLKf4wA9dRNacw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a51b00fc137so356224866b.0
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 23:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712818724; x=1713423524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKQlQMKGHLsEbVrn+FLiDMKKW/n1F18R3/TKAj/jonI=;
 b=Ro4yAHxz/+iRFEpyP3LFdxCqGuZon/M7jpLX78KHJcVJwwfBk7MfQ5BF2JZoOy+clF
 UGXMwGyoHLAvHTI7z4TQOs+VFGmtzGLJCFeYgBuGIRN2XSJ0cOr2lviejVm1vTkzFr8E
 Pd9Sy6nQdgJkgFKjqgWUM+MrRi5w2795BLA6hRNZiE6t7ZG5dH5jsUaCr5ibzEcnMTvF
 3b19U0aJkksTHXr40d5/wu1Ig2yIfZ07N6W2+G5SOiFy3KqFmVpNcFY2C/7X1lv+iyNY
 bDiOFcLdbHRPKZfaGoXiCBEDZrFBo/3QhogpL+aWeTeGYQ/4u+xJokMxZQUjzjU1tZxA
 1YaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsK836AUGMSzlZJoGYS8q2uEf0O/kEV8Cv6cax26U5iU4MDGYMYAEvs0sfLWs0vk95TQp+PwwN9N+GKZ0h4hucnp9P
X-Gm-Message-State: AOJu0Yxu9Wy7D2h9vvw31QGhkqbfinahaRJK3kxIeRqnHa85ukRhOYGO
 JNsx9ykkr1pGo5wrRyni20SryF00UytiZoyUgVJXn++oPvnGCkvvw2L/98Tr1pDgUlP1u4HXzvz
 OJUB56Bj/r2V2m51MOWCK5GnZu6TTDmZJXI3oYG6zfBxtnmQvf0MioHsfzEAM6Rvpk7LM7H/c0F
 jYbArqwpPI8+TmS6hU+grKUcJy
X-Received: by 2002:a50:cdcf:0:b0:56f:d910:4b7 with SMTP id
 h15-20020a50cdcf000000b0056fd91004b7mr2610365edj.15.1712818723919; 
 Wed, 10 Apr 2024 23:58:43 -0700 (PDT)
X-Received: by 2002:a50:cdcf:0:b0:56f:d910:4b7 with SMTP id
 h15-20020a50cdcf000000b0056fd91004b7mr2610355edj.15.1712818723544; Wed, 10
 Apr 2024 23:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-2-philmd@linaro.org>
In-Reply-To: <20240410160614.90627-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 11 Apr 2024 10:58:31 +0400
Message-ID: <CAMxuvazq=E+Z4jTDkcVMCi32T1pup9T2=6mOKgi10Mt5tDRXsw@mail.gmail.com>
Subject: Re: [PATCH 01/12] ui/console-vc: Replace sprintf() by
 g_strdup_printf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MVVJatrfZrWb

On Wed, Apr 10, 2024 at 8:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
>
> Replace sprintf() by g_strdup_printf() in order to avoid:
>
>   [702/1310] Compiling C object libcommon.fa.p/ui_console-vc.c.o
>   ui/console-vc.c:824:21: warning: 'sprintf' is deprecated:
>     This function is provided for compatibility reasons only.
>     Due to security concerns inherent in the design of sprintf(3),
>     it is highly recommended that you use snprintf(3) instead.
>     [-Wdeprecated-declarations]
>                     sprintf(response, "\033[%d;%dR",
>                     ^
>   1 warning generated.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  ui/console-vc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console-vc.c b/ui/console-vc.c
> index 899fa11c94..b455db436d 100644
> --- a/ui/console-vc.c
> +++ b/ui/console-vc.c
> @@ -648,7 +648,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>      QemuTextConsole *s =3D vc->console;
>      int i;
>      int x, y;
> -    char response[40];
> +    g_autofree char *response =3D NULL;
>
>      switch(vc->state) {
>      case TTY_STATE_NORM:
> @@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>                      break;
>                  case 6:
>                      /* report cursor position */
> -                    sprintf(response, "\033[%d;%dR",
> +                    response =3D g_strdup_printf("\033[%d;%dR",
>                             (s->y_base + s->y) % s->total_height + 1,
>                              s->x + 1);
>                      vc_respond_str(vc, response);
> --
> 2.41.0
>

