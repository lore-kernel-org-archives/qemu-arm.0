Received: by 10.28.71.155 with SMTP id m27csp707232wmi;
        Fri, 23 Mar 2018 09:59:40 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuWGQ1J6bieVfEVadNshpC4+Kitke+K8cZNph5jTlEj2ZRzmvlGpCZWgbyMdSWz4pJPm5d4
X-Received: by 10.55.24.214 with SMTP id 83mr42711957qky.267.1521824380594;
        Fri, 23 Mar 2018 09:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521824380; cv=none;
        d=google.com; s=arc-20160816;
        b=kxpPlhd4kOKZJ70MbQYJEWenhNAmB+EA9T7HjsT2xMDzUYKWr9KMpY0FVTeDs18s49
         +sdST2E/s8TmXUULh5LJeoiHHfrdxX3Xz5VIE3vNvjclcmXSVJtlyZbEYR2V3Sbou83C
         r/nFoyNEP3Mh6dY/D9aUL/u8o3cYRObVaQxbgA/mU2aV2XDBssbmz733diltp2y+1R+2
         kPQ1wlZVe9glpHo/p8uz6/YAxN5NwKjMZ/vjbbSt1b6Gn5dRqU5NMCcHVyuR5z3tmbtG
         h0dcFkA7hWQBWR/n8/MiStq/9APRmGQlfYZ1VrnQlSygWX01lawH8gbEAy7bL8R9R1IM
         dp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=sbzHTCwIjHAafthepwL1x7kykPz3dZ6X9cW7RPoD9ZY=;
        b=QGGSyfJqWO0xqGDUtt7Zh7J/QTD2Oe1XISmGKSh08Lc4YE2hLdOZhhGvRgoI+RsA8X
         ngGHoARkfbzE3J8BWyvoBlJdejM7E1f5XLfzGLYtToPuOsEm91dSsk3oJKfj0hPhgBdw
         gU1xB5CeytTUfxt84s1nKFgur2habo0C2fGvTNHYiZGB9E/yMcCUUOHIuhy1PkZ95ksP
         XBQ8juCpF8hVcQ1fgDA2IkS9ukRkWaU/xJ/4x+s6ZA4YojeOLFm8Mgh9RIpgw6J2thse
         lHjGkbwFWqgKS0GwdpsXKC9alhTZ6gtohWqHElIfCpiAsmK0k7TvZBeZkSaeVlerpA3z
         e9Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u91si5370633qtd.226.2018.03.23.09.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 09:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezQ2W-0000LX-5Y
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 12:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQ2Q-0000LQ-2X
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 12:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQ2L-0007WD-Sm
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 12:59:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58184 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezQ2L-0007Vb-OM; Fri, 23 Mar 2018 12:59:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68F074040073;
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D85910B2B26;
	Fri, 23 Mar 2018 16:59:09 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180323143202.28879-1-lvivier@redhat.com>
	<20180323143202.28879-3-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0c54fe9f-fccc-58fc-6d43-22b1d53183f3@redhat.com>
Date: Fri, 23 Mar 2018 11:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323143202.28879-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 2/5] error: Strip trailing '\n' from error
 string arguments (again again)
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
X-TUID: MYc2ygCAmxyY

On 03/23/2018 09:31 AM, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/err-bad-newline.cocci,
> and found new error_report() occurences with '\n'.

s/occurences/occurrences/

> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   target/i386/hvf/hvf.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
