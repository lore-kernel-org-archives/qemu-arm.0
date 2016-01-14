Received: by 10.25.159.19 with SMTP id i19csp1681494lfe;
        Thu, 14 Jan 2016 02:24:24 -0800 (PST)
X-Received: by 10.55.198.152 with SMTP id s24mr4048030qkl.75.1452767064093;
        Thu, 14 Jan 2016 02:24:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 145si6720292qhq.28.2016.01.14.02.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 02:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJf4p-0001Hn-Hn
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 05:24:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJf4L-0000hA-5x
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 05:23:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJf4K-0000Ce-CG
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 05:23:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aJf4G-0000C8-9B; Thu, 14 Jan 2016 05:23:48 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 344B08E005;
	Thu, 14 Jan 2016 10:23:47 +0000 (UTC)
Received: from javelin (vpn1-6-47.ams2.redhat.com [10.36.6.47])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0EANeE8022163
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 14 Jan 2016 05:23:42 -0500
Date: Thu, 14 Jan 2016 15:53:38 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <1452764448-17953-1-git-send-email-mst@redhat.com>
Message-ID: <alpine.LFD.2.20.1601141551390.29435@wniryva>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, =?GB2312?B?wfXB7g==?= <liuling-it@360.cn>
Subject: Re: [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZbcGyk/OB6Z/

+-- On Thu, 14 Jan 2016, Michael S. Tsirkin wrote --+
| gem_receive copies a packet received from network into an rxbuf[2048]
| array on stack, with size limited by descriptor length set by guest.  If
| guest is malicious and specifies a descriptor length that is too large,
| and should packet size exceed array size, this results in a buffer
| overflow.
| 
| diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
| index 3639fc1..15a0786 100644
| --- a/hw/net/cadence_gem.c
| +++ b/hw/net/cadence_gem.c
| @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
|              break;
|          }
|  
| +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packet)) {
| +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x%x\n",
| +                     (unsigned)packet_desc_addr,
| +                     (unsigned)tx_desc_get_length(desc),
| +                     sizeof(tx_packet) - (p - tx_packet));
| +            break;
| +        }
| +

  Commit message says gem_receive, but the patch fixes gem_transmit() routine.

--
 - P J P
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
