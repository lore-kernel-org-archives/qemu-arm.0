Received: by 10.182.105.169 with SMTP id gn9csp1074906obb;
        Mon, 9 Nov 2015 02:24:07 -0800 (PST)
X-Received: by 10.55.15.204 with SMTP id 73mr29553295qkp.60.1447064647698;
        Mon, 09 Nov 2015 02:24:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r95si10517259qkh.81.2015.11.09.02.24.07
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 09 Nov 2015 02:24:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvjcN-0005It-B8
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 05:24:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZvjaG-0002Ix-1f
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 05:21:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZvjaF-0001B6-5m
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 05:21:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zvja7-0001AP-Lg; Mon, 09 Nov 2015 05:21:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3F740C0AAB2E;
	Mon,  9 Nov 2015 10:21:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA9ALjRn016627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 9 Nov 2015 05:21:46 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D365D303F90E; Mon,  9 Nov 2015 11:21:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
Date: Mon, 09 Nov 2015 11:21:44 +0100
In-Reply-To: <CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	(Peter Maydell's message of "Mon, 9 Nov 2015 10:01:12 +0000")
Message-ID: <87oaf3jww7.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: error_report cleanups
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
X-TUID: 2/FjcheU+140

Peter Maydell <peter.maydell@linaro.org> writes:

> On 9 November 2015 at 07:44, Markus Armbruster <armbru@redhat.com> wrote:
>> For consistency, error messages should be a phrase, not a full sentence,
>> let alone a paraphraph.
>
> This is in direct conflict with wanting them to be actually useful
> to users :-(

I appreciate your drive for useful error messages.  Judging from the
error messages we got, it's a rare thing.

Let me rephrase.  The error message proper (the thing emitted by
error_report()) should be a phrase, and it should be short and to the
point.  It can be followed by hints.  Compare:

    qemu-system-arm: Unable to determine GIC version supported by host. KVM acceleration is probably not supported.

and

    qemu-system-arm: Unable to determine GIC version supported by host
    KVM acceleration is probably not supported

I prefer the latter.  The error message proper is short and to the
point.  The hint points to the most probable cause.  Sensible line
lengths.

By the way, the error.h API supports this message + hints convention
since commit 50b7b00.
