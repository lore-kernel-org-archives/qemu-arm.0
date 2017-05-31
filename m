Received: by 10.25.0.6 with SMTP id 6csp194715lfa;
        Wed, 31 May 2017 00:21:40 -0700 (PDT)
X-Received: by 10.200.39.93 with SMTP id h29mr28200049qth.76.1496215300276;
        Wed, 31 May 2017 00:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496215300; cv=none;
        d=google.com; s=arc-20160816;
        b=bDIPV/TErtNUt4mmuMYQ8Kw0/i3SuF9JFuobfAJqkeHmd8aY9RMSOzU/vtzNUPftHI
         xBUSXjURpR5EhNFpRABmqKiVcNuFeknx2M3W+eTIX4yh1qtyFvlLnqy96u8DKFsddbc2
         F8L4KZwG4IN4lmfOBbnUkaeRRnv8BUbNWj3vCrefBPabAICwOnO3AS5IvCf8ag1nAeBa
         3QC3rxN9biVjNI1gOJpOjEXcQjUm3JCGEnSECg2QDmI7o6Q9tcbFQFemsGJQHoWqkjJ5
         Yqbo3XpcH/SBxrSRTtcRjHPwAyn5eOJNgSXel8oSmkoAFzXFTyxLinlH8FrDKX8eLHI8
         sCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=CnTER0yGJd8TKhD2C88mMCA0l+E6+sQN6UQYjkZsFXk=;
        b=ZA4q9C+MYNOGlm4P7JeDHbvfunQI/9Fxo3jhmDPIHHIr9eZMMT1z4yWMyj8T3w3G+c
         T9obXhYApM2Tr/8YJEpNizxEFsgskW+pU/SnXynrwVFqnSYdt4basyGgs5HON0rqWNsC
         RZHTL7zB5/vtwxpk/37MImzjcMhCFOpUKTkZ695ttl5enYd7/Yk2pm41NX81zhTj99G7
         kx+xTztwwSl3Za6UghZbT+dY6I9+bw/NPoKMbzN5L6/b1s4Y+E7u+Y+wroYNJYYZdL83
         yXti0s7RJU8IrhyK4PFNVNuwKMnlesa9n0E3uivdofTCWiCBGXiz0ub2SxcyDBC53b47
         ID2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si14627564qkj.264.2017.05.31.00.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 00:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFxwn-0002fU-Ho
	for alex.bennee@linaro.org; Wed, 31 May 2017 03:21:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxwi-0002fO-1p
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxwd-0000Ae-RY
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dFxwd-0000AP-Lr; Wed, 31 May 2017 03:21:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76C1380F93;
	Wed, 31 May 2017 07:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 76C1380F93
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 76C1380F93
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDD75DC1F;
	Wed, 31 May 2017 07:21:23 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_LNipd3oxtcLdm7g_65E39YHKxkd--1Tf6LhVOytgY=A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8a967ae6-b047-9d09-acc0-1cd9540312fd@redhat.com>
Date: Wed, 31 May 2017 09:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_LNipd3oxtcLdm7g_65E39YHKxkd--1Tf6LhVOytgY=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 31 May 2017 07:21:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 0/5] ARM SMMUv3 Emulation Support
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
X-TUID: siCjwFy+1lJ9

Hi Peter,

On 30/05/2017 18:09, Peter Maydell wrote:
> On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
>> This series introduces the emulation code for ARM SMMUv3.
>> This is the continuation of Prem's work [1].
>>
>> This v4 is yet another visibility step as many restrictions apply
>> to the model at the moment:
> 
> I had a quick scan through to see if anything leapt out
> as odd, and have sent a few comments, but I'm assuming
> you don't want in-depth review at this time (and hoping
> that somebody else will provide it when you do want it ;-)).

Thank you for this quick scan. Indeed this is what I expect at the
moment since the model clearly misses maturity and features. I will ping
people for proper review when this makes sense.

At the moment people can start testing it for stage 1 only. I was
reported and reproduced boot problems with a guest using virtio-blk-pci.
This is currently under debug and then my next step is to complete the
VFIO integration.

Thanks

Eric

> 
> thanks
> -- PMM
> 
