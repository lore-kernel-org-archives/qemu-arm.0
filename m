Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1196820wrq;
        Wed, 13 Jun 2018 14:09:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI1qyF9B3jfGD22sxRskqCGmz/p/azWZ+vx8sxSm9mcL1mj9TUP4i6RgfDUjbogXgrloGSN
X-Received: by 2002:a37:5d3:: with SMTP id 202-v6mr5715452qkf.81.1528924158070;
        Wed, 13 Jun 2018 14:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528924158; cv=none;
        d=google.com; s=arc-20160816;
        b=aeaQLh5u68RRWVique2nbhUWttj5arGevSLF7ANoKTltVsbwUbgw/BxRMpgYrrKYzz
         Jm4e7y+Ob/VKPYxvm/i7n5nrkAcQpRE0Rxy8AuydvPthLcrLDYRGv/cX7NLTUExWWdmL
         cCTCavFUW4nPvjfe9nyYHOuTAYTPKJdgHbX6GmIBDL/MnIzxRg39US06AO4udL3rY3um
         vxW2owdrBdFKm2MOIOegtUs3+E/fpUpKa59zePV1W/bKw7kJK47NwVOC1lTIVYV9kpxZ
         yoaqAj1q8HloaoeddEjn//PXckGjYMyhpiZcdxrkwJu9TN7pVM7VFj5nNIK8EVNUuegg
         kPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6W0H6ynArTN93PTGJUZKCih5gjCoUDzF4KICQ9EaJ8U=;
        b=yDzPxuHVTEkfl81ag+T0tdeg97I74JGuFGDtOYVPaOKGj0bwqHT/aRlzhw2pa54IvY
         Qo/3osblguY9sJ9xU+CB3dMUvUYUFLdtKrwcGT0x5MA1y2dHZrh2f8h2MgBhLPAqcpLS
         l3edpUD7/eyJyomIZegrKxDR0wXaELLwEs4FRF/qCc9wIMojHCFODfojdXEanByOyaqU
         VyOrJCLUAVQHpF6H9AXFBq0tkWqSp/LPHlkq3HyquPmSF05mTuz6efDbEolh0roj/yZx
         cyZooKHbPXJaouhNNcfj4Fyd9njKw/jZdBAAOZq1d0tOrbnXD3N3yl4755KC3HgDRq5Y
         zDyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s30-v6si2168468qtc.364.2018.06.13.14.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 14:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTD13-0005GK-HM
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 17:09:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTCxo-00030M-3g
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 17:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTCxj-0007M5-67
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 17:05:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43170 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fTCxj-0007Kr-0n; Wed, 13 Jun 2018 17:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C002818A6AC;
	Wed, 13 Jun 2018 21:05:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-122-190.rdu2.redhat.com
	[10.10.122.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B704911166EC;
	Wed, 13 Jun 2018 21:05:42 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-10-git-send-email-eric.auger@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
Date: Wed, 13 Jun 2018 23:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1528879723-24675-10-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 21:05:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 21:05:49 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 9/9] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s5DD1CeTuD0E

On 06/13/18 10:48, Eric Auger wrote:

> PATCH: merge of ECAM and VCPU extension
> - Laszlo reviewed the ECAM changes but I dropped his R-b
>   due to the squash

Was there any particular reason why the previous patch set (with only
the ECAM enlargement) couldn't be merged first? To be honest I'm not
super happy when my R-b is dropped for non-technical reasons; it seems
like wasted work for both of us.

Obviously if there's a technical dependency or some other reason why
committing the ECAM enlargement in separation would be *wrong*, that's
different. Even in that case, wouldn't it be possible to keep the
initial virt-3.0 machtype addition as I reviewed it, and then add the
rest in an incremental patch?

Thanks,
Laszlo
