Received: by 10.28.91.67 with SMTP id p64csp1078274wmb;
        Fri, 9 Mar 2018 10:05:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELtMN0BBYkQa/mbW/aLnBlrdoMnRJ24FHzgKnuUaphHe9iITJheiBFaeWkati2KOzpoOQy9+
X-Received: by 2002:a25:a269:: with SMTP id b96-v6mr14717013ybi.91.1520618733543;
        Fri, 09 Mar 2018 10:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520618733; cv=none;
        d=google.com; s=arc-20160816;
        b=Goz2AfPENipnH3Vfza2n+sSCHJptIK0eqf4kIFE19vOeu0HbV3zXiGlLnCfym8Ss6l
         UX7J2SDSc9QIbVf43DRNZXLI5COzmb5H0b+HNRTICaAyLPs2iBjJipYT1DINZ48ZDOhR
         lzN2Pbl/5I504O9mQv9qYbLkHHgwDGq115mf3GaoXnfDnPx3S/1ioPzu2d2KRObSasEC
         u+1pMAPujLt5Z6KOP8wHYSmu5qg6mgg6HOx0fcYgDPrWl5Ff3dmsBkpaXuiT/9cxLwUy
         lTofsjwcNO96Ut7AK4r/mQOrooV/k56Yj4r4XLhZQH1ny56OSRczEr+MXieco6/7i0l1
         AbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DH6dufL1NxV0vJmkLFpKCkVyWEpBuVi72bMy0ooQbW8=;
        b=f8IQMVlPRqg7FE3jsyGuLbifASvIFulustYSXKIB1AfsWoZem0uybF539O9zQ5fh4K
         jiNKu2HSI2N5vWRA9K3QWapguL3Z2m4dd91a0KC6kF6tT3umdvkzT0KkGquV+c5k5iTX
         Kif9KQ1sksDyoiWMqLhY8ARcERINH/0BvbeO5Mju7oFtAStWnlhcoWHWaEQyKUgDKh/Z
         Ini028YruK595ztLg/8XjwqW6Isy6t+WnA2EkFtO2jUXvvKSfOENQagfclxxlps0ZAbr
         EgwpGJABR24S6x77mJ8jxOgjAYemUVGyYLfZJpKw7zt65JEr9O3VnAW/SDYneRZROsQz
         FvNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPsfIgEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64-v6si253761ybk.517.2018.03.09.10.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 10:05:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPsfIgEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euMOa-000079-V4
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 13:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euMIe-0003l9-Uh
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 12:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euMIe-0005GN-3C
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 12:59:25 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1euMId-0005Fz-UE
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 12:59:24 -0500
Received: by mail-oi0-x244.google.com with SMTP id x12so7582782oie.13
	for <qemu-arm@nongnu.org>; Fri, 09 Mar 2018 09:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DH6dufL1NxV0vJmkLFpKCkVyWEpBuVi72bMy0ooQbW8=;
	b=NPsfIgEowFxpfXab1beUzKoyavDUFwQYORDV7YJC6oBNlF0ahXL9h58d14yL2rnyrO
	GgJZl5z7qd4KWZpoPsZ6KeaGjJUr6SepoN7tcV+qVC/HzOJeMhPSyMNO6827TGO/7tsk
	wgAvjSjAZw79cLc+1zJn+W+Kbv4HRORp7keJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DH6dufL1NxV0vJmkLFpKCkVyWEpBuVi72bMy0ooQbW8=;
	b=jksIBJ5nRl8AJzZG+YguDXQfxkXrWRd70avkT1Ny69xPuxmcycN+hgIFnAbuV1xZ5x
	U8C7bVJZ85/wDKGwS09k5E976r5XABHgLB0koTFLpuSShKauzlxXoyctNocn8CgtBInA
	Hwp0083TvIgN5V10w40ejkSS7OzdQDQ6pz8t/Khf3xmEqZtQ+3CCGNpJuJdJN3jgn5sp
	Kmh4afISRCw3LuX3NGB771RVOJ9hZpV729kO9NLscfVuVQhdphiqN4jCQ8S5JL6SKCSC
	JxiRBUaFGUJyR9SN1F6C4JBCzX7ArLXzdjhPN+BnP2vUYVjPd72ANLrNEoacrq1L9iie
	GK+Q==
X-Gm-Message-State: AElRT7EjGYyh6epMCR2MzvPr5pWPqKSpGyeq+TJsjQc3VPGsxWhZeunt
	RuXizgOHBiPOLELikkcGYST4xzNzoIcuo4Z0WO9fhM/m
X-Received: by 10.202.97.87 with SMTP id v84mr20241476oib.12.1520618363187;
	Fri, 09 Mar 2018 09:59:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Fri, 9 Mar 2018 09:59:02 -0800 (PST)
In-Reply-To: <a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
	<a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Mar 2018 17:59:02 +0000
Message-ID: <CAFEAcA-08=3jyf1fpdD6AumJmbL=64iLOpoySVCfot7CXiD4Og@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v9 10/14] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rs4gQ6Mu7Z/i

On 9 March 2018 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 08/03/18 20:06, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> At the moment, the SMMUv3 does not support notification on
>>> TLB invalidation. So let's abort as soon as such notifier gets
>>> enabled.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  hw/arm/smmuv3.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 384393f..5efe933 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1074,12 +1074,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>>>      dc->realize = smmu_realize;
>>>  }
>>>
>>> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>> +                                       IOMMUNotifierFlag old,
>>> +                                       IOMMUNotifierFlag new)
>>> +{
>>> +    if (old == IOMMU_NOTIFIER_NONE) {
>>> +        error_setg(&error_fatal,
>>> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
>>> +    }
>>> +}
>>
>> Is this triggerable by the guest, or by the user on the command
>> line, or only by a bug in the board or other QEMU code?
> by the user on the command line.

OK. Do they get this error immediately on startup, or only later
in execution? (If the latter, is it possible to make the error
happen earlier?)

thanks
-- PMM
