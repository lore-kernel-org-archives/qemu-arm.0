Received: by 10.182.158.201 with SMTP id ww9csp494744obb;
        Thu, 10 Dec 2015 05:59:44 -0800 (PST)
X-Received: by 10.140.29.33 with SMTP id a30mr14758108qga.88.1449755983981;
        Thu, 10 Dec 2015 05:59:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si14968373qgg.15.2015.12.10.05.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 05:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a71l1-0001d2-Pa
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 08:59:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1a71kb-0001Lw-Ps
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 08:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1a71kX-0003aj-2i
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 08:59:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1a71kN-0003Z6-70; Thu, 10 Dec 2015 08:59:03 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 3530042E5D6;
	Thu, 10 Dec 2015 13:59:02 +0000 (UTC)
Received: from [10.36.7.50] (vpn1-7-50.ams2.redhat.com [10.36.7.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBADww8K011295; Thu, 10 Dec 2015 08:58:59 -0500
To: Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<566962E3.4000409@gmail.com> <878u52fpn1.fsf@blackfin.pond.sub.org>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <56698521.3040707@redhat.com>
Date: Thu, 10 Dec 2015 15:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <878u52fpn1.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Use error_fatal to simplify obvious fatal
 errors
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jWhEVzHGBdSd

On 12/10/2015 02:34 PM, Markus Armbruster wrote:
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> writes:
>
>> On 12/10/2015 12:19 PM, Markus Armbruster wrote:
>>> Done with this admittedly crude Coccinelle semantic patch with manual
>>> burial of dead Error * variables squashed in:
>>>
>>>       @@
>>>       identifier FUN;
>>>       expression ERR, EC;
>>>       @@
>>>       -    FUN(&ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    FUN(&error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression ARG1, ERR, EC;
>>>       @@
>>>       -    FUN(ARG1, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    FUN(ARG1, &error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression ARG1, ARG2, ERR, EC;
>>>       @@
>>>       -    FUN(ARG1, ARG2, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    FUN(ARG1, ARG2, &error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression ARG1, ARG2, ARG3, ERR, EC;
>>>       @@
>>>       -    FUN(ARG1, ARG2, ARG3, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    FUN(ARG1, ARG2, ARG3, &error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression RET, ERR, EC;
>>>       @@
>>>       -    RET = FUN(&ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    RET = FUN(&error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression RET, ARG1, ERR, EC;
>>>       @@
>>>       -    RET = FUN(ARG1, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    RET = FUN(ARG1, &error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression RET, ARG1, ARG2, ERR, EC;
>>>       @@
>>>       -    RET = FUN(ARG1, ARG2, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    RET = FUN(ARG1, ARG2, &error_fatal);
>>>       @@
>>>       identifier FUN;
>>>       expression RET, ARG1, ARG2, ARG3, ERR, EC;
>>>       @@
>>>       -    RET = FUN(ARG1, ARG2, ARG3, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
>>>       @@
>>>       type T;
>>>       identifier FUN, RET;
>>>       expression ERR, EC;
>>>       @@
>>>       -    T RET = FUN(&ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    T RET = FUN(&error_fatal);
>>>       @@
>>>       type T;
>>>       identifier FUN, RET;
>>>       expression ARG1, ERR, EC;
>>>       @@
>>>       -    T RET = FUN(ARG1, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    T RET = FUN(ARG1, &error_fatal);
>>>       @@
>>>       type T;
>>>       identifier FUN, RET;
>>>       expression ARG1, ARG2, ERR, EC;
>>>       @@
>>>       -    T RET = FUN(ARG1, ARG2, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    T RET = FUN(ARG1, ARG2, &error_fatal);
>>>       @@
>>>       type T;
>>>       identifier FUN, RET;
>>>       expression ARG1, ARG2, ARG3, ERR, EC;
>>>       @@
>>>       -    T RET = FUN(ARG1, ARG2, ARG3, &ERR);
>>>       -    if (ERR != NULL) {
>>>       -        error_report_err(ERR);
>>>       -        exit(EC);
>>>       -    }
>>>       +    T RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
>>>
>>
>> That's so cool!
>
> I'm afraid my sledgehammer approach to Coccinelle would make its
> inventors wince...
>
>> Isn't it the time to have our own Coccinelle directory
>> with scripts like this?
>
> Could do that if there's interest.
>
>>                          And to make them part of make check?
>
> I'm afraid that's not practical.  spatch solves a difficult problem, and
> takes its own sweet time to do it.

So it takes a long time to run. We could make it depend on an environment variable,
so at least the maintainers will run it :)

My point is, now we *could* have a guarantee that if anyone uses the old
way, we can catch it in time. It can be easily lost in the review process.

Anyway, it was only a thought.
Thanks,
Marcel


>
>> Is a pity to have them lost into a git comment...

