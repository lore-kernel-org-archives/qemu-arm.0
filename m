Received: by 10.25.208.211 with SMTP id h202csp1895206lfg;
        Tue, 8 Mar 2016 04:15:01 -0800 (PST)
X-Received: by 10.140.156.138 with SMTP id c132mr37210428qhc.96.1457439301521;
        Tue, 08 Mar 2016 04:15:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s51si2671605qge.104.2016.03.08.04.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adGXV-0004k3-0W
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:15:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adGXN-0004hV-L6
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:14:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adGXI-0006CV-Hf
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:14:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1adGXI-0006CQ-Bk; Tue, 08 Mar 2016 07:14:48 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 003A26540A;
	Tue,  8 Mar 2016 12:14:48 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28CEijD007761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Mar 2016 07:14:46 -0500
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56DEC234.70907@redhat.com>
Date: Tue, 8 Mar 2016 13:14:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 08 Mar 2016 12:14:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
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
X-TUID: SHpvYSLa7+Sh



On 08/03/2016 13:13, Ard Biesheuvel wrote:
> > As far as this QEMU port is concerned, having some flash in secure and
> > some in non-secure is going to be useful regardless, and 64 MB is
> > plenty for both the code and the data. So if users of the Trustzone
> > port (which is disjoint from the KVM port in any case) can tolerate
> > having the code and the variables in the same pflash file, I could
> > simply move the code into the second flash, and we could reserve the
> > first flash for secure (so it sits at physical address 0x0
>
> Uhm, actually, the code is not even in the flash to begin with. So
> having the second bank be non-secure only makes perfect sense imo

Interesting, where is the code?

Paolo
