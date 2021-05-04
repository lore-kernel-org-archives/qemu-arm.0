Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3175448lfg;
        Mon, 3 May 2021 18:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6NYe1zCbNJVu88xzwJ6pUAMM857LfRvWdVS6PKStE5mQv8mIxCpPKNZWjk8scGOmxC9ub
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr21064105jao.99.1620092665364;
        Mon, 03 May 2021 18:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620092665; cv=none;
        d=google.com; s=arc-20160816;
        b=oNYgxBzmCbVxld9BL1VnLWY+Wn6mQb3hC1C/Xk+8X2Yzpxz0nf+mKK7OTKnTBIqDFF
         Zl220/op4SH5nuIQvndWs8ChsEDCz2EAPmE9OAlvZC0Cd5VN0+RWaidtWCNYPbQ3H0Mh
         EoxKCKmrHZLfD6iG4gB5wdEh03wVmCAeDFvanlETLTofnJbr6mxIHgjnYeF5PMW19GBS
         qxrfp1q5OpGYOD4p89iItZZljyZuObYMSsO+/VCARlKPLeByKGralaXCJtPEQLbFl9ax
         UcM0+qoEPs+HmCjk1xve+SG0RsV+++sbsbLSRhAMA3rLeJ/uDILInFO2C8GSkFxH1RBH
         cqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=SsYcmApY+WMM2l04RH7oz6sHdszCaEVkIYohZSbnTEc=;
        b=LTyQsXaebET7D7O2itXHqHJtNNStWF9MwZvwjACoWgbY3FL/xLTPwdPmZxJWWkMyc0
         x2PluSmsilHFSlg328vjwy4bbAWF80MLVZWM4chcGlFZZQ+hcud0Vvi+lUgtCrBEhDIR
         wSBIzsh9f8H9TzHzLJFp/sLfpVyGhPMGkUxM5JA9oV+tMlHhKx2NF50YeMOLKmQMmbfD
         Si9AzeqK3xwSso/1bGgCqJImktp3N++fpKkHysSXxE1TKESwlxWXhLfCEjLONl6Fw6/p
         9YD70M9CCSd82jaXjm+qsByrD0mMbeLtRolZwOBR+0KHuT8mFcEOTusFGNpWF5vWtwMm
         O8Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=P6eZGfba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si16620490ilv.52.2021.05.03.18.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 18:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=P6eZGfba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldk6q-0004YY-NN
	for alex.bennee@linaro.org; Mon, 03 May 2021 21:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldk6T-0004Xm-NF; Mon, 03 May 2021 21:44:01 -0400
Received: from ozlabs.org ([203.11.71.1]:59411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldk6R-0005oy-BS; Mon, 03 May 2021 21:44:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ2gY2NM6z9sT6; Tue,  4 May 2021 11:43:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620092633;
 bh=3anFEGHjKRDBJBpGN0aquHD3mJDsI32H2+VnbPLeVOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6eZGfba00ncrgKhQYsT9pbqX5+fN+lfIhBajc4eYRtRhC+zBvHTJHxp1ONL2GWvv
 vL/QusApiUEvubSUSiWvtnxRfO096j++RjpxQ48qp615QNLj3iQSXBpRDrtcHYdweN
 m2o+noyZ5mUla3ZFvFQ/TuEQXMKerGhdCrtOj+kM=
Date: Tue, 4 May 2021 11:21:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 1/3] spapr: nvdimm: Forward declare and move the
 definitions
Message-ID: <YJChiYgt6AAjhnIe@yekko>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <161966811094.652.571342595267518155.stgit@17be908f7c1c>
 <f33dfff6-a1f7-244f-531e-ef0d93ad0c3d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rqO14lpZiRldN/l1"
Content-Disposition: inline
In-Reply-To: <f33dfff6-a1f7-244f-531e-ef0d93ad0c3d@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 mst@redhat.com, qemu-devel@nongnu.org, linux-nvdimm@lists.01.org,
 aneesh.kumar@linux.ibm.com, armbru@redhat.com, marcel.apfelbaum@gmail.com,
 bharata@linux.vnet.ibm.com, haozhong.zhang@intel.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, kvm-ppc@vger.kernel.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, imammedo@redhat.com,
 kwangwoo.lee@sk.com, xiaoguangrong.eric@gmail.com,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFj9NenNRgve


--rqO14lpZiRldN/l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 01:23:47PM -0500, Eric Blake wrote:
> On 4/28/21 10:48 PM, Shivaprasad G Bhat wrote:
> > The subsequent patches add definitions which tend to
> > get the compilation to cyclic dependency. So, prepare
> > with forward declarations, move the defitions and clean up.
>=20
> definitions
>=20
> >=20
> > Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> > ---
> >  hw/ppc/spapr_nvdimm.c         |   12 ++++++++++++
> >  include/hw/ppc/spapr_nvdimm.h |   14 ++------------
> >  2 files changed, 14 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> > index b46c36917c..8cf3fb2ffb 100644
> > --- a/hw/ppc/spapr_nvdimm.c
> > +++ b/hw/ppc/spapr_nvdimm.c
> > @@ -31,6 +31,18 @@
> >  #include "qemu/range.h"
> >  #include "hw/ppc/spapr_numa.h"
> > =20
> > +/*
> > + * The nvdimm size should be aligned to SCM block size.
> > + * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> > + * inorder to have SCM regions not to overlap with dimm memory regions.
>=20
> And while at it, even though it is code motion...

It looks like the patch no longer applies clear to ppc-for-6.1, so can
you rebase and fix up Eric's nitpicks at the same time?

>=20
> > + * The SCM devices can have variable block sizes. For now, fixing the
> > + * block size to the minimum value.
> > + */
> > +#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
>=20
> > +++ b/include/hw/ppc/spapr_nvdimm.h
> > @@ -11,19 +11,9 @@
> >  #define HW_SPAPR_NVDIMM_H
> > =20
> >  #include "hw/mem/nvdimm.h"
> > -#include "hw/ppc/spapr.h"
> > =20
> > -/*
> > - * The nvdimm size should be aligned to SCM block size.
> > - * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> > - * inorder to have SCM regions not to overlap with dimm memory regions.
>=20
> ... this should be "in order"
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rqO14lpZiRldN/l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQoYcACgkQbDjKyiDZ
s5K2XhAAnKMU4fHKY8zYm2UkdJJMJZJlnQtfgO1iJQLrmfFszhFekavJzaRx/xT0
gudfIWjcqRomM3jzQQq5LbEr/XH4w8ws+PF1kPTetjO7gSQepyO9krepcPmiciJ7
My58zSnBNmyNDAgMHzRc2fYNBFxr/XSXxo2ZZidUavG8fZS2h2ftIz8JlTepY9pN
NBOURrUtwcT+gAvpbE7saAVKLFMlRRFN3vU3Aj/vt/1P5gBg7dOEsYhTleDFDske
njhUdtDB8qy0NZba6Mz0Um6hiUZU/xH+YMS7S1ZZcqA8ne08kTELW5cKzjks1NST
/AAIlrHuFckRzGo3xHeTNeBoU76rZCUWXNe8TxmCswUHOlQQELLspIqbMW2/BgNP
XccFpegH/H/qEwe2ZXVM86aOHuSaIwmKmrF96N5sD0WZMLgRA1XXDSc40p+NV67h
p6uGnKotunrlyHIztASEd+/hwenV6nGAAePeuBP2NLQbD+ZaQRDkzMrTmujN1SRj
u68z8XYYO/pSk77mWO0oh9Ao42EVZVLEOHnRqyjsdc/YD3iLm0QP4hDXe6Q9c39Q
sHXBju4en2BPVJme+8yZzobJzHYXKA3E7wJ0PVx57Ra9KToZf7mZdiL7pHffHI1c
XtqKim8cz5xm4OnCloZTghId9DHNgO9maAHFP+xnroRosQwzD4s=
=tiiy
-----END PGP SIGNATURE-----

--rqO14lpZiRldN/l1--
