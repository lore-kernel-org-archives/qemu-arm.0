Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3785970lfg;
        Sun, 23 Feb 2020 00:17:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxM93HqidS4xTKqvzuhaVXGDogCCTuKMGVeAdVoER9qKxb4c9N7Vr8pLrxLqOu/P6KPPmlQ
X-Received: by 2002:aed:2dc2:: with SMTP id i60mr39665553qtd.8.1582445870424;
        Sun, 23 Feb 2020 00:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582445870; cv=none;
        d=google.com; s=arc-20160816;
        b=AaMyYkTlWnyQZN1MZ4hBO3HZSqGAZpOxyHVKismKZCS6RwwX3qHjpN8rDoYHBvpWhT
         T8eeqGqFhjoXEYCNI1QvQIANETaFi6G6+tFcjbcdmmKBIEfYAu+irq2Y196eeaxJIyRW
         miAvriDUE/epqp+AlF7CEC4qkFAbp+FWY4fSmPqi7Hk55hqJvlitjtFk/L5tYpJOkB5P
         o2HVdwjpOJxYBVzVfmpxaGm3ud84qQt/nsWBjStQzbXnZvxRGRnjU5KHTFABXp6tGMu6
         s6aC91uqaA3P8rpWbDqf4KXdori1N+Qp/HY/+W5Y691y/igQn5Ds3UIn8eqDX4QDTmya
         GPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=K4TrWPUuEuLBHImQVGVwprlXYP7/K1lE0tMIMfQeaQs=;
        b=obw+gKoWfdHsQjfQq8etDttNFfuVLucjTbwNAHrurG1ZRjVyi7HnTR4Xtp4pUJTqCX
         PN7e34z6tvqxlbNxvsVnUirCi+xhaI4xTr7iafvWuNRI1ZmU6WRf7nrfJ4NfbH5pTf6d
         Jm+rYytIdtKcQDpyGDV1lYPCdr4t7g4q1sl0wJlW7zBzxlYlw46kD/TsL2mZmNbgLmfj
         aKuq/HO0IILwFriCQKapu6EmUuXSeO7h4Gc3vU9ecFDSYqUFz7bABVAK617NSd+/RnI+
         tVDT7OCQz0RnZ6Kc/8KSUisZpxNAOqatMBA1vocha+ortvZ+oVs94UzzSS/l0v7bWCsa
         C2qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YAgs1SIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si3711095qtt.290.2020.02.23.00.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 00:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YAgs1SIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5mST-0000Vs-Sa
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 03:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j5mSK-0000Vd-9n
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 03:17:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j5mSI-0002uO-GE
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 03:17:39 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40438
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j5mSI-0002rn-Ch
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 03:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582445855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4TrWPUuEuLBHImQVGVwprlXYP7/K1lE0tMIMfQeaQs=;
 b=YAgs1SIqTAP/x8HhH0Jfw3gi3lCUx5idwtzhcogIrmYEMuTk7OrUCZItlRPgBbwI/GFB4e
 IKBVhFiSL1XoUNIng8rNk6CHRsEEBUQVtDY3AunI7lQZuXqGXvFYvvo0rAbs4c2ok3pet2
 awIZ/C6ZnEmfSEHqf9ZT26xKZ1WKYzg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-Gy70n64oPXuDW7n5QzfXeA-1; Sun, 23 Feb 2020 03:17:31 -0500
X-MC-Unique: Gy70n64oPXuDW7n5QzfXeA-1
Received: by mail-wr1-f70.google.com with SMTP id o6so3649579wrp.8
 for <qemu-arm@nongnu.org>; Sun, 23 Feb 2020 00:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fBtgdXi/8M0JSMMM03KZUpZNHh1H7P6raMwXC0r5Y3w=;
 b=UVBsHZyZBjofjlGp1nbXTVEfsTVbIl6Gl/u3cFuh0T0+W+wN3a36nzhyGRwF1Q7Cr/
 IpGr/akcMC6x3yjLePJzezpp6TivXyIjnm71MYhW+lJqLimVZWTccro27HcvYttpsmIL
 NvD52BncBZ9ulDyL0em4XmudIE1dBnQQq9+ltAiz0O893lqz1L0KALyzd0UCH2FnmqiB
 deaQl9rt2d8+28z12qECP39yzK+DLh2L3EcQ58XDzYSF/IBv4qZ0afRZpAHIoTUDAPcV
 4irMmudk/NgVueD7qW8k7rINXh7yP9ggts4gpO0tCa9MCOYn2zLuKDc74KX82G88pp6M
 2+fQ==
X-Gm-Message-State: APjAAAUiN7Mqo3RVapPT9YGrJl75aXzdGfsKvHZJxWmIGLUSlVVN6f5Z
 DbjeBp1io9scxykcWt+HED8CMbevosbUtZsILt08s8fBGe85xcaylJ1r3IyABsN678R2Myg4JKg
 GqbwmHEmuR5lf
X-Received: by 2002:a1c:491:: with SMTP id 139mr15092180wme.117.1582445850262; 
 Sun, 23 Feb 2020 00:17:30 -0800 (PST)
X-Received: by 2002:a1c:491:: with SMTP id 139mr15092151wme.117.1582445850077; 
 Sun, 23 Feb 2020 00:17:30 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 z10sm11803414wmk.31.2020.02.23.00.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 00:17:29 -0800 (PST)
Date: Sun, 23 Feb 2020 03:17:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
Message-ID: <20200223031659-mutt-send-email-mst@kernel.org>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <CAFEAcA-U9b7GVXOd0QDw526JChoD3gRhVBzLcSy++PQzHbVzFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-U9b7GVXOd0QDw526JChoD3gRhVBzLcSy++PQzHbVzFg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, tnowicki@marvell.com,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C61j7/QQ0hUY

On Fri, Feb 21, 2020 at 02:27:30PM +0000, Peter Maydell wrote:
> On Fri, 14 Feb 2020 at 13:28, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > This series implements the QEMU virtio-iommu device.
> >
> > This matches the v0.12 spec (voted) and the corresponding
> > virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> > are resolved for DT integration. The virtio-iommu can be
> > instantiated in ARM virt using:
> >
> > "-device virtio-iommu-pci".
> >
> > Non DT mode is not yet supported as it has non resolved kernel
> > dependencies [1].
> >
> > This feature targets 5.0.
> >
> > Integration with vhost devices and vfio devices is not part
> > of this series. Please follow Bharat's respins [2].
>=20
> I think everything here has reviewed-by tags now -- does
> anybody still want more time to review it, and what
> is the preference for how it goes into master?
>=20
> thanks
> -- PMM

I guess I'll pick it up, most code seems to be virtio related.

Thanks everyone!

--=20
MST

