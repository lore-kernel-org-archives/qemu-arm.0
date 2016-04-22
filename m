Received: by 10.25.208.194 with SMTP id h185csp729102lfg;
        Fri, 22 Apr 2016 05:12:30 -0700 (PDT)
X-Received: by 10.140.234.195 with SMTP id f186mr22001944qhc.91.1461327150286;
        Fri, 22 Apr 2016 05:12:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t142si3492516qhb.69.2016.04.22.05.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 05:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZwj-0003UN-Mj
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 08:12:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atZwh-0003QN-1M
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atZwc-0000di-1N
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:12:26 -0400
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atZwb-0000dd-SB; Fri, 22 Apr 2016 08:12:21 -0400
Received: by mail-wm0-f49.google.com with SMTP id e201so16330340wme.0;
	Fri, 22 Apr 2016 05:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=j/zJyxlj/CbUJ7hRf77182Tq88oeVYMytIerrYng5FE=;
	b=kIR53n0W+c6aKQuAiK5wtwxNW4jINHRr7830n3dBHsp4FKh4YEN6We3q7OWX5SH0lq
	zKhN29rzcZc32SlbfP07wi66YQGDNXvDkLMM+G4hZ2gDDYbhHsdUqUehRAkQ9xBazFhk
	c/CRuhiugB1Pajx8RW/sBiYDU+oxHmVOZtgEN90BATnOX+WR0UNH/UMweaTV1CZ+FWmk
	EdWcC0F5/1J86VB2kWHd1IxZ5LHfADA3XbSMPokwt8RQ4ei1tV+cMvoGgpj3QI8Xv8O0
	cIeE26DG3+xEphg8ZppdwZiecdKu3XATQLTdNwEiS/u0FSRs4JSDyhpgZEDdW3ZIGR1t
	n5gA==
X-Gm-Message-State: AOPr4FU81XmuJ3IgilVnW1z92CDA1uP2wGTQDTH/VwSq6tXt07KN8ZMShjyLDl2pXNiozA==
X-Received: by 10.194.192.106 with SMTP id hf10mr19521732wjc.134.1461327141318;
	Fri, 22 Apr 2016 05:12:21 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	i11sm7811027wjn.36.2016.04.22.05.12.19
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 05:12:19 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <BLUPR0301MB203485DA67E205999C1F0AC49E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 22 Apr 2016 14:12:18 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <91F60BC7-6887-4090-BB66-B2ABEC05ED47@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<19E314DF-2836-4020-94F1-4D1B39CD6E6C@sylvaingarrigues.com>
	<BLUPR0301MB203485DA67E205999C1F0AC49E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.49
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
X-TUID: 49fZk4oVX4lo

Le 22 avr. 2016 =C3=A0 13:30, Andrew Baumann =
<Andrew.Baumann@microsoft.com> a =C3=A9crit :
> But I won't be merging this patch (hopefully Peter can do that?), so =
it's probably best if you make the tweak and resend with my Reviewed-by.

Made the tweak and resent the patch with your reviewed-by.

Have a good day.=
