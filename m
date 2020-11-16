Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3625990lfb;
        Mon, 16 Nov 2020 03:40:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlTNRMtu89PvVLbkZTgSYxAFldTSesuIecJelJwCNmHXqzC2f/wRXOmX/bSw9FJHY+87VT
X-Received: by 2002:a25:2cd4:: with SMTP id s203mr17637646ybs.336.1605526815514;
        Mon, 16 Nov 2020 03:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605526815; cv=none;
        d=google.com; s=arc-20160816;
        b=Cu1lcNVoKAoU7T35kO7z18ABXvY1lyCPWKhGlgELl8zbCIPt0P7bzj74ArdSqUc2h5
         zXXAH+vE9Cq+xc4k3kRoGLpM36SqzW+zJZ6Zo5mMQ1XseXlK0YKSlZjHuWYln62NlDkD
         VyKeCtmJAMHdCdFLNJK0sp1u05eL4DwO1b5RjbtglDvlR7S27BkU0kc9OupUn98o9xm+
         TtoaXxIvesIRDBKQcE8PsuBj+oId2cLJxsUcvyfD5FhsFcPhTYPb1qBcHObiHIPODfZa
         pmmjQ2Yh+YyuLB1zYgiJJAMINVp6RfrNPHAO4FhIT9Ty97LUwiT77W+ky3IMLDLAKPSW
         bfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ECDe36RhlwpinFxGcPWSNTAEDPdrJhyMm6bgtlujNuA=;
        b=yyWRiPjF/eXrr4evStZDdZM77dNwOjo5Hnf5Mc9yWuVhndmIIuNV9ZYLFrvLdcP7Ye
         poA9vFnehvtjyzlrankHaiU/SzgN4to7Igq4dSAktVVePEkIA2O45cMexh5yhG6cyheD
         owjVgNYVLHjdHl//scVJCRbeClkPUPLLlOyCkwD2heMEg20rHHRvKLNwpMRXijIgVvu1
         f+uOkhWiYYihQnK2xm4ZO4s70P3nI/vkTsmA/D7u4R4DwwNAFPjS/L8DkvSuXtGHnpN7
         Q3Alb830r2GH1hv34VQikKn/EvhDT40AmqPM4e+VNpfZo/l+6rGpvp93+zyo+JQiILC7
         UD2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ExmQeGs/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si16917208ybn.362.2020.11.16.03.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 03:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ExmQeGs/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kecrm-00056m-TE
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 06:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecrT-000568-KB
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 06:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecrR-00044g-CZ
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 06:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605526792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECDe36RhlwpinFxGcPWSNTAEDPdrJhyMm6bgtlujNuA=;
 b=ExmQeGs/9SWkOW1hGdnQP8Y4CdLPZya7hVj9v+MMcVeTfDFNmgR93GB03T5KqfyefZoADl
 UmXHxLqEkuwRF7aVoazg87ZhnsFXgjtOijoVXwEm7w+zMu4uYeUwemBsBQRIm0ZQuXu9AC
 Sa91zW+zSGNHGAVRDIcfoqxN7bNLMME=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-DMbHrD-eNdCDv7rDwsBjtw-1; Mon, 16 Nov 2020 06:39:50 -0500
X-MC-Unique: DMbHrD-eNdCDv7rDwsBjtw-1
Received: by mail-wr1-f72.google.com with SMTP id r15so11055086wrn.15
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 03:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ECDe36RhlwpinFxGcPWSNTAEDPdrJhyMm6bgtlujNuA=;
 b=pEEgHZGAdNto4gJ045XWecfgWd/SZpYTQpPSpzNL8Bb7R7GgF/u9o5oPVLsr7lygoW
 pozkuEPnoB7bUB90ARHj1or1B0EWCaa27lNJ7V5XHVzjC3DBjt8VZ9db3opH5hQCiiiH
 7i8eUB+MNwrkC07VEb9b4RT/mUdZ2SVYUC0/vD75jl6pYydW3PnhgmcFs08ulgyFxCnL
 L71dKlvyLQg78HInHwI7pcuHGT3PmBK1Jt8n0H3HAM+LLcXwoXE49DNP6HQ6JRPOpYcW
 zQ9VO3ThCZkuIsHruWHqRXxN4Ah8SgRdgcSLS2It6ytgAcDxXRK7ryEAmXvNbwWrF03k
 Xxug==
X-Gm-Message-State: AOAM531C1LB0fTeeQcWbheIBdejPgl69f/vGnskG/XrnH+QoSY5cWLB6
 +KSDuR8Mj6aP2GqAVvpKCWvq40RVHSIJYlxfmjQNzBuAB+swrMORnQYaePqsNJHl7hN0GJ/ORDu
 Zz6RCpijCyLa3
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr20088724wrn.56.1605526789280; 
 Mon, 16 Nov 2020 03:39:49 -0800 (PST)
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr20088691wrn.56.1605526789023; 
 Mon, 16 Nov 2020 03:39:49 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 6sm16641350wrn.72.2020.11.16.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:39:48 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201116104216.439650-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
Date: Mon, 16 Nov 2020 12:39:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uOiuq7h9sa34

Hi David,

On 11/16/20 11:42 AM, David Edmondson wrote:
> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both then
> padded out to 64MB before being loaded by QEMU.
> 
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying the
> memory). Of this 128MB less than 3MB is useful - the rest is zero
> padding.

2 years ago I commented the same problem, and suggested to access the
underlying storage by "block", as this is a "block storage".

Back then the response was "do not try to fix something that works".
This is why we choose the big hammer "do not accept image size not
matching device size" way.

While your series seems to help, it only postpone the same
implementation problem. If what you want is use the least memory
required, I still believe accessing the device by block is the
best approach.

Regards,

Phil.

> 
> On a machine with 100 VMs this wastes over 12GB of memory.
> 
> This set of patches aims to reclaim the wasted memory by allowing QEMU
> to respect the size of the flash images and allocate only the
> necessary memory. This will, of course, require that the flash build
> process be modified to avoid padding the images to 64MB.
> 
> Because existing machine types expect the full 128MB reserved for
> flash to be occupied, do so for machine types older than virt-5.2. The
> changes are beneficial even in this case, because while the full 128MB
> of memory is allocated, only that required to actually load the flash
> images from disk is touched.
> 
> David Edmondson (5):
>   hw/block: blk_check_size_and_read_all should report backend name
>   hw/block: Flash images can be smaller than the device
>   hw/arm: Convert assertions about flash image size to error_report
>   hw/arm: Flash image mapping follows image size
>   hw/arm: Only minimise flash size on older machines
> 
>  hw/arm/trace-events      |  2 +
>  hw/arm/virt-acpi-build.c | 30 ++++++++------
>  hw/arm/virt.c            | 86 +++++++++++++++++++++++++++++-----------
>  hw/block/block.c         | 26 ++++++------
>  include/hw/arm/virt.h    |  2 +
>  5 files changed, 97 insertions(+), 49 deletions(-)
> 

