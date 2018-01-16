Received: by 10.28.173.206 with SMTP id w197csp4561316wme;
        Tue, 16 Jan 2018 15:14:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBoukpkhBg8Jt+34T51qzzzgDiVrNvVNbCdtKc+cD5+YzJcP8b3LbgapH9fwR8CTcdqdeFYuV
X-Received: by 10.37.65.80 with SMTP id o77mr30348428yba.124.1516144450656;
        Tue, 16 Jan 2018 15:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516144450; cv=none;
        d=google.com; s=arc-20160816;
        b=kmFnr50DFDQRwWxYJtendIVFqp8Sk4SBoryCrOoaC2suKrsiY/kpzJRu3LeJ59W2Ea
         5pWmzVXoyyKHLSAIkyKPshJWCgm1fDdBQaBFCoix25LnKJXsGilTYMi85D4vBa+RjeIJ
         oElYpLxJ1Gxj3WYe/T2W8OBP4ZHFSV/19H2MNl/oS+43dhlyvvIAUWfNw/VU2I6Eajg2
         n9G10miSQ/DLzrjJvP52C9diGuHNZbgG66ujAr15TtLfVfpDivF3fI6tjzvoKaJent0J
         VXvyuQWmRoJi52eOia7j1alTMJ/5zMpCxuyVFtNXAxe7u3RUIlxgULO701Q4bMwe+CS4
         pJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Slq3occuL0zE4umOMGL/v657DJI/Vhk8A7yXltxBpWw=;
        b=Z1pzg664hLNh9716vl7Kpoiv1TuWWLqFFAJLO7FgdmR9ETEP/WUR/2Gu2z8RNKvQ6P
         xERV1J2UbwI1EjRv7Fkm4yWuFlaVzv8FOFBC0Na1dfL80ZToYzAK9M6qToY2Ldf0F4+b
         CTr6LAh3s6XP+p/Ge5q14MhcqUDaUFIhX2tg7kCI9hAH5Rf5HCkcZUAcuBdthfd4cHFr
         uiLBir8gWwro+9YxD+gq/Irh4/UQjdndy8MBafdHCs/osydGgZbXsiBzFHz+3CBkZihS
         oz8y6JRmh3ZyqH3+6FxzrHc4AqEATE5dUToY7b62FJcH0fdyTBcBfPMP5hh1zxzw79bj
         0+ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNP7arBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t142si768895ywe.197.2018.01.16.15.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNP7arBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebaQk-0006Ld-1x
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:14:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebaQa-0006Ih-8Y
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:14:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebaQY-0002Mx-OF
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:14:00 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:41550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ebaQV-0002K7-Ez; Tue, 16 Jan 2018 18:13:55 -0500
Received: by mail-lf0-x241.google.com with SMTP id h137so19511434lfe.8;
	Tue, 16 Jan 2018 15:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Slq3occuL0zE4umOMGL/v657DJI/Vhk8A7yXltxBpWw=;
	b=WNP7arBocRsgk91dthJ5fKPj0aag5koOiJe31jYz44ebskUM+VDU1iFoq0vZQWx8GC
	oxoaVvkRyDkdhIAd22NeG+rpFPaSxy1HwRciDGwhSYZMFI4VuPel41d0mbp+me8AO9qc
	9cA51CbanwYGz0MMNX9SoHFEIHbdqwNB81+FeVGHRr22YdtpgOShYtVM1MpAxpfp4w1+
	DACfpxWRq77Yum8HNUD7sytqjynv2nF9KE1Kz2i9rWOSVqvwnFdSX/HyABY2NR802jKo
	E91+kOEiyC/BCmCB+VawLTfVZhS6nG0L/NNg7coXr3HdF2mcCDWHeHPiDapdvBKMhBrW
	yLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Slq3occuL0zE4umOMGL/v657DJI/Vhk8A7yXltxBpWw=;
	b=FofXhDdeskxli5+W/r9JZt04SUQDqPyuClJp+ZH2shvnX8VmWBk51GprrVtD7lySmp
	A+CZ9OtEIFyZJSszigS8zkCC2kCFUa1LJqWctbJVmEC3rgP8zeYYFlTAlAfH5EfiKne5
	1kiG5HnCCenlqwwyv3xl43LlRD611eZqwiR3QG/b9z8TqzNd6w7mC/6ibsRKc5D65E1E
	ykElUmhyP6NGF/qcMToAG11X65qgQ2ANRr4++43UQjbLOYPQGML9LmiEUlLPvJTRb3MC
	s5yECsCMo0e3FxkM36SNrA/w0d6j/ugA8ABtbKEE1mZYzlsNC1aBGyCtvr9Vw3AMsm/T
	D0lQ==
X-Gm-Message-State: AKwxytdRHzaXlkMIPwb+7kkPxEudZqKGyURSO4yAh+HFN3XigYK5aaVc
	t6c3IijBjE7xyzIxft3hHJ6hvSjNngFpBDiIZRIvGnfX
X-Received: by 10.46.18.217 with SMTP id 86mr9516714ljs.126.1516144434273;
	Tue, 16 Jan 2018 15:13:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.64.196 with HTTP; Tue, 16 Jan 2018 15:13:23 -0800 (PST)
In-Reply-To: <20180111205626.23291-21-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-21-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 16 Jan 2018 15:13:23 -0800
X-Google-Sender-Auth: MzbJbHWKHBcjMQioT2ACBNOevko
Message-ID: <CAKmqyKP7t5=5KWtrfMA9qy7V3eRpXGa9tPwUU+hsZHpVCo8WwA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 20/21] sdhci: implement UHS-I
 voltage switch
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0uDMa/oxa0Y

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> [based on a patch from Alistair Francis <alistair.francis@xilinx.com>
>  from qemu/xilinx tag xilinx-v2015.2]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/sd/sd.h    | 16 ++++++++++++++++
>  include/hw/sd/sdhci.h |  1 +
>  hw/sd/core.c          | 13 +++++++++++++
>  hw/sd/sd.c            | 13 +++++++++++++
>  hw/sd/sdhci.c         | 12 +++++++++++-
>  hw/sd/trace-events    |  1 +
>  6 files changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 96caefe373..f086679493 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -55,6 +55,20 @@
>  #define AKE_SEQ_ERROR          (1 << 3)
>  #define OCR_CCS_BITN        30
>
> +typedef enum {
> +    SD_VOLTAGE_0_4V     =3D 400,  /* currently not supported */
> +    SD_VOLTAGE_1_8V     =3D 1800,
> +    SD_VOLTAGE_3_0V     =3D 3000,
> +    SD_VOLTAGE_3_3V     =3D 3300,
> +} sd_voltage_mv_t;
> +
> +typedef enum  {
> +    UHS_NOT_SUPPORTED   =3D 0,
> +    UHS_I               =3D 1,
> +    UHS_II              =3D 2,    /* currently not supported */
> +    UHS_III             =3D 3,    /* currently not supported */
> +} sd_uhs_mode_t;
> +
>  typedef enum {
>      sd_none =3D -1,
>      sd_bc =3D 0, /* broadcast -- no response */
> @@ -88,6 +102,7 @@ typedef struct {
>      void (*write_data)(SDState *sd, uint8_t value);
>      uint8_t (*read_data)(SDState *sd);
>      bool (*data_ready)(SDState *sd);
> +    void (*set_voltage)(SDState *sd, uint16_t millivolts);
>      void (*enable)(SDState *sd, bool enable);
>      bool (*get_inserted)(SDState *sd);
>      bool (*get_readonly)(SDState *sd);
> @@ -134,6 +149,7 @@ void sd_enable(SDState *sd, bool enable);
>  /* Functions to be used by qdevified callers (working via
>   * an SDBus rather than directly with SDState)
>   */
> +void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts);
>  int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
>  void sdbus_write_data(SDBus *sd, uint8_t value);
>  uint8_t sdbus_read_data(SDBus *sd);
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index e66d6d6abd..2803e78e7f 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -107,6 +107,7 @@ typedef struct SDHCIState {
>          bool bus64;
>          /* v3 */
>          uint8_t slot_type, sdr, strength;
> +        uint8_t uhs_mode;
>      } cap;
>  } SDHCIState;
>
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index 498284f109..6d198ea775 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -41,6 +41,19 @@ static SDState *get_card(SDBus *sdbus)
>      return SD_CARD(kid->child);
>  }
>
> +void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    trace_sdbus_set_voltage(sdbus_name(sdbus), millivolts);
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        assert(sc->set_voltage);
> +        sc->set_voltage(card, millivolts);
> +    }
> +}
> +
>  int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
>  {
>      SDState *card =3D get_card(sdbus);
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 35347a5bbc..609b2da14f 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -128,6 +128,18 @@ struct SDState {
>      bool enable;
>  };
>
> +static void sd_set_voltage(SDState *sd, uint16_t millivolts)
> +{
> +    switch (millivolts) {
> +    case 3001 ... 3600: /* SD_VOLTAGE_3_3V */
> +    case 2001 ... 3000: /* SD_VOLTAGE_3_0V */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "SD card voltage not supported: %=
.3fV",
> +                      millivolts / 1000.f);
> +    }
> +}
> +
>  static void sd_set_mode(SDState *sd)
>  {
>      switch (sd->state) {
> @@ -1925,6 +1937,7 @@ static void sd_class_init(ObjectClass *klass, void =
*data)
>      dc->reset =3D sd_reset;
>      dc->bus_type =3D TYPE_SD_BUS;
>
> +    sc->set_voltage =3D sd_set_voltage;
>      sc->do_command =3D sd_do_command;
>      sc->write_data =3D sd_write_data;
>      sc->read_data =3D sd_read_data;
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 834b835f3e..a4727b4577 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1159,7 +1159,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
>          sdhci_update_irq(s);
>          break;
>      case SDHC_ACMD12ERRSTS:
> -        MASKED_WRITE(s->acmd12errsts, mask, value);
> +        MASKED_WRITE(s->acmd12errsts, mask, value & UINT16_MAX);
> +        if (s->cap.uhs_mode >=3D UHS_I) {
> +            MASKED_WRITE(s->hostctl2, mask >> 16, value >> 16);
> +
> +            if (FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, V18_ENA)) {
> +                sdbus_set_voltage(&s->sdbus, SD_VOLTAGE_1_8V);
> +            } else {
> +                sdbus_set_voltage(&s->sdbus, SD_VOLTAGE_3_3V);
> +            }
> +        }
>          break;
>
>      case SDHC_CAPAB:
> @@ -1346,6 +1355,7 @@ static Property sdhci_properties[] =3D {
>      DEFINE_PROP_BOOL("3v3", SDHCIState, cap.v33, true),
>      DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
>      DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
> +    DEFINE_PROP_UINT8("uhs", SDHCIState, cap.uhs_mode, UHS_NOT_SUPPORTED=
),
>
>      DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
>      DEFINE_PROP_UINT8("slot-type", SDHCIState, cap.slot_type, 0),
> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
> index c0f51f11d4..f874489980 100644
> --- a/hw/sd/trace-events
> +++ b/hw/sd/trace-events
> @@ -4,6 +4,7 @@
>  sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t c=
rc) "@%s CMD%02d arg 0x%08x crc 0x%02x"
>  sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
>  sdbus_write(const char *bus_name, uint8_t value) "@%s value 0x%02x"
> +sdbus_set_voltage(const char *bus_name, uint16_t millivolts) "@%s %u (mV=
)"
>
>  # hw/sd/sdhci.c
>  sdhci_set_inserted(const char *level) "card state changed: %s"
> --
> 2.15.1
>
>
