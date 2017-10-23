Received: by 10.223.197.9 with SMTP id q9csp10216744wrf;
        Sun, 22 Oct 2017 22:18:43 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TijieNCj5+wTJRyAoI/UvvpAZo4YrlozMyTLjPXy+e6+V1MPY0DUQL8kUMNQ7wMu26ufn1
X-Received: by 10.55.41.226 with SMTP id p95mr17316803qkp.336.1508735923683;
        Sun, 22 Oct 2017 22:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508735923; cv=none;
        d=google.com; s=arc-20160816;
        b=inWnScSG5lSHxBEaRh+NdF/xQ66YKnRwrPPxUw7fqc+XhGor/+Ejv6emO2fu8KescC
         HqPkt/6JRDtcBD+IG/SMzU51/m2u+h8tqvbXp8w+q0mirU0dN7t6tU31lynZ/cRZV1Zo
         my8TbcYHkR+BRR6UwJQNVjKpQfXjvbqOh9FSi9wyxBhWiRyllDcsO2UJtu0moWzjbzmG
         9sonrqW3VtLvZKhS724jbavGZBuLS03Ok8jaRPBDil1B9Gf0LL5X2gT6kjwKng7Bclsl
         LJ6/auT0OFydmk0W9EggA89GSD3h5vjNiAOdA9arJSsL3K2Gv2hg1x/+27LXB5GBQriF
         nR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=gN7rF2qL/mHQlMniMF40BzR8MnwDwdjaDRAXk949ekw=;
        b=eAydPNlBOfGqb+1FjFytTVuy7RXqyn/j0XRGNIlzXHxPBzoFAVLHMlTKCkyF6Dc2j/
         OczbDSFV3dMh1qUVrtLAQ0H2MV79W0T6YmSHI7M5D1D9rdBaml9MI97+K2mcZNUAWcpG
         s0AxOeDPzZHUziRYMk1VNFz8vFPW/RQwRAgt8shi7VzN3BR6pCNlwF0B6vcAtGhUUGW0
         dnOv+5wXt8OHnQ5YLwtwlH7knyE8GWquzeRTPb1sUGP439QCXrrV3noACyrdwseE97l4
         eSl4Th9ADgjOBn1rxU0ftsPlS8Lb1gbeVVpw+DgekK/P6iPRc4GFq7uoYhScV+hBNEWf
         I8DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u127si284035qkf.280.2017.10.22.22.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 22:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6V8L-0003Yf-BZ
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 01:18:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e6V86-0003Ww-KC
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 01:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e6V83-0008GJ-4p
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 01:18:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e6V82-0008G9-Ua; Mon, 23 Oct 2017 01:18:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0F937EA8B;
	Mon, 23 Oct 2017 05:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E0F937EA8B
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (dhcp-14-227.nay.redhat.com [10.66.14.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA1E5C880;
	Mon, 23 Oct 2017 05:18:20 +0000 (UTC)
Date: Mon, 23 Oct 2017 13:18:19 +0800
From: Fam Zheng <famz@redhat.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Message-ID: <20171023051819.GD17374@lemon>
References: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
	<150868113318.482.11705826106714639873@b58463cdfd5f>
	<CALHRZuqhSJC9t3Xrc6-yd3EKcaNUp3NyR+i3FW=i4C7Y16acxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHRZuqhSJC9t3Xrc6-yd3EKcaNUp3NyR+i3FW=i4C7Y16acxA@mail.gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 23 Oct 2017 05:18:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead
 code reported by Coverity
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Alistair Francis <alistair23@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Darren Kenny <darren.kenny@oracle.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHK3p9ByvCp9

On Mon, 10/23 08:59, sundeep subbaraya wrote:
> > Cloning into '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc'...
> > fatal: Could not read from remote repository.
> >
> > Please make sure you have the correct access rights
> > and the repository exists.
> > fatal: clone of 'git://git.qemu-project.org/dtc.git' into submodule path
> > '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc' failed
> > Failed to clone 'dtc' a second time, aborting
> > === OUTPUT END ===
> >
> > Test command exited with code: 1
> >
> 
> I did not understand. Is the error related to my patch?

Nope, there is something wrong with the testing bot.

Fam
