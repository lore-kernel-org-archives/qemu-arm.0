Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3901167wrq;
        Mon, 25 Jun 2018 07:53:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9CPe0HcHFfZnSRGSIto+0fKkP8fNY5t24jNkUhNXUhMEd7qVmaQK/mXQ2zcibmT0zKr1a
X-Received: by 2002:aed:3607:: with SMTP id e7-v6mr11045952qtb.385.1529938401807;
        Mon, 25 Jun 2018 07:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529938401; cv=none;
        d=google.com; s=arc-20160816;
        b=RIjqRthYU2BtSE1l6v6XHgdGNxN2LtmoRXBym7tgV7xcLcZfz0AEHKqKfy184ssLrb
         Yre5yX9BNsXzm8jw1lVq9gCFtSTunnuk5Qqk6YaFFiYOEvMtu+UOUl1tH2jFfkZVcBUY
         +K9bpNiN3O4r9Wp6jVoo6NY0mmk017D5Fr51+WGQEwfAni2mwOgzINXy94aoaBchicd6
         RGOkTR8HAptCfW0FzwdoxeJcsmA+E+4mVwij3msTNn9gsdoKOjDYwpmIFSq0bIAE/vhr
         o+mVKlPoID7O94z8xfMRGxUC8CqcOqmk94wL58aTjWjm81Eq9ns9hvXpcW5Ue7Ag97p5
         kwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=AQOZMJbaYtM+X6MB8c2k41A7LCIMPJ40qvxqDksPM30=;
        b=gkC6yFx2+3bV8aUvb6tN+93ceKNxotRLWg1xY24NSexoMJbQ3ItJbgj1MPCsQNUr/Q
         E3GS1qt+uNF3RvGId1xDV8qxCbt4YriK2zUBe2C1r2TZ6EUat4b59zX28v8nAY3PPYpS
         UIovymb34zOILBdq9rdDhST6/JxVYlTgKPJnNNABo3+KiZsgsbgkUA87uKMDXCtoXo26
         ZtKN89lJEu0RyEDbscGiPZz+SkCvG1E1sGSRbcgP4/ukHwou6FV/lCW6K1EBxr5EcU94
         ywepJ9eoEANz6rxnyPdWtWLkjxfdAXB707+ErUF5m141OQRUXT0FBp4vLZwwZ20z3UFe
         JONg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u43-v6si2031922qtk.112.2018.06.25.07.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 07:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXSrp-0002oa-5Z
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 10:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXSrc-0002oE-Bq
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXSrX-00036q-DE
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 10:53:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37128 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXSrX-00035t-7Q; Mon, 25 Jun 2018 10:53:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F4D27C6A9;
	Mon, 25 Jun 2018 14:53:02 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D44352026D5B;
	Mon, 25 Jun 2018 14:52:59 +0000 (UTC)
Date: Mon, 25 Jun 2018 16:52:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180625165257.5d8a9773.cohuck@redhat.com>
In-Reply-To: <93f1dae5-e071-41f2-a1b7-1fbfdbe7917a@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
	<93f1dae5-e071-41f2-a1b7-1fbfdbe7917a@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 25 Jun 2018 14:53:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 25 Jun 2018 14:53:02 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] loader: Check access size
 when calling rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /+fvlsdtrJI2

On Mon, 25 Jun 2018 10:31:52 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 15.06.2018 11:49, Thomas Huth wrote:
> > The rom_ptr() function allows direct access to the ROM blobs that we
> > load during startup. However, there are currently no checks for the
> > size of the accesses, so it's currently possible to crash QEMU for
> > example with:
> > 
> > $ echo "Insane in the mainframe" > /tmp/test.txt
> > $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> > Segmentation fault (core dumped)
> > $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> > Segmentation fault (core dumped)
> > $ echo -n HdrS > /tmp/hdr.txt
> > $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> > Segmentation fault (core dumped)
> > 
> > We need a possibility to check the size of the ROM area that we want
> > to access, thus let's add a size parameter to the rom_ptr() function
> > to avoid these problems.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>  
> 
> Ping!
> 
> Could anybody please pick this patch up? Qemu-trivial seems to be pretty
> dormant these days (?), so maybe Paolo via misc? Or either the s390x or
> Sparc tree, since it fixes a crash on these machines?

If nobody else wants it, I can take it through the s390x tree. Would
not mind some more acks, though.
