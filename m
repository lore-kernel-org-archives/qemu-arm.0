Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp819973wrt;
        Fri, 12 Oct 2018 06:43:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61nWSHJ4HRJ5mQ+avKv6qi0Yv1V4OMBKXyP8CCWpbodFl0b+14GUodJ5Ezcanpp9KuPtZor
X-Received: by 2002:a37:284c:: with SMTP id o73-v6mr5904398qkh.333.1539351788461;
        Fri, 12 Oct 2018 06:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539351788; cv=none;
        d=google.com; s=arc-20160816;
        b=LdA5fARPvWDcUQu8R9v2IciD4C1ijpMuM5lLcyj0wdDJrjNTqgLuG6UW5kjrB7mQRV
         zDZdy8EXUOW5mhvPPb9b9RI6BoGIsG5nmWB/kndPQ8XtO4Srse/j6TEKBGlc3IvrlqVZ
         87mnVwMHWoB63F32c6yN2ElP6XzVrIRqkIGwFb/+SiMgomAYCX5pwf9635O1+sDlHOCl
         PVO082gSWyjPA796y+33qWw9qD9lB2KFfKa61VQjMIDqodIiDjrKOcTwjWKoQz2pgkDg
         QyYni1epvdKqSLZe6oz9rlac2xMP2OLAyVQDnVBrrRng5vr86X4WGwioL5n3JV1Em1a+
         fd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=QqjyNVMPoGeSochJk+rZWgtoO+h+iLOKLqhvQRZMBms=;
        b=T2Bovf2a130ixixmMDNvBabuie25vPUnLyBHo1c3ZotAayIEVYRQ5O5E599Ifj11C9
         YP0TMpGzhnAAXfn8QwbyWhqdHTb9JsBNcZfIIVXzVYhIuUM4KyhKQaxuVa6jcy1dPbG3
         B9Y+fBlincvUau5xXCWPc0J4Jo4mHv8zg2Y0LXxLnFDGndzWA7lGQ3oqFGny2gka5ojh
         dYmnvpWMmuI54OXvSoT9zIAKl3kRHTz4KUOBVRs8qgMu4YZVLSOR6/EhmfbG3L6koTFu
         Ku757kb5ucfCNgWrqEKHzgHiRsXnNzLYleB4y3nsEGYCnZs5skU9bQKkD87XUIF94CGh
         j02w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D2YTZWkC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FC+kcWZQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FC+kcWZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t61-v6si1063559qtd.192.2018.10.12.06.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 06:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D2YTZWkC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FC+kcWZQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FC+kcWZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAxid-0003Y9-W0
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 09:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAxiR-0003Y0-OY
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 09:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAxiO-0004e7-Em
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 09:42:55 -0400
Received: from greensocs.com ([193.104.36.180]:45104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1gAxiN-0004Xp-F1; Fri, 12 Oct 2018 09:42:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C1D866FD8A;
	Fri, 12 Oct 2018 15:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539351759;
	bh=PB75lIx8FvZ5D57GWJgZFG6yVkECeEZlqg0GB2znt4o=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=D2YTZWkCGIEj/m84s4FGhvEqA6uLQoJ1PJ+v1+wjuWDNnCYbqBEXoSEgwfM9aNZsb
	MaXXvfSINA3QpKwQV5BnoaCKJy27otq4IJ+OfH0kKuzjcEqXRm28sAyW7m6+0TMNq8
	sd/9NRpJ3ajUsjuguCtesajFselgc5WZUFn5AbmY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FC+kcWZQ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FC+kcWZQ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ago5nri4mQLO; Fri, 12 Oct 2018 15:42:37 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id ED5E56FD8F; Fri, 12 Oct 2018 15:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539351756;
	bh=PB75lIx8FvZ5D57GWJgZFG6yVkECeEZlqg0GB2znt4o=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=FC+kcWZQDQoASA0HV/C4tl/yeT8vbMPAVtdI+mbCVgswaX5FDuxSBbIBuepLu0foW
	fp14OnVE9SgxtTCTw4M32c+7vkmr5/vPh9SmyB/RmGLL67Ql5uVzirSQhQq9gz7fe2
	ZN8wlPqnm8hTncVoDc2bOE+M8fbbaIB3kglSwKug=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8747B6FD8A;
	Fri, 12 Oct 2018 15:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539351756;
	bh=PB75lIx8FvZ5D57GWJgZFG6yVkECeEZlqg0GB2znt4o=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=FC+kcWZQDQoASA0HV/C4tl/yeT8vbMPAVtdI+mbCVgswaX5FDuxSBbIBuepLu0foW
	fp14OnVE9SgxtTCTw4M32c+7vkmr5/vPh9SmyB/RmGLL67Ql5uVzirSQhQq9gz7fe2
	ZN8wlPqnm8hTncVoDc2bOE+M8fbbaIB3kglSwKug=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-9-damien.hedde@greensocs.com>
	<3814fb09-5be7-834a-72a8-80f2f6dc005d@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <c0ca47a2-2b7e-c30a-606a-0405b86a3dd8@greensocs.com>
Date: Fri, 12 Oct 2018 15:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <3814fb09-5be7-834a-72a8-80f2f6dc005d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
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
X-TUID: 33pqdm6kOg8f


Hi Philippe,

On 10/3/18 1:26 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Damien,
>=20
> On 10/2/18 4:24 PM, Damien Hedde wrote:
>> Add bus interface and uart reference clock inputs.
>>
>> Note: it is hard to find out from the doc what is the behavior when on=
ly one
>> of the clock is disabled.
>>
>> The implemented behaviour is that register access needs both clock bei=
ng active.
>>
>> The bus interface control the mmios visibility
>=20
> This sentence sounds odd.

Indeed, and also outdated.
I removed the part switching on/off the mmio visibility according to the
bus clock : accesses were silently ignored in that case, which would
probably have made some user mad at some point.
I replaced it by a check on every access and a LOG_GUEST_ERROR in case
the access is dropped.

>=20
>>
>> The reference clock controls the baudrate generation. If it disabled,
>> any input characters and events are ignored. Also register accesses ar=
e
>> conditioned to the clock being enabled (but is it really the case in
>> reality ?) and a guest error is triggerred if that is not the case.
>>
>> If theses clocks remains unconnected, the uart behaves as before
>> (default to 50MHz ref clock).
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  include/hw/char/cadence_uart.h |  3 ++
>>  hw/char/cadence_uart.c         | 92 ++++++++++++++++++++++++++++++++-=
-
>>  hw/char/trace-events           |  3 ++
>>  3 files changed, 93 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_=
uart.h
>> index 118e3f10de..fd1d4725f4 100644
>> --- a/include/hw/char/cadence_uart.h
>> +++ b/include/hw/char/cadence_uart.h
>> @@ -21,6 +21,7 @@
>>  #include "hw/sysbus.h"
>>  #include "chardev/char-fe.h"
>>  #include "qemu/timer.h"
>> +#include "hw/clock-port.h"
>> =20
>>  #define CADENCE_UART_RX_FIFO_SIZE           16
>>  #define CADENCE_UART_TX_FIFO_SIZE           16
>> @@ -47,6 +48,8 @@ typedef struct {
>>      CharBackend chr;
>>      qemu_irq irq;
>>      QEMUTimer *fifo_trigger_handle;
>> +    ClockIn *refclk;
>> +    ClockIn *busclk;
>>  } CadenceUARTState;
>> =20
>>  static inline DeviceState *cadence_uart_create(hwaddr addr,
>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> index fbdbd463bb..feb5cee4d7 100644
>> --- a/hw/char/cadence_uart.c
>> +++ b/hw/char/cadence_uart.c
>> @@ -28,6 +28,7 @@
>>  #include "qemu/timer.h"
>>  #include "qemu/log.h"
>>  #include "hw/char/cadence_uart.h"
>> +#include "trace.h"
>> =20
>>  #ifdef CADENCE_UART_ERR_DEBUG
>>  #define DB_PRINT(...) do { \
>> @@ -94,7 +95,7 @@
>>  #define LOCAL_LOOPBACK         (0x2 << UART_MR_CHMODE_SH)
>>  #define REMOTE_LOOPBACK        (0x3 << UART_MR_CHMODE_SH)
>> =20
>> -#define UART_INPUT_CLK         50000000
>> +#define UART_DEFAULT_REF_CLK (50 * 1000 * 1000)
>> =20
>>  #define R_CR       (0x00/4)
>>  #define R_MR       (0x04/4)
>> @@ -165,15 +166,30 @@ static void uart_send_breaks(CadenceUARTState *s=
)
>>                        &break_enabled);
>>  }
>> =20
>> +static unsigned int uart_input_clk(CadenceUARTState *s)
>> +{
>> +    return clock_get_frequency(s->refclk);
>> +}
>> +
>>  static void uart_parameters_setup(CadenceUARTState *s)
>>  {
>>      QEMUSerialSetParams ssp;
>>      unsigned int baud_rate, packet_size;
>> =20
>>      baud_rate =3D (s->r[R_MR] & UART_MR_CLKS) ?
>> -            UART_INPUT_CLK / 8 : UART_INPUT_CLK;
>> +            uart_input_clk(s) / 8 : uart_input_clk(s);
>> +    baud_rate /=3D (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
>=20
> Safe because s->r[R_BRGR] >=3D 1, OK.
>=20
>> +    trace_cadence_uart_baudrate(baud_rate);
>> +
>> +    ssp.speed =3D baud_rate;
>> +    if (ssp.speed =3D=3D 0) {
>> +        /*
>> +         * Avoid division-by-zero below.
>> +         * TODO: find something better
>> +         */
>> +        ssp.speed =3D 1;
>> +    }
>> =20
>> -    ssp.speed =3D baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
>>      packet_size =3D 1;
>> =20
>>      switch (s->r[R_MR] & UART_MR_PAR) {
>> @@ -337,6 +353,11 @@ static void uart_receive(void *opaque, const uint=
8_t *buf, int size)
>>      CadenceUARTState *s =3D opaque;
>>      uint32_t ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
>> =20
>> +    /* ignore characters when unclocked */
>> +    if (!clock_is_enabled(s->refclk)) {
>> +        return;
>> +    }
>> +
>>      if (ch_mode =3D=3D NORMAL_MODE || ch_mode =3D=3D ECHO_MODE) {
>>          uart_write_rx_fifo(opaque, buf, size);
>>      }
>> @@ -350,6 +371,11 @@ static void uart_event(void *opaque, int event)
>>      CadenceUARTState *s =3D opaque;
>>      uint8_t buf =3D '\0';
>> =20
>> +    /* ignore events when unclocked */
>> +    if (!clock_is_enabled(s->refclk)) {
>> +        return;
>> +    }
>> +
>>      if (event =3D=3D CHR_EVENT_BREAK) {
>>          uart_write_rx_fifo(opaque, &buf, 1);
>>      }
>> @@ -382,6 +408,14 @@ static void uart_write(void *opaque, hwaddr offse=
t,
>>  {
>>      CadenceUARTState *s =3D opaque;
>> =20
>> +    /* ignore accesses when bus or ref clock is disabled */
>> +    if (!(clock_is_enabled(s->busclk) && clock_is_enabled(s->refclk))=
) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                "cadence_uart: Trying to write register 0x%x"
>> +                " while clock is disabled\n", (unsigned) offset);
>> +        return;
>> +    }
>> +
>>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)va=
lue);
>>      offset >>=3D 2;
>>      if (offset >=3D CADENCE_UART_R_MAX) {
>> @@ -440,6 +474,14 @@ static uint64_t uart_read(void *opaque, hwaddr of=
fset,
>>      CadenceUARTState *s =3D opaque;
>>      uint32_t c =3D 0;
>> =20
>> +    /* ignore accesses when bus or ref clock is disabled */
>> +    if (!(clock_is_enabled(s->busclk) && clock_is_enabled(s->refclk))=
) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                "cadence_uart: Trying to read register 0x%x"
>> +                " while clock is disabled\n", (unsigned) offset);
>> +        return 0;
>> +    }
>> +
>>      offset >>=3D 2;
>>      if (offset >=3D CADENCE_UART_R_MAX) {
>>          c =3D 0;
>> @@ -488,6 +530,14 @@ static void cadence_uart_realize(DeviceState *dev=
, Error **errp)
>>                               uart_event, NULL, s, NULL, true);
>>  }
>> =20
>> +static void cadence_uart_refclk_update(void *opaque)
>> +{
>> +    CadenceUARTState *s =3D opaque;
>> +
>> +    /* recompute uart's speed on clock change */
>> +    uart_parameters_setup(s);
>> +}
>> +
>>  static void cadence_uart_init(Object *obj)
>>  {
>>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>> @@ -497,9 +547,26 @@ static void cadence_uart_init(Object *obj)
>>      sysbus_init_mmio(sbd, &s->iomem);
>>      sysbus_init_irq(sbd, &s->irq);
>> =20
>> +    s->refclk =3D qdev_init_clock_in(DEVICE(obj), "refclk",
>> +            cadence_uart_refclk_update, s);
>> +    /* initialize the frequency in case the clock remains unconnected=
 */
>> +    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
>> +    s->busclk =3D qdev_init_clock_in(DEVICE(obj), "busclk", NULL, NUL=
L);
>> +    /* initialize the frequency to non-zero in case it remains unconn=
ected */
>> +    clock_init_frequency(s->busclk, 100 * 1000 * 1000);
>=20
> #define INPUT_BUS_CLK_FREQUENCY (100 * 1000 * 1000)
>=20
>> +
>>      s->char_tx_time =3D (NANOSECONDS_PER_SECOND / 9600) * 10;
>>  }
>> =20
>> +static int cadence_uart_pre_load(void *opaque)
>> +{
>> +    CadenceUARTState *s =3D opaque;
>> +
>> +    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
>> +    clock_init_frequency(s->busclk, 100 * 1000 * 1000);
>=20
> INPUT_BUS_CLK_FREQUENCY
>=20
>> +    return 0;
>> +}
>> +
>>  static int cadence_uart_post_load(void *opaque, int version_id)
>>  {
>>      CadenceUARTState *s =3D opaque;
>> @@ -516,10 +583,22 @@ static int cadence_uart_post_load(void *opaque, =
int version_id)
>>      return 0;
>>  }
>> =20
>> +static const VMStateDescription vmstate_cadence_uart_clocks =3D {
>> +    .name =3D "cadence_uart_clocks",
>> +    .version_id =3D 0,
>> +    .minimum_version_id =3D 0,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_CLOCKIN(refclk, CadenceUARTState),
>> +        VMSTATE_CLOCKIN(busclk, CadenceUARTState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static const VMStateDescription vmstate_cadence_uart =3D {
>>      .name =3D "cadence_uart",
>>      .version_id =3D 2,
>>      .minimum_version_id =3D 2,
>> +    .pre_load =3D cadence_uart_pre_load,
>>      .post_load =3D cadence_uart_post_load,
>>      .fields =3D (VMStateField[]) {
>>          VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX)=
,
>> @@ -532,7 +611,10 @@ static const VMStateDescription vmstate_cadence_u=
art =3D {
>>          VMSTATE_UINT32(rx_wpos, CadenceUARTState),
>>          VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
>>          VMSTATE_END_OF_LIST()
>> -    }
>> +    },
>> +    .subsections =3D (const VMStateDescription * []) {
>> +        &vmstate_cadence_uart_clocks,
>> +    },
>>  };
>> =20
>>  static Property cadence_uart_properties[] =3D {
>> @@ -548,7 +630,7 @@ static void cadence_uart_class_init(ObjectClass *k=
lass, void *data)
>>      dc->vmsd =3D &vmstate_cadence_uart;
>>      dc->reset =3D cadence_uart_reset;
>>      dc->props =3D cadence_uart_properties;
>> -  }
>> +}
>> =20
>>  static const TypeInfo cadence_uart_info =3D {
>>      .name          =3D TYPE_CADENCE_UART,
>> diff --git a/hw/char/trace-events b/hw/char/trace-events
>> index b64213d4dd..2ea25d1ea1 100644
>> --- a/hw/char/trace-events
>> +++ b/hw/char/trace-events
>> @@ -73,3 +73,6 @@ cmsdk_apb_uart_receive(uint8_t c) "CMSDK APB UART: g=
ot character 0x%x from backe
>>  cmsdk_apb_uart_tx_pending(void) "CMSDK APB UART: character send to ba=
ckend pending"
>>  cmsdk_apb_uart_tx(uint8_t c) "CMSDK APB UART: character 0x%x sent to =
backend"
>>  cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %=
d 8N1"
>> +
>> +# hw/char/cadence_uart.c
>> +cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
>>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Except migration:
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
