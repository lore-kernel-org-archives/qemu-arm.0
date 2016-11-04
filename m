Received: by 10.80.166.35 with SMTP id d32csp1118258edc;
        Fri, 4 Nov 2016 04:46:37 -0700 (PDT)
X-Received: by 10.202.223.137 with SMTP id w131mr13511485oig.150.1478259997639;
        Fri, 04 Nov 2016 04:46:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m97si7890589otm.186.2016.11.04.04.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Nov 2016 04:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2cxA-0004Mu-BU
	for alex.bennee@linaro.org; Fri, 04 Nov 2016 07:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c2cx5-0004MU-K1
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 07:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c2cx4-0000xs-UU
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 07:46:31 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c2cx4-0000ui-GA
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 07:46:30 -0400
Received: by mail-ua0-x230.google.com with SMTP id 51so63702491uai.1
	for <qemu-arm@nongnu.org>; Fri, 04 Nov 2016 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3PQUUSFgwK2FoMl0KFZTD8uiCGpVK0DD+9bDz9ezSTI=;
	b=VuWaXzITGx34Eibd0UE9lak4uJW50YjiYVbpNhQaDANX1zHR3V8kbENQRRiBZNr3YX
	UkYAqablQx/Ea0Y3suEUp3e3VJYLjF2xCMIUNBFvC5YWLwqY9x+nADoU9pRPK0tLAtXV
	s2pKBSI9j65Vz0FXe4amMvjjYtYXyitkfzbio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3PQUUSFgwK2FoMl0KFZTD8uiCGpVK0DD+9bDz9ezSTI=;
	b=eCxVZOI1jFrkzur8+mKAbeHzFInHdV5ZdX8OLO8gnKZj3IrlkUuV+UFYfD3mDcplMT
	PQYy4yLmAOMSEiJScf4Bt1fRNJMeACSVutsaJrRAQuKTk+pPyp+pc09ieM6c33IYiLJ9
	GsEvzJdG0iKwVwzP9ufugY//ME2cyvmcyEtDvn7oKjJQZXE8+jve6v7kbRkQ/eJlcURe
	R7jMvXj+hT9QMqYTfrbyd7cQy9Y/TP+DTz0fqNAIFxdH+fGIpTQUBgK4YIB9D337xre3
	fn9gq01sjK2aSdtHv9cI0dd8PpHJmh+XEx1q0dUHtzCwVoSWx60EnYyBlAMBoT2ZWf+M
	2PFw==
X-Gm-Message-State: ABUngvf8UZG4J04P/Z8ec7AxUZnA7cBUfUOSDyv0NkqG05rBFvupRiv2+Z764LsVkqV9AmZXqF/l9OFbJN7jawlv
X-Received: by 10.176.86.205 with SMTP id c13mr10940967uab.175.1478259989231; 
	Fri, 04 Nov 2016 04:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 4 Nov 2016 04:46:08 -0700 (PDT)
In-Reply-To: <5f8ea14d-8d98-139c-d54a-051d577f944b@redhat.com>
References: <1476266275-11155-1-git-send-email-thuth@redhat.com>
	<CAKmqyKMkt5ii21KqUV_J8=oNqsqXaYH9dUkxCy1+u4+P-Uqthg@mail.gmail.com>
	<5f8ea14d-8d98-139c-d54a-051d577f944b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2016 11:46:08 +0000
Message-ID: <CAFEAcA9F26pH_uv_gjBmdB_B7Y4x5H=EdiX3wkV+At-oHEn85g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] MAINTAINERS: Add some ARM
 related files to the corresponding sections
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LPt9Mi+7pBFb

On 4 November 2016 at 11:18, Thomas Huth <thuth@redhat.com> wrote:
> On 12.10.2016 15:34, Alistair Francis wrote:
>> On Wed, Oct 12, 2016 at 11:57 AM, Thomas Huth <thuth@redhat.com> wrote:
>>> The files w/cpu/a*mpcore.c are already assigned to the ARM CPU
>>> section, but the corresponding headers include/hw/cpu/a*mpcore.h
>>> are still missing.
>>>
>>> The file hw/*/imx* are already assigned to the i.MX31 machine, but
>>> the corresponding header files include/hw/*/imx* are still missing.
>>>
>>> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
>>> CP, hw/cpu/realview_mpcore.c seems to belong to Real View, and
>>> hw/misc/mst_fpga.c seems to belong to PXA2XX.
>>>
>>> And the files hw/misc/zynq* and include/hw/misc/zynq* seem to belong
>>> to the Xilinx Zynq machine.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---

> *ping* - Peter, do you think this update to MAINTAINERS is OK now?

Yeah, looks OK.

Acked-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
