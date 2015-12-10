Received: by 10.182.158.201 with SMTP id ww9csp518417obb;
        Thu, 10 Dec 2015 06:33:04 -0800 (PST)
X-Received: by 10.140.169.130 with SMTP id p124mr6972208qhp.50.1449757984075;
        Thu, 10 Dec 2015 06:33:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q64si15027135qha.51.2015.12.10.06.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 06:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a72HH-00054c-HI
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 09:33:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a72HF-00054Q-PF
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 09:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a72HB-0006cQ-PV
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 09:33:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a72HB-0006cK-K8; Thu, 10 Dec 2015 09:32:57 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 194ED3356A2;
	Thu, 10 Dec 2015 14:32:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAEWsRM008732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 09:32:56 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 22B0F303F916; Thu, 10 Dec 2015 15:32:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<566962E3.4000409@gmail.com> <878u52fpn1.fsf@blackfin.pond.sub.org>
	<56698521.3040707@redhat.com>
Date: Thu, 10 Dec 2015 15:32:54 +0100
In-Reply-To: <56698521.3040707@redhat.com> (Marcel Apfelbaum's message of
	"Thu, 10 Dec 2015 15:58:57 +0200")
Message-ID: <87lh928jc9.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Use error_fatal to simplify
	obvious fatal errors
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
X-TUID: o7YMesi/pC7R

Marcel Apfelbaum <marcel@redhat.com> writes:

> On 12/10/2015 02:34 PM, Markus Armbruster wrote:
>> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> writes:
>>
>>> On 12/10/2015 12:19 PM, Markus Armbruster wrote:
>>>> Done with this admittedly crude Coccinelle semantic patch with manual
>>>> burial of dead Error * variables squashed in:
[...]
>>>
>>> That's so cool!
>>
>> I'm afraid my sledgehammer approach to Coccinelle would make its
>> inventors wince...
>>
>>> Isn't it the time to have our own Coccinelle directory
>>> with scripts like this?
>>
>> Could do that if there's interest.
>>
>>>                          And to make them part of make check?
>>
>> I'm afraid that's not practical.  spatch solves a difficult problem, and
>> takes its own sweet time to do it.
>
> So it takes a long time to run. We could make it depend on an
> environment variable,
> so at least the maintainers will run it :)
>
> My point is, now we *could* have a guarantee that if anyone uses the old
> way, we can catch it in time. It can be easily lost in the review process.

In my experience, to reduce recurrence of an unwanted code pattern, you
first need to get rid of the bad examples in the tree.  Without that,
it's basically futile.

For the ones that keep coming back, further steps may be in order, such
as making checkpatch complain.

> Anyway, it was only a thought.

It's not without merit.

>>> Is a pity to have them lost into a git comment...
