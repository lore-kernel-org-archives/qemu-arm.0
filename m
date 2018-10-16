Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6008534wrt;
        Tue, 16 Oct 2018 07:43:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV622FbaqaIFHVMi6/3px/UgJx8M3q9whWV1kFI8/Luk7h7A8DCcFLtH0GLSul3G8ZT+nEoN6
X-Received: by 2002:a0c:e414:: with SMTP id o20mr20648719qvl.175.1539701005296;
        Tue, 16 Oct 2018 07:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539701005; cv=none;
        d=google.com; s=arc-20160816;
        b=GZM6z67KpmO8JYsJLNk2yVPEDs/f3ROz9EmAw1fZ3g+u5IWwi8BaL8c89d54NCJ6g5
         sHKju9+Xp0eXeBRZVujRGaNZm2yOs7H6jSCa/QMa1uS6+dWuhVI4MiBoO+Hm3c8zj05L
         0B3Lo0d1HqElEgxS2s401NHXM4iYiFp8F5JJubJqd6cGdBfIR6zbS7uk+0U2l/Jrzos5
         KNZnrdNHsfzFDMCQk7PizQxA4Qaml0XFyJ1q5X0ERCJGrScjmvKXXhm1s8RIFaDQGuv+
         OUiiyAPeAYlJFpSVWtsM82G6Ato4+cLYtj3MMTmZn0l5l6UVJEt8nYvbQM4zrT78XwYM
         VRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=F9fgpYwa/TECwDamCWPe79tOWmxH8LUNECeKKQe3eE4=;
        b=gquM/WiahB7kI8Si5BA0nThSi6rU+9caL8HdVb0vL2q3EZ1If337OzBqf1V1WWhIyC
         4z+kuo/gnGHcIslHdbti0m47+I0kVesFstw30oUq6JZXQB9KbIowZMmxKDOaz4a/BuGi
         Tktgwm04DHby2aSr+6nqU42NFTzPQRoMbOa1jPRphO+4WGzfjO+GvgPMI870TTOllLm+
         JFgCNg4o1ih1YxnT6Zapoip1OpuPW1TtNva1B4RCpJzUjpGFbYgazn7eH/HIbjIrjV3A
         T+MMpIcQKERgIdRx5OF3JXCj1+yQvHDXCJUlidC3Gn8OT+P9SCv4sgf0lTzepH9xuSe1
         cYTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si5361919qvn.159.2018.10.16.07.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 07:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCQZA-0007ud-Sn
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 10:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCQZ4-0007uB-0w
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCQYy-0003D1-Lr
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:43:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gCQYy-0003C3-Fy; Tue, 16 Oct 2018 10:43:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA211C04F4AA;
	Tue, 16 Oct 2018 14:43:11 +0000 (UTC)
Received: from work-vm (ovpn-117-199.ams2.redhat.com [10.36.117.199])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C535B5D9CA;
	Tue, 16 Oct 2018 14:43:06 +0000 (UTC)
Date: Tue, 16 Oct 2018 15:43:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Aaron Lindsay <aclindsa@gmail.com>
Message-ID: <20181016144303.GJ2426@work-vm>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
	<20181016082117.GB2426@work-vm>
	<20181016135517.GO3671@okra.localdomain>
	<20181016140655.GI2426@work-vm>
	<20181016144143.GP3671@okra.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016144143.GP3671@okra.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 16 Oct 2018 14:43:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 03/14] migration: Add
 post_save function to VMStateDescription
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, Juan Quintela <quintela@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9kX8XIc00r2

* Aaron Lindsay (aclindsa@gmail.com) wrote:
> On Oct 16 15:06, Dr. David Alan Gilbert wrote:
> > I did wonder about suggesting that you pass the return value from the
> > save operation as a parameter to post_save.
> 
> I feel like having that information in post_save may be useful, though
> I'm having trouble coming up with any concrete uses for it. But, let me
> know if you decide that you prefer it and I can add that for the next
> revision.

I'm happy either way with the input value; it sounded useful to me but
not enough to ask you for, but if you agree then throw it in.

Dave

> -Aaron
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
