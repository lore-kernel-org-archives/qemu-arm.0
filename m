Received: by 10.80.166.35 with SMTP id d32csp2462618edc;
        Sun, 23 Oct 2016 22:34:21 -0700 (PDT)
X-Received: by 10.55.189.132 with SMTP id n126mr14065613qkf.275.1477287261325;
        Sun, 23 Oct 2016 22:34:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si9961388qkh.189.2016.10.23.22.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 22:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byXts-0004hI-6c
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 01:34:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byXtk-0004fh-A5
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byXth-0007Tm-5P
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:34:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1byXth-0007TT-0O; Mon, 24 Oct 2016 01:34:09 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 580747F09D;
	Mon, 24 Oct 2016 05:34:07 +0000 (UTC)
Received: from javelin (vpn-61-69.rdu2.redhat.com [10.10.61.69])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9O5Y2KG025729
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 24 Oct 2016 01:34:04 -0400
Date: Mon, 24 Oct 2016 11:04:01 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1476733226-11635-1-git-send-email-ppandit@redhat.com>
Message-ID: <alpine.LFD.2.20.1610241103140.1438@wniryva>
References: <1476733226-11635-1-git-send-email-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 24 Oct 2016 05:34:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7] timer: a9gtimer: remove loop
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPlfR540DUHC

+-- On Tue, 18 Oct 2016, P J P wrote --+
| Use QEMU_ALIGN_UP instead of QEMU_ALIGN_DOWN
|   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg03788.html
| 
| diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
| index 772f85f..ce1dc63 100644
| --- a/hw/timer/a9gtimer.c
| +++ b/hw/timer/a9gtimer.c
| @@ -82,15 +82,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
|          if ((s->control & R_CONTROL_TIMER_ENABLE) &&
| -            while (gtb->compare < update.new) {
| +            if (gtb->compare < update.new) {
|                  DB_PRINT("Compare event happened for CPU %d\n", i);
|                  gtb->status = 1;
| -                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
| -                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
| -                             gtb->inc);
| -                    gtb->compare += gtb->inc;
| -                } else {
| -                    break;
| +                if (gtb->control & R_CONTROL_AUTO_INCREMENT && gtb->inc) {
| +                    uint64_t inc =
| +                        QEMU_ALIGN_UP(update.new - gtb->compare, gtb->inc);
| +                    DB_PRINT("Auto incrementing timer compare by %"
| +                                                        PRId64 "\n", inc);
| +                    gtb->compare += inc;
|                  }
|              }

Ping..!
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
