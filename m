Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp516558wrp;
        Fri, 15 Feb 2019 03:33:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib7JRNxDobEP4CA9eG1xOfQHU03ELZ/RvxYeTzMDTCbi8Fg9pvaNU9wpE7BDr5/q5uP0YZw
X-Received: by 2002:a81:4ac6:: with SMTP id x189mr7426143ywa.249.1550230422287;
        Fri, 15 Feb 2019 03:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550230422; cv=none;
        d=google.com; s=arc-20160816;
        b=fW7q4+InggpH1JcShsiXOUTDZSEU8tE/k0kCKHGK+LYdIr+qk0eXq5y8JiX0mGuEc8
         fYLnOHEBC4fSZhkzefPpM3wnV83O8wBB+V3ouWfS9GuD10KcAUFFP/UnIlGcHerJvAFz
         j/eh78QoWnx/MQti5TNnk6PvX+MKKy29Y6vlR7tY5FS1QQZigkux9r+ebM+bGpIfR9Dg
         pPz329p1gWUkxNM5mP8bG6BZqd5tWiAorBvuPJsp03HMMxpjKbBZw9ST70ozmPUe7Gsv
         uP0vf5NEaJaRi/PkYu/XftyhrPEsnONa6DL061NcnyqgbBqJpdXjDvyBzTKajGmXoPHh
         6kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=J0anOcj6KRd4lJHo9wTUJ7zG4baLcE6n4SbEs9awQEE=;
        b=TJbkb1qyPJlslGMZMfy2qoD/F4SLY/IaJ536rw3+0FOoSWKSgSS6p2DFyOrjI+InQX
         a8+C+X+p8BB/TWSdpItxiBha1b34BDVzUfLEq2hYGNr6vx8YVRjjSgF17xiWZCrbQaeD
         5FaK5gntEotu/jXDLlXNK1IzAIfIXAOQzy9Foz0u0QLVkMQ7wU+9nzZ/bLPVYWOWfbBO
         lRA8gUnRzd7gXwq8wJeQK1MonCf4hkBB0mh0FYeKpPc4dhBevWCs/rxo4MQFqhgrzEQb
         YQtrv3U7ObZiCGhddczwHvOtT6fgjIdEBeIVharCL1ijELeLsSgIizJ0gMcwfnNngZYH
         7QVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si2956923ybq.274.2019.02.15.03.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 03:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gubkT-00027n-PI
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 06:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gubkN-00027h-1z
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gubkL-0003jv-3Q
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:33:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46880)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gubkH-0003Pc-W6; Fri, 15 Feb 2019 06:33:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 651B7124556;
	Fri, 15 Feb 2019 11:33:25 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F47A5D734;
	Fri, 15 Feb 2019 11:33:20 +0000 (UTC)
Date: Fri, 15 Feb 2019 12:33:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190215123317.6903b818@Igors-MacBook-Pro.local>
In-Reply-To: <4d8518f7-5272-fc18-d5c7-20c4cafdf7e8@redhat.com>
References: <20190214140714.15738-1-imammedo@redhat.com>
	<4d8518f7-5272-fc18-d5c7-20c4cafdf7e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 15 Feb 2019 11:33:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] memory: use
 memory_region_init_ram() instead of memory_region_allocate_system_memory()
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, jan.kiszka@web.de, atar4qemu@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TmS14rk8t4UT

On Thu, 14 Feb 2019 19:11:27 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 14/02/19 15:07, Igor Mammedov wrote:
> > Also some boards (ab)use memory_region_allocate_system_memory(), calling it several
> > times to allocate various fixed sized chunks of RAM and ROMs, which is problematic
> > to map to a single initial RAM Machine::memdev backend and is currently broken if
> > -mem-path points to a not hugepage pool.
> 
> This is certainly a good idea.  However, I'm not sure why you would need
> a memdev property on the Machine instead of just allowing 1 -numa node,
> which is what really is.

using '-numa node' would be confusing to user when he/she is not interested in numa usecase
it also would enable numa fdt/acpi parts generated automatically (fixable but then again
it adds more to confusion) and in the end there are boards that do not support numa at all
(s390x).

Machine memdev (initial-ram-memdev) property looked generic enough to me that it could be
used with every board, but could go on a bit further and instead of memdev an add initial-ram
property that would reference something like -device builtin-ram (I think I've seen some board
using a sysbus based ram device for initial ram).
If you ask why it's machine property, then I'm following '-m' semantics which is basically
a machine property and I don't have a better idea how to tell board on CLI to use some
device/memdev as initial ram.


> Thanks,
> 
> Paolo
> 

