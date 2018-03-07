Received: by 10.28.91.67 with SMTP id p64csp201191wmb;
        Wed, 7 Mar 2018 08:36:30 -0800 (PST)
X-Google-Smtp-Source: AG47ELtfngdtwQSXkrqmT+HON+TbDyZmmpAEajeZaH9sXtwv+LjMohr9dq36yPEBJjf50hWFCnwf
X-Received: by 2002:a25:c707:: with SMTP id w7-v6mr14092612ybe.14.1520440590308;
        Wed, 07 Mar 2018 08:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520440590; cv=none;
        d=google.com; s=arc-20160816;
        b=OPQ6b2DlWyBfnd0yAXpcrU88Z9XfWEncHTmkuTxLgI6ai140wUo6Yk1vn8If82ETqM
         Fr0e+MTpGyk/UdGsnI46z6Es6UDNjsbweymGhRsNRfYxb1IajKfVKWvJSI1vhrcQuG2X
         qYZbMzizee4O93+mGIJLlQlzya22sdDh/1HK92cKrhmNMigEg9tmbFLcIIXX1eBanpqH
         PR0RoFApGueh9OZ66vqDYR7VNjQwHCGJSjun14TfO8DMk5PQ8Rh8OZDSAMtngz0H2EEe
         MLTfYQZq2rUp0SeKoDVZaOTndKinWGqpRc3WRK/fRvM0g1P5/aRagdXIgRAfe9S4IeI9
         yZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ps/5BVWKMexKeXwikD9bcOdB8SUYqvqOBoVl70549mk=;
        b=tRBWlVxwfNp8ZPDIUHGFQVIrbmdp1swshlG2p3kfi0K9f0tHi5hoiz/Zqu4D+CTBQX
         LYckPUyEW6EHMd4FRzVDZFwIgIRJbpfNGu8d6r2oGqHNu1+fYSE+F6gA/Kv2ysgaTMZf
         VsnrHeUm2FKplGLtOK42+UP1W41YhQ8qee1dCAQTY++S73HJ+dBkTLK12sH+js4U1qg3
         pzrLBig95DLPUwd7Vr28ft1W7rlZC0/OQuhJPDlc8aAGQfIhrFWXkaf/c2yz7iaDuJx2
         9XeHQgymCeEqmEOMosGSgqMRUfg4pCtB/BEz38aoDZLkZh+qMiBZwyCshpDze/EDGjnG
         0kIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwzkfKd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x187si174831ywb.760.2018.03.07.08.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Mar 2018 08:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwzkfKd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etc3J-0005lv-Om
	for alex.bennee@linaro.org; Wed, 07 Mar 2018 11:36:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etc3A-0005lA-34
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 11:36:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etc39-00012S-1g
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 11:36:20 -0500
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:46653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etc38-000127-S7
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 11:36:18 -0500
Received: by mail-oi0-x22a.google.com with SMTP id x12so2102610oie.13
	for <qemu-arm@nongnu.org>; Wed, 07 Mar 2018 08:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ps/5BVWKMexKeXwikD9bcOdB8SUYqvqOBoVl70549mk=;
	b=fwzkfKd0oBRckrCOQLfE7uiYmHV61GMs8J5FKcNylTRBdJw4WxzxMJpNJjWAppb6al
	o8QmnJCwvbUkVrqns/h0EfL9F0rY/YElzGVuHlyK9qPH2iw5crKD93CykxnE7wNvawSA
	0k9HuY9bmY+3Zn9bOp53nJVGU1LA3NE64ekCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ps/5BVWKMexKeXwikD9bcOdB8SUYqvqOBoVl70549mk=;
	b=k3kQWeRHS0J3PKc5mLpg6Xz4J3cU86bHGvnxXJf0WNq1OdtXkebqA0dNplO5bVOic5
	PFFv9K1M/V1XaiO7J1iH4n2Mt5ED8UDP9bl4KBw/XQA70dnPNpImXMzyXf/M6LXRAwDI
	EAumFgvKkPLH/rSpYSb+1+1fNa5Qe0QKvc5hcGc2VXaYdW1FrO5M+pSi8Z6vJwrR8kBQ
	eMdBdGuyo6PndDZSsWJGDyZJYjYr8HPzRpoM/xqSdkQcfwz1EtEniAUTD+5TXgBRH2GI
	Mc8HzoPMj+ffqjc+XtoJde9jo4T1Upsa6s3Dw0WLxSxIA64OeenBHcuW/O37A2WvYQ41
	QvVw==
X-Gm-Message-State: AElRT7FpLpyaPU0RtvdkxRQoM5LwE+h2SFUvBFfEoyG9OcLl/R6dF815
	3VWauXs40qVcUqIsS9YItZUStBSZTo4c9igbRnkQCw==
X-Received: by 10.202.61.198 with SMTP id k189mr14696663oia.252.1520440577917; 
	Wed, 07 Mar 2018 08:36:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Wed, 7 Mar 2018 08:35:57 -0800 (PST)
In-Reply-To: <f1e870f8-9669-ffde-0556-bc8b16467356@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
	<f1e870f8-9669-ffde-0556-bc8b16467356@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Mar 2018 16:35:57 +0000
Message-ID: <CAFEAcA8+CDvbsQw5EKz5t0JJa1oNpteu+=X5JHxFNdyBUu7OTw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
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
X-TUID: Zxsp8HcEs2mC

On 7 March 2018 at 16:23, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/03/18 20:43, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:

>>> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>> +{
>>> +    if (!cfg->aa64) {
>>> +        error_setg(&error_fatal,
>>> +                   "SMMUv3 model does not support VMSAv8-32 page walk yet");
>>
>> This sort of guest-provokable error should not be fatal -- log
>> it with LOG_UNIMP and carry on as best you can (in this case
>> the spec should say what happens for SMMUv3 implementations which
>> don't support AArch32 tables).
> This code should never been entered as the check is done when decoding
> the CD in the smmuv3. However since it is a base class I wanted to
> enphase the ptw was only supporting AArch32.

Ah, right. That should be an assert() with a brief comment
about why the condition will never trigger.


>>> +#define is_permission_fault(ap, perm) \
>>> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
>>
>> Don't we also need to check AP bit 1 in some cases?
>> (when the StreamWorld is S or NS EL1 and either (a) the incoming
>> transaction has its attrs.user = 1 and STE.PRIVCFG is 0b0x, or
>> (b) STE.PRIVCFG is 0b10).
> I think I don't need to as I don't support this feature at the moment:
> spec says:
> "When SMMU_IDR1.ATTR_PERMS_OVR=0, this field is RES0 and the incoming
> PRIV attribute is used."
> But to be honest I was not aware this existed ;()

I think you still need to check the incoming transaction
for user vs priv, even if you don't support STE.PRIVCFG.

>>> +
>>> +#define PTE_AP_TO_PERM(ap) \
>>> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>>
>> Similarly here.
> ?

Can't just ignore AP bit 1 (or 0, if you're counting it that way).


thanks
-- PMM
