Received: by 10.25.208.211 with SMTP id h202csp2516963lfg;
        Wed, 9 Mar 2016 06:07:34 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr43501381qka.96.1457532452509;
        Wed, 09 Mar 2016 06:07:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si8076022qhb.22.2016.03.09.06.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Mar 2016 06:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adelv-0003WX-Vl
	for alex.bennee@linaro.org; Wed, 09 Mar 2016 09:07:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adelu-0003WR-Jo
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:07:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adelt-00049I-Hr
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:07:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1adelt-00048w-CW; Wed, 09 Mar 2016 09:07:29 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1AE89AA0B0;
	Wed,  9 Mar 2016 14:07:29 +0000 (UTC)
Received: from [10.36.112.60] (ovpn-112-60.ams2.redhat.com [10.36.112.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u29E7PAU006079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 Mar 2016 09:07:26 -0500
To: Laszlo Ersek <lersek@redhat.com>,
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
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56E02E1C.2090207@redhat.com>
Date: Wed, 9 Mar 2016 15:07:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E02DCD.5060008@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
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
X-TUID: kZeOYwAkZD6I



On 09/03/2016 15:06, Laszlo Ersek wrote:
> However: despite reusing the core SMM code identically in the guest,
> there is at least one stark behavioral difference: in QEMU the SMI is
> raised only on the processor that triggers it. This exercises paths in
> the core SMM code where processors have to count down timeouts and bring
> each other in, and these busy loops are very visible to an interactive
> user in certain circumstances.

Right, and that's unfortunately something that's hard to change because
SeaBIOS relies on it. :((

Paolo
