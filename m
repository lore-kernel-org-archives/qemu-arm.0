Received: by 10.80.166.35 with SMTP id d32csp277813edc;
        Tue, 11 Oct 2016 18:02:16 -0700 (PDT)
X-Received: by 10.200.48.49 with SMTP id f46mr6259566qte.64.1476234136636;
        Tue, 11 Oct 2016 18:02:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si2705815qkb.78.2016.10.11.18.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 18:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu7w0-00045c-7R
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 21:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bu7uj-0003UK-IZ
	for qemu-devel@nongnu.org; Tue, 11 Oct 2016 21:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bu7uh-0007Re-Gu
	for qemu-devel@nongnu.org; Tue, 11 Oct 2016 21:00:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bu7ub-0007P0-5h; Tue, 11 Oct 2016 21:00:49 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18BD97F6A4;
	Wed, 12 Oct 2016 01:00:48 +0000 (UTC)
Received: from localhost (vpn1-7-159.pek2.redhat.com [10.72.7.159])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9C10j5p007855; Tue, 11 Oct 2016 21:00:46 -0400
Date: Wed, 12 Oct 2016 09:00:44 +0800
From: Fam Zheng <famz@redhat.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20161012010044.GA28536@lemon>
References: <20161011000558.498195.49291@ex-std-node742.prod.rhcloud.com>
	<alpine.LFD.2.20.1610112238260.7380@wniryva>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1610112238260.7380@wniryva>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 12 Oct 2016 01:00:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, liqiang6-s@360.cn,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+mT1E7iK1ZG

On Tue, 10/11 22:44, P J P wrote:
> +-- On Mon, 10 Oct 2016, no-reply@ec2-52-6-146-230.compute-1.amazonaws.com wrote --+
> | Your series failed automatic build test. Please find the testing commands and
> | their output below. If you have docker installed, you can probably reproduce it
> | locally.
> 
>   I tried to build it locally(without docker), cloned submodule 'dtc' and used 
> the same './configure' options as in the test. It built okay, no error.
> 
> | === TEST SCRIPT BEGIN ===
> | #!/bin/bash
> | set -e
> | git submodule update --init dtc
> | # Let docker tests dump environment info
> | export SHOW_ENV=1
> | make J=8 docker-test-quick@centos6
> | make J=8 docker-test-mingw@fedora
> | === TEST SCRIPT END ===
> | 
> |   CC      hw/timer/arm_timer.o
> |   CC      hw/timer/arm_mptimer.o
> |   CC      hw/timer/a9gtimer.o
> 
>   It seems to build okay.
>  
> | (gtester:6328): GLib-WARNING **: Failed to execute test binary: tests/test-qmp-output-visitor: Failed to fork (Resource temporarily unavailable)
> | /bin/sh: fork: retry: Resource temporarily unavailable
> | make: vfork: Resource temporarily unavailable
> 
>   This seems like a system issue, not related to the 'a9gtimer.c' patch.

I think you are right, thanks for confirming!

Fam
