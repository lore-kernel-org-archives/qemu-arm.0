Received: by 10.25.208.194 with SMTP id h185csp705063lfg;
        Fri, 22 Apr 2016 04:27:07 -0700 (PDT)
X-Received: by 10.140.216.83 with SMTP id m80mr22210429qhb.37.1461324427011;
        Fri, 22 Apr 2016 04:27:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a31si3213924qka.63.2016.04.22.04.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 04:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZEo-0003kg-HS
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 07:27:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atZEl-0003h3-AG
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:27:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atZEh-0004tx-8w
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:27:03 -0400
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atZEh-0004tE-2z; Fri, 22 Apr 2016 07:26:59 -0400
Received: by mail-wm0-f47.google.com with SMTP id u206so22012380wme.1;
	Fri, 22 Apr 2016 04:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=RWVqn9fgqEyJ0ef8caCcdCzNS3HcCLZsCtGfHcMfzhE=;
	b=Rag4rwxlus1olr2Jmt6o2+NsCBZOzPOH+BLb64ZvqdOIfBAjtYlRTb6k4hneWQ8CWX
	A61WVdlZI0E3LfG7q+qsRjS31iXfpinmkZLsI0d6ftXsISOD7FRQqISthqVtDY73RyKK
	TLEJkzeSpme9r9nvUFqeCY9uQ1lo9QrcSRcxIxU/hcZa8uMY5qBBTRU72whT1uKyh2uJ
	r/hLRzZcVmUVwF1AVp2DTbR9dHGBauB1rpsR/0ioqtPJIwOc9+vg+oG1JH4vhcdkhisD
	OYipSqHWQxOq5k/zr5RuqnH/cPQIITl6c5uK5V1r1u6PynGgvOpviscNejKQ1DDKByOH
	y6YA==
X-Gm-Message-State: AOPr4FUZ6p/YgfzZeNUa2h0LmgDkRORHz0SZrTmfNAAhYN6CDXcwfET2/qWg6WWxCdpu5Q==
X-Received: by 10.28.91.17 with SMTP id p17mr3164742wmb.86.1461324418148;
	Fri, 22 Apr 2016 04:26:58 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	d123sm2904461wmd.9.2016.04.22.04.26.56
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 04:26:56 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 22 Apr 2016 13:26:55 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <19E314DF-2836-4020-94F1-4D1B39CD6E6C@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.47
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1AHE0xDMOH85

Le 22 avr. 2016 =C3=A0 13:22, Andrew Baumann =
<Andrew.Baumann@microsoft.com> a =C3=A9crit :
>> +            stl_le_phys(&s->dma_as, value + 16, tmp_xres * tmp_yres =
*
>> + (tmp_bpp >> 3));
>=20
> Personal style nit: I prefer * 8 rather than >> 3, because it's more =
immediately obvious what you're computing, a trivial optimisation for =
the compiler, and in this specific example wouldn't need the brackets to =
ensure the correct operator precedence.
>=20
> But in any case,
> Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>


Thanks! It is actually / 8, but I used >> 3 to remain consistent with =
what I read in hw/display/bcm2835_fb.c. Feel free to adapt.

