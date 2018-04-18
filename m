Received: by 10.28.4.212 with SMTP id 203csp207989wme;
        Wed, 18 Apr 2018 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/NMrdupLAtG9Ip0w2UHaT3OBI9uVweiwaGy9kmqMMls25XGmSCOiiYFQrA3rI3rEnNUyvG
X-Received: by 2002:ac8:35b0:: with SMTP id k45-v6mr2351404qtb.81.1524063438042;
        Wed, 18 Apr 2018 07:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524063438; cv=none;
        d=google.com; s=arc-20160816;
        b=spzCah4b5tpkk+tbvszpZcKTxyAgcvc2U/NYM0eqbCZymphL+zd2MhgPMP0GKs8XJ2
         tufZXnxkENJXgdScI9vTGKgczvVGkYJUShOdSTPmieal1Ky0SuWMBxJsSlL2yrtU7H5o
         5CupFGyCOArnBUOnhh7vFn6DglbK6RUGYGH1ixRgINp3jKaBjmcqPclAoOphwcAX3VWe
         vVEtMpF5O2Hps9VWOjFf3ST4z7ok+fjZrQe7f3b+VLDIG9Zvh7SZpB++VnYp5l+bFQvi
         oHgxhpWKUga9giwRcVHGFDZuu8+CrF7FP/N206N7GQU7qR9d7hcnbsogBOQeAJHsXz00
         MiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=deXdUVZPDpW9uLqraXGqhEV/uudKIGBeMeBwyVa1/iI=;
        b=KXhhAgr8GtPYS7jeW2cOcRAWROddWl89hynq0B/GrNatctlzELrO7WkYmhZ6UGIx/K
         gI/aVluSgyi1D+3bFGeEHmQ9U6Rv91J/IMAqmKC+8f8iRqClk2YjtYEqja7NUxLTWl+h
         pUds4tkefctvQ/nBDoHCf8vUU2hBv65Ekm23SQmZSAOTdSqgjFO+BUDfe/ZP39g8gYCg
         bhdYzwzf2LtYrgjJDLFpgjpNuKZW0X2jbkSHBp8O/A99tTNfj/HrTX0qDxlO4ucAq+S6
         +pBEFueL8IMlaHzwYa8s3Gh7mDO2INSpYJc13u3UG7GUmCa3VOqM/qPGZiJZMR5jJGFm
         Nlsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si1880520qtw.236.2018.04.18.07.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 07:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8oWL-0000P1-I5
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 10:57:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1f8oW6-0000Kf-GX
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1f8oW2-00051p-P5
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:57:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1f8oW2-00051N-J5; Wed, 18 Apr 2018 10:56:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C06E9300442B;
	Wed, 18 Apr 2018 14:56:57 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FF881838B;
	Wed, 18 Apr 2018 14:56:10 +0000 (UTC)
Date: Wed, 18 Apr 2018 11:56:03 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180418145603.GN29865@localhost.localdomain>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524061685-83305-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 18 Apr 2018 14:56:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.13 v2 3/5] pc: simplify
 MachineClass::get_hotplug_handler handling
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, mst@redhat.com,
	qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Er9HVAPlOMZd

On Wed, Apr 18, 2018 at 04:28:03PM +0200, Igor Mammedov wrote:
> By default MachineClass::get_hotplug_handler is NULL and concrete board
> should set it to it's own handler.
> Considering there isn't any default handler, drop saving empty
> MachineClass::get_hotplug_handler in child class and make PC code
> consistent with spapr/s390x boards.
> 
> We can bring this back when actual usecase surfaces and do it
> consistently across boards that use get_hotplug_handler().
> 
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>


[...]
> @@ -2344,7 +2341,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>      NMIClass *nc = NMI_CLASS(oc);
>  
> -    pcmc->get_hotplug_handler = mc->get_hotplug_handler;

What about assert(!mc->get_hotplug_handler) just before
overwriting it?

-- 
Eduardo
