Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5233206lff;
        Tue, 14 Jan 2020 00:48:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVx1EBgrWQVhAlN1g8EOx22vl5zNhiQtzH2WjdIkIXA+osHy6OmE4q4B//FxO+GLzkveY3
X-Received: by 2002:a37:ea09:: with SMTP id t9mr20485504qkj.151.1578991726417;
        Tue, 14 Jan 2020 00:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578991726; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw6haF/NodxHYFW+CPchGQ8Y+EQJfLTcZB+sOfLrDx4enFJQY3mjd8rV5PUbDGytLJ
         zc+O04KzamOU2ZqyKDkvsKXs8H2EHYGjpgllXYKgOUMM3kPndDDpsBUYEhd4X6MZh8WC
         Brc2tVANDXHt54/Z+LVI82Us3KMP/8sAJZXeHKXczYCAejLXO1JEZxPHDcR4ukTQik+t
         XIPWNXte2ccw/0ggyMsScklTPI8iREOhOai7EjcGXoct/VtqzP7GDs4EInpKb+a9UMR/
         BIUTsyEM5MWZN7UyOmv5xFk+EYV99QyNtpVcDvERmGynpS0sgU3XMXPvhObeZrnsMBSZ
         wuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Xebxu3XvDhe0sUPwQUHc0rBV9/6bWbH4tEvUxnUtBlc=;
        b=z7kkD4UnAzTix1kdgvm+IGk58saWr0ZJJhQR2hFjKPkUj7+rIsvBs5ORvAtSl1goN7
         amp+5NQ0o6uK09/Fjy0Xu/cXR7FibJYtGEsBb0e8pEH8vj2KfTFylRDs4epSmnpK/90R
         9MaNT6jvwJYugfYF8lNvXStcQbRj/sp+CKClQcfV2Ap67ejbdJHjS1+XqcYC1NrB5tdA
         hVw4QPoG22ixVUyvYqTNy7ggCHtx1HXh6+XOy+CXmotCliUr0D/9Mr2uwWeBoYJwRgab
         sjxzrkam7wbE1mkGtB5dnkeTVantrePMjUNgjZpyhzxE4oGjHrAZ0XVqqpp/b8Ccoc0l
         8v3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BpZJa9qQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si7699989qkj.16.2020.01.14.00.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BpZJa9qQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irHsT-0005xS-IA
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 03:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1irHsK-0005ws-7N
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1irHsJ-0003ze-4p
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:48:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1irHsJ-0003zY-0t
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578991714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xebxu3XvDhe0sUPwQUHc0rBV9/6bWbH4tEvUxnUtBlc=;
 b=BpZJa9qQVqWXMtfVX7TYs7ftgLKQCIppWxcNkH96IuRmwQwVrTRi4USTPD8paeVPlpeWLn
 FbvgNZqlP5lvrCSWhp4th8nndB2BLyC4FjUYP5TG7WxAzIE48X7TTUgCkgFlrq7PebtF47
 CG0x2uWud9CUF3fvuROMPDiO0HtyTCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-IVALv5cWOkS9MM6DZ0N--A-1; Tue, 14 Jan 2020 03:48:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6703D184C734;
 Tue, 14 Jan 2020 08:48:29 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8796C675AF;
 Tue, 14 Jan 2020 08:48:21 +0000 (UTC)
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
 <20200113200649.GC201624@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <638a595a-ff82-54f2-bc48-5750da3d38f8@redhat.com>
Date: Tue, 14 Jan 2020 09:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200113200649.GC201624@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: IVALv5cWOkS9MM6DZ0N--A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wnkx/BfccYwT

Hi Peter,

On 1/13/20 9:06 PM, Peter Xu wrote:
> On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
>> +/**
>> + * The bus number is used for lookup when SID based operations occur.
>> + * In that case we lazily populate the IOMMUPciBus array from the bus hash
>> + * table. At the time the IOMMUPciBus is created (iommu_find_add_as), the bus
>> + * numbers may not be always initialized yet.
>> + */
>> +static IOMMUPciBus *iommu_find_iommu_pcibus(VirtIOIOMMU *s, uint8_t bus_num)
>> +{
>> +    IOMMUPciBus *iommu_pci_bus = s->iommu_pcibus_by_bus_num[bus_num];
>> +
>> +    if (!iommu_pci_bus) {
>> +        GHashTableIter iter;
>> +
>> +        g_hash_table_iter_init(&iter, s->as_by_busptr);
>> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&iommu_pci_bus)) {
>> +            if (pci_bus_num(iommu_pci_bus->bus) == bus_num) {
>> +                s->iommu_pcibus_by_bus_num[bus_num] = iommu_pci_bus;
>> +                return iommu_pci_bus;
>> +            }
>> +        }
> 
> Btw, we may need to:
> 
>            return NULL;
Yes. By the way Yi's patch "intel_iommu: a fix to
vtd_find_as_from_bus_num()" also applies to SMMU code. I will send a patch.

Thanks

Eric
> 
> here.
> 
>> +    }
>> +    return iommu_pci_bus;
>> +}
> 

