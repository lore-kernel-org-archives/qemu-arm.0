Received: by 10.80.166.35 with SMTP id d32csp105265edc;
        Tue, 11 Oct 2016 10:14:51 -0700 (PDT)
X-Received: by 10.200.49.85 with SMTP id h21mr4543303qtb.34.1476206091546;
        Tue, 11 Oct 2016 10:14:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si1896278qtq.133.2016.10.11.10.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0de-00068r-Uv
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:14:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bu0dY-00066W-9m
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bu0dS-000649-Ew
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:14:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bu0dS-00063q-8L; Tue, 11 Oct 2016 13:14:38 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E80815568;
	Tue, 11 Oct 2016 17:14:37 +0000 (UTC)
Received: from javelin (vpn1-7-178.sin2.redhat.com [10.67.7.178])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BHETKg019398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 11 Oct 2016 13:14:33 -0400
Date: Tue, 11 Oct 2016 22:44:28 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: qemu-devel@nongnu.org
In-Reply-To: <20161011000558.498195.49291@ex-std-node742.prod.rhcloud.com>
Message-ID: <alpine.LFD.2.20.1610112238260.7380@wniryva>
References: <20161011000558.498195.49291@ex-std-node742.prod.rhcloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 11 Oct 2016 17:14:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] timer: a9gtimer: remove loop
 to auto-increment comparator
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	liqiang6-s@360.cn
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gM8MD7FXnRzo

+-- On Mon, 10 Oct 2016, no-reply@ec2-52-6-146-230.compute-1.amazonaws.com wrote --+
| Your series failed automatic build test. Please find the testing commands and
| their output below. If you have docker installed, you can probably reproduce it
| locally.

  I tried to build it locally(without docker), cloned submodule 'dtc' and used 
the same './configure' options as in the test. It built okay, no error.

| === TEST SCRIPT BEGIN ===
| #!/bin/bash
| set -e
| git submodule update --init dtc
| # Let docker tests dump environment info
| export SHOW_ENV=1
| make J=8 docker-test-quick@centos6
| make J=8 docker-test-mingw@fedora
| === TEST SCRIPT END ===
| 
|   CC      hw/timer/arm_timer.o
|   CC      hw/timer/arm_mptimer.o
|   CC      hw/timer/a9gtimer.o

  It seems to build okay.
 
| (gtester:6328): GLib-WARNING **: Failed to execute test binary: tests/test-qmp-output-visitor: Failed to fork (Resource temporarily unavailable)
| /bin/sh: fork: retry: Resource temporarily unavailable
| make: vfork: Resource temporarily unavailable

  This seems like a system issue, not related to the 'a9gtimer.c' patch.

--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
