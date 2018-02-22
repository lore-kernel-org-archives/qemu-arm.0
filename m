Received: by 10.28.71.27 with SMTP id u27csp2470388wma;
        Thu, 22 Feb 2018 13:55:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227EDGGaoXs5Zx0kLKk0ff0qh0amPKrXIP6/HGS7DeEpz3W1RM+SZgq+fOpnLBjz+KIGSBTV
X-Received: by 2002:a25:ccc6:: with SMTP id l189-v6mr5861026ybf.57.1519336529906;
        Thu, 22 Feb 2018 13:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519336529; cv=none;
        d=google.com; s=arc-20160816;
        b=ctL7UUTM/4cJFnXALpsGNIywPWptpfosydxAQaC362z8+KrnjTnRZmtfGAEE/AuQ8m
         1cxAu4ImLCSJagY7IJHQDsebngtfZ7197MzJbpfXVsKjQLVb3t3AZIk7j078kC5T9Nbw
         RBJ8vM2qwA7ujqaqrTteH4QibLOD99GDNWYEpYcJebPA9qhx6+AtcZnCdQacTSYYnQ8J
         kvmMyPJjBWyqf2LwuGt5yXvw0NLgeeeWEDR0flI0ivpQ6Qg2dfTXFW+su+Cr3vG13dT9
         5pEzS9T75cTD1dormvcaLKoJBG+ZsoHwSypUQqiq/IdIqv3AScw+tWVKXriLL3t/j2xZ
         45CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=ht19QJnJT1CEOo67qDUXreVgVUzPmFR6qXpnJMe3efQ=;
        b=uwHKo9ubb1wL2o/nUHfi6k6KugS3AWSZKreWO3HCKw/T9uBE8Bi/HoUmE/Fb4mgiLP
         TH60Gt7tXdcxxOTCkbfpVacCpJCEDe+dGbJnX41CjawmtXACA3rDsf3AYaVKfUyN7Olq
         vY+MnRiCPrug6mLaxGxSuffy42rnnjN0JCZ/Yd5zAVMfIF+d1ebsXPJ8xue7THJFV7U5
         NGCUfSxYL/FepxVMyvLJVhOgEx9BemA3YXGRhaxDpWzenbwk/FhbDMfvbZvOkPKsoYw5
         ODkajXcvDD6PafxIeVphqhdkCv4XOPXArSPPQ+eNk98hjVNyW8US5l6d1JQJSy7CoF7x
         I44A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d129si161298ywf.154.2018.02.22.13.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 13:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoypt-0008Lt-D9
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 16:55:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoypi-0008L4-I3
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 16:55:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoypf-00031z-Fg
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 16:55:18 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33692 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eoypf-00031i-AN; Thu, 22 Feb 2018 16:55:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2530840201A1;
	Thu, 22 Feb 2018 21:55:07 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4252024CA9;
	Thu, 22 Feb 2018 21:55:00 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<151932620203.726.14470172414364772802@bdbb90650ae5>
	<CAFEAcA90bTkHb+AF2W7Jv3GMENo0Ni3rK6GnzNVtk+RF89VuCg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <12157307-d058-ba0d-affd-779a92981928@redhat.com>
Date: Thu, 22 Feb 2018 15:55:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90bTkHb+AF2W7Jv3GMENo0Ni3rK6GnzNVtk+RF89VuCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 22 Feb 2018 21:55:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 22 Feb 2018 21:55:07 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/19] Add Cortex-M33 and
 mps2-an505 board model
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Fam Zheng <famz@redhat.com>, "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKjbJ/O/lgGm

On 02/22/2018 01:11 PM, Peter Maydell wrote:

>> ERROR: line over 90 characters
>> #54: FILE: hw/arm/mps2-tz.c:21:
>> + * https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/mps2
>>

> Does anybody better with perl and more familiar with checkpatch's
> internals feel like tweaking it to suppress the over-long-line
> complaint for URLs ?

This one-liner appears to do the trick; I'll submit it formally in 
another thread:

diff --git i/scripts/checkpatch.pl w/scripts/checkpatch.pl
index 1b4b812e28f..0d3f753c665 100755
--- i/scripts/checkpatch.pl
+++ w/scripts/checkpatch.pl
@@ -1447,9 +1447,10 @@ sub process {
  # check we are in a valid source file if not then ignore this hunk
  		next if ($realfile !~ /$SrcFile/);

-#90 column limit
+#90 column limit; exempt URLs, if no other words on line
  		if ($line =~ /^\+/ &&
  		    !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
+		    !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
  		    $length > 80)
  		{
  			if ($length > 90) {


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
