Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2807097njb;
        Fri, 16 May 2025 13:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZ8Ls3zkAMSiGgnfRRkqzcgEScae3MjJzjGZQAZHse1UZ9IM6nkc0EpH03dwgL6/mCOkaZRUwgYXnaWA==@linaro.org
X-Google-Smtp-Source: AGHT+IEAJM3R7XVhOc5y2Su7Az6I06empfniFWNOgwbjbanS5HMhbjM6pEd1uvpMTI0qb8FC5P5L
X-Received: by 2002:a05:620a:3199:b0:7ca:f03a:4855 with SMTP id af79cd13be357-7cd46718a31mr525940285a.11.1747428848363;
        Fri, 16 May 2025 13:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747428848; cv=none;
        d=google.com; s=arc-20240605;
        b=F6xPuKmCtnP1Gno2J2pta6TyW+eUYRRnxuVE6y0oj4x0XzAA4RTcbcQDpfqv3Tk/j2
         hqq2hP8Qs2x42ZrX4Jia1vPRa3EtOxg75qyo8gKDOE5XNn3A01zkPexaco4kDMztxJwL
         15peU4Qx71+FW2xuqjwGUbQA0eMVNTEAU6U79n/Oui0WOV+x3O0+9mgRY3veCwMhsqUL
         Sh2sLPmpiZEnzz118A1gOpEEZrci6WOvR99rq5rj4seBme3ALgAF6gB4AoPy4GsACY6L
         MzjpNL25sUZcrn9Vg7O40zJ21dJKKEslKMARElQdumv/R5rtHfUteh9KpqOav+zTau/g
         rK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pnURT22OIYnC5gJKVtsNGXOoWVpAeYrD0y8GllRNCk0=;
        fh=6nfGxVyNiasIk13FqYvWbtlTc8MLu8W3xBR3oo7OVyw=;
        b=lV57wMKiIUky7Lx3G1qtmBZlEw1XasDkcIw4d0DkVMqLcOE9yhNWbE2ogwKl/8G8M1
         inx1AICG6Fnb61TMSLl066tt2A6J3MmOX/fHPjvUbAOhOflIt2RTPFhDkql52vJysJXG
         K5+XH5w1Xa1FDJIv0nOSYOyc5Vr69pe3nyi+D0+39U5Y4nlspgI7sYfNVQqH//M39NKt
         jbXBE0E4YJ2tih2snTOlYYsUbb989r6R59amRonV0anbjPodqw4prYytbIFl5y99owKx
         ePFk3Pe4x8GJ7+J3ZwknUKGAaY/IBFPMDM65FJMYCnbrprVHGFd+/Lcu2CalaV3CdIYA
         uuLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnGQZseR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f32cdsi277178185a.640.2025.05.16.13.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 May 2025 13:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnGQZseR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uG246-0001Dh-Sy; Fri, 16 May 2025 16:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uG245-0001DM-Q6
 for qemu-arm@nongnu.org; Fri, 16 May 2025 16:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uG244-0005Kg-86
 for qemu-arm@nongnu.org; Fri, 16 May 2025 16:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747428834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnURT22OIYnC5gJKVtsNGXOoWVpAeYrD0y8GllRNCk0=;
 b=DnGQZseRw3rx4q8eC/h0B1GlGTB+8IA0LyKQGhCsulkWHbbmkVHw8zHzDEmANBLtjViHtv
 aZhgptAjSarL8W+grwWIrRwI/lpE4BEUvA+yJNTmfixPomvvvBED12YuDMh4WJU3YlFWVe
 woDzkkQErylLfJrUmNPY75nY/9INtp0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-tDPvBPDBNyiZNngnMmKErg-1; Fri, 16 May 2025 16:53:53 -0400
X-MC-Unique: tDPvBPDBNyiZNngnMmKErg-1
X-Mimecast-MFC-AGG-ID: tDPvBPDBNyiZNngnMmKErg_1747428832
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-231e3cfc144so8813005ad.2
 for <qemu-arm@nongnu.org>; Fri, 16 May 2025 13:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747428832; x=1748033632;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pnURT22OIYnC5gJKVtsNGXOoWVpAeYrD0y8GllRNCk0=;
 b=p7RY29cZRpy55vGnE17T49RoDNCzit9tv5TMwgo2B69poVY+B/cvxOSVIByaelbtd2
 8SPoVBOMHA6p/3d8664mzWTqt02QUaZ4YYojSG2uUVwx2EDSAJ2f8V2BWi3bDW8AcoFB
 m5ZhxgX6S0eqQL4ZgpC86bsfK4qCgVkEhw4VoDz6Iz9YTUw6WJA1cmFzlhDSNlf0dwx/
 DJ4HwvEwtiISHa/JQ5KBIiIlHglxPwNkhrXQ8eSgBmi4GHXMaQCCcKKk32D9rMXkYlti
 CnlkTTCMLNn867CJ1n5041m47dLSFTkCPpv7I3WSVy2LAVFOaREVJZ27+av13mySptJv
 4KPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT+sDKWTpS33CNCa9Yc1a/ykqPikGIpeH/oEVn6PcCYIE5NEmrpVs0ibLVtQFkhbGc5j09JD8Axw==@nongnu.org
X-Gm-Message-State: AOJu0YwP7+Eb52bFx/tUnc5jXdOPSX+fVD6iW525ztuUaE2QiYEPAbwC
 dIzlAcvYFJq0yfIEko+BMNxu6Rgmze4N41/wQZcwKGCxR0z+QD329XHD6CxhTYMYBRnSDyjMMiP
 H0+SNB3oH0BAtZBBb+VwkxShaPsgFmEQ9W+mX/mlqzzJMkEN/zwAJug==
X-Gm-Gg: ASbGnctzY9TjgcwR4jrEVzkkwbNwzBTNlHTGeNVJyG/BSdPWe5wmjW+mC5Pyh3LGfUu
 EjZteZwnmBlIu90snIaGkXUwK0mWd9tYZhURdRlcW9wsyPq+SIjYaN6ekuTR9IN5VPTxPhXmvPN
 ass21E5vB5b+uMehesN/UKWXoXtlSmwcdU+RDGFXPynzotieZdTMuW6oDnl+WlG+XDbYB+ciFv5
 7u9P+fwyxmS2WeXEA7s+fCIj4NrHPizeva8Xa2vplrzFvxQ6ulz4zNlZosJAIQhFVjKBU2FrnVl
 eTxgecFDjrFQ
X-Received: by 2002:a17:903:2f4d:b0:22e:8183:1fae with SMTP id
 d9443c01a7336-231d4598d1dmr68338675ad.41.1747428832051; 
 Fri, 16 May 2025 13:53:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f4d:b0:22e:8183:1fae with SMTP id
 d9443c01a7336-231d4598d1dmr68338435ad.41.1747428831680; 
 Fri, 16 May 2025 13:53:51 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e981desm18520125ad.124.2025.05.16.13.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 13:53:51 -0700 (PDT)
Message-ID: <961b0a65-cadd-41a6-b754-9028dc1be4f6@redhat.com>
Date: Fri, 16 May 2025 16:53:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org> <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
 <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
 <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G84DezjKq_LBhztL3290lTakH63T8onOEsjv7dk8mHQ_1747428832
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZERfQsosq9BY



On 5/8/25 9:57 AM, Peter Maydell wrote:
> On Thu, 8 May 2025 at 14:46, Donald Dutile <ddutile@redhat.com> wrote:
> 
>> I would refer to the ARM SMMU spec, Figure 2.3 in the G.a version, where
>> it's slightly different; more like:
>>
>>    +------------------+
>>    |   PCIe Devices   | (one device, unless a PCIe switch is btwn the RC & 'Devices';
>>    +------------------+   or, see more typical expansion below)
>>              |
>>       +-------------+
>>       |  PCIe RC A  |
>>       +-------------+
>>              |
>>       +------v---+    +-----------------------------------+
>>       | SMMUv3.A |    | Wide assortment of other platform |
>>       | (IOMMU)  |    |   devices not using SMMU          |
>>       +----+-----+    +-----------------------------------+
>>            |                      |   |   |
>>     +------+----------------------+---+---+-+
>>     |         System Interconnect           |
>>     +---------------------------------------+
>>                                  |
>>     +-------+--------+     +-----+-------------+
>>     |   System RAM   |<--->| CPU (NUMA socket) |
>>     +----------------+     +-------------------+
>>
>> In fact, the PCIe can be quite complex with PCIe bridges, and multiple Root Ports (RP's),
>> and multiple SMMU's:
>>
>>       +--------------+   +--------------+   +--------------+
>>       | PCIe Device  |   | PCIe Device  |   | PCIe Device  |
>>       +--------------+   +--------------+   +--------------+
>>             |                  |                  |        <--- PCIe bus
>>        +----------+       +----------+      +----------+
>>        | PCIe RP  |       | PCIe RP  |      | PCIe RP  |  <- may be PCI Bridge, may not
>>        +----------+       +----------+      +----------+
>>            |                  |                  |
>>        +----------+       +----------+       +----------+
>>        |  SMMU    |       |  SMMU    |       |  SMMU    |
>>        +----------+       +----------+       +----------+
>>            |                  |                  |   <- may be a bus, may not(hidden from OS)
>>            +------------------+------------------+
>>                               |
>>               +--------------------------+
>>               |          PCI RC A        |
>>               +--------------------------+
>>
> 
> 
>> The final take away: the (QEMU) SMMU/IOMMU must be associated with a PCIe bus
>> OR, the format has to be something like:
>>     -device smmuv3, id=smmuv3.1
>>     -device <blah>, smmu=smmuv3.1
>> where the device <-> SMMU (or if extended to x86, iommu) associativity is set w/o bus associativity.
> 
> The problem here seems to me to be that in the hardware we're
> modelling the SMMU always exists, because it's in the SoC,
> but you're trying to arrange for it to be created on the
> command line, via -device.
> 
> We don't have any of these problems with the current 'virt'
> board code, because we have the board code create the iommu
> (if the user asks for it via the iommu machine property),
> and it can wire it up to the PCI root complex as needed.
> 
> thanks
> -- PMM
> 
Peter,
Hey!
Learning more about the use-of/focus/expectation of '-device', I see your point.
The issue is that there isn't just one SMMU in a system (as the diagram above illustrates), they have associativity to
(pcie) devices (possibly more accurately, a pcie-(sub) tree) (for the focus of this discussion; could be non-pcie devices),
and we need an option format to associate smmu to pcie(domain/subtree(RPs), devices), and that typically references
busses (pxbs?) &/or pcie devices (-device). ... or do we only need to add iommu associativity to devices,
  ie, the second option line above, -device <blah>, iommu=smmuv3.1 ... which should enable the right IORT(s) to be
made for multiple smmus/iommus.

- Don


