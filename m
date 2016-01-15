Received: by 10.25.159.19 with SMTP id i19csp256147lfe;
        Thu, 14 Jan 2016 21:40:09 -0800 (PST)
X-Received: by 10.140.135.16 with SMTP id 16mr11510992qhh.79.1452836409735;
        Thu, 14 Jan 2016 21:40:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128si11500769qkb.78.2016.01.14.21.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 21:40:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJx7J-00064Q-5D
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 00:40:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJx7H-00064E-8U
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 00:40:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJx7E-0007z8-2M
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 00:40:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aJx7D-0007z1-Su; Fri, 15 Jan 2016 00:40:03 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 8B40AC07584A;
	Fri, 15 Jan 2016 05:40:02 +0000 (UTC)
Received: from javelin (vpn1-4-105.ams2.redhat.com [10.36.4.105])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0F5dsXl032617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jan 2016 00:39:56 -0500
Date: Fri, 15 Jan 2016 11:09:53 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Jason Wang <jasowang@redhat.com>
In-Reply-To: <5698648F.6000104@redhat.com>
Message-ID: <alpine.LFD.2.20.1601151108520.2673@wniryva>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<5698648F.6000104@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, =?GB2312?B?wfXB7g==?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SPgdIkSKx2I/

+-- On Fri, 15 Jan 2016, Jason Wang wrote --+
| Looks like we need similar issue in gen_receive(), need to fix that?

Yes, I'm preparing a patch.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
