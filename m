Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp752208njj;
        Fri, 2 May 2025 03:44:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYJgrqrcHNh4o8Ca7XNlEcevZC8PYLrEEXpA3bCDrPmrcaWGmXelaTok3LteIN7TtSFk3kL8pE1SX0yg==@linaro.org
X-Google-Smtp-Source: AGHT+IHA8Kj47VY5KgFOQwUCoYuMgqe14Shp6wrXkcN0VMNpglaV19srgT7KP0/fFGgQSY0JtDtg
X-Received: by 2002:a05:6000:178c:b0:3a0:89df:3b85 with SMTP id ffacd0b85a97d-3a099aed964mr1542283f8f.38.1746182673283;
        Fri, 02 May 2025 03:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746182673; cv=none;
        d=google.com; s=arc-20240605;
        b=Db9ghks4eDqcNGnsEAOZgKHXfdgVWUzOhYPIzN77Bd3nTsKGSxDEafrY5pQSiXoquk
         Jlbs9JaJx/og5Zc2ZYVwjAGbwQOKPlZZLfZ3GDf/EebtOo2VpD/Y4g/WxwXRIlpQA/PP
         ruK0MOS46vzX515YJ88wHPF6apzKwLNARkEn2JJnr7BHuSJqSvLUdoCO0wLLFVpfmk47
         Q3J8+1XaxJPklOO4RVXBMmRNQfHyKXNzfRHvquRnw8TaiPCKPUj6Tvau5mep3oiTSX/O
         TnNmG93aw7M+g1jwXbzbdt8UOCcx+e3dlW7Ur1Y5CCyiYskxy8d7yJSeqhEBGImmx6Bx
         ZjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GexDT+VUNUCl5r25ZNb+plTQVDBEWyi+RAbRBrHe48I=;
        fh=oQHDg1tgHS3KE3VydGrGZGbzUftOOFIWx13Mh/KkYV4=;
        b=UNyzFpTfS902+NhiXOcI215DEDVDtjdu0Xcn/13c7jTT0LMbXax9pCOMjpOIQ0ntv3
         lD9enARnfGitvu38naLHJ0A8N9p6r514gAPsPMP+734v6Zkld30CSvICXtNWEsGz2sk8
         Dd/Uwfo3oHH1hj3eL+ViP9FOQMFCoLG3OIJh4woMZV4kYM1KYoLT9PDw4KFN/tQnkc9w
         aPwdLBFKcskxWHH08TFjs+qvjfLbw5WAT1Xw8fcYZDBrTzgndEXTw/W5VKfR/jh4p6P/
         9OKcRiBIjMjWnedFi34wmfEO8S0ar+cMRvo81Oqa13fDCBGjVEeDG9KrTxNShUuhG7dt
         POsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUHZtain;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b0ff83si926632f8f.673.2025.05.02.03.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUHZtain;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAns0-0007xa-2R; Fri, 02 May 2025 06:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAnrx-0007wr-I6
 for qemu-arm@nongnu.org; Fri, 02 May 2025 06:43:49 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAnrv-0002c0-Lq
 for qemu-arm@nongnu.org; Fri, 02 May 2025 06:43:49 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7086dcab64bso17502027b3.1
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746182626; x=1746787426; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GexDT+VUNUCl5r25ZNb+plTQVDBEWyi+RAbRBrHe48I=;
 b=oUHZtainvpKdi9ZqIMIUylkQaNFT7vtfRGDqNkGJbb/EYJGq8GmtIunoXG2sKeMOCp
 DQZrGIlOTtT7gqy6cNW0sMsFDo9TupOfNeuCtlgw+gOm1RlO6A1qoCYOVEysqR0bUcPf
 1VD144NmubuDk0Y4C2po6dZQxYn4JkmFif+iIWp6l8KEaEvo0H4fv5y/n/Tp+ly399HY
 DgZMU2MiOUvMQrQv2NI2CGBSHrPfhKJfzzhHZTLGJSYnz7ezRhGBLO9XyDy/RkdCjwwS
 p7NBZVhOL14GzrWibMKIePlNy9eCjIaA9Ufow/gwVgrEYdVFpR1obm5uSZqVLmAjPJnl
 aC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746182626; x=1746787426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GexDT+VUNUCl5r25ZNb+plTQVDBEWyi+RAbRBrHe48I=;
 b=robpOgnUEWn6piPV6LStLmQldI5K8u+g7AxBy3y+riuBUgAZ2PT49CRaego2cHQRUl
 ChXegagkTcSwY4LgqQW96LKTKNPcNbTf28CqaE25uoDPLqfeRNsMpDlc9wxLltZj50qU
 k6SAadu68+520o6dHPLbm3nXyg8UcdKwG8Z6F21PieW7B8ulCjOUHN6C07R7M3F5CkDg
 f/u8RpsEJqS+aPNb1IGvIZUx2jNi8cewL7Kioq2m9180YwYGTFxv42ER9iNbpShJNypS
 QzRpGKWtPx+0k7MTYs3HoHTl9QvdUy6Di3kxjXKkWqyGRMDc1arFSn9voQmkmvF/CK+I
 1dNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbmgxtc15IujbW0l9XFoGveSIdVrxIoSTuwEkY7w80cT1s0myKazwLjiKi2otTzITG1GHVNwosBQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw4W9asWSkatw3zXrOFOSBJ7MBV7j4Gpz9d3GAe7iY80HnyoTkn
 iQ8SH1Z45r8zGvG1SjoG7uCZRvNkqdC51CMzKyYVMr9xOoChafXoYvzqQ5BId1JZOe7hwEKZAC4
 EYGX35FlfmetoxKIywt6raSJhjMjBprwoD3eS4A==
X-Gm-Gg: ASbGncvmbHqmXL/x3vB/7m9s4XEvcMp+WfYsC8CKNbb0FjRCr511zh46RVhOmN6HkkY
 X3XmXuEg4Of7Epvs5fCanh2b7PWIwkKskAUEEO+xYD9QdLo4uWaGt0WDvdjUh2Un8KaVvnMJ9ww
 xN+Amwt5QBVHPR5iOVHAX22nk=
X-Received: by 2002:a05:690c:3347:b0:706:a7ac:f166 with SMTP id
 00721157ae682-708ced1dabfmr33695687b3.3.1746182626245; Fri, 02 May 2025
 03:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250423120937.21490-1-philmd@linaro.org>
In-Reply-To: <20250423120937.21490-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 11:43:35 +0100
X-Gm-Features: ATxdqUHIdnOIPUiNgwmQfSITHYR1-qVYTi-evijEhO3CKImLw1-bABdWuCZQ6Pc
Message-ID: <CAFEAcA_VuKxNwXN4=5KM5aRUoYvYvZ8Ho8sDXN1vQB81jwF-yQ@mail.gmail.com>
Subject: Re: [PATCH] hw/gpio/pl061: Declare pullups/pulldowns as 8-bit types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: qI5Y8L3l/15p

On Wed, 23 Apr 2025 at 13:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> uint8_t is good enough to hold a property "between 0 and 0xff".
>
> Define pullups/pulldowns properties using DEFINE_PROP_UINT8()
> macro, remove unnecessary range checks in pl061_realize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/gpio/pl061.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 60ce4a7f628..25b7ae3eccc 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -79,8 +79,8 @@ struct PL061State {
>      qemu_irq out[N_GPIOS];
>      const unsigned char *id;
>      /* Properties, for non-Luminary PL061 */
> -    uint32_t pullups;
> -    uint32_t pulldowns;
> +    uint8_t pullups;
> +    uint8_t pulldowns;
>  };
>
>  static const VMStateDescription vmstate_pl061 =3D {
> @@ -548,14 +548,6 @@ static void pl061_realize(DeviceState *dev, Error **=
errp)
>  {
>      PL061State *s =3D PL061(dev);
>
> -    if (s->pullups > 0xff) {
> -        error_setg(errp, "pullups property must be between 0 and 0xff");
> -        return;
> -    }
> -    if (s->pulldowns > 0xff) {
> -        error_setg(errp, "pulldowns property must be between 0 and 0xff"=
);
> -        return;
> -    }
>      if (s->pullups & s->pulldowns) {
>          error_setg(errp, "no bit may be set both in pullups and pulldown=
s");
>          return;
> @@ -563,8 +555,8 @@ static void pl061_realize(DeviceState *dev, Error **e=
rrp)
>  }
>
>  static const Property pl061_props[] =3D {
> -    DEFINE_PROP_UINT32("pullups", PL061State, pullups, 0xff),
> -    DEFINE_PROP_UINT32("pulldowns", PL061State, pulldowns, 0x0),
> +    DEFINE_PROP_UINT8("pullups", PL061State, pullups, 0xff),
> +    DEFINE_PROP_UINT8("pulldowns", PL061State, pulldowns, 0x0),
>  };

Now we have uint8 properties which get set via calls
to qdev_prop_set_uint32(), which seems a bit inconsistent
(though not actually incorrect, since all those set_uint*
wrappers call object_property_set_int() in the end).

thanks
-- PMM
