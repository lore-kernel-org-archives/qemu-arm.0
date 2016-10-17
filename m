Received: by 10.80.166.35 with SMTP id d32csp630311edc;
        Mon, 17 Oct 2016 12:26:56 -0700 (PDT)
X-Received: by 10.55.170.83 with SMTP id t80mr24967812qke.15.1476732416490;
        Mon, 17 Oct 2016 12:26:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3si18718384qkc.12.2016.10.17.12.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDYl-0007pp-T9
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwCwD-0006hB-EG
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 14:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwCwA-0003h4-5j
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 14:47:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwCw9-0003gn-WF; Mon, 17 Oct 2016 14:47:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6891D5411E;
	Mon, 17 Oct 2016 18:47:00 +0000 (UTC)
Received: from localhost (ovpn-116-159.phx2.redhat.com [10.3.116.159])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HIkvIx009008; Mon, 17 Oct 2016 14:46:58 -0400
Date: Mon, 17 Oct 2016 16:46:57 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017184657.GY3275@thinpad.lan.raisama.net>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-2-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476485569-6744-2-git-send-email-lvivier@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 17 Oct 2016 18:47:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] exec: split cpu_exec_init()
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
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wWtjyjwS5O56

On Sat, Oct 15, 2016 at 12:52:47AM +0200, Laurent Vivier wrote:
> Put in cpu_exec_initfn() what initializes the CPU,
> and let in cpu_exec_init() what adds it to the environment.
> 
> As cpu_exec_initfn() is called by all XX_cpu_initfn() call it
> directly in cpu_common_initfn().
> cpu_exec_init() is now a realize function, it will be renamed
> to cpu_exec_realizefn() and moved to the XX_cpu_realizefn()
> function in a following patch.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Confirmed that:

* cpu->num_ases and cpu->as are never changed by architecture
  code before calling cpu_exec_init()
* cpu_exec_exit() is called on cpu_common_finalize()
* The cpu->memory reference will be dropped automatically
  because the property is registered using
  OBJ_PROP_LINK_UNREF_ON_RELEASE

BTW, the cpu->as and cpu->num_ases lines are redundant, because
QOM objects are guaranteed to be zeroed when allocated.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
