Received: by 10.28.91.67 with SMTP id p64csp1576140wmb;
        Thu, 8 Mar 2018 11:02:13 -0800 (PST)
X-Google-Smtp-Source: AG47ELs136WplnS4/iBExc914MrU4B1tbJMStvNe4m4puanmdTFBsO4kDxCSm7MVvcarYwnv2xU+
X-Received: by 10.129.121.75 with SMTP id u72mr1529824ywc.104.1520535733244;
        Thu, 08 Mar 2018 11:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520535733; cv=none;
        d=google.com; s=arc-20160816;
        b=wAj7bnkBmZfP4mHqKjfmsHPIfJ3cVXaErdChVyeQeHdaWlWk1q+djDxoCi290rFEiN
         uZaIsnoyIeOSsvStkbAzuqlMVCmCqtO5eAov5pZpT726KL0mGqTYp1VzXfhkTKws6Zbg
         T0IUIo78JHqbJ8MlaapHzrZCnIkSrkzjM6ZAU8J6ekcKcew3xatGUhG7ByyzbC2t0iEw
         SWOALRSgEZHZMLwrUA9pHgB2PDhyP2BMLSGSNDa3qgTIJClwPgDmWF+e5rSUYeNqLjzn
         vIJTcd8Tbl3v8TmyQJ8DYc2KX/4DEuhB3B8ZysNhO7IXhNups+/VlGo4wjPH0aTR6aUu
         Xwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Nns1mSFpgDzuM8laa8/11LF9xG6n8yq+pWw8wTsjPRU=;
        b=eQGv7lXWqHztkhu04dqSXwvp16zCXpWylk25lSgYxhsEtCqD8uJ3HUOJFel1ihfZ+T
         tueDnzpbu3Ih02AP85wnSt1Rk4teWIAwSVBPwzGTp7reIi9pnWpD7CIRWcP558bx38J4
         PlXelfOfdgpLfdhG1ntKnwh26JJTpIzRHyBSPkTQHPNd/S9Gg242A2+PwjhP+TPNPACb
         VWiH2BKvWNqnReJFjY2TXRQUIaCdNz6tI7DO4k/wx3SKrv/Co0LN4N7Q6FhbNYTxzox9
         CDkptsLXxG9wxTpDJMTKCfHw6l4K5af1DNC/9hjtf45qMtiMpx7QIo3uEXk9KLmaXy8S
         /BPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FcxT71t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j85-v6si1319608ybg.518.2018.03.08.11.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 11:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FcxT71t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eu0ns-0007k3-MQ
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 14:02:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0nb-0007hG-J6
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 14:01:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0na-0001ha-Lu
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 14:01:55 -0500
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:34042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eu0na-0001hL-Gk
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 14:01:54 -0500
Received: by mail-ot0-x22b.google.com with SMTP id n74so6427745ota.1
	for <qemu-arm@nongnu.org>; Thu, 08 Mar 2018 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nns1mSFpgDzuM8laa8/11LF9xG6n8yq+pWw8wTsjPRU=;
	b=FcxT71t0orroB3/vrigx0jskUjdNbnks8OfJGreWT7fdOC0BgT8zHgzBfoacJqoLMM
	sKEq1OApAuOc11vWOkoIuYYg8xTo3a2UKPxB8VuL5id8yZmwyZG+Eoy8WGlcOsz4ojxj
	ct/atO1+5Xhim0cd29B23Du4rZm3ryjFv0cO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nns1mSFpgDzuM8laa8/11LF9xG6n8yq+pWw8wTsjPRU=;
	b=VIU4Lrf1LaDz9QOiJc5JZACzonx2v8hH+ckxQlN2V37EOJxAQ1MbY0pVuEnssxhQKe
	dAxfJOvDE6/CwfKu8D2ke0uEm3unnWWVMZGJyNrybBCaODF9xkNh3c92GJVET2rrY8Wa
	L31EUDc7YlV4f7c48etJmTx7jVbVwZcFxcyamW9fk1lAx8KoRIQf8XjGKYO8xa2rsEn8
	TNDWL3spgAbfkE1WCTR6qgW5brhJWm4y1ANadGq94FnwYXEf+U/RXXs1VGrQi5vSDZqL
	DLOSUvB5WrqydopR/PfIJWxwhSODvbKh0k/xf10ggN8f30h2NzzEWOdeV+lS9/yfE0o9
	pQjw==
X-Gm-Message-State: APf1xPCUJNAQvlhuGgiH6hSeA62IfpM4xdYamdB0ZJwFVvzT+cDy75Y2
	s19hErXCq+NEd6n7JM56R1t4IcvEwdM13FRT+TJxxodn
X-Received: by 10.157.72.231 with SMTP id a36mr19838582otj.308.1520535713530; 
	Thu, 08 Mar 2018 11:01:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 8 Mar 2018 11:01:33 -0800 (PST)
In-Reply-To: <c9174fa5-263a-50ec-e3c9-8272cbb08b4a@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
	<f1e870f8-9669-ffde-0556-bc8b16467356@redhat.com>
	<CAFEAcA8+CDvbsQw5EKz5t0JJa1oNpteu+=X5JHxFNdyBUu7OTw@mail.gmail.com>
	<c9174fa5-263a-50ec-e3c9-8272cbb08b4a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Mar 2018 19:01:33 +0000
Message-ID: <CAFEAcA8je7Rze39AeMDN_9RphNOvn9ycEgm3EbVL64G_+V9xPQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v9 03/14] hw/arm/smmu-common: VMSAv8-64 page
 table walk
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
X-TUID: y8qcREQ0b0QS

On 8 March 2018 at 18:56, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 07/03/18 17:35, Peter Maydell wrote:
>> On 7 March 2018 at 16:23, Auger Eric <eric.auger@redhat.com> wrote:
>>> Hi Peter,
>>>
>>> On 06/03/18 20:43, Peter Maydell wrote:
>>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>>> +#define is_permission_fault(ap, perm) \
>>>>> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
>>>>
>>>> Don't we also need to check AP bit 1 in some cases?
>>>> (when the StreamWorld is S or NS EL1 and either (a) the incoming
>>>> transaction has its attrs.user = 1 and STE.PRIVCFG is 0b0x, or
>>>> (b) STE.PRIVCFG is 0b10).
>>> I think I don't need to as I don't support this feature at the moment:
>>> spec says:
>>> "When SMMU_IDR1.ATTR_PERMS_OVR=0, this field is RES0 and the incoming
>>> PRIV attribute is used."
>>> But to be honest I was not aware this existed ;()
>>
>> I think you still need to check the incoming transaction
>> for user vs priv, even if you don't support STE.PRIVCFG.
>
> On the CPU side, you have MemTxAttrs as input from get_phys_addr_lpae().
>
> On IOMMU side, the current input callback for translation is
>
> static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr
> addr, IOMMUAccessFlags flag)
>
> where IOMMUAccessFlags just is R/W access flag.
>
> So I am not sure I have acess to those user/priv attributes.

Hmm, yes. This looks like a deficiency in our IOMMU framework.
For the moment put a TODO note that we treat all transactions
as privileged because QEMU's IOMMU code doesn't pass transaction
attributes around correctly.

(This will also be an issue for secure/nonsecure eventually.)

thanks
-- PMM
