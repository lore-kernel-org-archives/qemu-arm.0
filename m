Received: by 10.25.208.211 with SMTP id h202csp37619lfg;
        Mon, 4 Apr 2016 12:56:17 -0700 (PDT)
X-Received: by 10.55.24.208 with SMTP id 77mr37097060qky.45.1459799777753;
        Mon, 04 Apr 2016 12:56:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w63si23455846qgw.87.2016.04.04.12.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 12:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anAbh-0007nF-DL
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 15:56:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1anAbf-0007n5-Mn
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1anAbc-0002qX-Fq
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 15:56:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1anAbc-0002qT-7x; Mon, 04 Apr 2016 15:56:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5730F8E90F;
	Mon,  4 Apr 2016 19:56:10 +0000 (UTC)
Received: from localhost (vpn1-5-40.gru2.redhat.com [10.97.5.40])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u34Ju98d031812; Mon, 4 Apr 2016 15:56:09 -0400
Date: Mon, 4 Apr 2016 16:56:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160404195608.GA11906@thinpad.lan.raisama.net>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A3D1.2050402@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
	<CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
	<20160404193723.GD22665@thinpad.lan.raisama.net>
	<CAFEAcA9axhkDC0tDT1ujNZUpHbCnMqSxaL-KTD2=TV=XOyEbuw@mail.gmail.com>
	<20160404194236.GE22665@thinpad.lan.raisama.net>
	<CAFEAcA9vZBoqPQ8-YzRWnoQhXLwu-CJ5AJ2AyhL3qSMBJRdd=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9vZBoqPQ8-YzRWnoQhXLwu-CJ5AJ2AyhL3qSMBJRdd=Q@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
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
X-TUID: KoyvGfPq3UJW

On Mon, Apr 04, 2016 at 08:46:17PM +0100, Peter Maydell wrote:
> On 4 April 2016 at 20:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Mon, Apr 04, 2016 at 08:38:54PM +0100, Peter Maydell wrote:
> >> On 4 April 2016 at 20:37, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >> > On Mon, Apr 04, 2016 at 02:31:47PM +0100, Peter Maydell wrote:
> >> >> On 4 April 2016 at 14:21, Aleksandar Markovic
> >> >> <Aleksandar.Markovic@imgtec.com> wrote:
> >> >> > B. arm - explicitely sets other fields of float_status,
> >> >> >       explicit invocation of set_snan_bit_is_one(0) added
> >> >>
> >> >> We zero the float_status structs on reset, because they are earlier
> >> >> in the CPUARMState structure than the 'features' field (and so the
> >> >> memset() in arm_cpu_reset() will clear them). So you don't
> >> >> need to explicitly zero a field like this. I expect the other
> >> >> architectures are the same.
> >> >
> >> > Even if it is not zeroed on reset, it is zeroed on object_new().
> >> > Isn't that enough?
> >>
> >> It must be zeroed on reset, otherwise we won't get the right
> >> behaviour if you reset the CPU after running it for a bit.
> >> object_new() zeroing is not sufficient.
> >
> > The only calls to set_snan_bit_is_one() with non-zero arguments I
> > see on this patch are during CPU init or reset. How exactly would
> > the snan_bit_is_one field change to non-zero during runtime, to
> > require zeroing it again on reset?
> 
> I meant in general for these float_status flags, not anything
> specific to this particular flag.

Sorry, I misunderstood you.

I was talking about snan_bit_is_one, specifically. My point is
that all the set_snan_bit_is_one(0, ...) calls on this patch are
not necessary because object_new() already zeroed the field.

-- 
Eduardo
