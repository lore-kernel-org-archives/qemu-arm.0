Received: by 10.25.208.211 with SMTP id h202csp2373786lfg;
        Wed, 23 Mar 2016 02:54:24 -0700 (PDT)
X-Received: by 10.55.78.84 with SMTP id c81mr2057296qkb.85.1458726864495;
        Wed, 23 Mar 2016 02:54:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si1523549qhc.17.2016.03.23.02.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 02:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aifUe-00031i-3x
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 05:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifUa-00031O-Sc
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifUZ-0006xy-St
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:54:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aifUZ-0006xr-L3; Wed, 23 Mar 2016 05:54:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 36E0AD7E60;
	Wed, 23 Mar 2016 09:54:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N9sHe7007790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 05:54:18 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A1BDF303F90D; Wed, 23 Mar 2016 10:54:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<56F19222.2050003@redhat.com>
	<20160323040722.GF28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 10:54:16 +0100
In-Reply-To: <20160323040722.GF28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 12:07:22 +0800")
Message-ID: <878u19bjuf.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Mar 2016 09:54:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, abologna@redhat.com,
	Eric Blake <eblake@redhat.com>
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
X-TUID: E5BCnfoP1mOW

Peter Xu <peterx@redhat.com> writes:

> On Tue, Mar 22, 2016 at 12:42:42PM -0600, Eric Blake wrote:
>> On 03/17/2016 09:27 PM, Peter Xu wrote:
>> > This patch adds the command "query-gic-capabilities" but not implemnet
>> 
>> s/not implemnet/does not implement/
>
> Yep, again. Thanks.
>
>> 
>> > it. The command is ARM-only. Return of the command is a list of
>> > GICCapability struct that describes all GIC versions that current QEMU
>> > and system support.
>> > 
>> > Signed-off-by: Peter Xu <peterx@redhat.com>
>> > ---
>> 
>> > +++ b/qapi-schema.json
>> > @@ -4156,3 +4156,14 @@
>> >    'data': { 'version': 'int',
>> >              'emulated': 'bool',
>> >              'kernel': 'bool' } }
>> > +
>> > +##
>> > +# @query-gic-capabilities:
>> > +#
>> > +# Return a list of supported GIC version capabilities.
>> > +#
>> > +# Returns: a list of GICCapability.
>> > +#
>> > +# Since: 2.6
>> > +##
>> > +{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
>> 
>> On the surface, this seems okay.  As mentioned before, I would have
>> squashed 1 and 2 into a single patch.  The GICCapability type is
>> extensible, and introspection is sufficient at seeing what the type is
>> currently capable of exposing.
>> 
>> On the other hand...
>> 
>> > +++ b/scripts/qapi.py
>> > @@ -46,6 +46,7 @@ returns_whitelist = [
>> >      'query-tpm-models',
>> >      'query-tpm-types',
>> >      'ringbuf-read',
>> > +    'query-gic-capability',
>> 
>> ...it required a whitelist, because you are violating the usual

It doesn't :)

>> convention of returning a dict.  If you DO need the whitelist, your
>> addition should have been kept sorted.  But you don't need it, if you
>> would modify your QAPI to return a dict:
>> 
>> { 'struct': 'GICCapabilitiesReturn',
>>   'data': { 'capabilities': ['GICCapability'] } }
>> { 'command': 'query-gic-capabilities',
>>   'returns': 'GICCapabilitiesReturn' }
>> 
>> Yes, the dict has only a single key, and that key points to the same
>> list; but now you have future extensibility: in the future, we could
>> return any future global data as a sibling to the array, without having
>> to modify every element of the array to repeat redundant information.
>
> Yes, I think this is better solution. Will adopt this in next version.

As explained in my other message, do this only if query-gic-capabilities
truly needs it.  There's plenty of precedence for returning a list of a
structured type.

> Thanks for the comments!
>
> -- peterx
