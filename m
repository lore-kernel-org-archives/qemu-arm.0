Received: by 10.25.208.211 with SMTP id h202csp2057430lfg;
        Tue, 22 Mar 2016 12:09:13 -0700 (PDT)
X-Received: by 10.55.24.195 with SMTP id 64mr23892891qky.45.1458673753241;
        Tue, 22 Mar 2016 12:09:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si17432486qho.8.2016.03.22.12.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 12:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiRg0-0003ow-NG
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 15:09:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiRfy-0003oe-3k
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 15:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiRfu-00047Y-2Z
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 15:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiRft-00047T-Sx; Tue, 22 Mar 2016 15:09:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7B20C50F69;
	Tue, 22 Mar 2016 19:09:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MJ934v024441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 15:09:04 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 20D31303F90D; Tue, 22 Mar 2016 20:09:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<56F19222.2050003@redhat.com>
Date: Tue, 22 Mar 2016 20:09:03 +0100
In-Reply-To: <56F19222.2050003@redhat.com> (Eric Blake's message of "Tue, 22
	Mar 2016 12:42:42 -0600")
Message-ID: <87shzigwj4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>, mdroth@linux.vnet.ibm.com,
	qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/5] arm: qmp: add
	query-gic-capabilities interface
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
X-TUID: 37RPg4PtOO2k

Eric Blake <eblake@redhat.com> writes:

> On 03/17/2016 09:27 PM, Peter Xu wrote:
>> This patch adds the command "query-gic-capabilities" but not implemnet
>
> s/not implemnet/does not implement/
>
>> it. The command is ARM-only. Return of the command is a list of
>> GICCapability struct that describes all GIC versions that current QEMU
>> and system support.
>> 
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>> ---
>
>> +++ b/qapi-schema.json
>> @@ -4156,3 +4156,14 @@
>>    'data': { 'version': 'int',
>>              'emulated': 'bool',
>>              'kernel': 'bool' } }
>> +
>> +##
>> +# @query-gic-capabilities:
>> +#
>> +# Return a list of supported GIC version capabilities.
>> +#
>> +# Returns: a list of GICCapability.
>> +#
>> +# Since: 2.6
>> +##
>> +{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
>
> On the surface, this seems okay.  As mentioned before, I would have
> squashed 1 and 2 into a single patch.  The GICCapability type is
> extensible, and introspection is sufficient at seeing what the type is
> currently capable of exposing.
>
> On the other hand...
>
>> +++ b/scripts/qapi.py
>> @@ -46,6 +46,7 @@ returns_whitelist = [
>>      'query-tpm-models',
>>      'query-tpm-types',
>>      'ringbuf-read',
>> +    'query-gic-capability',
>
> ...it required a whitelist, because you are violating the usual
> convention of returning a dict.  If you DO need the whitelist, your
> addition should have been kept sorted.  But you don't need it, if you
> would modify your QAPI to return a dict:
>
> { 'struct': 'GICCapabilitiesReturn',
>   'data': { 'capabilities': ['GICCapability'] } }
> { 'command': 'query-gic-capabilities',
>   'returns': 'GICCapabilitiesReturn' }
>
> Yes, the dict has only a single key, and that key points to the same
> list; but now you have future extensibility: in the future, we could
> return any future global data as a sibling to the array, without having
> to modify every element of the array to repeat redundant information.

I just tested it, the whitelist entry is superfluous, check_command()
accepts a list of dicts just fine.
