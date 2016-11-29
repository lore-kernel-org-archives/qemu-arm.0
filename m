Received: by 10.25.150.194 with SMTP id y185csp2434778lfd;
        Tue, 29 Nov 2016 08:29:32 -0800 (PST)
X-Received: by 10.55.127.7 with SMTP id a7mr24244542qkd.204.1480436972002;
        Tue, 29 Nov 2016 08:29:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x54si27945702qtb.10.2016.11.29.08.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBlHe-0001FG-P5
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:29:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cBlFw-0008H8-BG
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 11:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cBlFu-0003d6-Tb
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 11:27:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cBlFu-0003cP-My; Tue, 29 Nov 2016 11:27:42 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D2A831A33C;
	Tue, 29 Nov 2016 16:27:40 +0000 (UTC)
Received: from redhat.com (ovpn-116-50.rdu2.redhat.com [10.10.116.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id uATGRdIZ007734; Tue, 29 Nov 2016 11:27:39 -0500
Date: Tue, 29 Nov 2016 18:27:39 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20161129182716-mutt-send-email-mst@kernel.org>
References: <20161128195701.24912-1-lersek@redhat.com>
	<148042662061.139.8078035742561370423@5b492b8a941d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148042662061.139.8078035742561370423@5b492b8a941d>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 29 Nov 2016 16:27:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.8 0/2] loader fixes
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
Cc: peter.maydell@linaro.org, famz@redhat.com, imammedo@redhat.com,
	alistair.francis@xilinx.com, michael@walle.cc,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com,
	pbonzini@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0zK+p68SpWj9

On Tue, Nov 29, 2016 at 05:37:02AM -0800, no-reply@patchew.org wrote:
> Hi,
> 
> Your series seems to have some coding style problems. See output below for
> more information:
> 
> Subject: [Qemu-devel] [PATCH for-2.8 0/2] loader fixes
> Type: series
> Message-id: 20161128195701.24912-1-lersek@redhat.com
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> 
> BASE=base
> n=1
> total=$(git log --oneline $BASE.. | wc -l)
> failed=0
> 
> # Useful git options
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> 
> commits="$(git log --format=%H --reverse $BASE..)"
> for c in $commits; do
>     echo "Checking PATCH $n/$total: $(git log -n 1 --format=%s $c)..."
>     if ! git show $c --format=email | ./scripts/checkpatch.pl --mailback -; then
>         failed=1
>         echo
>     fi
>     n=$((n+1))
> done
> 
> exit $failed
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> Switched to a new branch 'test'
> a700709 loader: fix undefined behavior in rom_order_compare()
> 54ae01b loader: fix handling of custom address spaces when adding ROM blobs
> 
> === OUTPUT BEGIN ===
> Checking PATCH 1/2: loader: fix handling of custom address spaces when adding ROM blobs...
> Checking PATCH 2/2: loader: fix undefined behavior in rom_order_compare()...
> ERROR: "(foo*)" should be "(foo *)"
> #69: FILE: hw/core/loader.c:821:
> +    return ((uintptr_t)(void*)rom->as > (uintptr_t)(void*)item->as) ||
> 
> total: 1 errors, 0 warnings, 8 lines checked

True. Can you fix this up pls?


> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org
