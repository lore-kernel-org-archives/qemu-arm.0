Received: by 10.25.44.15 with SMTP id s15csp5137095lfs;
        Tue, 11 Jul 2017 10:32:34 -0700 (PDT)
X-Received: by 10.200.9.55 with SMTP id t52mr1317846qth.107.1499794354145;
        Tue, 11 Jul 2017 10:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794354; cv=none;
        d=google.com; s=arc-20160816;
        b=pCM8G+sKjD3nbunFsZeHI70HNiEAhNf6a1LdILA/B6jIPWvv9nb0CKcwhjg9RJ/mvg
         pi1Fh2a5+ksDARN5A/W/O/YOYiqOG6lQU3x6KR+d086ixdR6Kn9s3jmnr1+oC0DsuEdl
         4t8Eop21fklXDNu42jV4ZCS+ZE60udD0o6MrMzx4Fa2aD7TWJ/BEsdaNjmODKn7Xms+M
         daeCYzIurKoMIUVniH1KjaJMI72O6X6770OQZOUdRVuzkAJY/v4nqdNg0On1amH99svb
         7cjiZXF18dB3dnveRmSiOKupRQpJpYYxF3FbgkT++uZ8R+KnBZL5EkEwhYOKeTSvqEDp
         82Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Rzd6GoVBtiyZT4UfirOqC1733z1ozUeEv+r3KRHG/bk=;
        b=pioZshEVspYck//mTuV/xuc+DHcqm8BLhTTwXXVfZ9kTlYCBZJL8xdX/K3mROEQtNb
         fGAMMMyCaNNjnqeOPCuvXimXvlSxqdMlo1Km6u+hg3HykGrdvMytS5d6Ek4Fh0wTrsaY
         SCZB73zE7570msoSTkLwKvclB6sluCd8sd1EYk0hS6NBZHNX3OpqP6O6117cGOPbcrDu
         CD6UiWLzyLUOunNSnx7O5+sBKDPjGj2OBsC63DSc3QE3KJ0GkfdGtAQiF41uzG2foJ8D
         symTdzsAE3uIkhohatw/WeFjp42IDxHVPUcxUB2NX0jRzqMjSrvXw49Qt3xJ+eK+g+rH
         5+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y62si436753qke.380.2017.07.11.10.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz1T-0000y8-Hc
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:32:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyIr-0007tL-5a
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 12:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyIq-0005hB-B4
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 12:46:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1dUyIl-0005ea-Hg; Tue, 11 Jul 2017 12:46:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34B688F226;
	Tue, 11 Jul 2017 16:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 34B688F226
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mlureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 34B688F226
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E43F75C549;
	Tue, 11 Jul 2017 16:46:17 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEE461800C83;
	Tue, 11 Jul 2017 16:46:17 +0000 (UTC)
Date: Tue, 11 Jul 2017 12:46:16 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1803793100.49591678.1499791576069.JavaMail.zimbra@redhat.com>
In-Reply-To: <1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.112.26, 10.4.195.4]
Thread-Topic: qdev-properties.h: Explicitly set the default value for arraylen
	properties
Thread-Index: F/DK4QgTuOYiKBatfCtJj904VdCtzw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 11 Jul 2017 16:46:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] qdev-properties.h: Explicitly set the
 default value for arraylen properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owXPl3Zxv6g9



----- Original Message -----
> In DEFINE_PROP_ARRAY, because we use a PropertyInfo (qdev_prop_arraylen)
> which has a .set_default_value member we will set the field to a default
> value. That default value will be zero, by the C rule that struct
> initialization sets unmentioned members to zero if at least one member
> is initialized. However it's clearer to state it explicitly.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
> If my eyeball of the sources is correct, this is the only case we
> have of a Property struct that uses a PropertyInfo with a non-NULL
> .set_default_value but which doesn't explicitly set .defval.u.
> ---
>  include/hw/qdev-properties.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0604c33..36d040c 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -110,6 +110,7 @@ extern PropertyInfo qdev_prop_arraylen;
>                            _arrayfield, _arrayprop, _arraytype) {        =
\
>          .name =3D (PROP_ARRAY_LEN_PREFIX _name),                        =
  \
>          .info =3D &(qdev_prop_arraylen),                                =
  \
> +        .defval.u =3D 0,                                                =
  \
>          .offset =3D offsetof(_state, _field)                            =
  \
>              + type_check(uint32_t, typeof_field(_state, _field)),       =
\
>          .arrayinfo =3D &(_arrayprop),                                   =
  \
> --
> 2.7.4
>=20
>=20
