Received: by 10.28.173.206 with SMTP id w197csp116175wme;
        Fri, 12 Jan 2018 17:56:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBosM8irSzNpOTVTZ2CfYQgn/AzLUj6o+s+8IlFXl0tTINKBPUoLrEs7A1t+OV8TlbWVF9/Bb
X-Received: by 10.13.217.70 with SMTP id b67mr11875161ywe.477.1515808611136;
        Fri, 12 Jan 2018 17:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515808611; cv=none;
        d=google.com; s=arc-20160816;
        b=SVyDlYtYCgA9MCM65ntbuj9pYIyRPFhrwoIZo9LtTvw6Krx1WiUGR4VLOFOSw895/H
         SNdadg+UbwsQDdonTyUkVCDKQehddua0qj0NYhW1eAGhhraC7ALczWliIkONetPp/7Yi
         e67nExHbULR7ywqKAqGooUy1pwirzrf70tiRgqbdcm0ph4HwWX5TNIc7JZlc5Ju+FLn2
         9x7i6fk+htKFYg7oRd5K1UjY1PS6JA/0NZWN1Csduy+R12K4FfyPyzU9G1VD32jivs7w
         xd2RAIWsBWVtPv0hgt4icEvvjQl6ioeNV8Y9fjtesonzG1hMx4mjHR7+HuoRnFB2IlGB
         ftmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zIMRe0zXfg+AMGzP/rDkZdNfqi4aeAW2Q0BXC+Dud68=;
        b=AcvKcTfxYm5QMLVBtLQ3MpXEhSnNpaiz76vx2Y0yRSrw0KS3+5ezdWwv9DuZcZ1jtc
         nUBpWyHZfZMrIK86dRCDXiY7YxCcmmJPtJcVzS1CXqO1TMUlB+vtF7thJepeAkRi2YoP
         jgURxYCvXU1sW4Jyhg2OpLyIqNA28cwvHIFwY53j90+w6dI+MBiN69+oiMqKxINOrQKc
         ozR+WJliBQIzWU4fDctONgRR6ZYcKHxO96REPkJQdL6TuOrty71L3hxW9rpbSFMzU5ff
         /Yr6RiyBZrh4ySWEY+rx/mqcpjlnugsWiacmCUBOy1U6wqk/HAb+QdQMYbXLYCXaVREr
         ljgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GqBYCYg/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n195si507607ybg.439.2018.01.12.17.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 17:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GqBYCYg/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaB3y-0000v0-Gk
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 20:56:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaB3r-0000ul-9b
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:56:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaB3m-0007hF-EC
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:56:43 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaB3m-0007gp-7r; Fri, 12 Jan 2018 20:56:38 -0500
Received: by mail-qk0-x241.google.com with SMTP id b76so11013806qkc.1;
	Fri, 12 Jan 2018 17:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zIMRe0zXfg+AMGzP/rDkZdNfqi4aeAW2Q0BXC+Dud68=;
	b=GqBYCYg/XMGnHPcogg0/zKU+fAvEBAz6lWDFYJ8CKQemh4Me42amgl5hvS+fdHm67n
	HdEdY5/8FiL9bSaBis4fCrnkOpGLDKSB4aKmt9nixw5Jg5183sLXEjc2x+d2atBPLW9g
	Doz/DB1jFyebduGN0EwhJFo6E/kjaM+sNG4EfXWdy06jsGo+38upGKp4oH7Uz24aKu2L
	YkJ9ZLVZnGKWQTcWUXUTTcPA38Bsq77TsXHtQwCsD6FHDmmRflhy7gyppJ2ZITtEYzkH
	1xdcJGvb3Qx6BOvpTfh7L1q++71QI6kmV5Af/GfoWgJUUJd/qAg9AunUou6gyyZzm2QX
	+tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zIMRe0zXfg+AMGzP/rDkZdNfqi4aeAW2Q0BXC+Dud68=;
	b=kd+3uYBcND3TldlRlBgXepZLJYD9O3cGTG9jqVlKuhetpNUY8+HIsYEfoM8h3mfcR7
	vPVvXVaImKlnRTlYWvRCRqw15bncHA9YQXZdGr0XIAxD6kimu/4yXR9WXGDEKC/KPd/L
	HzGd9oYV64fwhVsJgaDrBQSrFkPcnaPWiLDlTuoj0kAFUjju10fLjyZba3aMsUg6CY0i
	XhKvo5JYTiPIM8sdWVXIiJsnRmEkIukojs1PwRuVyic4Oo5AYWGEIQdkyVYjthQ3OWAg
	0nRqvRQ+pViw9CyHDY3D5v/Vzb9QEVNJRTalaV+mR2XeBONpjklXWDfJmxo7xoUoZKM1
	cxGg==
X-Gm-Message-State: AKwxytetllo0vxqUnY0qu0FX/3CsIlTCsUC8iDC2XHQS1v29384f38Y4
	TZu9S+UZL/k0G0QaAYT5lc0=
X-Received: by 10.55.23.164 with SMTP id 36mr18427021qkx.244.1515808597400;
	Fri, 12 Jan 2018 17:56:37 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	s41sm5531858qtk.39.2018.01.12.17.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 17:56:36 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-3-f4bug@amsat.org>
	<CAKmqyKM7Jk6tVhYET8Uv_BowOV+FB7oDKJcpHwhMjVfH4p6Muw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <94259059-9037-2141-b96f-a2098c9ce9c6@amsat.org>
Date: Fri, 12 Jan 2018 22:56:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM7Jk6tVhYET8Uv_BowOV+FB7oDKJcpHwhMjVfH4p6Muw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 02/21] sdhci: add basic Spec
 v1 capabilities
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
	=?UTF-8?Q?Gr=c3=a9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KKo0wbBuYFH3

Hi Alistair,

On 01/12/2018 09:00 PM, Alistair Francis wrote:
> On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daudé
> <f4bug@amsat.org> wrote:
>> (Note than Spec v2 is supported by default)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sdhci-internal.h | 24 +++++++++++++++++++-
>>  include/hw/sd/sdhci.h  |  6 +++++
>>  hw/sd/sdhci.c          | 61 +++++++++++++++++++++++++++++++++++++-------------
>>  3 files changed, 74 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
>> index b7751c815f..9acafe7b01 100644
>> --- a/hw/sd/sdhci-internal.h
>> +++ b/hw/sd/sdhci-internal.h
>> @@ -24,6 +24,8 @@
>>  #ifndef SDHCI_INTERNAL_H
>>  #define SDHCI_INTERNAL_H
>>
>> +#include "hw/registerfields.h"
>> +
>>  /* R/W SDMA System Address register 0x0 */
>>  #define SDHC_SYSAD                     0x00
>>
>> @@ -84,6 +86,9 @@
>>
>>  /* R/W Host control Register 0x0 */
>>  #define SDHC_HOSTCTL                   0x28
>> +FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
>> +FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
>> +FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
>>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>>  #define SDHC_CTRL_SDMA                 0x00
>>  #define SDHC_CTRL_ADMA1_32             0x08
>> @@ -94,6 +99,7 @@
>>  /* R/W Power Control Register 0x0 */
>>  #define SDHC_PWRCON                    0x29
>>  #define SDHC_POWER_ON                  (1 << 0)
>> +FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
>>
>>  /* R/W Block Gap Control Register 0x0 */
>>  #define SDHC_BLKGAP                    0x2A
>> @@ -116,6 +122,7 @@
>>
>>  /* R/W Timeout Control Register 0x0 */
>>  #define SDHC_TIMEOUTCON                0x2E
>> +FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
>>
>>  /* R/W Software Reset Register 0x0 */
>>  #define SDHC_SWRST                     0x2F
>> @@ -172,17 +179,32 @@
>>
>>  /* ROC Auto CMD12 error status register 0x0 */
>>  #define SDHC_ACMD12ERRSTS              0x3C
>> +FIELD(SDHC_ACMD12ERRSTS, TIMEOUT_ERR,  1, 1);
>> +FIELD(SDHC_ACMD12ERRSTS, CRC_ERR,      2, 1);
>> +FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
>>
>>  /* HWInit Capabilities Register 0x05E80080 */
>>  #define SDHC_CAPAB                     0x40
>> -#define SDHC_CAN_DO_DMA                0x00400000
>>  #define SDHC_CAN_DO_ADMA2              0x00080000
>>  #define SDHC_CAN_DO_ADMA1              0x00100000
>>  #define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
>>  #define SDHC_CAPAB_BLOCKSIZE(x)        (((x) >> 16) & 0x3)
>> +FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
>> +FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
>> +FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
>> +FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
>> +FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
>> +FIELD(SDHC_CAPAB, SDMA,               22, 1);
>> +FIELD(SDHC_CAPAB, SUSPRESUME,         23, 1);
>> +FIELD(SDHC_CAPAB, V33,                24, 1);
>> +FIELD(SDHC_CAPAB, V30,                25, 1);
>> +FIELD(SDHC_CAPAB, V18,                26, 1);
>>
>>  /* HWInit Maximum Current Capabilities Register 0x0 */
>>  #define SDHC_MAXCURR                   0x48
>> +FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
>> +FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
>> +FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
>>
>>  /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
>>  #define SDHC_FEAER                     0x50
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index 8786676ac8..09b756eb7a 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -92,6 +92,12 @@ typedef struct SDHCIState {
>>      /* Configurable properties */
>>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
>>      uint8_t spec_version;
>> +    struct {
>> +        bool suspend;
>> +        bool high_speed;
>> +        bool sdma;
>> +        bool v33, v30, v18;
>> +    } cap;
>>  } SDHCIState;
>>
>>  #define TYPE_PCI_SDHCI "sdhci-pci"
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index c8f750451e..d26ea821d0 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -44,12 +44,6 @@
>>   * 0 - not supported, 1 - supported, other - prohibited.
>>   */
>>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
>> -#define SDHC_CAPAB_18V            1ul        /* Voltage support 1.8v */
>> -#define SDHC_CAPAB_30V            0ul        /* Voltage support 3.0v */
>> -#define SDHC_CAPAB_33V            1ul        /* Voltage support 3.3v */
>> -#define SDHC_CAPAB_SUSPRESUME     0ul        /* Suspend/resume support */
>> -#define SDHC_CAPAB_SDMA           1ul        /* SDMA support */
>> -#define SDHC_CAPAB_HIGHSPEED      1ul        /* High speed support */
>>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
>>  /* Maximum host controller R/W buffers size
>> @@ -63,9 +57,7 @@
>>  #define SDHC_CAPAB_TOCLKFREQ      52ul
>>
>>  /* Now check all parameters and calculate CAPABILITIES REGISTER value */
>> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_18V > 1 || SDHC_CAPAB_30V > 1 ||     \
>> -    SDHC_CAPAB_33V > 1 || SDHC_CAPAB_SUSPRESUME > 1 || SDHC_CAPAB_SDMA > 1 ||  \
>> -    SDHC_CAPAB_HIGHSPEED > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 ||\
>> +#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 || \
>>      SDHC_CAPAB_TOUNIT > 1
>>  #error Capabilities features can have value 0 or 1 only!
>>  #endif
>> @@ -90,16 +82,36 @@
>>  #endif
>>
>>  #define SDHC_CAPAB_REG_DEFAULT                                 \
>> -   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_18V << 26) |     \
>> -    (SDHC_CAPAB_30V << 25) | (SDHC_CAPAB_33V << 24) |          \
>> -    (SDHC_CAPAB_SUSPRESUME << 23) | (SDHC_CAPAB_SDMA << 22) |  \
>> -    (SDHC_CAPAB_HIGHSPEED << 21) | (SDHC_CAPAB_ADMA1 << 20) |  \
>> +   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
>>      (SDHC_CAPAB_ADMA2 << 19) | (MAX_BLOCK_LENGTH << 16) |      \
>>      (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
>>      (SDHC_CAPAB_TOCLKFREQ))
>>
>>  #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
>>
>> +static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>> +{
>> +    uint64_t capareg = 0;
>> +
>> +    switch (s->spec_version) {
>> +    case 2: /* default version */
>> +
>> +    /* fallback */
>> +    case 1:
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.high_speed);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.suspend);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V33, s->cap.v33);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V30, s->cap.v30);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V18, s->cap.v18);
>> +        break;
>> +
>> +    default:
>> +        error_setg(errp, "Unsupported spec version: %u", s->spec_version);
> 
> Probably best to have a return here, encase some logic added below
> later relies on this being successful.

Indeed, better safe than sorry.
>> +    }
>> +    s->capareg = capareg;
>> +}
>> +
>>  static uint8_t sdhci_slotint(SDHCIState *s)
>>  {
>>      return (s->norintsts & s->norintsigen) || (s->errintsts & s->errintsigen) ||
>> @@ -1026,7 +1038,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>>      case SDHC_TRNMOD:
>>          /* DMA can be enabled only if it is supported as indicated by
>>           * capabilities register */
>> -        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
>> +        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
>>              value &= ~SDHC_TRNS_DMA;
>>          }
>>          MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
>> @@ -1181,6 +1193,10 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
>>          return;
>>      }
>>      s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
>> +
>> +    if (s->capareg == UINT64_MAX) {
>> +        sdhci_init_capareg(s, errp);
>> +    }
>>  }
>>
>>  static void sdhci_initfn(SDHCIState *s)
>> @@ -1297,8 +1313,21 @@ const VMStateDescription sdhci_vmstate = {
>>   * specific host controller implementation */
>>  static Property sdhci_properties[] = {
>>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
>> -    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
>> -            SDHC_CAPAB_REG_DEFAULT),
>> +
>> +    /* DMA */
>> +    DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
>> +    /* Suspend/resume support */
>> +    DEFINE_PROP_BOOL("suspend", SDHCIState, cap.suspend, false),
>> +    /* High speed support */
>> +    DEFINE_PROP_BOOL("high-speed", SDHCIState, cap.high_speed, true),
>> +    /* Voltage support 3.3/3.0/1.8V */
>> +    DEFINE_PROP_BOOL("3v3", SDHCIState, cap.v33, true),
>> +    DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
>> +    DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
> 
> This is a change of the default value.
> 
> I think you really need to specify specific changes in the commit
> message. That way is the defaults cause breakages we will be able to
> bisect it in the future.

You are right I need to be more descriptive in my messages.

I wonder how to consider the "default" SDHC_CAPAB_REG_DEFAULT, it seems
to only correctly matches the Zynq-7000 SDHCI.

Note that I only deprecate the 'capareg' property, it isn't modified
until all HCI are correctly passed to the new properties (verified using
the qtests), then I remove it.
This way this series is bisectable and due to the qtests, no breakage
should be introduced.

I tried to use the Spec default value for each property introduced.
I will sort the properties per Spec introduction, with a comment around.

>> +
>> +    /* capareg: deprecated */
>> +    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
>> +
>>      DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
>>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
>>                       false),
>> --
>> 2.15.1
>>
>>
