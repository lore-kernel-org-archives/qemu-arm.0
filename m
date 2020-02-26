Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2810558lfg;
        Wed, 26 Feb 2020 01:19:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwf0IpXQd+s0/8dWj2PeSt0AWemOOiYansFp4fsRCudnSbTrOF/1D4KTrYMNDCUBnOjcjcA
X-Received: by 2002:a37:a38b:: with SMTP id m133mr4437429qke.418.1582708771880;
        Wed, 26 Feb 2020 01:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582708771; cv=none;
        d=google.com; s=arc-20160816;
        b=QLBJJpFnAJpyPbsMjEJEORLAPM2WsiKGL6aC5m74GTdZo7w+QxyOUj0Svsx/fdWfMH
         /HHg3Y6TUALJx9ErnT2Dr5TBnPPyKE4jS/aa2baj3QulATK9lQKD5sAcXaTBlPidfmsA
         /ZmYtOrqaRueBb9D8U0mLZjVM/LHyZrP8m+VDS4kIGtIUDpoTyETIi3PhAN9xNdWx98r
         lX4K8ctnyI0h0CNcL8p9Hmtz2QFCJvq4Jo6HTp+L/7LxRf1m9XSMjMaiSU/HqdMsTZCO
         gLpXoUP8GFeccOnYD3EY5+mppp3z1faf+E2T5TU4A943FWXRd0iC8rnEJFDgStx9y2jN
         6FFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=v1x0zFotiGHLbWCwRHfYUDlZaAOKUXGwZLb+0Q8vy84=;
        b=uwm/sNJOlhR1lckoijq+X6kCFjF9ALFEUX1vZVk/Yy7kNyRcZ0EvUz3EvxgZHQufth
         js8whI9SM8szx/L6u/UlzdyyyW2Eg3HpeLv/5ivfPkwoNfX36ns36RkZRyeVTGZJ4qaV
         si8OZ+em4dfZa/gEF+Vpfvj05Rm5NV3OgXtS3lEPYWWe2Rb837fIqOQZDyyj5ySFQqIo
         X7yRRXk/RvSg0iw2zSuU6H+Yi3Iuh5WKQRHMygB39VoET0U3tHtKWx444MJkD0KGHRc1
         1/GRwv1AjofcALa3E6Snt0GwpH3OwQfS7NC1BM3a98Gm6GEmdlRZRZx8AXWeE14KcA+G
         e9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JF6CCqdB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si812159qta.62.2020.02.26.01.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 01:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JF6CCqdB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sqp-0002vK-95
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1j6spM-0000qx-8v
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:18:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1j6spL-0006UI-8o
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:18:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43982
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1j6spL-0006TV-5I
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582708678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1x0zFotiGHLbWCwRHfYUDlZaAOKUXGwZLb+0Q8vy84=;
 b=JF6CCqdBa2sK4taCAL4+2JzAz2IbpCJ/KMTcrcfByvgZtEWEZrdqqxzPHzyQK66SsvfIX0
 U0acS5/TIaXAbdh/6EzuNEtScuHXHRxyvVyUd6VXjOd9mPnlPuQnFGAkJrt4NjOKMu5AL5
 mJ/LNIvFHgkHNyVZyz4KboZdt9ydEXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-7X6ruzUtOTu3M7vwbEU89w-1; Wed, 26 Feb 2020 04:17:54 -0500
X-MC-Unique: 7X6ruzUtOTu3M7vwbEU89w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864B8800D5A;
 Wed, 26 Feb 2020 09:17:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CE292971;
 Wed, 26 Feb 2020 09:17:52 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:17:50 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/intc/arm_gic_kvm: Don't assume kernel can provide a
 GICv2
Message-ID: <20200226091750.mqkbqffod247bori@kamzik.brq.redhat.com>
References: <20200225182435.1131-1-peter.maydell@linaro.org>
 <20200226085209.ni7oph6odt24warq@kamzik.brq.redhat.com>
 <CAFEAcA-Bhuy+2dU3joZoip5=tOkiTSoC+LzdNzyd+urUnoRNXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Bhuy+2dU3joZoip5=tOkiTSoC+LzdNzyd+urUnoRNXw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYdIWe7x9YcB

On Wed, Feb 26, 2020 at 08:56:03AM +0000, Peter Maydell wrote:
> On Wed, 26 Feb 2020 at 08:52, Andrew Jones <drjones@redhat.com> wrote:
> > Although, many QEMU command line users still won't know what to do
> > without an explicit "Try -machine gic-version=3Dhost" hint, so that
> > might be nice to add too.
>=20
> In the GIC code we don't know if the machine even has a
> gic-version property, so we're not in the right place to try to
> produce that message.
>

Ah yes, we use qdev_init_nofail() in virt::create_gic(), so there's
no chance to append another hint at the machine level.

And what about when machine.gic-version is not provided and KVM is
in use? Shouldn't we try version '2', as we do now, but then also
'3', if '2' fails, before erroring out?

Thanks,
drew

