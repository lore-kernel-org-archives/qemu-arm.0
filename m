Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp116993wrr;
        Fri, 15 Nov 2019 17:48:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzB4QsNWBROInvWY4y2Vo1KHcPz7GAk/cxB417gPPY/FCsiH4szd+zGRGy/HGV0MX+XvXuT
X-Received: by 2002:ac8:3475:: with SMTP id v50mr17167028qtb.105.1573868912319;
        Fri, 15 Nov 2019 17:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573868912; cv=none;
        d=google.com; s=arc-20160816;
        b=qBi0+es2QyrS8wLlgIUU2qJq74at3vYs/qvfuKUeq63J/5f/pmbIwBx7w4K8OmiJoG
         8Tl//vzWoJHuML7YfjWHByDmM1JDkVYtji8ANQQIpPAXZVI6DtDo99oaANh71V5Dw0XH
         bgwBZzo1rrtDl5X6GCm1JwJTFs3ACrhfsyeJ2vb3thrIwyA+GSi3FWP3nI9GykrJjMJS
         L8HMyrakomY1+jFMdU8lSPSYxsv5CZD+9aIsBE6lGMgfcqZnqzh+Ogo0BlwqDObiLwRu
         i+w+hMiWhRjq1eQOG+gAcDsNieuqNhuaqnvqK0OG14KZ2YAy9l6zsw363LSZ1D2wjVVr
         HgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=36Q409Fwy0ueCJOw8wC0Yf0RBYykAraB2iQndIHmOf4=;
        b=QflPoRdxXFosJONt/mAujtUxIzAJ6rq4EZQeWfDQYb433R+9Umae05hXSI7WzUJkJB
         pYmJ+GuUG8OFq32ye8atwnl2MaZ+5/63KkPj3SwkTwhYHyfjL839LvM4kFdAuxsnZ2be
         EmGKFB8jGYR216FM9D4XQzBTQ1mqlEkEYVSAfE867WFcjkD4pu8MuK2kA0mvRb9zxtkb
         f/Ymk4HcgzqSgZ+Y4ED/TKs5om723IzlEkZMv4jl9ll44bLagXdByfB/Ovp8Ox9CYa2l
         1Y6GYseph2c4Sre2slbl8HerfNHDZ33a9jOc9XRMDTKpToQnrf+OJWHUjavqF8vmLLDl
         SAPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gr+WYgb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si7153920qte.62.2019.11.15.17.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 17:48:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gr+WYgb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVnCR-0001zZ-GT
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 20:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iVnCG-0001yq-Nt
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 20:48:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iVnCE-0007lc-AZ
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 20:48:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55536
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iVnCD-0007l7-97
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 20:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573868896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36Q409Fwy0ueCJOw8wC0Yf0RBYykAraB2iQndIHmOf4=;
 b=gr+WYgb4jRyICE8+EP0K/wJ/2l8UbsMZHw8jCfXPYLIEOYIOFRj2HLQjAJRc43OLEdyHB9
 EGS6E6G1OGj695ZUep6TNnvrUB5JW3t0SXtjvbTnZSuc8lXxMS7layOzOgWIK9JiXW84n3
 LrxM2NaE6d1buEJdQ6SrSphCj1iK/j0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-tnVss1U3Oxmyi4Ep8rdeNA-1; Fri, 15 Nov 2019 20:48:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19521802CE3;
 Sat, 16 Nov 2019 01:48:10 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 252E26609C;
 Sat, 16 Nov 2019 01:48:07 +0000 (UTC)
Date: Fri, 15 Nov 2019 22:48:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.0
Message-ID: <20191116014805.GZ3812@habkost.net>
References: <20191112104811.30323-1-cohuck@redhat.com>
 <20191115090757-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191115090757-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tnVss1U3Oxmyi4Ep8rdeNA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiri Denemark <jdenemar@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dlcXzGWuVg/J

CCing Jiri.

On Fri, Nov 15, 2019 at 09:08:37AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 12, 2019 at 11:48:11AM +0100, Cornelia Huck wrote:
> > Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > For i440fx and q35, unversioned cpu models are still translated
> > to -v1; I'll leave changing this (if desired) to the respective
> > maintainers.
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >=20
> > also pushed out to https://github.com/cohuck/qemu machine-5.0
> >=20
> > x86 folks: if you want to change the cpu model versioning, I
> > can do it in this patch, or just do it on top yourselves

Thanks for taking care of this, Cornelia!

>=20
>=20
> Seems a bit cleaner in the same patch. Eduardo what's your take?

The plan is to eventually set
default_cpu_version=3DCPU_VERSION_LATEST, but we won't change
default_cpu_version in QEMU 5.0 yet.

We need to keep default_cpu_version=3D1 for a few releases, until
management software adapts.  See the "Runnability guarantee of
CPU models" section at qemu-deprecated.texi.

--=20
Eduardo

