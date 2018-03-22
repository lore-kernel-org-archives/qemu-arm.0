Received: by 10.28.71.155 with SMTP id m27csp587190wmi;
        Thu, 22 Mar 2018 10:01:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu7Le+6LK4Im5K9JhukfIpj0KCqvb+rsm4goJ0Bkio67xOZ4PTdswZ961Fi/EXe+Zi8CRSx
X-Received: by 2002:a25:bb11:: with SMTP id z17-v6mr15647338ybg.443.1521738067341;
        Thu, 22 Mar 2018 10:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521738067; cv=none;
        d=google.com; s=arc-20160816;
        b=ejVWqffWN07oWEWUhbswQ7Ikel6D+SurYpSN7sb3e44Y+lRKIvLR9mUwnaIrhFLHs0
         L1At2VCN7jBalnD1087H0YqP0Sysoqb30T/aBE+ZHS1lJSyf+5WSxbgNocDnqy2K7DlO
         /W5Y01L0bQMuinBIXFcOOVDFpubHAUULKjD0y90COjhuNueoQQeeFEeNABj7Q8/qnZzy
         mx55ih3W3kme65tMVnWMI4hbel+BJVRf1IGnyhj3ZVyJSmwgnh5uiaynP2n7TkkxyuZP
         lNIERMrsjChYjMFr6NGZk0kzuwUzDpC3ewiVO0unDxO3ZiWGdqeoHMPAkAUARkFcqpO5
         rMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=gUHwIlscapaSc4PJIgTVoz9RXB8PP3k5WR3sQXsN36s=;
        b=LbS4JPF4fgCjo2f731pGmPzKicEwQauMkBfjjnu+YebntWtVfaOprTn3J2kGRaRSWR
         mKvmH0qIknBtClA0sVIeX1ezjoq+eL53SlXpUL1t53qwoLp1pXS55jcST+er9pxm0UCL
         MhQsUevhXmW4V4npDJK0R1tzk93nIAYOixcxBlqrm60kexDXh6T6C+moEYczTv78G2Jn
         TbCdiJNQVEVYtvrPg0JwdPR98RIvEIi7523/DmWMrDKEmXnQJypypWezjdSaMoBcnLId
         gLkZNRR3SA/+XY5k3LIT/Pw6EJlWfXhyF0FKtuPRczPqcCFIkD65d6ugkMKa7Fw12X0F
         Uc0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si1338469ywd.105.2018.03.22.10.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3aM-0006d1-S3
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3Yu-0005nK-Ob
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3Yt-00034X-Ps
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:59:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35502 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez3Ym-0002sc-R3; Thu, 22 Mar 2018 12:59:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18414406E8DB;
	Thu, 22 Mar 2018 16:59:28 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D7502166BAE;
	Thu, 22 Mar 2018 16:59:25 +0000 (UTC)
To: Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <72681a04-d10d-3e88-0671-118a03466eca@redhat.com>
Date: Thu, 22 Mar 2018 11:59:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:59:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:59:28 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F2nhQUeOShD+

On 03/22/2018 11:51 AM, Max Filippov wrote:
> On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
>> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>>   target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>>   target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>>   target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>>   .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
> 
> These files were autogenerated, fixing them doesn't make much sense.

How frequently is the generator rerun?  Is it something where we are 
likely to revert the change because it needs to be rerun soon?  If so, 
then is it worth fixing the generator to output more concise code?

Conversely, if they were generated up front, but likely to remain 
unchanged into the future, then fixing them (even though the fix differs 
from the generator) will mean they no longer show up as false positives 
in future runs of the Coccinelle script.

I'm also fine removing the changes to these files as part of preparing 
the PULL request, if that's what you would prefer.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
