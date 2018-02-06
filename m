Received: by 10.28.71.27 with SMTP id u27csp3715952wma;
        Tue, 6 Feb 2018 04:20:30 -0800 (PST)
X-Google-Smtp-Source: AH8x225IX/WXfz23YbYAsEoVulCUsCAtgEaUz0Cl54yG7e3HdqZlttoU8Yy8rhr9xI6ZKgfN+S35
X-Received: by 10.37.132.207 with SMTP id x15mr1252866ybm.504.1517919630028;
        Tue, 06 Feb 2018 04:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517919630; cv=none;
        d=google.com; s=arc-20160816;
        b=wEJtyH9ZoMKESnw6hIOhWxjvEV8QPTZ5ZrIbBEp5liNtM0N49UdLWkFPougfjqPcX3
         gwQ1c7WXblE4fWiK8bkpcon7fHJ9WIJinXYbFGgrvsBj4Ta6abIaA7WLU5C6ccR+efqe
         /udlSRVgLSjboW3wsTZ7mxJOZMGLdkcHsv6pbETJCelP6iYsrH7P5O7uXVy3ue8ynj94
         XFDmvKUH/VfUQ+hD6VlxebQVTqRv8L6ObcOoH2VidanwaRHmAusFCIo7hbrn4yw3IAPw
         FQ+vLkO7c/AgPe+K/3nsBVszgZA48tS2huUTEg1WQPQBMx7XmiU5LQUmI9ba+RK+TuoG
         2Qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=fRmBLgNi5Ccbi472EegtZk+9XwrBJDyCragnUvzkgrY=;
        b=Mq+iw8hkvl9tAWUi7+x1Ia1wAMDV8DR79lRcMvTogveRpHmL2xODYroSj8smTi0cD7
         jY9TLGwJRpXIgA1NuNfJKMI8RUzDFlIUKWpY33H1sY58BKSmoYo/HbbY54MqHPqeLC2F
         BvmGirS13/2bo5/ecdB4aW61uZ6ngRI49/h92r5Eioxb/vBpVLn3aVKHersJGC/DJ3kf
         PT5zJeS6hSSDv5xhn6g4Z6RhYVPk2u1CJ7oqE6bWKoYldDV+V8x7qP5U2HyQu614bH3J
         y9RBkQpHZ/VnMfnE/96H10RxM1mPiZSh/hJ5/Fh6oR/qRAoXPi5mUHEbkX0Ytn1jaXc0
         waEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10si1836912ywl.614.2018.02.06.04.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2Ef-0008SF-Dt
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ej2ET-0008Rs-SW
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ej2EO-0005j2-MF
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:20:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ej2EO-0005hv-DP; Tue, 06 Feb 2018 07:20:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29A6078551;
	Tue,  6 Feb 2018 12:20:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4819760C4A;
	Tue,  6 Feb 2018 12:19:34 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-40ucm8WZOEJC_1r4MdFXEPuX=GM2FC3hKZamLbijM7w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bdb379f2-5272-dd5c-056d-da487dd21500@redhat.com>
Date: Tue, 6 Feb 2018 13:19:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-40ucm8WZOEJC_1r4MdFXEPuX=GM2FC3hKZamLbijM7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 06 Feb 2018 12:20:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 10/20] hw/arm/smmuv3: Implement translate
 callback
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jNvj4+S0naUF

Hi Peter,
On 09/10/17 19:45, Peter Maydell wrote:
> On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
>> This patch implements the IOMMU Memory Region translate()
>> callback. Most of the code relates to the translation
>> configuration decoding and check (STE, CD).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3-internal.h | 182 +++++++++++++++++++++++-
>>  hw/arm/smmuv3.c          | 351 ++++++++++++++++++++++++++++++++++++++++++++++-
>>  hw/arm/trace-events      |   9 ++
>>  3 files changed, 537 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index e3e9828..f9f95ae 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -399,7 +399,185 @@ typedef enum evt_err {
>>      SMMU_EVT_E_PAGE_REQ     = 0x24,
>>  } SMMUEvtErr;
>>
>> -void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
>> -                         uint32_t sid, bool is_write, SMMUEvtErr type);
>> +/*****************************
>> + * Configuration Data
>> + *****************************/
>> +
>> +typedef struct __smmu_data2  STEDesc; /* STE Level 1 Descriptor */
>> +typedef struct __smmu_data16 Ste;     /* Stream Table Entry(STE) */
>> +typedef struct __smmu_data2  CDDesc;  /* CD Level 1 Descriptor */
>> +typedef struct __smmu_data16 Cd;      /* Context Descriptor(CD) */
>> +
>> +/*****************************
>> + * STE fields
>> + *****************************/
>> +
>> +#define STE_VALID(x)   extract32((x)->word[0], 0, 1) /* 0 */
>> +#define STE_CONFIG(x)  extract32((x)->word[0], 1, 3)
>> +enum {
>> +    STE_CONFIG_NONE      = 0,
>> +    STE_CONFIG_BYPASS    = 4,       /* S1 Bypass    , S2 Bypass */
>> +    STE_CONFIG_S1        = 5,       /* S1 Translate , S2 Bypass */
>> +    STE_CONFIG_S2        = 6,       /* S1 Bypass    , S2 Translate */
>> +    STE_CONFIG_NESTED    = 7,       /* S1 Translate , S2 Translate */
>> +};
>> +#define STE_S1FMT(x)   extract32((x)->word[0], 4, 2)
>> +#define STE_S1CDMAX(x) extract32((x)->word[1], 27, 5)
>> +#define STE_EATS(x)    extract32((x)->word[2], 28, 2)
>> +#define STE_STRW(x)    extract32((x)->word[2], 30, 2)
>> +#define STE_S2VMID(x)  extract32((x)->word[4], 0, 16)
>> +#define STE_S2T0SZ(x)  extract32((x)->word[5], 0, 6)
>> +#define STE_S2SL0(x)   extract32((x)->word[5], 6, 2)
>> +#define STE_S2TG(x)    extract32((x)->word[5], 14, 2)
>> +#define STE_S2PS(x)    extract32((x)->word[5], 16, 3)
>> +#define STE_S2AA64(x)  extract32((x)->word[5], 19, 1)
>> +#define STE_S2HD(x)    extract32((x)->word[5], 24, 1)
>> +#define STE_S2HA(x)    extract32((x)->word[5], 25, 1)
>> +#define STE_S2S(x)     extract32((x)->word[5], 26, 1)
>> +#define STE_CTXPTR(x)                                           \
>> +    ({                                                          \
>> +        unsigned long addr;                                     \
>> +        addr = (uint64_t)extract32((x)->word[1], 0, 16) << 32;  \
>> +        addr |= (uint64_t)((x)->word[0] & 0xffffffc0);          \
>> +        addr;                                                   \
>> +    })
>> +
>> +#define STE_S2TTB(x)                                            \
>> +    ({                                                          \
>> +        unsigned long addr;                                     \
>> +        addr = (uint64_t)extract32((x)->word[7], 0, 16) << 32;  \
>> +        addr |= (uint64_t)((x)->word[6] & 0xfffffff0);          \
>> +        addr;                                                   \
>> +    })
>> +
>> +static inline int is_ste_bypass(Ste *ste)
> 
> Types which are acronyms are all-caps, so STE, CD.
> 
>> +{
>> +    return STE_CONFIG(ste) == STE_CONFIG_BYPASS;
>> +}
>> +
>> +static inline bool is_ste_stage1(Ste *ste)
>> +{
>> +    return STE_CONFIG(ste) == STE_CONFIG_S1;
>> +}
>> +
>> +static inline bool is_ste_stage2(Ste *ste)
>> +{
>> +    return STE_CONFIG(ste) == STE_CONFIG_S2;
>> +}
>> +
>> +/**
>> + * is_s2granule_valid - Check the stage 2 translation granule size
>> + * advertised in the STE matches any IDR5 supported value
>> + */
>> +static inline bool is_s2granule_valid(Ste *ste)
>> +{
>> +    int idr5_format = 0;
>> +
>> +    switch (STE_S2TG(ste)) {
>> +    case 0: /* 4kB */
>> +        idr5_format = 0x1;
>> +        break;
>> +    case 1: /* 64 kB */
>> +        idr5_format = 0x4;
>> +        break;
>> +    case 2: /* 16 kB */
>> +        idr5_format = 0x2;
>> +        break;
>> +    case 3: /* reserved */
>> +        break;
>> +    }
>> +    idr5_format &= SMMU_IDR5_GRAN;
>> +    return idr5_format;
>> +}
>> +
>> +static inline int oas2bits(int oas_field)
>> +{
>> +    switch (oas_field) {
>> +    case 0b011:
>> +        return 42;
>> +    case 0b100:
>> +        return 44;
>> +    default:
>> +        return 32 + (1 << oas_field);
>> +   }
>> +}
>> +
>> +static inline int pa_range(Ste *ste)
>> +{
>> +    int oas_field = MIN(STE_S2PS(ste), SMMU_IDR5_OAS);
>> +
>> +    if (!STE_S2AA64(ste)) {
>> +        return 40;
>> +    }
>> +
>> +    return oas2bits(oas_field);
>> +}
>> +
>> +#define MAX_PA(ste) ((1 << pa_range(ste)) - 1)
>> +
>> +/*****************************
>> + * CD fields
>> + *****************************/
>> +#define CD_VALID(x)   extract32((x)->word[0], 30, 1)
>> +#define CD_ASID(x)    extract32((x)->word[1], 16, 16)
>> +#define CD_TTB(x, sel)                                      \
>> +    ({                                                      \
>> +        uint64_t hi, lo;                                    \
>> +        hi = extract32((x)->word[(sel) * 2 + 3], 0, 16);    \
>> +        hi <<= 32;                                          \
>> +        lo = (x)->word[(sel) * 2 + 2] & ~0xf;               \
>> +        hi | lo;                                            \
>> +    })
>> +
>> +#define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
>> +#define CD_TG(x, sel)    extract32((x)->word[0], (16 * (sel)) + 6, 2)
>> +#define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
>> +
>> +#define CD_T0SZ(x)    CD_TSZ((x), 0)
>> +#define CD_T1SZ(x)    CD_TSZ((x), 1)
>> +#define CD_TG0(x)     CD_TG((x), 0)
>> +#define CD_TG1(x)     CD_TG((x), 1)
>> +#define CD_EPD0(x)    CD_EPD((x), 0)
>> +#define CD_EPD1(x)    CD_EPD((x), 1)
>> +#define CD_IPS(x)     extract32((x)->word[1], 0, 3)
>> +#define CD_AARCH64(x) extract32((x)->word[1], 9, 1)
>> +#define CD_TTB0(x)    CD_TTB((x), 0)
>> +#define CD_TTB1(x)    CD_TTB((x), 1)
>> +
>> +#define CDM_VALID(x)    ((x)->word[0] & 0x1)
>> +
>> +static inline int is_cd_valid(SMMUV3State *s, Ste *ste, Cd *cd)
>> +{
>> +    return CD_VALID(cd);
>> +}
>> +
>> +/**
>> + * tg2granule - Decodes the CD translation granule size field according
>> + * to the TT in use
>> + * @bits: TG0/1 fiels
>> + * @tg1: if set, @bits belong to TG1, otherwise belong to TG0
>> + */
>> +static inline int tg2granule(int bits, bool tg1)
>> +{
>> +    switch (bits) {
>> +    case 1:
>> +        return tg1 ? 14 : 16;
>> +    case 2:
>> +        return tg1 ? 12 : 14;
>> +    case 3:
>> +        return tg1 ? 16 : 12;
>> +    default:
>> +        return 12;
>> +    }
>> +}
>> +
>> +#define L1STD_L2PTR(stm) ({                                 \
>> +            uint64_t hi, lo;                            \
>> +            hi = (stm)->word[1];                        \
>> +            lo = (stm)->word[0] & ~(uint64_t)0x1f;      \
>> +            hi << 32 | lo;                              \
>> +        })
>> +
>> +#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 4))
>>
>>  #endif
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 7470576..20fbce6 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -160,9 +160,9 @@ static void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
>>  /*
>>   * smmuv3_record_event - Record an event
>>   */
>> -void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
>> -                         uint32_t sid, IOMMUAccessFlags perm,
>> -                         SMMUEvtErr type)
>> +static void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
>> +                                uint32_t sid, IOMMUAccessFlags perm,
>> +                                SMMUEvtErr type)
>>  {
>>      Evt evt;
>>      bool rnw = perm & IOMMU_RO;
>> @@ -306,6 +306,348 @@ static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
>>      *base = val & ~(SMMU_BASE_RA | 0x3fULL);
>>  }
>>
>> +/*
>> + * All SMMU data structures are little endian, and are aligned to 8 bytes
>> + * L1STE/STE/L1CD/CD, Queue entries in CMDQ/EVTQ/PRIQ
>> + */
>> +static inline int smmu_get_ste(SMMUV3State *s, hwaddr addr, Ste *buf)
>> +{
>> +    trace_smmuv3_get_ste(addr);
>> +    return dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf));
> 
> Why dma_memory_read() here when we were using other memory access
> functions for things like TLB table walks earlier?
> 
> Incidentally, the spec requires us to perform memory accesses as
> at least 64-bit single-copy atomic (see 3.21.3) -- does this do that?
> (This gets important with SMP when the guest on another CPU might
> be updating the STE or page table entry at the same time as we're
> reading it...)

Among all your comments on v7, here is the one I am the least
comfortable with. I was not able to figure out whether
dma_memory_read(), which I use now for all the descriptor accesses
guarantees this 64b single copy atomicity.

Unrelated, I also did not change command descriptor field decoding (you
suggested to use registerfields.h). cmd struct is a a structure laid out
in guest RAM so I was not sure about how to use the register API for
this decoding.

With respect to the GPLv2 license issue, at the moment, I have not been
able to get an ACK from any Broadcom representative for transforming it
into "v2 or later". I will continue trying getting this approval though.

The IOMMU is not instantiated anymore using sysbus-fdt. it is
instantiated according to a machine option, still set to false by
default, given the performance overhead.

Otherwise I think I covered all your comments in v8.

As I mentioned in my cover letter I intend to submit separate patches
later on for
- vhost integration
- TLB emulation (as done on intel iommu),

as the code base already is huge and I am reluctant to add some other
features until the basic functionality has not stabilized.

Thanks

Eric
> 
>> +}
>> +
>> +/*
>> + * For now we only support CD with a single entry, 'ssid' is used to identify
>> + * otherwise
>> + */
>> +static inline int smmu_get_cd(SMMUV3State *s, Ste *ste, uint32_t ssid, Cd *buf)
>> +{
>> +    hwaddr addr = STE_CTXPTR(ste);
>> +
>> +    if (STE_S1CDMAX(ste) != 0) {
>> +        error_report("Multilevel Ctx Descriptor not supported yet");
>> +    }
>> +
>> +    trace_smmuv3_get_cd(addr);
>> +    return dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf));
>> +}
>> +
>> +/**
>> + * is_ste_consistent - Check validity of STE
>> + * according to 6.2.1 Validity of STE
>> + * TODO: check the relevance of each check and compliance
>> + * with this spec chapter
> 
> Good idea :-)
> 
> thanks
> -- PMM
> 
