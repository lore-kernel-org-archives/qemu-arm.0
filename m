Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1068621njc;
        Mon, 10 Mar 2025 04:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIMyGNfxPSGO4g5od3V0lz4Qy8vEQqE0PEMgmzgQ6z0ip6W9GqX+wXMwqfKrtKifBtSAZWyrMWhnInWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1PGKhwKxOiDOmelV79c+27hPbZAJq7qII2CpDTPlBWRb0SRMXcOPIj2fbeZWmX1gdbC/P
X-Received: by 2002:a05:620a:284e:b0:7c3:d280:a67c with SMTP id af79cd13be357-7c4e168b415mr1648435785a.17.1741604846864;
        Mon, 10 Mar 2025 04:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741604846; cv=none;
        d=google.com; s=arc-20240605;
        b=DOgmic10Q2awqm9FVsLwShhndfbcLltGBekYJZ8aARzWtDF7sfzPOJROYNz8DSBace
         4bXkdJQDZrsNeBtrlZnDRzy+QpuIA2InLRavlThoVkEN790wxtTnr8pB0zfiYHlRWV3E
         KOa3Iai3FOkaKilTPJwPtPK7lZpXzzoDzHMH6lmFBJ++CrwQcXSAmZzX47kqxIr31pB4
         92U+tulweW2qZht4QqdBZrNGddFFIvmS9Hxc/0L9Pg/clEv/WBSx3PZDe1421yJlgU8z
         DXoaaS+cmKXVVoAD4UTjWRakaUCO9KKd5OJkrtbnbC01o7NQ/9aur2tIM+R7SOLanH1B
         4jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=j6mQmd6Njjt2p1jxk5g9NsE0d0ki07qN+wzTeEd4ugg=;
        fh=mEUvjThYVKlS4+Hmb0ArngSGAaiLJiDc4y5w81IQwHk=;
        b=bAuEacreXEpTcLXbgY/PU/wW20wVNgoFjHQTiNxhQ9ckqTFwxdTvAFwu8Zv5HKlfdi
         tpIqgmGx70sEvrqv+50bEOiJ/YJQSZKhnWDpl0pJXvr6dugIywx/zsfo74u2rkuGDLuf
         Tku4dkp/dJoB+RzCjVwLKjdzqk7s/ZyF+c7JcEEOBhm+bERYOBbpmV225eSuE0Wsw0jq
         FLPtMKPxurr3tYiej/yIZHYx9Ja01lLqumnZVSdje7hVqsIRa+lpj++ZFFxyZI9Gizbm
         7jONalpJWLHdXkAhRgf/lmmCemc0hKwWJkUwlqmxIMfaU6pRhsMsERCSMpggHhjdloVO
         0LEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GzaWwJHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511c8asi899386585a.367.2025.03.10.04.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 04:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GzaWwJHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trayS-00010L-SK; Mon, 10 Mar 2025 07:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trayG-0000xv-Gh
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 07:06:57 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trayD-0008QR-Jk
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 07:06:56 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e461015fbd4so2970566276.2
 for <qemu-arm@nongnu.org>; Mon, 10 Mar 2025 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741604810; x=1742209610; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6mQmd6Njjt2p1jxk5g9NsE0d0ki07qN+wzTeEd4ugg=;
 b=GzaWwJHMAFBnGug6CZxjD6Hf3kmSiPHdB9myzlNHo/vA0qc5uSLDgM/D/e/8pyRy7F
 Ww/QEqVnoUkhT/bBSUGHJTtP31b37TokzvtZibwqYpBWYjpB/8lv/ILIqYO1V8QuqgJe
 AoK1N1s380Ar6oRSw4FSkLLh1OyIgeE7kir9MmCoP7fUDhhqcrNNnuHI8XbwASMB1GKt
 DbrvUM9v+holpL/Rx2+T0x2ApimJUipnzx7uVsWvLX+AnDS8J7FpGMQXViiCdPagUiHB
 udsr3xERUI7ROjEZFGCH2tFSJ5x0x6wY+UEUtUfABzZi1dMbtvPKVAHtQrBqEBMFUqv4
 pDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741604810; x=1742209610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6mQmd6Njjt2p1jxk5g9NsE0d0ki07qN+wzTeEd4ugg=;
 b=k/Ygq9bwwXj8PcP0be8+5i7NDPKbu8QoibYk8DaTq7ph822QA7oxoy1H1Q7P7MQaMf
 r2G3gfdpamwm4P1Bb//PQHd4IWFfDLdph36i8zY/Sue/pgHLlVD/vlGy01Hgumvo4RZI
 GeDVibclpvI1EXL+cm5AKN2qXz2LwsPw/xaGU3vBWdkfHAM9MnEzWkDwPCpDRoL6Yw9h
 BSiEznV4adjNUDkx4dbyDd7j3gFGNSsBWkh3btg17ZKx7ATt3SRZjKuGxbW9BsWSqBA+
 rq3WvUfjDn9RR3HB7dXqCWRTRNdPEUrWask+Q/DBMt4SR27Wnfrfs+Uim92gM53CunCZ
 c4Tg==
X-Gm-Message-State: AOJu0YxTpf2BFl2ERjp2JYU6k67FMj27I/nKxQydAvHJNEQlyAKhd2Op
 tSZkQJ2GAivBtCXwVZ2d6Q4/JqFJzSANiFDiEAbw//OGVYn6zkmhhP3AoD9dBV9zIYWdd+ZRneO
 EGxJwGWHRbEBL3kDvzaKgIkzFOn8AL6Xqo8LCMg==
X-Gm-Gg: ASbGnctCjO85nOc94lmNU7+GcgZJ9J6g8xVAuz3IEVZEk+6Ja8R13WECMpXlmNU7uN0
 nlur3kFgR22XlBk68NnoXBOMXkOmu/zE9G6f/ACTCcoJg7mSA+akUg8WxYA2i+xqOO34pcYTYdR
 mixN/eSKqyehnHzAJXpNuoh4Vh96k=
X-Received: by 2002:a05:6902:1886:b0:e5d:b88a:5536 with SMTP id
 3f1490d57ef6-e635c1f9fb3mr16200610276.44.1741604810304; Mon, 10 Mar 2025
 04:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <20250228174802.1945417-3-peter.maydell@linaro.org>
 <f4262519-017d-4ed7-8c17-5d4d72a219a6@linaro.org>
In-Reply-To: <f4262519-017d-4ed7-8c17-5d4d72a219a6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 11:06:38 +0000
X-Gm-Features: AQ5f1JowbqcIWeYiHaUbzMJc59rQGzmFNqDmmWjPgHGKu3KiEmwo_SjiT1OlBQw
Message-ID: <CAFEAcA9vw-Qgt4MBd=g-RTC1joHsHYBmtASHpL=SBnBjoW0nWA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/net/smc91c111: Sanitize packet length on tx
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
X-TUID: lpaefqcKWIog

On Sun, 9 Mar 2025 at 19:01, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
> On 28/2/25 18:48, Peter Maydell wrote:
> > --- a/hw/net/smc91c111.c
> > +++ b/hw/net/smc91c111.c
> > @@ -22,6 +22,13 @@
> >
> >   /* Number of 2k memory pages available.  */
> >   #define NUM_PACKETS 4
> > +/*
> > + * Maximum size of a data frame, including the leading status word
> > + * and byte count fields and the trailing CRC, last data byte
> > + * and control byte (per figure 8-1 in the Microchip Technology
>
> If control byte is included, ...
>
> > + * LAN91C111 datasheet).
> > + */
> > +#define MAX_PACKET_SIZE 2048
> >
> >   #define TYPE_SMC91C111 "smc91c111"
> >   OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
> > @@ -240,6 +247,16 @@ static void smc91c111_release_packet(smc91c111_sta=
te *s, int packet)
> >       smc91c111_flush_queued_packets(s);
> >   }
> >
> > +static void smc91c111_complete_tx_packet(smc91c111_state *s, int packe=
tnum)
> > +{
> > +    if (s->ctr & CTR_AUTO_RELEASE) {
> > +        /* Race?  */
> > +        smc91c111_release_packet(s, packetnum);
> > +    } else if (s->tx_fifo_done_len < NUM_PACKETS) {
> > +        s->tx_fifo_done[s->tx_fifo_done_len++] =3D packetnum;
> > +    }
> > +}
> > +
> >   /* Flush the TX FIFO.  */
> >   static void smc91c111_do_tx(smc91c111_state *s)
> >   {
> > @@ -263,6 +280,17 @@ static void smc91c111_do_tx(smc91c111_state *s)
> >           *(p++) =3D 0x40;
> >           len =3D *(p++);
> >           len |=3D ((int)*(p++)) << 8;
> > +        if (len >=3D MAX_PACKET_SIZE) {
>
> isn't MAX_PACKET_SIZE valid? I'm not sure at all but I'd expect:
>
>             if (len > MAX_PACKET_SIZE) {

Yes, thanks, good catch. The max value in the byte count
field is 2048. We subtract 6, and then look at p[len + 1],
which will be p[2048 - 6 + 1] =3D p[2043], where the value of
p is data+4 (because we incremented it 4 times as we dealt
with the status and byte count fields).
So p[2043] is data[2047], which is the last in-bounds byte,
and a byte-count field of 2048 is not an overrun.

(Also, I just noticed that the data sheet says that for tx
frames the transmit byte count least significant bit will be
assumed 0 by the controller regardless of the value written
in memory. So we ought to zero out the LSB of 'len' after we
read it from the packet. That's not an overflow, though
(since we already subtracted 6 from len), just a bug...
Plus it looks like we don't handle the case of "odd-length
frame and CRC field present" right, since we don't do anything
about the last-data-byte being behind the CRC field. I think
that given the unimportance of this device model I'll settle
for just fixing the overruns and leave these other nominal
bugs alone.)

thanks
-- PMM
