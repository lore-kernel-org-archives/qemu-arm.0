Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4255264lfp;
        Mon, 3 Feb 2020 10:20:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+/8reIfvJwne9L0G6Ne6DENtqv+aScGNnCl1ikwXLCZVfaM7POnY1G4LWz+VyHSeHfEQb
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr23248024qkg.303.1580754004474;
        Mon, 03 Feb 2020 10:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580754004; cv=none;
        d=google.com; s=arc-20160816;
        b=oOwFh3W3Ul/iy/Kcf3C+6PCA5U2zxEaQ5j+5EnPFENaWmt23NIXqXqCyfGPNCOtdJf
         4q7FyEr0ql45HtXoEZnTAt4k3kX6IegZxwYxmzc/c4WHqeIURlvtQJ/sC13Uvt0kUPGw
         UnweFU/dKQYZZT59p1o6rvtpOs/HkMBr6PXpmIfLsdWPxEZRl/sxC8H8T9HM3pKwRpXQ
         9PxM0VF/FQQeO6hp6S+N1DzyjCj+Im8bKRvxx4HQTi4+3agxDqEx5gu8zsCQE4e/q5JE
         OKK+3sqfKmz8RLIt1cgTMIvGHmldd/S4rZzWqzt223YFXnye7XJBdMw7kgT5sHD3JuI/
         8NaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=3X9Ke/6lhCDOgaCdoimSHbklEKDhb4IMe/P+NV5GSW8=;
        b=E1DO2uoKjckNmT+/77oY9wHGg4nANL1drcGxYCJX8o77atWh8dTFCgO6+5u52ICxfq
         3jguBkpMrmL0/v2DnEeFBb3g2Dsg7eqNmRkQUCVjiVuc+OECy6r4su/N1Yt6qYHY3sHV
         W/ZVBd4Q22O9I+2o/FCyDw3vzTZhpxPZCXVJXz+g7jIiUTS7CahXFKviCcR7qyWOQKO6
         gIAPw9wmH6PJlu6yEE/VQZRRVb+9GehQLT16LdqrPP7FFPwwqZNNJp6CIbeiuPEA4hyr
         lFbSU98IWollJR0oK8jlz9waLlMcMnplH8dgcw84yf2MZ8kuDokfO70HH2Iax9dJt6HM
         A7kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dthm8PUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si12392697qtu.118.2020.02.03.10.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 10:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dthm8PUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iygKJ-0000PP-U7
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 13:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iygK8-0000P0-FX
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:19:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iygK5-00021x-Lw
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:19:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50670
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iygK5-0001zH-9A
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580753988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3X9Ke/6lhCDOgaCdoimSHbklEKDhb4IMe/P+NV5GSW8=;
 b=dthm8PULdQ283AzetRU/oUlmrj/0F51TpiS6qhSFYhHwvl6grKK9S3lPuoW4C4Xz0arN6v
 whcVrcB+NY3GoMZBeAAALfKKbR4BrchRh29XbdJHMLJGu7+jEY2DN/OeJlceaHbqq79cov
 7enQ/ZzxxoNteG1jv0ZtnK8ovQjEKig=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-kRZPmTHENDCO7nf4jFNhyg-1; Mon, 03 Feb 2020 13:19:43 -0500
Received: by mail-qt1-f199.google.com with SMTP id l25so10527156qtu.0
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 10:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fIm6vORCNJsGm/WnM7kjpe/TUdEBocbXhFHEzvxfb8c=;
 b=mEjdyLlx+jTAaxgvn7NagdiYFJ/r/sSIUcjMCQL4Ys7ikOwYar5RXJOv17Vk1KfR+N
 GspfeM+/3qUa8Klq2HWZJmnxTkHeROcCj8DIUUmVdC/1fxdnNot1TV2N2KTPJEm+Dz/u
 /fuPFHf8ENr8KjhjDUtMLowXGiKE0QGTA+3IoW6q2FGVFZqHL26Fwg0NFCnQc6u3l6js
 UsODJerlmEhQt78OAuSHbX2cLqPgBtWrqHlqzKpslUYbw8QBzz3pGukRIMjyk6CpIGrx
 Ce5DHMc0byVRdIq5bUbNkkacHSyXp78rRnQswhnnX5qdIlnOk5Cy3bFC3q0rSGaKzLHd
 JzMw==
X-Gm-Message-State: APjAAAXPC49e4XWG+7nNH67kjXPZoArkzv1lMW8Q6J0jBZqrWsfLdyD1
 XykLLTznXRUfK8NqDzUTmI/9shuI0Yv8geGbPFtuyW7xYQLXUsJhItstGZyIp4XlzM+ihkcbMQa
 5juO1PT26RTtD
X-Received: by 2002:a05:620a:14bc:: with SMTP id
 x28mr24785036qkj.494.1580753982618; 
 Mon, 03 Feb 2020 10:19:42 -0800 (PST)
X-Received: by 2002:a05:620a:14bc:: with SMTP id
 x28mr24785011qkj.494.1580753982340; 
 Mon, 03 Feb 2020 10:19:42 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id f11sm9625207qkh.96.2020.02.03.10.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 10:19:41 -0800 (PST)
Date: Mon, 3 Feb 2020 13:19:38 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v13 03/10] virtio-iommu: Implement attach/detach command
Message-ID: <20200203181938.GE155875@xz-x1>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-4-eric.auger@redhat.com>
 <20200203134915.GA155875@xz-x1>
 <ce49f691-d944-2e5e-87a3-7e7c9651c2af@redhat.com>
 <20200203151917.GD155875@xz-x1>
 <5289913a-43fc-aaae-5b82-151922de93bf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5289913a-43fc-aaae-5b82-151922de93bf@redhat.com>
X-MC-Unique: kRZPmTHENDCO7nf4jFNhyg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nL2UXGpwqIMa

On Mon, Feb 03, 2020 at 06:46:36PM +0100, Auger Eric wrote:
> Hi Peter,
>=20
> On 2/3/20 4:19 PM, Peter Xu wrote:
> > On Mon, Feb 03, 2020 at 03:59:00PM +0100, Auger Eric wrote:
> >=20
> > [...]
> >=20
> >>>> +static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEnd=
point *ep)
> >>>> +{
> >>>> +    QLIST_REMOVE(ep, next);
> >>>> +    g_tree_unref(ep->domain->mappings);
> >>>
> >>> Here domain->mapping is unreferenced for each endpoint, while at [1]
> >>> below you only reference the domain->mappings if it's the first
> >>> endpoint.  Is that problematic?
> >> in [1] I take a ref to the domain->mappings if it is *not* the 1st
> >> endpoint. This aims at deleting the mappings gtree when the last EP is
> >> detached from the domain.
> >>
> >> This fixes the issue reported by Jean in:
> >> https://patchwork.kernel.org/patch/11258267/#23046313
> >=20
> > Ah OK. :)
> >=20
> > However this is tricky.  How about do explicit g_tree_destroy() in
> > virtio_iommu_detach() when it's the last endpoint?  I see that you
> > have:
> >=20
> >     /*
> >      * when the last EP is detached, simply remove the domain for
> >      * the domain list and destroy it. Note its mappings were already
> >      * freed by the ref count mechanism. Next operation involving
> >      * the same domain id will re-create one domain object.
> >      */
> >     if (QLIST_EMPTY(&domain->endpoint_list)) {
> >         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
> >     }
> >=20
> > Then it becomes:
> >=20
> >     if (QLIST_EMPTY(&domain->endpoint_list)) {
> >         g_tree_destroy(domain->mappings);
> >         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
> >     }
> >=20
> > And also remove the trick in attach() so you take the domain ref
> > unconditionally.  Would that work?
> Yes I think so. On the other hand this ref counting mechanism is also
> made for that purpose of destroying objects without being forced to
> explicitly call the destroy function.

IMHO that's two different things.  g_tree_destroy() should be the same
as g_tree_unref() here when the tree is empty.  It's really a matter
of easy reading of code:

void
g_tree_destroy (GTree *tree)
{
  g_return_if_fail (tree !=3D NULL);

  g_tree_remove_all (tree);
  g_tree_unref (tree);
}

What we really changed here is to allow the ref/unref to be clearly
paired, i.e., for each EP it'll ref once and unref once.  The prvious
solution has the trick in that the 1st EP don't ref, the latter EPs
ref, and when the domain quits it doesn't unref to match the first
ref.  It's error prone to me.  Then, if we can do it in the paired way
easily, I don't see why not...

Thanks,

--=20
Peter Xu

