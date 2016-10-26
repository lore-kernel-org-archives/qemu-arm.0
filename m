Received: by 10.80.166.35 with SMTP id d32csp280936edc;
        Wed, 26 Oct 2016 14:24:25 -0700 (PDT)
X-Received: by 10.55.4.19 with SMTP id 19mr3348094qke.18.1477517064917;
        Wed, 26 Oct 2016 14:24:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27si2327145qtc.150.2016.10.26.14.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 14:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzVgO-0006zD-AL
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 17:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzVfX-0006x6-Ph
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzVfX-0000Ww-3W
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:23:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzVfS-0000Ut-OF; Wed, 26 Oct 2016 17:23:26 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C9E73F1F7;
	Wed, 26 Oct 2016 21:23:26 +0000 (UTC)
Received: from javelin (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QLNLVg027321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 17:23:23 -0400
Date: Thu, 27 Oct 2016 02:53:20 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKOeT3eEOkjdnxN-fd_Ubnn+kjD_cr2eT-+LxHPKQg8SdA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610270252361.5431@wniryva>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
	<alpine.LFD.2.20.1610252318530.15276@wniryva>
	<CAKmqyKOHh2q-qMGvL3SxesD5Tx3yiWXddf390M8mwu7+2ZK8jQ@mail.gmail.com>
	<alpine.LFD.2.20.1610261210330.21732@wniryva>
	<CAKmqyKOeT3eEOkjdnxN-fd_Ubnn+kjD_cr2eT-+LxHPKQg8SdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 26 Oct 2016 21:23:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] char: cadence: check baud rate
 generator and divider values
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eVOFJSLs10PW

+-- On Wed, 26 Oct 2016, Alistair Francis wrote --+
| >From what I can tell I would say that any writes to the divider
| register that have a value lower then 3 are ignored and the register
| isn't updated.
| 
| That way we will always have a valid value as the register is reset to 0xF.

Sent a revised patch v3. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
