Received: by 10.28.91.67 with SMTP id p64csp1570931wmb;
        Thu, 8 Mar 2018 10:57:11 -0800 (PST)
X-Google-Smtp-Source: AG47ELuInrxAIbHiDguv+kOx+Kdg1q9pwezIXCSW6qeS89mDcc5S2UcjLIK2QhfR3zmPDivwU6z4
X-Received: by 2002:a25:fc28:: with SMTP id v40-v6mr10718634ybd.222.1520535431904;
        Thu, 08 Mar 2018 10:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520535431; cv=none;
        d=google.com; s=arc-20160816;
        b=b6BKhGhh/7wi3Dy93pT4MHBeCnX7Hf92aEaTcCN6ZnYD76cXL0Cd02oIXmsliTQ5ej
         3BhTNPH9KYdIAXVDAOHAh0eGa96aDdupA6ArmiglS4wzMd0yUIqh9lPHtQZ+B7Q46bzZ
         mVsgEWhzFT7YSX5LwsZ9CmJpvAPxRbaloUDRkOV7s0LN5nrHVmOv2FaFZ4jABKOuBxGD
         MEZ1WxsGJBVSZ/uAfZdB8uOiVNBd2tR7mDYcNjh5I4lv74FfDQnk8eeQt4xEXyOmvjcE
         tJScqNIgaX/SS/704zxZwdLbSOQgrtIBl37yPfZrDk7UK10eMHjJGMcetfjvTLUFVeo4
         J5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=23NAuiLbW9e2aSOaABY0aHrKRI4H7rePuKmm87srKN4=;
        b=glZDaXQtCGTBhTW8DaFRue08vUu6BCrBoTFTMBxrsfxTAodmc1J63uwkKpPOEVMh46
         YY5/ppATgyjFmvnZF/XTauCPjQDMgNjUT6nc+xonWHnmnoV52wshJ9u0iFEwCnyGoEeO
         gN0QhG7tnutFFr/dXguiRrh6GqWULox3ztnKdSQwx6wJWde5WxP5YcNLgxX7CHerUeS8
         m4gGtDS1uIbmBBYhI9uv9c1FPnwV/2MbTRw6PCOlVGmfj2vsOiIICb+8rPJoHdEFjJwI
         kKcfF6pJfSolEOY1sdEuC2yQIxczzN5DMlF+7q6aZorXEWYjW2FqZZ/DnwYEMXYjGeDt
         /Gcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si3516506ywm.459.2018.03.08.10.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 10:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eu0iz-0003Lj-3N
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 13:57:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eu0ip-0003KB-85
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 13:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eu0il-0007lS-9S
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 13:56:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48906 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eu0il-0007k6-2y; Thu, 08 Mar 2018 13:56:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA9A3BD9E;
	Thu,  8 Mar 2018 18:56:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A541DB26;
	Thu,  8 Mar 2018 18:56:24 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
	<f1e870f8-9669-ffde-0556-bc8b16467356@redhat.com>
	<CAFEAcA8+CDvbsQw5EKz5t0JJa1oNpteu+=X5JHxFNdyBUu7OTw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c9174fa5-263a-50ec-e3c9-8272cbb08b4a@redhat.com>
Date: Thu, 8 Mar 2018 19:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+CDvbsQw5EKz5t0JJa1oNpteu+=X5JHxFNdyBUu7OTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 08 Mar 2018 18:56:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 08 Mar 2018 18:56:38 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-TUID: upmkBi0E/c9t

Hi Peter,
On 07/03/18 17:35, Peter Maydell wrote:
> On 7 March 2018 at 16:23, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 06/03/18 20:43, Peter Maydell wrote:
>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> 
>>>> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>>> +{
>>>> +    if (!cfg->aa64) {
>>>> +        error_setg(&error_fatal,
>>>> +                   "SMMUv3 model does not support VMSAv8-32 page walk yet");
>>>
>>> This sort of guest-provokable error should not be fatal -- log
>>> it with LOG_UNIMP and carry on as best you can (in this case
>>> the spec should say what happens for SMMUv3 implementations which
>>> don't support AArch32 tables).
>> This code should never been entered as the check is done when decoding
>> the CD in the smmuv3. However since it is a base class I wanted to
>> enphase the ptw was only supporting AArch32.
> 
> Ah, right. That should be an assert() with a brief comment
> about why the condition will never trigger.
> 
> 
>>>> +#define is_permission_fault(ap, perm) \
>>>> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
>>>
>>> Don't we also need to check AP bit 1 in some cases?
>>> (when the StreamWorld is S or NS EL1 and either (a) the incoming
>>> transaction has its attrs.user = 1 and STE.PRIVCFG is 0b0x, or
>>> (b) STE.PRIVCFG is 0b10).
>> I think I don't need to as I don't support this feature at the moment:
>> spec says:
>> "When SMMU_IDR1.ATTR_PERMS_OVR=0, this field is RES0 and the incoming
>> PRIV attribute is used."
>> But to be honest I was not aware this existed ;()
> 
> I think you still need to check the incoming transaction
> for user vs priv, even if you don't support STE.PRIVCFG.

On the CPU side, you have MemTxAttrs as input from get_phys_addr_lpae().

On IOMMU side, the current input callback for translation is

static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr
addr, IOMMUAccessFlags flag)

where IOMMUAccessFlags just is R/W access flag.

So I am not sure I have acess to those user/priv attributes.
> 
>>>> +
>>>> +#define PTE_AP_TO_PERM(ap) \
>>>> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>>>
>>> Similarly here.
>> ?
> 
> Can't just ignore AP bit 1 (or 0, if you're counting it that way).

with AP, the LSB is associated to EL0 rights. Similarly, given the
translation callback in use, is it something relevant as of now?

with APTable, the LSB bit is associated to EL0 as well
APTable[1] = 1, access at EL0 not permitted

In my case, can't I consider all accesses are priviledged?

Thanks

Eric
> 
> 
> thanks
> -- PMM
> 
