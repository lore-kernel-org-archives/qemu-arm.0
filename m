Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1841190wru;
        Thu, 4 Jul 2019 03:11:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLXeVIypm68QTKr1vy6rin3jW592g7uAnSWhpIjbtp2kykaePmSu38CTveXmuR9eiPD4Ej
X-Received: by 2002:aa7:c619:: with SMTP id h25mr4191156edq.295.1562235107662;
        Thu, 04 Jul 2019 03:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562235107; cv=none;
        d=google.com; s=arc-20160816;
        b=Mzr0IDP8cDIAoUiPQqf0F6A8KOl0/dBEtrSA/d7HeUHlRVNx4K2HSnMyufFyO/Y/yq
         wTesiYSo1KDb3QxHxOLyIkJImnxEpRUko+M+PJF0H85gV9b1v0S0395Ee7mIhVlpWYfH
         v3T1FgMSs23iJxU+AiaKdQO9NH80H/aRTdV3tzfvqTSxHGEd2pLqlgY3NP64GZ3mwqxA
         qIOMDhfdLo5EsUu4Om1A83vB9J6Hstlaz0ydGaaBTMWnIUB/J7Kn4NpVu0ZIIz1zsnKW
         tgugbakq/4ec7vIMNhJbqmtv8ihHduMgSMZefNE4P1X7S6JS2p1S2bzm3ntrg7RVnXqc
         NOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=T12ELBIQOvpU4zK2KzgxIGBuajSkwKNPgvhXDMhJJGw=;
        b=OBFLmRmN2QPrNqUbeW5a31MX/6PjbM6TZlAP1ayd3nWqywXp68y1yz6NOjPOGD1ZZc
         meeNaUXDJpwe+BL7mtEzdwSKHPslWIYvwbteQ4G1UG10r1bjouJHHKFndg2559ANqlkX
         aWzgKU/K3XSLsdJ/7h17Ypq3KEFvgJzyI80aBUW6MOtnUQjTa7/CZdJkIbv+3nydmuCD
         OEFzj/I543zFzMwA1nyiBDp3DksM0L7YvLL7AhXnlQsvuSlPmny7lQDRASqbM95TU0Zc
         bS5IsJ4sMC0d8pQbROenFLJskH7bd9AQxtL2Zx42XpYmkzig4UtJJH0AL+5kzp53PsrA
         iqMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kt5si3510425ejb.309.2019.07.04.03.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 03:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiyiQ-0007ry-P9
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 06:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiyi1-0007r2-R6
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiyhz-00048W-SD
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:11:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiyhw-00045e-0E
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:11:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id c6so5506629wml.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 03:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T12ELBIQOvpU4zK2KzgxIGBuajSkwKNPgvhXDMhJJGw=;
 b=LVz+ysos3O2s1zsiF3c1oCpFjCDRxEHTa35EDYlinugyDX8mAiV19w3uYfqMc6G81q
 M7jZbMdBc3JGoVxXSCNJEq0asTjnEJ3M50miEs/HvI7lopN5gMiNeGCiRVwjSBGdOQK7
 V1LvGz1wusxSvjIfHrjVVHESmvrbDsPpHevDaCeh1mxlVsoE3DMPU94EZqE7rYNJdvn8
 RxxD4aOycwkMtk722ps6wFPRspnsy0z50Yw468h7G5TteG18vc1vfrowCFhLQMnJ7JNd
 1q3GE5Wu2/de+rZDqVK/zohmw1OTClagp4UHVtmBiSubw6piq3YZw4izUcayNUM4lafL
 CNtA==
X-Gm-Message-State: APjAAAVfACnsxl/jakfO737BqhpK+3XH+YKGDwvITRt84/CPSgIPcwIv
 GmuLyS1tcFMG72xS4qI1NVRxzQ==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr11695069wmc.16.1562235073742; 
 Thu, 04 Jul 2019 03:11:13 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id o20sm10284070wrh.8.2019.07.04.03.11.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 03:11:13 -0700 (PDT)
To: P J P <ppandit@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20190703190615.31436-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <59f87427-3d1d-928b-ac87-0a0a4049c4f5@redhat.com>
Date: Thu, 4 Jul 2019 12:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190703190615.31436-1-ppandit@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add
 lqspi_write routine
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
Cc: Lei Sun <slei.casper@gmail.com>, qemu-arm@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VcvngSC1sahX

Cc'ing the Xilinx folks.

On 7/3/19 9:06 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> Define skeleton lqspi_write routine. Avoid NULL dereference.
> 
> Reported-by: Lei Sun <slei.casper@gmail.com>

I wish reporters give more information about their findings, that would
help understanding the fix is correct, or how we could find/fix other
places with similar issues...

Does this come from static analysis?
Guest fuzzing code? If Linux guest, this range should not be ioremapped.

Sometimes this I/O range are not visible from the CPU address space but
only the DMA.

Anyway, if this comes from new access from the kernel driver, then we
should probably implement more registers in QEMU.

> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/ssi/xilinx_spips.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8115bb6d46..0836b8977a 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1221,8 +1221,15 @@ lqspi_read(void *opaque, hwaddr addr, unsigned int size)
>      }
>  }
>  
> +static void
> +lqspi_write(void *opaque, hwaddr addr, uint64_t data, unsigned size)
> +{
> +    return;

My first reflex was to ask you to replace this line by this (or equivalent):

  qemu_log_mask(LOG_UNIMP,
                "%s Unexpected %u-bit access to 0x%"PRIx64
                " (value: 0x%"PRIx64"\n",
                __func__, size << 3, offset, data);

So we can track guest accesses to this range.

However, looking at the datasheet 'UG1085 (v1.0) November 24, 2015',
Chapter 22: Quad-SPI Controller, I understand this region is only
accessible by the CPU in READ mode, as an AXI slave.

So, if we model this, even logging LOG_GUEST_ERROR is incorrect, we
should trap some AXI bus access error.

So the proper fix might be:

> +}
> +
>  static const MemoryRegionOps lqspi_ops = {
>      .read = lqspi_read,
> +    .write = lqspi_write,

       .write_with_attrs = lqspi_write,

>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> 

With:

static MemTxResult lqspi_write(void *opaque, hwaddr offset,
                               uint64_t value, unsigned size,
                               MemTxAttrs attrs)
{
    return MEMTX_DECODE_ERROR;
}

So arm_extabort_type() could return a "AXI bus Decode error".

Peter/Edgar, what do you think?

Regards,

Phil.
