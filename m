Received: by 10.80.166.35 with SMTP id d32csp653876edc;
        Wed, 19 Oct 2016 22:56:10 -0700 (PDT)
X-Received: by 10.55.212.221 with SMTP id s90mr10783449qks.169.1476942970498;
        Wed, 19 Oct 2016 22:56:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si26692062qkb.94.2016.10.19.22.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 22:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bx6Ko-0001FJ-03
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 01:56:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bx6Ki-0001F9-Ew
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 01:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bx6Kd-00085y-Kt
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 01:56:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bx6Kd-00084O-GW; Thu, 20 Oct 2016 01:55:59 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10ACE3F1FF;
	Thu, 20 Oct 2016 05:55:57 +0000 (UTC)
Received: from javelin (vpn1-48-142.bne.redhat.com [10.64.48.142])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9K5tnUe004967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 20 Oct 2016 01:55:52 -0400
Date: Thu, 20 Oct 2016 11:25:47 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610201116520.27908@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
	<CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Oct 2016 05:55:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] char: cadence: check divider
 against baud rate
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dx6FCRgMtFHo

+-- On Wed, 19 Oct 2016, Alistair Francis wrote --+
| I don't think the Cadence datasheets are public. If you can't find it
| from a simple Google search I don't think you have access.

  I see, okay.

I think it'll greatly help if device emulator writers include a link to its 
specification/datasheet resources in the respective source file. At least if 
these are publicly available. That way one knows for sure which specifications 
to follow while debugging, instead of searching and sifting through multiple 
different versions. OR Maybe there could a field in the MAINTAINERS file which 
would point to respective reference resources. (just a thought)

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
