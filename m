Received: by 10.25.208.211 with SMTP id h202csp2373016lfg;
        Wed, 23 Mar 2016 02:52:38 -0700 (PDT)
X-Received: by 10.55.79.17 with SMTP id d17mr2060427qkb.56.1458726758662;
        Wed, 23 Mar 2016 02:52:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si1482065qge.118.2016.03.23.02.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 02:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aifSw-0001cu-8p
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 05:52:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifSt-0001b5-Vh
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifSq-0006Gh-MZ
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:52:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aifSq-0006GW-Gv; Wed, 23 Mar 2016 05:52:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D21B6C0467EC;
	Wed, 23 Mar 2016 09:52:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N9qUvS006705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 05:52:31 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 97657303F90D; Wed, 23 Mar 2016 10:52:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<874mbyl64i.fsf@blackfin.pond.sub.org>
	<20160323041429.GG28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 10:52:29 +0100
In-Reply-To: <20160323041429.GG28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 12:14:29 +0800")
Message-ID: <87egb1bjxe.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, abologna@redhat.com, qemu-arm@nongnu.org
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
X-TUID: sdH7ZpWKys+7

Peter Xu <peterx@redhat.com> writes:

> On Tue, Mar 22, 2016 at 07:28:13PM +0100, Markus Armbruster wrote:
>> Peter Xu <peterx@redhat.com> writes:
>> > diff --git a/scripts/qapi.py b/scripts/qapi.py
>> > index 6b2aa6e..716474e 100644
>> > --- a/scripts/qapi.py
>> > +++ b/scripts/qapi.py
>> > @@ -46,6 +46,7 @@ returns_whitelist = [
>>    # Whitelist of commands allowed to return a non-dictionary
>>    returns_whitelist = [
>>        'human-monitor-command',
>>        'qom-get',
>>        'query-migrate-cache-size',
>> >      'query-tpm-models',
>> >      'query-tpm-types',
>> >      'ringbuf-read',
>> > +    'query-gic-capability',
>> >  
>> >      # From QGA:
>> >      'guest-file-open',
>> 
>> The whitelist exists to except existing commands from design rules on
>> return types.  New commands don't get to violate the rules without a
>> really, really compelling reason.
>> 
>> Do you actually need this?

I've since tested it and double-checked the code: you don't need this.

>> If yes, why should your command be permitted to violate the design
>> rules?
>
> This might not be required. Agree with you and Eric. Will use a hash
> instead with single key.

The rule against returning non-dictionaries exists to avoid interfaces
that cannot evolve.  With a dictionary, you can evolve by adding
members.

The rule does *not* forbid returning lists of dictionaries.  When a
command fundamentally returns a list of things, being able to evolve the
things suffices.

query-gic-capabilities looks like it fundamentally returns a list of
capabilities.  Returning ['GICCapability'] is just fine then.

Only if query-gic-capabilities doesn't have this list nature should you
complicate its return value by wrapping it in another object type.

In either case, drop the change to returns_whitelist.

[...]
