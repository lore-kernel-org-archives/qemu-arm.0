Received: by 10.28.173.206 with SMTP id w197csp2998621wme;
        Mon, 8 Jan 2018 14:33:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBot1IG01xKOLcfRiJqCqkkQ0FygsHuz2x1NkGwAEbJ9mQ/3xYs0uBQX9vqx82bE5+ZF9GbCT
X-Received: by 10.37.131.141 with SMTP id t13mr12781569ybk.171.1515450835794;
        Mon, 08 Jan 2018 14:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515450835; cv=none;
        d=google.com; s=arc-20160816;
        b=lfmCXn3s6U3zTFDKLVD/Q38YRNrcze9iKwEUOJcJpMfszefNwAVv5bW3LmuhK6svhR
         PI7T2gPrOkGIv/Jy5Y1SbLw2lSt5B68ipAf1lzYD0qzK/J1L6w2BLxidrRqCcYz/W9Rt
         A0B4VGcurKyqKkgbzW2jFQT72tPvjRoLvHhO27dYII9cWjrysi9OIUWsZ2XiPRalGDyf
         VEW2p3/PgZUMFhMGedNOPKzJGSbzST1gDfMJPFo9MuRf3zyXOV+72M6WmotIFV3/obP0
         OXKJaauCWB3AKj1q/ha2eio0/KNFZNMDSPRQbvUcI0dHeHRRsi4XIuSMyNo83mGpHaMa
         fFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=cHXY0Z/fVghYRDB5EQNqDIWTb6jPzIR6RLO0WwfstQc=;
        b=hVdZwV6Cebz+2V6ljXXT0uakFXK4BXIKl4mOhgiaecs3Cs7SjOKRSEE6XOl1FG4l7a
         VbaZLU5BmGN9GqVYKoDjOjEfAV1tK1Aev3lgGvBhRl3+JV3oanZveDuLmlSgQm6A2Nzt
         X3/MvUybbm7Vw39Co1t5jinPvwySt3SkJkExrBfZGCOxxHZXyLsBPz/eFTYeKwjW5CT/
         BA/XhyXPYwkYnG+DnqQgzDnfSauerBGQ++30X+UNAn0AnIUhoyqZvSukpiT56Zv03Pjd
         I4tS+TVQR5KW2DfVBFVXYseDDQeOZIyVUmaiBKClzIQsLckEt8IZr7ytRpCu3O/XKrzP
         bfbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EzbL9rLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si499930ybm.421.2018.01.08.14.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 14:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EzbL9rLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfzP-0001xk-99
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 17:33:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYfzH-0001wR-A1
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:33:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYfzC-0006tg-8s
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:33:47 -0500
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:33832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYfzC-0006t7-07; Mon, 08 Jan 2018 17:33:42 -0500
Received: by mail-ua0-x242.google.com with SMTP id v22so7929876uaj.1;
	Mon, 08 Jan 2018 14:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cHXY0Z/fVghYRDB5EQNqDIWTb6jPzIR6RLO0WwfstQc=;
	b=EzbL9rLpBRodRKFPbs81XCUdJhRFHUQqeC/+Tm6qM6+S2KB9KQH3UXofXjuHUe3fwp
	aT3MSg8FzrZZijJ8PvNn2pfV9HfdOVmpNDaVVD66pGlNSn9CslOrihXCNLKicwNTzuJ4
	SGSLUGHUctTFoZ8emFU2PUzN1LhP/h8SPfy61C/GKtsmsNUhiS0xTjhwN/xa8n4+xP9/
	Lt+U53F4wTn0umKS7t1Ltb+VIcGj+Zr36ELCMkMprFLM7ED8OgGsBjNOw0ZMc1gBdnms
	z6p8aFRauLHtxbsG+LkBpV8IN0ZPTA5gnNofvyL/pVwxm869d5cP03PmfaluagziPqon
	f+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=cHXY0Z/fVghYRDB5EQNqDIWTb6jPzIR6RLO0WwfstQc=;
	b=GNpONCCs+OtANVq3JzQFcmkypZXHhWmqr94De9wuZgGTuCB71HC25MKG/vvbkXpkpW
	IVAb8d4CaNeBFtQJFUAyNlEGNaWf4OAqI77NwjJyiE0AZo2cRHEeUjeSwokgzwyI5Ikk
	z6bAYw3KZ5OpfwuoCQd2k8O6L2SRI7V0/dAToVjwg6ikHoxByJWYF6DbqkpzkbnixzN3
	xrI2suuNfAeASquIH6TzqoWkCjAV4yyHkzZ/Qhwd4BAw0kByhp2pNg78eMnsuizaiMG7
	ZiCKbem0U9+Oi7PBx6QBgTTaOtF301FDPHragmY3p81nRmInl2Jj1Rb9w2ZpXp2/2hdQ
	/MtQ==
X-Gm-Message-State: AKwxytdo/Ge6iBBUj/ERcYNOor/CpCKAW2HmgVhA1sH1dt3ZIwjmhYHO
	PsCkZAWUfrnq4jxDoT07ryQ=
X-Received: by 10.159.35.161 with SMTP id 30mr12825946uao.134.1515450821174;
	Mon, 08 Jan 2018 14:33:41 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	y19sm4665619uay.55.2018.01.08.14.33.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 14:33:40 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-3-f4bug@amsat.org>
	<CAKmqyKOH3dsA=8xd6sK6foexSdjmZEijjuJP3uiPRxErKmEJ3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <cfcb857c-f2a1-631f-40e1-6c74d4aaa929@amsat.org>
Date: Mon, 8 Jan 2018 19:33:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOH3dsA=8xd6sK6foexSdjmZEijjuJP3uiPRxErKmEJ3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 02/31] sdhci: add basic Spec
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGuWdwlQfA1C

On 01/08/2018 07:00 PM, Alistair Francis wrote:
> On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sdhci-internal.h | 22 ++++++++++++++++++-
>>  include/hw/sd/sdhci.h  |  6 ++++++
>>  hw/sd/sdhci.c          | 58 ++++++++++++++++++++++++++++++++++++--------------
>>  3 files changed, 69 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
>> index cf4a055159..6944fcaf00 100644
>> --- a/hw/sd/sdhci-internal.h
>> +++ b/hw/sd/sdhci-internal.h
>> @@ -86,6 +86,9 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>>
>>  /* R/W Host control Register 0x0 */
>>  #define SDHC_HOSTCTL                   0x28
>> +FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
>> +FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
>> +FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
>>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>>  #define SDHC_CTRL_SDMA                 0x00
>>  #define SDHC_CTRL_ADMA1_32             0x08
>> @@ -96,6 +99,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>>  /* R/W Power Control Register 0x0 */
>>  #define SDHC_PWRCON                    0x29
>>  #define SDHC_POWER_ON                  (1 << 0)
>> +FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
>>
>>  /* R/W Block Gap Control Register 0x0 */
>>  #define SDHC_BLKGAP                    0x2A
>> @@ -118,6 +122,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>>
>>  /* R/W Timeout Control Register 0x0 */
>>  #define SDHC_TIMEOUTCON                0x2E
>> +FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
>>
>>  /* R/W Software Reset Register 0x0 */
>>  #define SDHC_SWRST                     0x2F
>> @@ -174,17 +179,32 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
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
>> index ddd5040410..266030dc8d 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -102,6 +102,12 @@ typedef struct SDHCIState {
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
>> index cd4a8efdd7..e7dbab2fdc 100644
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
>> @@ -90,16 +82,33 @@
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
>> +    case 1:
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.high_speed);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.suspend);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V33, s->cap.v33);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V30, s->cap.v30);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V18, s->cap.v18);
>> +        break;
>> +
> 
> Don't we need to support v2 here as well? We default to v2 don't we?

argh you right, I planed to also put 2 but completely forgot :(

we don't want to support v1, but v2 expects these capabilities from v1.

> 
> Alistair
> 
>> +    default:
>> +        error_setg(errp, "Unsupported spec version: %u", s->spec_version);
>> +    }
>> +    s->capareg = capareg;
>> +}
>> +
>>  static uint8_t sdhci_slotint(SDHCIState *s)
>>  {
>>      return (s->norintsts & s->norintsigen) || (s->errintsts & s->errintsigen) ||
>> @@ -1032,7 +1041,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>>      case SDHC_TRNMOD:
>>          /* DMA can be enabled only if it is supported as indicated by
>>           * capabilities register */
>> -        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
>> +        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
>>              value &= ~SDHC_TRNS_DMA;
>>          }
>>          MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
>> @@ -1186,6 +1195,10 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
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
>> @@ -1305,8 +1318,21 @@ const VMStateDescription sdhci_vmstate = {
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
> 
