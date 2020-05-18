Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3005677lfb;
        Mon, 18 May 2020 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+rrIrLSw4Bgd7GR5JkYsfvzQBf3VeoWgGnygiristP1ZKAP+vWIDqwICIcBvGsSO30Gja
X-Received: by 2002:a05:6214:18ec:: with SMTP id ep12mr9328968qvb.216.1589806266962;
        Mon, 18 May 2020 05:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589806266; cv=none;
        d=google.com; s=arc-20160816;
        b=BZItVMAzsWDr1tYmzTsGD9FkK+JYypGankgeigt9JdrhlZ/Pi2vVgOiK83Fkw245aH
         MUPyB7v/7Q1R39TEB5/VNvK320Ij8Zdsqu6EY3mNCqOUtuKhqoAZNlfL/oLmxQ0jfihc
         d9/jUXVv9v4GAUL3DBXNjUg2O63c6Y0w0kt5YczEkkIlZKoi1ZGGGftqIuAQImUPyTVQ
         XeJRaNUlqST6XA+K8IIc2Qjbzsu/+CIsHzgGpnLCWCaGWzJQVUGiEvBVhndD3iPs0I3l
         O32wLegQe/L0aI28+f8CaFbkmBIPkIDT1UC7jrUbCzlgWCcd3d1qkY7GtJnJROuCpsPf
         8gpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qtV5b4Z/XtezT8P8ZBmElN4tH8V6CxN5eoS0EIqEjTE=;
        b=zSk+Ozxb+X/A+2tj+4lobRdBM6lxzEn10O3hXGyJEmEDjOpk9Vy1lwTZEudnca2Phs
         q/wkxoEe5YV2dw7x7SETScAMzReFLHsfO6a+pmPoqAjn3jwQD+NNieaCrYH0gdBnSik+
         NXHhriXHQjemLnWKsxd8Gy6iE9kOF9R7PFkFwKuSh5vkUy20B4uIGYO/3i5kHI6B9u0y
         vLMnLOlPWs5Oew1Z2gXnnpHTazNNsv9qCZMrOZlQcQU/SFUHVhEZ1LcTz0vHaloAnrl1
         D9wAx148XFrW30d36nWfrn/5+/TNubG4ArUOzAs+fgVpeqeINFV1c+rgkLHFqUCSZm0V
         xz6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g8HmA0m+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si5827399qtu.115.2020.05.18.05.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g8HmA0m+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jafEY-0000jB-9t
	for alex.bennee@linaro.org; Mon, 18 May 2020 08:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jafDM-0008BN-CQ
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:49:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32231
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jafDL-0006kF-FU
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589806190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtV5b4Z/XtezT8P8ZBmElN4tH8V6CxN5eoS0EIqEjTE=;
 b=g8HmA0m+M8GIKpk3hbmeD0cA8/jKN8jqWMe0TR08IecQGyl11YBBU9Ppc7Hi/UXvm52y74
 DxzE8sVizkxXrA7P6Um4QfoHJQ/aFC1h5my/6ki9IbYQJpOThfiB8Ja2e/g5hwIi5z5mBE
 G4yQXCFuDxQoixn8U90s85ItdQNDbvg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-YxMtbU78MwWhUavXdb_ogg-1; Mon, 18 May 2020 08:49:49 -0400
X-MC-Unique: YxMtbU78MwWhUavXdb_ogg-1
Received: by mail-wr1-f71.google.com with SMTP id z8so5570061wrp.7
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 05:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtV5b4Z/XtezT8P8ZBmElN4tH8V6CxN5eoS0EIqEjTE=;
 b=HwQ6YmmzLMWf0gIEU5OKiEkRHHAR28suNLRwMu7I4Rt7BxQ21ZgE2e+j5W4j6XXSg5
 jAwq56j/XftA8fu1zKTuT5AUmf961iifbKWF9tpQvv8uPp3z7X1A+40Zc4WF5opsVddF
 ERLasswWnfvDJwztyCPKO1JsMPvKhPcBJLq36LGeHVn5qFZtshiFn2IKk/0n6yYbiHXX
 qSzdWMjQ9UiKB0j1p+pIhrJcuENtmpM/GMLP0b479kwLSWHD/hu55DtDhCHpI7SBvP1f
 48liSF9MQHvWQaYFLIhH7F0bj5BYOCb43EEQvdSCHwxzM1NQqRktUxFn+bIvfVoML+ug
 NtKw==
X-Gm-Message-State: AOAM533xkJ/sicGqvdhga4Uws41AFgy8HpqPOTdaMfofH35Bv1OUMrCO
 Pw/m6uqCjSnZjSSjWL4aV6h4oljMio00xctea2psrKkV7BYQf8ANUxQX1RNbGUOuaX2LNFk9ToY
 7/n2y3ksOBxAr7Jw=
X-Received: by 2002:a1c:2943:: with SMTP id p64mr3612188wmp.42.1589806187898; 
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
X-Received: by 2002:a1c:2943:: with SMTP id p64mr3612153wmp.42.1589806187646; 
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.90.67])
 by smtp.gmail.com with ESMTPSA id e22sm16814111wrc.41.2020.05.18.05.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
Subject: Re: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200511205246.24621-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <60f129c2-499d-01e1-e0ee-9fd6ac759736@redhat.com>
Date: Mon, 18 May 2020 14:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200511205246.24621-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbHuR8hAkRRF

On 11/05/20 22:52, Philippe Mathieu-Daudé wrote:
> Use the QEMU_IS_ALIGNED() macro to verify the flash block size
> is properly aligned. It is quicker to process when reviewing.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/sbsa-ref.c       | 2 +-
>  hw/arm/virt.c           | 2 +-
>  hw/block/pflash_cfi01.c | 2 +-
>  hw/block/pflash_cfi02.c | 2 +-
>  hw/i386/pc_sysfw.c      | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 8409ba853d..b379e4a76a 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -241,7 +241,7 @@ static void sbsa_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % SBSA_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, SBSA_FLASH_SECTOR_SIZE));
>      assert(size / SBSA_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / SBSA_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 634db0cfe9..0a99fddb3d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -978,7 +978,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index f586bac269..11922c0f96 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -964,7 +964,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk, &error_abort);
>      }
> -    assert(size % sector_len == 0);
> +    assert(QEMU_IS_ALIGNED(size, sector_len));
>      qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>      qdev_prop_set_uint64(dev, "sector-length", sector_len);
>      qdev_prop_set_uint8(dev, "width", bank_width);
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index c6b6f2d082..895f7daee3 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -1003,7 +1003,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk, &error_abort);
>      }
> -    assert(size % sector_len == 0);
> +    assert(QEMU_IS_ALIGNED(size, sector_len));
>      qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>      qdev_prop_set_uint32(dev, "sector-length", sector_len);
>      qdev_prop_set_uint8(dev, "width", width);
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index f5f3f466b0..fad41f0e73 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -168,7 +168,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
>                           blk_name(blk), strerror(-size));
>              exit(1);
>          }
> -        if (size == 0 || size % FLASH_SECTOR_SIZE != 0) {
> +        if (size == 0 || !QEMU_IS_ALIGNED(size, FLASH_SECTOR_SIZE)) {
>              error_report("system firmware block device %s has invalid size "
>                           "%" PRId64,
>                           blk_name(blk), size);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index daae3ebdbb..71481d59c2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -112,7 +112,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

