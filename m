Received: by 10.28.91.67 with SMTP id p64csp3818612wmb;
        Tue, 6 Mar 2018 06:51:38 -0800 (PST)
X-Google-Smtp-Source: AG47ELugrzOxvhzopUvKBmBtGr43HpQaZCbZxBRO7g4exnWQD6+6aGsPM6tdEjrgoNkFIL0k7ZbH
X-Received: by 10.129.98.215 with SMTP id w206mr11809072ywb.172.1520347898489;
        Tue, 06 Mar 2018 06:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520347898; cv=none;
        d=google.com; s=arc-20160816;
        b=lhUkLCtNiBDBdVkQ66KqWsE3KvGty/cOqAVhoqZeinXfpII3wF2klHDoxx5ba6R/Xe
         Bv44g+R4ax4aWHN+dVhHijXR9HW6f/wE7JJwsqwTOGThF5YCxAFKXaWDyO0ENEhCXM72
         va3G5sJRtZbXNp5BalyeDXxqvOaZAQeZE5OAl1NEfqOeCRnScUqxctMAJBMfK6dfqpnW
         /JkaADFvb1o5FrT/jbYqI834OuqImTyQ7EOzagbzVMNdGdOomLmbWLTwsM4pFd989luO
         uUXTx4M1qjno8p+XSfM/1GtI6bSEAf4VWxoHMKk6zb/bmYztl8cB65flxLih2uPN2ySx
         TXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YmUUZIBcAODkJP85C41ftuL7hYQkYgZIEdLIIL+YglU=;
        b=pEEYC/X8gid/T4QzHKz+bRnASa9Zh9YTS4NQOce9jY7gyDLQfBYpNsZGOBxuW/lYyV
         06inIKsmDuVXvvCZnQCrdCDAC4tnO5yY2EpmlzQanwv3DFMRREYXPyydnh3/wne6uNkJ
         FqbB9Tx0jdosYH/DB9a8MQEitMRmC59JzektKjGzfRPvceFQmoRTiNxkK5wuwYTwmdhW
         YBA9fnXMpips6pxI8KeAOAw1eJszZlza5XvRl+OELCFaer+x8yrnGMp9NvIKypjLkhfw
         qhZU/XBIzyv3Btz9RKrD4GWBo6+qxkyx1qMoHa/J81NQ8i2YmvlwkQFioRMp5hEFYmgW
         Z5iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NetTDOWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si2660483ywk.438.2018.03.06.06.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 06:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NetTDOWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etDwH-0003Sr-Tu
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 09:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etDul-0002He-2m
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:50:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etDuk-0000zl-AS
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:50:03 -0500
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:37785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etDuk-0000zR-4c
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:50:02 -0500
Received: by mail-oi0-x230.google.com with SMTP id f186so15000915oig.4
	for <qemu-arm@nongnu.org>; Tue, 06 Mar 2018 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YmUUZIBcAODkJP85C41ftuL7hYQkYgZIEdLIIL+YglU=;
	b=NetTDOWu5r0k4mRuAmxm1TgFEwtOk1g8rS4cVpQAY2EFweQykjHwjXFfAwM2ZuHwOP
	3sEmfqQdii35VG9nvHSrSoLEdS7DC1oX56hdqX0xM+Q1HAIZDOY5OPC84pa3hKXNN8M3
	7g09TQx6cfN/7H0OWgd/h66mtQ/+gHCj4r+Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YmUUZIBcAODkJP85C41ftuL7hYQkYgZIEdLIIL+YglU=;
	b=TNWl6iHB/aAE/dJ3kqUI+jT4KMxRsIOvZbCH3XbFSxCUub0Xs2IeJtX5VZ8yStU5Mj
	11bpSLEU0QqnzC+Y1gy3Ovr/ZTFzXg4x7HKjmpiRYh2avB9NVVX6Jjh0aKETuRVN/Nbt
	rmvD4YsQZfzIi39rxvFrtNnKFZ9GK1Qtk0tm66BB0rVUD2xCgSBDx49RbHafEJEtYKz+
	kbHP7SsZrqKNOQ91AQ6q/kPksbFteLxrFXK9HXPZt6szHmuZ155ynJMC+SYEbN4z5w4O
	aGSOz4b9c6PEF4v26VEJDJ5eRYfBXXDgZqnqTQaRO9Z6SzCQXjVmGYHffaSaIULfZUUj
	8Cew==
X-Gm-Message-State: AElRT7EvlzejXUzclKM170pQyI6dMjEOzo1JQkGnzAPqKPaJ9BzdyyiO
	pQ23Tn84lakWOM01wszOQfbWYyfyJwORoz6wMNiFYQ==
X-Received: by 10.202.216.67 with SMTP id p64mr11416396oig.337.1520347801347; 
	Tue, 06 Mar 2018 06:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 06:49:40 -0800 (PST)
In-Reply-To: <e54bcea4-3b04-7409-89c1-b2a79010c969@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-uMZwR8HfVDx0Rau9G2unMypWJEL0o3ACPHxCqZ+g=_Q@mail.gmail.com>
	<e54bcea4-3b04-7409-89c1-b2a79010c969@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 14:49:40 +0000
Message-ID: <CAFEAcA_mtH-=tKzJP=iFeABK+_4Lp6rapnXdJKT9OCxLqyLQgA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 02/14] hw/arm/smmu-common:
 IOMMU memory region and address space setup
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
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cm5v08ETlR3x

On 6 March 2018 at 14:47, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/03/18 15:08, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> +    if (!smmu_pci_bus) {
>>> +        GHashTableIter iter;
>>> +
>>> +        g_hash_table_iter_init(&iter, s->smmu_as_by_busptr);
>>> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
>>> +            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
>>> +                s->smmu_as_by_bus_num[bus_num] = smmu_pci_bus;
>>> +                return smmu_pci_bus;
>>> +            }
>>> +        }
>>
>> Why do we populate this hashtable lazily rather than when we
>> put the SMMUPciBus in the smmu_as_by_busptr table? Do we
>> expect this function not to ordinarily be called?
>
> This function only is used when handling invalidations (vhost/vfio). I
> can even remove it from this series at this stage and re-introduce
> latter on. From the SID, you retrieve bus_num, retrieve the SMMUPciBus.
> Andd from the function number you can then retrieve the IOMMU mr at
> smmu_bus->pbdev[devfn]
>
> That's the purpose of ths function. But I will remove it.

No, it's fine here. You should just have a comment about why
it makes sense to lazily populate the hashtable (it's overall
going to be slower than if we populated it up front), to
document the rationale for the design decision.

thanks
-- PMM
