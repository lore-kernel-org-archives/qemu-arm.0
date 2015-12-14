Received: by 10.182.158.201 with SMTP id ww9csp1966352obb;
        Mon, 14 Dec 2015 11:25:47 -0800 (PST)
X-Received: by 10.140.99.86 with SMTP id p80mr44047534qge.97.1450121147768;
        Mon, 14 Dec 2015 11:25:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si36086663qhb.108.2015.12.14.11.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Dec 2015 11:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8Ykl-0003RN-DO
	for alex.bennee@linaro.org; Mon, 14 Dec 2015 14:25:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a8Yki-0003Qy-9w
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 14:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a8Yke-0007nD-AH
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 14:25:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a8Yke-0007n8-4t; Mon, 14 Dec 2015 14:25:40 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 770FA8E763;
	Mon, 14 Dec 2015 19:25:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-78.phx2.redhat.com
	[10.3.113.78])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBEJPbog001825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 14 Dec 2015 14:25:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CA8E7303F81B; Mon, 14 Dec 2015 20:25:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1449764955-10741-1-git-send-email-armbru@redhat.com>
	<1449764955-10741-2-git-send-email-armbru@redhat.com>
	<20151214165537.GB3774@thinpad.lan.raisama.net>
Date: Mon, 14 Dec 2015 20:25:36 +0100
In-Reply-To: <20151214165537.GB3774@thinpad.lan.raisama.net> (Eduardo
	Habkost's message of "Mon, 14 Dec 2015 14:55:37 -0200")
Message-ID: <87h9jkltn3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
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
X-TUID: ZXjMWUfnkAUU

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Dec 10, 2015 at 05:29:14PM +0100, Markus Armbruster wrote:
>> Done with this admittedly crude Coccinelle semantic patch:
>> 
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> You can rewrite the semantic patch as:
>
>     @@
>     type T;
>     identifier FUN, RET;
>     expression list ARGS;
>     expression ERR, EC;
>     @@
>     (
>     -    T RET = FUN(ARGS, &ERR);
>     +    T RET = FUN(ARGS, &error_fatal);
>     |
>     -    RET = FUN(ARGS, &ERR);
>     +    RET = FUN(ARGS, &error_fatal);
>     |
>     -    FUN(ARGS, &ERR);
>     +    FUN(ARGS, &error_fatal);
>     )
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>
>
> Coccinelle seems to have some magic to make "LIST," also match
> with an empty list.

Same output as my script, except it doesn't mess up zynq_init().  Sold!
