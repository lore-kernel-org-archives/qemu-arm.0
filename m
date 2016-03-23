Received: by 10.25.208.211 with SMTP id h202csp62241lfg;
        Wed, 23 Mar 2016 07:06:45 -0700 (PDT)
X-Received: by 10.55.77.4 with SMTP id a4mr3744008qkb.57.1458742005800;
        Wed, 23 Mar 2016 07:06:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si2303971qge.12.2016.03.23.07.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 07:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aijQr-0005DC-8R
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 10:06:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aijQo-0005D3-VV
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aijQl-0003iD-1i
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:06:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aijQk-0003i2-SS; Wed, 23 Mar 2016 10:06:38 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 640DBC0467F2;
	Wed, 23 Mar 2016 14:06:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NE6aEb023395
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 10:06:37 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 00800303F90D; Wed, 23 Mar 2016 15:06:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<874mbyl64i.fsf@blackfin.pond.sub.org>
	<20160323041429.GG28183@pxdev.xzpeter.org>
	<87egb1bjxe.fsf@blackfin.pond.sub.org>
	<20160323120449.GT28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 15:06:35 +0100
In-Reply-To: <20160323120449.GT28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 20:04:49 +0800")
Message-ID: <87wpot47bo.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
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
X-TUID: NJ1pfVR1iK2x

Peter Xu <peterx@redhat.com> writes:

> On Wed, Mar 23, 2016 at 10:52:29AM +0100, Markus Armbruster wrote:
>> The rule against returning non-dictionaries exists to avoid interfaces
>> that cannot evolve.  With a dictionary, you can evolve by adding
>> members.
>> 
>> The rule does *not* forbid returning lists of dictionaries.  When a
>> command fundamentally returns a list of things, being able to evolve the
>> things suffices.
>
> Ok.
>
>> 
>> query-gic-capabilities looks like it fundamentally returns a list of
>> capabilities.  Returning ['GICCapability'] is just fine then.
>
> I have posted v6 just as Eric has suggested. At least one advantage
> is that it is easier to be extended (if needed) in the future, also
> to follow the more-generic format to use dicts rather than
> arrays. If you would not mind, I'll keep the dict interface there.

Returning such a list of a structured type is a well-established
convention by now --- qmp-introspect.c shows 28 commands doing it, most
of them named query-FOO.  I'd rather not start a different convention
now, just because we got temporarily confused about our own rules.  So,
unless there's something about query-gic-capabilities that makes it more
likely to need extension outside its list element type, let's stick to
returning the list.

Eric?

>
> [...]
>
>> In either case, drop the change to returns_whitelist.
>
> Yep. Dropped in v6.
>
> Thanks.
>
> -- peterx
