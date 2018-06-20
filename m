Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp805829wrq;
        Wed, 20 Jun 2018 07:03:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKo8IKvctfjQhiU1YFQD1E8N7XYbF5OQYJ2Km58FJzWGKnHeQokjJlOjOWLWUISX9ixSrHS
X-Received: by 2002:a0c:d789:: with SMTP id z9-v6mr15048217qvi.87.1529503412338;
        Wed, 20 Jun 2018 07:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529503412; cv=none;
        d=google.com; s=arc-20160816;
        b=mB2t7BtNSeBEywgUuv1E70LvkxvhhJSObw3S2y8PxCJYNEXeoZguuUdAAbyLB8ysoj
         AfmVPFZ+xU4DW/bY6q7FPHnjjKOG/UBAHJYRrIv8gGDbWfQLbNd/b8CIpZdR/vM35O+Z
         bXElFAhmmSw41JOC3+Mpk+6chTeQA9W73ZZwKh2ke7TEahhjrHtw8R97B0D+tPNwWrLM
         i39SfLvoPLr2vrRrOckiy4DfWtI0v/CJmqC2fLpsmTImyrJe3Yl3rsdhx3iSbwEZWaWC
         yiaZMwDBqkFRFjiHj4Z68vJehqYQOFUG++QOfA7L1pwCnIsq1J4icjG2/Spt6t0x2pzq
         p0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=5tLQZwBqMGqISLT+C82uJ0iP2a+025If6hSg1dABDIo=;
        b=oHuVXjCwX9vk31OOepixQyl92k7V4TX2ecmPSmOkg75ziVpxLl66fWCLOsjMj9aoGE
         QvRlfvg89MhHTq1CHDf2qOwVFftCvoTPA/hOmcknzfKKH2jwTLoxb3AOUwE1yFrG/O1p
         RjRMJHnfAsn+E5hO8rczmko4nWx6SRAKs39nLGiW2FFDMBVzEyO5wGPu61Hz5OMjSKla
         ZBU0hHYXjqnciH0xLL4aW8tFnBfmdGhFtz+3xc8qVPvWFgZDCSPSuYY0YyFRYH0+ffW9
         966G9RAVGlzRQcLKJapYIVxEJ1rJKNKnAUex/8WkFsisVza4oTOamGgbMpIEyy1YohyT
         QQtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si2427096qvd.84.2018.06.20.07.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 07:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdhr-0003aa-Uz
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 10:03:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVdhd-0003aS-GY
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVdha-00035n-7P
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:03:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32798 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVdha-000356-1W; Wed, 20 Jun 2018 10:03:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5ABD57A7E8;
	Wed, 20 Jun 2018 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE917C24;
	Wed, 20 Jun 2018 14:03:09 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-wS9oy1JSgpwrCZie9GQaKLOf2wQxZOUtaLfw+HGP_GA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7fc96a3d-f1e2-7ab4-a46d-3d3482cc5e71@redhat.com>
Date: Wed, 20 Jun 2018 16:03:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wS9oy1JSgpwrCZie9GQaKLOf2wQxZOUtaLfw+HGP_GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 20 Jun 2018 14:03:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 20 Jun 2018 14:03:13 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/11] linux-headers: Update
 to 4.18-rc0
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KvfMVbn5vqVn

Hi Peter,
On 06/20/2018 03:57 PM, Peter Maydell wrote:
> On 15 June 2018 at 15:28, Eric Auger <eric.auger@redhat.com> wrote:
>> commit b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
>> Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> What's 4.18-rc0? The upstream kernel doesn't have a tag by that
> name and looking at the Makefile the last thing before 4.18-rc1
> was 4.17.
> 
> Still, since it is a commit on mainline I guess we're fine?
Yes it is post 4.17 and before 4.18-rc1. I didn't know how to call that.

Thanks

Eric
> 
> thanks
> -- PMM
> 
