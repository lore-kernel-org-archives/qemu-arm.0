Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp546990wrq;
        Fri, 15 Jun 2018 00:58:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL6xmClDqoHH8DGr5F0apt+nzODgXY8xVw4qAHBcXZJkTK4vFgt5PwjEkZ0rILRquhZjDye
X-Received: by 2002:ac8:3338:: with SMTP id t53-v6mr485772qta.312.1529049495309;
        Fri, 15 Jun 2018 00:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529049495; cv=none;
        d=google.com; s=arc-20160816;
        b=bGG3VL+ZQVfWxRgd1EtgI2Vb/mxd4jOmVTVOZmDaxNpRKP9DH7/FTGjMqcQXQj1f6h
         mEdmfLnKBLAd0mB5QDYeWOGebN8sc1a9MpHER8Ro+EI5Fv8gn25KG7oSZRX49FZCJqDd
         7x63sQXF0LYY80OI7rKdkoLpRDZAYRyyPLtqtxJLThydIySEDe24l7YtbHdLbEut0gYc
         1ki2s2Du49l3jYcwBC8/Rnbs2DlA70zAeRZSnyKxid413zaow0VwZByz+fnH2Y914Qda
         bn+hVW6DK45IBx71CJu6stYs3G7bJ8M1L4g2Tz2iXgU2AlTUBDbe3HjsmJDeTHUUE9qA
         SCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=3+vz0qhiugU3Uj/hSa9JOUhymGYLVYL5iQSsJrmXYKE=;
        b=M5XO0utR/Aq5SNlOSybRhNZpt9wbyHQIrxUXooXxDUdXWcA2h0jPsmLbGagvtgt1+a
         tO+dzuPJsamhD3doCLSRsNgOotbAET6Oo1l9BOm8QpCKCn0o0DBOaCC0euQNRc2oIJYc
         YNWGT6KpL/4Gdh5nhdEHAg2Koh+OljSIeBX9ckzRKQ/Pd6h4LU20ztgHM7ju1xWcaK2t
         yAqblu3vNryRu6umSmB6B7pRXGRSlQTOYO7EWYbQY5tsdR0E3Yq0hO2pjQyFY+URNTrB
         jrPU4hJRLV/jq36AzAqljUFr6QdF5uHrzHR4T7S2DI1eHdDr0+o5rEwCfKkdV23HSEVE
         uctw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184-v6si166883qkf.59.2018.06.15.00.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 00:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTjcc-0007Ig-Si
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 03:58:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTjcQ-0007H4-B9
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 03:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTjcL-00030d-DW
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 03:58:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59800 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fTjcL-0002zu-78; Fri, 15 Jun 2018 03:57:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 887FE859AA;
	Fri, 15 Jun 2018 07:57:56 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A39B10FD2A9;
	Fri, 15 Jun 2018 07:57:54 +0000 (UTC)
Date: Fri, 15 Jun 2018 09:57:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180615095752.536f4642.cohuck@redhat.com>
In-Reply-To: <1529045897-25260-1-git-send-email-thuth@redhat.com>
References: <1529045897-25260-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 07:57:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 07:57:56 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] loader: Check access size when calling
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
X-TUID: qZi6VQPcPy0x

On Fri, 15 Jun 2018 08:58:17 +0200
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

It seems nobody managed to trigger the other places yet?

> 
> We need a possibility to check the size of the ROM area that we want
> to access, thus let's add a size parameter to the rom_ptr() function
> to avoid these problems.

Makes sense.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/loader.c     | 10 +++++-----
>  hw/mips/mips_malta.c |  6 ++++--
>  hw/s390x/ipl.c       | 13 ++++++++++---
>  hw/sparc/sun4m.c     |  2 +-
>  hw/sparc64/sun4u.c   |  2 +-
>  include/hw/loader.h  |  2 +-
>  target/arm/cpu.c     |  2 +-
>  7 files changed, 23 insertions(+), 14 deletions(-)
> 

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
