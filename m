Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp434333njb;
        Thu, 27 Feb 2025 10:45:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGXTVvMGZCr9rmzambr39Gz/astuf/49y0ll4hFi8Ov5fK0x0dDdI8Vb/5PMPpV19rxsIdlDqfm+4utg==@linaro.org
X-Google-Smtp-Source: AGHT+IEg1zgg5QZ70PyMq3LPiYYHijReFBy8C8hqZfcnOvOR2zhsOnUzlsSNQoVu5x8juZ9Bdfzc
X-Received: by 2002:ad4:596c:0:b0:6e4:2d8e:5cce with SMTP id 6a1803df08f44-6e8a0d97457mr8552836d6.36.1740681901916;
        Thu, 27 Feb 2025 10:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740681901; cv=none;
        d=google.com; s=arc-20240605;
        b=CMI0A0C6Gi2UHWOFZzjKuwDEuS4972JGLgKqT+HvOTnQAspDgMlV3/bcZeA+gKLF0v
         ELUlk8QZth35qLH6Y0xr6OdHnNQxLA1gyPTTQS4lSbI9rxgjKeNEzAMOlm19keFNb7aC
         k4X/vXHaidzdLZyp+LkvyUxIUZEw2mqs1EwXmkdVCC334c+AV3+p9wdlYzP0pSb1TqXG
         DPTwDuD5y6WXoZQn4VqIbOGWhIeI7yP02DN1xsUuFQfQXt8jTJElUymQ2TZMtWXT1YxU
         jjpppppH182RON8+mTBakVmi1gxfEECOuxzYDTJbMA2KPv2cuUrTBrF+gI/gYU0OsCSt
         p5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tZVkcKKAl6NTFE7ZS5YKtyl4sdgiqPbOaIwKxrt6xrM=;
        fh=kuN6IyBJdMpyeR3rVe3st0R/5kD+v6PIsg2YkmGKU5o=;
        b=i4Y+yfesl62n0jN7OboX+y8VEREQWlOAzwwry56AHo/DSz52PK47Um3j8BfnkWlLK7
         4uiVjRAnK7R5tV28F3UhsU1aUZF76WHrVJ8BqjPLLffzDPJrJpYPBK80RCuUA+zFSXyY
         IXEGEuOTXr8nfytu4y0JhpILKQ2dXI47u1f4AXPWMRVxWOtf+ZwxvtqF4VvS09dWZSqO
         qsTOcCuKopAtaQtGxi2Q9d1VUEF6DuisFo/OGECVDSlUh3IhIEvQjunrCfDInl0nGVbF
         VLPWgeZOsrJTv7VEUQO4DpKRdlaSm8n74zchqD7hyJaF+X3nc0bwIrUqGTPVKgYJo+cO
         jVjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPGvImEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976d18aesi16738556d6.339.2025.02.27.10.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 10:45:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPGvImEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnis5-0008MI-Q4; Thu, 27 Feb 2025 13:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnirz-0008K2-4r
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 13:44:30 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnirw-0003z0-JS
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 13:44:26 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e573136107bso1198189276.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740681860; x=1741286660; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZVkcKKAl6NTFE7ZS5YKtyl4sdgiqPbOaIwKxrt6xrM=;
 b=SPGvImEG08zddycxCK9AgL2rU+4CDrOLtVcpS39N3fpKnsf9KCZZM9dc1jQUSbZpMm
 waRu7mDr6LZIfiEN9LW12zrxqKtBbbAmsEdUBQoaDqbguklcW8VoOwhIgOjXcN8CoQC+
 cmZv8Xt0rdPuEKzTdK2+8CxG56T4vULrtPC1iRFLNmiUOdHZDCb3Sai/vur48Ek/2Mp4
 km4IbAxBAKBr6iwmfbPVt10wNuwdrHpHs7ZD1sbuUkpZCvuanQ+v762cQxdkRo9LSacl
 bQRJMAyDUE8IgdDYDOVhYLOpYF2lvBchP2ZNNILcMCfyM1m+qo7XKU/1W43apZkH8Pk2
 3mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740681860; x=1741286660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZVkcKKAl6NTFE7ZS5YKtyl4sdgiqPbOaIwKxrt6xrM=;
 b=gQkysw0Tkcxahhh+WuD4dymUJV+aET6pFX8TlyJWsI+uuZV+aK7X/PkmbsabJDM24g
 pxV2VmmHov2y+ct1n0gcCKLSubM48HNS9uD0W6BUUHqK1WKlbrH5+CIZgIQXIdSQ/Nj5
 NXZcjx1a/UK6VdpRNHvQZH/n+P9bD9Gd6oHXS5QBrxSEYBsGuvu2EIJ/J9tx2+iogUIO
 3H3cIRO1GIAjU5V5+K1t1CUFjUDDLevgbIalw4wrtxE+CStPPWCxWEL9PN7aPGD3HYLW
 gyOuSxdc4qN3gn86HZP5QgAn5TISgCHJyD+T5czU4zeKu1SzKeBss9XAu2tCXmx/i1ja
 haBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQlPWWND5ebeWNFTgNTckLIYad8K2Vp7fGcpoMOhIY6fBX+fgqxXEEk49f3lxmsHJqsx7T/Wg8lA==@nongnu.org
X-Gm-Message-State: AOJu0YwVO4/kPUbnHgmOV32HnXx9Kl87OFjqQnBzfip/Jvmk3Pn8M9Pu
 FwnyWuvZtI5CvM4El21BRpkpu/kwjRJrtn/8Ss9UWWQkvAC9Vud9anuItAn4OD62eB/56SgtIeh
 3V8OXgNpKIamwnAqjr1Q3WuUx6yszgTd5nov5ag==
X-Gm-Gg: ASbGnctT+5DsU66JaQ3RbmjncD0o1dYRS2LXAU9kGrgvwqAhaHxVkrAuzywMS8/18bx
 ds7oJ1p47FCWyTe1IXvUNio55S15qVcPAydn7J3kQkqZ/o5j5Jao/yvsuX7TWlrO3KwTt22ET4X
 9uEOOuMrhJ
X-Received: by 2002:a05:6902:e93:b0:e4d:25c6:c398 with SMTP id
 3f1490d57ef6-e60b2e93d0bmr247660276.1.1740681860605; Thu, 27 Feb 2025
 10:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
 <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
 <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
 <CAFEAcA-gyMTz-KpmamyXcKX9QOL=yYHDMPRF2Xji_uJbG02WpA@mail.gmail.com>
 <CAO=notwcXTU9v4c_Hz=Si=QLrM5HNymYEO0ry4Td30GYUZqBwg@mail.gmail.com>
 <CAO=notxXT3m26=GxryTwJSqLQBfxrCCXV9ffdBGdYokxxnHz=A@mail.gmail.com>
In-Reply-To: <CAO=notxXT3m26=GxryTwJSqLQBfxrCCXV9ffdBGdYokxxnHz=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 18:44:08 +0000
X-Gm-Features: AQ5f1Johh4YRhSxYpvK-BelDemFxW9ipNuBd9w1Klk1RK_F5waPcuAh4XSVRrNw
Message-ID: <CAFEAcA8x6Lj2uUVtESC9TAMrS-wkRAF3HT3Wj3JN5i6oQmm4mQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Patrick Venture <venture@google.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ems00XlXf0s8

On Thu, 27 Feb 2025 at 18:12, Patrick Venture <venture@google.com> wrote:
>
>
>
> On Thu, Feb 27, 2025 at 8:08=E2=80=AFAM Patrick Venture <venture@google.c=
om> wrote:
>>
>>
>>
>> On Thu, Feb 27, 2025 at 8:01=E2=80=AFAM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
>>>
>>> On Thu, 27 Feb 2025 at 15:55, Patrick Venture <venture@google.com> wrot=
e:
>>> >
>>> >
>>> >
>>> > On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell <peter.maydell@=
linaro.org> wrote:
>>> >>
>>> >> On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com> w=
rote:
>>> >> >
>>> >> > 'const struct eth_header', which requires 2 byte alignment
>>> >> >
>>> >> > Signed-off-by: Patrick Venture <venture@google.com>
>>> >> > ---
>>> >> >  hw/net/npcm7xx_emc.c | 7 ++++++-
>>> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
>>> >> >
>>> >> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
>>> >> > index e06f652629..11ed4a9e6a 100644
>>> >> > --- a/hw/net/npcm7xx_emc.c
>>> >> > +++ b/hw/net/npcm7xx_emc.c
>>> >> > @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *n=
c)
>>> >> >  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8=
_t *buf,
>>> >> >                                  size_t len, const char **fail_rea=
son)
>>> >> >  {
>>> >> > -    eth_pkt_types_e pkt_type =3D get_eth_packet_type(PKT_GET_ETH_=
HDR(buf));
>>> >> > +    struct eth_header eth_hdr =3D {};
>>> >> > +    eth_pkt_types_e pkt_type;
>>> >> > +
>>> >> > +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
>>> >> > +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
>>> >> > +    pkt_type =3D get_eth_packet_type(&eth_hdr);
>>> >>
>>> >> Maybe better to mark struct eth_header as QEMU_PACKED?
>>> >> Compare commit f8b94b4c5201 ("net: mark struct ip_header as
>>> >> QEMU_PACKED"). The handling of these header structs in eth.h
>>> >> is in general pretty suspect IMHO. We do the same
>>> >> "get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
>>> >> so this isn't just this device's bug.
>>>
>>> > Roger that. We saw this in the two NICs we happened to be testing tha=
t day, and yeah, I grepped and just figured that those other NICs were doin=
g something with their buffer allocations that we didn't. I'll give QEMU_PA=
CKED  whirl.
>>>
>>> You might find you need to make some fixes to other
>>> devices to get the QEMU_PACKED change to compile (do an
>>> all-targets build to test that). For instance for the
>>> ip_header change I had to first fix virtio-net.c in commit
>>> 5814c0846793715. The kind of thing that will need fixing is
>>> if there are places where code takes the address of the
>>> h_proto field and puts it into a uint16_t* : the compiler
>>> will complain about that. A quick grep suggests that the
>>> rocker_of_dpa.c code might be doing something like this, but
>>> hopefully that's it.
>
>
> Ok, so digging, and I see that vlanhdr is used similarly in the rocker_of=
_dpa.c code, so, without trying to bit off the yak shave of fixing all ethe=
rnet headers, but in reality ethernet packets are packed structures, should=
 we just make them all packed and bite that bullet?

If you want to do all of them that's probably the long term
right thing. But the patchset structure would be a series
of "fix X that assumes struct A is not packed", "fix Y
that assumes struct A is not packed", "mark struct A packed",
"fix Z that assumes struct B is not packed", "mark struct B
packed", etc -- so I don't mind if you stop partway through
without doing all of them. (After all, that's exactly what
I did with only doing ip_header :-))

thanks
-- PMM
