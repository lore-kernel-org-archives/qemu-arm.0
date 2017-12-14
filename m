Received: by 10.223.159.74 with SMTP id f10csp6073990wrg;
        Thu, 14 Dec 2017 01:03:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBou9MOngECDAefamKNemu2gkiqu2iqIROk/9k4anWULcxYZCtcGawrJVpXg/DArbiCjFufzo
X-Received: by 10.13.243.195 with SMTP id c186mr3608010ywf.170.1513242220056;
        Thu, 14 Dec 2017 01:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513242220; cv=none;
        d=google.com; s=arc-20160816;
        b=x+dAVclSCo6WUUcOe9tS5AhzuxI+D7bmTb+Aeeb3dob9rOb/yWOhEyWs9NIL3yk0mR
         2DHe9vZQhZIDWjm1oQi74tmeORnJNrCPSz/NG8lVJXgNlvrQEDgFXpwumVrJG/UN09Vh
         TyCsuxmrfPx/uhx/N8HibiBMQlbJei6bE7FLJJZo7vvPcNKdcoaciDU4DNORnhxXNJX3
         piJ3Qe+nifOhE1w3YQrxtmoQy9Stm8RRfZqizBw+4lWEyJ5qNqEAPsyMZOiNmeoyRzDA
         X72gRHwycKA22LlV5ikGbttLMk8xG+DC6GUxRs5i5YNTPCScjcKLGP3iRmGBBGEbrmnu
         MX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=zQPiJAgB+Lgt4kpzhrVYPjV9KFfcGAj1dwDUVk2idD0=;
        b=eW8No4J7rOXmtZfAoOYoYotjj222T2XmGibY9/k20UQaVZgfY4ic18wbs4UMxXGpfO
         ZykDQ34IpYluWLudVtgDFelrGlpZkF0OC31vy+pszKyKGevE/9rfaLe/0l9pOskYOnY0
         ZVRYJwjHZE+Khs/+gOIc9ePPqoEPKx8DRQXTr2uwMh74qkJgorVZ06M2mIu6+HAgq9t/
         ezOsuvGwn8mwN1F8H2F1ycxFj9NwalxW9lIYlXGhThCJdw2mMijhrfWwM3fRIBmJukIx
         KC1++18M8cXxoEmRBzj4Itlk715GgvctoVL3+YM+JcZm7yG1HCVxC/v1mflWSY4uYsF9
         LSIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c188si725629ybb.610.2017.12.14.01.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 01:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePPQZ-0003iA-GM
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 04:03:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ePPQP-0003fS-JF
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 04:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ePPQK-0000w2-JT
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 04:03:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1ePPQK-0000sw-Da; Thu, 14 Dec 2017 04:03:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B47F04900E;
	Thu, 14 Dec 2017 09:03:21 +0000 (UTC)
Received: from [10.36.116.220] (ovpn-116-220.ams2.redhat.com [10.36.116.220])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6815EE15;
	Thu, 14 Dec 2017 09:03:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-mOzfHhGt0jXtTVMe4_GGp6bg_SK1R4JBbQxpw2+gokg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <96e94933-7381-7448-5d3b-ae8ad14d2097@redhat.com>
Date: Thu, 14 Dec 2017 10:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mOzfHhGt0jXtTVMe4_GGp6bg_SK1R4JBbQxpw2+gokg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 14 Dec 2017 09:03:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/8] cputlb: Support generating CPU
 exceptions on memory transaction failures
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ynKb3omYKnr

On 13/12/2017 17:39, Peter Maydell wrote:
> I was looking at a bug that involved stepping through this function,
> and it turns out that the value in the variable "physaddr" here is
> not in fact the physical address of the access. It's just the offset
> into the memory region.
> 
> This doesn't matter for Arm or Alpha, which don't actually need the
> physaddr for reporting the exceptions, and those are the only
> current implementations of the transaction_failed hook.
> But we should fix this so it doesn't bite us when we do eventually
> have a cpu that needs the physaddr...
> 
> If we have a CPUIOTLBEntry how do we get back to the physaddr for it?

iotlb_to_region only gets the MemoryRegion from the MemoryRegionSection,
but you could actually make it return the whole MRS.  Then you can sum
the MRS's offset_with_address_space.

Thanks,

Paolo
