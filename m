Received: by 10.80.166.35 with SMTP id d32csp1224593edc;
        Fri, 21 Oct 2016 00:47:26 -0700 (PDT)
X-Received: by 10.55.24.214 with SMTP id 83mr2285689qky.237.1477036046058;
        Fri, 21 Oct 2016 00:47:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si1043117qkb.190.2016.10.21.00.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Oct 2016 00:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxUY0-0001Pp-Sg
	for alex.bennee@linaro.org; Fri, 21 Oct 2016 03:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bxUXt-0001Pi-33
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 03:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bxUXp-0003SO-VI
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 03:47:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bxUXp-0003Rr-Pu; Fri, 21 Oct 2016 03:47:13 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF568553F;
	Fri, 21 Oct 2016 07:47:12 +0000 (UTC)
Received: from javelin ([10.65.148.59])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9L7l7sW007951
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 21 Oct 2016 03:47:09 -0400
Date: Fri, 21 Oct 2016 13:17:07 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
In-Reply-To: <20161020172146.GA25226@toto>
Message-ID: <alpine.LFD.2.20.1610211311300.18921@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
	<CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
	<alpine.LFD.2.20.1610201116520.27908@wniryva>
	<20161020172146.GA25226@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 21 Oct 2016 07:47:12 +0000 (UTC)
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
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EPr5tpMaMnlh

+-- On Thu, 20 Oct 2016, Edgar E. Iglesias wrote --+
| The UART is described in the Zynq TRMs, I think you can just
| google for zynq TRM and a reference to UG585 and UG1085 will come up.

  Unlikely for a novice to think 'zynq TRM' as search term for cadence UART. I 
went with Xilinx Cadence UART specificaiton.
 
| http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
| http://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
| 
| AFAIK, the ZynqMP has a newer version of the cadence UART with a superset of
| the feature set. I don't think QEMU models any of the differences though.

  I see, thank you for the details. I'll add these to the source file.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
