Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF6C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 03:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whfNa-0007gi-Fb; Wed, 08 Jul 2026 23:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfNZ-0007g3-6N
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 23:24:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfNX-0007PN-JG
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 23:24:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so1120189a12.1
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 20:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783567485; cv=none;
 d=google.com; s=arc-20260327;
 b=cQYvd9UDXpMR9Q8PI6LA321bNxcLB5FYuNATL0PckTJMUZLTjYmXWw5MkJTHUTLBUQ
 h5kX5352QaCUEUaXAwmNEFJNo2/FCAIun1tL3MGO+zUX+v/X25BenAhCCkU789P5YC88
 9Vj45pI82tTCfwrV+Vi5vJbtofZeBm+tX/6c9hIIGBKBJhjiZ5hbRhq6HZSIKRhL1/bf
 PVNuvOPyjrtOIAnkbgXLzh7I1xbRtWoGWgiEQzZwiHGo6BsNdLMYZQidbyYl12fYfNdG
 EVWnuS8igDc7hCls+AHzlvoNJtzSnjJx/m8hZ7juEiJJwmBvsJkChjE2GVKIYJnP03JL
 UcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ng21UaoMrWYg72GHTzSnmQ+n9Ud5epwyJFjuyHbRGY0=;
 fh=RgbiYy3UVRoACidXI06c4EcH/9VrbWfbbcaw29Nc+GI=;
 b=YtWv23RUIidKEE0dwLGW6lO0wMsct58Tufj/Y+9+WLmOh+WG6QdMiDDtwObcd4XHcs
 k4YAJVeUK+vFZwj3E2EdAtQAd3voPlmkhbFSJFlaKN+fp+cZpplQvG4fhauruuPTcOnT
 jQ3YS2GxOmUszwLry8cTm8ciDf5bOrW6HKUODQZcTm9jRY/I4i98BbX8oGqeLD0vo9q9
 S7Ku5Iagghnm7EV54E/cq1d8/xdf6r3HSTI3zid30pfIP6QLdbRvnnOll1M/VhDbFjDC
 D0R7s5y3agVYnkponTYT3COQar3YNhq6Ffolr+Cr8qkv+6QGIQppvu14dhR1d7gQih7p
 +BBA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783567485; x=1784172285; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ng21UaoMrWYg72GHTzSnmQ+n9Ud5epwyJFjuyHbRGY0=;
 b=I1uJSoP1/x+BZ1S9OW5gFrd/MfM6L09acsZ8JWN+3FpT8fABDP0xvN/eQpyreG4jVX
 YkOPn6gsh+pq6VdGjOAkgy0H8hxH6MbSCMLqOJlfeKiptt+e7bFfAqq7qxor6T/JmbJw
 9A/hvka82Qdde+vypcz2ESXhIMUx0LaJULkroh9fIrUiyjMJpz2pB60/ELa+8yyu/5zn
 FfgXJNW0wLcbMcFN9B/jMlMG/GE6jB7wHxmqYdy1XS4YZv8pulu1zIpoPMYoLWvuBaM8
 5RnxNCcHRxDofBoK5jbNqQ+mgV6IOt55sZXhMBVqps9XvAiyp0NmERy3HINIOzuFrk0Q
 uFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783567485; x=1784172285;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ng21UaoMrWYg72GHTzSnmQ+n9Ud5epwyJFjuyHbRGY0=;
 b=mawCM/3kT0ty5vIjbtQFG3DfZKgVNwLWPsEqxvzB9H8m02p2lxMKqNF9C0yXRDTtjD
 d1dxcAZi0KR2qtgsZlzXjMRD62hx0xu+XTdi9XPD+X5HJPumWrr3fugKjfDft9tZuSXt
 DcvCLJSlGdPKFP1UFDyIyMF9fRR5ekWTEouOpRx73WEDU03BWAEVgG+9m4wR5iOGV6oH
 MByFu6TeJEyAEpSxtIAzgLNn6dViLwMiJwplBIWbm+4XBJbzcRQBYq2Rq3wAvbjmAgG9
 r6jFD3csCC71K2ezJStVtbfvHWkelnSy1KfgQS6pymNJkn3mfzr/QS3DnZyXqqZnkw/y
 AKFw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roa1iruBGdpPdVOog77Q8lXeZ6oQy61s8HiS5IxQ529M7YUWK3HW0096eOpJW72mUcCRg8XW7m5mA==@nongnu.org
X-Gm-Message-State: AOJu0Yz9e89GJV8kE/Li3lo1TW5jX155Jg3lP8V4mevNt+9UGICwPLfz
 86rYFErNqUSJpHW0ZjNuZIOYX0BV7RnLEe5L7/JDtbFj5J6oMbuAbOTCfHK0/5VFTLO7cxNFTx3
 oViDRXJy+w1rgQAgBQdZnvKM8hvCKRNk=
X-Gm-Gg: AfdE7cmYOILShiTnk/rFfvfR4n38STuxVdkYl8/Y07c9BjTcwW7VdoEtK6RAxL5kDmx
 fgNBQzC3v5nAN9o2qm6GmV9jwsGYqwCHGYJ8cyl4XEPQS1lfLUOI1qwQltnU/OyMsYFzARa5rzQ
 xg+NswCYZDkFPQwgR21b8fja6dTEaWN9qOYNvnpeczQCeS50A3aQwLa39rBiKkdC7T8Lh0XHI86
 kt/D2DrfwsmQnzl2okUD8YSmObm1LFe0lO+OJe4LrGsSCaltAvfZj6bP6yk7gBKDR78XZ9j2hx9
 c58Ry9p3S4c1MDcXSP1rJ7sVlwo=
X-Received: by 2002:a05:6402:4306:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-69c01b81c71mr375197a12.7.1783567485298; Wed, 08 Jul 2026
 20:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260707145407.70287-1-corvin.koehne@gmail.com>
In-Reply-To: <20260707145407.70287-1-corvin.koehne@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2026 13:24:18 +1000
X-Gm-Features: AUfX_mwZe-tlLQ94Prq2m4JmqQ2Enya9vPDfJcrHq2m698UQsAYK88z9CwwnNPE
Message-ID: <CAKmqyKO6bph9pnQM8pYD=_rPu+c6pn17HODDcJCfFH7WPZ9eHg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/zynq_slcr.c: drop duplicate reset value for
 DDRIOB_DCI_CTRL
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 YannickV <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Jul 8, 2026 at 12:54=E2=80=AFAM Corvin K=C3=B6hne <corvin.koehne@gm=
ail.com> wrote:
>
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>
> When adding a reset value for DDRIOB_DCI_CTRL in c8ba862dbfdc, we haven't
> noticed that a reset value already exists. DDRIOB is a 32 bit register, s=
o
> incrementing it by 12 will access the DDRIOB_DCI_CTRL register. According=
 to
> the manual [1] the correct reset value is 0x00000020. Additionally,
> c8ba862dbfdc won't work with a reset value of 0x00000021 because it tries=
 to
> detect a toggle of the reset bit (bit 0). Therefore, we drop the old rese=
t
> value and keep the new one introduced in c8ba862dbfdc.
>
> [1] https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Register-slcr-DD=
RIOB_DCI_CTRL
>
> Fixes: c8ba862dbfdc ("hw/misc/zynq_slcr: Add logic for DCI configuration"=
)
> Signed-off-by: Corvin K=C3=B6hne <c.koehne@beckhoff.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/zynq_slcr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 0ae5d607be9b..d0f899c3be4d 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -427,7 +427,6 @@ static void zynq_slcr_reset_init(Object *obj, ResetTy=
pe type)
>                            =3D s->regs[R_DDRIOB + 3] =3D 0x00000e00;
>      s->regs[R_DDRIOB + 4] =3D s->regs[R_DDRIOB + 5] =3D s->regs[R_DDRIOB=
 + 6]
>                            =3D 0x00000e00;
> -    s->regs[R_DDRIOB + 12] =3D 0x00000021;
>
>      s->regs[R_DDRIOB_DCI_CTRL] =3D 0x00000020;
>  }
> --
> 2.47.3
>
>

