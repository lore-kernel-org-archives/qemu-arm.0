Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp18000njg;
        Tue, 17 Sep 2024 00:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPv0ItW+9g51kMCpDSr12v5RiKg+v5vPHOV3JS9fo94B10kihXW3tldFFZhQZzjAtG7X1/iaMLFqruBA==@linaro.org
X-Google-Smtp-Source: AGHT+IETSg7PwCcyxiZEcdibuGSYD96Y8t4tHcpjhpDqlyHggS8fEsJ0hvi+YKMUPSpPV29KHX9D
X-Received: by 2002:ac8:59d6:0:b0:458:2894:984e with SMTP id d75a77b69052e-4599d2256b1mr277759041cf.3.1726558854282;
        Tue, 17 Sep 2024 00:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726558854; cv=none;
        d=google.com; s=arc-20240605;
        b=FGjc7czg1KGOMxqiXEZ6hC0ri5jRYNrZqrq8U8HE8Ixe3uu0b7iS7M6SZhyHK0oohL
         6PF2dco72RRXcUQvlNUV4mDzB1EkS/bl1vM9CGzEiTyj6qHoAhFUgNufJdtxYne/mvHY
         ke6ZehvwuRx0cNED3BsRM2uGockYIO1bzlD84F9Q666ofu8LVW6TD9Fr0LGVDiHOrW34
         LrJIrpksLu21hGM1/7y3Rg32argt+XVQaeY17PnxTt5ER2tk3AoUYf5UtYAd6WTTlBXH
         TuJ0qNowOVIlzQ8qtoJXpt587tw0bkfM9z2mbOx8i0jWmEYVnXlMLo8WNBXVcpAQkjPZ
         PQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8j/fpIkfmWBIjF0vfufAq2mviuQLZAmdOlBbVub+gG0=;
        fh=qxq46Dg51vVMSESIc8ft3IFUgB+4/ezkClOJ/ogbybk=;
        b=dVpr/VPkBrHJBLL0K8ifgNuC4Ica8+4GtfCUq+124ul9Bm0hjVtYvkZXX8LLcCYGvF
         OSxh6YOWQziROTOQItc1kTf+t0kqL4XhcVQfdnketB/1bNiegZUAxE4tiSCv2bMSMelL
         sXcMPYat+7yyER9AUmI1XAGYnK/W2JSrGNX9xNECJCa0k0oAPJrDfirTW5xnxUTLobIq
         OFvlSvEAOh9Y6kss1K//Wfr4x/zadE4fVmm/IVD+u4C3b8/xUi/8fRiQrwu9EW7POkiS
         6p8N6k9DhwrtYSzRuRxlR08I6bUtS8HKVjPMwEMoSDcJWBKnMt2TzvKPMMXrs/q23zKx
         EtYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="v1yzb/sI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-459aaf32a89si78392621cf.554.2024.09.17.00.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 00:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="v1yzb/sI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqSp8-0002t4-F4; Tue, 17 Sep 2024 03:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1sqSp7-0002rx-Gi
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 03:40:33 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1sqSp5-0007vT-Pt
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 03:40:33 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53661d95508so4201e87.1
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726558829; x=1727163629; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8j/fpIkfmWBIjF0vfufAq2mviuQLZAmdOlBbVub+gG0=;
 b=v1yzb/sIB06ERLMXuXqN+vWAesdVOVNOyInyLziFmIDAMgDd1suhXHicNMHeVGxsoh
 sCdaS5uF6dZF27/AjVQO3eZTSIabwJSq6WCZvR8aHURQI/9LwLtCCX65CQRG0moh1s/l
 PxDkA6h6dTxKoAXdT9I2nU0poTZ74BVroKnTHylxi+5A62I0vmNufQ284scdi6I67xmW
 pi8LXn7d0bF6sjwAPyDqV5Tloo0UJt05wWrcJeSoJPtYiLG22nE4SCa6Cjxzw+lG9g9U
 kKWXJTujYa9uejSuSaIjSutgkwtwk7G2m2VeohUBS6MCLq+95vHI5Q9PCzK/2pJ4CehA
 CnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726558829; x=1727163629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8j/fpIkfmWBIjF0vfufAq2mviuQLZAmdOlBbVub+gG0=;
 b=AfMp/jhCA89aKFoFpWIR0o5wR0SRbRSJteELtDCiiRovsATTIjov4yvHzfYyZd+Juf
 +TyjNwcuqGzgsUzTwlaecrpwOAFbI+pxAhthGagawWo2k0bfYgYrUP8hDXIXPaFd13qp
 zbC+2ozrbV/SQ4ls529sszBthVD2aOfpd6i9ADefw4E17U8msI7D/GZdBbCdbu2W6gbS
 pGSxzt3SDEhwiTj6glOGRNUGkm0NeEpT6ToEhHmmowXA8QY3J31pEVVEwMgmXFXFWIeZ
 aZt++q0fIYFTozAwC/1n+AKr7evCmAZgY6Z61RSacs0JODkA7SYqdf4WDPWN/5WkdfDK
 t3HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZQu5qN4Z9YPw3VpaN5ZyeAh8ikQCMvyEFIpDI8wtTJVSjp72qIcB2UBBY88JhYEaCF3yDuDg+/w==@nongnu.org
X-Gm-Message-State: AOJu0YyqeLpM8DUA1iKUDqmqTnTddcMiwKkvNV8NldkpfOMtI7vzGU/a
 qj11ZxrQNUWHs80AYJD7s0MEjxALhW0ZQn4Ca/BE3+AGrp89WSnH9VkM8enKuOLeGO1iHJZNXoJ
 X+zpxkcirK0sIGZdI+wH38FkylFb/QuNPP9uL
X-Received: by 2002:a05:6512:2312:b0:535:68b2:9589 with SMTP id
 2adb3069b0e04-5369bbddabdmr78507e87.2.1726558828342; Tue, 17 Sep 2024
 00:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
 <20240827064529.1246786-2-tavip@google.com>
 <0fa93707-d092-4db5-a4a4-f000df881ccd@linaro.org>
In-Reply-To: <0fa93707-d092-4db5-a4a4-f000df881ccd@linaro.org>
From: Octavian Purdila <tavip@google.com>
Date: Tue, 17 Sep 2024 00:40:17 -0700
Message-ID: <CAGWr4cTULB7PShTFUoDfTUiEBt+G7D8XzvVnAcmGYJO-4RZEbA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 01/24] fifo32: add peek function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, luc@lmichel.fr, 
 damien.hedde@dahe.fr, alistair@alistair23.me, thuth@redhat.com, 
 jsnow@redhat.com, crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tavip@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: yJugLtjkSW5t

 e


On Fri, Sep 6, 2024 at 4:53=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Hi Octavian,
>

Hi Philippe,

> On 27/8/24 08:45, Octavian Purdila wrote:
> > Add fifo32_peek() that returns the first element from the queue
> > without popping it.
> >
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >   include/qemu/fifo32.h | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
> > index 4e9fd1b5ef..77aab488ae 100644
> > --- a/include/qemu/fifo32.h
> > +++ b/include/qemu/fifo32.h
> > @@ -140,6 +140,34 @@ static inline uint32_t fifo32_pop(Fifo32 *fifo)
> >       return ret;
> >   }
> >
> > +/**
> > + * fifo32_peek:
> > + * @fifo: fifo to peek at
> > + *
> > + * Returns the value from the FIFO's head without poping it. Behaviour
> > + * is undefined if the FIFO is empty. Clients are responsible for
> > + * checking for emptiness using fifo32_is_empty().
> > + *
> > + * Returns: the value from the FIFO's head
> > + */
> > +
> > +static inline uint32_t fifo32_peek(Fifo32 *fifo)
>
> When respinning on top of Mark's Fifo8 work, please un-inline.
>

Do you mean to move it in a new fifo32.c file along with the other
larger functions in this header? All of the fifo32 functions are
defined as inlines.
