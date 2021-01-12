Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3323316lfq;
        Mon, 11 Jan 2021 23:28:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQZxL7fyNT0Z4w7ggqDmSulsGS1+4wzEWwZpuQR+FIqxlga6lS/I/ZD4Ghp3d0UNOWxH4L
X-Received: by 2002:a25:d913:: with SMTP id q19mr5192038ybg.180.1610436508592;
        Mon, 11 Jan 2021 23:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610436508; cv=none;
        d=google.com; s=arc-20160816;
        b=fDQTQzMmaYO5sp3ZuP208h5utTp3qyAEOUU3ux/dpSbMzp+TI2lCF1Vw/rjfOsv+jy
         OWpFuESUVIEU65mtA5z8fGnUMfrwmnHZNgtssiNsSWGco8ASQpoFAO9TP4UvZJo3hXec
         pR6gLIKuDrXckWaS6B+37XhjiEYwfv+IAfladAqUE7gGKHYhXlftFDvJfUZaR2RLrmTr
         7OFoJ9dkLrjBEaxm7DYwNHL/unVk4q/4ZgU0xtIDXrLpfaWPKAwj/QN/fhOLybTsZwb3
         mP3cnEPHk0nYuyos/KYum62b+ktwv+D9DSgsyOzMmV2vxYyzGpmM8SGWaPh3+Uall/m1
         uhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=+NvkMo3MCw0fuDeIvgBY0HTqwCr4Lb1A1ObliobZkoA=;
        b=w5L7E0wY7qH9E+WA3fl30f4Y2FU3UnBNfzcKopi86PVBllwmc13Sr1Q7BeUMJbsATJ
         Rq0UA16UV0zv8TnT71Q0aYps3QJ1S3pLFi0WBvN5/C06G9JZbtn8rH3I9UF/ZBa2bY3u
         w+tMQBipcEOl/8xbOu1Zgz8q5TlhMxij4g7vub2M068Rq3Ln89sstR7Gb8gLHLwKKU2B
         bkPS5hG51CFyO36uRuhJf2GZj53Ij/bfs+wpc28WtlAJ1qBvPU77zMvGEJVjCcBZHTnX
         HKnHuoCvE3mMuwzWtNLFCOG6090FJMV5cDAh/IyORbFzviigpCgorS+Qd0zJo7UvAS4A
         coHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si674336ybc.124.2021.01.11.23.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 23:28:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzE6O-0001IM-0f
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 02:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzE66-0001Ht-37; Tue, 12 Jan 2021 02:28:11 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54768
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzE5y-0003rw-CI; Tue, 12 Jan 2021 02:28:08 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 7CAC75FCEF;
 Tue, 12 Jan 2021 08:27:57 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
Date: Tue, 12 Jan 2021 09:27:54 +0200
Message-ID: <11670958.O9o76ZdvQC@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
 <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
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
X-TUID: d19ZGp2wk13f

Le tiistaina 12. tammikuuta 2021, 2.19.55 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -11286,8 +11299,10 @@ static bool get_phys_addr_lpae(CPUARMState *en=
v,
> > uint64_t address,>=20
> >      ap =3D extract32(attrs, 4, 2);
> >=20
> > -    if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> > -        ns =3D true;
> > +    if (mmu_idx =3D=3D ARMMMUIdx_Stage2 || mmu_idx =3D=3D ARMMMUIdx_St=
age2_S) {
> > +        if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> > +            ns =3D true;
> > +        }
> >=20
> >          xn =3D extract32(attrs, 11, 2);
>=20
> Does this want an unconditional
>=20
>   ns =3D mmu_idx =3D=3D ARMMMUIdx_Stage2;
>=20
> When can ns be true and mmu_idx =3D=3D ARMMMUIdx_Stage2_S?

Actually there's a bug. ns is not set at all in secure state 2.

=2D-=20
R=C3=A9mi Denis-Courmont


