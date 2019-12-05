Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1737135lff;
        Thu, 5 Dec 2019 00:44:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzD7K67WcNbLlhV84kZ7hmBIOGzGp1Xn6uNS8dxVse+u/xfcbyTKOsvUnW8KLfpoNm6l+a3
X-Received: by 2002:a0c:ee91:: with SMTP id u17mr6253931qvr.245.1575535442396;
        Thu, 05 Dec 2019 00:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575535442; cv=none;
        d=google.com; s=arc-20160816;
        b=LkdcFhuoPVyH9ug6SsoidwLjphP26uKgmjpy0H05xZ0YjMCDRumrqn44ui5KP33rJT
         Cd2YMrqzF4ZMSmWPsVXXSFg3EpPnnFd0vdCVNUP5fATAHkn6g9itHfAvyNqMTZQ0mM2R
         mvbd4P2lgnyLpopBI30g38nDh5c5K7gb3KB3t64jJSoVeBFfP5EIe6lL7FuGi/xnPIcG
         htE/YrKKGQPu6qfff8y8fMjrRLmSP2SUb6dr6GhRK/Bdxy+EqV9Uw6U7l7X1HMHVEw3G
         X7dG76P4ii46PrYgKdq3bpI+f37z/KDnubWRykswgrtmbGHlvjdZkfRetGGqlHCVhv6I
         mYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jgdqmmKVdMbSsk9weGSCSEzICTE6qo/wwWVP4u9Ohaw=;
        b=a/lIQi11LP6Tex0qu3ycdPQaysZs9hvj4nesID+iHhqEBHyqynT2FTguWDTBsO8A0Y
         Z9+5EbVNvOPr3V1UZef1p2J8Xz6IDCLERFxaGUPA1GEGNJCejwqT+8UQursYrn06D9E6
         tUTd+7FElJKpIrHBvk79zBU0uVXcy4hEXUG49QLg7AyYj46YSu2lQxAHFowxAqglRWDI
         DvhxtkMNuattNUSoEXfVSrrcoS+c6Ee/5HC7L3aO2oJDN0JaVAryAfE5lTNk/OQicJUB
         8/G9RQx21mgv0600E/UEK+I+ibQAZvZH7U04nPtbGgb6l2Qq9rFB68odE7FmulqjJhDw
         Lyvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLQBmsZ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k93si6177753qtd.90.2019.12.05.00.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 00:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLQBmsZ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icmjx-00022Z-OM
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 03:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1icmiq-0001VM-Ev
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1icmip-0006Kt-Ai
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:42:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1icmip-0006Ia-3c
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575535370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgdqmmKVdMbSsk9weGSCSEzICTE6qo/wwWVP4u9Ohaw=;
 b=XLQBmsZ8yFMhrUmDywAz4VHgvp6ruGzMq1lebBhohnPYmxiIm3AU8QbXufE+4dx2ovCUR6
 tbkestuaZT2eSfWGVs/lv5bvFaq7ao5yNA4QTJRpmN2xmtSly4xhB20hoEDVG3jGA+e9U6
 87A/LaoNgS9Iuh5TMBAQqpwVRvXQsvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-sWwO2_LGMDWnLSVuuO7Q0A-1; Thu, 05 Dec 2019 03:42:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31C4C800C7D;
 Thu,  5 Dec 2019 08:42:48 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 407275D6A5;
 Thu,  5 Dec 2019 08:42:46 +0000 (UTC)
Subject: Re: [PATCH 1/5] hw/arm/smmuv3: Apply address mask to linear strtab
 base address
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
 <1575467748-28898-2-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0f01a30e-5b27-f97c-903a-a8a2a74a1cdd@redhat.com>
Date: Thu, 5 Dec 2019 09:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1575467748-28898-2-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sWwO2_LGMDWnLSVuuO7Q0A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JOrNr/ueFghB

Hi Simon,

On 12/4/19 2:55 PM, Simon Veith wrote:
> In the SMMU_STRTAB_BASE register, the stream table base address only
> occupies bits [51:6]. Other bits, such as RA (bit [62]), must be masked
> out to obtain the base address.
> 
> The branch for 2-level stream tables correctly applies this mask by way
> of SMMU_BASE_ADDR_MASK, but the one for linear stream tables does not.
> 
> Apply the missing mask in that case as well so that the correct stream
> base address is used by guests which configure a linear stream table.
> 
> Linux guests are unaffected by this change because they choose a 2-level
> stream table layout for the QEMU SMMUv3, based on the size of its stream
> ID space.
> 
> ref. ARM IHI 0070C, section 6.3.23.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e2fbb83..eef9a18 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -429,7 +429,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>          }
>          addr = l2ptr + l2_ste_offset * sizeof(*ste);
>      } else {
> -        addr = s->strtab_base + sid * sizeof(*ste);
> +        addr = (s->strtab_base & SMMU_BASE_ADDR_MASK) + sid * sizeof(*ste);
Not related to this patch but I noticed SMMU_BASE_ADDR_MASK should be
0xffffffffffc0 and not 0xffffffffffe0. I can fix it separately or if you
respin, you may fix it as well?
>      }
>  
>      if (smmu_get_ste(s, addr, ste, event)) {
> 
Besides
Acked-by: Eric Auger <eric.auger@redhat.com>


Thanks

Eric

