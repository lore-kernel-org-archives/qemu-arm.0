Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1827701wrg;
        Tue, 21 May 2019 13:14:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8vHHMyJn2D6hLkUYHnC1QBh5e8I7XMFKxlJVSYSaWZ/AGWY/L1y3FYAFoo3APlpQ4dYa+
X-Received: by 2002:a05:6402:54a:: with SMTP id i10mr85833121edx.162.1558469644597;
        Tue, 21 May 2019 13:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558469644; cv=none;
        d=google.com; s=arc-20160816;
        b=R742RSczZ6rq8PRxwAI9L++Og6aqcb6OCKnitjlz60fIRnchbq/hvgfeGXrRW+OQxf
         rTHCRrh9we1mVkeguvR3olIgFM0WfxQkn5fMCtZxfhs+gWBL1u+wje4TChwq+dK26Exp
         /5J9V+7cxzwDAkrMOh0veJs3IyH1F3EqrA5f/L82XMLsE6pHnMI32bVKvFQhlUDAxAeg
         /DuPRu4ku4vF2nUk+PIn7MonZdBLZ+hpXL5t+mHaB0A9p8KzqcZWugI3LZPC4TFMRzbP
         v0M1DYmK9xGlfWan2Q1oAIYT08w1NUQpf77GDj6jSuT4nx0j/yWuCw40ocVFTx5MrdMo
         taKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date;
        bh=Sj4hE0ZDc5ZuV3iB5U2KDk0ZNJz/7XKL82ShlDK36qA=;
        b=FeuaO4DndTc2eU51hFI7zkbt5jItPnIMCJc1OjYXd9aK/zI23R03c+7o+PRn1hXXZB
         wkJn5xTI8vsuPVcZtyts/0WmIkxMAQ0ULF2MImvEjmCJAJe5y0k0DB1UcDL0+f/0JBjC
         +8xkZ4n3XEFDGMK7pi2WWRbZyrD+dlrr1VgDLUXrX0neqxE+iTr4vIrh2I8i68QrczdG
         1H+nccBgKUtV712V/b6OsVqLUm8IOVWYLPjkXgJG0zy4UKSoE8iKK6etG2QewDe99UIq
         91Rv0LYcDa/JX8mEVNOcYQWd0SNY9ycQ1t5ztakEQuVaqoIEk0u2PRZYKd1LJ9B94WnU
         SS+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si13288871eje.348.2019.05.21.13.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 13:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTB99-0000g2-Kb
	for alex.bennee@linaro.org; Tue, 21 May 2019 16:14:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTB8t-0000eK-Lr
	for qemu-arm@nongnu.org; Tue, 21 May 2019 16:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTB8r-0006rg-NB
	for qemu-arm@nongnu.org; Tue, 21 May 2019 16:13:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hTB8q-0006Ax-3E
	for qemu-arm@nongnu.org; Tue, 21 May 2019 16:13:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5DAB307EA8E;
	Tue, 21 May 2019 20:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD60760F8D;
	Tue, 21 May 2019 20:13:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A47141833002;
	Tue, 21 May 2019 20:13:21 +0000 (UTC)
Date: Tue, 21 May 2019 16:13:18 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <1537277689.23920944.1558469598234.JavaMail.zimbra@redhat.com>
In-Reply-To: <d22df06d-7fdc-0eca-286a-d411f87c4707@redhat.com>
References: <20190520174758.GA31098@dhcp-17-231.bos.redhat.com>
	<d22df06d-7fdc-0eca-286a-d411f87c4707@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.17.231, 10.4.195.16]
Thread-Topic: qemu-system-arm/aarch64 QMP hangs after kernel boots
Thread-Index: TPm/LnSji4Nvyc0xLpUnnUi8gKbcHA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 21 May 2019 20:13:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [BUG] qemu-system-arm/aarch64 QMP hangs after kernel
 boots
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ywvhppZpDoOb



----- Original Message -----
> From: "Auger Eric" <eric.auger@redhat.com>
> To: "Cleber Rosa" <crosa@redhat.com>
> Cc: qemu-arm@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>
> Sent: Monday, May 20, 2019 3:21:18 PM
> Subject: Re: [BUG] qemu-system-arm/aarch64 QMP hangs after kernel boots
> 
> Hi Cleber,
> 
> On 5/20/19 7:47 PM, Cleber Rosa wrote:
> > Hi,
> > 
> > This is just a FIY about the following bug report:
> > 
> >  - https://bugs.launchpad.net/qemu/+bug/1829779
> > 
> > And add some extra clarifications that I've tested extensively the
> > behavior of other targets (all that have a similar test under
> > tests/acceptance/boot_linux_console.py) and none exhibited the same
> > behavior.
> > 
> > Also, because qemu-system-arm and aarch64 sometimes fails on the very
> > first QMP command, the regular boot test sometimes will hang on a
> > "quit" command that happens when the test run its "tear down" and
> > attempts to cleanly shut down the "vm".
> > 
> > Let me know if I can be of any further help.
> 
> Thanks for reporting the problem. I hit the problem recently with
> device_del commands which did not seem to get any response on guest
> side. On my side, this happened erratically.
> 
> I will try to reproduce it again.
> 
> Thanks
> 
> Eric
> 

I have an update on this.  Eric and myself attempted to zero in the
exact cause.  A few things we discovered:

 1) It has nothing to do with having a kernel running
 2) It has to do with having a chardev that is a server socket.  This
    test produces command line arguments such as:

   -chardev socket,id=console,path=<path>.sock,server,nowait \
   -serial chardev:console

 3) It doesn't seem to have a connection to the test infrastructure code
    (python/qemu/qmp/*), as a I made a number of experiments which
    yielded no differences in behavior.

So, the reproducer given at:

 https://github.com/clebergnu/qemu/commit/c778e28c24030c4a36548b714293b319f4bf18df

Continues to be be valid (and continues to be limited to arm and aarch64).
Now, after a number of experiments, the following was found to be a 100%
reproducible *workaround*:

 https://github.com/clebergnu/qemu/commit/e1713f3b91972ad57c089f276c54db3f3fa63423

That basically shutdowns the *console* socket before proceeding with further QMP
interaction.  The effectiveness of the workaround can be seen here:

 aarch64 command line:
  - https://travis-ci.org/clebergnu/qemu/jobs/535459499#L3633
 aarch64 QMP interaction:
  - https://travis-ci.org/clebergnu/qemu/jobs/535459499#L3663

 arm command line:
  - https://travis-ci.org/clebergnu/qemu/jobs/535459499#L3747
 arm QMP interaction:
  - https://travis-ci.org/clebergnu/qemu/jobs/535459499#L3767

I hope this provides a few more hints into the real issue.

Regards,
- Cleber.
