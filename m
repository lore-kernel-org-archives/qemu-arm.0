Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4752031wrq;
        Tue, 26 Jun 2018 01:40:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe+oJTgkM6ftHgP+KYM1mv+tlkk3m5ekb5aFOrgwpkf2D0b1teVKZtqSqSaKU6YtD2/e2b5
X-Received: by 2002:a37:6142:: with SMTP id v63-v6mr438940qkb.418.1530002418226;
        Tue, 26 Jun 2018 01:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530002418; cv=none;
        d=google.com; s=arc-20160816;
        b=AlYzSRTkFZvSEEf1SLvyD6KZcAfHY1LZzxEiLW8mG1MXVjJMg6UV2gUsPyeOMapQ9b
         yZQc3EU34HKPoGh4TG8PtESB4s24OpKyKzzPs1g4+63l94MAnPBthj7zT+IBjK3cShdN
         MulzurHujBALrgdFef4dQ54RauTbRVSWbrrowtZZbOjSRaRM+e1LNE9LsGNSjNZ9PxzH
         chnB+iNZcOIOsLjeNr+4CyO/MAl6MlhRHaoKaOf2t5yNKYon+WLdQBJVU8i+SiwqVZTv
         ooO+rbd42vbqM1sPWtI+RFiZbItOvEqbNRiAXq0K9X5DQiLAUrHNdHuat0xtqEttYSg2
         aALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=ND4dCXYWG2H2Csg5lWWScVd06qAuWe4v7rP9ZOgN+d4=;
        b=CZl60L5fJePtraMZjZdxB1m6eh1Xj/InqlJx8vu9JB1dD+4f4USd6YUfFTOO4PMgXw
         E9rXh5DM63+EUoa0vp5fJuc7hM/Dj3n5dReWWx6oAzjgQ/S/QrGpgg4m8+bNq6vcbnue
         zfQnJ6AQeIk1gy8aWYFh7QZuQDcO7jK4c4JgZORjm1Vvwz9hEE5zavCvYRWbQ+1F2mmP
         Q1Qcp9mocdPBx8Kan5FAS1Nd3fCpOJdDdgXo8/jR/MlWeLE1B3yb/xwu/Qdo9+k2iQrR
         ciwtt2+YDVmfZL5cqvTwSbIt5v/gPjXoGxdWvlMNglp1iazerj4LTDGBoQ1Sjc7frWl+
         JHTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34-v6si434785qvp.83.2018.06.26.01.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 01:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXjWL-0003ux-O5
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 04:40:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjWE-0003sQ-Jx
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 04:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjWB-0008VO-CL
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 04:40:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41634 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXjWB-0008VC-70; Tue, 26 Jun 2018 04:40:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8893B7A7E8;
	Tue, 26 Jun 2018 08:40:06 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71E782166B5D;
	Tue, 26 Jun 2018 08:40:03 +0000 (UTC)
Date: Tue, 26 Jun 2018 10:40:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180626104001.617d4ea9.cohuck@redhat.com>
In-Reply-To: <1529056145-6404-1-git-send-email-thuth@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 08:40:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 08:40:06 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3] loader: Check access size when calling
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2duToExQkf/

On Fri, 15 Jun 2018 11:49:05 +0200
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
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Grmpf, this conflicts with "s390/ipl: fix ipl with -no-reboot" in
s390-next... do you want to rebase it?

> ---
>  v3: Fix the check in find_rom()
> 
>  hw/core/loader.c     | 10 +++++-----
>  hw/mips/mips_malta.c |  6 ++++--
>  hw/s390x/ipl.c       | 13 ++++++++++---
>  hw/sparc/sun4m.c     |  4 ++--
>  hw/sparc64/sun4u.c   |  4 ++--
>  include/hw/loader.h  |  2 +-
>  target/arm/cpu.c     |  2 +-
>  7 files changed, 25 insertions(+), 16 deletions(-)
