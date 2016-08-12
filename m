Received: by 10.25.21.156 with SMTP id 28csp210564lfv;
        Fri, 12 Aug 2016 08:20:48 -0700 (PDT)
X-Received: by 10.237.55.65 with SMTP id i59mr18375309qtb.62.1471015248809;
        Fri, 12 Aug 2016 08:20:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7si3574574qkc.125.2016.08.12.08.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYEGO-0006My-16
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDhf-0007Vy-8h
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDhd-0003Oa-Aw
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:44:54 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:32842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDhd-0003OT-6i
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:44:53 -0400
Received: by mail-ua0-x235.google.com with SMTP id 74so45267204uau.0
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0HvxAUMy8ZQug9R9upaoJPu8KQ+hnzCN5DeYgmajFJY=;
	b=GlDjmcu3muAty/VIj96wmKP5l4i0pFZYbm0db44ezyYm6blA7mfVih7OpSGsVTT32g
	zrxfECkXVmGJ366Qroe7yxQtZyCXx3O4PyppcMX+qfdWf3Bs2HmVgFaN8ouPRCE7Rj/E
	Psa4GW7Hfutj3HxAxm5P16A7k5bT1yUC8zDjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0HvxAUMy8ZQug9R9upaoJPu8KQ+hnzCN5DeYgmajFJY=;
	b=O5KDi1ViQZX1hqgAKmo1TUvVLGZMWpINZGD03VhUIDW/IstXtIwi3GpVdxUyl4dlSU
	Cxk1mMnwA54lN29PwvVg3BaYOnzmlu2uZKTxwY9w4Xyb9zVuZzgizQXCPKCv6XTi89fa
	1I/BtgEBWadU17X3KxxweYeiFNetattMTiwvEAJrAhtCPyH5krcbie9t7mGVI0d7gfsV
	S5cmqd+ZCl8z7C7jHyxvCGzsKGaNXPqPFJ/7D9b1FK5PYefnOlpnWbS93K2pu7aYTXqb
	3OLn50bcNPdtiZOK4SRYOgy+zFJjItwKZBw8PGcg06Tlgu9nACwH4bB1ZTVIdYqvmfAf
	GdgQ==
X-Gm-Message-State: AEkoouvwLR6GSZoYn6UAu5fEZqJeabCKK+m0QTJs3zHT6c9yZBUgZQfxX/hkYtgOGvn2Zt4nTUueXegbt4V0mkos
X-Received: by 10.176.82.139 with SMTP id v11mr7420070uav.4.1470993731853;
	Fri, 12 Aug 2016 02:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Fri, 12 Aug 2016 02:21:51 -0700 (PDT)
In-Reply-To: <d2c9a78f-ace2-0538-ea4e-91d10b7dbe7f@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-4-git-send-email-clg@kaod.org>
	<CAFEAcA9xrwghN6FMRsbHAMrTfSLv3K+iVAJEA-8p-NQ+s-bfxw@mail.gmail.com>
	<d2c9a78f-ace2-0538-ea4e-91d10b7dbe7f@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 10:21:51 +0100
Message-ID: <CAFEAcA_TvCzzbSW1sQwbEqvhwK+oAmTkxUjTomUgof5GAWXL8Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-devel] [PATCH v3 03/10] aspeed-soc: provide a framework
 to add new SoCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VvxEvOIzIZLI

On 12 August 2016 at 09:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 08/11/2016 12:14 PM, Peter Maydell wrote:
>> board_id 0 means "I am an EBSA110", which this isn't,
>> and your silicon rev values are completely out of range.
>
> OK. I was not aware of this. I will request new board ids for
> the ast2400 and ast2500

Why do you need them? Anything new should be device-tree-only,
and I would expect pushback from the kernel side if you
try to allocate new stuff.

thanks
-- PMM
