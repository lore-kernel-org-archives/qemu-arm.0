Received: by 10.80.163.71 with SMTP id 65csp427379edn;
        Thu, 29 Sep 2016 09:40:47 -0700 (PDT)
X-Received: by 10.55.149.67 with SMTP id x64mr2641442qkd.135.1475167246903;
        Thu, 29 Sep 2016 09:40:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r42si2648828qte.97.2016.09.29.09.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 09:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpeO6-0000Y7-Ai
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 12:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpeHM-0002dt-80
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 12:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpeHH-0006tr-6v
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 12:33:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bpeHH-0006tE-0z; Thu, 29 Sep 2016 12:33:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8175831B31E;
	Thu, 29 Sep 2016 16:33:42 +0000 (UTC)
Received: from [10.36.116.32] (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8TGXdY5018272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Sep 2016 12:33:41 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1474633117-5227-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f19f2e51-7ff9-f9dd-8632-0b7a42ada8dd@redhat.com>
Date: Thu, 29 Sep 2016 18:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 29 Sep 2016 16:33:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add some ARM related files to
 the corresponding sections
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5tCxv9qCXCY3

On 29.09.2016 18:08, Peter Maydell wrote:
> On 23 September 2016 at 05:18, Thomas Huth <thuth@redhat.com> wrote:
>> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
>> CP, and hw/cpu/realview_mpcore.c and hw/misc/arm_sysctl.c seem to
>> belong to Real View.
> 
> arm_sysctl is also used in the Versatile PB and Vexpress boards;
> it's not specific to realview.

Oh, indeed, ... but how should this file then best be represented in
MAINTAINERS? Adding multiple entries for one file is kind of ugly, too,
isn't it?

 Thomas

