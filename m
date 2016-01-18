Received: by 10.25.159.19 with SMTP id i19csp1723037lfe;
        Sun, 17 Jan 2016 21:35:12 -0800 (PST)
X-Received: by 10.140.31.8 with SMTP id e8mr20016142qge.14.1453095312739;
        Sun, 17 Jan 2016 21:35:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si29249573qge.114.2016.01.17.21.35.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 21:35:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL2TA-00043G-9z
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 00:35:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aL2T8-00040t-8r
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 00:35:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aL2T5-0008Ai-3z
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 00:35:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aL2T4-0008AU-UL; Mon, 18 Jan 2016 00:35:07 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DAD49C7961;
	Mon, 18 Jan 2016 05:35:05 +0000 (UTC)
Received: from javelin (vpn-225-27.phx2.redhat.com [10.3.225.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I5Yxa8015640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 18 Jan 2016 00:35:02 -0500
Date: Mon, 18 Jan 2016 11:04:58 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Jason Wang <jasowang@redhat.com>
In-Reply-To: <569C54B6.3010404@redhat.com>
Message-ID: <alpine.LFD.2.20.1601181103130.30267@wniryva>
References: <1452841240-30377-1-git-send-email-ppandit@redhat.com>
	<569C54B6.3010404@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Ling Liu <liuling-it@360.cn>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] net: cadence_gem: check packet size in
	gem_recieve
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
X-TUID: cTBaEiEUtTZ6

+-- On Mon, 18 Jan 2016, Jason Wang wrote --+
| > +        if (size > sizeof(rxbuf) - sizeof(crc_val)) {
| > +            size = sizeof(rxbuf) - sizeof(crc_val);
| > +        }
| > +        bytes_to_copy = size;
| > +
| 
| We probably need more check, is there any guarantee that size <= 2048?
| If not, need fix.

  Sorry? The above check would fix that, no?

--
 - P J P
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
