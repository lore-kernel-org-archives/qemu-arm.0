Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1551048ejb;
        Mon, 22 May 2023 17:54:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gEbXJreHkZ/rMMaifeil8uhRqT72Bb7qlb4P0A+E24av+CPFLZw//xbafEWYI2Uz3573E
X-Received: by 2002:a05:620a:4729:b0:75b:23a1:368b with SMTP id bs41-20020a05620a472900b0075b23a1368bmr2897876qkb.76.1684803267899;
        Mon, 22 May 2023 17:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684803267; cv=none;
        d=google.com; s=arc-20160816;
        b=01fD9SPFIv5PcThpi7PWe5X8DlDRaA0vouu3bSw/f+z2jnRY1k5uKPHpcxJlceMc38
         b+5Y4Osvxud4DElE7+oFoxdu8/vvzdz+OrL0dhMofwcSUnVjabzGmWqi8INe++a/Z8zt
         ug+sdKMQU0apjMU6L8/hz6oCPREIopWFD3uV09pQKa1jFnlJT+yHJXj8rGji6aEftsRp
         VQlEOxm6i/wcCQGSAeorH3qWLnuegYm+YAx02uswzzI1LRcQhyfZFkx26I5PIdHP35gr
         q2PfMA/aDnXffnEaNXLbjJj0vOhEP5FLDYc90gAd5ik6IBk9S6VlV2c4obqhlPsZ1mxp
         BHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jwwGh/H22xt+T3KOg84Ugl/Dtj2fCvNTpbZZohjt85Y=;
        b=ekaDSq0/zL+PF/JYLKQu6amO1/ExTZNG1qDxYjlN02UddrSmvYCxFwkiPHhpSKcLY9
         vSUiCwl/v7fndSvFalMsoKvdMXrx/p8SldigBp8Xv6ePFhz0BnVBehzbZpCmS/bO94S0
         fekFdLDjBsaqQoL9OfB1U8OWFPxoaC+C5LnBxCcdqUOYt+V38xhNMuppKpLmNyp0sbmt
         tqSbUqb+hzMDUnegXXgZIbYO1Vqd9NgrBOEjr2JdPC7b6Dvn8nPg7EP3uqOpZa98hOA1
         syRuZgocyr/aeX8Vax4tKyIppf2cf3bkqXeRmNPhMRI7gVrFIJth3n2yIg6sZEwGyO0R
         +kPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=KmKoA2vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a37e302000000b0074dacc5c3c1si4026616qki.557.2023.05.22.17.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 17:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=KmKoA2vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1GHt-0008HX-RT; Mon, 22 May 2023 20:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1q1GHs-0008Gm-Eh; Mon, 22 May 2023 20:54:04 -0400
Received: from m12.mail.163.com ([220.181.12.214])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1q1GHq-00067G-24; Mon, 22 May 2023 20:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=jwwGh/H22xt+T3KOg84Ugl/Dtj2fCvNTpbZZohjt85Y=;
 b=KmKoA2vqfkDMEkoCu/aCsx9YzwmZ+3f+FEFduzcDxSMh5pludyAzCbz1MLsFJe
 C3qQ7OkirLsA7a8IAxAXkJdHbniO3Mpq+kNX9RwlD3nuxdDDGxVX6c1k1S09aC4p
 xxP3yUtW/1PVOHstbrdk02W3C2FVwLQDGrrt4Y1/J3qRI=
Received: from [172.21.25.67] (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wA3h_OfDmxkEQR3AQ--.1855S2; 
 Tue, 23 May 2023 08:53:51 +0800 (CST)
Message-ID: <da0c564c-b2f4-5cd5-2db3-b575f929d68b@163.com>
Date: Tue, 23 May 2023 08:53:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/11] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC
 support
Content-Language: en-US
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <20230510103004.30015-8-qianfanguijin@163.com>
 <CAPan3WrwJLpGAFf=wwoxFhdjom7yAogcBB2JC_kmCz54SR7Tmg@mail.gmail.com>
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <CAPan3WrwJLpGAFf=wwoxFhdjom7yAogcBB2JC_kmCz54SR7Tmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3h_OfDmxkEQR3AQ--.1855S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFWrWFy7Zw4kCFyktry5urg_yoW3uw17pF
 ZYkw45GF45Gan7Jr47tFnrKF1rW34kGF4jkrn3CF97Ar1kJ3ZIqF4DKay5JF4DGF4DCF4U
 Aa1YqFy5uFs5taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UfpndUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQgN47VaEFaDElwAAsg
Received-SPF: pass client-ip=220.181.12.214;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: T/8G8aZ/55Cw



在 2023/5/16 3:54, Niek Linnenbank 写道:
>
>
> On Wed, May 10, 2023 at 12:30 PM <qianfanguijin@163.com> wrote:
>
>     From: qianfan Zhao <qianfanguijin@163.com>
>
>     A64's sd register was similar to H3, and it introduced a new register
>     named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
>     mmc2 is only 8K and the other mmc controllers has 64K.
>
>     Also fix allwinner-r40's mmc controller type.
>
>     Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>     ---
>      hw/arm/allwinner-r40.c           |  2 +-
>      hw/sd/allwinner-sdhost.c         | 70
>     ++++++++++++++++++++++++++++++--
>      include/hw/sd/allwinner-sdhost.h |  9 ++++
>      3 files changed, 77 insertions(+), 4 deletions(-)
>
>     diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
>     index 0e4542d35f..b148c56449 100644
>     --- a/hw/arm/allwinner-r40.c
>     +++ b/hw/arm/allwinner-r40.c
>     @@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)
>
>          for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
>              object_initialize_child(obj, mmc_names[i], &s->mmc[i],
>     -                                TYPE_AW_SDHOST_SUN5I);
>     +                                TYPE_AW_SDHOST_SUN50I_A64);
>          }
>
>          object_initialize_child(obj, "twi0", &s->i2c0,
>     TYPE_AW_I2C_SUN6I);
>     diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
>     index 92a0f42708..f4fa2d179b 100644
>     --- a/hw/sd/allwinner-sdhost.c
>     +++ b/hw/sd/allwinner-sdhost.c
>     @@ -77,6 +77,7 @@ enum {
>          REG_SD_DATA1_CRC  = 0x12C, /* CRC Data 1 from card/eMMC */
>          REG_SD_DATA0_CRC  = 0x130, /* CRC Data 0 from card/eMMC */
>          REG_SD_CRC_STA    = 0x134, /* CRC status from card/eMMC
>     during write */
>     +    REG_SD_SAMP_DL    = 0x144, /* Sample Delay Control
>     (sun50i-a64) */
>          REG_SD_FIFO       = 0x200, /* Read/Write FIFO */
>      };
>
>     @@ -158,6 +159,7 @@ enum {
>          REG_SD_RES_CRC_RST      = 0x0,
>          REG_SD_DATA_CRC_RST     = 0x0,
>          REG_SD_CRC_STA_RST      = 0x0,
>     +    REG_SD_SAMPLE_DL_RST    = 0x00002000,
>          REG_SD_FIFO_RST         = 0x0,
>      };
>
>     @@ -459,6 +461,7 @@ static uint64_t allwinner_sdhost_read(void
>     *opaque, hwaddr offset,
>      {
>          AwSdHostState *s = AW_SDHOST(opaque);
>          AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>     +    bool out_of_bounds = false;
>          uint32_t res = 0;
>
>          switch (offset) {
>     @@ -577,13 +580,24 @@ static uint64_t allwinner_sdhost_read(void
>     *opaque, hwaddr offset,
>          case REG_SD_FIFO:      /* Read/Write FIFO */
>              res = allwinner_sdhost_fifo_read(s);
>              break;
>     +    case REG_SD_SAMP_DL: /* Sample Delay */
>     +        if (sc->can_calibrate) {
>     +            res = s->sample_delay;
>     +        } else {
>     +            out_of_bounds = true;
>     +        }
>     +        break;
>          default:
>     -        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>     -                      HWADDR_PRIx"\n", __func__, offset);
>     +        out_of_bounds = true;
>              res = 0;
>              break;
>          }
>
>     +    if (out_of_bounds) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>     +                      HWADDR_PRIx"\n", __func__, offset);
>     +    }
>     +
>          trace_allwinner_sdhost_read(offset, res, size);
>          return res;
>      }
>     @@ -602,6 +616,7 @@ static void allwinner_sdhost_write(void
>     *opaque, hwaddr offset,
>      {
>          AwSdHostState *s = AW_SDHOST(opaque);
>          AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>     +    bool out_of_bounds = false;
>
>          trace_allwinner_sdhost_write(offset, value, size);
>
>     @@ -725,10 +740,21 @@ static void allwinner_sdhost_write(void
>     *opaque, hwaddr offset,
>          case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
>          case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write
>     operation */
>              break;
>     +    case REG_SD_SAMP_DL: /* Sample delay control */
>     +        if (sc->can_calibrate) {
>     +            s->sample_delay = value;
>     +        } else {
>     +            out_of_bounds = true;
>     +        }
>     +        break;
>          default:
>     +        out_of_bounds = true;
>     +        break;
>     +    }
>     +
>     +    if (out_of_bounds) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>                            HWADDR_PRIx"\n", __func__, offset);
>     -        break;
>          }
>      }
>
>     @@ -777,6 +803,7 @@ static const VMStateDescription
>     vmstate_allwinner_sdhost = {
>              VMSTATE_UINT32(response_crc, AwSdHostState),
>              VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
>              VMSTATE_UINT32(status_crc, AwSdHostState),
>     +        VMSTATE_UINT32(sample_delay, AwSdHostState),
>              VMSTATE_END_OF_LIST()
>          }
>      };
>     @@ -815,6 +842,7 @@ static void
>     allwinner_sdhost_realize(DeviceState *dev, Error **errp)
>      static void allwinner_sdhost_reset(DeviceState *dev)
>      {
>          AwSdHostState *s = AW_SDHOST(dev);
>     +    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>
>          s->global_ctl = REG_SD_GCTL_RST;
>          s->clock_ctl = REG_SD_CKCR_RST;
>     @@ -855,6 +883,10 @@ static void
>     allwinner_sdhost_reset(DeviceState *dev)
>          }
>
>          s->status_crc = REG_SD_CRC_STA_RST;
>     +
>     +    if (sc->can_calibrate) {
>     +        s->sample_delay = REG_SD_SAMPLE_DL_RST;
>     +    }
>      }
>
>      static void allwinner_sdhost_bus_class_init(ObjectClass *klass,
>     void *data)
>     @@ -888,6 +920,24 @@ static void
>     allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
>          sc->is_sun4i = false;
>      }
>
>     +static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass
>     *klass,
>     +                                                   void *data)
>     +{
>     +    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
>     +    sc->max_desc_size = 64 * KiB;
>     +    sc->is_sun4i = false;
>     +    sc->can_calibrate = true;
>
>
> For the existing functions allwinner_sdhost_sun4i_class_init() and 
> allwinner_sdhost_sun5i_class_init(), could you please add 
> 'sc->can_calibrate = false'?
> That way, we make it explicit that those types do not support the 
> sample delay register.
Sure.
>
> With that resolved, the code looks good to me:
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
>     +}
>     +
>     +static void
>     allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass *klass,
>     + void *data)
>     +{
>     +    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
>     +    sc->max_desc_size = 8 * KiB;
>     +    sc->is_sun4i = false;
>     +    sc->can_calibrate = true;
>     +}
>     +
>      static const TypeInfo allwinner_sdhost_info = {
>          .name          = TYPE_AW_SDHOST,
>          .parent        = TYPE_SYS_BUS_DEVICE,
>     @@ -910,6 +960,18 @@ static const TypeInfo
>     allwinner_sdhost_sun5i_info = {
>          .class_init    = allwinner_sdhost_sun5i_class_init,
>      };
>
>     +static const TypeInfo allwinner_sdhost_sun50i_a64_info = {
>     +    .name          = TYPE_AW_SDHOST_SUN50I_A64,
>     +    .parent        = TYPE_AW_SDHOST,
>     +    .class_init    = allwinner_sdhost_sun50i_a64_class_init,
>     +};
>     +
>     +static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info = {
>     +    .name          = TYPE_AW_SDHOST_SUN50I_A64_EMMC,
>     +    .parent        = TYPE_AW_SDHOST,
>     +    .class_init    = allwinner_sdhost_sun50i_a64_emmc_class_init,
>     +};
>     +
>      static const TypeInfo allwinner_sdhost_bus_info = {
>          .name = TYPE_AW_SDHOST_BUS,
>          .parent = TYPE_SD_BUS,
>     @@ -922,6 +984,8 @@ static void allwinner_sdhost_register_types(void)
>          type_register_static(&allwinner_sdhost_info);
>          type_register_static(&allwinner_sdhost_sun4i_info);
>          type_register_static(&allwinner_sdhost_sun5i_info);
>     + type_register_static(&allwinner_sdhost_sun50i_a64_info);
>     + type_register_static(&allwinner_sdhost_sun50i_a64_emmc_info);
>          type_register_static(&allwinner_sdhost_bus_info);
>      }
>
>     diff --git a/include/hw/sd/allwinner-sdhost.h
>     b/include/hw/sd/allwinner-sdhost.h
>     index 30c1e60404..1b951177dd 100644
>     --- a/include/hw/sd/allwinner-sdhost.h
>     +++ b/include/hw/sd/allwinner-sdhost.h
>     @@ -38,6 +38,12 @@
>      /** Allwinner sun5i family and newer (A13, H2+, H3, etc) */
>      #define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST "-sun5i"
>
>     +/** Allwinner sun50i-a64 */
>     +#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST "-sun50i-a64"
>     +
>     +/** Allwinner sun50i-a64 emmc */
>     +#define TYPE_AW_SDHOST_SUN50I_A64_EMMC  TYPE_AW_SDHOST
>     "-sun50i-a64-emmc"
>     +
>      /** @} */
>
>      /**
>     @@ -110,6 +116,7 @@ struct AwSdHostState {
>          uint32_t startbit_detect;   /**< eMMC DDR Start Bit Detection
>     Control */
>          uint32_t response_crc;      /**< Response CRC */
>          uint32_t data_crc[8];       /**< Data CRC */
>     +    uint32_t sample_delay;      /**< Sample delay control */
>          uint32_t status_crc;        /**< Status CRC */
>
>          /** @} */
>     @@ -132,6 +139,8 @@ struct AwSdHostClass {
>          size_t max_desc_size;
>          bool   is_sun4i;
>
>     +    /** does the IP block support autocalibration? */
>     +    bool can_calibrate;
>      };
>
>      #endif /* HW_SD_ALLWINNER_SDHOST_H */
>     -- 
>     2.25.1
>
>
>
> -- 
> Niek Linnenbank
>

