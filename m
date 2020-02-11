Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5282973lfp;
        Tue, 11 Feb 2020 08:30:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrH9xG81IFRv94IrUHagnqlFtCWh/XdwS1MXjad/Hu+hnH5h8GoEzIic3NuvRmGv7fnxZX
X-Received: by 2002:a37:554:: with SMTP id 81mr6372814qkf.297.1581438659711;
        Tue, 11 Feb 2020 08:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581438659; cv=none;
        d=google.com; s=arc-20160816;
        b=Mbh7y/8z9OjQuVb8e7XRevrUbDmAhRg+j5PzTATM6JX9Y53HQR6toZjABA7yT5xAU2
         Wyv25w2pEZ0SO3zNd70cWjA7PASYkPCD376lBjKXalou9q+ToVIKSm2X8hp8MgAQrk/D
         AbEEqDX4++qixP/ikHMvzudq9XYW8ixh3sQRk+RyoL6RFWtPBOUv/Ynv0vmvvc1mfy9t
         V8zH0+3VbYfeI2SMeLkz1Kp2aHjDDH9j97VdEX6dszyO3xMTnwQOLmhsXn7TrXqTW/k5
         ZdW+yrXAHFoKylt0NMt6UW/XQ8MVAke8AOH338mkwQ+8gT2Q6FpE8YcjrbAWL5ocwBej
         zOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ZKKLvaG4MruHYk5soyWRrVOuAKaqd3a59m6O1Qw24mU=;
        b=HJ4DLat57w+YgSx/ddy3mpSi04FLxzH/q8V73hQ9JXNQP+tiZ0vinvxAYLezPHQAm5
         Vp7+WlpV2oLrzOV86T8NrQklcap8GxgvyQCmQS8TI51ZlcZ6xtmeKkc+zSil3qlIf4Tw
         H/zxR8hQvlTMbdcaBNRHKFbyCLr27y1hUby77OyDlx+E+awiKkIX4RUMK0F9Ax9Kl7wA
         8q1gW5Sf2moeVFHgrRlZXj3C95RP7ysmm8pTmBwqfevMNAKu3mrf0sOU4inpE0demEPb
         uFi+xkZSguS4BTxxjBe55g7ILs9BYKIVfleZRzM/LAeSFO/LgnzfJnQy4PnuSJxQ92lO
         yx6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GEOIvyOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si2148091qth.16.2020.02.11.08.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 08:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GEOIvyOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1YR9-00031I-4j
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 11:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j1YQx-00030j-LL
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 11:30:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j1YQv-0003F6-EX
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 11:30:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26218
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j1YQv-0003Du-A8
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 11:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581438644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKKLvaG4MruHYk5soyWRrVOuAKaqd3a59m6O1Qw24mU=;
 b=GEOIvyOcQJxbX0uX57zl0OYxX43yFveixqgPjuog+X1aS8+UiXUyKdcGqxhu8Oos2hskd9
 DL/TwhQO286xjypNl+Mklx0NBuSiMeugh5k/qK8l1JNbT1q6048yyt5gMF0pcGEKeITQN0
 usJYKNhRxxoOZQHNG8Vm4SxNGQ8l3B8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-svvOPsL3Pwaw6OG1OhzC_A-1; Tue, 11 Feb 2020 11:30:42 -0500
Received: by mail-qv1-f70.google.com with SMTP id d7so7492142qvq.12
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 08:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WK5vkxsRRO7y1k6SkzO7lAousX7/QuD/JIYyavjDixI=;
 b=kH6tMbHGwwnFy5HUgDFs05+Ae1BHQvxoWNik7JIVXc/LbVerr/am094gTjKNzf/suU
 Le9eTCrSO4qKiEgMU9zlPmBl3iAX8ofhx6TtVigUboGwd8aG7Jelmch8uin3y2zFdVsm
 IC1CZFHPrqRiGmebjYFx+VcAvYrA3lWO/p2McN5jmxs2MBuQfimjpMrHTZexheiEX+qA
 Ktbzw5zWmc52o2zvhjXwjcRJkzTeKYFjyfPHS8KqQSMVmUPqexibVnUigTGqGeAhHCGG
 sanRf9BExakRxIsKtBP6IvN27T2nxwouNNwI31uKNxX+mvHrpL8ovt6MPNYk54PygcIp
 bAyg==
X-Gm-Message-State: APjAAAX3YTCXkS1BwEwLTVXoczK6mUuyKDhWMi3s+8Q/sTFklW8vSs3/
 bAKT5pph/lFC0HpkftQgc2F29wnEdga3fvmL6jgfu6T2oW8Vde/j7xkToZRdniLKsDBReTD+w1t
 8TSexHFIXLu2v
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr15277312qtv.56.1581438642020; 
 Tue, 11 Feb 2020 08:30:42 -0800 (PST)
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr15277288qtv.56.1581438641791; 
 Tue, 11 Feb 2020 08:30:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id f26sm2343160qtv.77.2020.02.11.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 08:30:40 -0800 (PST)
Date: Tue, 11 Feb 2020 11:30:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v15 0/9] VIRTIO-IOMMU device
Message-ID: <20200211113000-mutt-send-email-mst@kernel.org>
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200211085526-mutt-send-email-mst@kernel.org>
 <CAFEAcA8hWyHYk+PPLsyjyqiRqaWfosJwrpFpsRXnO+toSzaZfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hWyHYk+PPLsyjyqiRqaWfosJwrpFpsRXnO+toSzaZfw@mail.gmail.com>
X-MC-Unique: svvOPsL3Pwaw6OG1OhzC_A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: jean-philippe@linaro.org, "Tian, Kevin" <kevin.tian@intel.com>,
 tnowicki@marvell.com, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xoDbNC/Cyk2M

On Tue, Feb 11, 2020 at 03:02:28PM +0000, Peter Maydell wrote:
> On Tue, 11 Feb 2020 at 13:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sat, Feb 08, 2020 at 01:00:13PM +0100, Eric Auger wrote:
> > > This series implements the QEMU virtio-iommu device.
> > >
> > > This matches the v0.12 spec (voted) and the corresponding
> > > virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> > > are resolved for DT integration. The virtio-iommu can be
> > > instantiated in ARM virt using:
> > >
> > > "-device virtio-iommu-pci".
> > >
> > > Non DT mode is not yet supported as it has non resolved kernel
> > > dependencies [1].
> > >
> > > This feature targets 5.0.
> > >
> > > Integration with vhost devices and vfio devices is not part
> > > of this series. Please follow Bharat's respins [2].
> > >
> > > Best Regards
> > >
> > > Eric
> >
> >
> > Looks good.
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > I can see this merged through ARM tree, or through my tree with
> > Peters's ack for the ARM bits.
>=20
> Either way would work for me. I left some review comments
> on patch 8 which I think is the only arm-specific one.
>=20
> Can you use the virtio-iommu on x86 ? Would you want to?

Potentially yes.

> If I'm not misreading the MAINTAINERS file the new
> files in hw/virtio aren't covered by any existing
> entry there, so we should probably have a new one.
>=20
> thanks
> -- PMM

