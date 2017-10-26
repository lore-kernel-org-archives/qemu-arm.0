Received: by 10.223.161.27 with SMTP id o27csp944281wro;
        Thu, 26 Oct 2017 10:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RfV0xBB3Y8yCb1XxvmI91FSrUJoz0Ipt1ZOnfzTa7IRk968izDQ+lxITIr3C2AIGeomzhM
X-Received: by 10.37.162.138 with SMTP id c10mr2296241ybi.263.1509039085457;
        Thu, 26 Oct 2017 10:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509039085; cv=none;
        d=google.com; s=arc-20160816;
        b=Op1VISpR0bEKrZIkOACHs/Uy67oGrDpv+jIn0Sh9Th/u9/BwWI4Fki6PWXffAZB1kj
         PI+zfxXgcuHFXpjkcNslH/ShHsBjkCh8zJH128ndDmp8wJO3OeFtt/MMBoMZxZFxaof9
         8/BB8pvOOpq5gYggx8hc8iCxpZ3vlyAjpq4vn4rInqTazkRdBMGBZfEX2Nop/bHUL/+b
         8V9YYv3FLErO5W+k4KV8KUyu+yot89fyEgl7FPrKWsrkBHiKmM9PYKDfch9EaFRPug2H
         QhhsGJ5TdPyNjcpu/pPNvWqNhljApjhUGvt3190aiwLP5N7d1ZxhmMqdG6Q3eDRw5YAr
         6g7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/e1S21OajJvygbSa/ASi1H+Svbmu9fMO7zHD6TUdc34=;
        b=tO+/8AqO20e6zS63jG0yjyMjqRl7CLEh8s7OIdkoDSdFKjCi0RcheNibi410fSel62
         n5fFM6kCb5H4+siWv7oj/TuuAw/qMBhSQ6JB181jAaFfKYoP4cHH2HBYsc9JGe0PQr4n
         AjA97VPWUHI99NWYHhI+1HkC16FELTGRbKtYGQ/wNMeo7VcBj57JEBnKniS2Eu+m99tz
         Z4AhxSB/58hYxmDTbAcyheFRTUAa4Psr34SEi/x4uLZz4geDujto8dN5NnO0HsPl1MTd
         MU+0YftYWvnvvGp6lPowoFQAYF4KFWAxXvdRaUalxOvyxiXt86SS1stqbsHARpSISNOd
         OWIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=cpo2i/sA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q123si920718ywe.122.2017.10.26.10.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 10:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=cpo2i/sA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:53991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7m04-0004fP-5w
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 13:31:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7lzu-0004fH-Bd
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 13:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7lzr-0004XD-65
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 13:31:14 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:44449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7lzr-0004WV-0B; Thu, 26 Oct 2017 13:31:11 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad3f57cb;
	Thu, 26 Oct 2017 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=m7zyTCKeYhXcKhrKSwygWUn07a8=; b=cpo2i/
	sAjAz4xfYH4u84h5N0l5R7F5fd9TA5B2P64OCNCGg2cogKZtrn0upAz+Gx2Tpw6n
	HvhRvnh/bVyhI+g2QDy75BKZ7tPcbzd7H81QFnFYCXqiDnK0abEqC5fbYXOI2qgn
	u4FCPbQCtyW6h98ZPuf9MGhAKCk4AWwRZ3PI+aNxJN8FIGXVFkkDMN1pbfJKs+PA
	V3beCvSYgR9FyLYjkB8A7EonSl+VQV1+is+EKGCEnDgGmSgAPWc3lXh6l1uOWwZI
	lnaL7q8AD2arbWO5W58IRANEdLc5iS68wId3rw67BMnwQoEfWFwP/h5AfhH+bHxs
	ojzlYkCFvY787Ovg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d65ef42
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 17:29:21 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m198so6945261oig.5;
	Thu, 26 Oct 2017 10:31:06 -0700 (PDT)
X-Gm-Message-State: AMCzsaXavJCibpn94MDQ2wFaqwCkE6mvPQtHO9QXLS3lDTuk+OFSRd8N
	GedJ4irF4ygbFk9Ns1c3i2YwxY6o6jHGa5F8hpw=
X-Received: by 10.202.93.69 with SMTP id r66mr3203507oib.26.1509039065876;
	Thu, 26 Oct 2017 10:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 10:31:05 -0700 (PDT)
In-Reply-To: <CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
	<CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 19:31:05 +0200
X-Gmail-Original-Message-ID: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
Message-ID: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/wZpvXtSsGR

On Thu, Oct 26, 2017 at 6:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Those are primarily about migration compatibility -- you should
> be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
> QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
> the compatibility we want to keep for non-versioned machines,
> where generally we don't want to break command lines but are OK
> to make changes if they don't break those existing uses.
>
> Command lines get baked into all sorts of scripts and so they're
> effectively part of QEMU's "ABI". People don't like it when we
> break their previously working flows :-)

Fair enough. So in that case, secure=no means serials 1-4 are for
kernel. With secure=yes, serials 1,3-5 are for kernel, with serial 2
being for trustzone. Seems like that's the best of all worlds.
