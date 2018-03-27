Received: by 10.28.71.155 with SMTP id m27csp167111wmi;
        Mon, 26 Mar 2018 20:02:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs5DM+l4BGD+mbnfF0I07C7wtPYrJn57JtmR8JnaxbgBC0KmXvao2+I6UMmQ8OwoQlswEHn
X-Received: by 10.200.55.157 with SMTP id d29mr60010820qtc.61.1522119735716;
        Mon, 26 Mar 2018 20:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522119735; cv=none;
        d=google.com; s=arc-20160816;
        b=tLsmyElY+Ld4Cy8O3weO7PIQ53pu7I9jpWFDnuxoxZHPy/wLFsT0E6a8euOkDM2I7Y
         PbtJQfAqBkU8hQHAsl2E2IHrnzgQKyGJG3KAuhict5Yk8FTYHw3kr/eyXySz3kKMHi43
         p+qfQJH5LZNyenWozuXPNux+/G6lfScgAWXrJEbg80c8W7IP6B957AcIJUysopA4I7C7
         mwHGFwNj5W85Q7/9OX8YX3QER1u/WpM+m6l58DdteqkMWB1dHuvjDkFnFmW5+5f1/44A
         hh8yGVhK0JJ9gxMWQrLKh9owMOWb0aPBffrOuyK+kQ+VaA1wFFHA8Ba9MpJ4Q9AmTeqT
         JJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=C8CCwabl25iVmycWTGtnXjTZlOMN9CqTFEI079Fc0ZY=;
        b=geuxYblvA8IOROQ6uj7pbVZrwJ71R9iCVTqXfU47O52W2SdeTeAzowaGu0Ofbqmq9s
         B8HcQortRGAqgS5cuGbuiERA+xAeYJfWS3B6S+dvglJykm02NMH7Tf4y5ZM1Kbf5+y9b
         mkoTDIKOVVal/zjx15prtL+y7emHf/6yZs86yhniYXMbhmHGx7aFyYAv7HfQQCarSteO
         4bJVl2ldVXdbMxnc+CB9eDCMmY+K9cQT9rYAVUk5Li6stv7UDmdXSKdZj1wzAwN2cjeS
         lQmtn4YaK+d24tlTybP5WKsSDmPHk2bEcxHhgvOp68syxX8gVbTm5oFVmGh/8QGvSHLz
         cUIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k126si332682qke.13.2018.03.26.20.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Mar 2018 20:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0esH-0006Go-7W
	for alex.bennee@linaro.org; Mon, 26 Mar 2018 23:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0es8-0006Ga-H2
	for qemu-arm@nongnu.org; Mon, 26 Mar 2018 23:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0es5-0003On-Fg
	for qemu-arm@nongnu.org; Mon, 26 Mar 2018 23:02:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33538 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1f0es5-0003OF-CG; Mon, 26 Mar 2018 23:02:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3B94EBFF4;
	Tue, 27 Mar 2018 03:01:55 +0000 (UTC)
Received: from localhost (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E53D215CDAE;
	Tue, 27 Mar 2018 03:01:48 +0000 (UTC)
Date: Tue, 27 Mar 2018 11:01:47 +0800
From: Fam Zheng <famz@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20180327030147.GH31422@lemon.usersys.redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-4-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322161226.29796-4-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 27 Mar 2018 03:01:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 27 Mar 2018 03:01:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 3/4] qdict: remove useless cast
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
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rs02ydyB7sxS

On Thu, 03/22 17:12, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/qobject.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Acked-by: Fam Zheng <famz@redhat.com>
