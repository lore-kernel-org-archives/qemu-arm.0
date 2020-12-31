Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12604228lfq;
        Thu, 31 Dec 2020 01:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5cR2TkXg8u42XaWlszKzTCHZ6Dt4Y/FT2XynitFH8xIn02Na8iPr9/qC2qtJhiVqi0QCb
X-Received: by 2002:a25:ae14:: with SMTP id a20mr83761074ybj.410.1609408785741;
        Thu, 31 Dec 2020 01:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609408785; cv=none;
        d=google.com; s=arc-20160816;
        b=BCZ18FMwRiOe0ut8VMWLm2lOlHp9H8na1MfOR3svYrO/g7UJZeN3JGPaueBt46Odm1
         VNPFJOD0inVSJhrQkQAFgu7xsecsHBG27EorDXKjWB8JF1N70DfMs2rjq6vHlgLjb/n6
         BWAGiy2PI+hcvwjGiH/nbl66VH1hl7RViMCPtAiRkWVpBgyhLWGT9qSYFcRTEHVNjrXR
         VTlui5+ogKHXWnRh1fHTwBfzRrTjZNaELTcPjFqBPDNZ7n/SJQeB0c+/fPaiAbIazEqO
         akrlf3BuhVWS8gzm1VhlNn89mmwy92Ke0lFVD0SacI+wlq+51eT7OvKqDOI7MfJup1LK
         LY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=33/o7n491d0rbntrUMVcu0rMoA5rnxA3+QRRjdo87EU=;
        b=S5W2cAWgOotSWfIBl4BbWCXTj1t/eRwXxXNQ2H10GTpCoLhKU93qIDCSzVc02vK+gR
         7IL/PqVasIB8KKu9wIaRe1WTRvTdgRRmhCIXMleDCUNwXmj4A4wT91jZkYPstEDRab4K
         XpqnrP4sx+RQ+lpVtu6uersn1wGuad3SBUHDSX80od0kJI/TW+YNoMpPAadas9JAqXy+
         v1ke37lMeqVPyVR1Ex0eCSP0vi0QGSxs3n3sW1Wapb/W7Byv65/YFHnAb0VV2QIcwqjO
         FrbXjYC1NgyKt1hI0FrKsHOMIJDyRnt9g12Tt7e3YcpEiiZ4NLGC0MYLgiIjnEhmyciX
         cXpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si39369798ybl.209.2020.12.31.01.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Dec 2020 01:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuukD-0007q0-4V
	for alex.bennee@linaro.org; Thu, 31 Dec 2020 04:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kuuk5-0007pq-Jj; Thu, 31 Dec 2020 04:59:37 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:45334
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kuuk3-0005Xy-To; Thu, 31 Dec 2020 04:59:37 -0500
Received: from philogene.localnet (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 782565FAD0;
 Thu, 31 Dec 2020 10:59:34 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
Date: Thu, 31 Dec 2020 11:59:34 +0200
Message-ID: <9468010.vzF1F9XyNR@philogene>
Organization: Remlab Tmi
In-Reply-To: <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
 <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 remi.denis.courmont@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 197YCioh+4US

Le jeudi 31 d=E9cembre 2020, 00:38:14 EET Richard Henderson a =E9crit :
> On 12/30/20 2:10 PM, Richard Henderson wrote:
> > On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> >> From: R=E9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >>=20
> >> Signed-off-by: R=E9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >> ---
> >>=20
> >>  target/arm/helper.c | 14 ++++++--------
> >>  1 file changed, 6 insertions(+), 8 deletions(-)
> >=20
> > The patch does more than what is described above.
> >=20
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index df195c314c..b927e53ab0 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >>=20
> >> @@ -10821,17 +10821,12 @@ do_fault:
> >>   * Returns true if the suggested S2 translation parameters are OK and
> >>   * false otherwise.
> >>   */
> >>=20
> >> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> >> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t
> >> level,
> >>=20
> >>                                 int inputsize, int stride)
> >> =20
> >>  {
> >> =20
> >>      const int grainsize =3D stride + 3;
> >>      int startsizecheck;
> >>=20
> >> -    /* Negative levels are never allowed.  */
> >> -    if (level < 0) {
> >> -        return false;
> >> -    }
> >> -
> >=20
> > I would expect this to be the only hunk from the patch description.=20
> > Probably changing this negative check to a >=3D 3 check.
>=20
> Having read the next patch, I think you should drop this type change.
>=20
> >> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *en=
v,
> >> uint64_t address,>>=20
> >>          if (!aarch64 || stride =3D=3D 9) {
> >>         =20
> >>              /* AArch32 or 4KB pages */
> >>=20
> >> -            startlevel =3D 2 - sl0;
> >> +            startlevel =3D (2 - sl0) & 3;
>=20
> This hunk belongs with the next patch, implementing TTST, and should be
> conditional.  I.e.
>=20
>     if (stride =3D=3D 9) {
>         startlevel =3D 2 - sl0;
>         if (aarch64 &&
>             cpu_isar_feature(aa64_st, env_archcpu(env)) {
>             startlevel &=3D 3;
>         }

You can do that but:
1) Nothing in the spec says that SL0 =3D=3D b11 without ST means start leve=
l -1.=20
It's undefined, and I don't see any reasons to treat it differently than wi=
th=20
ST.
2) Functionally, checking for ST seems to belong naturally within=20
check_s2_mmu_setup() in this particular case.

>     ...
>=20
>=20
> r~


=2D-=20
R=E9mi Denis-Courmont


