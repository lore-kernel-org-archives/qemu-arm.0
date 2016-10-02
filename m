Received: by 10.80.163.71 with SMTP id 65csp994647edn;
        Sat, 1 Oct 2016 23:16:07 -0700 (PDT)
X-Received: by 10.200.39.151 with SMTP id w23mr15167991qtw.81.1475388967489;
        Sat, 01 Oct 2016 23:16:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q185si4614925qkb.284.2016.10.01.23.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Oct 2016 23:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqa4E-0005ve-Q0
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 02:16:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqa4C-0005vZ-DB
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 02:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqa46-0006ow-Oc
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 02:16:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bqa46-0006oN-I1; Sun, 02 Oct 2016 02:15:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB3BD67EA6;
	Sun,  2 Oct 2016 06:15:54 +0000 (UTC)
Received: from javelin (vpn-235-227.phx2.redhat.com [10.3.235.227])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u926Flfa021428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 2 Oct 2016 02:15:50 -0400
Date: Sun, 2 Oct 2016 11:45:46 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-zru_S2GeLNDYb4uTkOsEN7TyT_kb5kw0f+fftqOvKXA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610021122450.32504@wniryva>
References: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-zru_S2GeLNDYb4uTkOsEN7TyT_kb5kw0f+fftqOvKXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 02 Oct 2016 06:15:55 +0000 (UTC)
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
X-TUID: XS26UAYlywwr

  Hello Peter,

+-- On Fri, 30 Sep 2016, Peter Maydell wrote --+
| > -    int i;
| > +    uint32_t i, inc;
| 
| Why have you changed the type of i when you haven't changed
| any of the code that works with it?

  Actually I declared 'inc' on the same line, then changed type to 'uint32' as 
'gtb->inc' is of the same type.
 
| Since the gtb->compare field is 64 bit your inc variable should
| probably be uint64_t.

  Okay. I was wondering about its values, as gtb->inc is 'uint32_t' type.

| > +            DB_PRINT("Compare event happened for CPU %d\n", i);
| 
| This is wrong -- this debug print should only happen when the
| comparator matches (ie when gtb->compare is less than update.new),
| not every time.
| 
| > +            gtb->status = 1;
| 
| Similarly the status flag should only be set when the comparator
| matches.
| 
| > +            if (gtb->control & R_CONTROL_AUTO_INCREMENT
| > +                && gtb->compare < update.new) {
| > +                inc = ((update.new - gtb->compare - 1) / gtb->inc) * gtb->inc;
| 
| I suggest using either QEMU_ALIGN_UP or QEMU_ALIGN_DOWN here,
| depending on which way round you're trying for.

  Okay.

| Also this will divide by zero if gtb->inc is 0 (as for instance
| it will be on reset).
| 
| > +        gtb->inc = value ? value : 1;
| 
| Where has this change come from ??

  This was to avoid the possible divide by zero. Couldn't find if zero could 
be valid value for 'gtb->inc' and a non-zero default value if not. If 
'gtb->inc' could be zero, should the 'gtb->compare += inc' only happen when 
it's non-zero ? Ie gtb->status would be set if gtb->inc > 0.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
