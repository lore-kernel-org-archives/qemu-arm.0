Received: by 10.80.166.35 with SMTP id d32csp50831edc;
        Wed, 26 Oct 2016 06:00:33 -0700 (PDT)
X-Received: by 10.200.56.52 with SMTP id q49mr1531701qtb.23.1477486833264;
        Wed, 26 Oct 2016 06:00:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v184si1265708qki.288.2016.10.26.06.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 06:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzNom-0003c5-Kn
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 09:00:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzNP5-0006W3-M0
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 08:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzNP2-0008EA-Jt
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 08:33:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzNP2-0008E2-Dj; Wed, 26 Oct 2016 08:33:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 871D680F95;
	Wed, 26 Oct 2016 12:33:55 +0000 (UTC)
Received: from javelin (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QCXo3g019635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 08:33:53 -0400
Date: Wed, 26 Oct 2016 18:03:49 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-UT0Xj9YyyHzbO=69HDwVkOYeqPo7K9S+Ja0U7E4KZFg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610261749330.346@wniryva>
References: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-UT0Xj9YyyHzbO=69HDwVkOYeqPo7K9S+Ja0U7E4KZFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 26 Oct 2016 12:33:55 +0000 (UTC)
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
X-TUID: tDkLtknDrXGW

  Hello,

+-- On Tue, 25 Oct 2016, Peter Maydell wrote --+
| >          case 2: /* Packet Number Register */
| > -            s->packet_num = value;
| > +            s->packet_num = value & (NUM_PACKETS - 1);
| 
| The data sheet says that there are 6 valid bits in the
| packet number register, not 3, which suggests masking to
| NUM_PACKETS-1 here isn't the right thing.

  NUM_PACKETS macro is used at most places to limit access into 'data' array.
 
| Q: what about attempts to use packet numbers that have not
| been allocated by the 91c111's MMU ?

  Added 'n & s->allocated' in patch v2.

| In any case, rather than doing this check on p I would
| suggest that we should do:
| 
|                 p = s->ptr;
|                 if (s->ptr & 0x4000) {
|                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
|                 } else {
|                     p += (offset & 3);
|                 }
|                 p &= 0x7ff;
| 
| (ie move the mask operation down a bit), which will ensure p is
| always within bounds. Ditto in read code.

  Done in patch v2.


| > +                return 0x80;
| 
| Why 0x80 ?

  Changed it to 0.
 
| There's also an access to s->data[] in smc91c111_do_tx() which needs
| some kind of guard.

  Rotuine 'smc91c111_queue_tx' which calls 'smc91c111_do_tx' has a guard in 
place before calling _do_tx,

    static void smc91c111_queue_tx(smc91c111_state *s, int packet)
    {   
        if (s->tx_fifo_len == NUM_PACKETS)
            return;
        s->tx_fifo[s->tx_fifo_len++] = packet;
        smc91c111_do_tx(s);
    }    
 
| smc91c111_release_packet() also assumes the packet number it
| is passed is sane.

  It seems to have check in place for s->allocated which checks if given 
packet number is allocated.

| Do we need to guard against bad packet numbers in incoming
| VMState data? The answer is no if we're using the "always
| check packet_num at point of use" approach, but yes if you're
| trying to ensure s->packet_num is always a valid value.

  IMO second is better.
 
| Do we need to sanitize s->allocated in incoming vmstate data?

  Not sure. It does not seem to be set by user.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
