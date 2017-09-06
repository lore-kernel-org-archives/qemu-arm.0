Received: by 10.223.172.38 with SMTP id v35csp269184wrc;
        Tue, 5 Sep 2017 23:45:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDG3fC1hVv3mdeNKS2knua5JkDgSdiYa63qVwAQpypklLJaeUBLZQB71nacH1PqJz4adK/E
X-Received: by 10.55.87.133 with SMTP id l127mr276775qkb.212.1504680352537;
        Tue, 05 Sep 2017 23:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504680352; cv=none;
        d=google.com; s=arc-20160816;
        b=fkTv+X2HO1JqJzVAbVTITl3Li7Kac9ZYF/vtnPPdCYBq+9ZhS1HZ/2OO+xUMbAhFUN
         nHOSll40QowUltrsQaZUZg9za3DCXSzczsYmxK2k/b/M97hDvWyqOowiFeEzPgK/+HW7
         Xt+zbrwg+KmwaLm+i9N8mfXVWOTHHusByVmJhbyUgfT6+FeE4vyHIEhTvinOkSkG+8dZ
         RGBbgw0NYA391OrEMXwJeN+2rSE0ez7UJhARqwaIpdxNj00AZTtrYuTY9NmJKdVT5hlG
         MD74/j5USTjpV5blgG8XQe+hEDWNbw/pQ/XQUBAjeFCLnm1xXyn9uEcysNc18KAjlwA8
         QUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=ZPDX4PHpcEr7BgWewxHrLmZdAZUAFlH5R4u5BPWwwGA=;
        b=PAjZl7N4iaKQMI2T6bS/dFtyCzonUZDQrisbFZMYh75BwyFAO6Lr4rtjPRJhd8JPU9
         9cpuCbQLl0HpC72ODdWTAFKuiEMWWsPQUZEw1B8j9lyRI9jN04Nczi0WTNQgtgkdbiY7
         rgwo4rcKeS5aX620L2wpTnEDesj/5DkOMl4HbsrtoXTJC06rsghm55oXYVrL+2ErPcTq
         PG9nHSmAbcNeltYbfw5x9WMC7/gpR04eButThmspHbJ5YgC3fMpiklsFwteNvY+t3xLJ
         tsAOwJXv76s1pM/kxL6HheKyjASfW19KMb5hJ/7pM6YFczzYZ2Lotm3uPxjMzdx+qY/u
         3CJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si2841223qku.52.2017.09.05.23.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 23:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpU5t-0000Hh-Va
	for alex.bennee@linaro.org; Wed, 06 Sep 2017 02:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1dpU5p-0000HT-LW
	for qemu-arm@nongnu.org; Wed, 06 Sep 2017 02:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1dpU5k-0007D1-Q6
	for qemu-arm@nongnu.org; Wed, 06 Sep 2017 02:45:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1dpU5k-0007Ch-Jj; Wed, 06 Sep 2017 02:45:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 943115AFD9;
	Wed,  6 Sep 2017 06:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 943115AFD9
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ppandit@redhat.com
Received: from javelin (ovpn-116-48.ams2.redhat.com [10.36.116.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B4F619C80;
	Wed,  6 Sep 2017 06:45:36 +0000 (UTC)
Date: Wed, 6 Sep 2017 12:15:32 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1709061202500.13418@wniryva>
References: <20170905112152.8851-1-ppandit@redhat.com>
	<CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
	<7FD21DDFE9A3784693E393AF276FE7D21F17E49E@DGGEMA501-MBX.china.huawei.com>
	<CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Sep 2017 06:45:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] 
 =?gb2312?b?tPC4tDogW1BBVENIXSBpbnRjOiBhcm1fZ2ljdjM6?=
 =?gb2312?b?IGxpbWl0IEdJQ1IgaXByaW9yaXR5IGluZGV4?=
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	niuguoxiang <niuguoxiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9edxgbFbtTnm

+-- On Tue, 5 Sep 2017, Peter Maydell wrote --+
| The code cannot be reached with a non-aligned value,
| because we register these functions via the gic_ops[]
| MemoryRegionops in hw/intc/arm_gicv3.c, and since we
| do not specify .valid.unaligned=true there, the memory.c
| code will throw out attempts at unaligned accesses.

  I see, thank you for the clarification; ie. within the range

   GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:

'offset' would be GICR_IPRIORITYR +0, +4, +8 ... 0x1c?

Maybe the patch could still be considered, not as bug fix though.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
