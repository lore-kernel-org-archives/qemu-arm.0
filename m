Received: by 10.182.158.201 with SMTP id ww9csp484982obb;
        Thu, 10 Dec 2015 05:42:33 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr6819790qhc.43.1449754953084;
        Thu, 10 Dec 2015 05:42:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124si14823723qha.64.2015.12.10.05.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 05:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a71UO-0001R3-Py
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 08:42:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a71Td-0000TK-U6
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 08:41:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a71TZ-0006c6-7t
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 08:41:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a71TP-0006Zh-2J; Thu, 10 Dec 2015 08:41:31 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 69937347DBB;
	Thu, 10 Dec 2015 13:41:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBADfSZx016857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 08:41:29 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 628F8303F916; Thu, 10 Dec 2015 14:41:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<5669589E.4050904@redhat.com> <87egeufptk.fsf@blackfin.pond.sub.org>
Date: Thu, 10 Dec 2015 14:41:27 +0100
In-Reply-To: <87egeufptk.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Thu, 10 Dec 2015 13:31:03 +0100")
Message-ID: <87zixia0ag.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
X-TUID: MTdD8JuzANI8

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> On 10/12/2015 11:19, Markus Armbruster wrote:
>>> +    object_property_set_int(OBJECT(cpu), ZYNQ_BOARD_MIDR, "midr",
>>> + &error_fatal);object_property_set_int(OBJECT(cpu),
>>> + MPCORE_PERIPHBASE,
>>> + "reset-cbar",
>>> + &error_fatal);object_property_set_bool(OBJECT(cpu),
>>> + true,
>>> + "realized",
>>> + &error_fatal);
>>
>> Something went wrong here. :)
>
> Once again I demonstrate incompetence at proofreading my own patches %-}
>
> No idea what happened.  I'll fix it.

Coccinelle bug.  If I append '//' to the relevant line in the semantic
patch, I get

+                            &error_fatal);//object_property_set_int(OBJECT(cpu),

Oopsie :)

[...]
