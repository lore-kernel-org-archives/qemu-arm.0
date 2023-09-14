Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp339500ejb;
        Thu, 14 Sep 2023 00:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEh6VZiqkiuZjDcrn3qn0gx4N3rHpSJmpA5/7onRORL7DcNaqtxcu+BQTNN7hMpnw5m40O
X-Received: by 2002:a05:6214:e4a:b0:651:6604:bee6 with SMTP id o10-20020a0562140e4a00b006516604bee6mr889367qvc.30.1694677401521;
        Thu, 14 Sep 2023 00:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694677401; cv=none;
        d=google.com; s=arc-20160816;
        b=W04fPl3jVxSGa8hqGKUffMpUqHt8A3oeWmRpNIcSTNtlN6eYbEbQrzkQyHJYFPYuQQ
         LENr6csce2NLS8H+CMVd9CJZ8poqznfj8Yo0ER0SkBxg3ADrIVApHj2x/ypHUxSDZmDw
         XGSiSBbW427SnzJd7w4c7hQ93c9VjHf1WfWt6Zqb5qVsV8KdGZixcX5RLGwdN3Md4FCd
         hHVrYzyT3bS+4cmafrdMGfmZ3sQ7qrd1hvcO/cxg4RMY5dJVdlT9Nk8dR7sYh4NHVoHY
         A5jTuKzZvbkODawnI6l0rLdqCU1uCmRFAE7Y65KvMkpLRTqSrzZZsdwi7RmrkH9Yue4D
         5BFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=VI5M9g0fg5M/tq9qucR+vI2hc+ARyReuglQM6j3n4bQ=;
        fh=E2B1TOQSh04IaVzyHezKF7sUjWu//RIOTwgvlEgv7UM=;
        b=SljW2BD1DdG02hsXCUk25Mn/u0aCuH1Pqv0RtIVbkFYByzfENiNYzMeE3iusCQJNUn
         ojVq34Mx5x+bt+x6sErKK7kzaWm4OGGZbStTQW7YdPWsMh5UqY/nEtWR3q2bqSJWilGB
         nVhE3U08nDcCTbdPP2EbyGCKq1+3qPd5/COb5q3Cc8oFzj5T7/oca41nhxQm2cL5POiM
         eJchNf4JW7PwSqG5e55+cPMOnoVEhNCTl6ZvfrDAcluYSYzjz0yXyT/6JYmlggCzQnSY
         gnsIWyPaTef6Q9giW7ZVPZzMq5/neH/bZCUtu3kX4GO6YRV4K0QkC0kpO1Gn2pNITWQf
         xCAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=h+BohXY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id to18-20020a05620a4c9200b00770966ed33fsi558230qkn.157.2023.09.14.00.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 00:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=h+BohXY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgh0O-0000MW-W9; Thu, 14 Sep 2023 03:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qgh0M-0000FM-Q4; Thu, 14 Sep 2023 03:43:14 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qgh0J-0007Zn-72; Thu, 14 Sep 2023 03:43:14 -0400
Received: from [192.168.2.137] (210-10-213-150.per.static-ipl.aapt.com.au
 [210.10.213.150])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7E46420135;
 Thu, 14 Sep 2023 15:42:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1694677379;
 bh=VI5M9g0fg5M/tq9qucR+vI2hc+ARyReuglQM6j3n4bQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=h+BohXY3JF4PGMYD0PTD/VRHoMDHoqjzlZIlXmcdVrzyK5NsB5IHtcJ0KTq/bJWKn
 JJcvPlEmZKVW5b1BBPkzaALiVcBACKnJycud62DY1B9aij7oMUnTttdycqqw3M4aTQ
 RuFhnA89BNB9qIQjj79Gsu0PZdwwjwJpPez8tOPFyJRBNW8zXbJnPL3RuG04DNAOj9
 Zq+qz0smd+ytyW7Zp8/f/dvYPSah8EbwXvFMbJj6A2Uq8u+M0EQqiWlnEaRqv/8rUt
 ZllgKf6xTlzlXUYMXZN58E9Jgq43B5TnfJ3A1lhuITrYuT0zknk6CB4yc5rwCPZ/JQ
 S+ZroRLXetkqA==
Message-ID: <f375f6ed1d576586683cdba2a2710979e8bad369.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/3] hw/nvme: add nvme management interface model
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Corey Minyard <cminyard@mvista.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>, Jason
 Wang <jasowang@redhat.com>, Keith Busch <kbusch@kernel.org>,  Lior
 Weintraub <liorw@pliops.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt
 Johnston <matt@codeconstruct.com.au>, Peter Delevoryas <peter@pjd.dev>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-block@nongnu.org, Klaus Jensen
 <k.jensen@samsung.com>, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 14 Sep 2023 15:42:56 +0800
In-Reply-To: <ZQKtdSI-wZ20_V0F@cormorant.local>
References: <20230905-nmi-i2c-v5-0-0001d372a728@samsung.com>
 <20230905-nmi-i2c-v5-3-0001d372a728@samsung.com>
 <130f973070f4422e226a9e68218109094f0420fa.camel@codeconstruct.com.au>
 <ZQKtdSI-wZ20_V0F@cormorant.local>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: 5UgoT55SWCAU

Hi Klaus,

On Thu, 2023-09-14 at 08:51 +0200, Klaus Jensen wrote:
> On Sep 12 13:50, Andrew Jeffery wrote:
> > Hi Klaus,
> >=20
> > On Tue, 2023-09-05 at 10:38 +0200, Klaus Jensen wrote:
> > > >=20
> > > > +static void nmi_handle_mi_config_get(NMIDevice *nmi, NMIRequest
> > > > *request)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t dw0 =3D le32_to_cpu(request->dw0);
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t identifier =3D FIELD_EX32(dw0,
> > > > NMI_CMD_CONFIGURATION_GET_DW0,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IDENT=
IFIER);
> > > > +=C2=A0=C2=A0=C2=A0 const uint8_t *buf;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 static const uint8_t smbus_freq[4] =3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* succe=
ss */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x01, 0x00, 0x00,=C2=A0=
=C2=A0 /* 100 kHz */
> > > > +=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 static const uint8_t mtu[4] =3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* success */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x40, 0x00, /* 64 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* reserved */
> > > > +=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 trace_nmi_handle_mi_config_get(identifier);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch (identifier) {
> > > > +=C2=A0=C2=A0=C2=A0 case NMI_CMD_CONFIGURATION_GET_SMBUS_FREQ:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D smbus_freq;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 case NMI_CMD_CONFIGURATION_GET_MCTP_TRANSMISSIO=
N_UNIT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D mtu;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 default:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nmi_set_parameter_error=
(nmi, 0x0, offsetof(NMIRequest,
> > > > dw0));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 nmi_scratch_append(nmi, buf, sizeof(buf));
> > > > +}
> >=20
> > When I tried to build this patch I got:
> >=20
> > ```
> > In file included from /usr/include/string.h:535,
> >                  from /home/andrew/src/qemu.org/qemu/include/qemu/osdep=
.h:112,
> >                  from ../hw/nvme/nmi-i2c.c:12:
> > In function =E2=80=98memcpy=E2=80=99,
> >     inlined from =E2=80=98nmi_scratch_append=E2=80=99 at ../hw/nvme/nmi=
-i2c.c:80:5,
> >     inlined from =E2=80=98nmi_handle_mi_config_get=E2=80=99 at ../hw/nv=
me/nmi-i2c.c:246:5,
> >     inlined from =E2=80=98nmi_handle_mi=E2=80=99 at ../hw/nvme/nmi-i2c.=
c:266:9,
> >     inlined from =E2=80=98nmi_handle=E2=80=99 at ../hw/nvme/nmi-i2c.c:3=
13:9:
> > /usr/include/x86_64-linux-gnu/bits/string_fortified.h:29:10: error: =E2=
=80=98__builtin_memcpy=E2=80=99 forming offset [4, 7] is out of the bounds =
[0, 4] [-Werror=3Darray-bounds=3D]
> >    29 |   return __builtin___memcpy_chk (__dest, __src, __len,
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    30 |                                  __glibc_objsize0 (__dest));
> >       |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ```
> >=20
> > It wasn't clear initially from the error that the source of the problem
> > was the size associated with the source buffer, especially as there is
> > some pointer arithmetic being done to derive `__dest`.
> >=20
> > Anyway, what we're trying to express is that the size to copy from buf
> > is the size of the array pointed to by buf. However, buf is declared as
> > a pointer to uint8_t, which loses the length information. To fix that I
> > think we need:
> >=20
> > - const uint8_t *buf;
> > + const uint8_t (*buf)[4];
> >=20
> > and then:
> >=20
> > - nmi_scratch_append(nmi, buf, sizeof(buf));
> > + nmi_scratch_append(nmi, buf, sizeof(*buf));
> >=20
> > Andrew
> >=20
>=20
> Hi Andrew,
>=20
> Nice (and important) catch! Just curious, are you massaging QEMU's build
> system into adding additional checks or how did your compiler catch
> this?

No tricks to be honest, I just applied your patches on top of
9ef497755afc ("Merge tag 'pull-vfio-20230911' of
https://github.com/legoater/qemu into staging") using `b4 shazam ...`.

I'm building on Debian Bookworm:

$ gcc --version | head -n1
gcc (Debian 12.2.0-14) 12.2.0

Andrew
