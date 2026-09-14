Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC75C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x64p5-0005W0-Q8; Mon, 14 Sep 2026 07:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64p3-0005Vo-V9
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:26:05 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64p2-0007qP-Al
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:26:05 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e56a1b327so1468542d50.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385163; cv=none;
 d=google.com; s=arc-20260327;
 b=Qsc1mGrcgzcjwCgWhDwiWXk4UiBqx4Qnw/LlvX+zrpNHwZw3wC3aOw8CyfSvBcCcUE
 THxyaD0XPVwlDZP77j02/dzp7GRn0gyyW/iUaK6/PrleYVivZgSHb226vvlNqXvyOykd
 o/0yQpmctVyssr3+eoy30l/yOoz8RTfEx3qZxLO3kWARnvQEt1Q3JctGdS0vZbntNXy9
 PtxaMY8c0yvYFYDLuKoRp5x5cFqqvUOOH3hFiU08Lk4Yan+mbbxGGAGGyy2mIhNuJtjI
 NO2IBawlxs8medFYAXoYKvGauNzGTJLzjspkSA0LDA9QbrcBT2U/8UgsLyk91IWDoYk1
 FwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KGXd6U3Obv31kSVPrgdwb04PokF5l5JzigAcSViv3CY=;
 fh=SqhxPnSmFWfEpRXPR8KUHYGB1iHumOvhlEh2LS1S0C8=;
 b=l0NSWL4mVPxaEJpXhV46sVWjXjgSSE84rwv+hfAdGiqdAUdFuDmix261d3FYL3ee8N
 k1ryHOrqEyKwCSckLZhzDRRkB0mNAg8EhFpNfG/h//HFe+KmlWu+NnLhvzTC8sDbL4u1
 Tf7t94sPgW/Mc6WC4Do409a/88Z6mjT4MrvbzsW9B/4z+zy0Bi9cQVQdIMxHhnPGLxr0
 oamaGb98p/WNi3L5XXM05ycFCqVW0a2k3B1aojx1NsRq/HxpkO4V1CuIkuTlAoQmj05n
 q24+g+pqagpIL68qBwN2xqyt8Fa75ve//kudHZ+gpjkWnB0Ltm1srfXjIGvZxZAVErO4
 E07Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789385163; x=1789989963; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KGXd6U3Obv31kSVPrgdwb04PokF5l5JzigAcSViv3CY=;
 b=PnoTMLNxHSAiFFHchz9xqDVU2Wy4kJ7V0ruEjb6ys0VD9TKWjFBQcCn0QhlH2tz1nZ
 bTBKhiM9AW1McDDVmFiF4R2PRfQH8YnasiM3tA7PsGNNq1SLzhdVoT3tm9FveyqYJEh4
 JvWHDeOfsfNX7T21aBZnBmDM6r5fKSQ2sc980bXaxE2PfG+8mfPFmcYGKAwcxIb4znzm
 Qb38BpKvdoosakAv0GeS0nQO+yPeAEpwjGCBe9MsKHV9s2y56lp1yztiogl/J2rirToK
 wb8oSDUlc9HItd0ZBz/5zL8bSIfTqw54azuyKm9K1XrJtYH+vhWbShdvZQXTmHh5xvNE
 sbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789385163; x=1789989963;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KGXd6U3Obv31kSVPrgdwb04PokF5l5JzigAcSViv3CY=;
 b=TwhNE1xpKS4+yDIOo84sU3P7BA7RUpic0lMmdF+v6qpOvy2Sxv4gBtCtsJY/Ox9gWc
 ZsifCgG3qS21ECV29OhOCVL3/7l5lDM5IoItiWTRXdcJgo2GXyIDbN5uyOKFPJ52ofj6
 q206xMrDUyFmjbPP0mCy0D3ycTH1HaRK1+NTBPM78j4eunizgJUkgoVrGYzM6dmPLhuq
 3UCOgR2khMI4RSDA9vxscRvu1Sz933zXMNdNC66+L+PdgSlDboAqtWCTr5dPa8A3TreY
 C7q90ImahnNhXTEvmxvxqGc6vd/jUULKPORvdsWyT3kbgMUzPz6n2KUBGFWWGO+FEGvy
 Ohpg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwS+G4mqG2eJ7dAlb9nYSWTaRfAMDTVvsSd3N8jJxrRf+zo6RRdA9LWCtZ1bMquXV21KpCuYmSf9A==@nongnu.org
X-Gm-Message-State: AFuF++k2PqBq4w8hGiYmrebIqz7xMBx03XrC0EkP5uYG+d2G6P09+gY8
 Sydl0KyW4zWXYobYvS3eBrhJ5Hv4Vts1uGGWIBqZZnRUlS91WPurE+fYH2Emm7OIuQ0cpzOFCNf
 Tm9FZWaSIxNC95Tfe+nzFm+qZpGywSh48plhRmgiefQ==
X-Gm-Gg: AYBFou22FcrtrMivVwV7rqtagg0SuzCAcMEfVkaIqRCe/4mHAic8fW9o1uQxJtT7ArA
 mQljt2JIVC/eOYb+meM9Di4LcHwCPY0+LSlc4Cw4xFhXQ//O8yvtLgnHc91NDXp8yUF4CRTjygh
 zod5v8xdDVytvocwk7xpn4S/pZId9/w81zR8RruVGalX1I5j9iTwWHvI/RgekPrTl7mXnjmMfM7
 HQ9B2CgNbn7XrobCR6V3EXBKdMOhSl8rF47FwEjgkV+fjZXvEz2L7EcLH4lotthNHrGgDYr3ZGw
 vVTzQi+3n+lf707/6YLd88MLNycww/GHI924UpznYPTRBqLm8ZiZKpj69NqhS5CQdOrXwf/zSEW
 iAhdNFpUpjoTDKseJc6++NUtF1rmgaHNJOUCoucM=
X-Received: by 2002:a05:690e:1685:b0:671:158a:ef96 with SMTP id
 956f58d0204a3-6714dfc87fbmr793275d50.11.1789385162944; Mon, 14 Sep 2026
 04:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-bcm2835-v1-1-b3719ca0df13@rsg.ci.i.u-tokyo.ac.jp>
 <CAFEAcA9aJJc_yRNYbATjA8d4ggZr_B=r5EmVNma1rzhi_ZrWLw@mail.gmail.com>
 <CAJ+F1CK3eC-t-uBDuCSd2VG=-hx9v+ev8cRf5_xh9oC=04O3Og@mail.gmail.com>
In-Reply-To: <CAJ+F1CK3eC-t-uBDuCSd2VG=-hx9v+ev8cRf5_xh9oC=04O3Og@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:25:51 +0100
X-Gm-Features: AcwNN1XN6kuQlPcZ1UAkEa2egw5zkbIeTGPudMOhp3ltCnUL4_02rdB0wAySaZU
Message-ID: <CAFEAcA8ysxWGFO9ER_HgU8P6j4uZ3gcb=eN90-1J2swYD+KdtA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_powermgt: Free the watchdog timer
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 14 Sept 2026 at 11:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Sep 14, 2026 at 1:32=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Sun, 13 Sept 2026 at 07:44, Akihiko Odaki
> > <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> > >
> > > It leaks with introspection.
> > >
> > > Fixes: 21fcfb604608 ("hw/misc/bcm2835_powermgt: implement a real watc=
hdog timer")
> > > Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > > ---
> > >  hw/misc/bcm2835_powermgt.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> >
> > Hi; Thomas Huth sent the same patch a few days earlier:
> > https://patchew.org/QEMU/20260910175001.76278-1-thuth@redhat.com/
> > so I'm going to take that version.
>
> And earlier!
> https://patchew.org/QEMU/20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com=
/20260906-nohmp-next-v1-3-2b21e63974f3@redhat.com/

Ah, I missed that one as it was inside a larger series. I've fished
it out of there since yours has precedence :-)

-- PMM

