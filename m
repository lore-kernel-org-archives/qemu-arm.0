Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp90190njk;
        Thu, 23 Jan 2025 03:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCKuNFadkU1/vR9CS510dKbeIs+TvUXbb5CoieRhYn5IM1r7MSHm0gBF9WSXx7BKiG4KKadVOajj0b1w==@linaro.org
X-Google-Smtp-Source: AGHT+IFnXQJ2YP6p+1AvxwRiHTvbI6hPA5TeGa64yRvt6+3zsle1I30hmyxWz6RXkqnZOezID52P
X-Received: by 2002:a05:620a:254c:b0:7b6:753b:9b5d with SMTP id af79cd13be357-7be63248395mr5146546385a.36.1737632822896;
        Thu, 23 Jan 2025 03:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737632822; cv=none;
        d=google.com; s=arc-20240605;
        b=NpWXga4wNZ9WuUILYHBhsjHmCtkfhSkwf4Yr7H6H/Yqpd30/M4Z37S6TpiKu0WT0jJ
         t7y8dv+HAC8WO8qsBbCsJc6EOZYYzNtCX5PVAdu/9MLi+3HBVE8FcDZFu/U426//D9fC
         SHOezYA4a9ZQHu9bOlZAz9fS+GLzrVnC+fd/TWUU4rWGcrIUoZ8QBuY+B15fphi3eeKv
         EU6bLv506aA37HBYAvV8Etm0eun9jaik/2+nUvHCO3tfOGujecGN45wX5ZeXQcXADS3e
         KwAgXyaCDxbV0lnZacaM9UTA+wHJhmY0OU5hHO7b9UZbwyj4x2Ra3UaanweylLV+I+SH
         J8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=taAogeFlYYjbLe5+a0Il9aezBeP4KUrKFjM+/TW+xUc=;
        fh=ga30WJz+AM+zGlkQ58aeLKsNtsPzufzpPtZNXhGYMmI=;
        b=Noq85d6rRCLxzN6lAeyYcldMpZeZ40giApTgDU++W9U7IO7Rc72VA/J8T0J/Fnx2z9
         qNaJAmZdFdperL8ax9/r50EeDvJT7g5dZehLSyi0nUKBVKDbUUnzygLsHMRcuaV62lr0
         GD1ZVRJ2qf2Ehb6c5YhWOIlnjw7aaVzyss1n33HI6ht/fixq8aM5BXDJqt7N9nkjVDy9
         B0YJLLD6Xlqu+7UPSB0nfwBAug8HYSVzV8Z+9LaZHnkbXs2UMWxs0tyg2b82QW9MNDE4
         B7RJg3br/Su/JjkNtjtDQjjgohu6fbryaygv6gCXd+QRDTWtUB6M/VWwuXmYjTklqYkm
         0Peg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FImdi8Ng;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614cb7a6si1760838585a.430.2025.01.23.03.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 03:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FImdi8Ng;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tavfD-0008VC-M6; Thu, 23 Jan 2025 06:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tavf9-0008UQ-KB; Thu, 23 Jan 2025 06:46:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tavf4-0006m1-Sx; Thu, 23 Jan 2025 06:46:18 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11BDA5C5767;
 Thu, 23 Jan 2025 11:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCA4C4CED3;
 Thu, 23 Jan 2025 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737632768;
 bh=pQZssoN6/Y14w2SWRFonSO0WXZviR2YX8CTh/zGCdwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FImdi8NgB1vx8MI4BQR3eMf8vOGmpFy/P3uuJ3zD3jOgOkZCMO/QXvn4pjI3eRyn+
 g9ibZkCJ3o2p5hlg5TpuK+tV+SCFRKflmizLGev9T7Pe6J4yO8v0wlNDr8CUuFL2B7
 XXGzVRHz5qXp30sQVXM+a01ak8ulHhBkcBQrf9o9lofCvT3t92AiFqrW8iunYMgGbc
 g819zA/Rr/xs6tb0DhACZKSIJb2ZMs1DvqCYqSgAgDxawRgTmQjNwSSbgtNbTomng7
 enGlYrEhLLR2jItaWlpGB7eJmKFmKmcGOjGc2WKqeJBlUc1abWnFd3bJ+VC935X/rd
 aqd2Hgy+k3ciw==
Date: Thu, 23 Jan 2025 12:46:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250123124603.79cb2485@foz.lan>
In-Reply-To: <20250123100217.00007373@huawei.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
 <a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
 <20250123100217.00007373@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G9xGuYeFyVUT

Em Thu, 23 Jan 2025 10:02:17 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> > ---
> > 
> > Change from v8:
> > - hest_addr_lr is now pointing to the error source size and data.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Bonus.  I guess you really like this patch :)

There is something wrong here with git rebase - maybe related to
.git/hooks/pre-commit running checkpatch: every time I do a rebase,
it adds my SOB at the end of description, if not there already.
Not a problem for normal patches, but when the patch has a version
history, it ends placing such duplicated SOBs. That happens even
using --no-signoff and with:

	[format]
        	signOff = false

at git config. No idea how to fix it.

Thanks,
Mauro

--- 

This is the pre-commit hook:

#!/bin/sh
#
#
TMP=$(mktemp)

git diff --cached HEAD >$TMP

$PWD/scripts/checkpatch.pl --no-signoff -q $TMP >&2
ERR=$?

rm $TMP

exit $ERR



