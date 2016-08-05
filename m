Received: by 10.25.21.156 with SMTP id 28csp1744115lfv;
        Fri, 5 Aug 2016 03:58:13 -0700 (PDT)
X-Received: by 10.55.204.29 with SMTP id r29mr11783760qki.214.1470394693839;
        Fri, 05 Aug 2016 03:58:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f51si11210889qtc.97.2016.08.05.03.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 03:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVcpR-0001bz-9d
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 06:58:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bVcpK-0001XO-W8
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bVcpG-0000MO-Mw
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:58:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bVcpG-0000MG-HD; Fri, 05 Aug 2016 06:58:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE35AC04D2A5;
	Fri,  5 Aug 2016 10:58:01 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u75Aw0sO028445; Fri, 5 Aug 2016 06:58:00 -0400
Date: Fri, 5 Aug 2016 12:57:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Lv Zheng <lv.zheng@intel.com>
Message-ID: <20160805125758.2453e28e@nial.brq.redhat.com>
In-Reply-To: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 05 Aug 2016 10:58:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] debugcon: Add -debugport option
 to allow changing debug console port number
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Lv Zheng <zetalog@gmail.com>, armbru@redhat.com,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTzUeKLk8mFN

On Fri,  5 Aug 2016 18:19:39 +0800
Lv Zheng <lv.zheng@intel.com> wrote:

> Changing debugcon port to 0x402 allows the seabios AML table pre-defined
> DBUG() control method to be able to dump the AML debugging information to
> the re-directed debugging console.
> 
> If the debug port number is configurable, users can further specify a
> proper IO port number for it to make external BIOS's debugging
> facility functioning.

there is no need for yet another CLI option that is being added here,
just use usual '-device isa-debugcon,iobase=0x402,chardev=seabios"


