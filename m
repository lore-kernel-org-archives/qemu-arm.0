Received: by 10.25.0.6 with SMTP id 6csp193069lfa;
        Wed, 31 May 2017 00:15:37 -0700 (PDT)
X-Received: by 10.55.183.67 with SMTP id h64mr28148379qkf.218.1496214937144;
        Wed, 31 May 2017 00:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496214937; cv=none;
        d=google.com; s=arc-20160816;
        b=d2veaAZYnMzwf5sbhmB4nFhIx3AU76C4GH1nio8S1gCYSqBCm2CwDmFs4KQNMRwjbE
         cVk75lYlLtybLJWtWX5525lztFHaTyY+5a22GE7WytsiM5u1mt6IW8Wp2WoIKJcek8JL
         NksTmsQPubTz2wv6HTB2+Jol0TfGOaIIJhDsPg/DRBGIFPhZWlyQXFTaAZOOxggFF6qf
         7wyfobodUMX+P/P/Lnx1zEfD832ftc91MavZ5j76X6qn3auP7gM501S+eDycSNcMN64Z
         eAXdeZWv62uajPfJcJQtOkWFI7P8S6mUBp91jDMbe5o3lRwbwT9HwNt4bkMUktHBUXJO
         9AJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=uH31Nyc/A0pK4Tq9LHlcfq/TAseHHW2Zul3w00yBn18=;
        b=quL5JIsHRfB3v0pFuS3wotIYUO79oC7pLKhZLz8fsSweVOFJAPlrsAsK+vQcWsHkUN
         oJZQnl8XT2nf3uhqDWK7tGRyi57exLvF5u4qOuEl4V58R3bN55Cpa1CrO+SlaYFatGPg
         Aieyakj8/dXGNfYREfEZYAyXlwZ0ILmIJrKmtge6zro3rWkB8dBeZmVcO2FsZxs9EKp9
         it6n9TblOq9tumExgIEqoqxu5R4kkJO8fL0bFWll22+Tmg7WG9Lrb7VETIkilGvT9Jwu
         BSOnTWjRbS8Fp+T/OJWztUBVxWerw1jZQPQDPDMjy8ru5sMWyN5CTsrwcifWccwxlwyg
         qVTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si15482921qtz.241.2017.05.31.00.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 00:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFxqw-0001jG-Ed
	for alex.bennee@linaro.org; Wed, 31 May 2017 03:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxqk-0001e0-Aj
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxqg-0006SM-7m
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:15:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dFxqg-0006S2-28; Wed, 31 May 2017 03:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8D7334A6;
	Wed, 31 May 2017 07:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C8D7334A6
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C8D7334A6
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A967D4EF;
	Wed, 31 May 2017 07:15:13 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-GCKfxEpy9p=k7NzoY2zez-KVXNMuAx-ruW5t27ZMgQQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2c81529b-6916-8dd6-eee9-45e5768d82ca@redhat.com>
Date: Wed, 31 May 2017 09:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GCKfxEpy9p=k7NzoY2zez-KVXNMuAx-ruW5t27ZMgQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 31 May 2017 07:15:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 4/5] hw/arm/virt: Add 2.10 machine type
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iyaADpA/QnJm

Hi Peter,

On 30/05/2017 18:04, Peter Maydell wrote:
> On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
>> The new machine type allows smmuv3 instantiation. A new option
>> is introduced to turn the feature on/off (off by default).
> 
> Should we go for default-on, or would that break guests?
> For other things added to the virt board I think the
> approach we've taken has been:
>  * if this is just an extra device, simply provide it in the
>    new virt-n.nn machine by default
>  * if this is something that changes how the machine behaves
>    even for code that doesn't care about that feature (eg
>    EL2, EL3, since they change what mode you start in on boot)
>    then default it to off
>  * if the feature only works with TCG and not KVM then
>    maybe default it to off

OK thanks for the guidelines. I put it off by default since it can
largely degrade the performance in some use cases. Also instantiating
the smmu can also induce some option changes at other levels: for
instance virtio-pci devices may be used along with iommu_platform option
for the guest to use dma ops.

Thanks

Eric
> 
> thanks
> -- PMM
> 
