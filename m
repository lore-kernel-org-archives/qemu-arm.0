Received: by 10.25.159.19 with SMTP id i19csp3725113lfe;
        Thu, 21 Jan 2016 05:39:04 -0800 (PST)
X-Received: by 10.140.18.114 with SMTP id 105mr52020540qge.41.1453383543977;
        Thu, 21 Jan 2016 05:39:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si1344337qgf.85.2016.01.21.05.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 05:39:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMFS3-0004EG-CH
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 08:39:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMFS1-0004E1-Aa
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 08:39:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMFS0-0008JQ-Gk
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 08:39:01 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMFS0-0008JI-A7
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 08:39:00 -0500
Received: by mail-vk0-x233.google.com with SMTP id n1so23125209vkb.3
	for <qemu-arm@nongnu.org>; Thu, 21 Jan 2016 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Qc6uWdE6MHQS79JadEPsUNm3PBvnbW23oP0WxQzpPrY=;
	b=Lrs08FK5Q3+hjRrn/ER2a2I9P9kB97s42hNm5qdDHUoH1aZMQTDVXc7g4l6L1X2xAS
	hkDVruiRMtSfkvGN1v8xRZD1/nzPWyUj10Vij0WY1UgjZs92fNCPAWAtkqUiOSY93lL9
	wWCKz2UDArzRl6jjp8MoHLisRCelYG6zxJxvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Qc6uWdE6MHQS79JadEPsUNm3PBvnbW23oP0WxQzpPrY=;
	b=jUcNXpecRxXiaDROo02P5C7hCtgG7z3/ZltnKHVJZ2nrfGwHLurG67PkCPSrMdNodD
	ovcIg0mJV4yobZqn3TXzUUnShv8s2mss+6XyuvbILKDCBuSd387bkdtmru1lD09Dw9Hh
	npw8ok6Ma/mzX9MIIogWVhf96tahWwYkw/3UnHLaHpsdCtHQxyK4OL759UjcqMh1017Z
	ncAyYuGtzHt3UboN47PtOYp7+Cg3Rhqs9MjJ+mrK9o1Cpxae0T0aj3nMU0szPOWNNGbl
	XdwqjTo5Bn8yZ5hOgzeT+36mBjvuOe6uU1wSa3rIf66xv70yjAj1A0PO9MVUtUG0aL0f
	gaZA==
X-Gm-Message-State: ALoCoQmKWgI0IcDb8NpByIztSLm8V+FQdyCNDNIi/itFJ1UHBNrLCW0NatzftkDM8SBHBdJi3AXv1G62xZYiuLNF8sta0IQx35zlmo6Dm6UYhJ5q2qS7RHM=
X-Received: by 10.31.180.145 with SMTP id d139mr25514896vkf.83.1453383539856; 
	Thu, 21 Jan 2016 05:38:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 21 Jan 2016 05:38:39 -0800 (PST)
In-Reply-To: <629e7fa5d47f2800e51cc1f18d12635f1eece349.1453333840.git.alistair.francis@xilinx.com>
References: <629e7fa5d47f2800e51cc1f18d12635f1eece349.1453333840.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2016 13:38:39 +0000
Message-ID: <CAFEAcA86J2dNJEn+E6XBDOGiT0xCC7=ABxUscOQhbvD4J3AsvA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v3 1/1] arm_gic: Update ID registers based on
	revision
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qDCsRdD4Q9HG

On 21 January 2016 at 00:18, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the GIC ID registers (registers above 0xfe0) based on the GIC
> revision instead of using the sames values for all GIC implementations.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> V3:
>  - Add an assert()
> V2:
>  - Update array indexing to match new values
>  - Check the maximum value of offset as well
>
>  hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
