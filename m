Received: by 10.80.163.71 with SMTP id 65csp1446566edn;
        Wed, 21 Sep 2016 06:52:47 -0700 (PDT)
X-Received: by 10.55.128.66 with SMTP id b63mr40325142qkd.69.1474465967118;
        Wed, 21 Sep 2016 06:52:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n67si28193722qkl.45.2016.09.21.06.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Sep 2016 06:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmhx8-0007mT-Ig
	for alex.bennee@linaro.org; Wed, 21 Sep 2016 09:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmhvp-0006wR-Dw
	for qemu-devel@nongnu.org; Wed, 21 Sep 2016 09:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmhvn-0002jv-Hv
	for qemu-devel@nongnu.org; Wed, 21 Sep 2016 09:51:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bmhvj-0002jD-1W; Wed, 21 Sep 2016 09:51:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A92A693F2;
	Wed, 21 Sep 2016 13:51:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8LDpErD013603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 21 Sep 2016 09:51:16 -0400
Date: Wed, 21 Sep 2016 15:51:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160921135114.2yc5lfzcks522vaa@kamzik.brq.redhat.com>
References: <1474425234-31412-1-git-send-email-wei@redhat.com>
	<1474425234-31412-2-git-send-email-wei@redhat.com>
	<20160921075314.x4luqeo6djao2qon@hawk.localdomain>
	<999b4f70-1180-137c-a009-da84715a0c74@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <999b4f70-1180-137c-a009-da84715a0c74@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 21 Sep 2016 13:51:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V4 1/2] arm64: Add an option to turn on/off
 vPMU support
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3qgTtr0GP25S

On Wed, Sep 21, 2016 at 08:35:41AM -0500, Wei Huang wrote:
> On 09/21/2016 02:53 AM, Andrew Jones wrote:
> > On Tue, Sep 20, 2016 at 10:33:53PM -0400, Wei Huang wrote:
[snip]
> >> +    if (cpu->has_pmu == ON_OFF_AUTO_ON && !kvm_enabled()) {
> >> +        cpu->has_pmu = ON_OFF_AUTO_OFF;
> >> +        if (!pmu_warned && !qtest_enabled()) {
> > 
> > Why do we need this qtest_enabled thing?
> 
> Without this, "make check" will print out the warning message (using a
> qtest machine type). This seems to be a common practice across QEMU code.

I see. Too bad it's so ugly. Maybe we need a new error_report that
hides that ugliness, i.e. an error_report that only reports when
!qtest_enabled(). CC'ing Markus to get his opinion, but I'm off topic
now and wouldn't expect anything like that to be worked out before
accepting this patch.

> 
> > 
> >> +            error_report("warning: pmu can't be enabled without KVM acceleration");
> >> +            pmu_warned = true;
> >> +        }
> >> +    }
> >> +    if (cpu->has_pmu == ON_OFF_AUTO_OFF) {
> >> +        unset_feature(env, ARM_FEATURE_PMU);
> >> +    }
> >> +
[snip]

Thanks,
drew
