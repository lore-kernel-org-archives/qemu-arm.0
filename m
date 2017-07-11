Received: by 10.25.44.15 with SMTP id s15csp4855788lfs;
        Tue, 11 Jul 2017 06:44:15 -0700 (PDT)
X-Received: by 10.80.218.135 with SMTP id q7mr2609376edj.85.1499780654672;
        Tue, 11 Jul 2017 06:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499780654; cv=none;
        d=google.com; s=arc-20160816;
        b=zSoDcV4oFLnen7V1nR+NwF8QU2+bCIokr2E4Vss663mJnPRFXuqiN6wvZMw2t4CZgO
         bnP4j5E57MA1jh7WgRyXelmDzbJPSDOKg/SGHLW7j0MG6XDg12BGZwgVwCtJcWfimOpv
         LgSGTv1y+dskPQ7d1WcT8tlLnh/F4LHmOWgFg7Mf8nFDztZoYERZPa57+QzqLRtDePSo
         6iDQP8AsCgk4Ws7UOEjRa6AMarbqspFz8m4nHcW7+7TBb14DIUhCgi7b4fBsGh4JJ9Ki
         Hehdsr9SH69hx6dZOu8xOZNfzo9ZQ6ceSNrQ3z+EqZ51Psqrm6mD+JcM1iaUTOJhUjP3
         sG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=O3oxw9MhjxD8t3zKZWMmWGs1pm/Mh5A1YxEzZmRewXg=;
        b=MiAe3K0s3WOPgh1BHXP3sEkkR4bwc8FNfVmWAgc2KE3zQjqzKfsrH7WzNF2d+tdp28
         7/pGxtv8vb0oq1Dm7xdc2sDvGBH0voPnKF7b5fJcjVZHB6SaMI997jK0Hw69vzDac2Lh
         kbyU4B/2pvHyZY+jZOTrK9kZSCS8rkojLSkwDumDToLhjsSpyVB9Z+DHmnZtUd6UT6LD
         N9jsp5C0NzDeJyBFpDQNiTPBxBIUyJE7lFMZUj8hQtjc7ADnQzjw+ycomuPpd598QaxW
         GbmkXwM12pC6iyXrOTDXV8nJMt9Np8zbiYHNTR8RfZDkTA/CTRzuIdGyJHaXIN+r8ewC
         cOqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o26si1595711edf.391.2017.07.11.06.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 06:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUvSX-0007fh-LG
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 09:44:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dUvSR-0007cY-4M
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 09:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dUvSN-0006WM-Tq
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 09:44:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dUvSN-0006Vv-NE; Tue, 11 Jul 2017 09:44:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46D3A158AA9;
	Tue, 11 Jul 2017 13:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 46D3A158AA9
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 46D3A158AA9
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-201.phx2.redhat.com
	[10.3.116.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D63F85D6A6;
	Tue, 11 Jul 2017 13:43:52 +0000 (UTC)
To: Dongjiu Geng <gengdongjiu@huawei.com>
References: <1499755579-31262-1-git-send-email-gengdongjiu@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
Date: Tue, 11 Jul 2017 15:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499755579-31262-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 11 Jul 2017 13:44:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH resend v4 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	mst@redhat.com, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org, zhihui.gao@huawei.com,
	qemu-arm@nongnu.org, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5IpUIPVp4hZp

Hi Dongjiu,

On 07/11/17 08:46, Dongjiu Geng wrote:
> [...]

So my followup is off-topic, but I'd like to point out that the patch /
email threading in this series is still incorrect.

These are the "sent" timestamps on the messages:

Date: Tue, 11 Jul 2017 14:46:19 +0800
Date: Tue, 11 Jul 2017 14:46:31 +0800 (+12 seconds)
Date: Tue, 11 Jul 2017 14:46:41 +0800 (+10 seconds)
Date: Tue, 11 Jul 2017 14:47:00 +0800 (+19 seconds)

This tells me that you are mailing out the patches one by one. That's
not how most people post their patches.

(Side remark: while git-send-email can still get the threading right
with individual posting, for that you would have to provide the first
email's Message-Id individually to all the subsequent commands, and the
emails show that this didn't happen.)

Instead, you should invoke git-send-email with all the messages *at
once*. Then git-send-email can set up the threading automatically. From
git-send-email(1):

> GIT-SEND-EMAIL(1)            Git Manual            GIT-SEND-EMAIL(1)
>
> NAME
>        git-send-email - Send a collection of patches as emails
>
> SYNOPSIS
>        git send-email [options] <file|directory|rev-list options>...
>        git send-email --dump-aliases
>
> DESCRIPTION
>        Takes the patches given on the command line and emails them
>        out. Patches can be specified as files, directories (which
>        will send all files in the directory), or directly as a
>        revision list. In the last case, any format accepted by git-
>        format-patch(1) can be passed to git send-email.

So send the patches with

  git send-email *.patch

or put all the patches into a temporary directory, and run

  git send-email patch-dir/

Thanks,
Laszlo
