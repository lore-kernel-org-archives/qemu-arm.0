Received: by 10.28.173.206 with SMTP id w197csp2955451wme;
        Mon, 8 Jan 2018 13:42:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBosoZr0dwyfi6qb8oDy997TfqpwOUyfbhqFiLVQjmdZ89aucg26mskdg2CrGmX1aURkUpz1k
X-Received: by 10.129.85.74 with SMTP id j71mr4663363ywb.328.1515447743126;
        Mon, 08 Jan 2018 13:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515447743; cv=none;
        d=google.com; s=arc-20160816;
        b=qvKBcr+I0+GY6kXrBwLphTuAB2Xg2vzrrbBRLJw80L7R+UA7HUP50vqN1PBoCBb8mW
         iGUHV7kDIMgYTj1Ht1O+HJ2hbMljV3b4JcjHfGZcZImIF85GWNbLHC/SqqEVMb42ta3u
         /1/bQXDt5pEWK/mpcyUGbVxJ0b4nECCXV6Oqty0c7vFuUUzGAmYYhFpCXgdvqeHqs7c2
         rIJx41QKZki1sqAxGwkJKPERHrikhEOM46emJ908nJshy9QwmeXDZ+1cMABDKwhStWLF
         mAe5qsN46pU1gPYPsuB+3eP8bCFQJuDlTjb38kqgu2SffoEhhU43V/YjNpolp44cm5v3
         C/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=lfNEYEvfPVhBOXD7z/IMCkqy1loMc1PmnVJXOJO69k8=;
        b=tyGCEyyQvcuk5JDbtyY784sDUa0M2fEX8LozO4OwVgQiSFjxehY2IQwARcri2Fkot+
         OffpkYU1niZzIPGTDg7nBhB+jeXSX7CkIJNZFxvNM1Dx2bk02HIJkhIRKQmRY4yeylnG
         Yz7GKuzKP9gkL8CqrVjhZJglhKkMW0cNA0GrE6akRzrgRhCToo4vTMxVsq+BymnTya+F
         3tdmgDJO0yMGsBK33jtXjeU2fP8br1aB8pWHsuRPgA/ZGhIwnwcjsgQX4c4PJTMZfdUk
         7IQkB+xdVhxKfuM8pSXRwCrmZMuI2blwex2gAjbW/0zgxh8k317bQli/G/zoMU+HYUfy
         WNog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tWVfQhjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z10si2754852ywi.18.2018.01.08.13.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tWVfQhjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfBW-0000Tu-HA
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:42:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfBL-0000MV-PX
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:42:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfBK-00076X-IP
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:42:11 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:45589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfBH-000724-Am; Mon, 08 Jan 2018 16:42:07 -0500
Received: by mail-wr0-x243.google.com with SMTP id o15so12201912wrf.12;
	Mon, 08 Jan 2018 13:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=lfNEYEvfPVhBOXD7z/IMCkqy1loMc1PmnVJXOJO69k8=;
	b=tWVfQhjFW5LsRJXK9QqR7PpJzBLL1tSrmcUJapHyDMwh+hrSOQhckgj7NifLUuWoHD
	IdDYYG1Joyu6hRITfXvDymvQkNngEXSTwhHJeS/pCWb/tcQiuL5929zMfLpakgicMkOv
	tRmYoaOsfkW040f1PBWmQVUgduA24zrnEZRdTSMic8eLRxxfOSJhLJKsJ9OtR28/Szoz
	dUaRwRyLQKhPZKrsklas46pxU3U1f0mq8rGtbEal5cxuEaTao35W5HMmHoUGrxx8XePe
	LuPrXTlI7Wwfl61rac40zn1zhWW0cY6mVCfkrtCqeRcnrnS1i7O+g6CDhATXgWyjZpnn
	4afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=lfNEYEvfPVhBOXD7z/IMCkqy1loMc1PmnVJXOJO69k8=;
	b=SQhl4baadNQztN05sKNgIwLzP41t2xFyRE3mE0qxMWpkCSSffqwDAFbj375FquYOVk
	k4sT7ExtPD+W21E0WBHhEuFtRGpn0U4wSq85Fh0amU/2wAoICTsO9SfivrvtPJXWy0N+
	bfADRPFjY+SFhW3pm1cfivwz8Uz8U1XuC7i1UoAmwJz5TJlCJKLc56JVX8gue2/2hXbG
	jyHLY1pIADWPoWxNpXyCqPAP/5HZDAggdlDp5SV1BhBFbkdCTJtyodpZiNrz37mT6UcH
	y+rKOdZuqiFkqtviX8VSGKrKG9kgK5f58jjTiTqMdOzmu7llfORT3fTEEfbjGk8/wDOI
	ldlg==
X-Gm-Message-State: AKGB3mI1ug1fii/iaexii/JA/IZrzMSo95ZJeP0Kbx+qXVPyrWq3QOsE
	rwuP4bRprBp3ora7c55jnbm1qifM6ARvhSUFVF0=
X-Received: by 10.223.161.22 with SMTP id o22mr12182274wro.34.1515447726198;
	Mon, 08 Jan 2018 13:42:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:41:35 -0800 (PST)
In-Reply-To: <20180108154303.6522-2-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:41:35 -0800
X-Google-Sender-Auth: bOC2tv1LRfO41v4r9KuoP-zAqqU
Message-ID: <CAKmqyKPQ-pdhXwn1knjj+CPps0uyRSeVELz7km1R-nJsnT4M=A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 01/31] sdhci: add a
 spec_version property
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
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFYVIELu37NX

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> default to Spec v2.00
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci-internal.h |  4 ++--
>  include/hw/sd/sdhci.h  |  3 +++
>  hw/sd/sdhci.c          | 19 +++++++++++++++++--
>  3 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index b7475a1b7b..cf4a055159 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -212,9 +212,9 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>  /* Slot interrupt status */
>  #define SDHC_SLOT_INT_STATUS            0xFC
>
> -/* HWInit Host Controller Version Register 0x0401 */
> +/* HWInit Host Controller Version Register */
>  #define SDHC_HCVER                      0xFE
> -#define SD_HOST_SPECv2_VERS             0x2401
> +#define SDHC_HCVER_VENDOR               0x24
>
>  #define SDHC_REGISTERS_MAP_SIZE         0x100
>  #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 2aea20f1d8..ddd5040410 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -91,6 +91,8 @@ typedef struct SDHCIState {
>      uint64_t capareg;      /* Capabilities Register */
>      /* 0x48 */
>      uint64_t maxcurr;      /* Maximum Current Capabilities Register */
> +    /* 0xfe */
> +    uint16_t version;      /* Host Controller Version Register */
>
>      uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
>      uint32_t buf_maxsz;
> @@ -99,6 +101,7 @@ typedef struct SDHCIState {
>      bool     pending_insert_state;
>      /* Configurable properties */
>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
> +    uint8_t spec_version;
>  } SDHCIState;
>
>  #define TYPE_PCI_SDHCI "sdhci-pci"
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index b080950f80..cd4a8efdd7 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -169,7 +169,8 @@ static void sdhci_reset(SDHCIState *s)
>
>      timer_del(s->insert_timer);
>      timer_del(s->transfer_timer);
> -    /* Set all registers to 0. Capabilities registers are not cleared
> +
> +    /* Set all registers to 0. Capabilities/Version registers are not cl=
eared
>       * and assumed to always preserve their value, given to them during
>       * initialization */
>      memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdm=
asysad);
> @@ -923,7 +924,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offse=
t, unsigned size)
>          ret =3D (uint32_t)(s->admasysaddr >> 32);
>          break;
>      case SDHC_SLOT_INT_STATUS:
> -        ret =3D (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
> +        ret =3D (s->version << 16) | sdhci_slotint(s);
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
> @@ -1178,6 +1179,15 @@ static inline unsigned int sdhci_get_fifolen(SDHCI=
State *s)
>      }
>  }
>
> +static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
> +{
> +    if (s->spec_version !=3D 2) {
> +        error_setg(errp, "Only Spec v2 is supported");
> +        return;
> +    }
> +    s->version =3D (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
> +}
> +
>  static void sdhci_initfn(SDHCIState *s)
>  {
>      qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
> @@ -1190,6 +1200,10 @@ static void sdhci_initfn(SDHCIState *s)
>
>  static void sdhci_common_realize(SDHCIState *s, Error **errp)
>  {
> +    sdhci_init_readonly_registers(s, errp);
> +    if (errp && *errp) {
> +        return;
> +    }
>      s->buf_maxsz =3D sdhci_get_fifolen(s);
>      s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>
> @@ -1290,6 +1304,7 @@ const VMStateDescription sdhci_vmstate =3D {
>  /* Capabilities registers provide information on supported features of t=
his
>   * specific host controller implementation */
>  static Property sdhci_properties[] =3D {
> +    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
>      DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
>              SDHC_CAPAB_REG_DEFAULT),
>      DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
> --
> 2.15.1
>
>
