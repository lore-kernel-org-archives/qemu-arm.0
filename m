Received: by 10.28.91.67 with SMTP id p64csp1022317wmb;
        Fri, 9 Mar 2018 09:09:35 -0800 (PST)
X-Google-Smtp-Source: AG47ELs0Ly29UeE2jwujwTI9Nh/Xv2uqbiqy6+/wG196nyrxSz/5/IKuOURGvFuKlJEojZx/7fcU
X-Received: by 2002:a25:e42:: with SMTP id 63-v6mr3585191ybo.6.1520615375355;
        Fri, 09 Mar 2018 09:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520615375; cv=none;
        d=google.com; s=arc-20160816;
        b=jzbDOEUSOk9NvNuOF+lU3IDMLmmneXs9koAxRMmNau+w5zs6ZCOuLqVKyUCcc+t2st
         mRD1AnNWZTeR9kEhNb+W8AiUCNguPxczgaBIY9toJbLs/0BmHGZW9o7f99JBwCrED4z2
         Alwg1eQYxFcIgYnBlbpV0oo1WAfdXZgyFzs1fUnON36cgH6dXFwIZUQ+1xGQdu6Mox6e
         kMr3gGdoHhGJ8nDn20bUGuWM1BCP5ggEzXwGEYS9p9NMOaXw6BQaojoxSi44d83exelx
         aN981c5TZOYiSGOVtgf/i/AAkJdVfqkAw+aNOx2g/8layZUvSzeWuoSlbTqAnEgJK4wu
         lHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=dxc0kzQEuyMZbT2BQnkKWGSn3QOQ3iAiUgQqhmS7Q+M=;
        b=0lz5YUNZLzyP2c0J3lBDqUqeiU7Xbsh7eLTMD7qRsYjNDWrGHhMACd9c7tI3tXtOkj
         46I8zLJPz2m8Og2LrAEXN5JGeHT7eJuxPWYn5N6StBDQyLhLlNgo8LDhpdrZKrwWFJvG
         orZ10UZLI0ZvK/7XlGY3AcJlKJ7HZKieu137gtYVqT4vT7OwBu/G55+lVq11dbnYd3wD
         7qAuX6lPihJRi3rOG7ybm5wssmpXBEe8XkRTBkWDZ7xl4yvv2uZtSd07U6p6ySAzi+T2
         6F/YaNwPq/8SdCFl4d8vVS0DC8w8+Q8T6CscHNxZkW8U0p7PZpw0LUD2xF7HeQJ/NNsl
         s1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1-v6si235151ybk.512.2018.03.09.09.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 09:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euLWQ-0001k6-KO
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 12:09:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euL70-0004M8-G9
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 11:43:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euL6x-0001gZ-Dk
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 11:43:18 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43992 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euL6x-0001fw-50; Fri, 09 Mar 2018 11:43:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FF244026779;
	Fri,  9 Mar 2018 16:43:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE06C2026609;
	Fri,  9 Mar 2018 16:43:11 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-7-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_KBtbNiRUV5=nFVj=y8Sv7moNJSs-WVEYv6mdtzDaQ3w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <292a247d-0575-a6d0-f42e-cf042fd42062@redhat.com>
Date: Fri, 9 Mar 2018 17:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_KBtbNiRUV5=nFVj=y8Sv7moNJSs-WVEYv6mdtzDaQ3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 16:43:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 16:43:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 06/14] hw/arm/smmuv3: Queue helpers
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3ybk2An0dit

Hi Peter,

On 08/03/18 19:28, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> We introduce helpers to read/write into the command and event
>> circular queues.
>>
>> smmuv3_write_eventq and smmuv3_cmq_consume will become static
>> in subsequent patches.
>>
>> Invalidation commands are not yet dealt with. We do not cache
>> data that need to be invalidated. This will change with vhost
>> integration.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v8 -> v9:
>> - fix CMD_SSID & CMD_ADDR + some renamings
>> - do cons increment after the execution of the command
>> - add Q_INCONSISTENT()
>>
>> v7 -> v8
>> - use address_space_rw
>> - helpers inspired from spec
>> ---
>>  hw/arm/smmuv3-internal.h | 150 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/smmuv3.c          | 162 +++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/trace-events      |   4 ++
>>  3 files changed, 316 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index 40b39a1..c0771ce 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -162,4 +162,154 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>>  void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
>>  void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
>>
>> +/* Queue Handling */
>> +
>> +#define LOG2SIZE(q)        extract64((q)->base, 0, 5)
>> +#define BASE(q)            ((q)->base & SMMU_BASE_ADDR_MASK)
renamed Q_LOG2SIZE and Q_BASE respectively
> 
> These are both very generic names for things in header files.
> 
> Looking at the required behaviour of the *_BASE registers,
> if the LOG2SIZE field is written to a value larger than the maximum,
> it is supposed to read back as the value written but must behave
> as if it was set to the maximum. That suggests to me that your
> SMMUQueue struct should have a "log2size" field which is set when
> the guest writes to *_BASE (which is where you can cap it to the
> max value).
done
> 
>> +#define WRAP_MASK(q)       (1 << LOG2SIZE(q))
>> +#define INDEX_MASK(q)      ((1 << LOG2SIZE(q)) - 1)
>> +#define WRAP_INDEX_MASK(q) ((1 << (LOG2SIZE(q) + 1)) - 1)
> 
> WRAP_INDEX_MASK is unused (but see below for a possible use)
kept and adopted your suggestions below
> 
>> +
>> +#define Q_CONS_ENTRY(q)  (BASE(q) + \
>> +                          (q)->entry_size * ((q)->cons & INDEX_MASK(q)))
>> +#define Q_PROD_ENTRY(q)  (BASE(q) + \
>> +                          (q)->entry_size * ((q)->prod & INDEX_MASK(q)))
>> +
>> +#define Q_CONS(q) ((q)->cons & INDEX_MASK(q))
>> +#define Q_PROD(q) ((q)->prod & INDEX_MASK(q))
> 
> If you put these a bit earlier you can use them in the definitions
> of Q_CONS_ENTRY and Q_PROD_ENTRY.
done
> 
>> +
>> +#define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> LOG2SIZE(q))
>> +#define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> LOG2SIZE(q))
>> +
>> +#define Q_FULL(q) \
>> +    (((((q)->cons) & INDEX_MASK(q)) == \
>> +      (((q)->prod) & INDEX_MASK(q))) && \
>> +     ((((q)->cons) & WRAP_MASK(q)) != \
>> +      (((q)->prod) & WRAP_MASK(q))))
> 
> You could write this as
>    ((cons ^ prod) & WRAP_INDEX_MASK) == WRAP_MASK
done
> 
>> +
>> +#define Q_EMPTY(q) \
>> +    (((((q)->cons) & INDEX_MASK(q)) == \
>> +      (((q)->prod) & INDEX_MASK(q))) && \
>> +     ((((q)->cons) & WRAP_MASK(q)) == \
>> +      (((q)->prod) & WRAP_MASK(q))))
> 
> and this as
>    (cons & WRAP_INDEX_MASK) == (prod & WRAP_INDEX_MASK)
done
> 
> (or as ((cons ^ prod) & WRAP_INDEX_MASK) == 0, but that's unnecessarily
> obscure I think.)
> 
> 
> This is all a bit macro-heavy. Do these really all need to be macros
> rather than functions?
> 
>> +
>> +#define Q_INCONSISTENT(q) \
>> +((((((q)->prod) & INDEX_MASK(q)) > (((q)->cons) & INDEX_MASK(q))) && \
>> +((((q)->prod) & WRAP_MASK(q)) != (((q)->cons) & WRAP_MASK(q)))) || \
>> +(((((q)->prod) & INDEX_MASK(q)) < (((q)->cons) & INDEX_MASK(q))) && \
>> +((((q)->prod) & WRAP_MASK(q)) == (((q)->cons) & WRAP_MASK(q))))) \
>> +
> 
> This never seems to be used. (Also it has a stray trailing '\',
> and isn't indented very clearly.
removed
> 
>> +#define SMMUV3_CMDQ_ENABLED(s) \
>> +     (FIELD_EX32(s->cr[0], CR0, CMDQEN))
>> +
>> +#define SMMUV3_EVENTQ_ENABLED(s) \
>> +     (FIELD_EX32(s->cr[0], CR0, EVENTQEN))

Those were moved to static inline functions
>> +
>> +static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
>> +{
>> +    s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>> +}
>> +
>> +void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
>> +
>> +/* Commands */
>> +
>> +enum {
>> +    SMMU_CMD_PREFETCH_CONFIG = 0x01,
>> +    SMMU_CMD_PREFETCH_ADDR,
>> +    SMMU_CMD_CFGI_STE,
>> +    SMMU_CMD_CFGI_STE_RANGE,
>> +    SMMU_CMD_CFGI_CD,
>> +    SMMU_CMD_CFGI_CD_ALL,
>> +    SMMU_CMD_CFGI_ALL,
>> +    SMMU_CMD_TLBI_NH_ALL     = 0x10,
>> +    SMMU_CMD_TLBI_NH_ASID,
>> +    SMMU_CMD_TLBI_NH_VA,
>> +    SMMU_CMD_TLBI_NH_VAA,
>> +    SMMU_CMD_TLBI_EL3_ALL    = 0x18,
>> +    SMMU_CMD_TLBI_EL3_VA     = 0x1a,
>> +    SMMU_CMD_TLBI_EL2_ALL    = 0x20,
>> +    SMMU_CMD_TLBI_EL2_ASID,
>> +    SMMU_CMD_TLBI_EL2_VA,
>> +    SMMU_CMD_TLBI_EL2_VAA,  /* 0x23 */
>> +    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
>> +    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
>> +    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
>> +    SMMU_CMD_ATC_INV         = 0x40,
>> +    SMMU_CMD_PRI_RESP,
>> +    SMMU_CMD_RESUME          = 0x44,
>> +    SMMU_CMD_STALL_TERM,
>> +    SMMU_CMD_SYNC,          /* 0x46 */
>> +};
>> +
>> +static const char *cmd_stringify[] = {
>> +    [SMMU_CMD_PREFETCH_CONFIG] = "SMMU_CMD_PREFETCH_CONFIG",
>> +    [SMMU_CMD_PREFETCH_ADDR]   = "SMMU_CMD_PREFETCH_ADDR",
>> +    [SMMU_CMD_CFGI_STE]        = "SMMU_CMD_CFGI_STE",
>> +    [SMMU_CMD_CFGI_STE_RANGE]  = "SMMU_CMD_CFGI_STE_RANGE",
>> +    [SMMU_CMD_CFGI_CD]         = "SMMU_CMD_CFGI_CD",
>> +    [SMMU_CMD_CFGI_CD_ALL]     = "SMMU_CMD_CFGI_CD_ALL",
>> +    [SMMU_CMD_CFGI_ALL]        = "SMMU_CMD_CFGI_ALL",
>> +    [SMMU_CMD_TLBI_NH_ALL]     = "SMMU_CMD_TLBI_NH_ALL",
>> +    [SMMU_CMD_TLBI_NH_ASID]    = "SMMU_CMD_TLBI_NH_ASID",
>> +    [SMMU_CMD_TLBI_NH_VA]      = "SMMU_CMD_TLBI_NH_VA",
>> +    [SMMU_CMD_TLBI_NH_VAA]     = "SMMU_CMD_TLBI_NH_VAA",
>> +    [SMMU_CMD_TLBI_EL3_ALL]    = "SMMU_CMD_TLBI_EL3_ALL",
>> +    [SMMU_CMD_TLBI_EL3_VA]     = "SMMU_CMD_TLBI_EL3_VA",
>> +    [SMMU_CMD_TLBI_EL2_ALL]    = "SMMU_CMD_TLBI_EL2_ALL",
>> +    [SMMU_CMD_TLBI_EL2_ASID]   = "SMMU_CMD_TLBI_EL2_ASID",
>> +    [SMMU_CMD_TLBI_EL2_VA]     = "SMMU_CMD_TLBI_EL2_VA",
>> +    [SMMU_CMD_TLBI_EL2_VAA]    = "SMMU_CMD_TLBI_EL2_VAA",
>> +    [SMMU_CMD_TLBI_S12_VMALL]  = "SMMU_CMD_TLBI_S12_VMALL",
>> +    [SMMU_CMD_TLBI_S2_IPA]     = "SMMU_CMD_TLBI_S2_IPA",
>> +    [SMMU_CMD_TLBI_NSNH_ALL]   = "SMMU_CMD_TLBI_NSNH_ALL",
>> +    [SMMU_CMD_ATC_INV]         = "SMMU_CMD_ATC_INV",
>> +    [SMMU_CMD_PRI_RESP]        = "SMMU_CMD_PRI_RESP",
>> +    [SMMU_CMD_RESUME]          = "SMMU_CMD_RESUME",
>> +    [SMMU_CMD_STALL_TERM]      = "SMMU_CMD_STALL_TERM",
>> +    [SMMU_CMD_SYNC]            = "SMMU_CMD_SYNC",
>> +};
>> +
>> +#define SMMU_CMD_STRING(type) (                                      \
>> +(type < ARRAY_SIZE(cmd_stringify)) ? cmd_stringify[type] : "UNKNOWN" \
>> +)
> 
> If this was a function you'd know what the type of 'type' is
> and so whether it needed to have a >= 0 check on it. Also it
> will hand you a NULL pointer for a value that's inside the
> array size but not initialized, like 0x24.
OK
> 
>> +
>> +/* CMDQ fields */
>> +
>> +typedef enum {
>> +    SMMU_CERROR_NONE = 0,
>> +    SMMU_CERROR_ILL,
>> +    SMMU_CERROR_ABT,
>> +    SMMU_CERROR_ATC_INV_SYNC,
>> +} SMMUCmdError;
>> +
>> +enum { /* Command completion notification */
>> +    CMD_SYNC_SIG_NONE,
>> +    CMD_SYNC_SIG_IRQ,
>> +    CMD_SYNC_SIG_SEV,
>> +};
>> +
>> +#define CMD_TYPE(x)         extract32((x)->word[0], 0 , 8)
>> +#define CMD_SSEC(x)         extract32((x)->word[0], 10, 1)
>> +#define CMD_SSV(x)          extract32((x)->word[0], 11, 1)
>> +#define CMD_RESUME_AC(x)    extract32((x)->word[0], 12, 1)
>> +#define CMD_RESUME_AB(x)    extract32((x)->word[0], 13, 1)
>> +#define CMD_SYNC_CS(x)      extract32((x)->word[0], 12, 2)
>> +#define CMD_SSID(x)         extract32((x)->word[0], 12, 20)
>> +#define CMD_SID(x)          ((x)->word[1])
>> +#define CMD_VMID(x)         extract32((x)->word[1], 0 , 16)
>> +#define CMD_ASID(x)         extract32((x)->word[1], 16, 16)
>> +#define CMD_RESUME_STAG(x)  extract32((x)->word[2], 0 , 16)
>> +#define CMD_RESP(x)         extract32((x)->word[2], 11, 2)
>> +#define CMD_LEAF(x)         extract32((x)->word[2], 0 , 1)
>> +#define CMD_STE_RANGE(x)    extract32((x)->word[2], 0 , 5)
>> +#define CMD_ADDR(x) ({                                        \
>> +            uint64_t high = (uint64_t)(x)->word[3];           \
>> +            uint64_t low = extract32((x)->word[2], 12, 20);    \
>> +            uint64_t addr = high << 32 | (low << 12);         \
>> +            addr;                                             \
>> +        })
>> +
>> +int smmuv3_cmdq_consume(SMMUv3State *s);
>> +
>>  #endif
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 8779d3f..0b57215 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -94,6 +94,72 @@ void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>>      trace_smmuv3_write_gerrorn(acked, s->gerrorn);
>>  }
>>
>> +static uint32_t queue_index_inc(uint32_t val,
>> +                                uint32_t qidx_mask, uint32_t qwrap_mask)
>> +{
>> +    uint32_t i = (val + 1) & qidx_mask;
>> +
>> +    if (i <= (val & qidx_mask)) {
>> +        i = ((val & qwrap_mask) ^ qwrap_mask) | i;
>> +    } else {
>> +        i = (val & qwrap_mask) | i;
>> +    }
>> +    return i;
> 
> This is unnecessarily complicated -- an index increment is just
>    val = (val + 1) & INDEX_WRAP_MASK;
> which will automatically flip the wrap bit as required.
> 
OK
>> +}
>> +
>> +static inline void queue_prod_incr(SMMUQueue *q)
>> +{
>> +    q->prod = queue_index_inc(q->prod, INDEX_MASK(q), WRAP_MASK(q));
> 
> Doesn't this trash the ERR code in bits [30:24], or are you
> keeping that somewhere else for efficiency?
in case there is an error we don't increment. But switching to deposit32
as it looks saner.
> 
>> +}
>> +
>> +static inline void queue_cons_incr(SMMUQueue *q)
>> +{
>> +    q->cons = queue_index_inc(q->cons, INDEX_MASK(q), WRAP_MASK(q));
>> +}
>> +
>> +static inline MemTxResult queue_read(SMMUQueue *q, void *data)
>> +{
>> +    dma_addr_t addr = Q_CONS_ENTRY(q);
>> +
>> +    return dma_memory_read(&address_space_memory, addr,
>> +                           (uint8_t *)data, q->entry_size);
> 
> Does the compiler complain if you don't provide this cast?
no
> 
>> +}
>> +
>> +static void queue_write(SMMUQueue *q, void *data)
>> +{
>> +    dma_addr_t addr = Q_PROD_ENTRY(q);
>> +    MemTxResult ret;
>> +
>> +    ret = dma_memory_write(&address_space_memory, addr,
>> +                           (uint8_t *)data, q->entry_size);
>> +    if (ret != MEMTX_OK) {
>> +        return;
> 
> Shouldn't we record or return this error to the caller,
> like queue_read() does, rather than throwing it away?
> I think that for the event queue (which is the only user
> here ) this should cause an EVENTQ_ABT_ERR.
done
> 
>> +    }
>> +
>> +    queue_prod_incr(q);
>> +}
>> +
>> +void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
>> +{
>> +    SMMUQueue *q = &s->eventq;
>> +    bool q_empty = Q_EMPTY(q);
>> +    bool q_full = Q_FULL(q);
> 
> You only use these once each, and they're not very complicated
> expressions, so you might as well just have the uses be
> "if (Q_FULL(q)) { ..." &c.
done
> 
>> +
>> +    if (!SMMUV3_EVENTQ_ENABLED(s)) {
>> +        return;
>> +    }
>> +
>> +    if (q_full) {
>> +        return;
>> +    }
>> +
>> +    queue_write(q, evt);
>> +
>> +    if (q_empty) {
>> +        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
>> +    }
>> +}
>> +
>>  static void smmuv3_init_regs(SMMUv3State *s)
>>  {
>>      /**
>> @@ -133,6 +199,102 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>      s->sid_split = 0;
>>  }
>>
>> +int smmuv3_cmdq_consume(SMMUv3State *s)
>> +{
>> +    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>> +    SMMUQueue *q = &s->cmdq;
>> +    uint32_t type = 0;
>> +
>> +    if (!SMMUV3_CMDQ_ENABLED(s)) {
>> +        return 0;
>> +    }
>> +    /*
>> +     * some commands depend on register values, as above. In case those
> 
> Where is "as above" referring to ?
I meant CMDQ enabled (CR0).
> 
>> +     * register values change while handling the command, spec says it
>> +     * is UNPREDICTABLE whether the command is interpreted under the new
>> +     * or old value.
>> +     */
>> +
>> +    while (!Q_EMPTY(q)) {
>> +        uint32_t pending = s->gerror ^ s->gerrorn;
>> +        Cmd cmd;
>> +
>> +        trace_smmuv3_cmdq_consume(Q_PROD(q), Q_CONS(q),
>> +                                  Q_PROD_WRAP(q), Q_CONS_WRAP(q));
>> +
>> +        if (FIELD_EX32(pending, GERROR, CMDQ_ERR)) {
>> +            break;
>> +        }
>> +
>> +        if (queue_read(q, &cmd) != MEMTX_OK) {
>> +            cmd_error = SMMU_CERROR_ABT;
>> +            break;
>> +        }
>> +
>> +        type = CMD_TYPE(&cmd);
>> +
>> +        trace_smmuv3_cmdq_opcode(SMMU_CMD_STRING(type));
>> +
>> +        switch (type) {
>> +        case SMMU_CMD_SYNC:
>> +            if (CMD_SYNC_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
>> +                smmuv3_trigger_irq(s, SMMU_IRQ_CMD_SYNC, 0);
>> +            }
>> +            break;
>> +        case SMMU_CMD_PREFETCH_CONFIG:
>> +        case SMMU_CMD_PREFETCH_ADDR:
>> +        case SMMU_CMD_CFGI_STE:
>> +        case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
>> +        case SMMU_CMD_CFGI_CD:
>> +        case SMMU_CMD_CFGI_CD_ALL:
>> +        case SMMU_CMD_TLBI_NH_ALL:
>> +        case SMMU_CMD_TLBI_NH_ASID:
>> +        case SMMU_CMD_TLBI_NH_VA:
>> +        case SMMU_CMD_TLBI_NH_VAA:
>> +        case SMMU_CMD_TLBI_EL3_ALL:
>> +        case SMMU_CMD_TLBI_EL3_VA:
>> +        case SMMU_CMD_TLBI_EL2_ALL:
>> +        case SMMU_CMD_TLBI_EL2_ASID:
>> +        case SMMU_CMD_TLBI_EL2_VA:
>> +        case SMMU_CMD_TLBI_EL2_VAA:
>> +        case SMMU_CMD_TLBI_S12_VMALL:
>> +        case SMMU_CMD_TLBI_S2_IPA:
>> +        case SMMU_CMD_TLBI_NSNH_ALL:
>> +        case SMMU_CMD_ATC_INV:
>> +        case SMMU_CMD_PRI_RESP:
>> +        case SMMU_CMD_RESUME:
>> +        case SMMU_CMD_STALL_TERM:
>> +            trace_smmuv3_unhandled_cmd(type);
>> +            break;
>> +        default:
>> +            cmd_error = SMMU_CERROR_ILL;
>> +            error_report("Illegal command type: %d", CMD_TYPE(&cmd));
> 
> This isn't what error_report() is for. You can log it as a GUEST_ERROR.
OK
> 
>> +            break;
>> +        }
>> +        if (cmd_error) {
>> +            break;
>> +        }
>> +        /*
>> +         * We only increment the cons index after the completion of
>> +         * the command. We do that because the SYNC returns immediatly
> 
> "immediately"
> 
>> +         * and do not check the completion of previous commands
> 
> "does not"
> 
>> +         */
>> +        queue_cons_incr(q);
>> +    }
>> +
>> +    if (cmd_error) {
>> +        error_report("Error on %s command execution: %d",
>> +                     SMMU_CMD_STRING(type), cmd_error);
> 
> Again, not error_report(). Probably a good location for a trace_ point.
OK
> 
>> +        smmu_write_cmdq_err(s, cmd_error);
>> +        smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_CMDQ_ERR_MASK);
>> +    }
>> +
>> +    trace_smmuv3_cmdq_consume_out(Q_PROD(q), Q_CONS(q),
>> +                                  Q_PROD_WRAP(q), Q_CONS_WRAP(q));
>> +
>> +    return 0;
>> +}
>> +
>>  static void smmu_write_mmio(void *opaque, hwaddr addr,
>>                              uint64_t val, unsigned size)
>>  {
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 2ddae40..1c5105d 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -18,3 +18,7 @@ smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" va
>>  smmuv3_trigger_irq(int irq) "irq=%d"
>>  smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
>>  smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"
>> +smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
>> +smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
>> +smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>> +smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>> --
>> 2.5.5
>>
> 
> thanks
> -- PMM
> 
