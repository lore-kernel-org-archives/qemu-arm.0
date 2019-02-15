Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp530158wrp;
        Fri, 15 Feb 2019 03:49:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY3v/tmHdr15/7s2SvD8vx36u0bg84sOpmKMGKGc6a/wHTExpyNwUplIjyFysvPCABRDsk8
X-Received: by 2002:a25:b15:: with SMTP id 21mr7707901ybl.255.1550231398518;
        Fri, 15 Feb 2019 03:49:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550231398; cv=none;
        d=google.com; s=arc-20160816;
        b=eoH9O4GI2L38IMwsZwOY1dA0Wt4bqmbMarkL1lUCIH3Isz0iBuP28IU9EpaIvsu8O2
         w5XtnEb1l1ty1dTyjnYcU6gwypx0fud6eR8114xg5fxl570buFAoPeKxe9fSoRWDR+iB
         DPZM0BRcLtB0v5LefQfeXzKpA/w7KIt4SF1Ahq7OjRTLEGMqAAsEwEKArbmx1wPWPAwb
         GubahqPFI8OT5kF6m+arJGYyyNme2cj5hAo2UE03nTtZ4aP5Hzwq6KtE96+YE9/xaONM
         J/rKPtzwkuTe8mHDKbUCLU7OkFchMkCJIlQS+hL79sxIQ2oczI1E+mPnvsErU2CQnrGt
         NB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=3vrfM6vrVYST6Wb6zXS8Z4lQk7cYpSCRy4LKzZM4hWw=;
        b=KO0RFSd2kbfjqtqgQyxTexOKVf9okkooajriIbHysfSZBYtkwDQkqJ99S/+MVXwPWV
         S8uC6BemJg+AhfgI7SGjC6AVY6AyUrEBYrsHbFFkef3Pd6vPPoByWte5hafOBFPCKHST
         mxDXPWJqhyKygiC9Pq6hOSveVHfJ5PSUa+cWPvq18mJlb/d66bTI+Am8Xf2WaYkz4ZXt
         Whn7l2CakJ16UPiJgMOt79m4nIf+1DHUJ6Pzf6ziUODJokaqPh63qMpgPvMaHhNC9UE1
         pGOKAiPCsS15ep9IcojWM5EWi4c+vH++n+82Hh9rp2IdwNJqBv8zVzPHHJLbgZwYBbks
         Uyzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si360355ybo.397.2019.02.15.03.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 03:49:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guc0C-0003Vk-Fd
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 06:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gubwF-0000Tp-R6
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gubwB-0003oI-Tr
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:45:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gubw6-0003ib-3Y; Fri, 15 Feb 2019 06:45:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F9511314EA;
	Fri, 15 Feb 2019 11:45:40 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE468600C1;
	Fri, 15 Feb 2019 11:45:37 +0000 (UTC)
Date: Fri, 15 Feb 2019 12:45:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190215124534.48cadc1e@Igors-MacBook-Pro.local>
In-Reply-To: <CAFEAcA8Jh6B+aOJMEAgQWhbuun6e5HSVRZ1+k5adO9PcgGua4g@mail.gmail.com>
References: <20190214140714.15738-1-imammedo@redhat.com>
	<CAFEAcA8Jh6B+aOJMEAgQWhbuun6e5HSVRZ1+k5adO9PcgGua4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 15 Feb 2019 11:45:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] memory: use memory_region_init_ram() instead
 of memory_region_allocate_system_memory()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y3DIm6vFcLKW

On Thu, 14 Feb 2019 18:30:37 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 14 Feb 2019 at 14:07, Igor Mammedov <imammedo@redhat.com> wrote:
> > Also some boards (ab)use memory_region_allocate_system_memory(), calling it several
> > times to allocate various fixed sized chunks of RAM and ROMs, which is problematic
> > to map to a single initial RAM Machine::memdev backend and is currently broken if
> > -mem-path points to a not hugepage pool.
> 
> These boards are buggy and we could fix them, if we wanted to
> keep the existing API. We should in that case add assertions
> that memory_region_allocate_system_memory() is called once and
> only once, which would let "make check" enforce the rule.
we can do this, but I'd rather remove memory_region_allocate_system_memory() API
altogether which looks like overkill for most boards and use simpler memory_region_init_ram().
Then boards that need numa/hugepages could be switched to newer memdev/device model
instead of using memory_region_init_ram() directly.

My end-goal in all this exercise is to switch initial RAM to frontend/backend
model and replace adhoc legacy numa memory code (-numa node,mem=size  & default numa splitting)
handling with a generic device or memdev based one.

> 
> thanks
> - PMM

