Received: by 10.80.166.35 with SMTP id d32csp206083edc;
        Tue, 25 Oct 2016 23:50:23 -0700 (PDT)
X-Received: by 10.55.80.86 with SMTP id e83mr18687qkb.318.1477464623821;
        Tue, 25 Oct 2016 23:50:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f35si448441qtc.20.2016.10.25.23.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 23:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzI2Z-0006YP-Bf
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 02:50:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzI2V-0006Y4-3J
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 02:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzI2S-0003e7-18
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 02:50:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzI2R-0003dz-Ro; Wed, 26 Oct 2016 02:50:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55765C00B71E;
	Wed, 26 Oct 2016 06:50:14 +0000 (UTC)
Received: from javelin (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q6o9Aj020759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 02:50:11 -0400
Date: Wed, 26 Oct 2016 12:20:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKOHh2q-qMGvL3SxesD5Tx3yiWXddf390M8mwu7+2ZK8jQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610261210330.21732@wniryva>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
	<alpine.LFD.2.20.1610252318530.15276@wniryva>
	<CAKmqyKOHh2q-qMGvL3SxesD5Tx3yiWXddf390M8mwu7+2ZK8jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 06:50:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] char: cadence: check baud
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghnxCMCGtMZ8

+-- On Tue, 25 Oct 2016, Alistair Francis wrote --+
| I think your email crossed with Peter. Have a look at what he said.
| That should clarify everything.

  I saw, I'll mask values with 0xFFFF and 0xFF; But it's not clear if ignoring 
values 0 - 3, means leaving registers uninitialised and adding checks at each 
usage point to ensure their value is valid. If so, do we return from 
uart_parameters_setup(), when either value is invalid ? Earlier you'd 
suggested using default values

  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04397.html

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
