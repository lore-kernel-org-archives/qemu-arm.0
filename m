Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp755148wrp;
        Thu, 19 Sep 2019 02:33:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdahhdcSaH3fyByLY/bUpKyee4+8yisartzr2VKGSuFNW21yWjXC8BUiotXeS1jTbe6wB3
X-Received: by 2002:a37:a85:: with SMTP id 127mr1919875qkk.348.1568885629196;
        Thu, 19 Sep 2019 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568885629; cv=none;
        d=google.com; s=arc-20160816;
        b=VGXZ7pRk5niMv1lY3C04zHnfFosOmOm6rHnv0HH+AE9s6rFxUXpVJtNAUSjFb+asI7
         7jKU7x3+miJD9aBnhDKTEtGDmBWyht9v40cfC/rjOWDrDKbrMjtMX8DU3i8idGIXADub
         ZAspnc1ZjqsvpMZy7opGH3e8qPvC6W2YuSk2ReYBPcw7QySVVen9jj5UZ9jjxRj0gL1p
         SGdS0QIn/iSELE73PcaNTzBj5DsDAU1bGMJo7SYRni9fB1yS5IR1nylh2tEs7OO/zqJt
         s5mjLOUifSaoEe2QOXG4krT0iAANdVfhAlDTh1hmARESDPWoEL/+pi+7wttgBBqY3BeG
         NoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=/5slhB/5gliOL0eCU9tCg7guoKw9qYoGZTKeEAIQLSY=;
        b=FiF2HB6XOC4xnS5o+sYh4x8qk9Jc2MrUda1FU8lFEtpA2lgYHQoMAlScnD0yKTzeCy
         sXhRfgno5Vv/2N+tZnEMc6R4ywBf9118gy4La6ivSxu6yWCFzDV/MVpnRxRAyubcidp2
         k/+jk5HMzZx1bYIHR3jJGEdz8KiJfHuMqG4OdPoNrjteI3L6Cj1PdBcev/hcLSW5LA6d
         IcGz6x0+ZuBPCn1NyPE08rvJUBJAV2Z6xyf0smlsx9YOjRa0FB09lUSjo0umAYSjh/Q5
         E0UNuOR7BbkVwDq5xfOsdaft3chhtQyuvGG6G7tGeOnL29ukrwnZbQ6J4kwaUvYpcqqF
         zYHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si6191070qtb.403.2019.09.19.02.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 02:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAsou-0006mI-HH
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 05:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iAsoj-0006je-7g
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 05:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iAsoh-0006HV-Tg
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 05:33:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4127)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iAsof-0006GK-Ty; Thu, 19 Sep 2019 05:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9362210CC1E6;
 Thu, 19 Sep 2019 09:33:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-52.brq.redhat.com
 [10.40.204.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A716013A;
 Thu, 19 Sep 2019 09:33:20 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <d2a793c1-aae7-6e22-8baa-0c403c111e5c@redhat.com>
 <e0ba76d9-19cd-2894-b5d8-a19932e2d69d@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <9f41abd9-bef6-d7f1-0e52-df14a50cbe38@redhat.com>
Date: Thu, 19 Sep 2019 11:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e0ba76d9-19cd-2894-b5d8-a19932e2d69d@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 19 Sep 2019 09:33:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] error: auto propagated local_err
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "codyprime@gmail.com" <codyprime@gmail.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "groug@kaod.org" <groug@kaod.org>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MThebEM7BAhn

On 19.09.19 11:14, Vladimir Sementsov-Ogievskiy wrote:
> 19.09.2019 11:59, Max Reitz wrote:
>> On 18.09.19 15:02, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> Here is a proposal (three of them, actually) of auto propagation for
>>> local_err, to not call error_propagate on every exit point, when we
>>> deal with local_err.
>>>
>>> It also may help make Greg's series[1] about error_append_hint smalle=
r.
>>>
>>> See definitions and examples below.
>>>
>>> I'm cc-ing to this RFC everyone from series[1] CC list, as if we like
>>> it, the idea will touch same code (and may be more).
>>>
>>> [1]: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03449.h=
tml
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>> ---
>>>   include/qapi/error.h | 102 ++++++++++++++++++++++++++++++++++++++++=
+++
>>>   block.c              |  63 ++++++++++++--------------
>>>   block/backup.c       |   8 +++-
>>>   block/gluster.c      |   7 +++
>>>   4 files changed, 144 insertions(+), 36 deletions(-)
>>
>> If the combination of =E2=80=9Cif (local_err) { error_propagate(...); =
... }=E2=80=9D is
>> what=E2=80=99s cumbersome, can=E2=80=99t this be done simpler by addin=
g an
>> error_propagate() variant with a return value?
>>
>> i.e.
>>
>> bool has_error_then_propagate(Error **errp, Error *err)
>> {
>>      if (!err) {
>>          return false;
>>      }
>>      error_propagate(errp, err);
>>      return true;
>> }
>>
>> And then turn all instances of
>>
>> if (local_err) {
>>      error_propagate(errp, local_err);
>>      ...
>> }
>>
>> into
>>
>> if (has_error_then_propagate(errp, local_err)) {
>>      ...
>> }
>>
>> ?
>>
>> Max
>>
>=20
> No, originally cumbersome is introducing local_err in a lot of new plac=
es by
> Greg's series. MAKE_ERRP_SAFE macro makes it as simple as one macro cal=
l
> instead (in each function where we need local_err).

Does it need more than one local_err per function?

Because if it didn=E2=80=99t, I=E2=80=99d find one =E2=80=9CError *local_=
err;=E2=80=9D simpler than one
macro incantation.

(It has the same LoC, and it makes code readers ask the same question:
=E2=80=9CWhy do we need it?=E2=80=9D  Which has the same answer for both;=
 but one is
immediately readable code, whereas the other is a macro.)

> Also, auto-propagation seems correct thing to do, which fits good into
> g_auto concept, so even without any macro it just allows to drop severa=
l error_propagate
> calls (or may be several goto statements to do one error_propagate call=
) into
> one definitions. It's the same story like with g_autofree vs g_free.

I don=E2=80=99t see the advantage here.  You have to do the if () stateme=
nt
anyway, so it isn=E2=80=99t like you=E2=80=99re saving any LoC.  In addit=
ion, I
personally don=E2=80=99t find code hidden through __attribute__((cleanup)=
)
easier to understand than explicitly written code.

It isn=E2=80=99t like I don=E2=80=99t like __attribute__((cleanup)).  But=
 it does count
under =E2=80=9Cmagic=E2=80=9D in my book, and thus I=E2=80=99d avoid it i=
f it doesn=E2=80=99t bring
actual advantages.  (It does bring actual advantages for things like
auto-freeing memory, auto-closing FDs, or zeroing secret buffers before
freeing them.  In all those cases, you save LoC, and you prevent
accidental leakage.  I don=E2=80=99t quite see such advantages here, but =
I may
well be mistaken.)


Now Kevin has given an actual advantage, which is that local_err
complicates debugging.  I=E2=80=99ve never had that problem myself, but t=
hat
would indeed be an advantage that may warrant some magic.

Max
