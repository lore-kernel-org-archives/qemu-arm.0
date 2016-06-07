Received: by 10.25.27.66 with SMTP id b63csp1988633lfb;
        Tue, 7 Jun 2016 05:49:05 -0700 (PDT)
X-Received: by 10.237.35.152 with SMTP id j24mr20899161qtc.95.1465303744938;
        Tue, 07 Jun 2016 05:49:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si13920413qgf.111.2016.06.07.05.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 05:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAGRM-00070W-8q
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 08:49:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAGFv-0005Mt-P0
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAGFq-0006pd-1T
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:37:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bAGFl-0006oi-Ef; Tue, 07 Jun 2016 08:37:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E657A80E47;
	Tue,  7 Jun 2016 12:37:04 +0000 (UTC)
Received: from [10.36.112.45] (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57Catcd001482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2016 08:36:57 -0400
To: Igor Mammedov <imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
	<934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
	<20160607143244.2d4ddb81@nial.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5d059ff5-dadb-8f90-deb0-b864bb50ee87@redhat.com>
Date: Tue, 7 Jun 2016 14:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160607143244.2d4ddb81@nial.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 Jun 2016 12:37:04 +0000 (UTC)
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
X-TUID: FYVopjEuytnO



On 07/06/2016 14:32, Igor Mammedov wrote:
>> > Could you detect using +foo together with foo=off, and -foo together
>> > with foo=on?  Those are the really problematic cases, without them +foo
>> > and -foo can become synonyms for =on and =off.
> That's (legacy)current semantic of -cpu +-foo where it overrides any foo=x,
> potentially it's possible to track foo=x locally in parser
> and then compare with +-foo both ways.
> But all we can do currently is to print warning about such use case.
> 
> I think Eduardo's suggestion to just warn that +-foo is obsolete for now
> and drop support for it in several releases is sufficient(good) enough.

kvm-unit-tests and libvirt both use it, especially because =on and =off
are relatively new I think?  It seems like it's really widespread.

Paolo
