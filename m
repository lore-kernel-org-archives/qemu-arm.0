Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1276978lfb;
        Thu, 9 Sep 2021 02:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUKHTg5SFbJH0esRDkg5enDDqd/wz1fHsme8oakqNuDVniHUH4SqmeHUXriHHTveRsIAxX
X-Received: by 2002:a05:6402:524e:: with SMTP id t14mr2145349edd.39.1631179683802;
        Thu, 09 Sep 2021 02:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631179683; cv=none;
        d=google.com; s=arc-20160816;
        b=UWF2OUTDmuKhA08twLTl3kSmjeYZmpX7S8+IO9Gj/C9wpFFmpW9oym8mWQ4upC6CpC
         5hGoIJum3jgadRC0jgrLLAS1R7e/jsEGChGzmOX1I4tJ/2elt1POO41gLxKEc9ZV34sY
         z8RV7httz3/xDje80foQWhxh9Y6oYXFNknE9oFKrAiOlN/cbbrRMkc9J/bvNLD89pi3m
         qGBV9vXQhD0XSQBvtIlghZielJAWje6ffjIkiIYH8DylwUteeFra6Wc5IYUkPaoPr/NL
         I3CzJLYDVrEgdeRhu+CtqJn0698Zd4iZzcJhyL3AkwojPWDlO+eIBvL5aBcxoMZy6AQA
         i9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mp/yxKIxo35qlIxjkPpHR2WWZd6Ip78W8vNh9glzSik=;
        b=0tFJq7CHpubr1O0qyEAUUiyNuUeq/cT5VI9iG5FoORNoRQFVoQi/ovm24CvtlcUEg1
         ZplKV+hpw4lDADUaoOufTEC4JkyZhqhbhXJFB/jsF9wf23BoRCnTGkOJFcXX3/oQIVrM
         r+fvifQwGYdsA1y6g3WL5ZVTPt0gR+AgsPuzuIzeq8iu262FgF+whbyXCWFyuMKTnUr3
         AZGzIXD2Oj31TVNwysqfmaW9F77EMIgvI0MOuSDfACr1+31Z4i94zwUFeyi4bmtucRGk
         8m55FB2CSaMK7OV1IFw5ZohLgfq7bXbv/s91wWUj+IpULp30nnFxGfXoau2iWKozb66t
         d0zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3m6KLTN;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gc38si1289952ejc.601.2021.09.09.02.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Sep 2021 02:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3m6KLTN;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631179682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mp/yxKIxo35qlIxjkPpHR2WWZd6Ip78W8vNh9glzSik=;
	b=S3m6KLTNfsE/VRWifdS8hGsWrfeDeud+ACm3c7gtJbhvL03yxkDz25CWhzenYJG0mT2asa
	/1bBjqJI3ryKDE21ozgHqgCnYPoL+WohqomI1N53mnJuJpunJHDM3Rt6wFQhZvQ2/dsUBe
	f/QOfKu9XMpXbwBn1Q59qnLevwXaItI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-_FXt8cpQMomj6Kv3c-W0lg-1; Thu, 09 Sep 2021 05:28:00 -0400
X-MC-Unique: _FXt8cpQMomj6Kv3c-W0lg-1
Received: by mail-wr1-f72.google.com with SMTP id t15-20020a5d42cf000000b001565f9c9ee8so314490wrr.2
        for <alex.bennee@linaro.org>; Thu, 09 Sep 2021 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mp/yxKIxo35qlIxjkPpHR2WWZd6Ip78W8vNh9glzSik=;
        b=B7T3r7K3XGUNioBg0bvEtiuKa6puaFU1AQ4QU21hlpgNIYEYuFRQH/Fxr5GOs3yyYL
         J1wiFfHXzEqwvl0NNFrKg81Isj3Cy18baA3v0t5uldXg6vGSPX/UOAFEmALEwps7RKn1
         gvQpSVvWPWFOZyUTwu3icQcljWQczUajdRu8IvSG4zYBzH0+6sZD33e1cPMqBha4hnxt
         b0dzNRAwdnk+17IRJdAPBBpGf9ThU3QnxskOMfHdimH/ZEaNlLvyKhaRzzyn6qEOrvx9
         Fs+Y2xm6fy8Nl++92oQW8QdPdcHyRkdasc5Ip1rB97bNTCDBZ9BvLGIq6ajx5gPskdU6
         iyew==
X-Gm-Message-State: AOAM530eEHL18neB7lwQ3y1I2O9wF8xXvMd1Td9IJ9hJrGPOxFmHnmOP
	t6ANEPc7/QRFDOy5ffP0iZ2jXLHNuoj1siYDLPHMKsw2F9Wp5uoxAicY9ftY4LvIyJIYPXKkCTE
	mZzI+5zT2a7SOkLFQ
X-Received: by 2002:a05:600c:364f:: with SMTP id y15mr1883270wmq.193.1631179679255;
        Thu, 09 Sep 2021 02:27:59 -0700 (PDT)
X-Received: by 2002:a05:600c:364f:: with SMTP id y15mr1883244wmq.193.1631179678983;
        Thu, 09 Sep 2021 02:27:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id o7sm1096209wmq.36.2021.09.09.02.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 02:27:58 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] hw/pflash_cfi01: Allow backing devices to be
 smaller than memory region
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>, James Bottomley <jejb@linux.ibm.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 John Snow <jsnow@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Zheng Xiang <zhengxiang9@huawei.com>
References: <20210810134050.396747-1-david.edmondson@oracle.com>
 <20210810134050.396747-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <384a5d1d-de25-78d7-d8b0-226ebca44a6d@redhat.com>
Date: Thu, 9 Sep 2021 11:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810134050.396747-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: zw4KjO50Fy0C

Hi David,

On 8/10/21 3:40 PM, David Edmondson wrote:
> Allow the backing device to be smaller than the extent of the flash
> device by mapping it as a subregion of the flash device region.
> 
> Return zeroes for all reads of the flash device beyond the extent of
> the backing device.
> 
> For writes beyond the extent of the underlying device, fail on
> read-only devices and discard them for writable devices.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/pflash_cfi01.c | 105 ++++++++++++++++++++++++++++++++--------
>  hw/block/trace-events   |   3 ++
>  2 files changed, 87 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 81f9f971d8..f3289b6a2f 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -83,6 +83,8 @@ struct PFlashCFI01 {
>      uint64_t counter;
>      unsigned int writeblock_size;
>      MemoryRegion mem;
> +    MemoryRegion mem_outer;
> +    char outer_name[64];
>      char *name;
>      void *storage;
>      VMChangeStateEntry *vmstate;
> @@ -434,7 +436,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
>          }
>          break;
>      }
> -
>  }
>  
>  static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
> @@ -656,8 +657,44 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>  }
>  
>  
> -static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
> -                                              unsigned len, MemTxAttrs attrs)
> +static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
> +                                                uint64_t *value, unsigned len,
> +                                                MemTxAttrs attrs)
> +{
> +    PFlashCFI01 *pfl = opaque;
> +
> +    trace_pflash_outer_read(pfl->name, addr, len);
> +    *value = 0;

This seems to break the "width" and "old-multiple-chip-handling"
parameters ("emulating a number of flash devices wired up in parallel").

Also this breaks booting with SEV enabled on X86... See commits
9617cddb726 ("pc: add parser for OVMF reset block") and b2f73a0784b
("sev/i386: Allow AP booting under SEV-ES").

> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
> +                                                 uint64_t value, unsigned len,
> +                                                 MemTxAttrs attrs)
> +{
> +    PFlashCFI01 *pfl = opaque;
> +
> +    trace_pflash_outer_write(pfl->name, addr, len);
> +    if (pfl->ro) {
> +        return MEMTX_ERROR;
> +    } else {
> +        warn_report_once("%s: "
> +                         "attempt to write outside of the backing block device "
> +                         "(offset " TARGET_FMT_plx ") ignored",
> +                         pfl->name, addr);

This doesn't seem acceptable on mainstream, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html

> +        return MEMTX_OK;
> +    }
> +}
> +
> +static const MemoryRegionOps pflash_cfi01_outer_ops = {
> +    .read_with_attrs = pflash_outer_read_with_attrs,
> +    .write_with_attrs = pflash_outer_write_with_attrs,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
> +                                              uint64_t *value, unsigned len,
> +                                              MemTxAttrs attrs)
>  {
>      PFlashCFI01 *pfl = opaque;
>      bool be = !!(pfl->features & (1 << PFLASH_BE));
> @@ -670,8 +707,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
>      return MEMTX_OK;
>  }
>  
> -static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
> -                                               unsigned len, MemTxAttrs attrs)
> +static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
> +                                               uint64_t value, unsigned len,
> +                                               MemTxAttrs attrs)
>  {
>      PFlashCFI01 *pfl = opaque;
>      bool be = !!(pfl->features & (1 << PFLASH_BE));
> @@ -800,7 +838,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>  {
>      ERRP_GUARD();
>      PFlashCFI01 *pfl = PFLASH_CFI01(dev);
> -    uint64_t total_len;
> +    uint64_t outer_len, inner_len;
>      int ret;
>  
>      if (pfl->sector_len == 0) {
> @@ -816,35 +854,60 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    total_len = pfl->sector_len * pfl->nb_blocs;
> -
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
> -    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +    outer_len = pfl->sector_len * pfl->nb_blocs;
>  
>      if (pfl->blk) {
>          uint64_t perm;
> +
>          pfl->ro = !blk_supports_write_perm(pfl->blk);
>          perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
>          ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
>          if (ret < 0) {
>              return;
>          }
> +
> +        inner_len = blk_getlength(pfl->blk);
> +
> +        if (inner_len > outer_len) {
> +            error_setg(errp, "%s: "
> +                       "block backend provides %" PRIu64 " bytes, "
> +                       "device limited to %" PRIu64 " bytes",
> +                       pfl->name, inner_len, outer_len);
> +            return;
> +        }
>      } else {
>          pfl->ro = false;
> +        inner_len = outer_len;
>      }
>  
> +    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
> +
> +    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
> +             "%s container", pfl->name);
> +    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
> +                          &pflash_cfi01_outer_ops,
> +                          pfl, pfl->outer_name, outer_len);

Here you create an I/O region but name it "container" ...

> +
> +    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
> +                                  &pflash_cfi01_ops,
> +                                  pfl, pfl->name, inner_len, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);

... then add it inside the previous region, so &pfl->mem is used
as container (containing &pfl->mem_outer named "container"...).
This is confusing. Anyhow we shouldn't add subregions to I/O
regions but use real containers instead, creating the container
with memory_region_init(), then adding subregions inside.

> +
> +    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);


Have you audited no code uses:

  mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash), 0);

Because we'd need to change 0 -> 1.

See also the problem with pflash_cfi01_get_memory():
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01988.html
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02026.html

>      if (pfl->blk) {
> -        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
> -                                         errp)) {
> +        int ret = blk_pread(pfl->blk, 0, pfl->storage, inner_len);
> +
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "cannot read %" PRIu64 " "
> +                             "bytes from block backend", inner_len);
>              vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
>              return;
>          }
