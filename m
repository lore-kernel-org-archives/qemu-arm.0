Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp809776wrv;
        Tue, 16 Jul 2019 04:02:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeNERfPDa3HgJku2eINXW+SpRiuraLlOpxFvjslIjC4sMm4ZPm1TUWJTc7JlVbGkg/p4dR
X-Received: by 2002:a50:f05a:: with SMTP id u26mr28583279edl.116.1563274937722;
        Tue, 16 Jul 2019 04:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563274937; cv=none;
        d=google.com; s=arc-20160816;
        b=ffxcQcYrDkBffXoQ5TsKhadJEIiPXGaZHn+267HSW9h8EZyg5ABY57VasrU+nUcpb/
         JtR2d8+slZ0XPx57SWaJC2Ut3DX16F99WyoLO2tOmynXpE+Nz3CHLUOGpzVY7Ep7vXJu
         Immq+7vbJPncPtwjGIZKnyKRvoYk0PBLbKFvhVBpIM7gEjhZTesEheVRkbHggW7LEhfW
         xNk2HUM5K4RA6fg0wFCRsFIZyfiOm7jqS8r/6tr3LC4NFe7brjLF4dIEGkQAfxf3XlJy
         um/ZMM2rgETnYFJYl36aRgbi4GynTCHQ3UCG8lSce5gHVIQo6FkG4uOOT2JLvAOLzhKd
         +gjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=mLuPacixCfQL1CqAQgfCd9QBEfriLajdZzVnBsDFPn4=;
        b=hnGNH/i3+Qq+A+dsV8kfa7YNWLD5PAk5PDL/r1JTGhU0tr4QaKXBFtKFSASdmFuis/
         vge5LZswWkmdiT3gJZ7bN1RjYjgXJ/1gDXn181+ROJP8ad3TjM3fE+Fl6jP7iebjQbiz
         +zagckPxUL9Bq7/QgNv8jNTallcX1+i7tQPZ1WLzUoET+GStIDfTbHUHmv2bLsDzScSv
         Q6tBAIBVE99/gyGHeeBVV6XYwMqK06NWyjEIi6euiOEl/tbbdcx47g5JU34eCxTd7C0p
         XqzCMdxbeDAZR1R7x3m6ZEnuM55FXQ06lWXhXlbSXp5xCzRJPVAtd045Yp+3F29Y5hlZ
         0QQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iNmU2TJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si10777635ejr.355.2019.07.16.04.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 04:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iNmU2TJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnLDs-0008DV-JF
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 07:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDX-0007AJ-Ry
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:02:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hnLDW-0006WH-Mv
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:01:55 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hnLDN-0006OM-Gf; Tue, 16 Jul 2019 07:01:45 -0400
Received: by mail-wm1-x341.google.com with SMTP id l2so18234964wmg.0;
 Tue, 16 Jul 2019 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mLuPacixCfQL1CqAQgfCd9QBEfriLajdZzVnBsDFPn4=;
 b=iNmU2TJZyaAxRkP9j0BcWKwgxig6Ed8x7tJmb38WV7RCJk/im0DjVWIxJYdG3/TwlX
 NVKPCU080FdJZjAmRhILgGUhrlq4/O+ILvaSmmkfqTHyGpXY2q3rQG8LdSGU1M2gc49Z
 rjH9HlXPq6p287V7P+clOjHZ6FfbS/4s9YgmmBsGAS1eNFny0jXMu2r6r7dYxb7hS/YM
 IUMSbqXy+eUZuCTH+VnIi5tDEj7C+RnkYCZ59fnCVs2dT8GBRnSZ63td3ePqL8u2BTuJ
 mJQRjJSIXKbTVBpqQm6U9V8wWB6WuO/gSa7nqEqWzMNdM4nKTshfbuB3BaYh2CbJOFj9
 ewPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mLuPacixCfQL1CqAQgfCd9QBEfriLajdZzVnBsDFPn4=;
 b=eOEGxtxp4t4cbuqyJkzJPC6WPB9c0Y9aAClkZX+J+FoJG9aYCAXAl61ZyL+T1SgWVh
 GdMAz4k/lVAKRowXTYMA6Rf9cSBVrLiKPLRzmw/wwGg7YvQAGazvjQ2/mQlrLMwCDkCl
 SRYaEf2p6fiW54glEkjCpkduA3vtyxPeqiQNkFd9fzoL3g+IhrTV7qSi4NSh5Nm3W7z4
 r43vC6nM7lH5EDYtyqiG4n0B7E8g+W+6AESexzuiwT4Z0p5ICv+ZANnvL7x9fnEglbG8
 bxaJYpA8WlW07PFsEiAlTMU1HYNq0gcUhMY3Roy01mSUUHu0RhlYRLv92jQKS/kp2XW8
 EgaQ==
X-Gm-Message-State: APjAAAWdov+jVLKDRKo1zYe1KfkChBqNYdikGfXUcoaevgSjXPX/420v
 NTunSMebcyU1Nn3MLl1YqmWhkJ6mFMZlkajjQqs=
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr29733757wma.58.1563274904137; 
 Tue, 16 Jul 2019 04:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051722.13994-1-rfried.dev@gmail.com>
 <555fb9b5-361f-fc3f-ff35-38b993a29edd@redhat.com>
In-Reply-To: <555fb9b5-361f-fc3f-ff35-38b993a29edd@redhat.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 16 Jul 2019 14:01:33 +0300
Message-ID: <CAGi-RUJPD+q8sCbRfffM2bxc7deLNY4Ewg0AOdkMKfJGQs95Aw@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] net: cadence_gem: clear RX
 control descriptor
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwJYU7H1o7Gz

On Tue, Jul 16, 2019 at 11:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2019/6/15 =E4=B8=8B=E5=8D=881:17, Ramon Fried wrote:
> > The RX ring descriptors control field is used for setting
> > SOF and EOF (start of frame and end of frame).
> > The SOF and EOF weren't cleared from the previous descriptors,
> > causing inconsistencies in ring buffer.
> > Fix that by clearing the control field of every descriptors we're
> > processing.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >   hw/net/cadence_gem.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index ecee22525c..d83a82bdb0 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
> >       desc[1] |=3D DESC_1_RX_SOF;
> >   }
> >
> > +static inline void rx_desc_clear(uint32_t *desc)
>
>
> Nit: is this better to name this as "rx_desc_clear_control()" ?
I agree, sent v2.
>
> Thanks
>
>
> > +{
> > +    desc[1]  =3D 0;
> > +}
> > +
> >   static inline void rx_desc_set_eof(uint32_t *desc)
> >   {
> >       desc[1] |=3D DESC_1_RX_EOF;
> > @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t uint8_t *buf, size_t size)
> >           bytes_to_copy -=3D MIN(bytes_to_copy, rxbufsize);
> >
> >           /* Update the descriptor.  */
> > +        rx_desc_clear(s->rx_desc[q]);
> > +
> >           if (first_desc) {
> >               rx_desc_set_sof(s->rx_desc[q]);
> >               first_desc =3D false;
>
>
>
