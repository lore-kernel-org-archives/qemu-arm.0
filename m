Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2987618wrt;
        Mon, 14 Jan 2019 04:35:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7v0YvAZUtw/VjgjRZ0Ml3rXPzp4nk5tLyD10Wm2DmbJNG1ldRoHjkOsAzCRRKSaqeZCoEO
X-Received: by 2002:a1c:c707:: with SMTP id x7mr11362327wmf.120.1547469348518;
        Mon, 14 Jan 2019 04:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547469348; cv=none;
        d=google.com; s=arc-20160816;
        b=KDmkPaxo7+Tl1PvJ9XhtRAdvYzXu5Rc5Zhg+ZEFNeAYq4W1y7PJPkisKzAvNDO4pls
         jUL7Vj7cLOGYeeddmP31/ri3+He1acnFOiTgXxYeNYHo1nH4vVKhhVUXkygOCL8FzF0x
         E/18sG4oOqZDYPV5MmJ/mQTCqZJp4Q9E48CeZRqhseWTsTNYcp1iu5wzdl4W5moZ9Rhn
         W07mV85dpGPSHqRdkAZ4KC9wu6hvRS2iBwAEHdQEBLPLfpKzwOv3GHKralffgdgTyELD
         Bhcexgu1G1x8jUKLDm7+ZbVPICsIRyFwebjb4g9Q0TDFYKAHP3lIkfgirZX2LZOJflht
         uulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=bLBHdsKpOB759lS2NzrwU5YQemsBWYLXPEGxBTVq+m4=;
        b=m2iaSvmKpttgk7FXYnoejTHZPm4LP83RvAbliOIaFVnX2+QyBu/6voBHbFfewTSaVz
         T8lna3ldu6680Zux+dqQDTe5U+2phmJ+CTyBfuwfEH0wZNAiRwGzZcaPGXp1z2ZEdsMj
         tdcqPB/gEqVEWIbbXeX7besjTaQcROKCk3XDZk3dk2OORBISKtNkpEDPYsSkjAbq/7Zk
         BbWxSpt3GXDL47B/htkyVopAAyC/H/WX9JW2hFI8pMH8ZPd85M2JAldZFP/SDDJ7OLjP
         /k+TR/ZfitScMCoiHRLuKtnWymnspZ7+xofUZyiPosoVNpB2xEYAgaSlGDQUasiDS1KM
         AOrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si15338470wmh.92.2019.01.14.04.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 04:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj1T1-0006Li-GG
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 07:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gj1Sr-0006La-SB
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 07:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gj1Sq-0008Ul-0M
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 07:35:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gj1So-0008UC-5M; Mon, 14 Jan 2019 07:35:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15DC8811DB;
	Mon, 14 Jan 2019 12:35:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
	[10.36.117.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CBB019C7C;
	Mon, 14 Jan 2019 12:35:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id ADD2E9D84; Mon, 14 Jan 2019 13:35:31 +0100 (CET)
Date: Mon, 14 Jan 2019 13:35:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190114123531.isddusgjtnl47wiv@sirius.home.kraxel.org>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-16-philmd@redhat.com>
	<8a7ef73f-97a4-d270-9836-3936b7be1046@redhat.com>
	<f91cbbae-c3a0-d182-6de9-4ddd0c3892fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f91cbbae-c3a0-d182-6de9-4ddd0c3892fc@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 14 Jan 2019 12:35:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 15/15] ui/console: Add "ui/pixelformat.h"
 to declare PixelFormat
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vLmcmYy0Wz5L

On Mon, Jan 14, 2019 at 11:24:14AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 1/11/19 6:32 PM, Paolo Bonzini wrote:
> > On 11/01/19 15:08, Philippe Mathieu-Daud=E9 wrote:
> >> PixelFormat is used by "ui/console.h" and by "ui/qemu-pixman.h".
> >=20
> > ui/console.h already includes ui/qemu-pixman.h, just move it there?
>=20
> That was my first though but then noticed pixman seems a bit
> different/unrelated. If Gerd is OK I will do it. (I should have written
> that in the commit).

console depends on pixman anyway, so that move would be fine.

BTW: Should not be that hard to remove PixelFormat altogether, or move
the bits which are still needed to vnc which is the only user left
(beside deprecated sdl1 which should go away soon).

cheers,
  Gerd

