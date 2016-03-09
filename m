Received: by 10.25.208.211 with SMTP id h202csp2524670lfg;
        Wed, 9 Mar 2016 06:21:23 -0800 (PST)
X-Received: by 10.140.41.164 with SMTP id z33mr42517042qgz.78.1457533282969;
        Wed, 09 Mar 2016 06:21:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si8088048qhi.95.2016.03.09.06.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Mar 2016 06:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adezK-0008M7-Fe
	for alex.bennee@linaro.org; Wed, 09 Mar 2016 09:21:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1adezD-0008Lj-57
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1adez8-00089U-2e
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:21:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1adez7-00089Q-TN; Wed, 09 Mar 2016 09:21:10 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 72AD6AA46E;
	Wed,  9 Mar 2016 14:21:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-29.phx2.redhat.com
	[10.3.113.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u29EL7Jb018823; Wed, 9 Mar 2016 09:21:07 -0500
To: Paolo Bonzini <pbonzini@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
	<56DEC860.1060707@redhat.com>
	<CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
	<56DECE5F.6000207@redhat.com> <56E02DCD.5060008@redhat.com>
	<56E02E1C.2090207@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56E03152.9060003@redhat.com>
Date: Wed, 9 Mar 2016 15:21:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E02E1C.2090207@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] virt: provide secure-only
 RAM and first flash
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
X-TUID: hRy1FEmgSw42

On 03/09/16 15:07, Paolo Bonzini wrote:
> 
> 
> On 09/03/2016 15:06, Laszlo Ersek wrote:
>> However: despite reusing the core SMM code identically in the guest,
>> there is at least one stark behavioral difference: in QEMU the SMI is
>> raised only on the processor that triggers it. This exercises paths in
>> the core SMM code where processors have to count down timeouts and bring
>> each other in, and these busy loops are very visible to an interactive
>> user in certain circumstances.
> 
> Right, and that's unfortunately something that's hard to change because
> SeaBIOS relies on it. :((

I recall (and am still thankful for) the relevant patch receiving the
due attention and investigation on the list, so I'm not bitter about it
or anything.

Just a bit worried about users asking about the animation :)

Laszlo

