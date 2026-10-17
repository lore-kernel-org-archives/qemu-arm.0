Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69658CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 15:01:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI5uj-00078F-BM; Sat, 17 Oct 2026 11:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5uf-00077Z-R2
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:01:34 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5ud-0007Sm-2r
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:01:32 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8ab432273c5so6322287b3.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 08:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792249289; cv=none;
 d=google.com; s=arc-20260327;
 b=Uq+OlICLIhKiPmkaiosYfou/q1W1hg+aPCVWmXsgmt238zdUo7ss5dUMSQ6mj489Sf
 9DYTVes7uwwJanns2++qasjkBTuZIL0GBoZDmWWr5VJlKZUczPJjRtCoas8+vfmlmYQP
 NGPmyTjUGrFMCUUTvnIaTZML6glnA8sdo3vo/k0ZLsYk81RjNF8JCAoifWcYD5Uf4/0S
 bnsDL+T2DaKV4TBOe14XzbFq2NDM1G6aB3LfUojNmDmKQluLDPgBUYzmcv5lr9r1JvLd
 XDsdSjKcpJH/1GP5a/6MayyNwIbg2FklEH/engAzv0AaDJ5mK2D9anHIhCcldNMNW6ZZ
 tX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SLBCU2hF9JhXZVyaz8NCtFu3yStGcGQNfZsb5pFrDMk=;
 fh=g7t7DZdm3Vt5T33W9hyfCcXB8n1yzMeOOdI5/Bfon4Q=;
 b=Cx3eZcsV1mJGOQb7n+Q3cfRGgElgdUvfH47Mupog2w9G9KAWVTGqBIDDNCce9IUvpz
 b2smjnH4cAblVouOgEd8OplJ6zPozAvfOi+oApp32U8Qg44ICz4xFGSLdyzPbSpGOddM
 yefShHAdEKb/dvOfI0Z/8m6ZqWUvmo2qcAbDY5VA6J0vhU7Meodn+zTtrmIeVMWBV3Ed
 y1hBHKnYYCjYY8VqV7FIBvwDJxfQgHwXJnqkWFgCNLLuev3XvPnrpZJXgWHMougYsg61
 tiFpT/DE4Xqu6+gQGZxTMZN0en+syCpdlZtkQJ43u6gNCdy0YdXtlRtQNf+GtxaXW/zi
 SUNA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792249289; x=1792854089; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SLBCU2hF9JhXZVyaz8NCtFu3yStGcGQNfZsb5pFrDMk=;
 b=xSNUo3tIyDdE5HlEY3IgTQGOjxiBBcAJtZQEFGDSohWkL1IT+q/qKTR8akHMVreb7Q
 fCOnW79+ju3jMJ5brkTgORYHk2aqFyZTI8RnjY2cOF1jS4PveBBZe+WgdKUur/c9fiUj
 BoIsJvydeorjspQa+NtOD7mdmjWDfiOkFl6AS0Hztm3gElB4eN7vMT5GH+SPD5Hz4gxK
 YQs8DuaG/obsc1NjHSqwVgEyC9Hv/aRU5iMP6kALrcz2XuZRHmIMExy4oe6b3IjE+rVV
 bIaSnQ34RqJNp/VW3T5kH3QbWYGKgb7qeQXKEDGMETOnqZ27QL4cssHd6fCd6vy3zjtp
 guyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792249289; x=1792854089;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SLBCU2hF9JhXZVyaz8NCtFu3yStGcGQNfZsb5pFrDMk=;
 b=N/hNKHad+0pSlssG3JbUPIBQ/qtf3HYieHnTtQO9dk2JpzgAh0Yc79Dkd7hnbH92gq
 uWLKqChpQ6ed50h+u1sz03rAm/TsaFJXsWdE4tQJgOdXSJfu0ZCrfD63RK1ejRqCwLj1
 DZFS4jXWDiM6YW0V9hJSxDRsNXd4/rLsglikE5vF0rtOVQu8Xbysa7sdEGAdANIQ+CjW
 jHk759L7ekXtR2jWURQ9EDmWBZUcM5pmr9k/GGCWTK52ehrx7x9b0LPTMlbgvRDy34MR
 m+Cv4/x2dSqtJOYdGzZRs7UC1nDfyHOGXXrg1nwo7J0rk8Fwbsn0GUYUE7XYCNmuubxG
 j+qw==
X-Forwarded-Encrypted: i=1;
 AKwUvBySf8+WmosPjCRgb8o4JPXv/7GaoEI/dOiPKvH93vV/aPN2gNhHxG85WO02sJkhioDslQuRUhkNTA==@nongnu.org
X-Gm-Message-State: AFq9FYKOgu4BCk8DZIqKVGrjZyefZm3m/WIte0yWmHLO/3RaBsPEPwWn
 +W2RoRBwZE/ih7XhuCPb5zlxTFO9UvEwuJ1r+qWC1vHCvlJ1Dzni4TNBxtNKaii+W6AgEDC4hJ0
 z5aRyBfbZ0YAbMgSeTjhQWNBqGAikn85yhfP8F0eHVA==
X-Gm-Gg: AYBFou1BbdaLii9SwLYMbe/UCxebCbC/cjKjy0UAgy4gf69liw236gsZMxHiBidCUH0
 fmhFhd2lFsMXyG61PJbmIk3bgJGGJ+H0DYkpAThnekq9Y+jKN6DVtshBFTEIoTy95c6LZtm/u6N
 +8YgT1wttB/N+Jnr0LJzVvbOVGdLNRdkjRaQpxBiGh0xUpLPxwIQLztfytBJ+lbnzNg1LB54Tm+
 2mqO+4FEac7GL0PFsgRujg09YytSu8EV2vfllBQ9zJ4iIkIHayzPw129BLkISD09E1pRtT+koKq
 I/4niNASN8k4JmRScq9NVDJxV/qEQolLhbwVXy0MsqlQlhs1v1tGfdjFex4qYg20qt+K1kzbFN0
 rfntnpRF7VqEwTSFctVnNC4djjHD8glRnA9lCZ7s=
X-Received: by 2002:a05:690c:6d01:b0:8b0:88b7:cfe3 with SMTP id
 00721157ae682-8b0f21cbcc0mr11285387b3.40.1792249288457; Sat, 17 Oct 2026
 08:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-11-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-11-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 16:01:16 +0100
X-Gm-Features: AclHuK_4-b3qdQL9B1fS1k4p-xIQ0f17XwkLcfHkQc4F88A-Vr9d1dO4Z3aTAno
Message-ID: <CAFEAcA_dVK5kr3bBcDvYCJaWL19qBh-W+H3anKqP4dio-j+NQQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] hw/net/bcm2838_genet: implement GENET register
 ops
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Replace the stub MMIO read/write handlers with real dispatch over
> the register offsets from the previous patches: SYS revision
> control, INTRL0/1 status/mask registers, UMAC command/MAC-address/
> MDIO-command registers, and TDMA/RDMA ring configuration, wired up
> to the NIC's realize()/reset() and qdev NIC properties
> (DEFINE_NIC_PROPERTIES) so the device gets a MAC address and peer
> netdev from the command line.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo:
> adapted to the current Property/class_init/Resettable APIs, with no
> functional change to the register dispatch logic itself.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>



>  static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      uint64_t value = ~0;
> +    BCM2838GenetState *s = opaque;
>
> -    qemu_log_mask(
> -        LOG_GUEST_ERROR,
> -        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> -        __func__, size, offset);
> +    if (offset + size < sizeof(s->regs)) {
> +        memcpy(&value, (uint8_t *)&s->regs + offset, size);

This has endianness problems, because not everything in s->regs
is a host uint32_t. It works for the uint32_t fields because we
force that only 4-byte accesses are valid and 'value' here is
in host order, but in e.g. BCM2838GenetRegsHfb the flt[] array
is uint8_t. (Plus it looks on the face of it like it will handle
an arbitrary offset/size but it won't work on big-endian hosts
for anything except 4/4.) Similarly for the write memcpy.

This kind of thing is why devices tend to either
(a) have a uint32_t regs[] array, and use "s->regs[offset >> 2] = value"
as their default "set the register", or
(b) have structs where the fields are named after the registers, and
have switch(offset) statements which handle each register case
separately with "s->myfield = value", and don't try to have a default
case that handles most registers.


> +    } else {
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> +            __func__, size, offset);
> +    }
>
>      trace_bcm2838_genet_read(size, offset, value);
>      return value;
>  }
>
>  static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
> -                                unsigned size) {
> -    qemu_log_mask(
> -        LOG_GUEST_ERROR,
> -        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> -        __func__, size, offset);
> +                                unsigned size)
> +{
> +    BCM2838GenetState *s = opaque;
> +    MACAddr *mac = &s->nic_conf.macaddr;
> +    NetClientState *ncs = qemu_get_queue(s->nic);
> +
> +    trace_bcm2838_genet_write(size, offset, value);
> +
> +    if (offset + size < sizeof(s->regs)) {
> +        switch (offset) {
> +        case BCM2838_GENET_INTRL0_SET:
> +            s->regs.intrl0.stat |= value;
> +            break;
> +        case BCM2838_GENET_INTRL0_CLEAR:
> +            s->regs.intrl0.stat &= ~value;
> +            break;
> +        case BCM2838_GENET_INTRL0_MASK_SET:
> +            s->regs.intrl0.mask_status |= value;
> +            break;
> +        case BCM2838_GENET_INTRL0_MASK_CLEAR:
> +            s->regs.intrl0.mask_status &= ~value;
> +            break;
> +        case BCM2838_GENET_INTRL1_SET:
> +            s->regs.intrl1.stat |= value;
> +            break;
> +        case BCM2838_GENET_INTRL1_CLEAR:
> +            s->regs.intrl1.stat &= ~value;
> +            break;
> +        case BCM2838_GENET_INTRL1_MASK_SET:
> +            s->regs.intrl1.mask_status |= value;
> +            break;
> +        case BCM2838_GENET_INTRL1_MASK_CLEAR:
> +            s->regs.intrl1.mask_status &= ~value;
> +            break;
> +        case BCM2838_GENET_UMAC_CMD:
> +            /* Complete SW reset as soon as it has been requested */
> +            if (FIELD_EX32(value, GENET_UMAC_CMD, SW_RESET) == 1) {
> +                device_cold_reset(DEVICE(s));
> +                value = FIELD_DP32(value, GENET_UMAC_CMD, SW_RESET, 0);
> +            }
> +            break;
> +        /*
> +         * TODO: before changing MAC address we'd better inform QEMU
> +         * network subsystem about freeing previously used one, but
> +         * qemu_macaddr_set_free function isn't accessible for us (marked
> +         * as static in net/net.c), see also https://lists.nongnu.org/
> +         * archive/html/qemu-devel/2022-07/msg02123.html
> +         */
> +        case BCM2838_GENET_UMAC_MAC0:
> +            mac->a[0] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_0);
> +            mac->a[1] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_1);
> +            mac->a[2] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_2);
> +            mac->a[3] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_3);
> +            qemu_macaddr_default_if_unset(mac);

No other network device uses this function like this. This is the
function for "in your realize method, if the user didn't specify
a MAC address via config, let the net code pick one for them".

Maybe (as per the linked email thread) the APIs here could be
improved, but a new device model isn't the place to start doing
something that no other device is doing. The standard thing seems
to be that we call qemu_format_nic_info_str() with the new MAC and
call that good enough.

If we want to fix bugs in the MAC address APIs we should do that
as a separate patchset that proposes its change and implements it
in the existing device models.

> +            qemu_format_nic_info_str(ncs, mac->a);
> +            trace_bcm2838_genet_mac_address(ncs->info_str);
> +            break;
> +        case BCM2838_GENET_UMAC_MAC1:
> +            mac->a[4] = FIELD_EX32(value, GENET_UMAC_MAC_1, ADDR_4);
> +            mac->a[5] = FIELD_EX32(value, GENET_UMAC_MAC_1, ADDR_5);
> +            qemu_macaddr_default_if_unset(mac);
> +            qemu_format_nic_info_str(ncs, mac->a);
> +            trace_bcm2838_genet_mac_address(ncs->info_str);
> +            break;

thanks
-- PMM

