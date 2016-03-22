Received: by 10.25.208.211 with SMTP id h202csp2043650lfg;
        Tue, 22 Mar 2016 11:41:27 -0700 (PDT)
X-Received: by 10.140.148.134 with SMTP id 128mr51331059qhu.98.1458672087257;
        Tue, 22 Mar 2016 11:41:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si15583514qgd.75.2016.03.22.11.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 11:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiRF7-0005Gh-G1
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 14:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiRF5-0005Ga-Dl
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiRF2-0005AF-89
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:41:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiRF2-0005AA-2q; Tue, 22 Mar 2016 14:41:20 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9A0A8804F4;
	Tue, 22 Mar 2016 18:41:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MIfHhD003847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 14:41:18 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 23B44303F90D; Tue, 22 Mar 2016 19:41:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
Date: Tue, 22 Mar 2016 19:41:17 +0100
In-Reply-To: <87zitqjrhj.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Tue, 22 Mar 2016 19:29:44 +0100")
Message-ID: <87vb4eicdu.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/5] arm: qmp: add
	GICCapability struct
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
X-TUID: Zkd4YnG9JloJ

Markus Armbruster <armbru@redhat.com> writes:

> Peter Xu <peterx@redhat.com> writes:
>
>> Define new struct to describe whether we support specific GIC version.
>>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>> ---
>>  qapi-schema.json | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/qapi-schema.json b/qapi-schema.json
>> index f253a37..da9671a 100644
>> --- a/qapi-schema.json
>> +++ b/qapi-schema.json
>> @@ -4134,3 +4134,25 @@
>>  ##
>>  { 'enum': 'ReplayMode',
>>    'data': [ 'none', 'record', 'play' ] }
>> +
>> +##
>> +# @GICCapability:
>> +#
>> +# This struct describes capability for a specific GIC version. These
>> +# bits are not only decided by QEMU/KVM software version, but also
>> +# decided by the hardware that the program is running upon.
>> +#
>> +# @version:  version of GIC to be described.
>> +#
>> +# @emulated: whether current QEMU/hardware supports emulated GIC
>> +#            device in user space.
>> +#
>> +# @kernel:   whether current QEMU/hardware supports hardware
>> +#            accelerated GIC device in kernel.
>> +#
>> +# Since: 2.6
>> +##
>> +{ 'struct': 'GICCapability',
>> +  'data': { 'version': 'int',
>> +            'emulated': 'bool',
>> +            'kernel': 'bool' } }
>
> Are all four combinations of (emulated, kernel) possible?

Moreover, what do the combinations mean from a practical point of view?
What would a management application do with the information?
