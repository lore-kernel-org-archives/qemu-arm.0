Received: by 10.80.166.35 with SMTP id d32csp443589edc;
        Wed, 26 Oct 2016 23:29:52 -0700 (PDT)
X-Received: by 10.237.55.34 with SMTP id i31mr4990535qtb.105.1477549792493;
        Wed, 26 Oct 2016 23:29:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si2667553qta.11.2016.10.26.23.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 23:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzeCF-0007jp-Vr
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 02:29:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzeCC-0007ji-Nv
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 02:29:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzeC7-0002gP-OQ
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 02:29:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzeC7-0002g5-JE; Thu, 27 Oct 2016 02:29:43 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C88264E334;
	Thu, 27 Oct 2016 06:29:42 +0000 (UTC)
Received: from javelin (vpn-48-231.rdu2.redhat.com [10.10.48.231])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9R6TbqK009856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 02:29:39 -0400
Date: Thu, 27 Oct 2016 11:59:36 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKOuX7cZuYa7xCc69b322S3XpM_0VQMc0DQ4b=Gvq3UM+w@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610271156591.14744@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOuX7cZuYa7xCc69b322S3XpM_0VQMc0DQ4b=Gvq3UM+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 27 Oct 2016 06:29:42 +0000 (UTC)
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
X-TUID: vEe8Q5tOd4+0

+-- On Wed, 26 Oct 2016, Alistair Francis wrote --+
| >   * Device model for Cadence UART
| > + *   -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
| 
| Nit pick, I would put the URL under the title below.

  Okay.
 
| > +    case R_BRGR: /* Baud rate generator */
| > +        s->r[offset] = 0x028B; /* default reset value */
| 
| Why do we still have the reset value here, I thought we were just
| ignoring the invalid writes? You don't need to reset it.

  Wouldn't that leave the registers undefined ?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
