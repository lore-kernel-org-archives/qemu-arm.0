Received: by 10.80.163.71 with SMTP id 65csp1451613edn;
        Mon, 3 Oct 2016 02:13:50 -0700 (PDT)
X-Received: by 10.55.81.197 with SMTP id f188mr18079507qkb.243.1475486030861;
        Mon, 03 Oct 2016 02:13:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e79si13382545qkj.277.2016.10.03.02.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 02:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqzJl-0000kM-Mr
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 05:13:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqzJh-0000kF-Kv
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 05:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqzJc-00004z-KL
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 05:13:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bqzJc-0008WM-Em; Mon, 03 Oct 2016 05:13:40 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D594461EA;
	Mon,  3 Oct 2016 09:13:39 +0000 (UTC)
Received: from javelin ([10.65.148.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u939DZ0B020935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Oct 2016 05:13:37 -0400
Date: Mon, 3 Oct 2016 14:43:33 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA85-XdSaOYTWr2=JQVt+EBsmrSq-5QcbWe8hrSW0qZ7xA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610031435080.21013@wniryva>
References: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-zru_S2GeLNDYb4uTkOsEN7TyT_kb5kw0f+fftqOvKXA@mail.gmail.com>
	<alpine.LFD.2.20.1610021122450.32504@wniryva>
	<CAFEAcA85-XdSaOYTWr2=JQVt+EBsmrSq-5QcbWe8hrSW0qZ7xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 03 Oct 2016 09:13:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] timer: a9gtimer: check auto-increment
 register value
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvZmpY6zH5Sj

  Hello Peter,

+-- On Sun, 2 Oct 2016, Peter Maydell wrote --+
| The timer can't autoincrement by more than a 32 bit value, but
| the timer value is 64 bits, and since this code may be doing more than
| one autoincrement it's better to use 64 bits.

  Okay.

| If in doubt, you need to check the datasheet/technical reference manual for 
| the hardware, in this case 
| http://infocenter.arm.com/help/topic/com.arm.doc.100486_0401_10_en/ada1443777319205.html 
| Zero is a valid value for the auto-increment register, and in fact it is the 
| documented reset value.

  Yes, I was following the same. It does mention zero as a valid reset value, 
but does not mention about value to be writen to Timer Load Register. As in, 
when user attempts to write to a register. 
 
| gtb->status should be set whenever the timer comparator
| fires, whether we are auto-incrementing or not, and
| whatever the value of the auto-increment register is.
| It is the "timer matched" interrupt output. (Your current
| patch is wrong in that it has moved setting gtb->status
| into the wrong place, as I mentioned above.)

  Done; I've sent a revised patch v3.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
