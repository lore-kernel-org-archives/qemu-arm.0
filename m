Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp904874wrq;
        Mon, 4 Jun 2018 11:04:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKev2ZBGoQhDPhJnwqbTmi776+T2NeaxY9+ne77YiItY0g1b2D2k+GRcx70TLlk0rKZ5Pjp
X-Received: by 2002:a0c:c344:: with SMTP id j4-v6mr11094870qvi.245.1528135452470;
        Mon, 04 Jun 2018 11:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528135452; cv=none;
        d=google.com; s=arc-20160816;
        b=jKLGsJ8Rqwua0tDaFnGQ/CgBLlUt21sjiUy/+97OxLl+3YzHOQqszHYrN2IhEhmcvx
         2nDuqy2i3vG8aiPrVNcS8PvmP7VByz/1vmqK5uYkQOiQE43Wl3PDt80CYnovPsrsMN72
         P2QmcFsusd2aLA3CiD2IVdt5GwlhIGWe8vC9kfzb4C9iThDPmQzdQv+t/rzSaTpu8J7h
         38EcEGCSxrIYrnsJ3nJUOT+jM1dVdFcOSqzfbCCtqhyTutPXreYaN6amob0M58mbltDJ
         ntHyMEquzWxtdcgT8vqgrwyxqwxS/WeOTWU18YgwxBHvkM2udLwqEfzRitCkTte1Sxo8
         o5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=jF/j6Orj5DQL1Bn0WmOp9aAGerH6S12eYz+hotM6n5s=;
        b=MVrDa646pzW/L+YexHCEYn0VQjfIvNOt6J1uNyedlNADr68iTMJBv/4/IriLoqFxyQ
         4/It98Gg2wySzZ3nLn8Zxm8CcD17rlP3aKgprBopDd0AHhzyiqHznpFrI4RVreycT3bG
         rsYr5vQHGR1G5mn0FJp8N4VW/aY8q7Yj/Mk8bcK9B38Jxiec96oD7D/9T9wkifLG8WAf
         91j9/f717Cq3Koww91LmCPs94yTMHIVUuTZfuoYSqZXZvh4m0d5ngQrVLQjrC3J0IUnX
         Dt7bpIQUSaXP4o2d8JVGnx0IeQSN+hwoAWfmPDuhr/b8Bi7XNwSCbiDFetixi6SCSlck
         GZ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XmeBC5V5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17-v6si450452qtg.366.2018.06.04.11.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:04:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XmeBC5V5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPtpz-0000YN-V8
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:04:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPto7-00083c-K4
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 14:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPto5-0002Cb-O1
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 14:02:15 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:44733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPtnt-00024U-QS; Mon, 04 Jun 2018 14:02:02 -0400
Received: by mail-lf0-x241.google.com with SMTP id 36-v6so24698818lfr.11;
	Mon, 04 Jun 2018 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jF/j6Orj5DQL1Bn0WmOp9aAGerH6S12eYz+hotM6n5s=;
	b=XmeBC5V58FfYeLAtcYSJk9oeBeh3kFPWxySkmhgXSHnxuWl7a/N0Yt7sGtm5WvYdvj
	tH2/vV7iAX3zbBXOXRGxBM+xQcz/nNkVUtIVprSaCranjQ6XM2uWExpgC558wEMLIhgM
	5un9+Fm7yrjw5eFJAzIGCeAOZOvsueSICZbgXej9N7pkiIOBhMxr/QEyMWLmKjuHjNYe
	8OKMaSCYaUggXaGGx98l1HPeG3oqXJuyQ9d4O1HwvKyiyzXmO1SCF538PKhdUttPIEtz
	qNHP8ac3AkUCSUJrE4+2gtlIyRoPAp2BM+vtlJSYtb6ohZIM83EtgcChASUhoQXIrxhY
	WJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jF/j6Orj5DQL1Bn0WmOp9aAGerH6S12eYz+hotM6n5s=;
	b=nvCWwGqYAXyi3PunrrH4s4CbjQOALSTql/p/BUhO588/pJPe287RtDO6KVhxLWKKH3
	ro/BQhWXB3kIx8DVjYGbRV5UDvxCYiyi32V2LDlw6+o1XDXLxaEXo3115hWoe6v/MGzq
	MGwOoVVuqWCSDV5eHzyEaetknSRekWM09Ohu2/COC4V1DjaIMdhr8Ibc4Pt/aMo556hw
	qdGKF8oatlmpS/OLzC4nyDVGrqOUZ5fFyCOLHyOj5s9UESZyYSkoo6adDxxw6EHxciER
	6+OuyQYArBvifswxnbBMQqS9DeZrOVYl/C0mP+NSoKFVnntnJl7JLVWq4pp8aGU8O86R
	IarQ==
X-Gm-Message-State: ALKqPweJpEYCmMuYoQ1KhwRaCl3242nTYonLHRl+SbMJv4mh9TKxiDXJ
	frx5J+wKYLQZ77Vjkc/dluc3a0jNofVDeg+HrvM=
X-Received: by 2002:a2e:63db:: with SMTP id
	s88-v6mr12852371lje.78.1528135319093; 
	Mon, 04 Jun 2018 11:01:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:01:28 -0700 (PDT)
In-Reply-To: <f50fb89a-4d6d-7aeb-3619-f95a04981d02@amsat.org>
References: <20180602205511.6077-1-f4bug@amsat.org>
	<f50fb89a-4d6d-7aeb-3619-f95a04981d02@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:01:28 -0700
Message-ID: <CAKmqyKMigT-nKh_BHrx_ab43OX5xYFEJHW6CuGDuF2s6_dYuGg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [RFC PATCH] hw/registerfields: Deposit fields "in
 place"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BC8+3obYaxse

On Sat, Jun 2, 2018 at 3:26 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 06/02/2018 05:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> These macros are always used to deposit a field in place.
>> Update them to take the pointer argument.
>>
>> As these macros are constructed using compound statements,
>> it is easy to not use the return value, and the compiler
>> doesn't warn. Thus this change makes these macros safer.
>
> "and the compiler doesn't warn [if the return value is ignored]."
>
> Adding __attribute__ ((warn_unused_result)) to depositXX() doesn't help
> since the retval is used inside the compound statement.

Doesn't this then limit someone from writing an if statement around a
value in a register?

Alistair

>
>>
>> This also helps having a simpler/shorter code to review.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/arm/smmuv3-internal.h    |  2 +-
>>  include/hw/registerfields.h | 14 +++++-----
>>  hw/arm/smmuv3.c             | 28 +++++++++----------
>>  hw/dma/xlnx-zdma.c          |  6 ++--
>>  hw/sd/sd.c                  |  4 +--
>>  hw/sd/sdhci.c               | 56 ++++++++++++++++++-------------------
>>  6 files changed, 53 insertions(+), 57 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index a9d714b56e..2f020e2e90 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -203,7 +203,7 @@ static inline bool smmuv3_eventq_enabled(SMMUv3State=
 *s)
>>
>>  static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_typ=
e)
>>  {
>> -    s->cmdq.cons =3D FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type)=
;
>> +    FIELD_DP32(&s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>>  }
>>
>>  /* Commands */
>> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
>> index 2659a58737..14a12f6a48 100644
>> --- a/include/hw/registerfields.h
>> +++ b/include/hw/registerfields.h
>> @@ -45,7 +45,7 @@
>>  #define ARRAY_FIELD_EX32(regs, reg, field)                             =
   \
>>      FIELD_EX32((regs)[R_ ## reg], reg, field)
>>
>> -/* Deposit a register field.
>> +/* Deposit a register field (in place).
>>   * Assigning values larger then the target field will result in
>>   * compilation warnings.
>>   */
>> @@ -54,20 +54,20 @@
>>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;             =
   \
>>      } v =3D { .v =3D val };                                            =
       \
>>      uint32_t d;                                                        =
   \
>> -    d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,      =
     \
>> -                  R_ ## reg ## _ ## field ## _LENGTH, v.v);            =
   \
>> -    d; })
>> +    d =3D deposit32(*(storage), R_ ## reg ## _ ## field ## _SHIFT,     =
     \
>> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);            =
    \
>
> I forgot to remove an extra space here.
>
>> +    *(storage) =3D d; })
>>  #define FIELD_DP64(storage, reg, field, val) ({                        =
   \
>>      struct {                                                           =
   \
>>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;             =
   \
>>      } v =3D { .v =3D val };                                            =
       \
>>      uint64_t d;                                                        =
   \
>> -    d =3D deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,      =
     \
>> +    d =3D deposit64(*(storage), R_ ## reg ## _ ## field ## _SHIFT,     =
     \
>>                    R_ ## reg ## _ ## field ## _LENGTH, v.v);            =
   \
>> -    d; })
>> +    *(storage) =3D d; })
>>
>>  /* Deposit a field to array of registers.  */
>>  #define ARRAY_FIELD_DP32(regs, reg, field, val)                        =
   \
>> -    (regs)[R_ ## reg] =3D FIELD_DP32((regs)[R_ ## reg], reg, field, val=
);
>> +    FIELD_DP32(&(regs)[R_ ## reg], reg, field, val);
>>
>>  #endif
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 42dc521c13..6406b69d68 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -238,25 +238,25 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>>       *       multi-level stream table
>>       */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 suppo=
rted */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW o=
nly */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coheren=
t */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASI=
D */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little e=
ndian */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No st=
all */
>> +    FIELD_DP32(&s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
>> +    FIELD_DP32(&s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
>> +    FIELD_DP32(&s->idr[0], IDR0, COHACC, 1); /* IO coherent */
>> +    FIELD_DP32(&s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
>> +    FIELD_DP32(&s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
>> +    FIELD_DP32(&s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
>>      /* terminated transaction will always be aborted/error returned */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, TERM_MODEL, 1);
>> +    FIELD_DP32(&s->idr[0], IDR0, TERM_MODEL, 1);
>>      /* 2-level stream table supported */
>> -    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, STLEVEL, 1);
>> +    FIELD_DP32(&s->idr[0], IDR0, STLEVEL, 1);
>>
>> -    s->idr[1] =3D FIELD_DP32(s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZ=
E);
>> -    s->idr[1] =3D FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>> -    s->idr[1] =3D FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>> +    FIELD_DP32(&s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
>> +    FIELD_DP32(&s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>> +    FIELD_DP32(&s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>>
>>     /* 4K and 64K granule support */
>> -    s->idr[5] =3D FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>> -    s->idr[5] =3D FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>> -    s->idr[5] =3D FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 4=
4 bits */
>> +    FIELD_DP32(&s->idr[5], IDR5, GRAN4K, 1);
>> +    FIELD_DP32(&s->idr[5], IDR5, GRAN64K, 1);
>> +    FIELD_DP32(&s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>
>>      s->cmdq.base =3D deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>>      s->cmdq.prod =3D 0;
>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
>> index 8eea757aff..82fa3ea672 100644
>> --- a/hw/dma/xlnx-zdma.c
>> +++ b/hw/dma/xlnx-zdma.c
>> @@ -426,10 +426,8 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *bu=
f, uint32_t len)
>>          }
>>
>>          /* Write back to buffered descriptor.  */
>> -        s->dsc_dst.words[2] =3D FIELD_DP32(s->dsc_dst.words[2],
>> -                                         ZDMA_CH_DST_DSCR_WORD2,
>> -                                         SIZE,
>> -                                         dst_size);
>> +        FIELD_DP32(&s->dsc_dst.words[2],
>> +                   ZDMA_CH_DST_DSCR_WORD2, SIZE, dst_size);
>>      }
>>  }
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index 7af19fa06c..0f41028e91 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -301,10 +301,10 @@ static void sd_ocr_powerup(void *opaque)
>>      assert(!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP));
>>
>>      /* card power-up OK */
>> -    sd->ocr =3D FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
>> +    FIELD_DP32(&sd->ocr, OCR, CARD_POWER_UP, 1);
>>
>>      if (sd->size > 1 * G_BYTE) {
>> -        sd->ocr =3D FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
>> +        FIELD_DP32(&sd->ocr, OCR, CARD_CAPACITY, 1);
>>      }
>>  }
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 63c44a4ee8..d42492f60a 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -94,21 +94,21 @@ static void sdhci_check_capareg(SDHCIState *s, Error=
 **errp)
>>      case 4:
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT_V4);
>>          trace_sdhci_capareg("64-bit system bus (v4)", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT_V4, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT_V4, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, UHS_II);
>>          trace_sdhci_capareg("UHS-II", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, UHS_II, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, UHS_II, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA3);
>>          trace_sdhci_capareg("ADMA3", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, ADMA3, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA3, 0);
>>
>>      /* fallthrough */
>>      case 3:
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, ASYNC_INT);
>>          trace_sdhci_capareg("async interrupt", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, ASYNC_INT, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, ASYNC_INT, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, SLOT_TYPE);
>>          if (val) {
>> @@ -116,70 +116,70 @@ static void sdhci_check_capareg(SDHCIState *s, Err=
or **errp)
>>              return;
>>          }
>>          trace_sdhci_capareg("slot type", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, SLOT_TYPE, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, SLOT_TYPE, 0);
>>
>>          if (val !=3D 2) {
>>              val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, EMBEDDED_8BIT);
>>              trace_sdhci_capareg("8-bit bus", val);
>>          }
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, BUS_SPEED);
>>          trace_sdhci_capareg("bus speed mask", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, BUS_SPEED, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS_SPEED, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, DRIVER_STRENGTH);
>>          trace_sdhci_capareg("driver strength mask", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, TIMER_RETUNING);
>>          trace_sdhci_capareg("timer re-tuning", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, TIMER_RETUNING, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, TIMER_RETUNING, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, SDR50_TUNING);
>>          trace_sdhci_capareg("use SDR50 tuning", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, SDR50_TUNING, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, SDR50_TUNING, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, RETUNING_MODE);
>>          trace_sdhci_capareg("re-tuning mode", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, RETUNING_MODE, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, RETUNING_MODE, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, CLOCK_MULT);
>>          trace_sdhci_capareg("clock multiplier", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, CLOCK_MULT, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, CLOCK_MULT, 0);
>>
>>      /* fallthrough */
>>      case 2: /* default version */
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA2);
>>          trace_sdhci_capareg("ADMA2", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, ADMA2, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA2, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA1);
>>          trace_sdhci_capareg("ADMA1", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, ADMA1, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA1, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT);
>>          trace_sdhci_capareg("64-bit system bus (v3)", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT, 0);
>>
>>      /* fallthrough */
>>      case 1:
>>          y =3D FIELD_EX64(s->capareg, SDHC_CAPAB, TOUNIT);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, TOUNIT, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, TOUNIT, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, TOCLKFREQ);
>>          trace_sdhci_capareg(y ? "timeout (MHz)" : "Timeout (KHz)", val)=
;
>>          if (sdhci_check_capab_freq_range(s, "timeout", val, errp)) {
>>              return;
>>          }
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, TOCLKFREQ, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, TOCLKFREQ, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, BASECLKFREQ);
>>          trace_sdhci_capareg(y ? "base (MHz)" : "Base (KHz)", val);
>>          if (sdhci_check_capab_freq_range(s, "base", val, errp)) {
>>              return;
>>          }
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, BASECLKFREQ, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, BASECLKFREQ, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH);
>>          if (val >=3D 3) {
>> @@ -187,31 +187,31 @@ static void sdhci_check_capareg(SDHCIState *s, Err=
or **errp)
>>              return;
>>          }
>>          trace_sdhci_capareg("max block length", sdhci_get_fifolen(s));
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, HIGHSPEED);
>>          trace_sdhci_capareg("high speed", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, HIGHSPEED, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, HIGHSPEED, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, SDMA);
>>          trace_sdhci_capareg("SDMA", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, SDMA, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, SDMA, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, SUSPRESUME);
>>          trace_sdhci_capareg("suspend/resume", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, SUSPRESUME, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, SUSPRESUME, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, V33);
>>          trace_sdhci_capareg("3.3v", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, V33, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, V33, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, V30);
>>          trace_sdhci_capareg("3.0v", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, V30, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, V30, 0);
>>
>>          val =3D FIELD_EX64(s->capareg, SDHC_CAPAB, V18);
>>          trace_sdhci_capareg("1.8v", val);
>> -        msk =3D FIELD_DP64(msk, SDHC_CAPAB, V18, 0);
>> +        FIELD_DP64(&msk, SDHC_CAPAB, V18, 0);
>>          break;
>>
>>      default:
>> @@ -1017,10 +1017,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr o=
ffset, unsigned size)
>>          break;
>>      case SDHC_PRNSTS:
>>          ret =3D s->prnsts;
>> -        ret =3D FIELD_DP32(ret, SDHC_PRNSTS, DAT_LVL,
>> -                         sdbus_get_dat_lines(&s->sdbus));
>> -        ret =3D FIELD_DP32(ret, SDHC_PRNSTS, CMD_LVL,
>> -                         sdbus_get_cmd_line(&s->sdbus));
>> +        FIELD_DP32(&ret, SDHC_PRNSTS, DAT_LVL, sdbus_get_dat_lines(&s->=
sdbus));
>> +        FIELD_DP32(&ret, SDHC_PRNSTS, CMD_LVL, sdbus_get_cmd_line(&s->s=
dbus));
>>          break;
>>      case SDHC_HOSTCTL:
>>          ret =3D s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
>>
>
