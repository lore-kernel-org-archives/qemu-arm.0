Received: by 10.28.71.155 with SMTP id m27csp421781wmi;
        Fri, 23 Mar 2018 05:40:28 -0700 (PDT)
X-Google-Smtp-Source: AG47ELumPr92qeJcHX7KnDg0CbD63nnFpSMxFGwYruwkwRj/VDxOlZzv6GXJa6zM82AGVrqa9OMb
X-Received: by 10.55.149.135 with SMTP id x129mr41422937qkd.279.1521808828845;
        Fri, 23 Mar 2018 05:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521808828; cv=none;
        d=google.com; s=arc-20160816;
        b=mG4nt/yr24m5rApNKNy4RYLmd985KMfrHL4GcpnXe0Ft8Ap2N0cfXtZFsGXKswwBZH
         eSMRziQF4M3aYDupY4pUqhAvlC0Bg1pZo9WfYgc2CefFFhqbhlmjXZJEsgCKhW6i+wFn
         HBYz627LESUDYkQnHv6235XBbbDbndTx1ePGV2+gVchnTudCRO7L6RX3rOPgPI06E3Vr
         rA3UEEZKrxcHZHj9nBZYAoYkAbZOg2BR23bF31vyY+mmLObTmjVl/2HaL5o+V8bCsjM9
         d4gGNWa0bXcJWg5A0QJH7ZuyQeQpCiMq98tM2k308S1KqUje0W2Tz4GqKv2P/fgSvZms
         aQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=414UyZrNtC3YBJMmKb3MGwGQdrJNT4xtROxoD2Tpux4=;
        b=KefKDUUuH+e2SqR+wR4IhTXOA4dmcF+tjYKNW13+xNIBIXmYEwnag+xNOpq9ozGg9p
         ctFaKtPL1TJwakWYSkK0oYcQgKgx3geVOw6KV+xUopsDq3RC+srYlxKVIZaX4295+XcZ
         vtGInolVzLADq2ELNdgJtVzreW9e6I7m+USsmS6+aaaNVF0sidotRVVawh47qm4zdQ0I
         60L8IAvQXH2hOqUU8l86EJrRQm+483tjMzA6Lr7N91HmMjC7Ee25hrhIVQNJ32HwQLAI
         jRHvpeR5Vf9YggUNXPI2i/SWbzt16xTv2hEj+WzId3FCsAM0PKefYS8TrCXXcuQXgwRc
         gpKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si3751088qkf.165.2018.03.23.05.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLzg-0001al-Cz
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:40:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezLzX-0001YW-Gc
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezLzT-000559-MN
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:40:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46662 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezLzT-00054R-Hg; Fri, 23 Mar 2018 08:40:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C65CF77068;
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC)
Received: from [10.40.204.35] (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D09962023231;
	Fri, 23 Mar 2018 12:40:08 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <e5a6598a-6a0f-5dbf-f7ab-6ade2059fcce@redhat.com>
Date: Fri, 23 Mar 2018 13:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:40:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 0/4] coccinelle: re-run scripts from
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
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMFgBTwHbbV5

On 23/03/2018 13:37, Michael Tokarev wrote:
> 22.03.2018 19:12, Laurent Vivier wrote:
>> I've re-run some scripts from the coccinelle directory,
>> and they have found some problems.
>>
>> This series fixes them.
>>
>> Laurent Vivier (4):
>>   error: Strip trailing '\n' from error string arguments (again again)
>>   error: Remove NULL checks on error_propagate() calls
>>   qdict: remove useless cast
>>   Remove unnecessary variables for function return value
> 
> I've applied patches 1-3, but the 4th patch is a bit.. interesting.
> As has already been said, it touches auto-generated files, which is
> sort of fine, but it _also_ removes comments, which - I think - is
> quite a bit wrong.
> 
> I can apply just selected hunks, but.. hmm..

Thank you, I'm going to rework this one.

Thanks,
Laurent
