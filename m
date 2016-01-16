Received: by 10.25.159.19 with SMTP id i19csp863716lfe;
        Fri, 15 Jan 2016 21:24:18 -0800 (PST)
X-Received: by 10.55.18.76 with SMTP id c73mr17342827qkh.54.1452921858876;
        Fri, 15 Jan 2016 21:24:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si17628725qge.102.2016.01.15.21.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 21:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKJLW-0005yn-BY
	for alex.bennee@linaro.org; Sat, 16 Jan 2016 00:24:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aKJLT-0005yZ-JW
	for qemu-arm@nongnu.org; Sat, 16 Jan 2016 00:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aKJLO-00057d-I7
	for qemu-arm@nongnu.org; Sat, 16 Jan 2016 00:24:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aKJLO-00057Z-D7; Sat, 16 Jan 2016 00:24:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B111347A49;
	Sat, 16 Jan 2016 05:24:08 +0000 (UTC)
Received: from javelin (vpn1-4-191.ams2.redhat.com [10.36.4.191])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0G5O0ND016585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 16 Jan 2016 00:24:03 -0500
Date: Sat, 16 Jan 2016 10:53:58 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKNAHA1kWEJWTvn7RhAhXc6ca6VHUiq72unA_EA7-9_=SA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1601161046150.22572@wniryva>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
	<CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
	<alpine.LFD.2.20.1601151327570.363@wniryva>
	<CAKmqyKNAHA1kWEJWTvn7RhAhXc6ca6VHUiq72unA_EA7-9_=SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?GB2312?B?wfXB7g==?= <liuling-it@360.cn>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>
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
X-TUID: oz5YE8Bp475d

+-- On Fri, 15 Jan 2016, Alistair Francis wrote --+
| Won't the allocation/reallocation happen on the host?

  Ah yes, don't know what I was thinking.

--
 - P J P
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
