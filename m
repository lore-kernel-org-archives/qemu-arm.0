Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp331531njb;
        Thu, 27 Feb 2025 08:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeO2T1Z03STl9DG+GSDIK1zRVhFY/HtmXHFrPQT1tEQZntsBnAlRjc395fTSXINXo8LyHy1Pr4YKi0AQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7TmAQFi+OoRDWgAZbAD95RpbT2t3zQHF6KFTqRRzp0VAI9t79N3Ylcd1tGlu3KnL8UHNV
X-Received: by 2002:a05:600c:4687:b0:439:9aca:3285 with SMTP id 5b1f17b1804b1-439b6ad5cbfmr197281535e9.6.1740672616675;
        Thu, 27 Feb 2025 08:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672616; cv=none;
        d=google.com; s=arc-20240605;
        b=hjIDmlQ9957IaHngKwU95apRBHyJb+5MOoELULJ4Gcw00bySWYZm++MThCSpKkI1HI
         SqWrdNlifa/nPRT6c1NHsLY1PtyKflD+htFARTh8KlTObdA5GVU4YUyHsfnX6zABITjm
         WGFR6RTVxC8TEfU/uLx2b9rXypo9RqS4ewXNWHmc8EtzKuWPZDI5OWMJOptS92Z2uLDY
         dtpNm/zOIH9QO12b9LjYagPPOfXuoTToUvnzIQVjrbyPE3UHxVgeCJEuNKqWNIMggMgj
         jlGsSB5TlPxroqs3IWt1aUdsTfBSwzPdFF3ANw04CljOvIXdB7YBON0Tip188GpzeV1V
         ydxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6KeP6LOaPnp3jRIIoz0WXOkqKl2xTX9I/6K/ONhVA9Y=;
        fh=h0gRN3vOwxsEfZLqdAPNqOSOUJP06yDtDjmouPR5WUU=;
        b=beobNvG9pjFpI4nRQ55pg+A31JULJfh5bU5+phBjP+R9oJeKVPjUCAFDv0RnGrIflR
         pgBKoxU49mBXd+bEB//oi+6vr9QquLSZ8bj63fCDFYnGcFflbuZoDh1lXGGx+CJpKlh8
         CV27VFd3ccgZbuvZbO7bqjsOZ5InjNMnjuLYLDoK20A/B7jk+z69Y+AQy9WIl03vsCOj
         xafdCn0O/R60VU6YQwqwmI28YttZ+txVDvNXQm3c9lHrGbgowG7FW9y9TlhP5ZFKkn+z
         ahF182Hx5YH74ivtVjAb/YCRC2w4DWYqzc6xLSIuabJQJY3E4frm13AwKvztS1Zvune3
         7cLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTy70L7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43aba52b930si28280065e9.72.2025.02.27.08.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTy70L7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngKt-00081a-8D; Thu, 27 Feb 2025 11:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tngKY-0007kN-F1
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 11:01:55 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tngKT-0007Pm-UK
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 11:01:45 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e573136107bso1031166276.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740672099; x=1741276899; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KeP6LOaPnp3jRIIoz0WXOkqKl2xTX9I/6K/ONhVA9Y=;
 b=CTy70L7XX0htERVoai4K+KXne2UiosY9q75gVoa+/1gAmQ6nZkjCqljSclUrW8gf6t
 CIj4VKKQD80chm4CijzfKrRXoYUl9pyHzqKin7BBZCJkELeMlpmJBzYDCz4SV9PiPNWU
 h8UBmxmw+6wxQLUnTZYGBL3DPIgQqoUECUooeFbOCJyH67lDauAt9t9G5/Pvx1p9ibRZ
 RyCWiCWPzpVM4xLWLI4YzZQKERc1+mQGBQJm7CGnT0ff3/BvEgju4GGd8ZH1IxeCgW5t
 TvlUV2HS826Rox9XpXcSMHOoGgjo//VgcotjTlrSChy7Gyh1FOff5O0sXJlVQdJyqmdk
 8aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740672099; x=1741276899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KeP6LOaPnp3jRIIoz0WXOkqKl2xTX9I/6K/ONhVA9Y=;
 b=P6Mn1n4A9w0+YlN/eUyCJ0WczEdpQwDpUs6JlsJrDtyt9/KSYDA2UtwC1/Dq7oOtHF
 IoxOfTOlYWXyH7w1CeexLrazQKOylobfa8e09h8GSkh9SChCcaFfQUEHtSP0o5r8sli6
 x/4a8+39j0H5T4RY9kPrFUYMKFgG4LZa8qXHW5Rq1zeq1hERfDj3WChRQAFhPKyzq9Oo
 t250cWxuSoR7buMAwscd+lNXURtDokWZXdpsIiTTXhAdf4O35kiiWG7+cL1fqhENm+Xv
 9x7GUMDPGmtX5adVxmnN4D3gX3U712megOtNuBBdoXnkEuNj7XVai9ghZu006FmWRR7l
 gfNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV9xcNGW1Bj57IY7MGgIjFaQIfNAaZlSkwHJrgApXjvEOlaWovrCkrlZRFyucsYiXg+JoOFxDysA==@nongnu.org
X-Gm-Message-State: AOJu0YyHEk17d0CPsNeezdUljaSn7gTSbRlzByP3FFYrZC1yOqoy1Msc
 hQJ3dpr1B4Yl9Vj5SLZY1RUq6f6SQyEvzuWbL3Hd6WUzVJtLqxoooEDKNMRx8hyAgvvr61DVHzz
 wNw7qFd/I2rG7Ned9ZEy2hWte1TTOgx1WksUkWQ==
X-Gm-Gg: ASbGncu+LeTeKdKLFbja1wdQ14h+sua8Yn40XmYJiRxCjyASuCyycP1IAh4AfROG6YH
 ypx/zDhiHTDSUdjEIPOL0NF7Vs3Az8hDhcYJpclrF21d5HjM+GBLKuDQFQNkC4f8kAKsoMTkhQZ
 KhZ+DsGzOu
X-Received: by 2002:a05:6902:12c5:b0:e5a:e774:d238 with SMTP id
 3f1490d57ef6-e608a6a17d9mr7395085276.2.1740672097916; Thu, 27 Feb 2025
 08:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
 <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
 <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
In-Reply-To: <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 16:01:25 +0000
X-Gm-Features: AQ5f1JpdX-BJ2ftWF8KTni0lYlT_dpMnvPWSa2ybbaJ5v_e_lnPcTguNtDdg9o8
Message-ID: <CAFEAcA-gyMTz-KpmamyXcKX9QOL=yYHDMPRF2Xji_uJbG02WpA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Patrick Venture <venture@google.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: 6tavlDmaTiG2

On Thu, 27 Feb 2025 at 15:55, Patrick Venture <venture@google.com> wrote:
>
>
>
> On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
>>
>> On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com> wrote=
:
>> >
>> > 'const struct eth_header', which requires 2 byte alignment
>> >
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> >  hw/net/npcm7xx_emc.c | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
>> > index e06f652629..11ed4a9e6a 100644
>> > --- a/hw/net/npcm7xx_emc.c
>> > +++ b/hw/net/npcm7xx_emc.c
>> > @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)
>> >  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *=
buf,
>> >                                  size_t len, const char **fail_reason)
>> >  {
>> > -    eth_pkt_types_e pkt_type =3D get_eth_packet_type(PKT_GET_ETH_HDR(=
buf));
>> > +    struct eth_header eth_hdr =3D {};
>> > +    eth_pkt_types_e pkt_type;
>> > +
>> > +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
>> > +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
>> > +    pkt_type =3D get_eth_packet_type(&eth_hdr);
>>
>> Maybe better to mark struct eth_header as QEMU_PACKED?
>> Compare commit f8b94b4c5201 ("net: mark struct ip_header as
>> QEMU_PACKED"). The handling of these header structs in eth.h
>> is in general pretty suspect IMHO. We do the same
>> "get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
>> so this isn't just this device's bug.

> Roger that. We saw this in the two NICs we happened to be testing that da=
y, and yeah, I grepped and just figured that those other NICs were doing so=
mething with their buffer allocations that we didn't. I'll give QEMU_PACKED=
  whirl.

You might find you need to make some fixes to other
devices to get the QEMU_PACKED change to compile (do an
all-targets build to test that). For instance for the
ip_header change I had to first fix virtio-net.c in commit
5814c0846793715. The kind of thing that will need fixing is
if there are places where code takes the address of the
h_proto field and puts it into a uint16_t* : the compiler
will complain about that. A quick grep suggests that the
rocker_of_dpa.c code might be doing something like this, but
hopefully that's it.

thanks
-- PMM
