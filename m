Received: by 10.25.159.19 with SMTP id i19csp308949lfe;
        Fri, 15 Jan 2016 00:06:36 -0800 (PST)
X-Received: by 10.140.129.203 with SMTP id 194mr12155300qhb.57.1452845195094;
        Fri, 15 Jan 2016 00:06:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j125si12053641qhd.110.2016.01.15.00.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 00:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJzP0-0006vH-Gb
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 03:06:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJzOy-0006se-8r
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 03:06:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJzOu-0001Ul-8S
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 03:06:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aJzOu-0001UC-2I; Fri, 15 Jan 2016 03:06:28 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 708C08E226;
	Fri, 15 Jan 2016 08:06:27 +0000 (UTC)
Received: from javelin (vpn1-4-105.ams2.redhat.com [10.36.4.105])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0F86JY1014121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jan 2016 03:06:22 -0500
Date: Fri, 15 Jan 2016 13:36:18 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
In-Reply-To: <CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1601151327570.363@wniryva>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
	<CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, =?GB2312?B?wfXB7g==?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: D5JEJMfBKGJV

+-- On Thu, 14 Jan 2016, Peter Crosthwaite wrote --+
| I guess QEMU needs the whole packet before handing off to the net layer and 
| the assumption is that the packet is always within 2048. The easiest 
| solution is to realloc the buffer as it goes with the increasing sizes.

  Yes, I was considering increasing buffer size with view of the jumbo 
packets. In gem_transmit(), 'tx_desc_get_length' returns length masked by 
DESC_1_LENGTH(=0x1FFF=8191) bytes. But thought dynamic allocation might lead 
to excessive buffer allocation, not sure how constrained the Xilinx platform 
is for memory.

--
 - P J P
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
