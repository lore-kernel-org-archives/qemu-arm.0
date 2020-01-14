Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5884789lff;
        Tue, 14 Jan 2020 10:49:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvpnNtNqNJl0x3h9IGbRPS1Ez5OcuEL9GM2+ljakU5SmL5pGZ9GciMI5jpqqzBnjENkw4F
X-Received: by 2002:a50:ef17:: with SMTP id m23mr25688579eds.106.1579027797939;
        Tue, 14 Jan 2020 10:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579027797; cv=none;
        d=google.com; s=arc-20160816;
        b=OT8SX/kc4EDQyIrsrJsZMudWWwZ8S5UfmYi3VEgP/EnyvFuRkU8EQg3teeuswIQYBo
         422fGffBwocQyLFHY6KKRbt6MCxjk8mWnBjKPyXr0wvXet13UB7T/mL/TzzmPLRibu9n
         MenJ0J2QGAdYrEwwlKvP9Zx3Yr9swgKXIyS5Tr8artQ9aKCinjT83r4TCeO5p3CJAWP5
         aP0e0on/Bq4zAq8YVKx98EUoUXKHqmues0YWERk4m/hqHnqUySOLAo2SSMrL0HsZs3ZT
         xibecm2sJ2VOUE1KC1ZgIydFrO9UQZAkaxdqoS+dFMCMeRe20s0iQIs/CTliwO5ROp9V
         aTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=pMOB7Bh5GnFFF9E/G7IoCkeTAyGiZNr08xAqv+Zx4r8=;
        b=tCEo1psHab/2ZrUtmvPFCX4Oapr5eN+8egtqO4f2KR0CEvfpeni0Tut4MIqtFodO6z
         ls/wqzeFVkMzEu8h4CX9B984bE3MJCIbrAGBLcskZvB2nxD1+TpGmw35ePhUDkz5vCPH
         8pQ3FiZXpYb4fzzxn1ZKB8qjGAUnNSAAJVi2kkVfww1pT9vUzu1DgCYCQaqvrpo6R9XV
         d6HoMn8/rZSjEJ1anqknJa2Pv3N4ZGvCcZFbH9I28vpqHLqRaLj0qzmeQ6JY6KS70c9+
         w6o4diCzUa425GNotNx8xpdQVZuTvGtKyhmQ+b5GX0FoaZ3z7K2ouzdzOwgUJ7Cce1bN
         EhvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MQG4tLNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si10234523edy.166.2020.01.14.10.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 10:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MQG4tLNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irRGG-0001Oy-PZ
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 13:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1irRG7-0001MW-TM
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1irRG6-0004Iu-80
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:49:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1irRG6-0004IV-4v
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579027785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMOB7Bh5GnFFF9E/G7IoCkeTAyGiZNr08xAqv+Zx4r8=;
 b=MQG4tLNUJ08u3u61HWD3ql8A9WuXIxvi3z0e8X/nBIq+rp2NsB16U6tLYE4q7j5UHo1J2i
 CttpYnOK7RjHbMU6Lek68DTymOCF8jrhIdw6bMs0yhx5Gc9XMbS37Yru/k0+NJVB1E7WQd
 3IHRD5ctucdsK8b2nEMFA0pHEZVFhJU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-fLtgQBV9P6OF2TLFGF8KGQ-1; Tue, 14 Jan 2020 13:49:42 -0500
Received: by mail-qk1-f197.google.com with SMTP id w64so9027423qka.3
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 10:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cg9CYW91jza8bY+9bfesuhgfknXcUEKut9hzdJKzl10=;
 b=fxgf7pgg7hHbD/GtpUJ13h7nr8Pc0n7ZRJ6eb2bNIsSTEsr/uT5rcv1Fow/GJ9h0zD
 kKFkbRFy8hdrLYRiSrzuZPecFo7/G6Fb7VWj6yrNnafSax/IjnjqVhbTHoyMcekmfM1R
 gYBRwr/R39EfoRXHYI/yWg82371ED2cW23ojHTOwOmbLd51NilQdxdR9GwbT/FiA2Uzq
 Kd00f5MdbJeFrRIqbgVxU5uanJL7Cd3ujsq8mCUslxzzTlC8vsLcXAxJ7md7kw//xVdb
 A0GRVzDhhZQnIXuUjAAk31dPpOKgYSE7AK26mxUFPSZbNmeyLi6Yifz2gbp0+SGTbVQ+
 pD1A==
X-Gm-Message-State: APjAAAUxs5t66R9ZtgYBts9ltWThH8g5ZpjmSKjaeuHEB/HJlJ5RPS0T
 I7xPKBMcy+iAQSyPfsK63FGevq3ceGmkCflaEfLhKwRH419Bgh4nhs0y+aP7nfPqjScQXknLBap
 gr3LA+FshjidK
X-Received: by 2002:a05:620a:1467:: with SMTP id
 j7mr21807652qkl.76.1579027781848; 
 Tue, 14 Jan 2020 10:49:41 -0800 (PST)
X-Received: by 2002:a05:620a:1467:: with SMTP id
 j7mr21807625qkl.76.1579027781667; 
 Tue, 14 Jan 2020 10:49:41 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id u15sm7044799qku.67.2020.01.14.10.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 10:49:40 -0800 (PST)
Date: Tue, 14 Jan 2020 13:49:39 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
Message-ID: <20200114184939.GC225163@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
 <20200113195344.GA201624@xz-x1>
 <779fc8b2-93c1-e3c2-9feb-b2552de2c5d3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <779fc8b2-93c1-e3c2-9feb-b2552de2c5d3@redhat.com>
X-MC-Unique: fLtgQBV9P6OF2TLFGF8KGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r5X6NWfCqRuk

On Tue, Jan 14, 2020 at 09:37:51AM +0100, Auger Eric wrote:
> > In all cases, I see that virtio_iommu_mr() is introduced but not used.
> > Would be good to put it into the patch where it's firstly used.
> OK fair enough, I will put the helper in the same patch as the user as
> you have requested that since the beginning ;-) The resulting patch may
> be huge. Just hope nobody will request me to split it back ;-)

We can wait for a few more days and see whether someone will have a
different answer before you start to squash things. :)

In all cases, I think we should get rid of the compiler trick at
least.

Thanks,

--=20
Peter Xu

