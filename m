Received: by 10.25.0.23 with SMTP id 23csp3116155lfa;
        Fri, 9 Jun 2017 08:56:57 -0700 (PDT)
X-Received: by 10.55.77.2 with SMTP id a2mr3630463qkb.156.1497023817531;
        Fri, 09 Jun 2017 08:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497023817; cv=none;
        d=google.com; s=arc-20160816;
        b=Kr2s+b5xe+jc7JAw5fsTWDKV1X7vMq06hMAOTslxpmvqNRtU+zMmKn0+HD998Y+Ty5
         k5RVmWKDaIIw16l3ARd5DXhMGEp1VRkCkOZtDAezkdcjT74WFMivS0USWX5mb/fdGycG
         vZUXqGuuLc5XDDu8HYWpckRKFobvXBD/SmdxGTnVjymEzPfxOZZxxOWITRrCx0lVXKhn
         FlB7HFFnJ6Yo+LTNUy0iF07V/Iq2Cb2motpqpoKwiJTWTLOIRlKKx78Vx1D9bvNwDmE9
         g4u7QDebO7/ZHUpEHXDppou8oHVauhFxM9Yozgvg/tt16WRPdPRw7b0lRGVnxG/9ceJh
         y7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=lIVUAIX8oG/6M0jvUXftpH1q8NTiSn4ufFisrY4Zkr8=;
        b=t8N35UFzji8Q1F6IcWFDt8vYuuZ7uwIM6Fnxwa8Lgap/C+bmXt3rg9NSlvTCjED9YG
         U6bN6KOLOanJJBEVXqMNhiBej7i330Ccja1DfXpYFEeAurOciJjcGCAt5JKOOiD3rhDN
         0k3O9iJvQDadERU1nA8nGQ31NK6hd4jnm2xvM0utsNnAUWuiuhFw3YwLmijUtDSd9S5G
         s4h+zAbox+AjQBjhLKnTn/UwuSS8K3uUNP/ZxTisunfaUb1gpDBhA3hPZLJH29LHCaXy
         Vg33nw4BZl9+/EsBv92iWBVjc8gj8EK3zy7O6yoUmKnt1EHRqZMeAW4FAhHRe4H6TM2P
         FD/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si1366758qtr.331.2017.06.09.08.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 08:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJMHO-0006Bd-Ug
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 11:56:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDv-0003Kf-HS
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDu-0005IL-OL
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJMDu-0005H3-Ha; Fri, 09 Jun 2017 11:53:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6421C80F7D;
	Fri,  9 Jun 2017 15:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6421C80F7D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6421C80F7D
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA5797BA0;
	Fri,  9 Jun 2017 15:53:14 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-3-git-send-email-eric.auger@redhat.com>
	<5939F9B2.5050708@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ef34d3dc-91c2-b953-2257-f6415e1992bb@redhat.com>
Date: Fri, 9 Jun 2017 17:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5939F9B2.5050708@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Jun 2017 15:53:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 2/4] hw/intc/arm_gicv3_its:
 Implement state save/restore
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, Vijaya.Kumar@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4n42W6rKhQaq

Hi Shannon,

On 09/06/2017 03:28, Shannon Zhao wrote:
> 
> 
> On 2017/4/14 20:46, Eric Auger wrote:
> [...]
>> @@ -43,6 +50,7 @@ struct GICv3ITSState {
>>  
>>      /* Registers */
>>      uint32_t ctlr;
>> +    uint32_t iidr;
> I think this should reset in gicv3_its_common_reset

Done.

Thanks!

Eric
> 
> Thanks,
> 
