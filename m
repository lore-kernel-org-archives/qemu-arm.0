Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp206650nji;
        Wed, 11 Sep 2024 08:34:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCsxG5UGNVGzbcYc4j/qtc+gNE7qiwMEBjuvSOZ1tbvVeG6oPcQKc5ShXzObb819kM2ecIK+6N+VZo5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFiXn7db6bwGV/izc8QlBu434LoTGYdls1EErJiqaqjqzIUY8/MYGAGyEBT56mS0GvcGhD3
X-Received: by 2002:a05:620a:3712:b0:7a4:d685:caa9 with SMTP id af79cd13be357-7a9a38ebfe0mr2196553585a.48.1726068890162;
        Wed, 11 Sep 2024 08:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068890; cv=none;
        d=google.com; s=arc-20240605;
        b=efgTrPfZW8d6pPw2rwhViYs52Ep12yjXInk4GOEDuUe7N2asB4EsOKrb9mhU4xVrOH
         BPoXo682Dmpcx/d7YsgV3N3I4hsE+7Ehh4HSSjLp+Vu/ftbCQ+hFZWEah9dIueLr1CfE
         sdi0XtrtcqeuSpZ4ZaHbo3sqQvZgUyDlx+wZqUbLPdjRBt7qu+40pfZ+XqvXXQWy4NXR
         V0cMhn05gd+qJMS/rc/xa2FbjEhMzp19PSn+bk9JtqudSujgG/KYSUZWeYM+VEw5a3qm
         Ihrv6C0h70Kulhynz3qgxSRMra83HPETVDuC+FfbhKeXNcGXThSCuGvoF1X8SVPVjgt5
         ptIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=W7JCOdC4Ca34EUiiRw/zD7Drw2UcTFLgA0S623EyIvo=;
        fh=D9C6Fi9/7hj7lBAsCHWNuHQ9wJ4bXwCyR67eaqZtF88=;
        b=LnYA2Jup9tdJ+AT4jVFSSRNvWAlmKdTAc1kr8RuO8PamVhwlIIPO6G4rV7M2Cdt+r8
         wHduJO8jgItQMFgWiYZ3C/UR60iK9yek8pV5S+Kzz79gvFjZmW4mz/Ipd16+U5T6rP7I
         wcI5WlQKOjoMFzim1bARvZcTExaL8KX9AvMYfE8a/GsKMdS8YwEBFG8HKCPYMsVAODSF
         oqzzcFVMHRTb3hqFUdvzzAJ8tUfW4FF5eAYoY6MWLZbhPjIlBWxU0KGLgbRmRNUbPim6
         FQS/Oa5YnDeai3UjHP9dnHoWw8dB3Yj1pXIn1Gfx1/D3tQiiOwFL2wfKp8WlcNiC1enX
         wIjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a4663asi1046540585a.392.2024.09.11.08.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 08:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soPMl-0007Z4-Ju; Wed, 11 Sep 2024 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1soPMk-0007Sd-5l; Wed, 11 Sep 2024 11:34:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1soPMg-0003mQ-Un; Wed, 11 Sep 2024 11:34:45 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X3kyl0NnZz6G8p7;
 Wed, 11 Sep 2024 23:29:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D45031400D3;
 Wed, 11 Sep 2024 23:34:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Sep
 2024 17:34:38 +0200
Date: Wed, 11 Sep 2024 16:34:36 +0100
To: Igor Mammedov <imammedo@redhat.com>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240911163436.00004738@Huawei.com>
In-Reply-To: <20240911152132.65a7a219@imammedo.users.ipa.redhat.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
 <2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
 <20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
 <20240825052923.715f88bc@sal.lan>
 <20240911152132.65a7a219@imammedo.users.ipa.redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Dg53OofzV5sY

On Wed, 11 Sep 2024 15:21:32 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Sun, 25 Aug 2024 05:29:23 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Mon, 19 Aug 2024 14:51:36 +0200
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >  =20
> > > > +        read_ack =3D 1;
> > > > +        cpu_physical_memory_write(read_ack_start_addr,
> > > > +                                  &read_ack, (uint64_t));     =20
> > > we don't do this for SEV so, why are you setting it to 1 here?   =20
> >=20
> > According with:
> > https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#gener=
ic-hardware-error-source-version-2-ghesv2-type-10
> >=20
> >    "These are the steps the OS must take once detecting an error from a=
 particular GHESv2 error source:
> >=20
> >     OSPM detects error (via interrupt/exception or polling the block st=
atus)
> >=20
> >     OSPM copies the error status block
> >=20
> >     OSPM clears the block status field of the error status block
> >=20
> >     OSPM acknowledges the error via Read Ack register. For example:
> >=20
> >         OSPM reads the Read Ack register =E2=80=93> X
> >=20
> >         OSPM writes =E2=80=93> (( X & ReadAckPreserve) | ReadAckWrite)"
> >=20
> >=20
> > So, basically the guest OS takes some time to detect that an error
> > is raised. When it detects, it needs to mark that the error was
> > handled. =20
>=20
> what you are doing here by setting read_ack =3D 1,
> is making ack on behalf of OSPM when OSPM haven't handled existing error =
yet.
>=20
> Essentially making HW/FW do the job of OSPM. That looks wrong to me.
> From HW/FW side read_ack register should be thought as read-only.

It's not read-only because HW/FW has to clear it so that HW/FW can detect
when the OSPM next writes it.

Agreed this write to 1 looks wrong, but the one a few lines further down (t=
o zero
it) is correct.

My bug a long time back I think.

Jonathan

>=20
> >=20
> > IMO, this is needed, independently of the notification mechanism.
> >=20
> > Regards,
> > Mauro
> >  =20
>=20
>=20

