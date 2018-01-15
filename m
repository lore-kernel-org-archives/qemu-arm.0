Received: by 10.28.173.206 with SMTP id w197csp2188518wme;
        Sun, 14 Jan 2018 18:43:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBosj8KUNKwSo/Qn7GG7Ms8b6kDbyLcvLXiBCphd48USbBsSKaZGaNx0fNmBeDlavbfdYFxmi
X-Received: by 10.37.191.206 with SMTP id q14mr8228032ybm.21.1515984230369;
        Sun, 14 Jan 2018 18:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515984230; cv=none;
        d=google.com; s=arc-20160816;
        b=OGeny5FnKd5K3FmNetiKye8jDHWmJY3JsevGof7+Y0O3JkAcOIvC48erxNySaF+aDE
         2/hOAx7yN0IWuJZnrZsGRXdfFEg2LlS+KcxNLn8XfuZ1j95h6LIoBpts4D0zk2zrMwW3
         VFremJS1nWwQb76vmSdRLDIfU9NubnZqkv9jTv+XUpK422ML9CcZSkExXo91gV1wIo5n
         WMfmJKYeuxBdx6Um3Y3cM5jZ4cdC1FkVAAXraF3exytN0/b6djJIu9VViA7pzq76m344
         Jyrx/UMlGalb9qt+EIP1V53W7vMJj51irlhi8HvQrXjQBzI6CO6rws6tw+MC5IiwBFcu
         25tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=R6Imr8Nt+sl3jPf4/389ksGSe9i9QsOfXky3o4+fX3U=;
        b=DOMTYVpY3e0AX1rAaSG6kADU8/AZ6fAbvVWUESIY3kJZtbeU+3A+IRn70Fq2R6SlNa
         nsEq5bVa3s9/1/BT5WbQMR6T8CnRBNRvoyurS/C1giKcLT78kFNCckkZfEo0uLzyubGa
         ngW7Fq+3G2rxAqR0Ag3X0HuucIwTer3pR4PMC/aDvFcvPK+t2lj+W5pka5bXg/A6O/tY
         kG6URlmP/Kajwy0fQLAww+dd30e4C6f87tmolxYdJ27MjEbfIdL5AAX2nhpdy25TpRap
         ntPem2loU/GT4B6G9/cno91TLELahAJFIMhYjiED47Yg2jY5S1kBwbOG0daApJeRVykC
         88Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=irO9EoQb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c194si2519252ywh.491.2018.01.14.18.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2018 18:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=irO9EoQb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaukX-0006iA-P9
	for alex.bennee@linaro.org; Sun, 14 Jan 2018 21:43:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaukF-0006hV-Cq
	for qemu-devel@nongnu.org; Sun, 14 Jan 2018 21:43:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaukE-0001iG-1y
	for qemu-devel@nongnu.org; Sun, 14 Jan 2018 21:43:31 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:40790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaukD-0001i0-Rm; Sun, 14 Jan 2018 21:43:29 -0500
Received: by mail-it0-x242.google.com with SMTP id 196so61047iti.5;
	Sun, 14 Jan 2018 18:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=R6Imr8Nt+sl3jPf4/389ksGSe9i9QsOfXky3o4+fX3U=;
	b=irO9EoQbtincRw4NvMz1MXYJzkRNn7BZjQtwpVXmQD18bu82Es2H51EW+4mvUF/13h
	kUc+90IgQYtgZ1lr1DKCTBYI7I9GWnvHatFrvnQy+p5dvAEbGHTz84BmJypzKDx+70O1
	Px1ovsSo6brKnqyLJokoMkGO1fEO3qpp41R1HnjmNIQVcbIi7D3TIaP7Ywg2oj6IAxLZ
	v7WAFe740GdP32C5deDmA5N3DcJ1qLgUjkTh0zbWSk9lzYACnhL1BEeXzm4S0s4O2HUA
	ew50vbQVDywqE1ZbEQVb4xOi3IXQQQEoi2oGJxCHR1/s9QQvJYcB/MFyvaWphKH3TTQf
	yoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=R6Imr8Nt+sl3jPf4/389ksGSe9i9QsOfXky3o4+fX3U=;
	b=cOdjl4zJUzQvPJqFqyZT7kwOSwZo3aPme4ZGwoog87i3aE/olpEJverGhtnMznbXzL
	HhzsPzn12iufqOAdjLfg7qIDPV3+FzpZRVfAlNizUK5HGlyfbLYQEutbr/nQAL1EU4oH
	DD7sQ/6s3TiQVRqoyjac+3Nr0r7EpejViFcA064DfkrrEsoZw/SfNI0CWqUdU3SS++P9
	FiMwmZdik1+cNlnlJibB8o6BulbzEDhioiRjnhNpK/BiTN0Zen0oBn9y5+eRo2vXeK9Q
	4bqYKy0W2WcbZUpdawYY7IFTNPDCINfl34OEPKCxRFMxjAlme3v5cJiB/sFqBl+2p/Un
	u/jg==
X-Gm-Message-State: AKwxytfvQdDBzGBkz6Ca5Mmb+MIGEiaIeZFx+LhIelEFOxrVQ/GJtZ99
	vBlAOzmvSz5ibIi/O/Q2IW31PJVm9k325RCxTH4=
X-Received: by 10.36.37.2 with SMTP id g2mr12207825itg.129.1515984209061; Sun,
	14 Jan 2018 18:43:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.165.135 with HTTP; Sun, 14 Jan 2018 18:43:28 -0800 (PST)
In-Reply-To: <CAKmqyKOJ2eL--7o2UyptujNDxHwVVbmG50K39rZAA+VJgxML8w@mail.gmail.com>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-9-f4bug@amsat.org>
	<CAKmqyKOJ2eL--7o2UyptujNDxHwVVbmG50K39rZAA+VJgxML8w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 14 Jan 2018 23:43:28 -0300
X-Google-Sender-Auth: 6e2nPI7Bilx-mHApNqdKcSql-7k
Message-ID: <CAAdtpL6MzwtBYiPhx3zO12u1NVQkFsywbP473zBVySvycOAQcw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-devel] [PATCH v6 08/21] sdhci: add v3 capabilities
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jMFoPAuNcEZP

On Fri, Jan 12, 2018 at 9:08 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/sd/sdhci-internal.h | 21 +++++++++++++++++++++
>>  include/hw/sd/sdhci.h  |  2 ++
>>  hw/sd/sdhci.c          | 22 ++++++++++++++++++++--
>>  3 files changed, 43 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
>> index 4ed9727ec3..ac4704eb61 100644
>> --- a/hw/sd/sdhci-internal.h
>> +++ b/hw/sd/sdhci-internal.h
>> @@ -43,6 +43,7 @@
>>  #define SDHC_TRNS_DMA                  0x0001
>>  #define SDHC_TRNS_BLK_CNT_EN           0x0002
>>  #define SDHC_TRNS_ACMD12               0x0004
>> +#define SDHC_TRNS_ACMD23               0x0008 /* since v3 */
>>  #define SDHC_TRNS_READ                 0x0010
>>  #define SDHC_TRNS_MULTI                0x0020
>>  #define SDHC_TRNMOD_MASK               0x0037
>> @@ -183,12 +184,23 @@ FIELD(SDHC_ACMD12ERRSTS, TIMEOUT_ERR,  1, 1);
>>  FIELD(SDHC_ACMD12ERRSTS, CRC_ERR,      2, 1);
>>  FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
>>
>> +/* Host Control Register 2 (since v3) */
>> +#define SDHC_HOSTCTL2                  0x3E
>
> Why not use the REG() macro here?

Because this is a 16-bit register, and I don't want to confuse with REG32()

Although the A_ address is correct, the R_ index only works if all
REG() are from the same size.

We should add some alignment check, I was thinking about using
_Static_assert() in the macros.

>
> Besides that the patch looks good.
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks!

>
> Alistair
>
>
>> +FIELD(SDHC_HOSTCTL2, UHS_MODE_SEL,     0, 3);
>> +FIELD(SDHC_HOSTCTL2, V18_ENA,          3, 1); /* UHS-I only */
>> +FIELD(SDHC_HOSTCTL2, DRIVER_STRENGTH,  4, 2); /* UHS-I only */
>> +FIELD(SDHC_HOSTCTL2, EXECUTE_TUNING,   6, 1); /* UHS-I only */
>> +FIELD(SDHC_HOSTCTL2, SAMPLING_CLKSEL,  7, 1); /* UHS-I only */
>> +FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
>> +FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
>> +
>>  /* HWInit Capabilities Register 0x05E80080 */
>>  #define SDHC_CAPAB                     0x40
>>  FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
>>  FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
>>  FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
>>  FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
>> +FIELD(SDHC_CAPAB, EMBEDDED_8BIT,      18, 1); /* since v3 */
>>  FIELD(SDHC_CAPAB, ADMA2,              19, 1); /* since v2 */
>>  FIELD(SDHC_CAPAB, ADMA1,              20, 1); /* v1 only? */
>>  FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
>> @@ -198,6 +210,15 @@ FIELD(SDHC_CAPAB, V33,                24, 1);
>>  FIELD(SDHC_CAPAB, V30,                25, 1);
>>  FIELD(SDHC_CAPAB, V18,                26, 1);
>>  FIELD(SDHC_CAPAB, BUS64BIT,           28, 1); /* since v2 */
>> +FIELD(SDHC_CAPAB, ASYNC_INT,          29, 1); /* since v3 */
>> +FIELD(SDHC_CAPAB, SLOT_TYPE,          30, 2); /* since v3 */
>> +FIELD(SDHC_CAPAB, BUS_SPEED,          32, 3); /* since v3 */
>> +FIELD(SDHC_CAPAB, DRIVER_STRENGTH,    36, 3); /* since v3 */
>> +FIELD(SDHC_CAPAB, DRIVER_TYPE_A,      36, 1); /* since v3 */
>> +FIELD(SDHC_CAPAB, DRIVER_TYPE_C,      37, 1); /* since v3 */
>> +FIELD(SDHC_CAPAB, DRIVER_TYPE_D,      38, 1); /* since v3 */
>> +FIELD(SDHC_CAPAB, TIMER_RETUNNING,    40, 4); /* since v3 */
>> +FIELD(SDHC_CAPAB, SDR50_TUNNING,      45, 1); /* since v3 */
>>
>>  /* HWInit Maximum Current Capabilities Register 0x0 */
>>  #define SDHC_MAXCURR                   0x48
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index 26b50583af..f45e911065 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -104,6 +104,8 @@ typedef struct SDHCIState {
>>          /* v2 */
>>          bool adma1, adma2;
>>          bool bus64;
>> +        /* v3 */
>> +        uint8_t slot_type, sdr, strength;
>>      } cap;
>>  } SDHCIState;
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index ab4ffeca1d..773eb68fd6 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -63,6 +63,18 @@ static void sdhci_init_capareg(SDHCIState *s, Error *=
*errp)
>>      uint32_t val;
>>
>>      switch (s->spec_version) {
>> +    case 3:
>> +        val =3D FIELD_EX64(capareg, SDHC_CAPAB, SLOT_TYPE);
>> +        if (val) {
>> +            error_setg(errp, "slot-type not supported");
>> +            return;
>> +        }
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SLOT_TYPE, val);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, BUS_SPEED, s->cap.s=
dr);
>> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, DRIVER_STRENGTH,
>> +                             s->cap.strength);
>> +
>> +    /* fallback */
>>      case 2: /* default version */
>>          capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, ADMA1, s->cap.adma1=
);
>>          capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, ADMA2, s->cap.adma2=
);
>> @@ -1169,8 +1181,11 @@ static inline unsigned int sdhci_get_fifolen(SDHC=
IState *s)
>>
>>  static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
>>  {
>> -    if (s->spec_version !=3D 2) {
>> -        error_setg(errp, "Only Spec v2 is supported");
>> +    switch (s->spec_version) {
>> +    case 2 ... 3:
>> +        break;
>> +    default:
>> +        error_setg(errp, "Only Spec v2/v3 are supported");
>>          return;
>>      }
>>      s->version =3D (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
>> @@ -1319,6 +1334,9 @@ static Property sdhci_properties[] =3D {
>>      DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
>>
>>      DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
>> +    DEFINE_PROP_UINT8("slot-type", SDHCIState, cap.slot_type, 0),
>> +    DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
>> +    DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
>>
>>      /* capareg: deprecated */
>>      DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
>> --
>> 2.15.1
>>
>>
