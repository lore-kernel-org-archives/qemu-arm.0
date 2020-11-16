Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3716409lfb;
        Mon, 16 Nov 2020 05:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMfWodnIDxnpNbsa+l0Gz5KSWmblTfwXJb6Jk1ql8HWDy1uJqiFQus78FqM1FuSDSErqkB
X-Received: by 2002:a67:f2c3:: with SMTP id a3mr2325252vsn.57.1605534309801;
        Mon, 16 Nov 2020 05:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605534309; cv=none;
        d=google.com; s=arc-20160816;
        b=uuR7PFwUVKRgL7nYqFkInsM1JsSTH9Jwc5I5ZY6SG7m5KEkDM2D+rXwnTLwhljdbMk
         oBvZeMHSniKmzxGz8O11IpKEX0DWdFRuQ8aQRY1RB2+Svi27XNkMPs1NVFRGw5DnuViV
         U9JH6OuUP4SP/gB+8c4lhBJGjRwwYf8O965wPYM52x5gZsjBVqzF8lN6traQAcwRt36e
         Zitsx9X2zYRClHC1Qiaiza/9jPH9ePzHuVOXrye0eKG3BIfAm6vKfZ0cqhO1Vcn5xRj+
         mnqP3sA/G+fY9KX1vj+UBhSH/4a1thjQ0FoJpdeBqNjURCtfbIWNXhUSZ+OmyBvHSYV+
         NEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:from:references:in-reply-to:subject:to
         :dkim-signature;
        bh=Lverj1xUIond2tO7njcqRpVOFBxkhCoEJ+h8zwPEMEI=;
        b=VyT7uhDoLU14tag8cfwMWg1bURsi4zpBF4mohF776zAAx7OxZhqG2lIC9FrXFjmXSy
         69goJFnEbMjarqTawGe28Osq3zNX+YZF451r+Vj1KEdzTjMtkUP2sJ7u223UnMKQoKmO
         ybXMQC7yedsVSO+eM6q/KoKAU328Nk2PtulErkk6CRv57gzqMOMHG4rSiuAd+MA4fI9O
         wxFRn7tlRzHsAk96/Xi3yK9V9EYSsXuLJtbJonlzu0Gs9LytTw1SCeW4EL1RtMeX4UPG
         1vduer1p9Atg2blfDGO2jJKV4ThwJ4oAsyFb4LqX+ayOsSDrPdX7wuQV1Gc+bnesp9Vu
         9zCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@dme-org.20150623.gappssmtp.com header.s=20150623 header.b=JE4igB3i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si1887645vsn.139.2020.11.16.05.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 05:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dme-org.20150623.gappssmtp.com header.s=20150623 header.b=JE4igB3i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keeof-0005qI-3T
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 08:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1keemz-0004fQ-SQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:43:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1keemy-0005kJ-0V
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:43:25 -0500
Received: by mail-wr1-x441.google.com with SMTP id 23so18710146wrc.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Lverj1xUIond2tO7njcqRpVOFBxkhCoEJ+h8zwPEMEI=;
 b=JE4igB3ijKyXSMAE2p/RZMBZ0kT1ym5BOUliQpKEhDr8NWyAjZMwEI824UfvZyD7fs
 dMiC9C6ssdRZ93VX4MA55ImH/21LiLIAWEo9I5LMc+dyvsneD9Zl9+UTIIxdCa41UYnZ
 jrihQSnWm/op0xs7tYC0xZSLIOdBsAPGQXv79lx3pqr2ONw0GrP96vetvuzwMdq0aB8n
 24JtEvHL++gstOXNoAzZ72K5uvvarOEdRdxRpWp386kD0qPefvyXnjhiz8WSYx8sM+s3
 bXj75kDWQc7gvV7BE322qX6CWHlTcAI4zhOTgBgeinn00e+G7IGQpCsZP5u2rZPmRowo
 Omcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Lverj1xUIond2tO7njcqRpVOFBxkhCoEJ+h8zwPEMEI=;
 b=l+pFkNVLVNPxhK70FU44zKyApE+fvkankyVj0iIlFBx8x55hBenhNP/hYD4Bu8k+rA
 J/z6MVku1I0BKrJo9Y2a5gNSV3U73C7ssQOnZDS/oVVWXWxbRdapVyOcR790rC3mHcFP
 xgT/3fFYwgGY+I1kkhPgiZ0HFjiata7WLLXsQtWd/A8iPnF8XYQCj46U8rakjeANHSmj
 saW3CikeRJ1Q0X76xnPXi2TKqRtCFbQuwVSE+dzLYIq3Vi7JnRiyhShHlQ/xX3upbkX6
 uOTvInGmYlEnw8qNnMTP2khQXvR/Yw8b3Ak4yxLVurcr+viy8++8uQcCMYjQhFPdTFP8
 Ygog==
X-Gm-Message-State: AOAM530vvXfg0z+2FVY2hT4fp9IqPhrelshYSskspx7VDNDUFaaCWAeY
 JAuzcTC1lrX/5ej7BdMhamKq9A==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr19259795wrt.312.1605534200590; 
 Mon, 16 Nov 2020 05:43:20 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id v67sm20695550wma.17.2020.11.16.05.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:43:19 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4a67b6e6;
 Mon, 16 Nov 2020 13:43:18 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
In-Reply-To: <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 16 Nov 2020 13:43:18 +0000
Message-ID: <cuna6vhju2x.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::441;
 envelope-from=dme@dme.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: md20cY1Jx+Jf

On Monday, 2020-11-16 at 12:39:46 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Hi David,
>
> On 11/16/20 11:42 AM, David Edmondson wrote:
>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>> images for code and variables respectively. These images are both then
>> padded out to 64MB before being loaded by QEMU.
>>=20
>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>> read them, and then proceeds to read all 128MB from disk (dirtying the
>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>> padding.
>
> 2 years ago I commented the same problem, and suggested to access the
> underlying storage by "block", as this is a "block storage".
>
> Back then the response was "do not try to fix something that works".
> This is why we choose the big hammer "do not accept image size not
> matching device size" way.
>
> While your series seems to help, it only postpone the same
> implementation problem. If what you want is use the least memory
> required, I still believe accessing the device by block is the
> best approach.

I agree that would reduce the size further, but it feels like it may be
a case of diminishing returns.

Currently the consumption for a single guest is 128MB. This change will
bring it down under 3MB, with the block approach perhaps reducing that
to zero (there will be some buffer block usage presumably, and perhaps a
small cache would make sense, so it won't really be zero).

Scaling that up for 100 guests, we're going from 12.5GB now down to
under 300MB with the changes, and again something around zero with the
block based approach.

I guess that it would mean that the machine model wouldn't have to
change, as we could return zeros for reads outside the underlying device
extent. This seems like the most interesting part - are there likely to
be any consequential *benefits* from reducing the amount of guest
address space consumed by the flash regions?

> Regards,
>
> Phil.
>
>>=20
>> On a machine with 100 VMs this wastes over 12GB of memory.
>>=20
>> This set of patches aims to reclaim the wasted memory by allowing QEMU
>> to respect the size of the flash images and allocate only the
>> necessary memory. This will, of course, require that the flash build
>> process be modified to avoid padding the images to 64MB.
>>=20
>> Because existing machine types expect the full 128MB reserved for
>> flash to be occupied, do so for machine types older than virt-5.2. The
>> changes are beneficial even in this case, because while the full 128MB
>> of memory is allocated, only that required to actually load the flash
>> images from disk is touched.
>>=20
>> David Edmondson (5):
>>   hw/block: blk_check_size_and_read_all should report backend name
>>   hw/block: Flash images can be smaller than the device
>>   hw/arm: Convert assertions about flash image size to error_report
>>   hw/arm: Flash image mapping follows image size
>>   hw/arm: Only minimise flash size on older machines
>>=20
>>  hw/arm/trace-events      |  2 +
>>  hw/arm/virt-acpi-build.c | 30 ++++++++------
>>  hw/arm/virt.c            | 86 +++++++++++++++++++++++++++++-----------
>>  hw/block/block.c         | 26 ++++++------
>>  include/hw/arm/virt.h    |  2 +
>>  5 files changed, 97 insertions(+), 49 deletions(-)
>>=20

dme.
--=20
Please forgive me if I act a little strange, for I know not what I do.
