Received: by 10.28.71.155 with SMTP id m27csp756956wmi;
        Fri, 23 Mar 2018 10:47:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtTKsnF6NAKw/nnotLFCe1961l23gzX7JznXSq3bmO7h79aOnxO2PR0CjAoAG1e2qSy0QtV
X-Received: by 10.55.209.79 with SMTP id s76mr42616428qki.89.1521827270808;
        Fri, 23 Mar 2018 10:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521827270; cv=none;
        d=google.com; s=arc-20160816;
        b=lZ1WbARBN5EhE0PbzM4SZNUR8cKhtQERGtvOD/SiIdIP+efSk6WkwSe9E1qKqT/+s1
         UhXPqRQ826rNld5qAfHbA+59ZxPZmAXmsVdYnARFZX5QTzbZ4DrNd7FqHoX1tWQUo3oB
         wsB3lyhiAq4GTzMk/Mo7SdUUGgG5j2ddXr15LONtVbhuzlaBWAEdcceiA6dIdivrpgPr
         mUwiz6k3Bl3Lq4WgXgR5qOcWOflC9MPrCzTgU2bru56LjET3AjhruDMnuqAjX6W24Z4C
         Gb2+Nu2MG4U4LkGzlNgutAii3pbt82711aJSrI8uQabpme7mJBMUWbB7oLNro5o375Nr
         wpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=KuVq1GaAQNKvawKZ71Yb6BCGn8Z1+EB6+Qe01Dh4Ads=;
        b=sbjF6vy/L3voQO29MpdQrD9PP7myQwF8kkLMkgRKKaYKRzg9CaRetyVhQ/hsJ9ycqq
         mbBVN6SZxhx6jc4uFMxXf2/zZ437dxWUw5dCIle5AAGgs5le5cw2TIpLLvAKJZE3dOcJ
         UiQxll2SQbwi/9T8UiEswixqIKUoN/i0yZqWVcy1r8HehF8+DLrm8EuEjba4YpFJvt1O
         7MAkflkSInj5iQNtKTeoVm+xEaEiTE9IbhImVIJBO8Ud01z0CIAASvLOe1SIvolrNlUk
         FOZRBhAWfkMs1ulbfyDrD1Gxuyd7QAUvXhl7O3cYk+2mcT1GLbkY7/gknuNTKc6g6P8p
         xSAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x187si254011qke.432.2018.03.23.10.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 10:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezQn8-0003aZ-CZ
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 13:47:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQn3-0003aS-Ax
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 13:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQn0-0008Tp-0s
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 13:47:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58434 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezQmz-0008Tb-SF; Fri, 23 Mar 2018 13:47:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFDEA4023155;
	Fri, 23 Mar 2018 17:47:37 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8EDE84443;
	Fri, 23 Mar 2018 17:47:21 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180323143202.28879-1-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fae663dc-71c9-7a1e-e951-25e95d385c2e@redhat.com>
Date: Fri, 23 Mar 2018 12:47:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 23 Mar 2018 17:47:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 23 Mar 2018 17:47:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 0/5] coccinelle: re-run scripts from
 scripts/coccinelle
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NbwndscZCsFR

On 03/23/2018 09:31 AM, Laurent Vivier wrote:
> I've re-run some scripts from the coccinelle directory,
> and they have found some problems.
>=20
> This series fixes them.
>=20
> v2: only change PATCH 4/4
>    - keep comments
>    - fix indentation
>    I didn't remove changes in autogenerated files as it
>    seems they are generated only once.
>=20
> Daniel P. Berrang=C3=A9 (1):
>    make: improve check for stale generated files in source dir

Is the inclusion of this patch compared to v1 intentional?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
