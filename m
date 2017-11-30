Received: by 10.223.159.82 with SMTP id f18csp75195wrg;
        Thu, 30 Nov 2017 06:55:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa8xIymLd2apcAWq1+FRjinEA/+njElE8tFaM7HuaysYX1yE7wayWnbUy/RntkbRUBmYGN1
X-Received: by 10.37.130.138 with SMTP id r10mr1648572ybk.89.1512053742014;
        Thu, 30 Nov 2017 06:55:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512053742; cv=none;
        d=google.com; s=arc-20160816;
        b=mpi1l3sDLVAViSSW/mzIttgxXXsnO325O5x7/ojRjLfbZP3HwYnPi78us/YHOV7ggE
         nEx8EC3ioVw4lHTdeU5g6glJxkjNkG/PINsA0U/WDKnmBlMbUYQOqduHG80w21nHo/Fu
         kfLIG203jPZLgdC75yX1NrFqTNL+X8Ey/gRaMIeA0pONwPiYrpCKf06PjjyhmDGmyzgJ
         XZ9swm6HukrcCzCYME1rOHE7XvHGIK64uNty7va3gsU61xrSJY0vm0OyMOuoap212XI5
         KQ0Kegzr4PQezjn8da1CBdCPf9WIJqbO7eqfzFX7qEXs+HVMLDuJViQ/4gOJE6uEKfvE
         8Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=jly/uOgSUNUyfjy3joxW7sXt/1ECsjg97/XU9sF2C2M=;
        b=jQmuNa4f24yCg8qliaM84paa0Y+5tybQ//FxDkWLKr87iQRswbmIK+MeGz1MFTONjb
         CvlHZ0bENdoq8BHt2/ETxySITMgfSH81c4ASpzUhlrRudi8fTlw7yJnXbctGg/cYPZr0
         ePxaV0oDO32SHA/7pRsdAlUkzUr0BFVB7o2zq9oTh4xRYbC0iLdkgh3hgnAUzp9kaOQ6
         nvuuk540xPBLfAkOB2CpQvEsS2QyHOAFfk6OuR7oHzkcVmxnTh9ZUz/SjLt7STvKsXfL
         2d9H43m3Trg5mZBe3RIcuJmvBA/TaGq1gltngHapZpUEnkOtEInRq93cwjXJM+5co6Qz
         nVYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10si824301ywc.241.2017.11.30.06.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 06:55:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKQFZ-0002K3-By
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 09:55:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKQFO-0002Ib-Vi
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:55:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKQFO-00032f-4H
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:55:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKQFN-00032Q-QD; Thu, 30 Nov 2017 09:55:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6636980477;
	Thu, 30 Nov 2017 14:55:28 +0000 (UTC)
Received: from [10.10.122.213] (ovpn-122-213.rdu2.redhat.com [10.10.122.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54C765D9C7;
	Thu, 30 Nov 2017 14:55:03 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
	<20171130163902-mutt-send-email-mst@kernel.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <348c5850-b1b8-2456-9c83-f17160d6b670@redhat.com>
Date: Thu, 30 Nov 2017 08:55:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171130163902-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Nov 2017 14:55:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "open list:New World" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7px25HDpfunI

On 11/30/2017 08:43 AM, Michael S. Tsirkin wrote:
> On Thu, Nov 30, 2017 at 07:41:59AM -0600, Eric Blake wrote:
>> The point of writing a macro embedded in a 'do { ... } while (0)'
>> loop is so that the macro can be used as a drop-in statement with
>> the caller supplying the trailing ';'.  Although our coding style
>> frowns on brace-less 'if':
>>    if (cond)
>>      statement;
>>    else
>>      something else;
>> the use of do/while (0) in a macro is absolutely essential for the
>> purpose of avoiding a syntax error on the 'else' - but it only works
>> if there is no trailing ';' in the macro (as the ';' in the code
>> calling the macro would then be a second statement and cause the
>> 'else' to not pair to the 'if').
> 
> Shouldn't matter if everyone puts the statements in {}, right?

Correct - where we follow our style, spurious ';' don't make a 
difference (other than they might trigger a warning in a very particular 
compiler).  But it also makes our code harder to copy-and-paste into 
other projects with a different style.

> 
>> Many of the places touched in this code are examples of the ugly
>> bit-rotting debug print statements; cleaning those up is left as
>> a bite-sized task for another day.
>>
>> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> We can't really rely on code still building for this to do the right
> thing, can we?

Some of the uses that were changed are in dead #ifdefs for debugging 
purposes - the only way to still compile is to turn on the debugging, 
but that may fail to compile for other reasons (if the format strings 
have bit-rotted, for example).

The only sure way to know that this did not break anything is to audit 
that for every macro where I eliminated the ';', all callers of that 
macro call 'foo();'.  I did not perform that audit (the patch was 
mechanical) - but am willing to do so and reply back with results if you 
need the extra confidence.

>  I did my best to look for uses and I think it's OK, so
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> but I'm not merging this.

What tree should it go through instead? Does it need to be split along 
maintainer boundaries?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
