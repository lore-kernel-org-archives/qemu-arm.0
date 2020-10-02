Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1634498lfq;
        Fri, 2 Oct 2020 08:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6YHaHvBywReNmNj5GTk06KaiFN23M3Txsin2o3/BpS6BBq0emCW9tUszFM3NY1d+K4St+
X-Received: by 2002:a25:ca09:: with SMTP id a9mr3531072ybg.178.1601651604161;
        Fri, 02 Oct 2020 08:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601651604; cv=none;
        d=google.com; s=arc-20160816;
        b=UP0uLWb0Gh+WUIzV628tOMXbjExIEIFccrQHDdqBO3s52tbQ2lGqlyhWDOiHQOeY0c
         R4qjpmQCO5xBrk1aOUgZppG9qnArC6aJan00rcg7a8zAPTTxTBR3h0cfMiCPOOmpEuD3
         m2G/TSjVplNX0b501ZjV4RjFwyVb4X6Vj7kijfdt7UrL0tJwH6lp2F4ZjkANtsbKy9Cf
         HjfhWaBEYvD71B+kkxglUaEET7VK36OLR2JYHp9l77hfZQWRj8L4l/XyJVoUci9SoSfp
         xCF6IgOOkH1MA9y4qsiEumaf3STbiEa88rX76Mq9ggaHgw56c6bgat/2I4awh2+mVee/
         zQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HIUbFBaGFs+zDNCwEeYpcXbfIO6Aj85k50HldrkBzn4=;
        b=TSdOrEhXxz73L0dl05oxubmoLK5ztn20/fSzkI6hi2uuwQRg5tNVoNtupJixoKZQTX
         Rs+VYkC6h4ko2gUXMP4ysPCYd+pUs904WzoYGEf8g+2qlw65cFNf6L+KnmN+xREiVbP9
         4FF+y58ABDmGhu+/E92u1+BWfcVeavS0CjEqPgTd60y7GdQyW+ifyKMkqJu2lXrsLXPQ
         FH+z3kFO5ODrd7c//8dYDKNoejBIiK6hfGrH+zlSR9G3tFJOqmk3AOrBGan1nd54s4xP
         Zt015k00kuRU/IBqqwj8jEKWlqyrCkX3N5+fEYhXKlGTwf6ctEuFx7IKRraUlXmLB1Zv
         pEYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PZqg87mA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si2040789ybh.337.2020.10.02.08.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 08:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PZqg87mA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOMkN-0005nN-Al
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 11:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOMTH-0008QU-EL; Fri, 02 Oct 2020 10:55:43 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOMTE-0005sU-J6; Fri, 02 Oct 2020 10:55:43 -0400
Received: by mail-wm1-x342.google.com with SMTP id v12so2064872wmh.3;
 Fri, 02 Oct 2020 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HIUbFBaGFs+zDNCwEeYpcXbfIO6Aj85k50HldrkBzn4=;
 b=PZqg87mA95FnXhbT77ae5gMalhe5hf5gjBxYNf8cFA1xyTnpHN3yKjO591cPyLT38M
 4Pdf1QraWbVqtQ6rmBWB0QS/C+xqnO1rer+v+1lTuzkOMXzmoOcRkx569oFBrQZ30LBw
 n7fezWASlK6OavcXrAh8YjYqGU81nCeous9SHtUOIaMCiSGXDAucOV+PKzxqvwVv5L4y
 4A/EU0T6f9SGhyR8G6ptDBe+y8LhY8ZQXLDFfCb3QdJLZIP7DgDjSaD2tWDfE3+W1iBE
 APd44aO3AObDwYcHT0/ud+InVpSyq811wpCQ4ZQfP20a02ilIQF/LBcyG1ImoTNFt7JL
 Xc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HIUbFBaGFs+zDNCwEeYpcXbfIO6Aj85k50HldrkBzn4=;
 b=DoGd973mRjcjyCBWtrIitUL4hPjQRYHkdVK+8VOuqLWP+5wRh6fI2LaRUzsCVKa6wD
 7s/Y8FryXaKg5jBrjMpy+53qdPk5jzckEIN+5CXfcGazx3lZYH36rJWsIvPkE4ar9Sdf
 Rp4oJBEEggAfStgowLeh2VznZnMo1iCbM5K0rUAZFw/7L1zxj83uQ5/XLIjoUUI6Rz7v
 CrAQ6miTlPGJT18S3R0m/zRM9nN83SPgMm+fbRZ4bWnVe9OPM5slJKZGNzi5cm4X3L/q
 ivN3UDpsKXT0a8Ihgv3La4LImjrY/KbhY92dhgIsEQ6SOCUB9VOMmAwDGzxEDaGRfXRk
 9T/w==
X-Gm-Message-State: AOAM533PR7XoQr4yrN+r1geHWGMDqYZ9lNtjpaxSaIUAK7dGiFEFKrpD
 RL2bFSa4QC07121sa3WF9Qk=
X-Received: by 2002:a1c:2d85:: with SMTP id t127mr3302101wmt.22.1601650537845; 
 Fri, 02 Oct 2020 07:55:37 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id q13sm2056241wra.93.2020.10.02.07.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:55:37 -0700 (PDT)
Subject: Re: [PATCH 11/14] hw/misc/bcm2835_cprman: add the DSI0HSCK multiplexer
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20200925101731.2159827-1-luc@lmichel.fr>
 <20200925101731.2159827-12-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ab123333-fd8b-9334-f70d-501bc2a4fbf0@amsat.org>
Date: Fri, 2 Oct 2020 16:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925101731.2159827-12-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A1heyfLJh73Q

On 9/25/20 12:17 PM, Luc Michel wrote:
> This simple mux sits between the PLL channels and the DSI0E and DSI0P
> clock muxes. This mux selects between PLLA-DSI0 and PLLD-DSI0 channel
> and outputs the selected signal to source number 4 of DSI0E/P clock
> muxes. It is controlled by the cm_dsi0hsck register.
> 
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>  include/hw/misc/bcm2835_cprman.h           | 15 +++++
>  include/hw/misc/bcm2835_cprman_internals.h |  6 ++
>  hw/misc/bcm2835_cprman.c                   | 78 +++++++++++++++++++++-
>  3 files changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
> index c2a89e8e90..5555a299fc 100644
> --- a/include/hw/misc/bcm2835_cprman.h
> +++ b/include/hw/misc/bcm2835_cprman.h
> @@ -171,20 +171,35 @@ typedef struct CprmanClockMuxState {
>       * source number.
>       */
>      struct CprmanClockMuxState *backref[CPRMAN_NUM_CLOCK_MUX_SRC];
>  } CprmanClockMuxState;
>  
> +typedef struct CprmanDsi0HsckMuxState {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    CprmanClockMux id;
> +
> +    uint32_t *reg_cm;
> +
> +    Clock *plla_in;
> +    Clock *plld_in;
> +    Clock *out;
> +} CprmanDsi0HsckMuxState;
> +
>  struct BCM2835CprmanState {
>      /*< private >*/
>      SysBusDevice parent_obj;
>  
>      /*< public >*/
>      MemoryRegion iomem;
>  
>      CprmanPLLState plls[CPRMAN_NUM_PLL];
>      CprmanPLLChannelState channels[CPRMAN_NUM_PLL_CHANNEL];
>      CprmanClockMuxState clock_muxes[CPRMAN_NUM_CLOCK_MUX];
> +    CprmanDsi0HsckMuxState dsi0hsck_mux;
>  
>      uint32_t regs[CPRMAN_NUM_REGS];
>      uint32_t xosc_freq;
>  
>      Clock *xosc;
> diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
> index a2b5a1aa50..ad07cf5276 100644
> --- a/include/hw/misc/bcm2835_cprman_internals.h
> +++ b/include/hw/misc/bcm2835_cprman_internals.h
> @@ -13,17 +13,20 @@
>  #include "hw/misc/bcm2835_cprman.h"
>  
>  #define TYPE_CPRMAN_PLL "bcm2835-cprman-pll"
>  #define TYPE_CPRMAN_PLL_CHANNEL "bcm2835-cprman-pll-channel"
>  #define TYPE_CPRMAN_CLOCK_MUX "bcm2835-cprman-clock-mux"
> +#define TYPE_CPRMAN_DSI0HSCK_MUX "bcm2835-cprman-dsi0hsck-mux"
>  
>  DECLARE_INSTANCE_CHECKER(CprmanPLLState, CPRMAN_PLL,
>                           TYPE_CPRMAN_PLL)
>  DECLARE_INSTANCE_CHECKER(CprmanPLLChannelState, CPRMAN_PLL_CHANNEL,
>                           TYPE_CPRMAN_PLL_CHANNEL)
>  DECLARE_INSTANCE_CHECKER(CprmanClockMuxState, CPRMAN_CLOCK_MUX,
>                           TYPE_CPRMAN_CLOCK_MUX)
> +DECLARE_INSTANCE_CHECKER(CprmanDsi0HsckMuxState, CPRMAN_DSI0HSCK_MUX,
> +                         TYPE_CPRMAN_DSI0HSCK_MUX)
>  
>  /* Register map */
>  
>  /* PLLs */
>  REG32(CM_PLLA, 0x104)
> @@ -221,10 +224,13 @@ REG32(CM_LOCK, 0x114)
>      FIELD(CM_LOCK, FLOCKD, 11, 1)
>      FIELD(CM_LOCK, FLOCKC, 10, 1)
>      FIELD(CM_LOCK, FLOCKB, 9, 1)
>      FIELD(CM_LOCK, FLOCKA, 8, 1)
>  
> +REG32(CM_DSI0HSCK, 0x120)
> +    FIELD(CM_DSI0HSCK, SELPLLD, 0, 1)
> +
>  /*
>   * This field is common to all registers. Each register write value must match
>   * the CPRMAN_PASSWORD magic value in its 8 MSB.
>   */
>  FIELD(CPRMAN, PASSWORD, 24, 8)
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 75bc11939b..e576ab2642 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -327,10 +327,62 @@ static const TypeInfo cprman_clock_mux_info = {
>      .class_init = clock_mux_class_init,
>      .instance_init = clock_mux_init,
>  };
>  
>  
> +/* DSI0HSCK mux */
> +
> +static void dsi0hsck_mux_update(CprmanDsi0HsckMuxState *s)
> +{
> +    bool src_is_plld = FIELD_EX32(*s->reg_cm, CM_DSI0HSCK, SELPLLD);
> +    Clock *src = src_is_plld ? s->plld_in : s->plla_in;
> +
> +    clock_update(s->out, clock_get(src));
> +}
> +
> +static void dsi0hsck_mux_in_update(void *opaque)
> +{
> +    dsi0hsck_mux_update(CPRMAN_DSI0HSCK_MUX(opaque));
> +}
> +
> +static void dsi0hsck_mux_init(Object *obj)
> +{
> +    CprmanDsi0HsckMuxState *s = CPRMAN_DSI0HSCK_MUX(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    s->plla_in = qdev_init_clock_in(dev, "plla-in", dsi0hsck_mux_in_update, s);
> +    s->plld_in = qdev_init_clock_in(dev, "plld-in", dsi0hsck_mux_in_update, s);
> +    s->out = qdev_init_clock_out(DEVICE(s), "out");
> +}
> +
> +static const VMStateDescription dsi0hsck_mux_vmstate = {
> +    .name = TYPE_CPRMAN_DSI0HSCK_MUX,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(plla_in, CprmanDsi0HsckMuxState),
> +        VMSTATE_CLOCK(plld_in, CprmanDsi0HsckMuxState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void dsi0hsck_mux_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &dsi0hsck_mux_vmstate;
> +}
> +
> +static const TypeInfo cprman_dsi0hsck_mux_info = {
> +    .name = TYPE_CPRMAN_DSI0HSCK_MUX,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(CprmanDsi0HsckMuxState),
> +    .class_init = dsi0hsck_mux_class_init,
> +    .instance_init = dsi0hsck_mux_init,
> +};
> +
> +
>  /* CPRMAN "top level" model */
>  
>  static uint32_t get_cm_lock(const BCM2835CprmanState *s)
>  {
>      static const int CM_LOCK_MAPPING[] = {
> @@ -488,10 +540,14 @@ static void cprman_write(void *opaque, hwaddr offset,
>      case R_CM_SDCCTL ... R_CM_ARMCTL:
>      case R_CM_AVEOCTL ... R_CM_EMMCDIV:
>      case R_CM_EMMC2CTL ... R_CM_EMMC2DIV:
>          update_mux_from_cm(s, idx);
>          break;
> +
> +    case R_CM_DSI0HSCK:
> +        dsi0hsck_mux_update(&s->dsi0hsck_mux);
> +        break;
>      }
>  }
>  
>  #undef CASE_PLL_A2W_REGS
>  
> @@ -519,10 +575,12 @@ static void cprman_reset(DeviceState *dev)
>  
>      for (i = 0; i < CPRMAN_NUM_PLL_CHANNEL; i++) {
>          device_cold_reset(DEVICE(&s->channels[i]));
>      }
>  
> +    device_cold_reset(DEVICE(&s->dsi0hsck_mux));
> +
>      for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>          device_cold_reset(DEVICE(&s->clock_muxes[i]));
>      }
>  
>      clock_update_hz(s->xosc, s->xosc_freq);
> @@ -560,10 +618,14 @@ static void cprman_init(Object *obj)
>                                  &s->channels[i],
>                                  TYPE_CPRMAN_PLL_CHANNEL);
>          set_pll_channel_init_info(s, &s->channels[i], i);
>      }
>  
> +    object_initialize_child(obj, "dsi0hsck-mux",
> +                            &s->dsi0hsck_mux, TYPE_CPRMAN_DSI0HSCK_MUX);
> +    s->dsi0hsck_mux.reg_cm = &s->regs[R_CM_DSI0HSCK];
> +
>      for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>          char *alias;
>  
>          object_initialize_child(obj, CLOCK_MUX_INIT_INFO[i].name,
>                                  &s->clock_muxes[i],
> @@ -608,11 +670,11 @@ static void connect_mux_sources(BCM2835CprmanState *s,
>          Clock *src;
>  
>          if (mapping == CPRMAN_CLOCK_SRC_FORCE_GROUND) {
>              src = s->gnd;
>          } else if (mapping == CPRMAN_CLOCK_SRC_DSI0HSCK) {
> -            src = s->gnd; /* TODO */
> +            src = s->dsi0hsck_mux.out;
>          } else if (i < CPRMAN_CLOCK_SRC_PLLA) {
>              src = CLK_SRC_MAPPING[i];
>          } else {
>              src = s->channels[mapping].out;
>          }
> @@ -646,10 +708,23 @@ static void cprman_realize(DeviceState *dev, Error **errp)
>          if (!qdev_realize(DEVICE(channel), NULL, errp)) {
>              return;
>          }
>      }
>  
> +    {
> +        CprmanDsi0HsckMuxState *dsi0hsck_mux = &s->dsi0hsck_mux;

Why use a new block?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +        clock_set_source(dsi0hsck_mux->plla_in,
> +                         s->channels[CPRMAN_PLLA_CHANNEL_DSI0].out);
> +        clock_set_source(dsi0hsck_mux->plld_in,
> +                         s->channels[CPRMAN_PLLD_CHANNEL_DSI0].out);
> +
> +        if (!qdev_realize(DEVICE(dsi0hsck_mux), NULL, errp)) {
> +            return;
> +        }
> +    }
> +
>      for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>          CprmanClockMuxState *clock_mux = &s->clock_muxes[i];
>  
>          connect_mux_sources(s, clock_mux, CLOCK_MUX_INIT_INFO[i].src_mapping);
>  
> @@ -696,8 +771,9 @@ static void cprman_register_types(void)
>  {
>      type_register_static(&cprman_info);
>      type_register_static(&cprman_pll_info);
>      type_register_static(&cprman_pll_channel_info);
>      type_register_static(&cprman_clock_mux_info);
> +    type_register_static(&cprman_dsi0hsck_mux_info);
>  }
>  
>  type_init(cprman_register_types);
> 
