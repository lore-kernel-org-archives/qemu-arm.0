Received: by 10.80.166.35 with SMTP id d32csp813393edc;
        Thu, 27 Oct 2016 13:12:47 -0700 (PDT)
X-Received: by 10.37.108.66 with SMTP id h63mr8612416ybc.50.1477599166980;
        Thu, 27 Oct 2016 13:12:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si3408299ywg.352.2016.10.27.13.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 13:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzr2c-0007eO-8J
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 16:12:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzr2Y-0007dj-B3
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 16:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzr2T-0003eE-D9
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 16:12:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzr2T-0003dh-7Y; Thu, 27 Oct 2016 16:12:37 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE109883A8;
	Thu, 27 Oct 2016 20:12:35 +0000 (UTC)
Received: from javelin (vpn-56-243.rdu2.redhat.com [10.10.56.243])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RKCUA3027307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 16:12:32 -0400
Date: Fri, 28 Oct 2016 01:42:29 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKOhRws=O=xudFEzvn_51yR3A1XBcLXGDtg9xbtuUT1OxQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610280141510.5188@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOuX7cZuYa7xCc69b322S3XpM_0VQMc0DQ4b=Gvq3UM+w@mail.gmail.com>
	<alpine.LFD.2.20.1610271156591.14744@wniryva>
	<CAKmqyKOhRws=O=xudFEzvn_51yR3A1XBcLXGDtg9xbtuUT1OxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Oct 2016 20:12:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] char: cadence: check baud
 rate generator and divider values
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: suDCCPpUkaZV

+-- On Thu, 27 Oct 2016, Alistair Francis wrote --+
| No, they will just remain at whatever they were previously set to.
| Which should always be valid.

  I see. Sent patch v4.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
