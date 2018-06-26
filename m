Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4906653wrq;
        Tue, 26 Jun 2018 04:39:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcNk+afWNcH2fGd5tOYlOH7C0Vr1gAP3iOo+UAfL8es2hv7nuBqctEk2v81GaxRa28XVyYs
X-Received: by 2002:a37:85c5:: with SMTP id h188-v6mr942652qkd.40.1530013181621;
        Tue, 26 Jun 2018 04:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530013181; cv=none;
        d=google.com; s=arc-20160816;
        b=pKAoBQ/7AV/PHGy+6DcSIcoPYMbxHHdGnsAUYXveu5km5nILbdC2BnIiC2JZgDZ7IO
         7MkVfOQHCAbSpEywFQAbldpCE8QJooT5N8OKse6NALpQOEfY7TH2kx/nz6TT78s1lAcL
         7PIszKKzEmL/Hgr7giTlA2bmj3UeZof7MsP42zcX8yy83Q2c7GDx9QNJTDPfNImnLc8R
         Tdc7lPglW8qxoP87wMsRXnrV0lyyaTALAg4O6ziVY8glxnOB3bGmS5eC/YAQvL0K9Noy
         9ICgzvjBojVrqIqW6Jzgx4J6Y/Uk9eN4hipy7Q1OitU7meYtYLchPKphef/bE2Mq2WAB
         wm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=pJKbjdrd8q63WVl6XYjHKJFSM1TdLjD9PF3Wy0BKs9M=;
        b=AkQd9nJOsUaOuTFnQPBHZGD5UFrAvQGJyoPQ6jRGAF0A3A5Fe+69I58nDb2qPNRDQS
         uYiCq0VTZvapk0lY3FryQze+vFh6yXaiRouvZUW7lTTaCoqgO4HiMSpve5715DanbCet
         vQasku8efE0hM1pp4U2tVCjfrpUXelhQ0jTJ/9nPV5q5FGck6dFLPROB4iBRx/PkundM
         /8ktBForuYuD/O8+rGQmlfp93ru610GeIrJQN9HihCe0Fc0aX2RUgiAyI1H6A4qljSGl
         FrshQvYT2BPHpz/JD1CYIQkbXG763rpFmhnXKh9JFzJWbXVnuAP3ej2KJV4HDZCtJTny
         uQGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si1217573qvn.144.2018.06.26.04.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 04:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXmJx-0007XA-3K
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 07:39:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXmJk-0007T4-K7
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 07:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXmJh-00070H-Az
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 07:39:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47798 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXmJh-000709-6G; Tue, 26 Jun 2018 07:39:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90FC67A7E8;
	Tue, 26 Jun 2018 11:39:24 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B516C16878;
	Tue, 26 Jun 2018 11:39:22 +0000 (UTC)
Date: Tue, 26 Jun 2018 13:39:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180626133920.446d33b9.cohuck@redhat.com>
In-Reply-To: <1530005740-25254-1-git-send-email-thuth@redhat.com>
References: <1530005740-25254-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 11:39:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 11:39:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
	Aleksandar Markovic <aleksandar.markovic@mips.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAWDmOPwRnBG

On Tue, 26 Jun 2018 11:35:40 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The rom_ptr() function allows direct access to the ROM blobs that we
> load during startup. However, there are currently no checks for the
> size of the accesses, so it's currently possible to crash QEMU for
> example with:
> 
> $ echo "Insane in the mainframe" > /tmp/test.txt
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> Segmentation fault (core dumped)
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> Segmentation fault (core dumped)
> $ echo -n HdrS > /tmp/hdr.txt
> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> Segmentation fault (core dumped)
> 
> We need a possibility to check the size of the ROM area that we want
> to access, thus let's add a size parameter to the rom_ptr() function
> to avoid these problems.
> 
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v4:
>  - Rebase (two more spots were using rom_ptr now)
>  - Remove INITRD_PARM_SIZE since it's unused now
> 
>  hw/core/loader.c     | 10 +++++-----
>  hw/mips/mips_malta.c |  6 ++++--
>  hw/s390x/ipl.c       | 18 ++++++++++++------
>  hw/sparc/sun4m.c     |  4 ++--
>  hw/sparc64/sun4u.c   |  4 ++--
>  include/hw/loader.h  |  2 +-
>  target/arm/cpu.c     |  2 +-
>  7 files changed, 27 insertions(+), 19 deletions(-)

Thanks, applied.
