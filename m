Received: by 10.25.27.66 with SMTP id b63csp1991874lfb;
        Tue, 7 Jun 2016 05:56:27 -0700 (PDT)
X-Received: by 10.55.134.6 with SMTP id i6mr21088762qkd.185.1465304187391;
        Tue, 07 Jun 2016 05:56:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si13954656qgi.60.2016.06.07.05.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 05:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAGYU-0005O7-Hb
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 08:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bAGWH-0003mI-RR
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:54:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bAGWG-0001uq-TK
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:54:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bAGWC-0001tB-Dc; Tue, 07 Jun 2016 08:54:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C900C3B71B;
	Tue,  7 Jun 2016 12:54:03 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57Cs1Jg016224; Tue, 7 Jun 2016 08:54:02 -0400
Date: Tue, 7 Jun 2016 14:54:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160607145400.3dcf78b8@nial.brq.redhat.com>
In-Reply-To: <5d059ff5-dadb-8f90-deb0-b864bb50ee87@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
	<934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
	<20160607143244.2d4ddb81@nial.brq.redhat.com>
	<5d059ff5-dadb-8f90-deb0-b864bb50ee87@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 Jun 2016 12:54:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 06/10] target-i386: print obsolete warnings
 if +-features are used
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBZ6+8swcrwl

On Tue, 7 Jun 2016 14:36:51 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/06/2016 14:32, Igor Mammedov wrote:
> >> > Could you detect using +foo together with foo=off, and -foo together
> >> > with foo=on?  Those are the really problematic cases, without them +foo
> >> > and -foo can become synonyms for =on and =off.  
> > That's (legacy)current semantic of -cpu +-foo where it overrides any foo=x,
> > potentially it's possible to track foo=x locally in parser
> > and then compare with +-foo both ways.
> > But all we can do currently is to print warning about such use case.
> > 
> > I think Eduardo's suggestion to just warn that +-foo is obsolete for now
> > and drop support for it in several releases is sufficient(good) enough.  
> 
> kvm-unit-tests and libvirt both use it, especially because =on and =off
> are relatively new I think?  It seems like it's really widespread.
Yep, that's why it's not removed now.
Looks like libvirt would be able to switch to foo=x syntax,
I can take a look at kvm-unit-tests and make it use foo=x too.

