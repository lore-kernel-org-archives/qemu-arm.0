Received: by 10.223.159.82 with SMTP id f18csp63392wrg;
        Thu, 30 Nov 2017 06:43:25 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYtt0TlQzhE4IlV3Tdygy26uoV/5D09b/uSrVhLdzYSy5WOGuGvHV+4WD/aj4sbzc8nY/3L
X-Received: by 10.129.118.1 with SMTP id r1mr1595976ywc.437.1512053005500;
        Thu, 30 Nov 2017 06:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512053005; cv=none;
        d=google.com; s=arc-20160816;
        b=bOEBp7ZN+bmkOSyBMRfRgg9tgWANqBp7sf+oHfh3I/piu8Az2H7v/koWn9loyb5+UI
         Uk+q8dfjUYsYkQcYBoOLoGKGPx+ga4qIMJGnVsbmVGUxOp7uxe37wOWamYjuXAOc6uDv
         Tdfp+vJRLxNPWJz5pUoSvyXnVcn1AWjcUgC7lmhcjzLxUVO3ZRJeW/gA8dV1WtwiZYA1
         c/UsbZVvnOTQMsbZ2D+4lN2DfTIbwBaYonoH+Un8R2oKkSNqDa2kLO5qnpozA6y5pPpo
         Ev9knXK3yQsJNkpF2M38dRSIr8wSg1ZCwMx/EtKYzbjhTkxPqfq9OvAk71FbZjg0oFYX
         Cd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=6cdUD2WFJeN9M0aVsvQx5D3YEI5WOJb7qgPSMtXpxi0=;
        b=HNJoqDVGJnXe8aV6FJlduo1hmjavnjjbsgffwe/I+InADJskDj9tLXn65N1chKy3n3
         Dhq3XQ2idNS793RZKVQk2R3blPIsStQSrNSSAcOzITb8l4ILEfreDwFzvkrQNo1hdIaL
         0A6DaPT8g3OTEcygPdyHTBQDsOtDhV/+Ze+cfRZ6lVl6pyS84+v7xI4lsaFeSJ9Or2dI
         F9A7d9XQUS3GIfk2gLFYTqJOe2u7QcRlhC/fx+ttFDwgRwszzGfUDOwtE38gS7iL5rry
         +KDPHGRKFrU00PWR34cP//IwqrqOQLCyz7pITOh2SIfkrUOWtnxZ8asjB0Sl2/dASwaE
         bJ+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s85si859472ywg.311.2017.11.30.06.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 06:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKQ3h-00032M-0i
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 09:43:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eKQ3a-00031t-FS
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eKQ3V-0003PC-BI
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 09:43:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eKQ3V-0003O4-2j; Thu, 30 Nov 2017 09:43:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AD0E356F7;
	Thu, 30 Nov 2017 14:43:11 +0000 (UTC)
Received: from redhat.com (ovpn-122-157.rdu2.redhat.com [10.10.122.157])
	by smtp.corp.redhat.com (Postfix) with SMTP id F311A5C1A3;
	Thu, 30 Nov 2017 14:43:03 +0000 (UTC)
Date: Thu, 30 Nov 2017 16:43:03 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20171130163902-mutt-send-email-mst@kernel.org>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 30 Nov 2017 14:43:12 +0000 (UTC)
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
X-TUID: oD6Wxmd/S0fA

On Thu, Nov 30, 2017 at 07:41:59AM -0600, Eric Blake wrote:
> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').

Shouldn't matter if everyone puts the statements in {}, right?

> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

We can't really rely on code still building for this to do the right
thing, can we?  I did my best to look for uses and I think it's OK, so

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

but I'm not merging this.

> -- 
> 2.14.3
