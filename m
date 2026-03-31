Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC02109B47B
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 15:06:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7afi-0007Ik-Et; Tue, 31 Mar 2026 11:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w7aff-0007IA-Te
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 11:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w7afd-0003B5-VH
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 11:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774969579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gryvpOsyuTGg3mo1MKJLcyqv19wF5b49hWrsT2skrY=;
 b=LyNJcaB7ckvwkuxDhWERz+aZ2EggbiFhf0y9spWPzBjuOtqsAiHvdUi6Z8dM1G4vIyyqHT
 lCWQb8SHgvHo6hLWjjaqxMv/LY9pp4l+PsVEtx6Qw3Joqt+kHMk4dXoc3pGQR6yvEGz2wB
 DSgZXbj/Amqu2xkJrLdFHnSZdeIWf1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-YC95ZTHVNbmNt5aE2XsgrQ-1; Tue, 31 Mar 2026 11:06:17 -0400
X-MC-Unique: YC95ZTHVNbmNt5aE2XsgrQ-1
X-Mimecast-MFC-AGG-ID: YC95ZTHVNbmNt5aE2XsgrQ_1774969576
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48535f4d5e1so62988835e9.0
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 08:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774969576; x=1775574376;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gryvpOsyuTGg3mo1MKJLcyqv19wF5b49hWrsT2skrY=;
 b=CEtLxkNSYloeJxUREmITrBOlNhzXFqgnpQev4pRLWukEgLhBm8nwrAv/det3Rt+oR1
 VqpevoLA2DqJ/D2Bee6pZ66iPtVwMSlkPVP3VW2AvpuX2yUk6e0mrPd41TbdVXhl4ZB9
 M5ZFQhqLO3yhuEkT0ixEuWsg2tN/8lbIoJkrHr7YMqMXP3/30vHLA+QEUwMxGd3vDFN6
 p5zcdmynI0sgdxAl04P22KuwVOOWkVNBNRTTCbbyj+lt9MxRZcIehfh+zQI5DXG+RBoB
 45gszTcNayCkm+t/RrEsP4NuZxJPCdV5/r6xcXg8jyXh8/xs3T6bepjDDnC56NUP2h8o
 +6Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrBZ/GfF19Alous4gZpmHrVDAfqD7C2J4Patv6dPF9b739YdktuXISVEvSGm1FaHlg+qtnpPa1Yg==@nongnu.org
X-Gm-Message-State: AOJu0Yyqi9zzkbbRtA64OzaQsX26QiBZdkEPNTY9si2bZfAPboOzzps6
 hdIf8xr9p8okBqmYy9L7QiVC/uyAlhQWgXHhJ2+XoIEy+QBJT0t2w0VrRIZN/T/KZi8/qk++ON9
 zFfcNCXEgTXD4PN1+0myG4swfvKbF/HdpgT0avwuX1mAdGEPAhOUYKg==
X-Gm-Gg: ATEYQzzNg29iEPzr2YgMXiFNcUr+q9uygTcw7H+HfecdSDHyAkBWOlvu8TTnV/LGn7r
 FvMI2Bi/sNJ4GqNWyhM3Af+kUfdYG98dfeXjkMoeCMXjqoJfaJACNlMu0870j4pUTIs7kcNrCAw
 0mWP39NDIm4IWPboYQQA2hq4xhj5aMzopO9qMuXsZNINylu1SSnF9QGoLo5EuKoF/YMxUClhhbN
 SeaAkj/S8kDWGBJ9eG7nmRYOqjal7G3jzqZtLaQ3IvicueM61C55h/QxjJK6psGSo4jMImajc0F
 lDnrq+h9TWFxWl4iMolQ1/LpIVBpi3KnZJvJfHw0inUiwSqFjzVsjZbwfsdRmvNKdZ9wmLHU3Pu
 URS+cL/ThpKh7CpYYTZWCptE66OWPN5BZdNeCiWuiiZltToAoJgxa/NCPGfiwiCIPRbLSWw==
X-Received: by 2002:a05:600c:6c8:b0:488:7ff5:2c67 with SMTP id
 5b1f17b1804b1-4887ff52e31mr18568725e9.12.1774969575999; 
 Tue, 31 Mar 2026 08:06:15 -0700 (PDT)
X-Received: by 2002:a05:600c:6c8:b0:488:7ff5:2c67 with SMTP id
 5b1f17b1804b1-4887ff52e31mr18568255e9.12.1774969575443; 
 Tue, 31 Mar 2026 08:06:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e7e9786sm40892595e9.3.2026.03.31.08.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 08:06:14 -0700 (PDT)
Message-ID: <5ccbdd38-e63f-4a4a-8d28-9621bf8883fe@redhat.com>
Date: Tue, 31 Mar 2026 17:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is called
 only once per bus
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, skolothumtho@nvidia.com,
 nathanc@nvidia.com
References: <20260323183024.4069032-1-eric.auger@redhat.com>
 <aco9ECUbZ1+QvbOR@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aco9ECUbZ1+QvbOR@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XUp7dVlGw6z2Bz2zun9l42-NaP_wFcT9cStNo0vz5RY_1774969576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/30/26 11:06 AM, Nicolin Chen wrote:
> On Mon, Mar 23, 2026 at 07:30:20PM +0100, Eric Auger wrote:
>> @@ -3307,11 +3307,16 @@ void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
>>   * IOMMU ops are returned, avoiding the use of the parent’s IOMMU when
>>   * it's not appropriate.
>>   */
>> -void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
>> -                             void *opaque)
>> +bool pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
>> +                             void *opaque, Error **errp)
>>  {
>> +    if (bus->iommu_per_bus) {
>> +        error_setg(errp, "An iommu is already attached to this bus");
>> +        return false;
>> +    }
>>      pci_setup_iommu(bus, ops, opaque);
>>      bus->iommu_per_bus = true;
>> +    return true;
> Do we need the same check in pci_setup_iommu()?

For machine wide IOMMU the check is handled in machine code (at least in
arm virt).

Nevertheless a more generic solution could be to check in
pci_setup_iommu() that bus->iommu_ops is not already set. If set, return
an error, cascaded up through pci_setup_iommu() and
pci_setup_iommu_per_bus().
However the change is much more invasive and impacts several archs. What
do you think?

I don't think this can be a valid use case to call pci_setup_iommu()
several times on the same bus?
>
> Apart from this question,
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks

Eric
>


