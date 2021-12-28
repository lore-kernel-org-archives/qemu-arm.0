Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6187137lfb;
        Mon, 27 Dec 2021 19:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPDoRoTaJ0BBUePC+5CFiOeYEPuWe0zL1f8+uNmOt2PgiMTnMI78+59JpA0Fb7gDClhCLJ
X-Received: by 2002:a25:9083:: with SMTP id t3mr17780529ybl.685.1640662471985;
        Mon, 27 Dec 2021 19:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640662471; cv=none;
        d=google.com; s=arc-20160816;
        b=eS0arZ+PUeA2UYKS8CheuPC0Pps+r1djP3gJOR3A56WBXgFAaAKId1Migg2drTw9mX
         wnfpYkSDJU7fdVlmAzLXb1Mzn/xIYgLX82dJlvvF/EGPWuL9Cm9JFoo4hzGoRvpmC4aH
         2/kOWV9fMgAX5UDi012XKRp79TFiM2+A0kLKIIsZ4RVn22uki2SpYTOOk+eiCITO3A+N
         8PlVRkOMVnKJTP1k4TY3bZHt6udq+X7Jr9S6PkyN/y/BVRTcmb6SmDUW030k5GH6BEy/
         4c3G3K+hfw4PoPTXn9isGMKI880qakbbcK5GooTP5KysRbkEm42mhZODjcFARZbI+xUZ
         mXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KK+Vv7y+4aHo8tdBxkaiSfNwMM75sYtafPEl2ccdfqM=;
        b=Kk2RVEG7C1ENKFtg9/zTtrE4DFtWuo8MB0rFy49d1yuqISbGogDMYyOvsW1YvNjqI0
         ef28J12JFrSJpV38YqHmFqUHO6rfSOBP4oimPNB6ERfu4J1FYbwSu9t7uav76wXd7Qen
         KZWLj003UaOkuGKmiZ0piHfD0Yji5I3ZwBCripieeDU6EGAUreOrlTfKdy15Zbhd4NxJ
         RzY8XwUFXYycv7ZuOuLnoYPAB26MlPQoZHjoroL2I+oSmdp355kZS4D6T8BosagpMHkA
         ASrvF1a2qIBsWuwLT+cNj8IdVdYFP692me2EEtZ4vzDSnWOdkgpowZCHBjqYSd5Voxtq
         MlLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KNfsYJOs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s44si6070063ybi.506.2021.12.27.19.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Dec 2021 19:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KNfsYJOs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n23Fv-0001aL-DG
	for alex.bennee@linaro.org; Mon, 27 Dec 2021 22:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n23Fi-0001a9-1v; Mon, 27 Dec 2021 22:34:18 -0500
Received: from [2607:f8b0:4864:20::236] (port=45033
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n23Fg-00054c-2v; Mon, 27 Dec 2021 22:34:17 -0500
Received: by mail-oi1-x236.google.com with SMTP id be32so28039595oib.11;
 Mon, 27 Dec 2021 19:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KK+Vv7y+4aHo8tdBxkaiSfNwMM75sYtafPEl2ccdfqM=;
 b=KNfsYJOsUy9jljR+EOfI+iciZWn0RHpDMxiBB3MgQ038IN8KKI+cGFrViV/6C8mCpb
 ueqbfbcg0gOiv3vljqmN7Ac2j/3GsfEKfFFLNi51PgXlrOWHMncGOhidxkebXxGQ79TC
 g+3EpcK9EXCPgoLfX7kJKyqCyZIzsL+oFOJt7TSeRLciuIUJXh51DcyxesNDU+RvShUQ
 FO4cJDLi9fU4jS1gScqj2OzNjbskyuRVX6Ssri0u7CyYNZdzj1vI5l7xcddPZdImxHkp
 bLMhELvjlAxkjiX3dQn/TjyDDTesPsPhAd8ngeUEHBSsD4JczIZkn1PY0eNJOt2SDuZJ
 ebcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KK+Vv7y+4aHo8tdBxkaiSfNwMM75sYtafPEl2ccdfqM=;
 b=nQlCjFNExhnwdODyVCoyNu9QLHr1LxZJtQeAm0i932z/3FOAIGSCLMZ5Wc0XYJ/Of2
 pwpYtM2WVtF9PhQwiHzDlVPezZmhD4dVnJPVLtvZgfCJH3ikfr3U7jE7HcDbV5r6KPcI
 V3x0I8TPafyr/W3/oP1LmM+J8jEsdwkLcLBhEdT5WXkKXMv0WgWa5N4zXAXrb2CJ5HAZ
 n8svSNj6zrD4LDllG6XuqIhdFZlpn2aiWfS8PmrnjjxYy3DLnepf/IkYcaiZpxFSeVPp
 W5VvIqK411JMFbttIcGn4Dcpr+ujZc1lQ4JCFF5aodJQ62L9mQNrdCW+L7xsHuHbsFKL
 T+AA==
X-Gm-Message-State: AOAM5305peCF1pGyaIGf+F9Lv18Up8drNuq+OA14Y0o647QOLR4X6LNK
 6NNZR8U9zBOWJS9tF3i1mym8rzmy6aHbQ4Ro5SM=
X-Received: by 2002:a05:6808:bc7:: with SMTP id
 o7mr15049793oik.172.1640662453709; 
 Mon, 27 Dec 2021 19:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
 <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
 <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
In-Reply-To: <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 28 Dec 2021 11:34:05 +0800
Message-ID: <CAN9Jwz3gv5V2jPvW0mp7f_XKW=d3UtE9ROMcg4wLBR7D67+KiQ@mail.gmail.com>
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
To: Klaus Heinrich Kiwi <klaus@klauskiwi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBFTK+cHrHp4

Hi Klaus,

On Thu, Dec 23, 2021 at 11:57 PM Klaus Heinrich Kiwi
<klaus@klauskiwi.com> wrote:
>
> Em qui., 23 de dez. de 2021 =C3=A0s 09:54, C=C3=A9dric Le Goater <clg@kao=
d.org> escreveu:
> >
> > [ Adding Klaus ]
>
> Thanks Cedric. It's been a while since I've looked at this but I'll do my=
 best..
>
> >
> > On 12/22/21 03:22, Troy Lee wrote:
> > > Accumulative mode will supply a initial state and append padding bit =
at
> > > the end of hash stream.  However, the crypto library will padding tho=
se
> > > bit automatically, so ripped it off from iov array.
> > >
> > > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > > ---
> > >   hw/misc/aspeed_hace.c         | 30 ++++++++++++++++++++++++++++--
> > >   include/hw/misc/aspeed_hace.h |  1 +
> > >   2 files changed, 29 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> > > index 10f00e65f4..7c1794d6d0 100644
> > > --- a/hw/misc/aspeed_hace.c
> > > +++ b/hw/misc/aspeed_hace.c
> > > @@ -27,6 +27,7 @@
> > >
> > >   #define R_HASH_SRC      (0x20 / 4)
> > >   #define R_HASH_DEST     (0x24 / 4)
> > > +#define R_HASH_KEY_BUFF (0x28 / 4)
> > >   #define R_HASH_SRC_LEN  (0x2c / 4)
> > >
> > >   #define R_HASH_CMD      (0x30 / 4)
> > > @@ -94,7 +95,10 @@ static int hash_algo_lookup(uint32_t reg)
> > >       return -1;
> > >   }
> > >
> > > -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_=
mode)
> > > +static void do_hash_operation(AspeedHACEState *s,
> > > +                              int algo,
> > > +                              bool sg_mode,
> > > +                              bool acc_mode)
> > >   {
> > >       struct iovec iov[ASPEED_HACE_MAX_SG];
> > >       g_autofree uint8_t *digest_buf;
> > > @@ -103,6 +107,7 @@ static void do_hash_operation(AspeedHACEState *s,=
 int algo, bool sg_mode)
> > >
> > >       if (sg_mode) {
> > >           uint32_t len =3D 0;
> > > +        uint32_t total_len =3D 0;
> > >
> > >           for (i =3D 0; !(len & SG_LIST_LEN_LAST); i++) {
> > >               uint32_t addr, src;
> > > @@ -127,6 +132,21 @@ static void do_hash_operation(AspeedHACEState *s=
, int algo, bool sg_mode)
> > >               plen =3D iov[i].iov_len;
> > >               iov[i].iov_base =3D address_space_map(&s->dram_as, addr=
, &plen, false,
> > >                                                   MEMTXATTRS_UNSPECIF=
IED);
> > > +
> > > +            total_len +=3D plen;
> > > +            if (acc_mode && len & SG_LIST_LEN_LAST) {
> I think we should make the precedence here explicit (with the use of
> ()) instead of implicit. Also, isn't (len * SGL_LIST_LEN_LAST) always
> true inside this for loop?
I'll change it to have explicit precedence.
No, the *len* will be assigned after goes into the loop, and the
SG_LAST_LEN_LAST will be raise at the last of scatter-gather list.

> > > +                /*
> > > +                 * Read the message length in bit from last 64/128 b=
its
> > > +                 * and tear the padding bits from iov
> > > +                 */
> > > +                uint64_t stream_len;
> > > +
> > > +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_len=
 - 8, 8);
> > > +                stream_len =3D __bswap_64(stream_len) / 8;
> > > +
>
> I no longer have access to the aspeed workbook I guess, but what is
> the actual specification here? is the message length 64 or 128 bits?
> and bswap seems arch-dependent - you probably want to be explicit if
> this is big or little-endian and use the appropriate conversion
> function.
The message length is described in RFC4634:
- SHA224 or SHA256 should be 64-bit.
- SHA384 or SHA512 should be 128-bit.
And it should be in big-endian.

The aspeed ast2600 acculumative mode is described in datasheet
ast2600v10.pdf section 25.6.4:
1. Allocationg and initiating accumulative hash digest write buffer
with initial state.
   * Since QEMU crypto/hash api doesn't provide the API to set initial
state of hash library,
     and the initial state is already setted by crypto library
(gcrypt/glib/...), so skip this step.
2. Calculating accumulative hash digest.
   (a) When receiving the last accumulative data, software need to add
padding message
       at the end of the accumulative data. Padding message described
in specific of MD5,
       SHA-1, SHA224, SHA256, SHA512, SHA512/224, SHA512/256.
       * Since the crypto library (gcrypt/glib) already pad the
padding message internally,
         This patch is to remove the padding message which fed by
guest machine driver.

I'll update the message length calcuation to 64/128 bit depending on
the hash algorithm.

> > > +                if (total_len > stream_len)
> > > +                    iov[i].iov_len -=3D total_len - stream_len;
> > > +            }
>
> I guess you're not using total_len except for this comparison? Feels
> like there's a better way to first compare and then assign the value,
> other than assign, compare, re-assign etc.
Got it. I'll see how it be done better.

> The rest of it looks fine apparently. Are you planning on adding to
> the testcases are well?
Got it.

Thanks for reviewing.
Troy Lee

> Thanks,
>
>  -Klaus
>
>  /*
>  <klaus@klauskiwi.com> - http://blog.klauskiwi.com
>  */
>
> > >           }
> > >       } else {
> > >           hwaddr len =3D s->regs[R_HASH_SRC_LEN];
> > > @@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwadd=
r addr, uint64_t data,
> > >       case R_HASH_DEST:
> > >           data &=3D ahc->dest_mask;
> > >           break;
> > > +    case R_HASH_KEY_BUFF:
> > > +        data &=3D ahc->key_mask;
> > > +        break;
> > >       case R_HASH_SRC_LEN:
> > >           data &=3D 0x0FFFFFFF;
> > >           break;
> > > @@ -234,7 +257,7 @@ static void aspeed_hace_write(void *opaque, hwadd=
r addr, uint64_t data,
> > >                           __func__, data & ahc->hash_mask);
> > >                   break;
> > >           }
> > > -        do_hash_operation(s, algo, data & HASH_SG_EN);
> > > +        do_hash_operation(s, algo, data & HASH_SG_EN, data & HASH_DI=
GEST_ACCUM);
> > >
> > >           if (data & HASH_IRQ_EN) {
> > >               qemu_irq_raise(s->irq);
> > > @@ -333,6 +356,7 @@ static void aspeed_ast2400_hace_class_init(Object=
Class *klass, void *data)
> > >
> > >       ahc->src_mask =3D 0x0FFFFFFF;
> > >       ahc->dest_mask =3D 0x0FFFFFF8;
> > > +    ahc->key_mask =3D 0x0FFFFFC0;
> > >       ahc->hash_mask =3D 0x000003ff; /* No SG or SHA512 modes */
> > >   }
> > >
> > > @@ -351,6 +375,7 @@ static void aspeed_ast2500_hace_class_init(Object=
Class *klass, void *data)
> > >
> > >       ahc->src_mask =3D 0x3fffffff;
> > >       ahc->dest_mask =3D 0x3ffffff8;
> > > +    ahc->key_mask =3D 0x3FFFFFC0;
> > >       ahc->hash_mask =3D 0x000003ff; /* No SG or SHA512 modes */
> > >   }
> > >
> > > @@ -369,6 +394,7 @@ static void aspeed_ast2600_hace_class_init(Object=
Class *klass, void *data)
> > >
> > >       ahc->src_mask =3D 0x7FFFFFFF;
> > >       ahc->dest_mask =3D 0x7FFFFFF8;
> > > +    ahc->key_mask =3D 0x7FFFFFF8;
> > >       ahc->hash_mask =3D 0x00147FFF;
> > >   }
> > >
> > > diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_h=
ace.h
> > > index 94d5ada95f..2242945eb4 100644
> > > --- a/include/hw/misc/aspeed_hace.h
> > > +++ b/include/hw/misc/aspeed_hace.h
> > > @@ -37,6 +37,7 @@ struct AspeedHACEClass {
> > >
> > >       uint32_t src_mask;
> > >       uint32_t dest_mask;
> > > +    uint32_t key_mask;
> > >       uint32_t hash_mask;
> > >   };
> > >
> > >
> >
