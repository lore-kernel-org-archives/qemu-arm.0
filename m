Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E10AC88E65
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 10:34:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x640f-0003aH-Kq; Mon, 14 Sep 2026 06:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x640d-0003Za-RH
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 06:33:59 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x640a-0006Wl-En
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 06:33:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cc4902427c1so2457241a12.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 03:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382034; cv=none;
 d=google.com; s=arc-20260327;
 b=Bag3B+V47fU9pu0RZ9HcOkD7577SwWyF6HKxuKRn0hIZu3ZJN378G036XulT7a1Adx
 Fi+GcXIQHGQ3Et0lBXGs29UVW3nVpkyovF4QJTkwTVl0GVuIKy6N7aqNb5cIZA2n45Ar
 guPjmo93zwC5jj3WTNisOer7CBqChShT2Ie7pDLNOqsiA7yqkdQAn6XRGdPrfXWprwbg
 olRp1OaHN8GMZ9BSmIDMzOFm7cB0H/uq0RWUiqT7RwpI+dk1Ey9s7sSKT1+uSzACBrwO
 xxfpMVvuJ/QlipQ3OVrBQXOzq5FaAviSPxQwP2LLO5K017a6rD+2d1DR6lvm/h1/msC0
 n/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fKZYynrUhy0dgSF+lvRzbu13yyaWu88X0TePtwfk+P8=;
 fh=m6E5jzxXT0WjacGGOAXOtZQIeu30kbVyjfGm3qVHuF8=;
 b=ePiXsqEe1Ff2nXp8RB0yQA0gClF+W+sNeiI6TCJcCji+HoAF0kkb6R6goF9ESqYxg9
 q6tpiEqCB9k5tgNoE8310WD409wc/jGY25YLtHxXpy9Y8twG5B424Xn5NPieRdOMSlAH
 7gJ+K1me82Y4DidOevUqa5TRMFibdxjJtUUqmy9jK809Dq4lFCTz8uucTZcTqAW9gI9m
 02FxCNd8WHtugYRDFqxMcXtSofL2LyVKsvwTUApo0sRVQkVuCSLm7s7hRVzF/chpIB0U
 s4Mb0QDG+6zpPf2d6rrRjF9UVslbbSHoGchsvjWPg74J8CfqpBmzkZpngKp7gpIw8xAS
 ze0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789382034; x=1789986834; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fKZYynrUhy0dgSF+lvRzbu13yyaWu88X0TePtwfk+P8=;
 b=FZVs6wHa/UlTJde5uN5HErHTvk/wEO8TfoTmcWfqPXAovzwG7yDqbatQzFlBEniSOr
 YzIvE+Ac1s9AACi8E4wAJ5DgFhCOj9GQABP0tuqW7/FFiqUTY3+XGt9hYKEde/5ZFQiX
 UYIuDTKZt+q3ysktF81Bs07x7IR/objFrl0mS+XL53cdplNzF0J7SKLj4bsB+qPj57d3
 P7PKgT3fLnJWB9+Jb22L2ZUhAaNZ0QZkhDIq4R3mp9IsJRfMqYWZvz9Px4gGZmvDfGGi
 sm6yl4XRJDQOEp7ySNSn2zWOWxoeR3EBPFnCzbY3WJoa54IVE9mTqR/IfsC85bTCdpPI
 pWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789382034; x=1789986834;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fKZYynrUhy0dgSF+lvRzbu13yyaWu88X0TePtwfk+P8=;
 b=H1lgGQz2pfSZkwW8SSynuyXVHYg+HRwZciIudU0aSwr5Sq/uMEE3h3eTrKMDWqyD2Z
 UtewwG3W31VlrcqWr0Hj9Ifghzo5wzFJg8il1LJRGbfKlg293dQ5czPzp8OWOUwAlzNj
 Fy4ufkb0amLPghSwz7n72ZrtsiOT81Em+rm6paQjiZLfzRz/z5GdUp6CPMhH0UmOTqEz
 ZKheY05Xjd7kt/C/HF4b8iZPkKo1895hhru9Cl10drQb9nEjq+vOWQgY6I64NemMAv3t
 T2gpWM5l210Yp5mOYsITf8lZLOnEB+zIBpobORcG7zFTl2ahKYvkmbXeewO3WaUaE8Hz
 4aXg==
X-Forwarded-Encrypted: i=1;
 AKwUvByhN7xCE0CzPDj+PbQpkryfYB9hnhORtct9W1QqPRs1N0YLucDZi2toqTX9EOtERiJcow6xz/og2A==@nongnu.org
X-Gm-Message-State: AFuF++nC6TcY9ir+kPKt5YR1+KHr7LsTk3+mu1gUHK1PbbeflaaNcE8U
 QaZ8jArHcfxEH0H+pNbEy47OEwn+zkE+y7CuigWEX4fqYqH/HaHGO3ea60wng2toAUzUCcHchrw
 MpgUMqkiZLFeqaW5165IUq6aA1xepMCM=
X-Gm-Gg: AYBFou3OnXcpoaVEbZiQ8bmv7gGu5joBH9HlOQgJQpXrlvAaVqhyW69hl+d2kBl8Afb
 te4eRBWJuXS7jIpmWWOqEyQRl1yqdwfpHsN4R+juD3gJrO95YmKq4k/SU6nHAIo2roWrlpgzv+J
 uGTGqGNq/cdudcEFSriVUtVEgZ44BcVgeCxSgDPxzLkJENT77WNct2vYHdkT3HzQ4kjxIsN5a0w
 gC3D1ia3qP3Oo8xJnTG2/XTSjgwTh5klMcSGRw5+wpkfkhiAvWhrUg4t7t4h/Jyjgm4H4629eOW
 pVUF+nPG3jwUdtg9aEqEg7zVRhWW47sRmZQ4m3Hw2UAt/avL4GAMCjxleSkUDKmUY7mdaj12lVC
 5CnQiT5cjW7U=
X-Received: by 2002:a05:6a20:7d9d:b0:3da:e57d:4a79 with SMTP id
 adf61e73a8af0-3db26e46995mr7604754637.13.1789382034275; Mon, 14 Sep 2026
 03:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-bcm2835-v1-1-b3719ca0df13@rsg.ci.i.u-tokyo.ac.jp>
 <CAFEAcA9aJJc_yRNYbATjA8d4ggZr_B=r5EmVNma1rzhi_ZrWLw@mail.gmail.com>
In-Reply-To: <CAFEAcA9aJJc_yRNYbATjA8d4ggZr_B=r5EmVNma1rzhi_ZrWLw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 Sep 2026 14:33:42 +0400
X-Gm-Features: AcwNN1UoirxbKnK8eipRShsMfteuzohLlAaCu0Q71lV1vxDpC1UWalpFJy5vTZU
Message-ID: <CAJ+F1CK3eC-t-uBDuCSd2VG=-hx9v+ev8cRf5_xh9oC=04O3Og@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_powermgt: Free the watchdog timer
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi

On Mon, Sep 14, 2026 at 1:32=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Sun, 13 Sept 2026 at 07:44, Akihiko Odaki
> <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> >
> > It leaks with introspection.
> >
> > Fixes: 21fcfb604608 ("hw/misc/bcm2835_powermgt: implement a real watchd=
og timer")
> > Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > ---
> >  hw/misc/bcm2835_powermgt.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> Hi; Thomas Huth sent the same patch a few days earlier:
> https://patchew.org/QEMU/20260910175001.76278-1-thuth@redhat.com/
> so I'm going to take that version.

And earlier!
https://patchew.org/QEMU/20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com/2=
0260906-nohmp-next-v1-3-2b21e63974f3@redhat.com/

thanks

>
> thanks
> -- PMM
>


--=20
Marc-Andr=C3=A9 Lureau

