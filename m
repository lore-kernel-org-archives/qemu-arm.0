Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp895907wrp;
        Thu, 19 Sep 2019 04:57:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvHOMUokuUt44XVo9bNddsl76bCoVBNydWMF5gAlVc8KnYkBw83ZyrPrhFOeU0Da9MyTUT
X-Received: by 2002:ac8:5194:: with SMTP id c20mr2728693qtn.21.1568894221086;
        Thu, 19 Sep 2019 04:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568894221; cv=none;
        d=google.com; s=arc-20160816;
        b=DrfJqA2sxs5LFq9wsFzRiMIZ4e1LMAXmsllrRyhvXGt1KN9gW/FcvDqSSOHLgi2NMZ
         mCIb4Sj5xwZ8zXYToNabPet1ybWiK4IeF4ZC3OrLLBxuY/d19Z29MlqpmDlP1QE9/JXu
         tpa3Bb5soshAxKdwekHV1QLFQPBQR5MfzKoxisOb7/eQAt4WPk1TapirwKB4ZZJhvwWs
         WZPnetJa97KGqNG3qA9pslmkUOQyEVCvx/HrJCRh8+AQLvOYR3Lke0pLsOyRUmJHdPP5
         ulwpYPHl4iLWezP8Go9iD62PBIolRDm5y6TxzSmoFk1XRQTXL0pfCONebAgM5rycmvMd
         lpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=zqQB8TpsnfFouP6vNb8BBBX+Jw+Kplz1bncKt291D38=;
        b=DX/IwIc6QJ3ptnrG2Kbm/1oY8hVPOiAm1PIWn8ibP96ZiuEzXJlWDGGhYXKPf7QXwK
         lAS+hDlh8xd28HIULALaAMaHQ7eeeM7yW3/F/XD2drdzImyvwA1VxHhu8A5RHJ5xE1QL
         fBcbhAuxu2GsjdKBw8Dgt74+TMarq2GiXFuAiTWsrA6SSIMJB+vTSFOapFVCbm97/SkQ
         bISDQDMgGSSMNjtkx+hAYC+gw16ODDJHuTYEagFyzQko8DiXY5cBEVgNi+TKoOzBxsZu
         KvARIa+SHnE2OZpbXQ/zBjx/RyCFwbV3DXqk98fmUT+LimhRUee0n/KTmiSD7Hm0NxG2
         5JYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 69si6256656qkh.184.2019.09.19.04.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 04:57:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAv3T-0003s9-Qn
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 07:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iAv00-0007t6-Ch
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 07:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iAuzy-0007n0-VR
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 07:53:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iAuzy-0007m9-O3; Thu, 19 Sep 2019 07:53:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8697710CC1F8;
 Thu, 19 Sep 2019 11:53:21 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74BFF5D6B0;
 Thu, 19 Sep 2019 11:52:54 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <d2a793c1-aae7-6e22-8baa-0c403c111e5c@redhat.com>
 <e0ba76d9-19cd-2894-b5d8-a19932e2d69d@virtuozzo.com>
 <9f41abd9-bef6-d7f1-0e52-df14a50cbe38@redhat.com>
 <7aa85eb5-d765-d337-7f5d-09d7a981253f@virtuozzo.com>
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
Message-ID: <9b1f5c35-b67d-dab2-c0cc-a39e88bc92c0@redhat.com>
Date: Thu, 19 Sep 2019 13:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7aa85eb5-d765-d337-7f5d-09d7a981253f@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 19 Sep 2019 11:53:21 +0000 (UTC)
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
X-TUID: PJCv7vOrqY3X

On 19.09.19 12:03, Vladimir Sementsov-Ogievskiy wrote:
> 19.09.2019 12:33, Max Reitz wrote:
>> On 19.09.19 11:14, Vladimir Sementsov-Ogievskiy wrote:
>>> 19.09.2019 11:59, Max Reitz wrote:
>>>> On 18.09.19 15:02, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi all!
>>>>>
>>>>> Here is a proposal (three of them, actually) of auto propagation fo=
r
>>>>> local_err, to not call error_propagate on every exit point, when we
>>>>> deal with local_err.
>>>>>
>>>>> It also may help make Greg's series[1] about error_append_hint smal=
ler.
>>>>>
>>>>> See definitions and examples below.
>>>>>
>>>>> I'm cc-ing to this RFC everyone from series[1] CC list, as if we li=
ke
>>>>> it, the idea will touch same code (and may be more).
>>>>>
>>>>> [1]: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03449=
.html
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.c=
om>
>>>>> ---
>>>>>    include/qapi/error.h | 102 +++++++++++++++++++++++++++++++++++++=
++++++
>>>>>    block.c              |  63 ++++++++++++--------------
>>>>>    block/backup.c       |   8 +++-
>>>>>    block/gluster.c      |   7 +++
>>>>>    4 files changed, 144 insertions(+), 36 deletions(-)
>>>>
>>>> If the combination of =E2=80=9Cif (local_err) { error_propagate(...)=
; ... }=E2=80=9D is
>>>> what=E2=80=99s cumbersome, can=E2=80=99t this be done simpler by add=
ing an
>>>> error_propagate() variant with a return value?
>>>>
>>>> i.e.
>>>>
>>>> bool has_error_then_propagate(Error **errp, Error *err)
>>>> {
>>>>       if (!err) {
>>>>           return false;
>>>>       }
>>>>       error_propagate(errp, err);
>>>>       return true;
>>>> }
>>>>
>>>> And then turn all instances of
>>>>
>>>> if (local_err) {
>>>>       error_propagate(errp, local_err);
>>>>       ...
>>>> }
>>>>
>>>> into
>>>>
>>>> if (has_error_then_propagate(errp, local_err)) {
>>>>       ...
>>>> }
>>>>
>>>> ?
>>>>
>>>> Max
>>>>
>>>
>>> No, originally cumbersome is introducing local_err in a lot of new pl=
aces by
>>> Greg's series. MAKE_ERRP_SAFE macro makes it as simple as one macro c=
all
>>> instead (in each function where we need local_err).
>>
>> Does it need more than one local_err per function?
>>
>> Because if it didn=E2=80=99t, I=E2=80=99d find one =E2=80=9CError *loc=
al_err;=E2=80=9D simpler than one
>> macro incantation.
>>
>> (It has the same LoC, and it makes code readers ask the same question:
>> =E2=80=9CWhy do we need it?=E2=80=9D  Which has the same answer for bo=
th; but one is
>> immediately readable code, whereas the other is a macro.)
>=20
> Not the same, you didn't count error_propagate

I did, because it would part of the if () statement in my proposal.

> And your example don't match Greg's case, there no "if (local_err)" in =
it,

Ah, right, I see.  OK then.

> just "error_append_hint(errp)", which don't work for error_fatal and er=
ror_abort
> (Yes, I agree with Kevin, that it should work only for error_fatal)

True.

[...]

>> Now Kevin has given an actual advantage, which is that local_err
>> complicates debugging.  I=E2=80=99ve never had that problem myself, bu=
t that
>> would indeed be an advantage that may warrant some magic.

Although after some more consideration I realized this probably cannot
be achieved with this series, actually.

Max
