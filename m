Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5190746lfp;
        Tue, 11 Feb 2020 07:03:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxP/GAuxBwjnB1FOvKArN6248vFmWT5Evl8Dj1eLzkmJ3NlP++c2BpJ0NyGUmgZm9BRrl6k
X-Received: by 2002:ac8:53c7:: with SMTP id c7mr2746913qtq.311.1581433417179;
        Tue, 11 Feb 2020 07:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581433417; cv=none;
        d=google.com; s=arc-20160816;
        b=vQ/0hfYWGFEfXCZhuIKZy21hk0ORFFiwFksouUZzj88yYYpe1davkajfwmZv8HgBAR
         CWXY+ulG/+dOHGnombZoLgI9IRZzT8PT4l7+ug0Xy393nVpV0Zznl+vlabsolJtrVzhV
         a7V16iclCYt0em12FGYml78Sio1UFWck3pa6G3tWv2szUW43AbCexBgqiKRHSoQlJkPR
         +iAFhwelwhY68Uu1qYaGD6TsS1Xh5XdSn8eVIkP0ouC3X327wOFqL07c++APGT/R7fB3
         YuF0ji9WOCYF1A3MDcdsenUPQ8pJtUGgfDxQGlvCvw9CeCzF9SZbVOmXLJUbwDdln2Yl
         veBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJzapH/OwUP25ait7xEggB84gbQoRFwSXIZjrFEANkY=;
        b=GZX5RnbWyVRpyYfL8gCDBD4+ye8LGc68oPBXdeLk5dDlkDDpMZoN9y3csHkJBi3scz
         eM3kg/1mfZo1Vem9s+i1haB9UhvveMf+vk3JEgEvKD53qZ1/7eBTYL4z25jaywF7Aqft
         f3isESbqYSsyA8qKwmB42I2ViNMcy0/EX+xiQQ6g3N4ot/t4phwd9Wzlizdp77BlJgpN
         xf4KkrluYxueIM1wTpYRyChwXYIyNThwTM+1Bxo8bB/AdSoYvPHBVLMc5xYGXYxSuPAG
         kqUSzGw0bg1L1hJHEIrOx5roHvMvbcSjM6zDhNVbE+KARjTfzUxR4Omyj//he+2YRLSB
         ebpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oZSMlWE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p186si1966503qkc.318.2020.02.11.07.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 07:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oZSMlWE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1X4a-0004mS-D6
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 10:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X3l-0003wW-Ac
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X3g-0002qu-Ej
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:02:45 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37771)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1X3g-0002qi-9s
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:02:40 -0500
Received: by mail-oi1-x243.google.com with SMTP id q84so13083508oic.4
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 07:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJzapH/OwUP25ait7xEggB84gbQoRFwSXIZjrFEANkY=;
 b=oZSMlWE6dBhBHhQwQ1+i7gRKxYHEABBikoGlmiHFHuDYpp7J2WXWFok71rvM1YbB+S
 qgV2t9acezLhTuxqoV2sDZIwX2WW6MwhSCZGP2Msbypdxnjm5b7Iry4vJTIcQNTqTn+g
 Ake2GyQJdzhXAWVkhxf1fLIr+KoTMLMGxjasaB7O4op7iQ9nMkgvWnIHeiU9AM9OlaL1
 Pa3+QrXiqnSC++/I25uF/cwM+Qq8XwVSj2byk4vBd/KT9obZUZDYbNd97kMzAWN0xJ9D
 qYZ/AWfXX4wDF3l7SXJ5xqjBGJCZ/dIkGj9M9qUS5YgoHPWhNMrPvdsilovqfiMnRz62
 g2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJzapH/OwUP25ait7xEggB84gbQoRFwSXIZjrFEANkY=;
 b=ePjKx5KQXiZoph6HSRYvbYPfpvj++si2mL2zSChRCUqR9C+97ub4Cu148MNNWur3yz
 Z98XVLoY8p13GRB0fEvkiR/cHAjLZap74Dvn9m+FZA17ZBb783MY7V1rxFt5AR8bMPFy
 m2S1NExwtsFmn2b1XErkwf/Ql2klrarEzlCVZ82fC0VzlxV8HVUcSdR/3q8MxT//IXeH
 36QePI3s6kVz3EGRtmP9TK+lxcrLrQOOKd4fDOGqy1TnlHQdY320536/glxm2d3wJz0F
 OByiJaGa5VTXum/AOBFZP2kD3MtuRLtwOTiM0GSDCx8qEiwveAncdrgkKyJzE+RY9w/N
 mvRw==
X-Gm-Message-State: APjAAAWZM5lEE6FF7sg0ZksLKD7nTVQBNQocCSN4L2jcKTN4FDUX+wNu
 9ladxzYYwu6sC11qjlJz5gCRuPj5JrvJZHEsy7hP9g==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3029835oie.146.1581433359096; 
 Tue, 11 Feb 2020 07:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200211085526-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200211085526-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 15:02:28 +0000
Message-ID: <CAFEAcA8hWyHYk+PPLsyjyqiRqaWfosJwrpFpsRXnO+toSzaZfw@mail.gmail.com>
Subject: Re: [PATCH v15 0/9] VIRTIO-IOMMU device
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: ujHs263OCQUe

On Tue, 11 Feb 2020 at 13:56, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Feb 08, 2020 at 01:00:13PM +0100, Eric Auger wrote:
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
> >
> > Best Regards
> >
> > Eric
>
>
> Looks good.
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> I can see this merged through ARM tree, or through my tree with
> Peters's ack for the ARM bits.

Either way would work for me. I left some review comments
on patch 8 which I think is the only arm-specific one.

Can you use the virtio-iommu on x86 ? Would you want to?

If I'm not misreading the MAINTAINERS file the new
files in hw/virtio aren't covered by any existing
entry there, so we should probably have a new one.

thanks
-- PMM
