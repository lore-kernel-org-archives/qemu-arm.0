Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2140623ejf;
        Mon, 26 Feb 2024 07:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsvRT9ZIWXsbBNCUxatPbpnflo2jQAqLclX6GFgX22dd4j6KbraRr8jG8OdLmhwZQVTYEvzYDqXF1XP/atpGLa6lC4gMsF
X-Google-Smtp-Source: AGHT+IEme6zJfkFtCiJ39ZWpngvJVDiDhhKmM1021zESordUSFUsycJkptbTC0Wan3UsD+XVwO2k
X-Received: by 2002:a05:6214:3990:b0:68f:ea48:e7a3 with SMTP id ny16-20020a056214399000b0068fea48e7a3mr9469441qvb.24.1708962873435;
        Mon, 26 Feb 2024 07:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708962873; cv=none;
        d=google.com; s=arc-20160816;
        b=tRKA8m+u8hHtvo9A0uOasBZbq2QZDuyXP/ORMDBtITdv1BbZQaySt6NBZKiItCFiZ4
         m0j0DrpgmCOY8sWy9kFyCoghJf/xU5RvtK7m38GZl1kb1gd4DH2B5hrtm0gyd251DoxJ
         I1dWaWFszUgty6covdCsk82PBmxwnuaquuA7SOe/4mxjref6xFlWDNZiVm9mGQ/AP8XV
         C4y8jX8Pcaki6kOcoG9CT/hrdtrD5+lvJGXCw9HS8m5lStekJdEiYRhSyqPdj+O843QC
         Bi4EE0mmT+2RHqoJ/xRR2ix+2hC72qzhbVgL/Vx/HqRHowOqqw8GRhhAei8fuTp+4lnA
         eAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=CdNlOoe1zpPWozEzSGDEQlx7Vs9zNFBcv7+12m/QH7A=;
        fh=37J9MutlcBgsQwZkIUG4fQHW+H9Zl6PxtJqQRC0HTfQ=;
        b=PHN2w9wwuPKjIQvMyWqTGmFTGCPKO1IKS0tMdU7LzwIfrVa9ks48TQlu1Oj4w+ZIsP
         CYgyZIZPoAcqecOIYwfq6xFNRLIiyh06QbSz8RiMoWeUaiDZVne3msdFJT2ajOBzW8RP
         VF6flMO4Gq5HZRB/aOnpMMF4UJEATh+uBaPZmsVZTKaTpVYrP4JDMpvrKNWcScpogZPv
         kHkRFX/U7mK41dLZ1U8qnru8XzP6ZYi9QJH402BlbPupo4Qbljz5Db/pVQgY0qTzz0VP
         cmLu3zHwpM2hd7XFAIm97lH9bE9KUrX+4sBbwibU6KimEn1iiWfdXdb6p5OeZs97vLDA
         AeRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx8-20020a0562142b0800b0068f52f40746si5333077qvb.440.2024.02.26.07.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 07:54:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redIq-0000Tz-AF; Mon, 26 Feb 2024 10:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redIo-0000Qm-Qx; Mon, 26 Feb 2024 10:54:02 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redIl-0003eY-TM; Mon, 26 Feb 2024 10:54:02 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk4my00jWz67btc;
 Mon, 26 Feb 2024 23:49:37 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id F10FC1400DB;
 Mon, 26 Feb 2024 23:53:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 15:53:56 +0000
Date: Mon, 26 Feb 2024 15:53:54 +0000
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Markus Armbruster <armbru@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, "=?ISO-8859-1?Q?C=E9dric?= Le
 Goater" <clg@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
Message-ID: <20240226155354.0000619d@Huawei.com>
In-Reply-To: <ZdYSkNRkZBsfHJea@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-4-zhao1.liu@linux.intel.com>
 <87zfvuuk18.fsf@pond.sub.org> <ZdYSkNRkZBsfHJea@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JWwJWOuh7FDb

On Wed, 21 Feb 2024 23:11:12 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> On Wed, Feb 21, 2024 at 12:35:47PM +0100, Markus Armbruster wrote:
> > Date: Wed, 21 Feb 2024 12:35:47 +0100
> > From: Markus Armbruster <armbru@redhat.com>
> > Subject: Re: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
> >  ct3_realize()
> > 
> > Zhao Liu <zhao1.liu@linux.intel.com> writes:
> >   
> > > From: Zhao Liu <zhao1.liu@intel.com>
> > >
> > > As the comment in qapi/error, dereferencing @errp requires
> > > ERRP_GUARD():
> > >
> > > * = Why, when and how to use ERRP_GUARD() =
> > > *
> > > * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> > > * - It must not be dereferenced, because it may be null.
> > > * - It should not be passed to error_prepend() or
> > > *   error_append_hint(), because that doesn't work with &error_fatal.
> > > * ERRP_GUARD() lifts these restrictions.
> > > *
> > > * To use ERRP_GUARD(), add it right at the beginning of the function.
> > > * @errp can then be used without worrying about the argument being
> > > * NULL or &error_fatal.
> > > *
> > > * Using it when it's not needed is safe, but please avoid cluttering
> > > * the source with useless code.
> > >
> > > Currently, since ct3_realize() - as a PCIDeviceClass.realize() method -
> > > doesn't get the NULL errp parameter, it doesn't trigger the dereference
> > > issue.
> > >
> > > To follow the requirement of errp, add missing ERRP_GUARD() in
> > > ct3_realize().
> > >
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > ---
> > > Suggested by credit:
> > >  Markus: Referred his explanation about ERRP_GUARD().
> > > ---
> > >  hw/mem/cxl_type3.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > > index e8801805b90f..a3b0761f843b 100644
> > > --- a/hw/mem/cxl_type3.c
> > > +++ b/hw/mem/cxl_type3.c
> > > @@ -645,6 +645,7 @@ static DOEProtocol doe_cdat_prot[] = {
> > >  
> > >  static void ct3_realize(PCIDevice *pci_dev, Error **errp)
> > >  {
> > > +    ERRP_GUARD();
> > >      CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
> > >      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
> > >      ComponentRegisters *regs = &cxl_cstate->crb;  
> > 
> > The dereference is
> > 
> >        cxl_doe_cdat_init(cxl_cstate, errp);
> >        if (*errp) {
> >            goto err_free_special_ops;
> >        }
> > 
> > We check *errp, because cxl_doe_cdat_init() returns void.  Could be
> > improved to return bool, along with its callees ct3_load_cdat() and
> > ct3_build_cdat(), but that's a slightly more ambitious cleanup, so
> > 
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >  
> 
> Thanks! I can continue to consider such the cleanup in the follow up.
> 
> Will also add the dereference description in commit message to make
> review easier.
> 
Agreed cleanup would be good, but this is fine if you don't want to
do that now.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> Regards,
> Zhao
> 
> 

