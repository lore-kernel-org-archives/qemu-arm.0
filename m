Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp730989wrp;
        Thu, 19 Sep 2019 02:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6+BKLsJBlx6gaxFMXe3TqRbORDa88LlfZU/ohjcQYNy1U+DXyyykFgcg+KdU+Fu+NnMdA
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr14603883edi.75.1568884041211;
        Thu, 19 Sep 2019 02:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568884041; cv=none;
        d=google.com; s=arc-20160816;
        b=KRTsCke5LTM8nJUqCQNflRxuT1RnJj2XcAW/4qpX9D2a+g9TDJT8UI0zCPKKf4WQp/
         VjvSnSSpUlVhU+dHa8pDqjZ3ThHQK9SryN+Nve7+5EGqzVGcZX3M3XYRY76LF+indjhL
         AJ9MNfawsE6YwwObelcBwlNQdhVyjw3hZYm5YhO9bFnxlH831CGFVRTlkngBwlZZLOy+
         ttcQRUouQzF3m4zFhW6W3Yn/2goquZ8U+wr57phXEEaUvUUdACw12LXadTxQvB+94ZMd
         GG/5bMzbdg8xMokx2Z8V43AtX4/dBfRSC8m5jsWWU86eZdRtJKyVs3zqOPOpGYdYdAak
         L0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=nDNbUlprPXEXg+q12Y1AuCNd0Zq61EwS6yt2ffP/p+Q=;
        b=d0piA7i67z+mVDoBhF4RaFlbiQAsaqzU+fQcAPSSND3Rrkz0FOpmcO7fMxgUBg1mvI
         +qY9g0VzTqmlkre28u2+YJagSalZA5BFzsy3hyuaM96ylzYilThSNM5e2cz6PA679Uf2
         PwrwVDOa0iHLuKEmTtjyxNdu/GqX1Y3whBGo4rSYeTixF30QPjR86NGyOtnAtQCqkTso
         not3BrgMDsj5bHG5z4KVbvupgMZxiiF1666tHUYgj8+pQiuX8h9X8p3O8y21erwG8rDL
         4B4ZJ7sggnrk+Ro1El9MxubZAgo6RHKYg3zUQOAEsP23fbnxFlx9lafc5NGNxigU4x4l
         ZKUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si4072106ejp.347.2019.09.19.02.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 02:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAsPH-0006Dg-CR
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 05:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iAsI6-00085S-Lo
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iAsI5-0001Gx-IV
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:59:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59342)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iAsHy-00019Y-Df; Thu, 19 Sep 2019 04:59:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D0A13175282;
 Thu, 19 Sep 2019 08:59:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-52.brq.redhat.com
 [10.40.204.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E4F1001947;
 Thu, 19 Sep 2019 08:59:26 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
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
Message-ID: <d2a793c1-aae7-6e22-8baa-0c403c111e5c@redhat.com>
Date: Thu, 19 Sep 2019 10:59:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918130244.24257-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 08:59:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] error: auto propagated local_err
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, mst@redhat.com,
 codyprime@gmail.com, mark.cave-ayland@ilande.co.uk, mdroth@linux.vnet.ibm.com,
 kraxel@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 david@redhat.com, armbru@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 farman@linux.ibm.com, groug@kaod.org, dgilbert@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, stefanha@redhat.com,
 jsnow@redhat.com, david@gibson.dropbear.id.au, kwolf@redhat.com,
 berrange@redhat.com, cohuck@redhat.com, qemu-s390x@nongnu.org,
 sundeep.lkml@gmail.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XjZa6qKzF6K2

On 18.09.19 15:02, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>=20
> Here is a proposal (three of them, actually) of auto propagation for
> local_err, to not call error_propagate on every exit point, when we
> deal with local_err.
>=20
> It also may help make Greg's series[1] about error_append_hint smaller.
>=20
> See definitions and examples below.
>=20
> I'm cc-ing to this RFC everyone from series[1] CC list, as if we like
> it, the idea will touch same code (and may be more).
>=20
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03449.htm=
l
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qapi/error.h | 102 +++++++++++++++++++++++++++++++++++++++++++
>  block.c              |  63 ++++++++++++--------------
>  block/backup.c       |   8 +++-
>  block/gluster.c      |   7 +++
>  4 files changed, 144 insertions(+), 36 deletions(-)

If the combination of =E2=80=9Cif (local_err) { error_propagate(...); ...=
 }=E2=80=9D is
what=E2=80=99s cumbersome, can=E2=80=99t this be done simpler by adding a=
n
error_propagate() variant with a return value?

i.e.

bool has_error_then_propagate(Error **errp, Error *err)
{
    if (!err) {
        return false;
    }
    error_propagate(errp, err);
    return true;
}

And then turn all instances of

if (local_err) {
    error_propagate(errp, local_err);
    ...
}

into

if (has_error_then_propagate(errp, local_err)) {
    ...
}

?

Max
