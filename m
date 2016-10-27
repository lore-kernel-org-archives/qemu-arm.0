Received: by 10.80.166.35 with SMTP id d32csp790173edc;
        Thu, 27 Oct 2016 12:15:32 -0700 (PDT)
X-Received: by 10.176.1.11 with SMTP id 11mr8480906uak.172.1477595732575;
        Thu, 27 Oct 2016 12:15:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si4158927vkh.24.2016.10.27.12.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzq9D-0006oW-RT
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzq7K-0005Yv-Mw
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 15:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzq7K-0003J1-1q
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 15:13:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzq7E-0003Dw-1v; Thu, 27 Oct 2016 15:13:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9217913A9A;
	Thu, 27 Oct 2016 19:13:26 +0000 (UTC)
Received: from javelin (vpn-58-122.rdu2.redhat.com [10.10.58.122])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RJDJRO016359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 15:13:22 -0400
Date: Fri, 28 Oct 2016 00:43:18 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <CAKmqyKPnKR5g38Y2dpXJcpooNoJJLRr_H8BMdyxh96Qg6T9Pgg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610280041050.31079@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA_VLx0vtOJqzqdmo8RpvGa7VR6TAb+HtpbL8woTy3kENw@mail.gmail.com>
	<alpine.LFD.2.20.1610271201040.14744@wniryva>
	<CAKmqyKPnKR5g38Y2dpXJcpooNoJJLRr_H8BMdyxh96Qg6T9Pgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Oct 2016 19:13:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] char: cadence: check baud rate
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaELl5eUhiip

+-- On Thu, 27 Oct 2016, Alistair Francis wrote --+
| > @Alistair: @Edgar:
| >    Would it be possible for you to fix the migration part? I'm preparing for
| > couple weeks leave from Monday 31'st, so trying to close other tasks. I'd
| > really appreciate if you could take it over.
| 
| Yeah, I can take this over.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
