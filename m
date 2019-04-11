Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7035378wrx;
        Thu, 11 Apr 2019 03:58:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylf3R3r033FnDNd+UT+t5SdcobWTY0UgCrvzURq8YeACdZO0HG5KpnEXfeeolKHO9ctFkB
X-Received: by 2002:a5d:684e:: with SMTP id o14mr33210509wrw.138.1554980295841;
        Thu, 11 Apr 2019 03:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554980295; cv=none;
        d=google.com; s=arc-20160816;
        b=TuYLUA2tmYMrrh0ccM4wfT+OR4U+E+WRhZIoCjbnRNLedyScpWDe7+7WeVGC8v+bPo
         ElrdhBo65dHp7Jihlev22QPhriC0TgPVG0STcNkPF9JAV6QfGIGcEvoZLbknnXYY2gtg
         UDIZja0yyx7uMUhT9ytrYlNm530W9ImZOpb7be80kqYBi3oDKriJ8+KnjfRxT/vKabEs
         kteKd6MsO/DtXqLiBBBPuNEEiVGs75va+3M0KSxRvFomcEm9rPDHud9KFJrsZXbIMI2A
         wRWjQT07nB7NDsZiNLoxszNEqYU3K5VhIQwBEI+UfAynvsmXyPN2E3XrvGAOqTkBQNUZ
         VqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=CthvNputu8pbRiOmNrDrSIS8ewjHDeuenQFnsldKBwo=;
        b=pYlZqAuEHFnrCC3BpeWjn+XymvETeLz6fOEJH8+SoOzv1RrMaZMGFuyRABptFRYUUj
         7KdhFM2dtsHkUdVIRYsSA/qIDxHaowJjRshumrRiKcShXu+SidYvPUYsWDb+ctK2ghzj
         b9aKHPZQycCz0/GBouL9tH8keNGb4shpeWqXidD7z9RSdvF95KDyms884nGUcgOeofUZ
         vuQCJlv3nxAtwO5UywOwUNXSYXAjPbOPor5aRn161Kl/ZpfuLlk2wlEr1JQZelHCoVNT
         fWH5ULFG2OV6Br7DlC7EkD4L630r56OB5QKgk/8Hip08dfo5gAw8aesQaKLptpaV13Rg
         RgzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si22824086wrx.20.2019.04.11.03.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 03:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEXPH-0007ZJ-05
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 06:58:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hEXOR-0007Xd-DP
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 06:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hEXOP-0006qz-GT
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 06:57:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50336)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hEXOJ-0004ws-Mk; Thu, 11 Apr 2019 06:57:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8418A3082E03;
	Thu, 11 Apr 2019 10:57:07 +0000 (UTC)
Received: from gondolin (ovpn-204-124.brq.redhat.com [10.40.204.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B36421062225;
	Thu, 11 Apr 2019 10:56:58 +0000 (UTC)
Date: Thu, 11 Apr 2019 12:56:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <qemu-devel@nongnu.org>
Message-ID: <20190411125655.7feab799.cohuck@redhat.com>
In-Reply-To: <155497852263.12882.17138118894178379111@76452e4e88f2>
References: <20190411102025.22559-1-cohuck@redhat.com>
	<155497852263.12882.17138118894178379111@76452e4e88f2>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 11 Apr 2019 10:57:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw: add compat machines for 4.1
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
Cc: fam@euphon.net, peter.maydell@linaro.org, ehabkost@redhat.com,
	mst@redhat.com, david@redhat.com, pasic@linux.ibm.com,
	borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4zBMFdtBxE6D

On Thu, 11 Apr 2019 03:28:46 -0700 (PDT)
no-reply@patchew.org wrote:

> === OUTPUT BEGIN ===
> ERROR: spaces required around that '=' (ctx:WxV)
> #58: FILE: hw/i386/pc.c:118:
> +GlobalProperty pc_compat_4_0[] ={};
>                                 ^
> 
> total: 1 errors, 0 warnings, 160 lines checked

Yeah; trivial to fix by whoever applies this.
