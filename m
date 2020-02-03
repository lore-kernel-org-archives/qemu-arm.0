Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4070980lfp;
        Mon, 3 Feb 2020 07:19:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEuocGhu8GW/6+W5m8gypgHqt1W8CQ6jKdJ1KpASux1tgnm9p2VweVW8DW9ACJ0/7WmYb4
X-Received: by 2002:a05:6214:14e3:: with SMTP id k3mr23089380qvw.215.1580743174880;
        Mon, 03 Feb 2020 07:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580743174; cv=none;
        d=google.com; s=arc-20160816;
        b=fYL1UGBNoDC31O02tOjejOMvIrF7zLT/nIotvMCyiLAVFZIPnPZPiW3iwU04zZfOYS
         ju/kn1mTSmA3PnjAe9IqPrUZRy/bvZAXjadY5Ms40eY30WRtjj9Nv1j9XJmWlBWlKLAk
         JKgmUAtGHTKVql3D0z6QCzgYQAn+xsGhrwNgGSg0SSfDhH4y77O2SqWKAOvYALjGBLU8
         q9iICVEIH3iZzk79YcP/VGJyYAEDPsB3PxqJsMO27VPxWeCr07GnXdyjDXCV2wDjfnn3
         ldgCduGwP/MtMk8z4n5tQdIi6maHk05V5yGMhL+t6K9TMhV4ByrdzD0MlagxIK6ebaaP
         aZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=RlFIj4DI9wFk+wxoebdBLLHLRZp8ZSyr2deFmmZbems=;
        b=bKO+qfjX2tzJAGzFrjFCqnfceKp2OwedW4dCF3OBi8X40JwDt5zj1uD95ojUDNmmc/
         dur3v2ePIcnUyaRiM9A0pA6I2HVO4zLO7DaLKXBTugtxw632ulnitoCyA5ymX4XlBOD7
         7krTO8h8K8UVsrA1V9vHAyOHSVCS5+2I46NB1b6CN1BcgV+5Prru+9yxrMxoTmHldupE
         C/jJSYmGpsv8KW82Udfc2YWzNUI8LBbwnkX3Ga/NHShOFYiFo11JF9kEIuuNg1jUvpYc
         dD1YUo+fwAXML9k61/AVBCmAY5MCadch+IFprPEHCVzTW6Xo3zav+YPuo/IFXUHNLSxJ
         2uTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IaEOFscW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si11446106qtg.124.2020.02.03.07.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 07:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IaEOFscW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iydVe-0002MU-Ar
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 10:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iydVV-0002Jg-54
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iydVU-0001Ft-1r
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:19:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iydVT-0001E0-RJ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580743163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RlFIj4DI9wFk+wxoebdBLLHLRZp8ZSyr2deFmmZbems=;
 b=IaEOFscWDKWI2A2G6H3PFapcZjnLj8aIEJiHAZ4Lh2b0klYTeqnrdrpdZIyMYJO9l2yPwW
 LWFvTHvbDZSGd+YthG/+XE5JTk0HgA3TQ2tfPD3yd/Y46n4kRCPwSNE+QZVVbo3v9bVQnc
 2cDhBc+bso5VG/aSdhhBl/1QZyq4EjQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ORLcUUdVMJm-exyfu4XWXQ-1; Mon, 03 Feb 2020 10:19:21 -0500
Received: by mail-qk1-f198.google.com with SMTP id m13so9643544qka.9
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 07:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJ3sKqXuDt9hRqfvlS1b0ePFFWqQ5OZ6wqtBD+VGOGY=;
 b=iIjUvifkdvcD6r912RTrtvFfkjv+XiVWL0SoLemr0h1wgECwMgP+35FkR2k60E/3I0
 aOQopFJl3nA7OCXJ3UKlU8YocaBXV7dwDLB6MharJeA7s3Kq9eoWatXwnur1gsisqi+m
 1z1Y/37Fm/08+fwwoTGaDN38m3hpqrzRD6vsK12Vk3s9T2+JRkV0vPWATv/0T9qs6UT7
 RVC0gO9Ns5kb9xUbLV1nBixwGDKWQQCmKyXz9K3osaXj7RGurp8kp8v8Gn4u7u53vO/M
 tJLoVg3BT2bWBQLmra0/ck2VlStTpwLMPJ3jbrpWeZ7+wQ2+/AOByom2NHcZbEe08h67
 GlRQ==
X-Gm-Message-State: APjAAAWqNAQNdBpZn6kNioTtPgCGQjg9i3fjqllcIyMR912E2Yrkyu0S
 fQFUmbdWvG0j0/knZlVuttGv13JpRgtSOWOqHf6jdWDbs0dJ6uTJyARU1nTLGPt5oUuKRPeLxty
 v4VU9ObtAsg0i
X-Received: by 2002:ae9:f408:: with SMTP id y8mr23059168qkl.97.1580743161063; 
 Mon, 03 Feb 2020 07:19:21 -0800 (PST)
X-Received: by 2002:ae9:f408:: with SMTP id y8mr23059134qkl.97.1580743160784; 
 Mon, 03 Feb 2020 07:19:20 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id r13sm9802840qtt.70.2020.02.03.07.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 07:19:20 -0800 (PST)
Date: Mon, 3 Feb 2020 10:19:17 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v13 03/10] virtio-iommu: Implement attach/detach command
Message-ID: <20200203151917.GD155875@xz-x1>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-4-eric.auger@redhat.com>
 <20200203134915.GA155875@xz-x1>
 <ce49f691-d944-2e5e-87a3-7e7c9651c2af@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce49f691-d944-2e5e-87a3-7e7c9651c2af@redhat.com>
X-MC-Unique: ORLcUUdVMJm-exyfu4XWXQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: TbAv/ryPvrgp

On Mon, Feb 03, 2020 at 03:59:00PM +0100, Auger Eric wrote:

[...]

> >> +static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpo=
int *ep)
> >> +{
> >> +    QLIST_REMOVE(ep, next);
> >> +    g_tree_unref(ep->domain->mappings);
> >=20
> > Here domain->mapping is unreferenced for each endpoint, while at [1]
> > below you only reference the domain->mappings if it's the first
> > endpoint.  Is that problematic?
> in [1] I take a ref to the domain->mappings if it is *not* the 1st
> endpoint. This aims at deleting the mappings gtree when the last EP is
> detached from the domain.
>=20
> This fixes the issue reported by Jean in:
> https://patchwork.kernel.org/patch/11258267/#23046313

Ah OK. :)

However this is tricky.  How about do explicit g_tree_destroy() in
virtio_iommu_detach() when it's the last endpoint?  I see that you
have:

    /*
     * when the last EP is detached, simply remove the domain for
     * the domain list and destroy it. Note its mappings were already
     * freed by the ref count mechanism. Next operation involving
     * the same domain id will re-create one domain object.
     */
    if (QLIST_EMPTY(&domain->endpoint_list)) {
        g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
    }

Then it becomes:

    if (QLIST_EMPTY(&domain->endpoint_list)) {
        g_tree_destroy(domain->mappings);
        g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
    }

And also remove the trick in attach() so you take the domain ref
unconditionally.  Would that work?

Thanks,

--=20
Peter Xu

