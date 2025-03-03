Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2552579njb;
        Mon, 3 Mar 2025 03:47:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV28gO553Ci3uNIcT8fSgMveyDDOzM8Ui//rMWuTrHk+2alkwTSUPzo+heVFduERgnJI8l97ixgYjBlQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHP/jDux3W7Xv9tS6rwG8tRRLwwcdochaq7DQXP1BwfI57dT9aywDDCt9gWhRdfLDLUsIE+
X-Received: by 2002:ac8:59d5:0:b0:474:e664:691f with SMTP id d75a77b69052e-474e6646d71mr51852171cf.39.1741002436882;
        Mon, 03 Mar 2025 03:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741002436; cv=none;
        d=google.com; s=arc-20240605;
        b=MASRsurNAdJ7xpDGj63jQo4eiR8tCmG27LP9UBiQujPjWAuOGybrF1UB3E3yxkQhC6
         PWJ8KrRIVjvL0IRaFZUQHn+ofqLMm3naoZIHSNd4qMcRJrm39JUFjdHuz9tqX47DrEFa
         lkr0tcz2MW7RWJ8qNhtGPsNLZsiPAHRXai2ggBO+ZswVYbcoNOcQYJm3k+z8JPB0OaNT
         IUgspgm0HiYGFFzskjU3Uo0nm5isdDHSnGnRu6rzf1cUSAFZeSr5DaBoikU/hrNIiGKf
         n3DSIXnLtGv7jguXd+ELF5CSZvhr5tEjVxraG02ngZaVMpYXqZvPfDC7plmJG6+xo2et
         lSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sdlPbpIFj0/t7ED+bsr0Srbzkrk3Qt3hyYAAzB4XwNA=;
        fh=ZR7NnUyVEIeaqfok2Jljmdzc4yBHJCh0sTYk1IrcPwE=;
        b=hzKVPp6/ZOfwTvvtOS/GtMbdR9NRcnhEXYTSw+6Vz8nEuS13fdcUJ3BQYF2+zb+dxd
         WG3l1PkleLDDshRvP+o8sNKWLIm7tmYL4vDJ5euAG2oviJ2cSWpsjW5/jgDHwLU7yhnv
         gCEjgLsRHLXmkQ88u80fIPTiGFFxQftdOrKdVqPEE+IlzZPBhZ288Z82Jh6tm02AjkG1
         6Lzq1qETSGWtFV4oRTND9Do7cSBaKz7ZySJMVQG25W9oonK6I2wiSH21Afk1qRGyj/5o
         3oF24KzXUNrYta1IsNeUzG+9lMQ+ciqkBoocY7M4kgD3klGQIoJ4FgNW0eEalYWgwlZw
         YWeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDsfCyFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474e4eafd56si21513061cf.330.2025.03.03.03.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 03:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDsfCyFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp4GF-000457-PZ; Mon, 03 Mar 2025 06:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp4G3-00041u-Id
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 06:46:51 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp4G1-0001XM-KR
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 06:46:51 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e4419a47887so3192607276.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 03:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741002408; x=1741607208; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdlPbpIFj0/t7ED+bsr0Srbzkrk3Qt3hyYAAzB4XwNA=;
 b=XDsfCyFbUxG6K0qiD+8q8dCzKIXUCIIQF0V7rKePsNDQ50wc+lYiQNuIztzBuVDRfo
 W6dpuFnwWa+aoh349SdyENfl76km20uadT++9FoLpvR+7EMEn1XVUm/jJupbavS/FTZO
 0XqmYh9RjInXELW8apV+TMNMJBd+toG25b4dxiHqrq11rDnVv/dMn87owqUrpvrJ07eV
 ehoqdUqON7gNnu0vptiOMal1MErbF9mQnNDHtP8FOJyuhpTycsZ7aOMV8vIk2Q+OkFWv
 YG9cOIjTeEumvYdYus1nW9iNynXFEY55bcu4rbQDEttC3ENxPQZ33G8OQTb9HF/PJWP0
 8ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741002408; x=1741607208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdlPbpIFj0/t7ED+bsr0Srbzkrk3Qt3hyYAAzB4XwNA=;
 b=dO4IFG4k77Zw0jkxwVae1msI2ZASnaOFdWw6crs8Esn4Gkg28/amCFAdPuxTCdugaz
 bo+iGyWmEseg10PSuyyRfwaDBAvTaD67xgaae2i8SdiohLu9yEDUj0QpErBID9A20pq0
 zU9UKNLkhR0jsrpBnSJnTLMJWTvbFX+3DPVnq5c1pIPTy01NpcRb5YEwaRoXv1tJYrpm
 AFnfRSdI+f4XwFwTCLUkaP2ATQrWQz5FvgyhZ4dHklPQeusdVvkcaOBWxauur1pT1Uss
 eOciQrQYLt8gEn/iLpvB1HeylcFkPjraX70gsNzHEry7qlnfW7f09aH7m46rj/m3k7BJ
 YQug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyg/XQeTQ/cgle/3C4r04/O+rrov/FJM8u2Vzj1UC7CzW1BV1TqloQu0+1sY6AuFbW6TQuUn8yMg==@nongnu.org
X-Gm-Message-State: AOJu0YwBAnFfuZHPmMXYUh4c8vmh8BGKenDyVarKhkWrkCgPE6guWbjC
 SSnclIWUW7RzdnzAe6TD6lFn0qlv4sCEqTdaTWsxIWnuoNUcDISXqS+OnVxxeqt1ifIAeWPH1xD
 7P5UavMhPB0lmL+XKj5CRz1bruryZx1012n1Jhw==
X-Gm-Gg: ASbGncuxMO71mEnxdSI8cFNyZWaAlk0diiHE3NETxdXg03p3HJW5ZG51M3YyYm2s9px
 axeRDdoE07p/mYTLeEAXFe0shGTyduLJitFOmgqy5im+K6UunJv6XEoavW8ZLo1lQgUg5b+sRfT
 4rjcTu88qVvzvN0LH1ONpZ9/tgzbo=
X-Received: by 2002:a05:6902:320c:b0:e4d:25c6:c3b2 with SMTP id
 3f1490d57ef6-e60b2e8eebamr14126733276.7.1741002406456; Mon, 03 Mar 2025
 03:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20250227154253.1653236-1-venture@google.com>
 <0256b5de-12f9-4c13-bbff-e7fcf593f542@linaro.org>
In-Reply-To: <0256b5de-12f9-4c13-bbff-e7fcf593f542@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 11:46:34 +0000
X-Gm-Features: AQ5f1JoT1W_H4e6n5y4BHc9aO1_Ev2Ffmy_o_HzhF6r-k0kvQCgRzT3ZgQSivCw
Message-ID: <CAFEAcA89sSmXEBTUbt2x7sPmqQZsqPkMedLbsn0dqhx+b=advg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: ftgmac100: copy eth_hdr for alignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Patrick Venture <venture@google.com>, clg@kaod.org,
 steven_lee@aspeedtech.com, 
 leetroy@gmail.com, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, 
 joel@jms.id.au, jasowang@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0pO7YNmKEWrh

On Mon, 3 Mar 2025 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Patrick,
>
> On 27/2/25 16:42, Patrick Venture wrote:
> > eth_hdr requires 2 byte alignment
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >   hw/net/ftgmac100.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
>
>
> > @@ -1028,6 +1032,7 @@ static ssize_t ftgmac100_receive(NetClientState *=
nc, const uint8_t *buf,
> >   {
> >       FTGMAC100State *s =3D FTGMAC100(qemu_get_nic_opaque(nc));
> >       FTGMAC100Desc bd;
> > +    struct eth_header eth_hdr =3D {};
> >       uint32_t flags =3D 0;
> >       uint64_t addr;
> >       uint32_t crc;
> > @@ -1036,7 +1041,11 @@ static ssize_t ftgmac100_receive(NetClientState =
*nc, const uint8_t *buf,
> >       uint32_t buf_len;
> >       size_t size =3D len;
> >       uint32_t first =3D FTGMAC100_RXDES0_FRS;
> > -    uint16_t proto =3D be16_to_cpu(PKT_GET_ETH_HDR(buf)->h_proto);
>
> The LD/ST API deals with unaligned fields, would that help?
>
>      uint16_t proto =3D lduw_be_p(&PKT_GET_ETH_HDR(buf)->h_proto);

No, it doesn't, unfortunately -- I forget the details, but
if the struct is unaligned but its definition says it is
aligned then you get UB even with our accessor functions.
This is why in commit f8b94b4c520126 I had to fix this for
struct ip_header by marking it as QEMU_PACKED, even though
the actual access there was a uint8_t*.

(See also the other thread where I suggested to Patrick that
the best approach here is to mark eth_hdr as QEMU_PACKED,
and fix up anything we need to do to make that change.)

thanks
-- PMM
