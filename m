Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12928CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 20:51:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuGsI-0003aq-1X; Thu, 04 Sep 2025 16:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1uuGsF-0003Zg-Dq
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 16:48:03 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1uuGs8-0000mW-0M
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 16:48:02 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f6b77c91fso804e87.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757018869; x=1757623669; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dr49+/TE2wXDXE1qirriA0xB62DpArjWBKhXglp+OL8=;
 b=PE9vMdywX8A+sJUJFzu6//jnrYPGVY+rocqM0y/Z6VzycP5a71tIxWXVNEWI+XeO1O
 o8Ywh+Tba8SqdldqkQl3KBpqJBAFvgX8X0GnnXs8OThSX4jVfjpMuMvIeJ1Ql47t9SD2
 oX7Yhm7Rp3fep/8yH+WgxUMzWGXlQuPtZUFlGJwAKBoMqGoYRITUs0q4apIRGlVzRnVz
 wZ4LIJXeLzjEka+iQoJ6zE4Hnco72Sehy/Unv3InTYRw/oVhWDG0BrQ6r2TDM/S6xznl
 tGDIby7EXpwMVmnlPqy/573OfpEBJDqqLChC6AJEbaJPKIrNavmhP1U6YhfHgDWoXZ9K
 HT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018869; x=1757623669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dr49+/TE2wXDXE1qirriA0xB62DpArjWBKhXglp+OL8=;
 b=qK4ZrRofGOGOzrbIYP70q9mdq8Ds6AF4YUaZo2kq2yd+zzeLSLxg28+0HSimMICspY
 eQFU5N6LbWhHL/VG3Us4GshHG+yht9lIdrdxoVgYPb7Ac11Qgrdud2SBZRlssN3SPx4B
 Baun3Qlu21hUQ4RxIvxmPXFgDogFCYvQRDezalaRRHNv6c1ut9GGSg+QAAQW/FWtTI8+
 yjjvevygv+/wWQnoRvcvY7ZeNUhzoZiagzN0A/9MDrvFcECkm96v4S6F3sBZpPb4j/zr
 iAE/PTpvFEqEFtkjkjcy7BwDW1l+AsXMPNwaBr8++rDBd5faq8+SyT6/edYlkbX8ehDe
 kp3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqQc5KkzW1lVKApzBEvdthduCy2PMs3rhMfnWHSN0TMr5ktQVmgKtdDFsm3GLvqewjjVW4sqafmQ==@nongnu.org
X-Gm-Message-State: AOJu0YzkqyuTxEzkiWwyEqDY1UZlKuk0pS/PQWUOCUFedsYM88JK0bvB
 K+/EUIn+e1iFGGATMmC4/7c/eC+UCRr2l/nDvAN/wS+3RBc+CvAyzkP4a1Sib3vuAVnMrMRo7PT
 2r/4cc77yuejmLEfCoCqb+GFSnhfcV4N079vOPyV9
X-Gm-Gg: ASbGnctebCSp8DzuBXrAomZ30vcAShcdY9Zscoy/bmWjof8M5J4PB3JlAsAJuNdjI5c
 Sty4kwijMrmth6Q6QXr+acxjr6wKBbeX5Ig3q8tUQ0HTrGxLFP35Y9Z/WZ19caovg3lrjzxQr1s
 ZJosCuQn9w9L3FKHaumRjojbn0ZDyeCAwnswa1beG20QefDFVFVfVcycH07h0wwmOWXpwSxBgGs
 wiltYtxNIOdDxy0J+KsVZJeZJhoYdJ+Q+uL/2PhKDdW
X-Google-Smtp-Source: AGHT+IE2r9g4TdemD6DpGjvEnlfAQ4oOc6iES/Hfhgn9iGUKHmC1rqNCh4nms5fJ1yGozYzm3xIm5r6UkXT0QlrMv9k=
X-Received: by 2002:a05:6512:1145:b0:55f:6cac:c94 with SMTP id
 2adb3069b0e04-56136fa0033mr8837e87.7.1757018868973; Thu, 04 Sep 2025 13:47:48
 -0700 (PDT)
MIME-Version: 1.0
References: <20210708172556.1868139-1-titusr@google.com>
 <20210708172556.1868139-2-titusr@google.com>
 <472194f0-5853-4c7f-8b52-3c85e902097d@linaro.org>
In-Reply-To: <472194f0-5853-4c7f-8b52-3c85e902097d@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 4 Sep 2025 13:47:11 -0700
X-Gm-Features: Ac12FXzTh9240eK_bGZv7iMuuv-ehW3FRorzo6SsQlIAFycz0vrM6HMW1704DG0
Message-ID: <CAMvPwGqcn8fs0JWdcG1zsjZr_=Hny58Zuu=+wN_FRgvL-yTpUQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] hw/i2c: add support for PMBus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Corey Minyard <minyard@acm.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=titusr@google.com; helo=mail-lf1-x132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 29 Aug 2025 at 09:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Titus,
>
> On 8/7/21 19:25, Titus Rwantare wrote:
> > QEMU has support for SMBus devices, and PMBus is a more specific
> > implementation of SMBus. The additions made in this commit makes it eas=
ier to
> > add new PMBus devices to QEMU.
> >
> > https://pmbus.org/specification-archives/
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   include/hw/i2c/pmbus_device.h |  517 +++++++++++
> >   hw/i2c/pmbus_device.c         | 1612 ++++++++++++++++++++++++++++++++=
+
> >   hw/arm/Kconfig                |    1 +
> >   hw/i2c/Kconfig                |    4 +
> >   hw/i2c/meson.build            |    1 +
> >   5 files changed, 2135 insertions(+)
> >   create mode 100644 include/hw/i2c/pmbus_device.h
> >   create mode 100644 hw/i2c/pmbus_device.c
>
>
> > +static uint8_t pmbus_receive_byte(SMBusDevice *smd)
> > +{
> > +    PMBusDevice *pmdev =3D PMBUS_DEVICE(smd);
> > +    PMBusDeviceClass *pmdc =3D PMBUS_DEVICE_GET_CLASS(pmdev);

> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: reading from write only register 0x%02x\n",
> > +                      __func__, pmdev->code);
> > +        break;
> > +
> > +passthough:
> > +    default:
> > +        /* Pass through read request if not handled */
> > +        if (pmdc->receive_byte) {
> > +            ret =3D pmdc->receive_byte(pmdev);
>
> This returned value ...
>
> > +        }
> > +        break;
> > +    }
> > +
> > +    if (pmdev->out_buf_len !=3D 0) {
> > +        ret =3D pmbus_out_buf_pop(pmdev);
>
> ... is overwritten here, is that expected?
>
> > +        return ret;
> > +    }

Yes, this is expected but it could be done more cleanly. I can only
return a byte out of pmbus_receive_byte() and this is sometimes data,
sometimes -1 for an error. At the time, I decided the valid data in
out_buf should take precedence over returns from the device
receive_byte.
-Titus

