Received: by 10.80.166.35 with SMTP id d32csp76881edc;
        Thu, 13 Oct 2016 20:54:44 -0700 (PDT)
X-Received: by 10.200.39.125 with SMTP id h58mr10306687qth.142.1476417284419;
        Thu, 13 Oct 2016 20:54:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e26si8513230qtc.130.2016.10.13.20.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 20:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1butZz-000433-HB
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 23:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1butZw-00042w-EK
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 23:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1butZt-0000yG-DA
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 23:54:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1butZt-0000y5-6x; Thu, 13 Oct 2016 23:54:37 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC76FC05A283;
	Fri, 14 Oct 2016 03:54:35 +0000 (UTC)
Received: from javelin (vpn1-4-151.sin2.redhat.com [10.67.4.151])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E3sVpo023284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 23:54:33 -0400
Date: Fri, 14 Oct 2016 09:24:30 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Qemu Developers <qemu-devel@nongnu.org>
In-Reply-To: <1476389550-31904-1-git-send-email-ppandit@redhat.com>
Message-ID: <alpine.LFD.2.20.1610140919450.2911@wniryva>
References: <1476389550-31904-1-git-send-email-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 14 Oct 2016 03:54:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5] timer: a9gtimer: remove loop
 to auto-increment comparator
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
	Li Qiang <liqiang6-s@360.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IDdE3AqvGV9s

+-- On Fri, 14 Oct 2016, P J P wrote --+
| +                if (gtb->control & R_CONTROL_AUTO_INCREMENT && gtb->inc) {
| +                    inc = update.new - gtb->compare;
| +                    inc = MAX(QEMU_ALIGN_DOWN(inc, gtb->inc), gtb->inc);
| +                    DB_PRINT("Auto incrementing timer compare by %"
| +                                                        PRId64 "\n", inc);
| +                    gtb->compare += inc;

  Please consider [PATCH v6]. I should've slept over this, instead of sending 
it at 02:00 hrs. at night.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
