Received: by 10.28.71.155 with SMTP id m27csp584444wmi;
        Thu, 22 Mar 2018 09:58:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt+cnhnfxd5gJ+/ftrmOVEivWg4+/RLYM6Knee0LKUhVUfD62ejZ2He3QWyWFIlpPOQy0Rs
X-Received: by 10.55.234.6 with SMTP id t6mr25427882qkj.291.1521737930137;
        Thu, 22 Mar 2018 09:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521737930; cv=none;
        d=google.com; s=arc-20160816;
        b=NjQxtdeG/K9wlJ/uB75jltwGkbGBGhoVqbPULeXybl47tKSwbXI3TFlgu/50v6Lbim
         YVgxknhJwTwMO9I5JMlwKT/EoQ+BJ1fnYTNfr9V+PD7LGrvlXmY/wrDrM7brNTTwoHFf
         K0zrdPCpWo141SWZExXDSQqGLqho8CCA7liLuv3FpkhagN30IEGCseMClJzrwu8xhc5/
         v8LPTlPmz7PH3De/xdHo+w60okUoDm4SrNCayBC4k2jke/VQHDNBwFjGMqdcC49Uartz
         6c2s+idRgGKToivzL3Gb7wMmx4ALT0FtmVZhaZua3qqr5RpS37wZp+yENPA7S4mYBvnt
         XwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=//0hhgpiuh4VV4x+oVZK+KaDPxbn5uKzBy+9wfNfiT4=;
        b=u4MYlnpvRhgXxu3bxhH1lZVq/PEN9EAT9bL6moucqvI8DkkET4/OTTVEe5XYasWlCy
         t15NVeuqsMqGXFr9IPBE586egQ0qMkF7n4ciOHo0336uyIqbaEBDNWTk76OVlGDA9oaL
         pf+9/E9Dupz9d4DC2QoQNt/O5r2YUw2gPx1OW9ks9WT0o42Dx4R6h9/cNaVi/BtYujZu
         uM2IhnMU5Gf/ExKEiXqPDNB3sp0slIGsor56V7XCZ8Ri4HQwyAOgMhk3yUTfW7PRRQSB
         s2X4eKm/ndXVqijH8NLh9EDUyBCcX1Eps/VlGxB7hnOarlQJwSHA6KWguDvP2uMED99+
         5liQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123si234156qke.479.2018.03.22.09.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:58:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3Y9-0005AJ-Lp
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez3Y3-00059x-Be
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez3Y0-0002At-9J
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:58:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46256 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez3Y0-0002AV-4L; Thu, 22 Mar 2018 12:58:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8369D40201A6;
	Thu, 22 Mar 2018 16:58:34 +0000 (UTC)
Received: from [10.40.204.35] (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4E0084434;
	Thu, 22 Mar 2018 16:58:18 +0000 (UTC)
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
Date: Thu, 22 Mar 2018 17:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 22 Mar 2018 16:58:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 22 Mar 2018 16:58:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ReN9BW85b4ZV

On 22/03/2018 17:51, Max Filippov wrote:
> On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
>> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
> 
> These files were autogenerated, fixing them doesn't make much sense.

Good to know. They have been already updated by a couple of patches:

8f0a3716e4 Clean up includes
d8e39b7062 Use #include "..." for our own headers, <...> for others

Perhaps import_core.sh can be updated?

Thanks,
Laurent
