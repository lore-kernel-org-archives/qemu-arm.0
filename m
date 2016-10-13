Received: by 10.80.166.35 with SMTP id d32csp227555edc;
        Wed, 12 Oct 2016 23:45:18 -0700 (PDT)
X-Received: by 10.237.52.1 with SMTP id w1mr4937678qtd.109.1476341118753;
        Wed, 12 Oct 2016 23:45:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27si5648128qtc.150.2016.10.12.23.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 23:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buZlW-00066E-5G
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 02:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1buZie-0003ud-P5
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 02:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1buZic-0006ds-VE
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 02:42:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1buZic-0006da-Oy; Thu, 13 Oct 2016 02:42:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BEE5C057EC9;
	Thu, 13 Oct 2016 06:42:17 +0000 (UTC)
Received: from javelin (vpn1-4-58.sin2.redhat.com [10.67.4.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9D6g966012242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 02:42:11 -0400
Date: Thu, 13 Oct 2016 12:12:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8LfjDEMtbT5GRryLvAEu9kzbEzykKXF9DP+dDLajT8BQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610131141320.2125@wniryva>
References: <1475903058-729-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8LfjDEMtbT5GRryLvAEu9kzbEzykKXF9DP+dDLajT8BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 13 Oct 2016 06:42:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4] timer: a9gtimer: remove loop to
 auto-increment comparator
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
X-TUID: IOKmucarhk4Z

+-- On Wed, 12 Oct 2016, Peter Maydell wrote --+
| > -            while (gtb->compare < update.new) {
| > +            if (gtb->compare < update.new) {
| >
| > +                    inc = update.new - gtb->compare - 1;
| 
| Can you explain why the '- 1' here ?

  I think I did that because while was running till gtb->compare < update.new.
To contain gtb->compare under update.new.

| Something still doesn't look right here. Consider the case where
| update.new is only just bigger than gtb->compare (actually the
| usual case, I think). In this case 'update.new - gtb->compare - 1'
| is smaller than gtb->inc and so the QEMU_ALIGN_DOWN will produce
| an inc value of 0. That would be wrong, because we should definitely
| have done an auto-increment.

   Yes, but in those cases 'gtb->compare += inc' would exceed update.new. Is 
that okay ?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
