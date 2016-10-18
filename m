Received: by 10.80.166.35 with SMTP id d32csp1143505edc;
        Tue, 18 Oct 2016 11:46:48 -0700 (PDT)
X-Received: by 10.55.41.39 with SMTP id p39mr2301529qkh.98.1476816408159;
        Tue, 18 Oct 2016 11:46:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si21802155qkl.267.2016.10.18.11.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 11:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwZPT-0007Yj-IQ
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 14:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwZPN-0007Vp-D9
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwZPJ-00053I-D3
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bwZPJ-00052X-7z; Tue, 18 Oct 2016 14:46:37 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD6DD683E8;
	Tue, 18 Oct 2016 18:46:35 +0000 (UTC)
Received: from javelin (vpn1-48-97.bne.redhat.com [10.64.48.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IIkSIM028151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 14:46:32 -0400
Date: Wed, 19 Oct 2016 00:16:26 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610182307550.1547@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Oct 2016 18:46:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] char: cadence: check divider against baud
 rate
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIw1vy//aE2F

+-- On Tue, 18 Oct 2016, Peter Maydell wrote --+
| > +    if (!s->r[R_BRGR] || !(s->r[R_BDIV] + 1)
| > +        || baud_rate < (s->r[R_BRGR] * (s->r[R_BDIV] + 1))) {
| > +        return;
| > +    }
| >      ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
| >      packet_size = 1;
| 
| It seems really unlikely that early return here is the correct thing, since
| it will result in our not correctly setting a bunch of the other
| stuff done later in this function that's unrelated to baud rate.
| What does the datasheet for this UART specify for this situation?

@Alistair.. wdyt?
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
