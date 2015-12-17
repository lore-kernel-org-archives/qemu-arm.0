Received: by 10.182.158.201 with SMTP id ww9csp198106obb;
        Wed, 16 Dec 2015 23:03:38 -0800 (PST)
X-Received: by 10.28.91.9 with SMTP id p9mr1894710wmb.18.1450335818334;
        Wed, 16 Dec 2015 23:03:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
Received: from socrates.bennee.com (static.88-198-71-155.clients.your-server.de. [88.198.71.155])
        by mx.google.com with ESMTPS id de6si15261281wjc.21.2015.12.16.23.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2015 23:03:38 -0800 (PST)
Received-SPF: fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) client-ip=88.198.71.155;
Authentication-Results: mx.google.com;
       spf=fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) smtp.mailfrom=qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Received: from lists.gnu.org ([208.118.235.17])
	by socrates.bennee.com with esmtp (Exim 4.84)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1a9SbA-0002Ae-Jz
	for kernel-hacker@bennee.com; Thu, 17 Dec 2015 08:03:37 +0100
Received: from localhost ([::1]:51092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1a9Sb4-0007Ga-ET
	for kernel-hacker@bennee.com; Thu, 17 Dec 2015 02:03:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9SaF-0006Xv-B9
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 02:02:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9SaE-0006vG-BD
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 02:02:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9Sa8-0006uc-VO; Thu, 17 Dec 2015 02:02:33 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 111B08F4F1;
	Thu, 17 Dec 2015 07:02:31 +0000 (UTC)
Received: from blackfin.pond.sub.org ([10.3.113.12])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBH72UsQ032050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Dec 2015 02:02:31 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7F454303F81B; Thu, 17 Dec 2015 08:02:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-7-git-send-email-armbru@redhat.com>
	<CAFEAcA9-7+2MOh8=c3+RsE8x2kkOwJzLapTAR+CpRtq=RP8SiQ@mail.gmail.com>
Date: Thu, 17 Dec 2015 08:02:29 +0100
In-Reply-To: <CAFEAcA9-7+2MOh8=c3+RsE8x2kkOwJzLapTAR+CpRtq=RP8SiQ@mail.gmail.com>
	(Peter Maydell's message of "Tue, 15 Dec 2015 11:38:47 +0000")
Message-ID: <8760zx4kxm.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
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
Errors-To: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Sender: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-SA-Exim-Connect-IP: 208.118.235.17
X-SA-Exim-Mail-From: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on socrates.bennee.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,T_HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Subject: Re: [Qemu-devel] [PATCH 06/12] hw/arm/virt: Fix property
	"gic-version" error handling
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on socrates.bennee.com)
X-TUID: TLk6uqGdqHAA

Peter Maydell <peter.maydell@linaro.org> writes:

> On 10 December 2015 at 10:29, Markus Armbruster <armbru@redhat.com> wrote:
>> virt_set_gic_version() calls exit(1) when passed an invalid property
>> value.  Property setters are not supposed to do that.  Screwed up in
>> commit b92ad39.  Harmless, because the property belongs to a machine.
>> Set an error object instead.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/arm/virt.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9c6792c..2a120dd 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1126,9 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>>      } else if (!strcmp(value, "host")) {
>>          vms->gic_version = 0; /* Will probe later */
>>      } else {
>> -        error_report("Invalid gic-version option value");
>> -        error_printf("Allowed gic-version values are: 3, 2, host\n");
>> -        exit(1);
>> +        error_setg(errp, "Invalid gic-version value");
>> +        error_append_hint(errp, "Valid values are: 3, 2, host\n");
>>      }
>
> Should hint strings have trailing newlines?

Two answers:

1. No, because error_report_err() prints the hint followed by a newline.

2. Yes, because error_appent_hint() accumulates, and requiring its users
to know which call will be the final one is an awkward interface.

I'll change error_report_err() and improve the documentation.

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!
