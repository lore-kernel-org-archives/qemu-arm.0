Received: by 10.25.44.15 with SMTP id s15csp2672631lfs;
        Thu, 6 Jul 2017 17:03:21 -0700 (PDT)
X-Received: by 10.200.48.237 with SMTP id w42mr62198561qta.54.1499385800961;
        Thu, 06 Jul 2017 17:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499385800; cv=none;
        d=google.com; s=arc-20160816;
        b=HMk4fVsvTz7P8BqHA5ZQXoUMKwnM8ot6Dq30Fw9X+KS4RizhwQsP3T3rkURpFNFAgv
         so5OckK72yyIkMwdohqQCxvFoyfyy/SqeqfgbPTV4aVVCqp46z6e05T6dJ+1NQcxNB5l
         pv9mPnGh64tx3WIFFSJFgYLC1tOiCM6EZvheyEpjUMZvcOGodbJf/f/+07+Af4way2Ra
         OI6YOQ0TOxqVyFHXKhwdlnHZVlrXaQtH9ZfsrMVrm96tWAHkp+Ekf2g2XPt2JXJRD63o
         e8Cvm2mp1YO/3KCqXAMxRCvQv58GUYqlwEF7SnjXy1PkJw8yZdZplcTUnis6X52e1HgY
         kP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=JnhOhbY7tUDMSy33LCAR0oxfpiHvYAxHNPn40XUnI6U=;
        b=VpXt7Scwzfq214C0uXMGt2qOu03GPNcducgUL8YRxgoefHp1OQhZmANIEGd1Zsm2Hv
         aUEVN8or1n77vzX8MVAo1zRe1Fj9UaYUZ004X7rEg1bBT5oL5NHI1YXYs80KgS/iE823
         6UEr2maspsbr6yduTS69uVPciWNb6ZKJLW68+YMnOk6EhIQwk4g0hOz6x3XaRQ+Q0SHY
         GcGTvE2BfR5M40Jtq4req6eOI1SYnc1vc+M+9bntcbfzISOcRrMW0oymyqx+iOkJkMBb
         2HwyapAD1JlAVMOaRGE0bnBPgHFCBh/vpyJRQCThApg00domEHfpnYJNLpQoguQIXTGc
         0MRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64si1506659qka.284.2017.07.06.17.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 17:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTGju-0005BX-AC
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 20:03:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dTGiN-00047V-NF
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 20:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dTGiJ-0007Cm-Ek
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 20:01:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dTGiJ-0007CI-8Q; Thu, 06 Jul 2017 20:01:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B95E18E3C7;
	Fri,  7 Jul 2017 00:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B95E18E3C7
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0B95E18E3C7
Received: from localhost (ovpn-12-18.pek2.redhat.com [10.72.12.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 012B177DD2;
	Fri,  7 Jul 2017 00:01:34 +0000 (UTC)
Date: Fri, 7 Jul 2017 08:01:33 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20170707000133.GA5149@lemon.lan>
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
	<149938500132.27.16593111081087749477@7a482c8a7db2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <149938500132.27.16593111081087749477@7a482c8a7db2>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 07 Jul 2017 00:01:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom: enforce readonly nature of
 link's check callback
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
Cc: mst@redhat.com, alistair.francis@xilinx.com, pbonzini@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TxQKrRoiMXZF

On Thu, 07/06 16:50, no-reply@patchew.org wrote:
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> fatal: Cannot update paths and switch to branch 'test' at the same time.
> Did you intend to checkout 'origin/patchew/1498734863-164338-1-git-send-email-imammedo@redhat.com' which can not be resolved as commit?
> Traceback (most recent call last):
>   File "/home/fam/bin/patchew", line 440, in test_one
>     git_clone_repo(clone, r["repo"], r["head"], logf)
>   File "/home/fam/bin/patchew", line 53, in git_clone_repo
>     cwd=clone)
>   File "/usr/lib64/python3.5/subprocess.py", line 271, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['git', 'checkout', 'origin/patchew/1498734863-164338-1-git-send-email-imammedo@redhat.com', '-b', 'test']' returned non-zero exit status 128
> 

Ignore this please, patchew is recovering from a bad state.

