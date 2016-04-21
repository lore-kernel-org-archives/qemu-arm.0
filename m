Received: by 10.25.208.194 with SMTP id h185csp163554lfg;
        Thu, 21 Apr 2016 05:55:35 -0700 (PDT)
X-Received: by 10.140.23.139 with SMTP id 11mr16708918qgp.62.1461243335077;
        Thu, 21 Apr 2016 05:55:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g189si289816qkg.195.2016.04.21.05.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 05:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atE8s-00025v-Jb
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 08:55:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atE8R-0001Ub-G2
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 08:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atE8Q-0004f6-Lz
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 08:55:07 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atE8Q-0004cN-Ia
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 08:55:06 -0400
Received: by mail-vk0-x235.google.com with SMTP id n67so84520593vkf.3
	for <qemu-devel@nongnu.org>; Thu, 21 Apr 2016 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jwXa7rS1QVEdv73lVarQRuKAaskXztR3evQXfz8XIoc=;
	b=MLWg3TIfJtGWJnsdIIVRg9PvUzMqxsisRb6K5Ceoang2Nt5FM8FHs8V//bwKPG3u6k
	bWPqOaiLRVPTFC1RqUB8hGIuRmfiqTNjuSCicqTx/SrQ4hlKLIOr36nHwjBG5CxeNvzE
	LH26r1AuYophoR0FaZzVR9J7ysYxqaLCB73/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jwXa7rS1QVEdv73lVarQRuKAaskXztR3evQXfz8XIoc=;
	b=TRz73Vqo5/CgPfROo8JAyo2khdsZmMLwrxTHqo4h/VT6hOGv4uM/GcN7m1JbfvbtR9
	Uco4GAkNWZ1LNvXgj2xfWcMITWI+ODUgULLYR6Gm2dUIjxXJoEDcEyQskYztGtM+P4oR
	dQBdXZ9dHSftiXX+49FHg6cnpXrIUCpELoAtNPRRyR0su/YlXUemwF6j1v2N59PKnThJ
	ej0ZNdZlRBC4rOuTVV20L0qMSll/QTeU/ZMZ1UpOuNSOrBRXBACfMKy2K3t8IF70faSm
	50/QkaNxJqjyPEfo3bbwf+hNB5VNkRUk4mnSU+U3Oym6+1mY+KrJIXmYdizMF9+J05L3
	lh6A==
X-Gm-Message-State: AOPr4FUYb6j126UDmKTdZlQiHRDgwdp3arG4FtM13cHea4jLtr1WNfnKtcHK53aSbild/kPucrhI4EabyKYr7qrh
X-Received: by 10.31.63.77 with SMTP id m74mr79290vka.139.1461243304928; Thu,
	21 Apr 2016 05:55:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 21 Apr 2016 05:54:45 -0700 (PDT)
In-Reply-To: <DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 13:54:45 +0100
Message-ID: <CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-devel] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HumGaW/eXvWG

On 21 April 2016 at 13:50, Sylvain Garrigues
<sylvain@sylvaingarrigues.com> wrote:
> It does prevent FreeBSD to boot correctly.
>
> With that patch and
> #define KERNEL_LOAD_ADDR 0x00200000
> in arm/boot/boot.c, official FreeBSD RPI2 images boot like a charm :-)

This is the kind of thing that is useful to mention in the commit
message, because it tells people why the change is important...

> BTW, would be great to be able to set the load addr on the command
> line, wouldn=E2=80=99t it?

The booting protocol does not mandate any particular address
that the kernel has to be loaded at:
https://www.kernel.org/doc/Documentation/arm/Booting

If the FreeBSD kernel can't handle being loaded wherever
we put it, that sounds like a FreeBSD bug to me...

thanks
-- PMM
