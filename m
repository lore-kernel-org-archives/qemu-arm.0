Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B72C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 08:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxKlZ-0003ih-32; Fri, 21 Aug 2026 04:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxKlQ-0003iA-DJ
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 04:38:13 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxKlO-000884-RQ
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 04:38:12 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-836c91bd782so11117687b3.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 01:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787301489; cv=none;
 d=google.com; s=arc-20260327;
 b=PSmFLcP0/w3pUNg3c6SOQJEDh7lNxiIbbTtcOa/73QTn67iBkC/D2tAYuAxcc3H0n6
 AwolBUXAffYLveJNaq4Pnkq+bk1CTgSO5AXJCD2cTzBtAppT45hYd1AfhON4Xk0kGJIw
 SIs5yRbKNFfM+Dn+3+0QVObLmEcrnSiW/F6NiJOpVHjpfsqv0RhqRiOZ1OhZpCIepEpH
 dd6BBMyXppvHZ9c+0boMyl8DbwzyYjEYBGnr1kGHzdUDRACyO5vEzkaBIRsS1A6bx9yp
 q/3iF1Q3/OJvr2GdUD7nbJ+9PP/OzhC3Rtyxxyr1OAE+ojUoFpEQWsAloqk6CSbma9Cb
 Mnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=driJv/iU1TGZAuFqXjz6qvmHy4wstCWvAUdKjcx/EAc=;
 fh=DlLTM6KvEch87Dtvu2JeAFhJhcKYM31xP2SsUFlZijQ=;
 b=SEKrgwFBOyJMwJkag3x118PHM+4ANNnuoPDStnzDs+0qxm3iU4jfi8W/FG5y1AiiDe
 qnIXHlYxSHh8+mv3TThkmirPsdL4mR3iaITfea+lB4fbCeYvXCErCaCoiJ2X4QKQzIyo
 9Vdg9KT7iGrv3SZyRriXI0wOeJDLXgV9P9OA7A5GF9RsMunEvLWFCMARlCWCskMdaF2s
 KfZLoHMsImPrwB/6KpS8Wmc5s6cBfMnXuTvI72nFfRlVlLi2LQNFdwXIkcQWW/Af0ohZ
 pSgQgpQfXqnhwfD7J5PSdrcLnl79XTSBJw/d3lxe3cBHjPE67DtRARGfHl/OMLNc1lS2
 ACPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787301489; x=1787906289; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=driJv/iU1TGZAuFqXjz6qvmHy4wstCWvAUdKjcx/EAc=;
 b=ln76Wsxsxv58B6HPyrisEgFQYplooGOyUBRFaj/M3jDMtVxMo5hxc3Zrweu8XB5TS1
 EZdIV8VirxZ3KAZ6PJ8qcq8qz88JI71aLqKjzHFbSmuhfJoyfyMHw0j0hSj+MI66EX6Z
 GVge0vYrDXdWlCg4nfuFW7RCESzUU1/9C5Ks9DGzw8CUPCFzQBeu9Xxv43Lc5LDi4VZa
 tVdrlEmNlg3fzjkEAmODv1Xpk7LkkQRo+UKbrJ/jZwjbRKg1Ia2/zRtbxyB5d2rkAbsU
 /Ea9JfHZRr9rEkbW0Edm5gclnw/qSagjwWm6I4Z5VKJ+i7FTX6gIHUgn5z2tOnWHugVV
 1Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301489; x=1787906289;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=driJv/iU1TGZAuFqXjz6qvmHy4wstCWvAUdKjcx/EAc=;
 b=C8plFe/rrIcIowyA/mBS7YPpTrX/MqL7ancn5VoFI6xvpt03BCeUAL6L2WQylgaZEk
 mEGXzgez0pNQMJ87iuxPlnJd0bCrJ42tSa9p22plzx2NcOtbk4W8N6cRHiNfa36BfRuK
 HjCGdnLrEszBabyiAX60wj4l/0go0L5djEol1XDO2nMyJOkddbeEIX0szp+LlW3Efgeg
 W28icE9up5awHZPFE9lcLKXrQbm0mUYTVJ1829LGD0o97vlK2xTMD86IcJ07FGYCK6vR
 6f5xc1IszPi4Ub7hwCHG5TPhn15hnBTSnDdVMNiShwQHX2vksGc6vh7iLTHVPXFs48uM
 z+sQ==
X-Gm-Message-State: AFuF++klk7dOt+H+PnQNeV9Id8MX4xukVtyz6Ox6+iyXLcgZ6lbnTGZ0
 SDQkpbyE59Dpd2ua83GGiZ03HFzeslKJJZh03fk64UYMvaWPeBGlL+zHD1u1iIrq5LUjnjH4kfV
 bUbcu5/1Zo7V26xmRvVg8hZ1CFPdYZ5vtPDx/ta5fuw==
X-Gm-Gg: AR+sD13T/F8TJarpkcK7gIbmdisySFe1PdP3m2v/CHlFu4hrMuRViww5SLdRtQUxeIA
 w+g7R7PJZX5b/eHJt6uj18Uq3BIiGo9Fr3quHzahmXP0Gj3weSHOy34RqGu7XTvcEJpi8W7pAcZ
 ZzxioQoMhHNyHxbHS3tAjo7MVrnTuD++pHHrP9HYUtzZoss7l6BgF/0+Y0HdAz1l3kKB//Qe6L9
 PUGL1aH4yLVBchN7YQqC2SvGRqrrZZ/OUGWvPp5JxON2h0r/MRrkrD1Qkj+XdtsrkC20k+BtuPe
 FkT2fLnM5SwQJwdwxTTa+sbsuvW1b4kUPeqmhhsFMD9GMrve/RwJNCAAgTS8xoS5/o7LdfDp22S
 Vy5I3CPJJ8vmkP6qtUoXPGxhXNJcK
X-Received: by 2002:a53:d7c5:0:b0:667:cf87:5838 with SMTP id
 956f58d0204a3-66ce4b65f65mr1559505d50.25.1787301489312; Fri, 21 Aug 2026
 01:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-5-peter.maydell@linaro.org>
 <6a3faf4b-2b03-48ce-aa85-0406e0ec4b67@oss.qualcomm.com>
In-Reply-To: <6a3faf4b-2b03-48ce-aa85-0406e0ec4b67@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 09:37:57 +0100
X-Gm-Features: AcwNN1VjM-xDsL_X43BT7HBtEpmMLE4QIyuFuVa3KTGXcl5E4BzjUHYsS8tZibA
Message-ID: <CAFEAcA_q3joQUYfDjvti8MGTm0Hbpzg6dPjF6Z2wuK_P9gBBNA@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw: Remove Marvell 88W8618 devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 20 Aug 2026 at 11:59, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 19/8/26 20:54, Peter Maydell wrote:
> > The mv88w8618 ethernet and audio devices were used only by the
> > now-removed musicpal machine, so can also be deleted.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/arm/Kconfig                 |   3 -
> >   hw/audio/marvell_88w8618.c     | 315 --------------------------
> >   hw/audio/meson.build           |   1 -
> >   hw/net/meson.build             |   1 -
> >   hw/net/mv88w8618_eth.c         | 403 --------------------------------=
-
> >   include/hw/net/mv88w8618_eth.h |  13 --
> >   6 files changed, 736 deletions(-)
> >   delete mode 100644 hw/audio/marvell_88w8618.c
> >   delete mode 100644 hw/net/mv88w8618_eth.c
> >   delete mode 100644 include/hw/net/mv88w8618_eth.h
>
>
> > -static void mv88w8618_audio_callback(void *opaque, int free_out, int f=
ree_in)
> > -{
> > -    mv88w8618_audio_state *s =3D opaque;
> > -    int16_t *codec_buffer;
> > -    QEMU_UNINITIALIZED int8_t buf[4096];
> > -    int8_t *mem_buffer;
> > -    int pos, block_size;
> > -
> > -    if (!(s->playback_mode & MP_AUDIO_PLAYBACK_EN)) {
> > -        return;
> > -    }
> > -    if (s->playback_mode & MP_AUDIO_16BIT_SAMPLE) {
> > -        free_out <<=3D 1;
> > -    }
> > -    if (!(s->playback_mode & MP_AUDIO_MONO)) {
> > -        free_out <<=3D 1;
> > -    }
> > -    block_size =3D s->threshold / 2;
> > -    if (free_out - s->last_free < block_size) {
> > -        return;
> > -    }
> > -    if (block_size > 4096) {
> > -        return;
> > -    }
> > -    physical_memory_read(s->target_buffer + s->play_pos, buf, block_si=
ze);
> > -    mem_buffer =3D buf;
> > -    if (s->playback_mode & MP_AUDIO_16BIT_SAMPLE) {
> > -        if (s->playback_mode & MP_AUDIO_MONO) {
> > -            codec_buffer =3D wm8750_dac_buffer(s->wm, block_size >> 1)=
;
> > -            for (pos =3D 0; pos < block_size; pos +=3D 2) {
> > -                *codec_buffer++ =3D *(int16_t *)mem_buffer;
> > -                *codec_buffer++ =3D *(int16_t *)mem_buffer;
>
> There seems to be an endianness bug here.

Not that it matters, since the code is being deleted, but I don't
think there is. In guest memory the sample data is 16-bit little
endian values; in this code path we copy it directly into the
DAC buffer. The wm8750 code then copies from the DAC buffer to
the audio backend, and it has created the backend with formats
with big_endian =3D=3D false. This matches up with the 8-bit-sample
codepaths in this function, where because we calculate a
(host-order) 16-bit sample value from the guest's 8-bit sample
we need to use cpu_to_le16() to write the LE16 data into the DAC
buffer.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

thanks
-- PMM

