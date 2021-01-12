Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3326977lfq;
        Mon, 11 Jan 2021 23:34:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb3RXAlpZsrj09IIEAAinUupd6l4uD40bKzQtGMTbT9gQIvXxmo9sbISUsalKalXrQeAwC
X-Received: by 2002:a25:5:: with SMTP id 5mr5029272yba.478.1610436879573;
        Mon, 11 Jan 2021 23:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610436879; cv=none;
        d=google.com; s=arc-20160816;
        b=XGuaWBmjCaRwVkPkbjaYlRi1Dr1uG0B3EXD048gF3l8w2ykSlZC/JEz4H9ipr0iD+J
         KatXdakk1LLV0qo3tF6LZabP2LXdyTt6xwLTGuXM3XhVT2vWy59oWuj3N78pJ6Ex62qb
         GJfKiy7KcygT4Z9EwbUq3JROcB+PxMhveYad0FhuqrTqrCOqW0zBnlxa/3L7dgF4dIWA
         skuSRu8b34Uo+y66IdHCSK1Y1t2VUJHcPmhFacCKt1hiJ8nfzy3uxjvVnyEQF1nAzjpE
         N1wRwaB8MO8Ez9Og70SaqCqWcLhKMhYdeqWdXy9iOhfRnN3Z2s5TMdlUJ8VRGiQQeUBD
         jH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=fCtb8I7QqJqvjFITnYLbW1OCUTwb3HR+15LquzctLMg=;
        b=MSiXsMa0AZWWcyxRHDLB+BA8BMaoInYviVShtSdQzvSFfUKXzZ1FexawQrARD+MhPA
         tBfCZhF3mBrlWb63En8SezgTy8sageXnCzGsg+gEfHIpfeDZ83QRB7o3AdEsApcIp0ya
         ilAD9zt5/iWQEVwfnk9QFE3BYoEduRlxI1vcpkXmXNniviWslNpspo8TLSFXT/ytpNP1
         H4r2X2ccEVZVy2dzg+tf5L7skzmxm3z3BsDxlMeBAdRlLCWQiCcq4fJCUgeIP6Gcvbr6
         98/Zhl20gDxQs1zUnWujt5KIcE9KMVeT/QmyRjWXfm863gQsVKrBipluj7JmtVqPkwqT
         GpbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si2623002ybg.367.2021.01.11.23.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 23:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzECN-0003kV-1P
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 02:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzEBn-0003jb-3i; Tue, 12 Jan 2021 02:34:03 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54816
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzEBl-0005sJ-CU; Tue, 12 Jan 2021 02:34:02 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A13DC5FCEF;
 Tue, 12 Jan 2021 08:33:58 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 16/18] target/arm: add ARMv8.4-SEL2 extension
Date: Tue, 12 Jan 2021 09:33:58 +0200
Message-ID: <4284205.LvFx2qVVIh@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <4e32ca89-51aa-85d1-0a8f-e9aa7e037be4@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-16-remi.denis.courmont@huawei.com>
 <4e32ca89-51aa-85d1-0a8f-e9aa7e037be4@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/OZjJll8IVA

Le tiistaina 12. tammikuuta 2021, 2.13.29 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -3297,7 +3301,7 @@ typedef ARMCPU ArchCPU;
> >=20
> >   * We put flags which are shared between 32 and 64 bit mode at the top
> >   * of the word, and flags which apply to only one mode at the bottom.
> >   *
> >=20
> > - *  31          20    18    14          9              0
> > + *  31          20    19    14          9              0
> >=20
> >   * +--------------+-----+-----+----------+--------------+
> >   * |              |     |   TBFLAG_A32   |              |
> >   * |              |     +-----+----------+  TBFLAG_AM32 |
> >=20
> > @@ -3346,6 +3350,7 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
> >=20
> >   * the same thing as the current security state of the processor!
> >   */
> > =20
> >  FIELD(TBFLAG_A32, NS, 17, 1)
> >=20
> > +FIELD(TBFLAG_A32, EEL2, 18, 1)
>=20
> Note that via other in-flight patch sets we have run out of bits here.  I=
've
> rearranged them in
>=20
> https://patchew.org/QEMU/20210111190113.303726-1-richard.henderson@linaro=
=2Eor
> g/
>=20
> This should be nothing but a minor confict to fix up.

I think we should get rid of that flag that's hardly if at all ever going t=
o be=20
used. It should be possible to bypass gen_exception*() straight to=20
gen_helper_exception_with_syndrome(), so that the target EL can be computed=
 at=20
run-time.

=2D-=20
R=C3=A9mi Denis-Courmont


