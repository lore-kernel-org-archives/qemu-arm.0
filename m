Received: by 10.25.208.211 with SMTP id h202csp1902300lfg;
        Tue, 22 Mar 2016 07:29:01 -0700 (PDT)
X-Received: by 10.140.239.66 with SMTP id k63mr50546976qhc.11.1458656940941;
        Tue, 22 Mar 2016 07:29:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 200si8588024qhh.20.2016.03.22.07.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 07:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiNIq-00061M-BM
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 10:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiNAb-00019z-IU
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 10:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiNAa-0007YG-Fd
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 10:20:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiNAa-0007Y8-A1; Tue, 22 Mar 2016 10:20:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id F04E88E36C;
	Tue, 22 Mar 2016 14:20:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MEKQoQ008310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 10:20:27 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B5399303F90D; Tue, 22 Mar 2016 15:20:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
Date: Tue, 22 Mar 2016 15:20:25 +0100
In-Reply-To: <1458271654-23706-1-git-send-email-peterx@redhat.com> (Peter Xu's
	message of "Fri, 18 Mar 2016 11:27:29 +0800")
Message-ID: <87zitqoaqe.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/5] ARM: add
	query-gic-capabilities SMP command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8LeQ+c5rI/oX

Peter Xu <peterx@redhat.com> writes:

> v5 changes:
> - patch 2: moved to target-arm/monitor.c (from target-arm/machine.c)
>            [Peter]
> - patch 3: splitted into three patches: [all from Peter's comments]
>   - patch 3 (new): leverage kvm_arm_create_scratch_host_vcpu(), tiny
>     enhancement of old one to suite our need
>   - patch 4: introduce kvm_support_device() in kvm-all.c
>   - patch 5: do the implementation.
>
> v4 changes:
> - all: rename query-gic-capability to query-gic-capabilities [Andrea]
> - patch 3: rename helper function to kvm_support_device, make it
>   inline and lighter. [Drew]
>
> v3 changes:
> - patch 2: remove func declaration, add qmp header [Drew]
> - patch 3: being able to detect KVM GIC capabilities even without
>   kvm enabled [Andrea]: this is a little bit hacky, need some more
>   review on this.
>
> v2 changes:
> - result layout change: use array and dict for the capability bits
>   rather than a single array of strings [Andrea/Markus]
> - spelling out what GIC is in doc [Eric]
>
> This patch is to add ARM-specific command "query-gic-capability".
>
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
>
> Sample command and output:
>
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>             {"emulated": true, "version": 2, "kernel": true}]}
>
> Testing:
>
> Smoke tests on both x86 (emulated) and another moonshot ARM server.

We discussed the need for a yet another ad hoc query command.  Can you
please summarize the discussion and its conclusion?  Explaining *why* a
feature is needed is always a good idea.  Cover letter and commit
messages are good places for it.
