Received: by 10.80.166.35 with SMTP id d32csp445624edc;
        Wed, 26 Oct 2016 23:35:40 -0700 (PDT)
X-Received: by 10.55.151.70 with SMTP id z67mr5473318qkd.185.1477550140138;
        Wed, 26 Oct 2016 23:35:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q82si3534351qkh.91.2016.10.26.23.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 23:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzeHr-0000kP-HD
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 02:35:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzeHn-0000kJ-ID
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 02:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzeHi-0006Gn-KL
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 02:35:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzeHi-0006GK-F3; Thu, 27 Oct 2016 02:35:30 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B7BA7AE90;
	Thu, 27 Oct 2016 06:35:28 +0000 (UTC)
Received: from javelin (vpn-48-231.rdu2.redhat.com [10.10.48.231])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9R6ZM0B025404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 02:35:25 -0400
Date: Thu, 27 Oct 2016 12:05:21 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_VLx0vtOJqzqdmo8RpvGa7VR6TAb+HtpbL8woTy3kENw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610271201040.14744@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA_VLx0vtOJqzqdmo8RpvGa7VR6TAb+HtpbL8woTy3kENw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 27 Oct 2016 06:35:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3] char: cadence: check baud rate generator
 and divider values
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QXmIcexdjuI0

+-- On Wed, 26 Oct 2016, Peter Maydell wrote --+
| You're relying on the register values never being
| invalid to avoid the divide by zero, which means
| you need to check them post-migration too.

@Alistair: @Edgar:
   Would it be possible for you to fix the migration part? I'm preparing for 
couple weeks leave from Monday 31'st, so trying to close other tasks. I'd 
really appreciate if you could take it over.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
