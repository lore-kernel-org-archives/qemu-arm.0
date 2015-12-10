Received: by 10.182.158.201 with SMTP id ww9csp446590obb;
        Thu, 10 Dec 2015 04:35:14 -0800 (PST)
X-Received: by 10.55.42.233 with SMTP id q102mr13975312qkq.99.1449750914123;
        Thu, 10 Dec 2015 04:35:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z132si14570271qhc.32.2015.12.10.04.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 04:35:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a70RF-0008Da-Rs
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 07:35:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70R8-000884-W9
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:35:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70R4-0001M5-BA
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:35:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a70R4-0001LC-44; Thu, 10 Dec 2015 07:35:02 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B593BC0B7ABF;
	Thu, 10 Dec 2015 12:35:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBACYxLd016204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 07:35:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C0520303F916; Thu, 10 Dec 2015 13:34:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<566962E3.4000409@gmail.com>
Date: Thu, 10 Dec 2015 13:34:58 +0100
In-Reply-To: <566962E3.4000409@gmail.com> (Marcel Apfelbaum's message of "Thu, 
	10 Dec 2015 13:32:51 +0200")
Message-ID: <878u52fpn1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, marcel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
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
X-TUID: LraOTOtpd8AS

Marcel Apfelbaum <marcel.apfelbaum@gmail.com> writes:

> On 12/10/2015 12:19 PM, Markus Armbruster wrote:
>> Done with this admittedly crude Coccinelle semantic patch with manual
>> burial of dead Error * variables squashed in:
>>
>>      @@
>>      identifier FUN;
>>      expression ERR, EC;
>>      @@
>>      -    FUN(&ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    FUN(&error_fatal);
>>      @@
>>      identifier FUN;
>>      expression ARG1, ERR, EC;
>>      @@
>>      -    FUN(ARG1, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    FUN(ARG1, &error_fatal);
>>      @@
>>      identifier FUN;
>>      expression ARG1, ARG2, ERR, EC;
>>      @@
>>      -    FUN(ARG1, ARG2, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    FUN(ARG1, ARG2, &error_fatal);
>>      @@
>>      identifier FUN;
>>      expression ARG1, ARG2, ARG3, ERR, EC;
>>      @@
>>      -    FUN(ARG1, ARG2, ARG3, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    FUN(ARG1, ARG2, ARG3, &error_fatal);
>>      @@
>>      identifier FUN;
>>      expression RET, ERR, EC;
>>      @@
>>      -    RET = FUN(&ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    RET = FUN(&error_fatal);
>>      @@
>>      identifier FUN;
>>      expression RET, ARG1, ERR, EC;
>>      @@
>>      -    RET = FUN(ARG1, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    RET = FUN(ARG1, &error_fatal);
>>      @@
>>      identifier FUN;
>>      expression RET, ARG1, ARG2, ERR, EC;
>>      @@
>>      -    RET = FUN(ARG1, ARG2, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    RET = FUN(ARG1, ARG2, &error_fatal);
>>      @@
>>      identifier FUN;
>>      expression RET, ARG1, ARG2, ARG3, ERR, EC;
>>      @@
>>      -    RET = FUN(ARG1, ARG2, ARG3, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
>>      @@
>>      type T;
>>      identifier FUN, RET;
>>      expression ERR, EC;
>>      @@
>>      -    T RET = FUN(&ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    T RET = FUN(&error_fatal);
>>      @@
>>      type T;
>>      identifier FUN, RET;
>>      expression ARG1, ERR, EC;
>>      @@
>>      -    T RET = FUN(ARG1, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    T RET = FUN(ARG1, &error_fatal);
>>      @@
>>      type T;
>>      identifier FUN, RET;
>>      expression ARG1, ARG2, ERR, EC;
>>      @@
>>      -    T RET = FUN(ARG1, ARG2, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    T RET = FUN(ARG1, ARG2, &error_fatal);
>>      @@
>>      type T;
>>      identifier FUN, RET;
>>      expression ARG1, ARG2, ARG3, ERR, EC;
>>      @@
>>      -    T RET = FUN(ARG1, ARG2, ARG3, &ERR);
>>      -    if (ERR != NULL) {
>>      -        error_report_err(ERR);
>>      -        exit(EC);
>>      -    }
>>      +    T RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
>>
>
> That's so cool!

I'm afraid my sledgehammer approach to Coccinelle would make its
inventors wince...

> Isn't it the time to have our own Coccinelle directory
> with scripts like this?

Could do that if there's interest.

>                         And to make them part of make check?

I'm afraid that's not practical.  spatch solves a difficult problem, and
takes its own sweet time to do it.

> Is a pity to have them lost into a git comment...
