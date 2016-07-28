Received: by 10.25.21.156 with SMTP id 28csp644743lfv;
        Thu, 28 Jul 2016 00:00:01 -0700 (PDT)
X-Received: by 10.237.53.19 with SMTP id a19mr51969342qte.67.1469689201556;
        Thu, 28 Jul 2016 00:00:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l95si7067493qte.110.2016.07.28.00.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSfIW-0002qy-Oi
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfIR-0002mV-1Z
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 02:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfIL-00017q-7Y
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 02:59:54 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:55310)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSfIK-000178-WA
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 02:59:49 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id B98C71000F68
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 08:59:47 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 32E3A5C0091;
	Thu, 28 Jul 2016 08:59:39 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-4-git-send-email-clg@kaod.org>
	<1469673438.5468.89.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f1bd4d9c-c475-2ca3-7f7a-d9efa4d51bf0@kaod.org>
Date: Thu, 28 Jul 2016 08:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469673438.5468.89.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12492422417108077488
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.49.208
Subject: Re: [Qemu-arm] [PATCH 3/6] ast2400: use machine cpu_model to
 initialize the soc cpu
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBOSvh8w3a5w

On 07/28/2016 04:37 AM, Andrew Jeffery wrote:
> I did a similar thing in the series introducing the AST2400 SoC, and
> Peter had a comment on the approach[1]:
> 
>     What we do now is not let the user override the cpu model at all;
>     presumably this SoC only ever has an ARM926 and it doesn't make
>     any sense to have some frankenstein "this SoC but with a different
>     CPU in it" config.
> 
> Given this is the ast2400_init() it looks to me like we should be
> hardwiring the CPU rather than leaving it to the machine to define.

ok. so if we consider that the platform did the setting, we can reduce 
the patch to :

-    s->cpu = cpu_arm_init("arm926");
+    s->cpu = cpu_arm_init(current_machine->cpu_model);

Cheers,

C.
