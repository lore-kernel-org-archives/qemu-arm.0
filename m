Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6888532njd;
        Tue, 8 Apr 2025 01:26:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf0J7pWxEYrjCexorDVY0T/YfzITBHKgHMbxzuFVzjDQ6cPBqFQc1jvN/63PJe3g7vE+czyTkipJ4gUg==@linaro.org
X-Google-Smtp-Source: AGHT+IHzbuEhusP3G/83SAdHOuxnukookJ3Knwhk9z2Ig24StBJ1Kj8DLHevO8zYCbncrydvg5yI
X-Received: by 2002:a05:622a:20f:b0:478:f03c:b3dc with SMTP id d75a77b69052e-47925a35858mr238649981cf.41.1744100814572;
        Tue, 08 Apr 2025 01:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744100814; cv=none;
        d=google.com; s=arc-20240605;
        b=BOkwcdTVeGDteoj8MziLOTFwfggBmUd5Xk7zu75GIgpdVc2v9rFVEdUN+1ZQm+7O06
         oU4gpNQHblPEvMaOr7WSJCafn/59/IqM6D1ebMClC8rO+Vz90fBkZdmCKFZWGdY4GzYr
         xqAHtFNmveGWoW+unPHHOXINSXb4NLHIsN+Dm/0woPD6iOeySNOOD7xUOfHVMhkhseHg
         pcnS4oBWttb0huZUUDo7Gp79dQAm7NWrexB2tAbdRqYfVUx4LRSShGtGQoYEkR04p05B
         fYOuX1TAqi7eKuEqQ3/dFug1qLP5DrNYv8S4TDQalvbXZG3zs151gNtN106+s5OJZi9T
         Y/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=M+6fdV7hVdAku8kw3ZufJFUSNCIhawzFvHGFPlWT6qs=;
        fh=WU88N4mKJ15KAWPL9VYIv7nZ1xzpFNrIIDVdluAAoJ4=;
        b=EjFQQxxmXzrfNWA2QRLQbS0oPwSkZH5Vg2GxUhLUN8YnPJQ6Zyp4LdVuaNLfwLadNT
         fOQzw3xXtcIyx3XCu9WXPyja+TImZ305Cy0dIyW3UWt27i2iHskE+TyR5pgcP2KCwFoe
         Q/NaPB5U60EKi64oZr4//hCxaRJZhdPluUYTqNpdsEjHUkiqDVnRA+MlVXxyA77NMsPO
         190DwalTShQTangUFAuuL4OcM+ff5j/3DxheWbW6vf1LV4Fj2oN8nZ0IU862LAXXrO/n
         CNk8PW1rrJ1dR/itmJ+bZlqLYFAMag6sDzZm7nd0bzlqEop9bn5gUJ91rebQ0IbxI7qF
         vB3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b05c632si102914431cf.14.2025.04.08.01.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Apr 2025 01:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u24Hu-0004gt-9t; Tue, 08 Apr 2025 04:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u24Ht-0004gc-40; Tue, 08 Apr 2025 04:26:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u24Hq-0000dp-5F; Tue, 08 Apr 2025 04:26:28 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZWzb64K3Vz6M4gw;
 Tue,  8 Apr 2025 16:22:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 94A45140393;
 Tue,  8 Apr 2025 16:26:13 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Apr
 2025 10:26:12 +0200
Date: Tue, 8 Apr 2025 09:26:07 +0100
To: Eric Auger <eric.auger@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v8 1/6] target/arm/tcg: increase cache level for cpu=max
Message-ID: <20250408092607.00003f74.alireza.sanaee@huawei.com>
In-Reply-To: <a66d6212-55bf-4d34-8e98-0e0df1a96da0@redhat.com>
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
 <20250310162337.844-2-alireza.sanaee@huawei.com>
 <a66d6212-55bf-4d34-8e98-0e0df1a96da0@redhat.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9XzOT/tSCBxa

On Mon, 7 Apr 2025 19:07:29 +0200
Eric Auger <eric.auger@redhat.com> wrote:

Hi Eric,

> Hi Ali,
>=20
> On 3/10/25 5:23 PM, Alireza Sanaee via wrote:
> > This patch addresses cache description in the
> > `aarch64_max_tcg_initfn` function for cpu=3Dmax. It introduces three
> > layers of caches and modifies the cache description registers
> > accordingly.
> >
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  target/arm/tcg/cpu64.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> > index 29ab0ac79da9..1405506594c2 100644
> > --- a/target/arm/tcg/cpu64.c
> > +++ b/target/arm/tcg/cpu64.c
> > @@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
> >      uint64_t t;
> >      uint32_t u;
> > =20
> > +    /*
> > +     * Expanded cache set
> > +     */
> > +    cpu->clidr =3D 0x8200123; /* 4 4 3 in 3 bit fields */ =20
> =A0/* 4 4 3 in 3 bit fields */ was not obvious to me at the first
> reading. I guess it means unified for L2 and L3 (0x4) and separate
> I&D for L1
That is correct. It might be a good idea to update this comment.
> > +    /* 64KB L1 dcache */
> > +    cpu->ccsidr[0] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 *
> > KiB, 7);
> > +    /* 64KB L1 icache */
> > +    cpu->ccsidr[1] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 *
> > KiB, 2);
> > +    /* 1MB L2 unified cache */
> > +    cpu->ccsidr[2] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 *
> > MiB, 7);
> > +    /* 2MB L3 unified cache */
> > +    cpu->ccsidr[4] =3D make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 *
> > MiB, 7);
> > + =20
> Out of curiosity how did you come up with those values? Is it an
> arvbitrary choice?
The numbers are arbitrary. It was important to just have at least three
layers so I can experiment with L3 cache level, as currently we got
three layers in the interface.

Thanks,
Alireza
>=20
> Thanks
>=20
> Eric
> >      /*
> >       * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would
> > otherwise default
> >       * to because we started with aarch64_a57_initfn(). A 'max'
> > CPU might =20
>=20
>=20

