Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5633341wrt;
        Tue, 2 Oct 2018 16:27:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61YkknevH96yFE7GENmhEWtPSjMksF6lVQKFREzV+7xhEwygh9GgiySioD8vGP3VT+qK/eb
X-Received: by 2002:ac8:70c5:: with SMTP id g5-v6mr3615767qtp.271.1538522825218;
        Tue, 02 Oct 2018 16:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538522825; cv=none;
        d=google.com; s=arc-20160816;
        b=0gulvjDk9ddUXjFKt6M1HDfJHjONmoiG+e7/CIQfOT4JcIXJLX3hTdtJ+FJPGaVEEQ
         Xfoh2ibmJ6FkFQg90lWFnCC4xSdWHPYKrWLrvOD+/bAzg6gwK9rCWGkhdTQa1X4Q/030
         koAATVIz67qjirzpfdHb/s77aKiauwzwhzpq8OaE9OOY3IADs7W/ajvxNgoypKrgh5j+
         TeyMJlqDGqy8dReR+EFjJBYzfvSWILMm9Dby7ukKnQBSSiT4e16hQ45P5YyfBe+NBYwB
         pXv8NouLmlsPDskXtsRWcEqLTe3xWYi9lM30fhppW2pE+6Wgfy4/PDQfuBTt+9SZC2QK
         jv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9BbPQzf05oD7M8/jik0dX/xwP2kXleJMbOJLPfIpeEE=;
        b=A33yBfPYc8cTMgkFjVVFR7TF6bR3R10tP9IpOR7hJCNy7EyQ8L9RC3whEyhPxNpPdg
         umtcb1rCIUiHDjDDBFX2fwJl91s5P49cGPUSrohnVS3JXZp+ut1++lQSyux3wfLqUr2j
         Fk35UbLL0QYtg//aPAfrv65xbFhd4TFCJDl+aXJklvGBFRmEzb5csIWqDAJWcv4b888O
         Z3UUv7Hsv/XbmCkyFmspcSfA5jbqe+7LP7lwAXGP30zyhgHSd/ntHQJJIm+1pnW7nMwR
         /IncPyxxIqm2mW+SBioqN3k5zjhmbfvYvHozahyfdtPkCKf03zzPvTXCIaEugAyDzDLB
         Y2DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si3282162qvo.77.2018.10.02.16.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 16:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7U4G-0001Op-MR
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 19:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7U44-0001Nf-TT
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 19:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7U40-0006FR-OU
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 19:26:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7U40-0006Dt-G5
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 19:26:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id 185-v6so3786007wmt.2
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 16:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9BbPQzf05oD7M8/jik0dX/xwP2kXleJMbOJLPfIpeEE=;
	b=JqnmebSSfoZDI+viv9M7qFMf5hMMrwj4AgdNu4ixI6kdbRJgrAS7s0lqTsNtNTuhfb
	u5461COE3avH+DnfaDCZh6atSsCwmljXYdA94b45KKN1vTzXBlnd86V3nYEJyMxY8CcB
	C07hzSfsZzvjfgO6ceL9x0TvvClo5Jz1Uv21pMcGTqp/Lq3F3Z9oAtHZsy1F1//hgYMO
	Zl7u/Z1jJzWWlL4/eBNVyWwtwWTa47f+3MEoRbbVQaf5Gz3CwE58CQPKoR21j4DJktcc
	Lm5n/4gGkHBjmqtdYvFb97ZRcXY4XdJdvG3Z0R1aFhGFwbEnEHyh+bIZHps5PLpVzORg
	jByA==
X-Gm-Message-State: ABuFfohemRzPB3D0qTF4TLHf4u57W2ZV1Pml29hAi83/KI2d44iLvrPe
	6Av6AwpunwFLLFNAvoU4uFuuIA==
X-Received: by 2002:a1c:84cd:: with SMTP id
	g196-v6mr3157752wmd.38.1538522807258; 
	Tue, 02 Oct 2018 16:26:47 -0700 (PDT)
Received: from [192.168.2.51] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	b139-v6sm24042414wmd.36.2018.10.02.16.26.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 16:26:46 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3814fb09-5be7-834a-72a8-80f2f6dc005d@redhat.com>
Date: Wed, 3 Oct 2018 01:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-9-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 8/9] hw/char/cadence_uart:
 add clock support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lX4BElMOuL4B

Hi Damien,

On 10/2/18 4:24 PM, Damien Hedde wrote:
> Add bus interface and uart reference clock inputs.
> 
> Note: it is hard to find out from the doc what is the behavior when only one
> of the clock is disabled.
> 
> The implemented behaviour is that register access needs both clock being active.
> 
> The bus interface control the mmios visibility

This sentence sounds odd.

> 
> The reference clock controls the baudrate generation. If it disabled,
> any input characters and events are ignored. Also register accesses are
> conditioned to the clock being enabled (but is it really the case in
> reality ?) and a guest error is triggerred if that is not the case.
> 
> If theses clocks remains unconnected, the uart behaves as before
> (default to 50MHz ref clock).
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  include/hw/char/cadence_uart.h |  3 ++
>  hw/char/cadence_uart.c         | 92 ++++++++++++++++++++++++++++++++--
>  hw/char/trace-events           |  3 ++
>  3 files changed, 93 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
> index 118e3f10de..fd1d4725f4 100644
> --- a/include/hw/char/cadence_uart.h
> +++ b/include/hw/char/cadence_uart.h
> @@ -21,6 +21,7 @@
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
>  #include "qemu/timer.h"
> +#include "hw/clock-port.h"
>  
>  #define CADENCE_UART_RX_FIFO_SIZE           16
>  #define CADENCE_UART_TX_FIFO_SIZE           16
> @@ -47,6 +48,8 @@ typedef struct {
>      CharBackend chr;
>      qemu_irq irq;
>      QEMUTimer *fifo_trigger_handle;
> +    ClockIn *refclk;
> +    ClockIn *busclk;
>  } CadenceUARTState;
>  
>  static inline DeviceState *cadence_uart_create(hwaddr addr,
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fbdbd463bb..feb5cee4d7 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -28,6 +28,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "hw/char/cadence_uart.h"
> +#include "trace.h"
>  
>  #ifdef CADENCE_UART_ERR_DEBUG
>  #define DB_PRINT(...) do { \
> @@ -94,7 +95,7 @@
>  #define LOCAL_LOOPBACK         (0x2 << UART_MR_CHMODE_SH)
>  #define REMOTE_LOOPBACK        (0x3 << UART_MR_CHMODE_SH)
>  
> -#define UART_INPUT_CLK         50000000
> +#define UART_DEFAULT_REF_CLK (50 * 1000 * 1000)
>  
>  #define R_CR       (0x00/4)
>  #define R_MR       (0x04/4)
> @@ -165,15 +166,30 @@ static void uart_send_breaks(CadenceUARTState *s)
>                        &break_enabled);
>  }
>  
> +static unsigned int uart_input_clk(CadenceUARTState *s)
> +{
> +    return clock_get_frequency(s->refclk);
> +}
> +
>  static void uart_parameters_setup(CadenceUARTState *s)
>  {
>      QEMUSerialSetParams ssp;
>      unsigned int baud_rate, packet_size;
>  
>      baud_rate = (s->r[R_MR] & UART_MR_CLKS) ?
> -            UART_INPUT_CLK / 8 : UART_INPUT_CLK;
> +            uart_input_clk(s) / 8 : uart_input_clk(s);
> +    baud_rate /= (s->r[R_BRGR] * (s->r[R_BDIV] + 1));

Safe because s->r[R_BRGR] >= 1, OK.

> +    trace_cadence_uart_baudrate(baud_rate);
> +
> +    ssp.speed = baud_rate;
> +    if (ssp.speed == 0) {
> +        /*
> +         * Avoid division-by-zero below.
> +         * TODO: find something better
> +         */
> +        ssp.speed = 1;
> +    }
>  
> -    ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
>      packet_size = 1;
>  
>      switch (s->r[R_MR] & UART_MR_PAR) {
> @@ -337,6 +353,11 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> +    /* ignore characters when unclocked */
> +    if (!clock_is_enabled(s->refclk)) {
> +        return;
> +    }
> +
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> @@ -350,6 +371,11 @@ static void uart_event(void *opaque, int event)
>      CadenceUARTState *s = opaque;
>      uint8_t buf = '\0';
>  
> +    /* ignore events when unclocked */
> +    if (!clock_is_enabled(s->refclk)) {
> +        return;
> +    }
> +
>      if (event == CHR_EVENT_BREAK) {
>          uart_write_rx_fifo(opaque, &buf, 1);
>      }
> @@ -382,6 +408,14 @@ static void uart_write(void *opaque, hwaddr offset,
>  {
>      CadenceUARTState *s = opaque;
>  
> +    /* ignore accesses when bus or ref clock is disabled */
> +    if (!(clock_is_enabled(s->busclk) && clock_is_enabled(s->refclk))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "cadence_uart: Trying to write register 0x%x"
> +                " while clock is disabled\n", (unsigned) offset);
> +        return;
> +    }
> +
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> @@ -440,6 +474,14 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>  
> +    /* ignore accesses when bus or ref clock is disabled */
> +    if (!(clock_is_enabled(s->busclk) && clock_is_enabled(s->refclk))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "cadence_uart: Trying to read register 0x%x"
> +                " while clock is disabled\n", (unsigned) offset);
> +        return 0;
> +    }
> +
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
>          c = 0;
> @@ -488,6 +530,14 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
>                               uart_event, NULL, s, NULL, true);
>  }
>  
> +static void cadence_uart_refclk_update(void *opaque)
> +{
> +    CadenceUARTState *s = opaque;
> +
> +    /* recompute uart's speed on clock change */
> +    uart_parameters_setup(s);
> +}
> +
>  static void cadence_uart_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -497,9 +547,26 @@ static void cadence_uart_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>  
> +    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
> +            cadence_uart_refclk_update, s);
> +    /* initialize the frequency in case the clock remains unconnected */
> +    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
> +    s->busclk = qdev_init_clock_in(DEVICE(obj), "busclk", NULL, NULL);
> +    /* initialize the frequency to non-zero in case it remains unconnected */
> +    clock_init_frequency(s->busclk, 100 * 1000 * 1000);

#define INPUT_BUS_CLK_FREQUENCY (100 * 1000 * 1000)

> +
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
>  }
>  
> +static int cadence_uart_pre_load(void *opaque)
> +{
> +    CadenceUARTState *s = opaque;
> +
> +    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
> +    clock_init_frequency(s->busclk, 100 * 1000 * 1000);

INPUT_BUS_CLK_FREQUENCY

> +    return 0;
> +}
> +
>  static int cadence_uart_post_load(void *opaque, int version_id)
>  {
>      CadenceUARTState *s = opaque;
> @@ -516,10 +583,22 @@ static int cadence_uart_post_load(void *opaque, int version_id)
>      return 0;
>  }
>  
> +static const VMStateDescription vmstate_cadence_uart_clocks = {
> +    .name = "cadence_uart_clocks",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCKIN(refclk, CadenceUARTState),
> +        VMSTATE_CLOCKIN(busclk, CadenceUARTState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_cadence_uart = {
>      .name = "cadence_uart",
>      .version_id = 2,
>      .minimum_version_id = 2,
> +    .pre_load = cadence_uart_pre_load,
>      .post_load = cadence_uart_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX),
> @@ -532,7 +611,10 @@ static const VMStateDescription vmstate_cadence_uart = {
>          VMSTATE_UINT32(rx_wpos, CadenceUARTState),
>          VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
>          VMSTATE_END_OF_LIST()
> -    }
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_cadence_uart_clocks,
> +    },
>  };
>  
>  static Property cadence_uart_properties[] = {
> @@ -548,7 +630,7 @@ static void cadence_uart_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_cadence_uart;
>      dc->reset = cadence_uart_reset;
>      dc->props = cadence_uart_properties;
> -  }
> +}
>  
>  static const TypeInfo cadence_uart_info = {
>      .name          = TYPE_CADENCE_UART,
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index b64213d4dd..2ea25d1ea1 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -73,3 +73,6 @@ cmsdk_apb_uart_receive(uint8_t c) "CMSDK APB UART: got character 0x%x from backe
>  cmsdk_apb_uart_tx_pending(void) "CMSDK APB UART: character send to backend pending"
>  cmsdk_apb_uart_tx(uint8_t c) "CMSDK APB UART: character 0x%x sent to backend"
>  cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8N1"
> +
> +# hw/char/cadence_uart.c
> +cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Except migration:
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
