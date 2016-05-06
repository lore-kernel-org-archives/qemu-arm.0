Received: by 10.25.208.137 with SMTP id h131csp507041lfg;
        Fri, 6 May 2016 15:26:28 -0700 (PDT)
X-Received: by 10.55.26.1 with SMTP id a1mr673045qka.85.1462573588014;
        Fri, 06 May 2016 15:26:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si10939707qkm.237.2016.05.06.15.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 15:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayoCY-0001iC-Ef
	for alex.bennee@linaro.org; Fri, 06 May 2016 18:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoCS-0001XQ-MV
	for qemu-arm@nongnu.org; Fri, 06 May 2016 18:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoCO-0007IF-HO
	for qemu-arm@nongnu.org; Fri, 06 May 2016 18:26:19 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayoCN-0007H2-AA
	for qemu-arm@nongnu.org; Fri, 06 May 2016 18:26:16 -0400
Received: by mail-vk0-x22f.google.com with SMTP id o133so6744066vka.0
	for <qemu-arm@nongnu.org>; Fri, 06 May 2016 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=swC/wzH8yhQehKdIVsU6ea2RYROj9hZ76jAdqyZ3cJ0=;
	b=QwufguBNt3VXaR2YMpUQ7CmDkOs8caN6yBGXXiBsQOhTAnDXUHLh8ithh4NWwuTCwB
	OkcdmY/XOfNa0ZE8DGRAIhD4jx0eVB959JNbfvGRuT2Z53/ALL1897gVBlLtZwxjMdiK
	k3mVVlEZo7EJHVmc3sqsbvRFWLYbUrjPCyAAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=swC/wzH8yhQehKdIVsU6ea2RYROj9hZ76jAdqyZ3cJ0=;
	b=hXVnmLgWLkCZrsFB2cPx59ejtWHr7b9zR9khzPhtwsZOTVImLOa+YKvLcXSz2YFiEK
	o7rdueOjpkDGVf++/vZqbjf7JDfGJAGIOGP5GA8PgAPYskAkieWgeLkGQstsRGrVg0fJ
	CeJ04voyg4lFnDpc8phhamGQNMC5BR7LxwtpD4ChXiPAKW6/7IDKHJsXGs1fFhkDtbK8
	YYbOMQ6xbyNs9vpVuEzRJ6OI3JZZZ+eITyKGEUAhxnGW/246nc9MTzDthTwfVs+LaEaP
	VaR04Cx7UpISbhvYjF2IFHurc0tDQ86dyvhctiVXPoX6KFqxqGh7bVfhQvTns2S5khIq
	Lliw==
X-Gm-Message-State: AOPr4FUbhgNHRNv2ppgJFa2yKPzASQn4EJ9QBXMlDQCw8YqI49LuJEtL8Fi6cBQMvUqgL5Ktk9sy2LYldp1HL5tN
X-Received: by 10.31.81.199 with SMTP id f190mr395614vkb.139.1462573572328;
	Fri, 06 May 2016 15:26:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 6 May 2016 15:25:52 -0700 (PDT)
In-Reply-To: <6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2016 23:25:52 +0100
Message-ID: <CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [PATCH v1 2/2] target-arm: Enable EL2 for the A53s
 and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sv3rJJoNYOyR

On 6 May 2016 at 19:11, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Enable EL2 by default for the A53s and A57s.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

I don't really want to do this until we actually have
something approaching a workable EL2 implementation
(ideally including support in the GIC, since EL2's
not much good without it). I'd hope that software ought
to be able to work with an "EL3, but no EL2" CPU, since
that's a valid combination, unless it's very strongly
tied to a particular h/w implementation.

thanks
-- PMM
