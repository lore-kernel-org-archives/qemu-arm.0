Received: by 10.223.161.27 with SMTP id o27csp261352wro;
        Mon, 23 Oct 2017 13:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S6Jd2adsgs5XBJeaov3p0iL2pZWGp2iUimfOULhkjNKU0aEzjm9N6Xgsa3MZzxXgoguLHZ
X-Received: by 10.129.32.5 with SMTP id g5mr9569244ywg.268.1508791986630;
        Mon, 23 Oct 2017 13:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508791986; cv=none;
        d=google.com; s=arc-20160816;
        b=ovIEOt0A2ZSJ4uNbv7sigG9m+BZYD1RnYbkIR9uqWu5osAL/nDOmcRhCN6QvcxTGoe
         WDFDlnLytCKTTm8GSSPknWU0ZYaZganiC3nyVWDZASgs6M+CpXOSu33I/zCAdYEiXrtn
         gfUKKQo4VII3uK8oBkmzRlgewTdtrZb+FdlwH0+k/xCZ8rDzX8pD0Ij4K2GYJM1gZt4q
         4K24aH6SOirdzfcboGvDiRx8BilCaVeiYPBaysgqvCU4ICeLTiqi60TMEqjLyVRVseWx
         rtDVE/uI/AtVnSassCYYvMHXBMShqC2Qdcw/2beJkG7pp3h+6mvBGI7woy3/iCfTGGnA
         xsxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=EFrctKHK38k1/LlV8r8DZNqVMWiXsHEAEC+/HhJsABs=;
        b=uG/O/cXF5IhhMAMBe2ywjDE5iDjnklycw0xX/p9bHiQCTKgB6hgZal9HZ0oDYC/w6U
         IOSAttS2ymxoo7Ao/YHJi14q26gyI+fkgEx+dGaj8+pjeWWMKiaAHenBSPN9rAdX0fQE
         ffklEtQTbqxnygZP1XSVm/Kjmdb2O8+QeQAqOte+WWYUT6o5ZDKyzTrAJ/3SaiIzC5lv
         i+SGBFj+QiI7sXi4XwyU4m8a9Z7IrS7FhWL+Xghpu2nWLCd0ySQJWtY+D1mIVRvUlKUX
         K05ii5g/aqliFIlWXl/1qVOKED44PZwjspGF+5UfnJTlz8BAZa9hvGLoAMOZmpD6cJAu
         M33g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si1361884ybe.829.2017.10.23.13.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jic-0004kz-3s
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:53:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e6jiS-0004kh-7z
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e6jiP-0003Fu-3G
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:52:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e6jiO-0003F6-UG; Mon, 23 Oct 2017 16:52:53 -0400
Received: from sstabellini-ThinkPad-X260.attlocal.net
	(104-6-24-213.lightspeed.sntcca.sbcglobal.net [104.6.24.213])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7E9FE21882;
	Mon, 23 Oct 2017 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E9FE21882
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Mon, 23 Oct 2017 13:52:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: qemu-devel@nongnu.org
In-Reply-To: <150860960347.476.5295412873363332990@b58463cdfd5f>
Message-ID: <alpine.DEB.2.10.1710231352260.574@sstabellini-ThinkPad-X260>
References: <150860960347.476.5295412873363332990@b58463cdfd5f>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] fix WFI/WFE length in
 syndrome register
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, famz@redhat.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWXH/Ywb6ZVJ

On Sat, 21 Oct 2017, no-reply@patchew.org wrote:
> Makefile:30: recipe for target 'git-submodule-update' failed
> make: *** [git-submodule-update] Error 1
> make: *** Waiting for unfinished jobs....
> make: *** wait: No child processes.  Stop.
> === OUTPUT END ===
> 
> Test command exited with code: 2

This is a false positive, isn't it?
