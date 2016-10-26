Received: by 10.80.166.35 with SMTP id d32csp250514edc;
        Wed, 26 Oct 2016 13:05:22 -0700 (PDT)
X-Received: by 10.55.98.75 with SMTP id w72mr3567819qkb.91.1477512322275;
        Wed, 26 Oct 2016 13:05:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f62si2220567qkj.1.2016.10.26.13.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 13:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzURt-0003Q2-OA
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 16:05:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzURo-0003On-Qi
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 16:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzURk-000724-RE
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 16:05:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzURk-00071j-LQ; Wed, 26 Oct 2016 16:05:12 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2EC18FCF4;
	Wed, 26 Oct 2016 20:05:11 +0000 (UTC)
Received: from javelin (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QK57qI018030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 16:05:09 -0400
Date: Thu, 27 Oct 2016 01:35:06 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8L2Yy14OkPOEMZD5zg6J7PVgf4sWdehUHUHhpDEnmJBQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610270133010.5431@wniryva>
References: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-UT0Xj9YyyHzbO=69HDwVkOYeqPo7K9S+Ja0U7E4KZFg@mail.gmail.com>
	<alpine.LFD.2.20.1610261749330.346@wniryva>
	<CAFEAcA8L2Yy14OkPOEMZD5zg6J7PVgf4sWdehUHUHhpDEnmJBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 26 Oct 2016 20:05:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] net: smc91c111: check packet number and data
 register index
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
Cc: Azure Yang <azureyang@tencent.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AG3knhpSaVPN

+-- On Wed, 26 Oct 2016, Peter Maydell wrote --+
| The queue_tx function checks s->tx_fifo_len (because
| it's about to put something into s->tx_fifo[]), but it
| does not check anything about the values it puts into
| tx_fifo[]. The do_tx function then does
|    packetnum = s->tx_fifo[i];
|    p = &s->data[packetnum][0];
| where packetnum could be out of bounds.

   Oh, sorry. Fixed in patch v3.
 
| If the passed 'packet' value is greater than 31 or
| negative then the function will invoke undefined
| behaviour. If it's less than 32 but bigger than the
| max number of packets then it will set allocated to
| a value it ought not to be able to hold, which makes
| the rest of the code harder to reason about.
| 
| It can be set by malicious incoming vmstate data
| (and by arranging for release_packet() to be called
| with various out-of-bounds values, as described above).

Sent patch v3. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
