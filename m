Received: by 10.28.91.67 with SMTP id p64csp628836wmb;
        Mon, 12 Mar 2018 04:10:34 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv6QmRSru9wcXoBLlDRmUjW7To5qjlPO8BFlzVyDCBbUbpVH6gPZoYCmDaIAc1B0EIDMQeI
X-Received: by 2002:a25:810d:: with SMTP id o13-v6mr4272085ybk.340.1520853034822;
        Mon, 12 Mar 2018 04:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520853034; cv=none;
        d=google.com; s=arc-20160816;
        b=SR0ZtYwuCzUksT1sCg7PZ41UuEu8J4I5m1KuwMQ6uqlzHEGTQTq/SfpQtKCoZG1hzq
         u0c3uJdW7+Yq7c7vArWlB0XlyPotVfah1PYK2wnZCSG5E1bNsECL9d2S9S96GwPQrOAb
         10twQC+oXLgxBkUNqHIIXjL7Nno4mjFCZN4cZQ3cIcXjNx01tf+y7uU0WQ4p4l22LN4s
         V3eoa/fILTAPs5uZKytRxevlAVXouDIyHsVT51ZJDTVaBfhPx9uYtzuye+IdubpTfIub
         9nmHwhL+TsTUdbg4H951gqmuCJFaSsFQtIRtted3wkwFzZpm9WLaLOzUuloQqRDmFMGv
         BNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TGp1GeASNBnWgK9RIqhBKGV6aAt0/M4qIXXfVyKtxl8=;
        b=qvAi6BRvTfZ4/tkm5p0/tLeoLSRTRtu13Vk4CQqyzaYpNsHbblT0Bi3zsAKyYlxv4Y
         2SZ3wxkCwboUfbYbzn3c/KrD4MAi9FxQF81543HsWMXvuQ9RGvpqEtrSYEtqG/bjE/iX
         E8i690NSLbzJVMRETM7ji2Zg+TOmzx4gVox/z6GprdI3+BERnpcTDrJqDZdEdpiEitqN
         3Pwj30y7asWUymkrhrGycupMCBshSGF6Znr0tXLuSTDz2eI/wBAdrTiKw5TYexzYoJbi
         9boIAK0YJRiNMOXH42NYuHVdJjrOblCqir0TU6nUGij0rEFpLrtH1nnLtlp1Rt29PX0Z
         xfZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aE4Dq/iQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si145615ywi.24.2018.03.12.04.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 04:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aE4Dq/iQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evLLe-0000Nl-7L
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 07:10:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evLLU-0000MY-TX
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 07:10:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evLLT-0004cF-UW
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 07:10:24 -0400
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:43435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evLLT-0004aV-ON
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 07:10:23 -0400
Received: by mail-ot0-x22e.google.com with SMTP id m22so14828495otf.10
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TGp1GeASNBnWgK9RIqhBKGV6aAt0/M4qIXXfVyKtxl8=;
	b=aE4Dq/iQSGfGWfNfOjvRNo8dtUFUJg6e/uXhYthnDkyuHAJXXl9qfGmTIPm2U2XmS4
	8zonEQgZm89hrumofT6ZcFZyMusJyLxlMusdJwiFyqkUkQOricAJ5LrzJeF/iUHjppTa
	8hQORWQhN1GdFh/AVW6fePdsRxUatboYbVuOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TGp1GeASNBnWgK9RIqhBKGV6aAt0/M4qIXXfVyKtxl8=;
	b=eYhoGj98dtS9o8s6BnY/Ho5uBiCzxdS6cqPCCbhCTikpGzQWcikqdXXdQMa8kguDbJ
	bMeQ464KprhN/3RqseIx1O5z2/fymKNlRrhwE0UABmOG5U/Ne71L3MeydjUj6aAPHyUM
	PhprBOqw8ldwjAWl0jeWMjwuqkd+AJ8OoxyTlPv8LXitMAvAtZ1HrhPVzqiYrK26Gq88
	QNiy3IrRHYxHbttQZWg78rUEss+gxpOKSaIZwXvyzpvO76+xBenDCwPhalJ001e7u63g
	fte0EeVPi/sN54iQMkpFbKhHbwyeSsDPZY/ovhSCQjWjVQGUxNsnYxG6/vD1l1vgaJfn
	IhLg==
X-Gm-Message-State: AElRT7Eec2Y2VAyhb3rl5oDUe/U10XJuk7y7Bnv/SC4ewSQjx2qr/ie7
	2kEoIwavSw4L/CkJVKy++Akr3wl91YpJDjvMFmPVOA==
X-Received: by 10.157.72.231 with SMTP id a36mr5367808otj.308.1520853023072;
	Mon, 12 Mar 2018 04:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 04:10:02
	-0700 (PDT)
In-Reply-To: <8ecafc78-5ea0-5d83-41d4-0b9b95bcdf21@gmail.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
	<a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
	<CAFEAcA-08=3jyf1fpdD6AumJmbL=64iLOpoySVCfot7CXiD4Og@mail.gmail.com>
	<8ecafc78-5ea0-5d83-41d4-0b9b95bcdf21@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 11:10:02 +0000
Message-ID: <CAFEAcA9--5Ja9-jNVp7dJEN_y4is25NT9TSQcakDdSkpSV8R9A@mail.gmail.com>
To: Eric Auger <eric.auger.pro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
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
	Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZZ9yYqgm6lpm

On 12 March 2018 at 10:53, Eric Auger <eric.auger.pro@gmail.com> wrote:
> Hi Peter,
>
> On 09/03/18 18:59, Peter Maydell wrote:
>> On 9 March 2018 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
>>> Hi Peter,
>>> On 08/03/18 20:06, Peter Maydell wrote:
>>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>>> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>>>> +                                       IOMMUNotifierFlag old,
>>>>> +                                       IOMMUNotifierFlag new)
>>>>> +{
>>>>> +    if (old == IOMMU_NOTIFIER_NONE) {
>>>>> +        error_setg(&error_fatal,
>>>>> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
>>>>> +    }
>>>>> +}
>>>>
>>>> Is this triggerable by the guest, or by the user on the command
>>>> line, or only by a bug in the board or other QEMU code?
>>> by the user on the command line.
>>
>> OK. Do they get this error immediately on startup, or only later
>> in execution? (If the latter, is it possible to make the error
>> happen earlier?)

> later in execution. We also have to handle the case where such device is
> hot-plugged. At best if could be done on smmu_find_add_as() by checking
> the type of attached device but this wouldn't happen much earlier. By
> the way we will soon support vhost and we will just rule out vfio
> integration by detecting map notifiers.

Hmm. error_fatal is a bit unfortunate for a hotplug event -- ideally
you would want to cause the hotplug to cleanly fail without aborting
the running QEMU session.

thanks
-- PMM
