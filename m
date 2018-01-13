Received: by 10.28.173.206 with SMTP id w197csp144807wme;
        Fri, 12 Jan 2018 18:38:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBotGS0SIwEegvpopQzbaWnJQcMi00kop8vp5Lm1501BsidYHkayJ3/Td19MWZ+TpQOu26HPi
X-Received: by 10.13.232.204 with SMTP id r195mr17694399ywe.177.1515811099054;
        Fri, 12 Jan 2018 18:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515811099; cv=none;
        d=google.com; s=arc-20160816;
        b=BzYBCimSL5LgV4/y8I0E5MA82lsGz7RMEJW445C7ndtpY3zk9/Qgq0CNkhDLnteu4V
         QTOfhAUMqeFWLmORCYGmC9bIz2vlM62OSZ0+K4Nl0fr3XXoENA4PWT2DuX4PM+Lz61Fv
         PA44HT/NVQdje8oOktxswasOP+8+E1Ekr6N3UxRzTOULtj52UjtAUu44z7WjXb7sfH5V
         bCvtx1leadHKU69zggSPHxtR8Sy0P0C/Lsu3SiZbwO51Mcn373KNp/Fsx0yKjAE75I5L
         VWQ+Vu96a6NWD2vtIKmgxkm6ZGCjmgVWjlwkJznZ3GLfd0miJzuCEEeW5FETk46VFpEq
         TJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :importance:date:from:to:mime-version:message-id:dkim-signature
         :arc-authentication-results;
        bh=CcHR7mYWJ6v6gxGX1qLGnoPd3SMungHpfOeRJb3At6Q=;
        b=v11zsnA/ZUQ2ai2PBbFmGORdqH0Nyo+9ndIib7eb2zB7Q+y7BgzKja3BZs2Zp/QJqZ
         c1tHpmeNCQ9Y49G2b0curCdC4AYMsgZlAesfV0juMRE9DsYTPS2jxg+brJK4Sljzic+m
         RKarWF4e87SYL/U1dROVyW0JiC/N2Xg2nHF1528JIllfRK+wVUFuaqtdCC3jPqQcZRuB
         l5Zk+JUuT2BWARaNagRwERlah7WsNCKKkDHbSf1eUw2I7UX5aTwlNPJOtxl3eVjznbC8
         USkyMcFz51h5h6xm50HxkD0jFZmODFaqumidnUMBdnewh0Yv40CSZtN5UOSYmW0AL5n0
         KYFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oToLMMzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si3511929ybg.608.2018.01.12.18.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 18:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oToLMMzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaBi6-0004e5-Em
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 21:38:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaBhr-0004aq-Mm
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 21:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaBho-000857-Sv
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 21:38:03 -0500
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:44941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eaBhh-0007qR-SC; Fri, 12 Jan 2018 21:37:54 -0500
Received: by mail-pf0-x230.google.com with SMTP id m26so5721685pfj.11;
	Fri, 12 Jan 2018 18:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:mime-version:to:cc:from:subject:date:importance
	:in-reply-to:references;
	bh=CcHR7mYWJ6v6gxGX1qLGnoPd3SMungHpfOeRJb3At6Q=;
	b=oToLMMzQJpcmiWI+CXdX1e3r4gxZv3WcI0K30f7vRb5W07II2mzpG5yYXCHpqUOrly
	L+xzoWQysY4NeP+GTzgqBL1gAZx3dzuA4b6K2hiT4GkP99KBdk/KyuoS3ac2xbtUfaBj
	s7o0KorfUExeMmLapTq2/20E8WVJFV7s3Nz8oLy1c3RtI87pZqWpkJ305Hr1SfeN4m7f
	SzquICP58Ce2Ht6r/rXlErGs4DE//IKXCk9uIlVVZ3FMitIDeyLS2xf/jp248gH0drYw
	/eJfvpBBViyOXKQd7eGHepDhDt3L5JWH8b5GnYoM5j/K0BI7Pqt4U/I8jHL51fjYD58s
	kpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:mime-version:to:cc:from:subject:date
	:importance:in-reply-to:references;
	bh=CcHR7mYWJ6v6gxGX1qLGnoPd3SMungHpfOeRJb3At6Q=;
	b=jcWqWDKLGoOr7Tn7jIR1cSvzNnF/0zUnQFF7NEqq9Aj3BrXkDEGguT4UnarLM+TCc9
	BstHeLSptnW8kdYMQYFIPTz4MakpfMs6epYGJZki8tElR9EwFtOXVAjlLhAwcEKCJeTz
	pL/6oXFO2eU94AoyoUZCwfaLBl/9b21xIPBW8SYDdCaleL5wOJbFwNYabWmH7RklCPAZ
	Q9MUtAvwCJQ+g5UDDPzNGKkeXDQDOSfaYdra3iFR+jCf8V6HINWPfbnMnUz42WGS2CIg
	Zk0rLZnT6IzLjptSu2gSfNQqMSBCLVpmkA/N+h5Wd10ameafKYeapTSGB8D5bytJX1SS
	bDIQ==
X-Gm-Message-State: AKGB3mJkedq4KoxJ54vbY21smg180vIlgLWax96cYFNPKieNl5hFH2Vh
	CfENCAN30wcq1BgllxRQa8k=
X-Received: by 10.101.82.68 with SMTP id q4mr22039942pgp.350.1515811072756;
	Fri, 12 Jan 2018 18:37:52 -0800 (PST)
Received: from ?IPv6:::ffff:6.222.116.146? ([172.56.38.12])
	by smtp.gmail.com with ESMTPSA id
	x3sm36546405pgv.73.2018.01.12.18.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 18:37:51 -0800 (PST)
Message-ID: <5a5970ff.0365650a.97486.fa6f@mx.google.com>
MIME-Version: 1.0
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair.francis@xilinx.com>
From: Alistair <alistair23@gmail.com>
Date: Fri, 12 Jan 2018 18:37:34 -0800
Importance: normal
X-Priority: 3
In-Reply-To: <94259059-9037-2141-b96f-a2098c9ce9c6@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-3-f4bug@amsat.org>
	<CAKmqyKM7Jk6tVhYET8Uv_BowOV+FB7oDKJcpHwhMjVfH4p6Muw@mail.gmail.com>
	<94259059-9037-2141-b96f-a2098c9ce9c6@amsat.org>
Content-Type: multipart/alternative;
	boundary="_ADB7B3D6-1EF9-4550-B374-83AD1275E06B_"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 02/21] sdhci: add basic Spec
 v1capabilities
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?utf-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+p9qBNMuLod

--_ADB7B3D6-1EF9-4550-B374-83AD1275E06B_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Sorry for the top post, I=E2=80=99m on my phone.

Changing them should be fine (as you said it doesn't actually change anythi=
ng) I think it is just worth mentioning in the commit.

Thanks,
Alistair

From: Philippe Mathieu-Daud=C3=A9
Sent: Friday, 12 January 2018 5:57 PM
To: Alistair Francis
Cc: Edgar E . Iglesias; Peter Maydell; Prasad J Pandit; Gr=C3=A9gory Estrad=
e; Andrey Smirnov; Peter Crosthwaite; qemu-devel@nongnu.org Developers; Krz=
ysztof Kozlowski; Jean-Christophe Dubois; Sai Pavan Boddu; Igor Mitsyanko; =
qemu-arm; Clement Deschamps; Andrew Baumann
Subject: Re: [Qemu-devel] [PATCH v6 02/21] sdhci: add basic Spec v1capabili=
ties

Hi Alistair,

On 01/12/2018 09:00 PM, Alistair Francis wrote:
> On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
>> (Note than Spec v2 is supported by default)
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/sd/sdhci-internal.h | 24 +++++++++++++++++++-
>>  include/hw/sd/sdhci.h  |  6 +++++
>>  hw/sd/sdhci.c          | 61 +++++++++++++++++++++++++++++++++++++------=
-------
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
>>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert in=
t */
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
>>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Suppo=
rt */
>> -#define SDHC_CAPAB_18V            1ul        /* Voltage support 1.8v */
>> -#define SDHC_CAPAB_30V            0ul        /* Voltage support 3.0v */
>> -#define SDHC_CAPAB_33V            1ul        /* Voltage support 3.3v */
>> -#define SDHC_CAPAB_SUSPRESUME     0ul        /* Suspend/resume support =
*/
>> -#define SDHC_CAPAB_SDMA           1ul        /* SDMA support */
>> -#define SDHC_CAPAB_HIGHSPEED      1ul        /* High speed support */
>>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
>>  /* Maximum host controller R/W buffers size
>> @@ -63,9 +57,7 @@
>>  #define SDHC_CAPAB_TOCLKFREQ      52ul
>>
>>  /* Now check all parameters and calculate CAPABILITIES REGISTER value *=
/
>> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_18V > 1 || SDHC_CAPAB_30V > 1=
 ||     \
>> -    SDHC_CAPAB_33V > 1 || SDHC_CAPAB_SUSPRESUME > 1 || SDHC_CAPAB_SDMA =
> 1 ||  \
>> -    SDHC_CAPAB_HIGHSPEED > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA=
1 > 1 ||\
>> +#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1=
 > 1 || \
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
>>  #define MASKED_WRITE(reg, mask, val)  (reg =3D (reg & (mask)) | (val))
>>
>> +static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>> +{
>> +    uint64_t capareg =3D 0;
>> +
>> +    switch (s->spec_version) {
>> +    case 2: /* default version */
>> +
>> +    /* fallback */
>> +    case 1:
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.h=
igh_speed);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.=
suspend);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V33, s->cap.v33);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V30, s->cap.v30);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V18, s->cap.v18);
>> +        break;
>> +
>> +    default:
>> +        error_setg(errp, "Unsupported spec version: %u", s->spec_versio=
n);
>=20
> Probably best to have a return here, encase some logic added below
> later relies on this being successful.

Indeed, better safe than sorry.
>> +    }
>> +    s->capareg =3D capareg;
>> +}
>> +
>>  static uint8_t sdhci_slotint(SDHCIState *s)
>>  {
>>      return (s->norintsts & s->norintsigen) || (s->errintsts & s->errint=
sigen) ||
>> @@ -1026,7 +1038,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
>>      case SDHC_TRNMOD:
>>          /* DMA can be enabled only if it is supported as indicated by
>>           * capabilities register */
>> -        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
>> +        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
>>              value &=3D ~SDHC_TRNS_DMA;
>>          }
>>          MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
>> @@ -1181,6 +1193,10 @@ static void sdhci_init_readonly_registers(SDHCISt=
ate *s, Error **errp)
>>          return;
>>      }
>>      s->version =3D (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
>> +
>> +    if (s->capareg =3D=3D UINT64_MAX) {
>> +        sdhci_init_capareg(s, errp);
>> +    }
>>  }
>>
>>  static void sdhci_initfn(SDHCIState *s)
>> @@ -1297,8 +1313,21 @@ const VMStateDescription sdhci_vmstate =3D {
>>   * specific host controller implementation */
>>  static Property sdhci_properties[] =3D {
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
>=20
> This is a change of the default value.
>=20
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
>>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert=
_quirk,
>>                       false),
>> --
>> 2.15.1
>>
>>



--_ADB7B3D6-1EF9-4550-B374-83AD1275E06B_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-AU link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>Sorry for the top=
 post, I=E2=80=99m on my phone.<o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-US>Changing them should be fine (as you said it doesn't actually ch=
ange anything) I think it is just worth mentioning in the commit.</span></p=
><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thanks,<br>=
Alistair</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div style=3D'mso-ele=
ment:para-border-div;border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0=
pt 0cm 0cm 0cm'><p class=3DMsoNormal style=3D'border:none;padding:0cm'><b>F=
rom: </b><a href=3D"mailto:f4bug@amsat.org">Philippe Mathieu-Daud=C3=A9</a>=
<br><b>Sent: </b>Friday, 12 January 2018 5:57 PM<br><b>To: </b><a href=3D"m=
ailto:alistair.francis@xilinx.com">Alistair Francis</a><br><b>Cc: </b><a hr=
ef=3D"mailto:edgar.iglesias@xilinx.com">Edgar E . Iglesias</a>; <a href=3D"=
mailto:peter.maydell@linaro.org">Peter Maydell</a>; <a href=3D"mailto:pjp@f=
edoraproject.org">Prasad J Pandit</a>; <a href=3D"mailto:gregory.estrade@gm=
ail.com">Gr=C3=A9gory Estrade</a>; <a href=3D"mailto:andrew.smirnov@gmail.c=
om">Andrey Smirnov</a>; <a href=3D"mailto:crosthwaite.peter@gmail.com">Pete=
r Crosthwaite</a>; <a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nong=
nu.org Developers</a>; <a href=3D"mailto:krzk@kernel.org">Krzysztof Kozlows=
ki</a>; <a href=3D"mailto:jcd@tribudubois.net">Jean-Christophe Dubois</a>; =
<a href=3D"mailto:saipava@xilinx.com">Sai Pavan Boddu</a>; <a href=3D"mailt=
o:i.mitsyanko@gmail.com">Igor Mitsyanko</a>; <a href=3D"mailto:qemu-arm@non=
gnu.org">qemu-arm</a>; <a href=3D"mailto:clement.deschamps@antfield.fr">Cle=
ment Deschamps</a>; <a href=3D"mailto:Andrew.Baumann@microsoft.com">Andrew =
Baumann</a><br><b>Subject: </b>Re: [Qemu-devel] [PATCH v6 02/21] sdhci: add=
 basic Spec v1capabilities</p></div><p class=3DMsoNormal><o:p>&nbsp;</o:p><=
/p><p class=3DMsoNormal>Hi Alistair,</p><p class=3DMsoNormal><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal>On 01/12/2018 09:00 PM, Alistair Francis wrote:=
</p><p class=3DMsoNormal>&gt; On Thu, Jan 11, 2018 at 12:56 PM, Philippe Ma=
thieu-Daud=C3=A9</p><p class=3DMsoNormal>&gt; &lt;f4bug@amsat.org&gt; wrote=
:</p><p class=3DMsoNormal>&gt;&gt; (Note than Spec v2 is supported by defau=
lt)</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNorm=
al>&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;f4bug@amsat.org&=
gt;</p><p class=3DMsoNormal>&gt;&gt; ---</p><p class=3DMsoNormal>&gt;&gt;=
=C2=A0 hw/sd/sdhci-internal.h | 24 +++++++++++++++++++-</p><p class=3DMsoNo=
rmal>&gt;&gt;=C2=A0 include/hw/sd/sdhci.h=C2=A0 |=C2=A0 6 +++++</p><p class=
=3DMsoNormal>&gt;&gt;=C2=A0 hw/sd/sdhci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 61 +++++++++++++++++++++++++++++++++++++-----------=
--</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 3 files changed, 74 insertions(+)=
, 17 deletions(-)</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p c=
lass=3DMsoNormal>&gt;&gt; diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci=
-internal.h</p><p class=3DMsoNormal>&gt;&gt; index b7751c815f..9acafe7b01 1=
00644</p><p class=3DMsoNormal>&gt;&gt; --- a/hw/sd/sdhci-internal.h</p><p c=
lass=3DMsoNormal>&gt;&gt; +++ b/hw/sd/sdhci-internal.h</p><p class=3DMsoNor=
mal>&gt;&gt; @@ -24,6 +24,8 @@</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #ifnd=
ef SDHCI_INTERNAL_H</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHCI_IN=
TERNAL_H</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMs=
oNormal>&gt;&gt; +#include &quot;hw/registerfields.h&quot;</p><p class=3DMs=
oNormal>&gt;&gt; +</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* R/W SDMA Syste=
m Address register 0x0 */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SD=
HC_SYSAD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00</p><p class=3DM=
soNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt; @@ -84,=
6 +86,9 @@</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3D=
MsoNormal>&gt;&gt;=C2=A0 /* R/W Host control Register 0x0 */</p><p class=3D=
MsoNormal>&gt;&gt;=C2=A0 #define SDHC_HOSTCTL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x28</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_HOSTCTL, LED_CTRL,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 1);</p><p class=3DMs=
oNormal>&gt;&gt; +FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode =
only */</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_HOSTCTL, HIGH_SPEED,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2, 1);</p><p class=3DMsoNormal>&=
gt;&gt;=C2=A0 #define SDHC_CTRL_DMA_CHECK_MASK=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A00x18</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CTRL_SDMA=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x00</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define S=
DHC_CTRL_ADMA1_32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x08</p><p class=3DMsoNormal>&gt;&gt; @@ -94,6 +99,7 @@</p>=
<p class=3DMsoNormal>&gt;&gt;=C2=A0 /* R/W Power Control Register 0x0 */</p=
><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_PWRCON=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x29</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define S=
DHC_POWER_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0(1 &lt;&lt; 0)</p><p class=3DMsoNor=
mal>&gt;&gt; +FIELD(SDHC_PWRCON, BUS_VOLTAGE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1, 3);</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p=
 class=3DMsoNormal>&gt;&gt;=C2=A0 /* R/W Block Gap Control Register 0x0 */<=
/p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_BLKGAP=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x2A</p><p class=3DMsoNormal>&gt;&gt; @@ -116,6 +1=
22,7 @@</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMso=
Normal>&gt;&gt;=C2=A0 /* R/W Timeout Control Register 0x0 */</p><p class=3D=
MsoNormal>&gt;&gt;=C2=A0 #define SDHC_TIMEOUTCON=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x2E</p><=
p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_TIMEOUTCON, COUNTER,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 4);</p><p class=3DMsoNormal>&gt;&gt;<o:p>=
&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* R/W Software Reset R=
egister 0x0 */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_SWRST=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2F</p><p class=3DMsoNormal>&gt=
;&gt; @@ -172,17 +179,32 @@</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:=
p></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* ROC Auto CMD12 error status re=
gister 0x0 */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_ACMD12ERR=
STS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3C</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_ACMD12ERRSTS, TIME=
OUT_ERR,=C2=A0 1, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_ACMD12ER=
RSTS, CRC_ERR,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2, 1);</p><p class=3DMsoNormal=
>&gt;&gt; +FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,=C2=A0=C2=A0=C2=A0 4, 1);</p>=
<p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;=
&gt;=C2=A0 /* HWInit Capabilities Register 0x05E80080 */</p><p class=3DMsoN=
ormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x40</p><p class=3DMsoNormal>&gt;&gt; -#define SDHC_CAN_DO_DMA=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x00400000</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC=
_CAN_DO_ADMA2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00080000</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #defin=
e SDHC_CAN_DO_ADMA1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00100000</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 =
#define SDHC_64_BIT_BUS_SUPPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
1 &lt;&lt; 28)</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB_BL=
OCKSIZE(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((x) &gt;&gt; 16) &am=
p; 0x3)</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, TOCLKFREQ,=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 6);</p><p clas=
s=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, TOUNIT,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7, 1);</p><p class=
=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, BASECLKFREQ,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 8, 8);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(=
SDHC_CAPAB, MAXBLOCKLENGTH,=C2=A0=C2=A0=C2=A0=C2=A0 16, 2);</p><p class=3DM=
soNormal>&gt;&gt; +FIELD(SDHC_CAPAB, HIGHSPEED,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 21, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD=
(SDHC_CAPAB, SDMA,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 22, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD=
(SDHC_CAPAB, SUSPRESUME,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23=
, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, V33,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 24, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, V30,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 25, 1);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_CAPAB, V18,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 26, 1);</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></=
p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* HWInit Maximum Current Capabilitie=
s Register 0x0 */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_MAXCU=
RR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x48</p><p class=3DMsoNormal>&gt;&gt; =
+FIELD(SDHC_MAXCURR, V33_VDD1,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0, 8);</p><p class=3DMsoNormal>&gt;&gt; +FIELD(SDHC_MAXCURR, V30_=
VDD1,=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A08, 8);</p><p cl=
ass=3DMsoNormal>&gt;&gt; +FIELD(SDHC_MAXCURR, V18_VDD1,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16, 8);</p><p class=3DMsoNormal>&gt;&gt;<o:p=
>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* W Force Event Auto =
CMD12 Error Interrupt Register 0x0000 */</p><p class=3DMsoNormal>&gt;&gt;=
=C2=A0 #define SDHC_FEAER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
50</p><p class=3DMsoNormal>&gt;&gt; diff --git a/include/hw/sd/sdhci.h b/in=
clude/hw/sd/sdhci.h</p><p class=3DMsoNormal>&gt;&gt; index 8786676ac8..09b7=
56eb7a 100644</p><p class=3DMsoNormal>&gt;&gt; --- a/include/hw/sd/sdhci.h<=
/p><p class=3DMsoNormal>&gt;&gt; +++ b/include/hw/sd/sdhci.h</p><p class=3D=
MsoNormal>&gt;&gt; @@ -92,6 +92,12 @@ typedef struct SDHCIState {</p><p cla=
ss=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Configurable prope=
rties */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boo=
l pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */</p><p =
class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t spec_versi=
on;</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct {</p><p cla=
ss=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool su=
spend;</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bool high_speed;</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool sdma;</p><p class=3DMsoNormal>&gt;&gt; =
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool v33, v30, v18;</p><p class=
=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 } cap;</p><p class=3DMsoNormal>&g=
t;&gt;=C2=A0 } SDHCIState;</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p=
></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define TYPE_PCI_SDHCI &quot;sdhci=
-pci&quot;</p><p class=3DMsoNormal>&gt;&gt; diff --git a/hw/sd/sdhci.c b/hw=
/sd/sdhci.c</p><p class=3DMsoNormal>&gt;&gt; index c8f750451e..d26ea821d0 1=
00644</p><p class=3DMsoNormal>&gt;&gt; --- a/hw/sd/sdhci.c</p><p class=3DMs=
oNormal>&gt;&gt; +++ b/hw/sd/sdhci.c</p><p class=3DMsoNormal>&gt;&gt; @@ -4=
4,12 +44,6 @@</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0 * 0 - not suppor=
ted, 1 - supported, other - prohibited.</p><p class=3DMsoNormal>&gt;&gt;=C2=
=A0=C2=A0 */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB_64BI=
TBUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0ul=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0/* 64-bit System Bus Support */</p><p class=3DMsoNormal>&gt;&gt=
; -#define SDHC_CAPAB_18V=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1ul=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Voltage=
 support 1.8v */</p><p class=3DMsoNormal>&gt;&gt; -#define SDHC_CAPAB_30V=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0ul=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Voltage support 3.0v */</p><p cl=
ass=3DMsoNormal>&gt;&gt; -#define SDHC_CAPAB_33V=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1ul=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Voltage support 3.3v */</p><p class=3DMsoNormal>&gt;&gt; -#=
define SDHC_CAPAB_SUSPRESUME=C2=A0=C2=A0=C2=A0=C2=A0 0ul=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* Suspend/resume support */</p><p class=3DMsoNorm=
al>&gt;&gt; -#define SDHC_CAPAB_SDMA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1ul=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* SDMA=
 support */</p><p class=3DMsoNormal>&gt;&gt; -#define SDHC_CAPAB_HIGHSPEED=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1ul=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* High speed support */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define=
 SDHC_CAPAB_ADMA1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1ul=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ADMA1 support */</p><p class=
=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB_ADMA2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1ul=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* ADMA2 support */</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 /* Maximu=
m host controller R/W buffers size</p><p class=3DMsoNormal>&gt;&gt; @@ -63,=
9 +57,7 @@</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB_TOCLKF=
REQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 52ul</p><p class=3DMsoNormal>&gt;&gt;<o:p=
>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt; =C2=A0/* Now check all param=
eters and calculate CAPABILITIES REGISTER value */</p><p class=3DMsoNormal>=
&gt;&gt; -#if SDHC_CAPAB_64BITBUS &gt; 1 || SDHC_CAPAB_18V &gt; 1 || SDHC_C=
APAB_30V &gt; 1 ||=C2=A0=C2=A0=C2=A0=C2=A0 \</p><p class=3DMsoNormal>&gt;&g=
t; -=C2=A0=C2=A0=C2=A0 SDHC_CAPAB_33V &gt; 1 || SDHC_CAPAB_SUSPRESUME &gt; =
1 || SDHC_CAPAB_SDMA &gt; 1 ||=C2=A0 \</p><p class=3DMsoNormal>&gt;&gt; -=
=C2=A0=C2=A0=C2=A0 SDHC_CAPAB_HIGHSPEED &gt; 1 || SDHC_CAPAB_ADMA2 &gt; 1 |=
| SDHC_CAPAB_ADMA1 &gt; 1 ||\</p><p class=3DMsoNormal>&gt;&gt; +#if SDHC_CA=
PAB_64BITBUS &gt; 1 || SDHC_CAPAB_ADMA2 &gt; 1 || SDHC_CAPAB_ADMA1 &gt; 1 |=
| \</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SDHC_CAP=
AB_TOUNIT &gt; 1</p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #error Capabilities=
 features can have value 0 or 1 only!</p><p class=3DMsoNormal>&gt;&gt;=C2=
=A0 #endif</p><p class=3DMsoNormal>&gt;&gt; @@ -90,16 +82,36 @@</p><p class=
=3DMsoNormal>&gt;&gt;=C2=A0 #endif</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nb=
sp;</o:p></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 #define SDHC_CAPAB_REG_DEF=
AULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \</p><p class=3DMsoNormal>=
&gt;&gt; -=C2=A0=C2=A0 ((SDHC_CAPAB_64BITBUS &lt;&lt; 28) | (SDHC_CAPAB_18V=
 &lt;&lt; 26) |=C2=A0=C2=A0=C2=A0=C2=A0 \</p><p class=3DMsoNormal>&gt;&gt; =
-=C2=A0=C2=A0=C2=A0 (SDHC_CAPAB_30V &lt;&lt; 25) | (SDHC_CAPAB_33V &lt;&lt;=
 24) |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \</p><p class=
=3DMsoNormal>&gt;&gt; -=C2=A0=C2=A0=C2=A0 (SDHC_CAPAB_SUSPRESUME &lt;&lt; 2=
3) | (SDHC_CAPAB_SDMA &lt;&lt; 22) |=C2=A0 \</p><p class=3DMsoNormal>&gt;&g=
t; -=C2=A0=C2=A0=C2=A0 (SDHC_CAPAB_HIGHSPEED &lt;&lt; 21) | (SDHC_CAPAB_ADM=
A1 &lt;&lt; 20) |=C2=A0 \</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0 ((=
SDHC_CAPAB_64BITBUS &lt;&lt; 28) | (SDHC_CAPAB_ADMA1 &lt;&lt; 20) |=C2=A0=
=C2=A0 \</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (SD=
HC_CAPAB_ADMA2 &lt;&lt; 19) | (MAX_BLOCK_LENGTH &lt;&lt; 16) |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (SDHC_CAPAB_BASECLKFREQ &lt;&lt; 8) | (SDHC_CAPAB_TOUNIT &lt;&lt;=
 7) | \</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (SDH=
C_CAPAB_TOCLKFREQ))</p><p class=3DMsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p=
 class=3DMsoNormal>&gt;&gt;=C2=A0 #define MASKED_WRITE(reg, mask, val)=C2=
=A0 (reg =3D (reg &amp; (mask)) | (val))</p><p class=3DMsoNormal>&gt;&gt;<o=
:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt; +static void sdhci_init_ca=
pareg(SDHCIState *s, Error **errp)</p><p class=3DMsoNormal>&gt;&gt; +{</p><=
p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t capareg =3D 0;</p=
><p class=3DMsoNormal>&gt;&gt; +</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=
=C2=A0=C2=A0 switch (s-&gt;spec_version) {</p><p class=3DMsoNormal>&gt;&gt;=
 +=C2=A0=C2=A0=C2=A0 case 2: /* default version */</p><p class=3DMsoNormal>=
&gt;&gt; +</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* fallback=
 */</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 case 1:</p><p clas=
s=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capareg =
=3D FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s-&gt;cap.high_speed);</p><p=
 class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cap=
areg =3D FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s-&gt;cap.sdma);</p><p class=
=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capareg =
=3D FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s-&gt;cap.suspend);</p><p c=
lass=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capar=
eg =3D FIELD_DP64(capareg, SDHC_CAPAB, V33, s-&gt;cap.v33);</p><p class=3DM=
soNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capareg =3D F=
IELD_DP64(capareg, SDHC_CAPAB, V30, s-&gt;cap.v30);</p><p class=3DMsoNormal=
>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capareg =3D FIELD_DP6=
4(capareg, SDHC_CAPAB, V18, s-&gt;cap.v18);</p><p class=3DMsoNormal>&gt;&gt=
; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</p><p class=3DMsoNorma=
l>&gt;&gt; +</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 default:<=
/p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_setg(errp, &quot;Unsupported spec version: %u&quot;, s-&gt;spec_v=
ersion);</p><p class=3DMsoNormal>&gt; </p><p class=3DMsoNormal>&gt; Probabl=
y best to have a return here, encase some logic added below</p><p class=3DM=
soNormal>&gt; later relies on this being successful.</p><p class=3DMsoNorma=
l><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Indeed, better safe than sorry.=
</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 }</p><p class=3DMsoNo=
rmal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 s-&gt;capareg =3D capareg;</p><p class=3D=
MsoNormal>&gt;&gt; +}</p><p class=3DMsoNormal>&gt;&gt; +</p><p class=3DMsoN=
ormal>&gt;&gt;=C2=A0 static uint8_t sdhci_slotint(SDHCIState *s)</p><p clas=
s=3DMsoNormal>&gt;&gt;=C2=A0 {</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return (s-&gt;norintsts &amp; s-&gt;norintsigen) || (s-&=
gt;errintsts &amp; s-&gt;errintsigen) ||</p><p class=3DMsoNormal>&gt;&gt; @=
@ -1026,7 +1038,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val,=
 unsigned size)</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 case SDHC_TRNMOD:</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* DMA can be enabled only if it is suppo=
rted as indicated by</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * capabilities register */</p><p cl=
ass=3DMsoNormal>&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(=
s-&gt;capareg &amp; SDHC_CAN_DO_DMA)) {</p><p class=3DMsoNormal>&gt;&gt; +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(s-&gt;capareg &amp; R_SDHC=
_CAPAB_SDMA_MASK)) {</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &amp;=3D ~S=
DHC_TRNS_DMA;</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MASKED_WRITE(s-&gt;trnmod, mask,=
 value &amp; SDHC_TRNMOD_MASK);</p><p class=3DMsoNormal>&gt;&gt; @@ -1181,6=
 +1193,10 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error=
 **errp)</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s-&gt;version =3D (SDHC_HCVER_VENDOR &lt;&lt; 8) | (s-&gt;spec_ve=
rsion - 1);</p><p class=3DMsoNormal>&gt;&gt; +</p><p class=3DMsoNormal>&gt;=
&gt; +=C2=A0=C2=A0=C2=A0 if (s-&gt;capareg =3D=3D UINT64_MAX) {</p><p class=
=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci_ini=
t_capareg(s, errp);</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<=
/p><p class=3DMsoNormal>&gt;&gt;=C2=A0 }</p><p class=3DMsoNormal>&gt;&gt;<o=
:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt;=C2=A0 static void sdhci_in=
itfn(SDHCIState *s)</p><p class=3DMsoNormal>&gt;&gt; @@ -1297,8 +1313,21 @@=
 const VMStateDescription sdhci_vmstate =3D {</p><p class=3DMsoNormal>&gt;&=
gt;=C2=A0=C2=A0 * specific host controller implementation */</p><p class=3D=
MsoNormal>&gt;&gt;=C2=A0 static Property sdhci_properties[] =3D {</p><p cla=
ss=3DMsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8(&qu=
ot;sd-spec-version&quot;, SDHCIState, spec_version, 2),</p><p class=3DMsoNo=
rmal>&gt;&gt; -=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64(&quot;capareg&quot;, S=
DHCIState, capareg,</p><p class=3DMsoNormal>&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SDHC_CAPAB_REG_DEFAULT),</p><=
p class=3DMsoNormal>&gt;&gt; +</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=
=A0=C2=A0 /* DMA */</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 DE=
FINE_PROP_BOOL(&quot;sdma&quot;, SDHCIState, cap.sdma, true),</p><p class=
=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* Suspend/resume support */</p><=
p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL(&quot;sus=
pend&quot;, SDHCIState, cap.suspend, false),</p><p class=3DMsoNormal>&gt;&g=
t; +=C2=A0=C2=A0=C2=A0 /* High speed support */</p><p class=3DMsoNormal>&gt=
;&gt; +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL(&quot;high-speed&quot;, SDHCISta=
te, cap.high_speed, true),</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=
=C2=A0 /* Voltage support 3.3/3.0/1.8V */</p><p class=3DMsoNormal>&gt;&gt; =
+=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL(&quot;3v3&quot;, SDHCIState, cap.v33, =
true),</p><p class=3DMsoNormal>&gt;&gt; +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOO=
L(&quot;3v0&quot;, SDHCIState, cap.v30, false),</p><p class=3DMsoNormal>&gt=
;&gt; +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL(&quot;1v8&quot;, SDHCIState, cap=
.v18, false),</p><p class=3DMsoNormal>&gt; </p><p class=3DMsoNormal>&gt; Th=
is is a change of the default value.</p><p class=3DMsoNormal>&gt; </p><p cl=
ass=3DMsoNormal>&gt; I think you really need to specify specific changes in=
 the commit</p><p class=3DMsoNormal>&gt; message. That way is the defaults =
cause breakages we will be able to</p><p class=3DMsoNormal>&gt; bisect it i=
n the future.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNo=
rmal>You are right I need to be more descriptive in my messages.</p><p clas=
s=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I wonder how to con=
sider the &quot;default&quot; SDHC_CAPAB_REG_DEFAULT, it seems</p><p class=
=3DMsoNormal>to only correctly matches the Zynq-7000 SDHCI.</p><p class=3DM=
soNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Note that I only depreca=
te the 'capareg' property, it isn't modified</p><p class=3DMsoNormal>until =
all HCI are correctly passed to the new properties (verified using</p><p cl=
ass=3DMsoNormal>the qtests), then I remove it.</p><p class=3DMsoNormal>This=
 way this series is bisectable and due to the qtests, no breakage</p><p cla=
ss=3DMsoNormal>should be introduced.</p><p class=3DMsoNormal><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal>I tried to use the Spec default value for each =
property introduced.</p><p class=3DMsoNormal>I will sort the properties per=
 Spec introduction, with a comment around.</p><p class=3DMsoNormal><o:p>&nb=
sp;</o:p></p><p class=3DMsoNormal>&gt;&gt; +</p><p class=3DMsoNormal>&gt;&g=
t; +=C2=A0=C2=A0=C2=A0 /* capareg: deprecated */</p><p class=3DMsoNormal>&g=
t;&gt; +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64(&quot;capareg&quot;, SDHCISta=
te, capareg, UINT64_MAX),</p><p class=3DMsoNormal>&gt;&gt; +</p><p class=3D=
MsoNormal>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64(&quot;m=
axcurr&quot;, SDHCIState, maxcurr, 0),</p><p class=3DMsoNormal>&gt;&gt; =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_BOOL(&quot;pending-insert-quirk&quot=
;, SDHCIState, pending_insert_quirk,</p><p class=3DMsoNormal>&gt;&gt;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false),</p><p class=3DM=
soNormal>&gt;&gt; --</p><p class=3DMsoNormal>&gt;&gt; 2.15.1</p><p class=3D=
MsoNormal>&gt;&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt;&gt;<o:p>&n=
bsp;</o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorma=
l><o:p>&nbsp;</o:p></p></div></body></html>=

--_ADB7B3D6-1EF9-4550-B374-83AD1275E06B_--

