Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2434565wrs;
        Mon, 19 Aug 2019 02:48:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSRI3JCjtB4pUTzFrd9TVONJ0QtXFxyUnI35WXcwFKJbd73CCw16AwpuYaulsNmnGz2J6Y
X-Received: by 2002:a0c:c24d:: with SMTP id w13mr9842783qvh.26.1566208108543;
        Mon, 19 Aug 2019 02:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566208108; cv=none;
        d=google.com; s=arc-20160816;
        b=f6j+vQxhYDKp22eECnRGQK5IkajKZqCaqs1sBhjQzMJge2RQ0bY0C8IClBJjMF/D8j
         lk2RYTaPSan5vciAw+Ach3rAy3qA60dfsJFQ4STL9Giig0ZnhElOmLX3T+raaqEZl+wH
         i4k2gFl/ezgb4BMoGiTJ8ngJ7hcob6+ciL4Z8PlE52jjpGLv6tg/aWCssTDDn3xSxoEL
         X0OmeTOzrx4vWtOZJPHyCS7JD5JFOETCQOol07toZoNI4Al4ysC+TKsRa0WAVy7PXcAM
         Ye5MMIhWi/BWhETBlOl1rS3kEQK3+JA/qFjn4DoHGN7aKOR1B/6qMooLZxRrLPBAgzuh
         294g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=AtFRpG34icXrf951d19yWDRelAKOVYPbBx3xCeh0Sbs=;
        b=tOOGFrvPYiv9GICCLPixLV07xygDTX7HYnEFvA4Y3UFP+j14BHhcRiKkS90cn8Obf9
         tkIwJ0JJEXfWXfzhA9uziIuNCXd3zBlPVzIMNxrcKAK+QgFAk/eA7/Opo9AmuwM9frv7
         sIHmDArDRH/0Hmmu/x2Xf+L5qXpCBEE2Bc4fIzT5+MoK4xUBkxUu5oKKhPq5d1Cinw0z
         qHfu8Oul2pAbNWkERqCFeJjKR/s4BHtUAu7a1abBOrFCEj0Trl2bDfdAuKDrxr4Ngu+S
         5sE9iXyu3rIi/39NMjWtcQreS+WYUg7vwOtXhmTjSyvtXgrsLs/IxCWBxwsLAwmGP4Z9
         qRkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si1626970qkg.202.2019.08.19.02.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 02:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzeH5-00086b-HR
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hzeGj-00085m-Lx
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 05:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hzeGe-0001sV-Ay
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 05:48:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2255 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hzeGd-0001oJ-No; Mon, 19 Aug 2019 05:48:00 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 87C8F8D8563844FDA1F3;
 Mon, 19 Aug 2019 17:47:52 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 17:47:46 +0800
Date: Mon, 19 Aug 2019 10:47:30 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190819104730.0000234a@huawei.com>
In-Reply-To: <CAFEAcA8cLy+QfswCD6iGHcQywDA6hHYaBdxT9Zfa2zAzSotm_w@mail.gmail.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA8cLy+QfswCD6iGHcQywDA6hHYaBdxT9Zfa2zAzSotm_w@mail.gmail.com>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [RFC PATCH 0/7] qemu: CCIX pcie config space
 emulation
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
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jon Masters <jcm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oZHQslagA7qT

On Fri, 16 Aug 2019 13:59:02 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 25 Jun 2019 at 12:28, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > CCIX topologies are 'layered' on top of PCIe tree topologies.
> > This is done primarily by allowing a single CCIX device to appear as
> > multiple disjoint nodes in the PCIe tree. =20
>=20
> > This patch is being distributed by the CCIX Consortium, Inc. (CCIX) to
> > you and other parties that are paticipating (the "participants") in
> > qemu with the understanding that the participants will use CCIX's
> > name and trademark only when this patch is used in association with
> > qemu.
> >
> > CCIX is also distributing this patch to these participants with the
> > understanding that if any portion of the CCIX specification will be
> > used or referenced in qemu, the participants will not modify the cited
> > portion of the CCIX specification and will give CCIX propery copyright
> > attribution by including the following copyright notice with
> > the cited part of the CCIX specification:
> > "=A9 2019 CCIX CONSORTIUM, INC. ALL RIGHTS RESERVED." =20
>=20
> (Apologies for replying to this now quite old email, but your
> more recent followup email drew it to my attention.)
>=20
> I think that as a project, QEMU can't take patches which come
> with this kind of additional constraint on top of the GPL. Could
> you drop these extra legal clauses, please?

Jon, if you could raise this with CCIX legal that would be great.

Thanks,

Jonathan
=20
>=20
> thanks
> -- PMM


