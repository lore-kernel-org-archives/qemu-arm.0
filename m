Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp3453njc;
        Tue, 21 Jan 2025 03:00:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCU3y5kmAy5svTeYVWYi70iJ+KUP6FpdmO989BAzLWZVhPomz+W7yqP3/PrRSf9cU3vqarPfd6t758Og==@linaro.org
X-Google-Smtp-Source: AGHT+IE3uGwV4XIPBD0RzgHztMhEp0BG9NvB7kFt1IoNx0HXPZKNbGkQN4THaXBbAWFr12EoAvlg
X-Received: by 2002:a05:620a:2699:b0:7b6:d273:9b44 with SMTP id af79cd13be357-7be63202359mr2956955685a.18.1737457253021;
        Tue, 21 Jan 2025 03:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737457253; cv=none;
        d=google.com; s=arc-20240605;
        b=HlQXObeKcX/pmeF10Gq6N6Ji1vo93YbIBnZJQr0kf4ANK5rMosELAPH9uO1H6snpHR
         zntMBxu0/R0D3mlu663vjViT/aefui4HmVQh+UdGaG8Sv+uVJ+8NOvOdMMd2GgD5MEbI
         kQbOqMJcrC7N5x5ZvDeEbhcF6ba/O/ozn7LBSpPT5+IYv1k+mcE+VNVwNxSOeVtUoLIa
         8BOKtRcBm33/AG9zVQPwpxMqqf+Pogzl76TPaNbHX5wW6GalpMTcSLm89Tk/l9nQleCl
         jVHwkpPBJxt2YGYlXVesRQKHbOJyE5FWKaBfQ782SbfFc66l1k4wI02V97AzmL6mo31E
         764g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zndr1XYkJikd7VIgMXUsHDwmWp2anajoRq+WP7WaRSw=;
        fh=xrXcnxgdR3gwShcNI9aDvxdgSw2bt/7PcADGkD+SIGU=;
        b=fEYcj3N/ouupIwgQfh72ko0AzkORO68lBjWFhgpc5KUEcx1ONh6gHnbkcG+fQWMvq1
         0dWVqZQl3Fukz5XgDmD7mRdRtPTlzZy6T9VNYALPfX/pU9mBEbQJFio9Z0F4yLJIAcC6
         T+B9kKmUjTTwD5LYEvLpRM8tEi6vg2HvgPjV+0SVXK3zN8zEcQi59a7WDPOFVOUw3mvx
         iCN1Y2jk+yEjNTPwlKklrttVsYIdVypDZ+Vg7Dd3kgBzZsSi+bUlQpDLUmoWnnqpvseU
         lAb6B8OvCfLDIHt0rn0XFnzxtsQ116CrRLGHjrfwG7qyL5SLz1VOGw8ZnS/KXHvM6+ld
         NWqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DPmmjFoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146d115si1183540085a.108.2025.01.21.03.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 03:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DPmmjFoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taC02-0005ec-0K; Tue, 21 Jan 2025 06:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1taBzs-0005aD-Lr
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 06:00:41 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1taBzr-0005Xj-2y
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 06:00:40 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3a2264e1so13285e87.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 03:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737457236; x=1738062036; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zndr1XYkJikd7VIgMXUsHDwmWp2anajoRq+WP7WaRSw=;
 b=DPmmjFoZh/eMEAX6dn1ssuB2JvnRYX97k+Z+J8Dczs+1aSFHpU4SLTgjHJgMpmUnEh
 hFl3XTbKNxAKjrb25BoHGSzJbdEZWkVeJ1Q6inbZKNXSVsXdGcknZhNYEopEkbNQu4/A
 XWbbI4F10poWmpt0ocF3CK3mh0sB13QHaw73Hxy+i0ZtOn22Brl9rkfozU6HoBwKIyot
 8OGTPVWnxR/Cl+qwfhNOL2dkm5kzX1abc+6TI9r2rXjhIuZ4AvX65yUkngFrHFWBi9fw
 0uR1nDzxmdbh49K1vKH728zi0uAY/6r3jQFD8A5fiP/fT/L2k3Wb+79RdK0vtHRRPwt4
 H0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737457236; x=1738062036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zndr1XYkJikd7VIgMXUsHDwmWp2anajoRq+WP7WaRSw=;
 b=ZQXreLvO00aw47hr/mUsM4xLsd+RPwJjKxIuzxw/kGTIROjdm8rSnSg6fy9bTlGTw+
 bZcHuCfZ2NvZUyDFsnxxbWasO+B1eB7HIyxQECSUuDifYVlWcG4kDE1KvxLQV+vbdeH4
 9CSmkEAm2v3G/7NTa34jnl+j2PdEOyzChAi6wyenAfWjFAjoZU27fgG4UcwnuzgZswAt
 i4skTR9S+Zbe52XK3Krjyxy1nrg3EijBBcWJRBOLS+ZaFKWi4JQqDaL0zHugmyCXG5wE
 jqauLwr1wK3T9uWIOPo/4gJfwylTdIOM7WwZrkG70ouOL0eMheot1chkzcUhJC4R5CP6
 7QLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOer+GxvSXXoEMoMNytkvSsKMoV1iti82Db6NsEQrEqRM7EG0PQaGt587nC7fQytJTvVqQ10XhQ==@nongnu.org
X-Gm-Message-State: AOJu0YyoknUnVFNTsxGyvEwTisT6DDME7gZMBrY5EwLQciJAdlBJrW0y
 MvlNelBhNwI9gJoXwB9XVMI9nYw/FjEonvVvknSWG8K+pbQjZkpA8FwLD61Jw36bW2mun5KvkVi
 +32YqLC1HiCbEeFM+h++StP7+uXWSxqieIcIFa02/Z3nmeyRGh+YY
X-Gm-Gg: ASbGncsJBFbTtfuD7W5JVSY8yJkRUbd5yuSA5P6RtMeYL87mY/zyaeFEOhGIlvYILPW
 V/9gBw2YHmYHmtdjXf7vil5xeAPpUx3Dm7W6uVpkUzftUanHZQu0=
X-Received: by 2002:ac2:44c1:0:b0:53d:e822:ebaf with SMTP id
 2adb3069b0e04-543a3b7bfadmr449243e87.4.1737457235897; Tue, 21 Jan 2025
 03:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20250121103608.3056288-1-titusr@google.com>
 <bfa02ef0-12a3-46b5-9749-c9e367145dc3@linaro.org>
In-Reply-To: <bfa02ef0-12a3-46b5-9749-c9e367145dc3@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 21 Jan 2025 02:59:59 -0800
X-Gm-Features: AbW1kvb-boAJNdBhMF-t1O54wCt4BYwbJKw8R_3EYw55ouj2y-NVuKWYSMY7srg
Message-ID: <CAMvPwGo=5vZRwDvkefEQ-5ooHHvagTH_6yHQ1EFbBpCD+CX1yA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: i2c-echo: add tracing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: minyard@acm.org, its@irrelevant.dk, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=titusr@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: IcuTIoVmDCMv

On Tue, 21 Jan 2025 at 02:43, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Titus,
>
> On 21/1/25 11:36, Titus Rwantare wrote:
> > This has been useful when debugging when unsure if the guest is
> > generating i2c traffic.
> >
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/misc/i2c-echo.c   | 13 +++++++++++++
> >   hw/misc/trace-events |  5 +++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> > index 5ae3d0817e..06110e0f8e 100644
> > --- a/hw/misc/i2c-echo.c
> > +++ b/hw/misc/i2c-echo.c
> > @@ -13,6 +13,7 @@
> >   #include "qemu/main-loop.h"
> >   #include "block/aio.h"
> >   #include "hw/i2c/i2c.h"
> > +#include "trace.h"
> >
> >   #define TYPE_I2C_ECHO "i2c-echo"
> >   OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
> > @@ -80,11 +81,19 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_eve=
nt event)
> >       case I2C_START_RECV:
> >           state->pos =3D 0;
> >
> > +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_REC=
V");
> >           break;
> >
> >       case I2C_START_SEND:
> >           state->pos =3D 0;
> >
> > +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEN=
D");
> > +        break;
> > +
> > +    case I2C_START_SEND_ASYNC:
> > +        state->pos =3D 0;
> > +
> > +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEN=
D_ASYNC");
>
> This patch is doing a bit more that what it describes, since now
> START_SEND_ASYNC returns 0x00 instead of 0xff (besides updating pos).
>
> Please split as one patch per logical change.
>
> Thanks!
>
> Phil.
>

I've removed the async case from the patch as it's not something that
has come up.
- Titus
