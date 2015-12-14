Received: by 10.182.158.201 with SMTP id ww9csp1879206obb;
        Mon, 14 Dec 2015 08:55:49 -0800 (PST)
X-Received: by 10.55.23.170 with SMTP id 42mr18118380qkx.64.1450112149783;
        Mon, 14 Dec 2015 08:55:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n36si35666668qgn.11.2015.12.14.08.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Dec 2015 08:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8WPd-0000VX-Co
	for alex.bennee@linaro.org; Mon, 14 Dec 2015 11:55:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1a8WPb-0000VS-K9
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 11:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1a8WPW-0002IF-AS
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 11:55:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1a8WPV-0002I6-Iv; Mon, 14 Dec 2015 11:55:41 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 9CEEB19CB96;
	Mon, 14 Dec 2015 16:55:40 +0000 (UTC)
Received: from localhost (ovpn-113-66.phx2.redhat.com [10.3.113.66])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBEGtc2n017269; Mon, 14 Dec 2015 11:55:39 -0500
Date: Mon, 14 Dec 2015 14:55:37 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20151214165537.GB3774@thinpad.lan.raisama.net>
References: <1449764955-10741-1-git-send-email-armbru@redhat.com>
	<1449764955-10741-2-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449764955-10741-2-git-send-email-armbru@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/2] Use error_fatal to simplify obvious
	fatal errors
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
X-TUID: NoZXno+J++gy

On Thu, Dec 10, 2015 at 05:29:14PM +0100, Markus Armbruster wrote:
> Done with this admittedly crude Coccinelle semantic patch:
> 

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

You can rewrite the semantic patch as:

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


Coccinelle seems to have some magic to make "LIST," also match
with an empty list.

>     @@
>     identifier FUN;
>     expression ERR, EC;
>     @@
>     -    FUN(&ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    FUN(&error_fatal);
>     @@
>     identifier FUN;
>     expression ARG1, ERR, EC;
>     @@
>     -    FUN(ARG1, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    FUN(ARG1, &error_fatal);
>     @@
>     identifier FUN;
>     expression ARG1, ARG2, ERR, EC;
>     @@
>     -    FUN(ARG1, ARG2, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    FUN(ARG1, ARG2, &error_fatal);
>     @@
>     identifier FUN;
>     expression ARG1, ARG2, ARG3, ERR, EC;
>     @@
>     -    FUN(ARG1, ARG2, ARG3, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    FUN(ARG1, ARG2, ARG3, &error_fatal);
>     @@
>     identifier FUN;
>     expression RET, ERR, EC;
>     @@
>     -    RET = FUN(&ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    RET = FUN(&error_fatal);
>     @@
>     identifier FUN;
>     expression RET, ARG1, ERR, EC;
>     @@
>     -    RET = FUN(ARG1, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    RET = FUN(ARG1, &error_fatal);
>     @@
>     identifier FUN;
>     expression RET, ARG1, ARG2, ERR, EC;
>     @@
>     -    RET = FUN(ARG1, ARG2, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    RET = FUN(ARG1, ARG2, &error_fatal);
>     @@
>     identifier FUN;
>     expression RET, ARG1, ARG2, ARG3, ERR, EC;
>     @@
>     -    RET = FUN(ARG1, ARG2, ARG3, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
>     @@
>     type T;
>     identifier FUN, RET;
>     expression ERR, EC;
>     @@
>     -    T RET = FUN(&ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    T RET = FUN(&error_fatal);
>     @@
>     type T;
>     identifier FUN, RET;
>     expression ARG1, ERR, EC;
>     @@
>     -    T RET = FUN(ARG1, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    T RET = FUN(ARG1, &error_fatal);
>     @@
>     type T;
>     identifier FUN, RET;
>     expression ARG1, ARG2, ERR, EC;
>     @@
>     -    T RET = FUN(ARG1, ARG2, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    T RET = FUN(ARG1, ARG2, &error_fatal);
>     @@
>     type T;
>     identifier FUN, RET;
>     expression ARG1, ARG2, ARG3, ERR, EC;
>     @@
>     -    T RET = FUN(ARG1, ARG2, ARG3, &ERR);
>     -    if (ERR != NULL) {
>     -        error_report_err(ERR);
>     -        exit(EC);
>     -    }
>     +    T RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
> 
> This leaves dead Error * variables behind, cleaned up manually.
> 

-- 
Eduardo
