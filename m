Received: by 10.28.71.155 with SMTP id m27csp621908wmi;
        Thu, 22 Mar 2018 10:30:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELstLxO/q5OVH5lsNxx09I0GAJpUnLoIqZmT7LJqm/9eGjX7AI5UxTivIPUsBVbz56GQGj5/
X-Received: by 10.237.49.195 with SMTP id 61mr36049786qth.77.1521739843434;
        Thu, 22 Mar 2018 10:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521739843; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2TYozTl0Uswz3eQ+1x+tIwdU7nzpWe5ozFwnZGKkGM29sUf3+mAkkDj5vj9FFQD+R
         9201vKC2n8vpU0JAcHoMEXqXD9RhLOJ4PGg380gHr+kpdGYRn1RQFji2V4aE6M3mGg4p
         JEliTkisitrDmiQJrWWF2nPUZnhOgQEcVDgiIy4SBI26A/vqhq0Blzy1JR2dWu0j6qiE
         Wlnuv6qSXRzoOZcwehohW02ywXBYQ8vqUuCLH4YAXf3Jw/rpk7mHb6plCKhGKZduiqVP
         cCZXf3nO+gMdB4yjzJAIKovGx1hiXL4EPwoN/UEBIyb8npN9hl4ix1rsu5cTCZsVNNZY
         cMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=+QPzFVFDva1w13PpLFTuEbF+OOzYLaGJirJKeFjo+9w=;
        b=O3Q5/FCZMs8ZsShHnGegd5MorEwdyIWADvY5W3KrIMFAHK1lVhx0sShSpZZtxIlxaf
         oiqwg/euQYXlIURMP4YtwwbYnri4dU5jlyVN2uBo170CqwELDYCSWya7hL8ZY/U7QFNp
         XV5x2/KycFgDdgEJTbxcYL8mxRt0/uJMQgXVDz7jMOCpxDQo+Hs8BOoqfnFcIEaQJXBm
         veOJ2yZezeXsf013f9LmAGfSr8ZQLPFmVAHOrx4TUH2yJybIecYYOSPJqF65GP212tXx
         HAC6xUhHgkBbcNXWA5srqRDTwXyqfOyuXBV6h5/sFo9Hc4R1qeXF76Venrf5/HEwvFqb
         5/RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p54si2462101qtk.255.2018.03.22.10.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez430-0002ds-VL
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez42t-0002db-JV
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 13:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez42p-0005bu-Gn
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 13:30:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53372 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez42p-0005bX-AH; Thu, 22 Mar 2018 13:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6762818B108;
	Thu, 22 Mar 2018 17:30:25 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DA7F2023230;
	Thu, 22 Mar 2018 17:30:17 +0000 (UTC)
To: Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4886c0dc-e017-8e39-649c-058b5f7b65f3@redhat.com>
Date: Thu, 22 Mar 2018 12:30:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 17:30:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 17:30:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
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
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
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
X-TUID: gKUsExDKEFzg

On 03/22/2018 12:19 PM, Max Filippov wrote:

>>> These files were autogenerated, fixing them doesn't make much sense.
>>
>> Good to know. They have been already updated by a couple of patches:
>>
>> 8f0a3716e4 Clean up includes
>> d8e39b7062 Use #include "..." for our own headers, <...> for others
>>
>> Perhaps import_core.sh can be updated?
> 
> Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
> "xtensa-isa.h".
> Adding #include "qemu/osdep.h" there seems pointless to me.

Or we can add more exceptions to our tooling to recognize the files as 
generated.  The scripts/clean-includes script knows to leave certain 
files alone, so add your files to that list.

I'm less certain of whether our Coccinelle scripts have easy ways to 
exclude specific files.  We already have scripts/cocci-macro-file.h to 
help Coccinelle not choke on some our existing files, but I'm not sure 
if Coccinelle has a config-file like way that is easy to maintain as a 
data file in-tree for blacklist files to leave alone (right now, when I 
run Coccinelle, I have to manually remember to pass a long command line 
cribbed out of the commit message of an earlier run to pick up things 
like cocci-macro-file.h, instead of an easy formula that points to a 
single config file to pull in all the usual options).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
