Received: by 10.28.71.155 with SMTP id m27csp974323wmi;
        Fri, 23 Mar 2018 15:08:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELujYvq+6jrZqY28dfgszqLmrf4h4885VUX9fqIfScJPWzSyZ7lrPmpg39HsmM1I7h27iQE6
X-Received: by 10.55.215.70 with SMTP id m67mr45007711qki.123.1521842925562;
        Fri, 23 Mar 2018 15:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521842925; cv=none;
        d=google.com; s=arc-20160816;
        b=g4Gm1WlEoEvOukHDTu2Z5IVFpjozO5i4aXBWkUDSJeisQMRyOtzPMwNLM/Hn0NN5Ry
         guMYAPXjIRVwS9tBqTlKfz3/Ekj6BQjOJthreA6CXryjqfBkHbjvqtGBkudSY+gA3xYO
         yBHSve6eLG3VrhFMy2CuW7MLG+GJ6XZWxEk8ikirzzlmrDmWUeyu54kJZIIgOtj+blo+
         WE1/89GRCzWzga154xKWXBXUWjw9zAIXaUjovqhAVgAeIJTdccuGbKo1V8dxLt9HYoka
         ui491fnpyfcvJAE+9HOveu1eifHjvfvm5fej67BAlvqNa28YpEDpJrghIg622vAjraLk
         8oTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=L9QRm0J9/6EwrmFbCZg53gSwEZsBLzTflyyBm+6/9xI=;
        b=OWZl3ZY7GiZDCSF3zZxVthf9iIJK77cMeAT1/tkheIrwTKtA3ZpkHmUH16rMmenBet
         MHwYiR2s/xhDMneEr2iKl4txbnmrQol8B9CpGR/If3NPIeTHXRju8467Tf5JWIpVlTkH
         2ilmrUunvKml8GJqqdEO+qtpsklzgUJLeUAkMYTNbnIuSujLBjIAwOHNtRXOUA1xEf/7
         5ZLYYQWSoAKPyo5VK6zBmoapWhQ8g0xXUE9VmRCfbpiv8JFm3w9ZXEdnmODpCWP1NFc0
         2D3JIx1JJgV1Ejuyl6KTiWpGRj3Qnr5M7MJm4gbgZcfCLQWqZ6NnQcq2kDu08stCKKKt
         dULg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q64si668843qkh.395.2018.03.23.15.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 15:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezUrd-0008VO-2b
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 18:08:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezUrU-0008Uv-Lf
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 18:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezUrR-0005Wj-Bc
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 18:08:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55234 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezUrR-0005VJ-7E; Fri, 23 Mar 2018 18:08:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D198406E8A4;
	Fri, 23 Mar 2018 22:08:17 +0000 (UTC)
Received: from [10.40.204.35] (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A212E10B2B4B;
	Fri, 23 Mar 2018 22:08:01 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20180323143202.28879-1-lvivier@redhat.com>
	<fae663dc-71c9-7a1e-e951-25e95d385c2e@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <a25005fb-904a-9f38-f191-d4f671fe8435@redhat.com>
Date: Fri, 23 Mar 2018 23:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <fae663dc-71c9-7a1e-e951-25e95d385c2e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 22:08:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 22:08:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
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
X-TUID: gujK5ecyQvv6

On 23/03/2018 18:47, Eric Blake wrote:
> On 03/23/2018 09:31 AM, Laurent Vivier wrote:
>> I've re-run some scripts from the coccinelle directory,
>> and they have found some problems.
>>
>> This series fixes them.
>>
>> v2: only change PATCH 4/4
>> =C2=A0=C2=A0 - keep comments
>> =C2=A0=C2=A0 - fix indentation
>> =C2=A0=C2=A0 I didn't remove changes in autogenerated files as it
>> =C2=A0=C2=A0 seems they are generated only once.
>>
>> Daniel P. Berrang=C3=A9 (1):
>> =C2=A0=C2=A0 make: improve check for stale generated files in source d=
ir
>=20
> Is the inclusion of this patch compared to v1 intentional?

Oh, no, sorry... I've put this in my branch to test it and forgot to
remove it...

Thanks,
Laurent

