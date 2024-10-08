Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp349483njl;
        Tue, 8 Oct 2024 10:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjzkdJnG34JHeFrY+vueKqXDZdcE7NE1mpub3z+6A5+RV1uYUVlbb337Aa0jhiv6b1wFeGkeXW6sDg/w==@linaro.org
X-Google-Smtp-Source: AGHT+IEgUH0fByGA5rXQLK0Z4BMCyVk37Ghwcw4K4TOmMBc6sSVLBxk/MlzjOtbVFlMxno/XWIvw
X-Received: by 2002:a05:6214:3c98:b0:6c5:166e:566c with SMTP id 6a1803df08f44-6cb9a444565mr310175656d6.28.1728408369598;
        Tue, 08 Oct 2024 10:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728408369; cv=none;
        d=google.com; s=arc-20240605;
        b=MXiPfJcJcSKFAVBnN4ZmkqG5yAubZVtO9l7nsdr+O+dt6c+LDmUgvhdB/ZQIv6qw71
         QvMhQx7JSaBFLRelAmgw7Jm6NyHCNzsFaU4kPmvylBXJ7ToEWM/lRb9wjmCSnCKUW+hQ
         RRwF9uuvdo25lSD29rg6p3TrKhAJz1bn6ZKZjwtLrxsWbQnOdCDlnpijRF+tmDaYx47L
         bFaAtGgz++DctoJuntUAvUYBSCTnggVDFR6PJp+K1VF+nCm0YIo7WYTshPhKYTkWqJN+
         4H7ZeKf9GKFpiWx7kQxMym6IKf/lRq2VKJW+aFabonkSODATwI+UHGDS+wNh72k22Xkn
         qWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Bfbx6EmxK+mJ0k1bVBhXjrEoburTDH+qO0aKQ385QP4=;
        fh=GQERo58KAdRfA1dMCPBgIOStdtHTms/HdDP/FoU0u3I=;
        b=UFN9aFpXFqXoaTP1mRm85WfxVorzOTBTnUHgoKQDa7VOJw7T73Jj5EebvLCqPo3Sfu
         /T33q1giWE6W418Bckn9qA1f7+K41YViqDvq4EJAN3kfvhJS+/ZXsdfQZoFdIuSn6uGY
         Ejdzj1Sji+jOGb1PuOhwyduribms5n2fSU0Rdw3NVZMYhaKxmfx4cpoQpbLKjDMQmFy9
         MMyFt1zYAdGRiiI9kgKl+elQJMegkEybhPWcUJMDNaYqq3B7fjGm//2z/KCUkp1e0DxF
         IJ2JvOUdQDCd0EF73zFUq2ioN5tJbSLt5hugl1Xuenz25mYxSnKUa3fYUeLATnQtkBr3
         B3ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="3f/w8W62";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbc15f9340si14619276d6.16.2024.10.08.10.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 10:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="3f/w8W62";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syDy1-0005xo-Fn; Tue, 08 Oct 2024 13:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1syDxx-0005wh-4Q
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 13:25:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1syDxv-0000Qn-5c
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 13:25:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cae4ead5bso14725e9.1
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2024 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728408342; x=1729013142; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bfbx6EmxK+mJ0k1bVBhXjrEoburTDH+qO0aKQ385QP4=;
 b=3f/w8W62XhGALvrGsgItepceQd2DWPNMioABYd3BQs2KnYOwOABzTSJwdwD0zin22g
 VT7NZBjpstIkWX0GBUrp1efObq34jQOLpCClH471A4D054zOqQUfD4yat7NoRw9iNx98
 iw1z1A8FRHBkFl1OLrob9SD8+YMZZUIpLQqsR5n4UqFPYRHKzmHeLHnwewHxWF5yPAjF
 lJ7+HCOnFmYN2+Ji1hy0gAJ5CUd2kdW3BwmXifvgFGpwn2h70L00faVbZV1xuXA2Pkr5
 EGE3paXOPuH1Z1DXp6JegaSO8y8hnRuX1hrUtt42iL/CixdzYjvf9jSnsM7B67egmvMH
 jB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728408342; x=1729013142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bfbx6EmxK+mJ0k1bVBhXjrEoburTDH+qO0aKQ385QP4=;
 b=nTJz1B6UyBQDfkU0F7Nr5SrN+IRiKSmUWXgABRmu2lUHccxluooO40Db9HUSRE/Oz9
 CQhdsNT8iAEyto0Q24wR7v5DcHVA37ASKBN9MAlwgSyf6bD5SIcGkJgO7Rj5V0cs0xWh
 zQWS3UIFPgk3Q/c59PzHczNSi8NpJBAtcS9YaFuUdIJsYe8R14/Lvk/MaxENviqDvl6W
 AMWBeHmXKX1CnFBo1uUb7GWK7Z1XCJtYmXq09oOGV0zg3wU2CR7ALqUD4KhleBuYaLnp
 Ym6ciqAvwPnm9+2q94X/+RkN1xPE6+5i/xrir8Jnca8/R4Mh9TBlFnFXnLTkZrQZ+H0s
 Yi5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkummMxksz6qgZEhkuPvELzlj4lOod2AZ7GbZL0p05eUH8Nc+Vd725N5wdg4SLhZYaua3kv2xVSA==@nongnu.org
X-Gm-Message-State: AOJu0Ywlviw1Xl5UL/w3jVuF5HGXD3CsJiQvvv4UwmSPox2rzu5MYBlb
 /uFnJQypXdilZ9G/xnOVz59luacssI81pWgCoTtfMOfTJQSn07wRRvDNox0p1uQ5MysN8u7bazU
 bCMn/iKky+QLZXDj1CCcpyrJC1tZH5OK3t3+p
X-Received: by 2002:a05:600c:c0b:b0:42b:a8fc:3937 with SMTP id
 5b1f17b1804b1-42fcdcdbc9emr6126525e9.4.1728408341432; Tue, 08 Oct 2024
 10:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
 <20241008011852.1439154-2-tavip@google.com>
 <7994769f-efed-4eff-aac7-aa3828f603b7@ilande.co.uk>
In-Reply-To: <7994769f-efed-4eff-aac7-aa3828f603b7@ilande.co.uk>
From: Octavian Purdila <tavip@google.com>
Date: Tue, 8 Oct 2024 10:25:29 -0700
Message-ID: <CAGWr4cT=UWvk_v=908bhdbrg61tz8pgpa14_K+vps0d0sTZTJQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/25] fifo32: add peek function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, luc@lmichel.fr, 
 damien.hedde@dahe.fr, alistair@alistair23.me, thuth@redhat.com, 
 philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=tavip@google.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.027,
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
X-TUID: MqYiUZcPsRlX

On Tue, Oct 8, 2024 at 4:27=E2=80=AFAM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 08/10/2024 02:18, Octavian Purdila wrote:
>
> > Add fifo32_peek() that returns the first element from the queue
> > without popping it.
> >
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >   include/qemu/fifo32.h | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
> > index 4e9fd1b5ef..9de1807375 100644
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
> > +{
> > +    uint32_t ret =3D 0, num;
> > +    const uint8_t *buf;
> > +
> > +    buf =3D fifo8_peek_bufptr(&fifo->fifo, 4, &num);
>
> Are you sure that you want to use fifo8_peek_bufptr() as opposed to fifo8=
_peek_buf()
> here? The reason for using the latter function (and why fifo8_*_bufptr() =
functions
> are not generally recommended) is that they will correctly handle the FIF=
O wraparound
> caused by the drifting head pointer which can occur if you don't empty th=
e entire
> FIFO contents in a single *_pop() or *_pop_buf() operation.
>

I don't think that it matters in this case because the size of the
FIFO is always going to be a multiple of 4 and all push and pop
operations happen with 4 bytes as well. Am I missing something?

In any case, if it makes things more clear / consistent I can switch
to fifo8_peek_buf.

> > +    if (num !=3D 4) {
> > +        return ret;
> > +    }
> > +
> > +    for (int i =3D 0; i < sizeof(uint32_t); i++) {
> > +        ret |=3D buf[i] << (i * 8);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >   /**
> >    * There is no fifo32_pop_buf() because the data is not stored in the=
 buffer
> >    * as a set of native-order words.
>
>
> ATB,
>
> Mark.
>
