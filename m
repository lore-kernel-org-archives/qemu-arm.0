Received: by 10.25.21.156 with SMTP id 28csp282381lfv;
        Wed, 24 Aug 2016 04:45:29 -0700 (PDT)
X-Received: by 10.55.58.70 with SMTP id h67mr2877710qka.215.1472039129281;
        Wed, 24 Aug 2016 04:45:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w7si6033693qka.156.2016.08.24.04.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 04:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcWca-0003hh-O4
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 07:45:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bcWcX-0003ha-KU
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bcWcU-0002iu-Gn
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:45:25 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:58493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bcWcU-0002ij-86; Wed, 24 Aug 2016 07:45:22 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u7OBjGcn001813;
	Wed, 24 Aug 2016 07:45:16 -0400
Date: Wed, 24 Aug 2016 07:45:15 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <2076948386.5196666.1472039115921.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA9EkuHT4uV8RS1-ZaJBWWNrs87sGkmvhw0MfWGcAg4eoQ@mail.gmail.com>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824083457.GA2032@work-vm>
	<CAGn-Tghj6gSgqD1s3ynb0zfodNwruhvMqK-P=7p0jvYVJc4ykQ@mail.gmail.com>
	<CAFEAcA9EkuHT4uV8RS1-ZaJBWWNrs87sGkmvhw0MfWGcAg4eoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Improve buffer_is_zero
Thread-Index: YmIR2FKAZ36ekBstXNwnDApifNIGvQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Liang Li <liang.z.li@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Adam Richter <adamrichter4@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXrrriXPpl1V


> On 24 August 2016 at 11:26, Adam Richter <adamrichter4@gmail.com> wrote:
> > I hope that that consideration, combined with the micro-costs to
> > readability and portability of using and ELF specific and perhaps
> > currently GCC specific feature might tip the balance against the
> > savings of a level of function call indirection that I assume the use
> > of ifunc was intended to provide.
> 
> It doesn't actually save a level of indirection -- if you single step
> through an ifunc call it goes via some ELF section. The thing it
> does save is that you don't pay the cost of figuring out the right
> ifunc to use on this system at startup, but only when the ifunc call
> path is first used. That's useful for a big thing like glibc which
> might have lots of ifuncs and not want to pay a big startup cost,
> but for QEMU there's really no need given we only have one...

It does save a level of indirection after the first call AFAIK, but
it shouldn't be measurable.

Paolo
