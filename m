Received: by 10.28.71.27 with SMTP id u27csp3748142wma;
        Tue, 6 Feb 2018 04:56:35 -0800 (PST)
X-Google-Smtp-Source: AH8x2261V4eBHRXydaLiEArLPLYlLnhT5RYsGCbXzxJ/+F6dElLu15CNVP8AhzCU7IZWQWcPzm9R
X-Received: by 10.37.128.69 with SMTP id a5mr1253887ybn.265.1517921795422;
        Tue, 06 Feb 2018 04:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517921795; cv=none;
        d=google.com; s=arc-20160816;
        b=yUMqGclQsAn/rajofIKHhDuBZOCW4jhoFRlCyfs1aSYUK+wLQdJdwHOT5qSI+/7WLm
         kpRCb8po1K8pfY/IB5+IPkbNEKLc1xMin7CrlIqj9XEqtbLms/qMS9QQAMFABYq89fRB
         jp+cv5CWETA94tP+ECbQhrINH9TDa1TYtUE7pMFleGnpF0vU0nZFQ8Vj/gQQrykd3LiT
         osBfuXUluuOlQyGZfXSIBj6db7c6cjSr88rpnDz+ngmPFrrWufjiCddPYQxdChGxYrtE
         AClahqfZ/T3vfPfDGy4Du747uiCG9pVpsbwEM5aQr3L1Q93tXouiCN0tVSKV/QIkj5RT
         6TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=NDnqFrRTenjRAIvfyOEwxuI3wFNLFfCeETZ1uqkS4e4=;
        b=ukDULQzYQ+OnmIqDT1Jib+HtIqAmJah/TxK4RNOCQmyixqvPUfCXrs5zwoEZyLZUag
         +9p0b/K66RL1zdH9WFntowEG3Eb4BK2g4UjlI+uKeGdV7SSRYAZLsJP0xSbzBCd8iYLz
         xR2FxsPpMRtgpRBx6s6tnAEzPOwAHLBf/gLiUTgN67IT7XtcYgneZWopEvJoXsPuFuL0
         U9t7IoEHYTTk3kVYlAbSJvBFuZ51BxdZdAd01p1orWtAuiG1LHe6+dnO392M+hSAj4Gz
         YmqPj583wTfK1zHAzX4Lr22OroxZHCCM6KnkhsO7jnOyUUdrXEDfd+7tuqbDDbXL3GWg
         awQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f21si188893ybg.760.2018.02.06.04.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2na-0005To-U3
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:56:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ej2nR-0005SQ-C7
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ej2nM-0001SI-Hj
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:56:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ej2nM-0001S2-A0; Tue, 06 Feb 2018 07:56:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35825C036740;
	Tue,  6 Feb 2018 12:56:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58FF760C1C;
	Tue,  6 Feb 2018 12:56:06 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-40ucm8WZOEJC_1r4MdFXEPuX=GM2FC3hKZamLbijM7w@mail.gmail.com>
	<bdb379f2-5272-dd5c-056d-da487dd21500@redhat.com>
	<CAFEAcA8R5zYM5ppcx4wJk4jkMbCekjZVyL+m7R6mekf+nA6O+g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f58908c7-71bd-eecb-2d67-5bfe85d82ffe@redhat.com>
Date: Tue, 6 Feb 2018 13:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8R5zYM5ppcx4wJk4jkMbCekjZVyL+m7R6mekf+nA6O+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 06 Feb 2018 12:56:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 10/20] hw/arm/smmuv3:
 Implement translate callback
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Prem Mallappa <prem.mallappa@gmail.com>,
	eric.auger.pro@gmail.com, robin.murphy@arm.com,
	Christoffer Dall <christoffer.dall@linaro.org>, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yr2uxZMRcQ/2

Hi Peter,
On 06/02/18 13:43, Peter Maydell wrote:
> On 6 February 2018 at 12:19, Auger Eric <eric.auger@redhat.com> wrote:
>> On 09/10/17 19:45, Peter Maydell wrote:
>>> Incidentally, the spec requires us to perform memory accesses as
>>> at least 64-bit single-copy atomic (see 3.21.3) -- does this do that?
>>> (This gets important with SMP when the guest on another CPU might
>>> be updating the STE or page table entry at the same time as we're
>>> reading it...)
>>
>> Among all your comments on v7, here is the one I am the least
>> comfortable with. I was not able to figure out whether
>> dma_memory_read(), which I use now for all the descriptor accesses
>> guarantees this 64b single copy atomicity.
> 
> It doesn't -- it winds up in flatview_read_continue(), which will
> do a memcpy() from guest ram into the buffer, and since it's
> using an arbitrary passed-in length value the chances are high
> it won't end up using an atomic access on the host.
> 
> This is a nasty issue which we haven't figured out at all yet;
> see also this thread:
> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03067.html
> 
> For the moment my suggestion would be that when you need
> to do guest memory accesses that have atomicity requirements you:
>  (a) use an accessor function which specifically loads a
>   quantity of the correct size, rather than one which takes
>   an arbitrary start-and-length
>   (when we add APIs which do have atomicity guarantees they'll
>   be "load 64 bit word" etc, so using our existing APIs of
>   that form should avoid needing to restructure this code later)
>  (b) add a TODO comment noting the required atomicity

OK thank you for the link. To start with, I will add a comment in next
version then.

Thanks

Eric
> 
> thanks
> -- PMM
> 
