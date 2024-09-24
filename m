Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp21276njb;
        Tue, 24 Sep 2024 16:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMxhQloIdECJIZL50kR59P8tX04bQ/JW2pIuJQI+3Ef4xW2W0MWH1Ix+Cx9Kod2W98WjoY3BmYhC2Y8A==@linaro.org
X-Google-Smtp-Source: AGHT+IE5FxNpIb0MUPw6byqpGLX/X5+RpejqY6XmarRQgHU3B7pb3hJ25KmKjWTlnz2Cs17yxLV6
X-Received: by 2002:ac8:580f:0:b0:458:2ff1:6a4b with SMTP id d75a77b69052e-45b5df1f906mr17887471cf.36.1727222194946;
        Tue, 24 Sep 2024 16:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727222194; cv=none;
        d=google.com; s=arc-20240605;
        b=hwWbFbGk2H6DeE2BtQZB8V1lp2/DbwfsRsrnvuBBAbjTROxlA0ultaPLfDLn6emnNy
         bub80+a1z42e2/1/v5NsYz156gLRC9JuuMI03H8bHNEC0Z/9HprOall211PkCAu52lKZ
         KfWW3rkL9UAxwYDv2u/4hPAfaYybPm1l1vQHWE5JJMZQ4Esey+biY9H9+9niHvaSPU7s
         8C2qaqfaD8l+w6FOAOaSxm+PG5avoFbQLULJFnK5bRObK+RS+NOHfKX5/Au2NLymyeih
         vGjOfHt71/uDxDXW9V/6ogBnlPjJ+o8Wo2NrM4As0cDSV6WAX/A9IhIAybgxVVOaSsSh
         ZqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=jhxBC6gQntL8VsjqBpnfef2OLnbaj23C+IqAVn1+HK4=;
        fh=PJLIin/83gZ69XohBpX6wZhjIXh05HUxFE94Oj41lBk=;
        b=TjuFYuIGZkToljMhW7smvGdBSgQGeWkM23hf9c9mu3BFAaSTdFLxjGHpcwjxkU3fCv
         eiPmQh5U9k4Ey8Y3/Yz00ldEf19sbOXpEp9ncYWwAkJwMuYebtN06ybEQdug25OJRt/G
         iMLQQ0eeD+x0Ue+RapMNU42xQ6mChbpx7gs256po8anz6Sv6mXu2/KjfD96jMTDdFoUD
         HrBC5qtN5TCHtVfTuUH/WR8g2Ttoy10asf301dWnQoCqzIdS+tJJV2yRuE1y6+ZgxU+1
         i1GJP+gUGcjjKvr4swMdoqVSX9s+Vu9B7FTH7bTbudZqMtiIwDFmY+eeh/FNHkaxGoUi
         xOlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=aCi8jesX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b5267e0d5si28167991cf.357.2024.09.24.16.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 16:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=aCi8jesX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stFO9-0003Wx-18; Tue, 24 Sep 2024 19:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1stFO6-0003Q5-73; Tue, 24 Sep 2024 19:56:10 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1stFO2-0003ez-Rw; Tue, 24 Sep 2024 19:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1727222159;
 bh=jhxBC6gQntL8VsjqBpnfef2OLnbaj23C+IqAVn1+HK4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=aCi8jesXMfKk0OrXIS8iPzvaMUkwq7OuYOs6jp1H8Rwg2oqNCAZxskN1vtyPh3O76
 DGAiPmnzBBj5gLsTOVoSkZkoUrT//d2mmSeooWMv0Cmr0AqIFPV4/FwmGLOPa1Px0O
 dJD/5Jq2hVCc3yOmjCkCmn/fROlYoJcSk0/7N611F6c2DKcODsH7p1KwflTmg1mh4t
 KB766eQpsXFdWfcTx1qPwKJGDTaSQ545h1nSrDbooU9PWWHEZzPSO0+a2WoNR86r5R
 usz7JdOhvMr1GSP4z9Xr0Opoc8XjTfA7XS/vFA2Bs9/TP+szNGLfSPtN5mJMq9W3Au
 KspVs2X7Jy5aA==
Received: from [192.168.68.112]
 (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6B04F65013;
 Wed, 25 Sep 2024 07:55:57 +0800 (AWST)
Message-ID: <8571cf04692ded193b2d82d9592faabacc561f01.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/5] hw/gpio/aspeed: Add AST2700 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>
Date: Wed, 25 Sep 2024 09:25:56 +0930
In-Reply-To: <SI2PR06MB50413C10FCB429361E467246FC682@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
 <20240923094206.1455783-5-jamin_lin@aspeedtech.com>
 <e5d149765b338d4754054691cb83eacdf3e2642f.camel@codeconstruct.com.au>
 <SI2PR06MB50413C10FCB429361E467246FC682@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ITcfd80RpD7/

On Tue, 2024-09-24 at 03:03 +0000, Jamin Lin wrote:
> Hi Andrew,
>=20
> > Subject: Re: [PATCH 4/5] hw/gpio/aspeed: Add AST2700 support
> >=20
> > Hi Jamin,
> >=20
> > On Mon, 2024-09-23 at 17:42 +0800, Jamin Lin wrote:
> >=20
> > > +
> > > +    /* interrupt status */
> > > +    group_value =3D set->int_status;
> > > +    group_value =3D deposit32(group_value, pin_idx, 1,
> > > +                            SHARED_FIELD_EX32(data,
> > > + GPIO_CONTROL_INT_STATUS));
> >=20
> > This makes me a bit wary.
> >=20
> > The interrupt status field is W1C, where a set bit on read indicates an=
 interrupt
> > is pending. If the bit extracted from data is set it should clear the
> > corresponding bit in group_value. However, if the extracted bit is clea=
r then
> > the value of the corresponding bit in group_value should be unchanged.
> >=20
> > SHARED_FIELD_EX32() extracts the interrupt status bit from the write (d=
ata).
> > group_value is set to the set's interrupt status, which means that for =
any pin
> > with an interrupt pending, the corresponding bit is set. The deposit32(=
) call
> > updates the bit at pin_idx in the group, using the value extracted from=
 the
> > write (data).
> >=20
> > However, the result is that if the interrupt was pending and the write =
was
> > acknowledging it, then the update has no effect. Alternatively, if the =
interrupt
> > was pending but the write was acknowledging it, then the update will ma=
rk the
> > interrupt as pending. Or, if the interrupt was pending but the write wa=
s _not_
> > acknowledging it, then the interrupt will _no longer_ be marked pending=
. If
> > this is intentional it feels a bit hard to follow.
> >=20
> > > +    cleared =3D ctpop32(group_value & set->int_status);
> >=20
> > Can this rather be expressed as
> >=20
> > ```
> > cleared =3D SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_STATUS); ```
> >=20
> > > +    if (s->pending && cleared) {
> > > +        assert(s->pending >=3D cleared);
> > > +        s->pending -=3D cleared;
> >=20
> > We're only ever going to be subtracting 1, as each GPIO has its own reg=
ister.
> > This feels overly abstract.
> >=20
> > > +    }
> > > +    set->int_status &=3D ~group_value;
> >=20
> > This feels like it misbehaves in the face of multiple pending interrupt=
s.
> >=20
> > For example, say we have an interrupt pending for GPIOA0, where the
> > following statements are true:
> >=20
> >    set->int_status =3D=3D 0b01
> >    s->pending =3D=3D 1
> >=20
> > Before it is acknowledged, an interrupt becomes pending for GPIOA1:
> >=20
> >    set->int_status =3D=3D 0b11
> >    s->pending =3D=3D 2
> >=20
> > A write is issued to acknowledge the interrupt for GPIOA0. This causes =
the
> > following sequence:
> >=20
> >    group_value =3D=3D 0b11
> >    cleared =3D=3D 2
> >    s->pending =3D 0
> >    set->int_status =3D=3D 0b00
> >=20
> > It seems the pending interrupt for GPIOA1 is lost?
> >=20
> Thanks for review and input.
> I should check "int_status" bit of write data in write callback function.=
 If 1 clear status flag(group value), else should not change group value.=
=20
> I am checking and testing this issue and will update to you or directly r=
esend the new patch series.

Happy to take a look in a v2 of the series :)

> > > +
> > >  /****************** Setup functions ******************/
> >=20
> > Bit of a nitpick, but I'm not personally a fan of banner comments like =
this.
> >=20
> Did you mean change as following?
>=20
> A.
>=20
> /************ Setup functions *****************/
>=20
> 1. /* Setup functions */
> 2. /*
>    * Setup functions
>    */

Either is fine, but I prefer 1.

Cheers,

Andrew

