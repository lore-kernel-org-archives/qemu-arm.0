Received: by 10.103.124.15 with SMTP id x15csp1479571vsc;
        Mon, 22 May 2017 10:23:41 -0700 (PDT)
X-Received: by 10.31.174.16 with SMTP id x16mr9146055vke.136.1495473821494;
        Mon, 22 May 2017 10:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495473821; cv=none;
        d=google.com; s=arc-20160816;
        b=eq7QyOtzj0d7D+hA8KqlbIVMPMmAQSCn0L/N97BCpQK3VcL2dIlWRdxwcpr7NFxZGx
         V1WmMO4ylR0GK9gKped2qbG74+aC2e6zCS8gtYkqDYSayU+uDkU726J5ShhAa58cddoI
         cSXSHI9Vghh+EGeDeuu2vpYhjLagedGij9J2iLqRwNl/UnPqxd04VnSnbKW/CWmUmHqw
         a7R4s5thzxLUkhFYpeo1aUGe3YPsybQn1pRnvtoI/YpSv7jleGlMBHlKN6dSt7sGS6i9
         nkhstsYqKSXjoKw2m8izk/zc3DiXhg4fBUX9iAT9CbbtUEuKUAAefLEU8UKOJOwOBUxV
         3SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=EQeZ4K3hkz+HrkVUB+NEvIzpeFn1pgjShegLNt+mPnA=;
        b=fG8+FQT/3qZ5+SZj5sHJIgKAexIFovXFLk0R/DS4sxcvwH5N6wuLQbq4mbzCcDG/Dp
         /h6idLGi37qUK0gQToYPZ1ISUrPRjedNI5xBd65JXysMgDNhfbDKCRO66pZyC9XA0P0L
         MabnFtJSHFxzxoasNcUb6rLYLp4POzFLc9+wkIzEUBIxeByEzoDKBy+1aB0wlccTcYXx
         xICyc18nS12nNtj0V8KTw1xt96LYlhhSOILQR1i/Zt0nGiAIFuIsH5IMZdbhc3MGuUaC
         W0n0vidBnFtwtvGjrO0GHVT1aItmwyqtLZnREn2rtvXuLoXYYMryuFg5vfbF8zGkACXp
         MtHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p63si5970364vkp.205.2017.05.22.10.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 10:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCr3F-0003s9-Pn
	for alex.bennee@linaro.org; Mon, 22 May 2017 13:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCr39-0003rn-6S
	for qemu-arm@nongnu.org; Mon, 22 May 2017 13:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCr36-0001wa-0q
	for qemu-arm@nongnu.org; Mon, 22 May 2017 13:23:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dCr35-0001wR-Ql; Mon, 22 May 2017 13:23:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 543F78A4D9;
	Mon, 22 May 2017 17:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 543F78A4D9
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 543F78A4D9
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 734F917C1B;
	Mon, 22 May 2017 17:23:13 +0000 (UTC)
Date: Mon, 22 May 2017 14:23:12 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170522172312.GD22043@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-4-git-send-email-imammedo@redhat.com>
	<20170518182039.GO4748@thinpad.lan.raisama.net>
	<20170522095836.59149abc@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170522095836.59149abc@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 22 May 2017 17:23:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] numa: silence incomplete
 mapping warning under qtest
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
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eU7+u+ju1zDh

On Mon, May 22, 2017 at 09:58:36AM +0200, Igor Mammedov wrote:
> On Thu, 18 May 2017 15:20:39 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Thu, May 18, 2017 at 10:09:31AM +0200, Igor Mammedov wrote:
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > Where exactly is the test code that triggers those messages and
> > requires this patch? I would like to document that in the commit
> > message.
> 
> ok, I'll  mention test case in commit message on respin

I will apply this version, and add "Silence warnings triggered by
the /numa/mon/cpus/partial test case" to the commit
message.

I want to merge it as soon as possible, as the warnings are
confusing people.

-- 
Eduardo
