Received: by 10.182.158.201 with SMTP id ww9csp2981085obb;
        Tue, 15 Dec 2015 23:43:25 -0800 (PST)
X-Received: by 10.140.88.51 with SMTP id s48mr33426691qgd.48.1450251805882;
        Tue, 15 Dec 2015 23:43:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j20si5452758qhc.31.2015.12.15.23.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 23:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a96k9-0002Oo-D8
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 02:43:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a96k7-0002Of-G4
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 02:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a96k4-0002Ku-9L
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 02:43:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a96k4-0002Kq-3E; Wed, 16 Dec 2015 02:43:20 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 298268CF5D;
	Wed, 16 Dec 2015 07:43:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-49.phx2.redhat.com
	[10.3.113.49])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBG7hGpX028499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 16 Dec 2015 02:43:18 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 17DE6303F81B; Wed, 16 Dec 2015 08:43:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449764955-10741-1-git-send-email-armbru@redhat.com>
	<1449764955-10741-2-git-send-email-armbru@redhat.com>
	<20151214165537.GB3774@thinpad.lan.raisama.net>
	<87h9jkltn3.fsf@blackfin.pond.sub.org>
	<CAFEAcA-2JmYmb4mvXb=LPwN=-RzT4nBV91gDAMyJ1wK1q1YcMQ@mail.gmail.com>
Date: Wed, 16 Dec 2015 08:43:16 +0100
In-Reply-To: <CAFEAcA-2JmYmb4mvXb=LPwN=-RzT4nBV91gDAMyJ1wK1q1YcMQ@mail.gmail.com>
	(Peter Maydell's message of "Tue, 15 Dec 2015 18:41:44 +0000")
Message-ID: <87bn9q4z57.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] Use error_fatal to
	simplify obvious fatal errors
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
X-TUID: UFn2O1r/SOnA

Peter Maydell <peter.maydell@linaro.org> writes:

> On 14 December 2015 at 19:25, Markus Armbruster <armbru@redhat.com> wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>
>>> On Thu, Dec 10, 2015 at 05:29:14PM +0100, Markus Armbruster wrote:
>>>> Done with this admittedly crude Coccinelle semantic patch:
>>>>
>>>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> You can rewrite the semantic patch as:
> [...]
>>> Coccinelle seems to have some magic to make "LIST," also match
>>> with an empty list.
>>
>> Same output as my script, except it doesn't mess up zynq_init().  Sold!
>
> Do you mean by this that you're planning to send a v3, or would you
> like me to apply v2 to target-arm.next?

I only changed PATCH 1's commit message since v2 (current version
appended).  I plan to include the series in a pull request in my role as
error reporting maintainer, but I don't mind "losing" patches to other
maintainers on the way.


Use error_fatal to simplify obvious fatal errors

Done with this Coccinelle semantic patch:

    @@
    type T;
    identifier FUN, RET;
    expression list ARGS;
    expression ERR, EC;
    @@
    (
    -    T RET = FUN(ARGS, &ERR);
    +    T RET = FUN(ARGS, &error_fatal);
    |
    -    RET = FUN(ARGS, &ERR);
    +    RET = FUN(ARGS, &error_fatal);
    |
    -    FUN(ARGS, &ERR);
    +    FUN(ARGS, &error_fatal);
    )
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }

This is actually a more elegant version of my initial semantic patch
by courtesy of Eduardo.

It leaves dead Error * variables behind, cleaned up manually.

Cc: qemu-arm@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
