Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp54247wrq;
        Mon, 4 Jun 2018 12:43:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKr0PPmUk2YIBMlxZ/xS0bjlC0Zc9Zh6R9bUrLPJe0T4+H4OiCQtY5QZLlT9pbgrkQe1FkZ
X-Received: by 2002:a0c:f586:: with SMTP id k6-v6mr16878415qvm.51.1528141421049;
        Mon, 04 Jun 2018 12:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528141421; cv=none;
        d=google.com; s=arc-20160816;
        b=sUjHcI90XZeWU8/PJY0/3KL2IoKU4tS9YLPyRPB1M89Or4Lbv/Ozcvjd3OF+5xm+8R
         NqZ+RF8n0/uDB1o21yEuxY7KkMNXmaZHF5oiCZNQpc+PFgZpeYzgLwKfOBHk96gsFOKp
         HlkOrBN2GuH9gX+2BIEhGVknr0MX9Hm0J1D02C8eZot/FbrdSHN6WGWhNEUTuy/CJAan
         KoI1eWyYKDzrXLdN0mJfbscUuVbTHeQHBdTCGbRm/8QTZSnHfVblR77FrnsLTs2GLzRH
         uYW4/NGxuAxiwu02+FGdyF1KL1Sw6uFl/zMY4OPXGlGDaoc58MDS0GuGIwifF2hH/SGZ
         L2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=O5Brk7LRbDuambW4+WnmPsUPwt2MMLOsDPaCpu2uSW8=;
        b=O9DURY2pdT5SsRZxbtZ0oREHMgS8hshjSlJloeoIENccdApRXtYg3UkykXFxcgR3Fq
         DPH82l2plVklyM6tVX4xAu1dcR35meHu8RYQw7fRmA0i2/WjDC/bfj9uo+MgjHjlTwD7
         JcaMVGGr/Xcxvp98xTzBCCNJe4XSJ1SLbUvhVGhh55iZ15xKfFygMIgyOg5Y1QtOdEzV
         sdHr3WNUtpnJDL+xqc9NJj9cxpAg0uOPZvDoT7vLzrNpiUyebF3lRZMl5+qY+ycVTi0f
         9gO2HJwS2YsZGCKUjNzEUhEfSt49zkKbZxCSj5/3A/ipWVdA9tiE7NNcdkefqVSYwz38
         aW3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bStr5KJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si811394qvf.270.2018.06.04.12.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 12:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bStr5KJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPvOG-00076C-J4
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 15:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPvO6-00075t-VW
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 15:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPvO2-00046Z-0p
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 15:43:30 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPvO1-00046O-Qs; Mon, 04 Jun 2018 15:43:25 -0400
Received: by mail-qt0-x242.google.com with SMTP id l33-v6so5103751qta.11;
	Mon, 04 Jun 2018 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O5Brk7LRbDuambW4+WnmPsUPwt2MMLOsDPaCpu2uSW8=;
	b=bStr5KJbhyBifUlWu3ceZAinpmTF03JOG6RFOgo78VgQ8a2yJ6j0dkYGdUU3r5lF0K
	cA8WaVCsQRVczbwMmgXFPOlrlHRkpbkY3ATOcB8Pd1mBb9Rt9/l/4pzhhuLsWJsG4sFg
	Yy/O+aInV52er9yU1H2DZ4OjoAPBXw5YRCGsLQSyhMcycGOfTkjRVTxzvllkAhYfMw4h
	pR2uvxEDn2otRxQcdF9DB8bCEj5sf1VzWv/ndKCsdDcp253lPbEzePNSqCqvDvSikQi/
	KzeKIh8JHdTV926S1e9VIdTQHR3aru0f/b5ZdcJUzWVQyUOfKoYjmDn/O159PGYOSZCZ
	wEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=O5Brk7LRbDuambW4+WnmPsUPwt2MMLOsDPaCpu2uSW8=;
	b=gZiU/QIhCQQ0e2QzQaCsRIgkUiFBPkWp8gQzTPB2vVKTangtApBt3PpIA+m4OM9u8r
	tKXZxmJ+0A2Eq8ImdVMpvGTobQ46Jf7XJ/Tdw4GI867sdiWKIi1YGhVbsI7AYdmG0wBS
	h+hmlfFxI0Ar8sdNIs+EiQRShoxMD5aK7mEmQjrXL6HJ5BfnPMR4K4VJnb0WSZ3+7O26
	8fGqjstf52k5bEwtNpg3g9QYHATomuWjU3UlSbuSNq+P3+RxtoVZevixWIabTJ1KFqLi
	t/3W40R9/QCj3+YOM0xhXZ6G+LNIiPxtpTdQYldUQuMcfNM6+v6DZzsvUW2Qqh+0hZ7X
	DQqg==
X-Gm-Message-State: APt69E3LDis7afPK7D2eCSgAkCLYeVjlMx3KJfEqIxg9roqR+LrhJFNE
	pNaQ/S4aZ5RUBJHXjkpQbKo=
X-Received: by 2002:ac8:28a4:: with SMTP id
	i33-v6mr22898162qti.112.1528141405083; 
	Mon, 04 Jun 2018 12:43:25 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x36-v6sm7240868qta.5.2018.06.04.12.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 12:43:24 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20180602205511.6077-1-f4bug@amsat.org>
	<f50fb89a-4d6d-7aeb-3619-f95a04981d02@amsat.org>
	<CAKmqyKMigT-nKh_BHrx_ab43OX5xYFEJHW6CuGDuF2s6_dYuGg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e8330470-e025-7126-09ee-b25f3477fc31@amsat.org>
Date: Mon, 4 Jun 2018 16:43:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMigT-nKh_BHrx_ab43OX5xYFEJHW6CuGDuF2s6_dYuGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] hw/registerfields: Deposit
 fields "in place"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: quJkqVq99F74

On 06/04/2018 03:01 PM, Alistair Francis wrote:
> On Sat, Jun 2, 2018 at 3:26 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 06/02/2018 05:55 PM, Philippe Mathieu-Daudé wrote:
>>> These macros are always used to deposit a field in place.
>>> Update them to take the pointer argument.
>>>
>>> As these macros are constructed using compound statements,
>>> it is easy to not use the return value, and the compiler
>>> doesn't warn. Thus this change makes these macros safer.
>>
>> "and the compiler doesn't warn [if the return value is ignored]."
>>
>> Adding __attribute__ ((warn_unused_result)) to depositXX() doesn't help
>> since the retval is used inside the compound statement.
> 
> Doesn't this then limit someone from writing an if statement around a
> value in a register?

It does indeed, but I'm not sure this would be a good code practice.
Also as you can see in this patch, there is no such use in the codebase.

I'd rather use 2 explicit steps, calling FIELD_EX64() first:

  if (FIELD_EX64(storage, reg, field) == val1) {
      FIELD_DP64(&storage, reg, field, val2);
  }

Maybe there is a way to write using __attribute__
((warn_unused_result)), eventually in 2 steps, 1 #define and 1 inlined func.

> 
> Alistair
> 
>>
>>>
>>> This also helps having a simpler/shorter code to review.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/arm/smmuv3-internal.h    |  2 +-
>>>  include/hw/registerfields.h | 14 +++++-----

I never noticed how git orderfile orders include...

>>>  hw/arm/smmuv3.c             | 28 +++++++++----------
>>>  hw/dma/xlnx-zdma.c          |  6 ++--
>>>  hw/sd/sd.c                  |  4 +--
>>>  hw/sd/sdhci.c               | 56 ++++++++++++++++++-------------------
>>>  6 files changed, 53 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>>> index a9d714b56e..2f020e2e90 100644
>>> --- a/hw/arm/smmuv3-internal.h
>>> +++ b/hw/arm/smmuv3-internal.h
>>> @@ -203,7 +203,7 @@ static inline bool smmuv3_eventq_enabled(SMMUv3State *s)
>>>
>>>  static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
>>>  {
>>> -    s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>>> +    FIELD_DP32(&s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>>>  }
>>>
>>>  /* Commands */
>>> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
>>> index 2659a58737..14a12f6a48 100644
>>> --- a/include/hw/registerfields.h
>>> +++ b/include/hw/registerfields.h
>>> @@ -45,7 +45,7 @@
>>>  #define ARRAY_FIELD_EX32(regs, reg, field)                                \
>>>      FIELD_EX32((regs)[R_ ## reg], reg, field)
>>>
>>> -/* Deposit a register field.
>>> +/* Deposit a register field (in place).
>>>   * Assigning values larger then the target field will result in
>>>   * compilation warnings.
>>>   */
>>> @@ -54,20 +54,20 @@
>>>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
>>>      } v = { .v = val };                                                   \
>>>      uint32_t d;                                                           \
>>> -    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
>>> -                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
>>> -    d; })
>>> +    d = deposit32(*(storage), R_ ## reg ## _ ## field ## _SHIFT,          \
>>> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);                \
>>
>> I forgot to remove an extra space here.
>>
>>> +    *(storage) = d; })
>>>  #define FIELD_DP64(storage, reg, field, val) ({                           \
>>>      struct {                                                              \
>>>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
>>>      } v = { .v = val };                                                   \
>>>      uint64_t d;                                                           \
>>> -    d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
>>> +    d = deposit64(*(storage), R_ ## reg ## _ ## field ## _SHIFT,          \
>>>                    R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
>>> -    d; })
>>> +    *(storage) = d; })
>>>
>>>  /* Deposit a field to array of registers.  */
>>>  #define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
>>> -    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
>>> +    FIELD_DP32(&(regs)[R_ ## reg], reg, field, val);
>>>
>>>  #endif
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 42dc521c13..6406b69d68 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -238,25 +238,25 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>>>       *       multi-level stream table
>>>       */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
>>> +    FIELD_DP32(&s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
>>> +    FIELD_DP32(&s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
>>> +    FIELD_DP32(&s->idr[0], IDR0, COHACC, 1); /* IO coherent */
>>> +    FIELD_DP32(&s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
>>> +    FIELD_DP32(&s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
>>> +    FIELD_DP32(&s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
>>>      /* terminated transaction will always be aborted/error returned */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TERM_MODEL, 1);
>>> +    FIELD_DP32(&s->idr[0], IDR0, TERM_MODEL, 1);
>>>      /* 2-level stream table supported */
>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, 1);
>>> +    FIELD_DP32(&s->idr[0], IDR0, STLEVEL, 1);
>>>
>>> -    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
>>> -    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>>> -    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>>> +    FIELD_DP32(&s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
>>> +    FIELD_DP32(&s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>>> +    FIELD_DP32(&s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>>>
>>>     /* 4K and 64K granule support */
>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>> +    FIELD_DP32(&s->idr[5], IDR5, GRAN4K, 1);
>>> +    FIELD_DP32(&s->idr[5], IDR5, GRAN64K, 1);
>>> +    FIELD_DP32(&s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>>
>>>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>>>      s->cmdq.prod = 0;
>>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
>>> index 8eea757aff..82fa3ea672 100644
>>> --- a/hw/dma/xlnx-zdma.c
>>> +++ b/hw/dma/xlnx-zdma.c
>>> @@ -426,10 +426,8 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
>>>          }
>>>
>>>          /* Write back to buffered descriptor.  */
>>> -        s->dsc_dst.words[2] = FIELD_DP32(s->dsc_dst.words[2],
>>> -                                         ZDMA_CH_DST_DSCR_WORD2,
>>> -                                         SIZE,
>>> -                                         dst_size);
>>> +        FIELD_DP32(&s->dsc_dst.words[2],
>>> +                   ZDMA_CH_DST_DSCR_WORD2, SIZE, dst_size);
>>>      }
>>>  }
>>>
>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>> index 7af19fa06c..0f41028e91 100644
>>> --- a/hw/sd/sd.c
>>> +++ b/hw/sd/sd.c
>>> @@ -301,10 +301,10 @@ static void sd_ocr_powerup(void *opaque)
>>>      assert(!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP));
>>>
>>>      /* card power-up OK */
>>> -    sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
>>> +    FIELD_DP32(&sd->ocr, OCR, CARD_POWER_UP, 1);
>>>
>>>      if (sd->size > 1 * G_BYTE) {
>>> -        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
>>> +        FIELD_DP32(&sd->ocr, OCR, CARD_CAPACITY, 1);
>>>      }
>>>  }
>>>
>>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>>> index 63c44a4ee8..d42492f60a 100644
>>> --- a/hw/sd/sdhci.c
>>> +++ b/hw/sd/sdhci.c
>>> @@ -94,21 +94,21 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
>>>      case 4:
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT_V4);
>>>          trace_sdhci_capareg("64-bit system bus (v4)", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT_V4, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT_V4, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, UHS_II);
>>>          trace_sdhci_capareg("UHS-II", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, UHS_II, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, UHS_II, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA3);
>>>          trace_sdhci_capareg("ADMA3", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA3, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA3, 0);
>>>
>>>      /* fallthrough */
>>>      case 3:
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, ASYNC_INT);
>>>          trace_sdhci_capareg("async interrupt", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, ASYNC_INT, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, ASYNC_INT, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, SLOT_TYPE);
>>>          if (val) {
>>> @@ -116,70 +116,70 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
>>>              return;
>>>          }
>>>          trace_sdhci_capareg("slot type", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, SLOT_TYPE, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, SLOT_TYPE, 0);
>>>
>>>          if (val != 2) {
>>>              val = FIELD_EX64(s->capareg, SDHC_CAPAB, EMBEDDED_8BIT);
>>>              trace_sdhci_capareg("8-bit bus", val);
>>>          }
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS_SPEED);
>>>          trace_sdhci_capareg("bus speed mask", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS_SPEED, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS_SPEED, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, DRIVER_STRENGTH);
>>>          trace_sdhci_capareg("driver strength mask", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, TIMER_RETUNING);
>>>          trace_sdhci_capareg("timer re-tuning", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, TIMER_RETUNING, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, TIMER_RETUNING, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, SDR50_TUNING);
>>>          trace_sdhci_capareg("use SDR50 tuning", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, SDR50_TUNING, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, SDR50_TUNING, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, RETUNING_MODE);
>>>          trace_sdhci_capareg("re-tuning mode", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, RETUNING_MODE, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, RETUNING_MODE, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, CLOCK_MULT);
>>>          trace_sdhci_capareg("clock multiplier", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, CLOCK_MULT, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, CLOCK_MULT, 0);
>>>
>>>      /* fallthrough */
>>>      case 2: /* default version */
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA2);
>>>          trace_sdhci_capareg("ADMA2", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA2, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA2, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA1);
>>>          trace_sdhci_capareg("ADMA1", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA1, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, ADMA1, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT);
>>>          trace_sdhci_capareg("64-bit system bus (v3)", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT, 0);
>>>
>>>      /* fallthrough */
>>>      case 1:
>>>          y = FIELD_EX64(s->capareg, SDHC_CAPAB, TOUNIT);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, TOUNIT, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, TOUNIT, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, TOCLKFREQ);
>>>          trace_sdhci_capareg(y ? "timeout (MHz)" : "Timeout (KHz)", val);
>>>          if (sdhci_check_capab_freq_range(s, "timeout", val, errp)) {
>>>              return;
>>>          }
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, TOCLKFREQ, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, TOCLKFREQ, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, BASECLKFREQ);
>>>          trace_sdhci_capareg(y ? "base (MHz)" : "Base (KHz)", val);
>>>          if (sdhci_check_capab_freq_range(s, "base", val, errp)) {
>>>              return;
>>>          }
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, BASECLKFREQ, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, BASECLKFREQ, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH);
>>>          if (val >= 3) {
>>> @@ -187,31 +187,31 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
>>>              return;
>>>          }
>>>          trace_sdhci_capareg("max block length", sdhci_get_fifolen(s));
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, HIGHSPEED);
>>>          trace_sdhci_capareg("high speed", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, HIGHSPEED, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, HIGHSPEED, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, SDMA);
>>>          trace_sdhci_capareg("SDMA", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, SDMA, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, SDMA, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, SUSPRESUME);
>>>          trace_sdhci_capareg("suspend/resume", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, SUSPRESUME, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, SUSPRESUME, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, V33);
>>>          trace_sdhci_capareg("3.3v", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, V33, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, V33, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, V30);
>>>          trace_sdhci_capareg("3.0v", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, V30, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, V30, 0);
>>>
>>>          val = FIELD_EX64(s->capareg, SDHC_CAPAB, V18);
>>>          trace_sdhci_capareg("1.8v", val);
>>> -        msk = FIELD_DP64(msk, SDHC_CAPAB, V18, 0);
>>> +        FIELD_DP64(&msk, SDHC_CAPAB, V18, 0);
>>>          break;
>>>
>>>      default:
>>> @@ -1017,10 +1017,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
>>>          break;
>>>      case SDHC_PRNSTS:
>>>          ret = s->prnsts;
>>> -        ret = FIELD_DP32(ret, SDHC_PRNSTS, DAT_LVL,
>>> -                         sdbus_get_dat_lines(&s->sdbus));
>>> -        ret = FIELD_DP32(ret, SDHC_PRNSTS, CMD_LVL,
>>> -                         sdbus_get_cmd_line(&s->sdbus));
>>> +        FIELD_DP32(&ret, SDHC_PRNSTS, DAT_LVL, sdbus_get_dat_lines(&s->sdbus));
>>> +        FIELD_DP32(&ret, SDHC_PRNSTS, CMD_LVL, sdbus_get_cmd_line(&s->sdbus));
>>>          break;
>>>      case SDHC_HOSTCTL:
>>>          ret = s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
>>>
>>
> 
