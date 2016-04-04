Received: by 10.25.208.211 with SMTP id h202csp31157lfg;
        Mon, 4 Apr 2016 12:37:35 -0700 (PDT)
X-Received: by 10.55.212.132 with SMTP id s4mr35966364qks.78.1459798654956;
        Mon, 04 Apr 2016 12:37:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e60si23366138qga.128.2016.04.04.12.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 12:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anAJa-0003AA-Ca
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 15:37:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1anAJX-0003A3-PL
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1anAJT-0006Kb-Qn
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:37:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1anAJT-0006KU-LF; Mon, 04 Apr 2016 15:37:27 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3BCC627F5;
	Mon,  4 Apr 2016 19:37:25 +0000 (UTC)
Received: from localhost (vpn1-5-40.gru2.redhat.com [10.97.5.40])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u34JbN8g013132; Mon, 4 Apr 2016 15:37:24 -0400
Date: Mon, 4 Apr 2016 16:37:23 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160404193723.GD22665@thinpad.lan.raisama.net>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A3D1.2050402@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
	<CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Apr 2016 19:37:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: jFe9EDU9eKSH

On Mon, Apr 04, 2016 at 02:31:47PM +0100, Peter Maydell wrote:
> On 4 April 2016 at 14:21, Aleksandar Markovic
> <Aleksandar.Markovic@imgtec.com> wrote:
> > B. arm - explicitely sets other fields of float_status,
> >       explicit invocation of set_snan_bit_is_one(0) added
> 
> We zero the float_status structs on reset, because they are earlier
> in the CPUARMState structure than the 'features' field (and so the
> memset() in arm_cpu_reset() will clear them). So you don't
> need to explicitly zero a field like this. I expect the other
> architectures are the same.

Even if it is not zeroed on reset, it is zeroed on object_new().
Isn't that enough?

-- 
Eduardo
