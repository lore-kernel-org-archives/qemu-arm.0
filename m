Received: by 10.28.4.212 with SMTP id 203csp47751wme;
        Mon, 23 Apr 2018 13:18:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqLUo6lCLCbfWGfgcmOciRbju0FkXw4qQx/p+lSUlGDzATGOWstsm+e0va4Dpxo4daDUtRM
X-Received: by 2002:ac8:2ff6:: with SMTP id m51-v6mr16054151qta.265.1524514724056;
        Mon, 23 Apr 2018 13:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524514724; cv=none;
        d=google.com; s=arc-20160816;
        b=djXTlRwsycdqIhEbn04GBTOL0AwGiHgoIP0EvMisDyu5KJAHKX6XVlkVSjdj6wUynk
         xJB0y4+0rlyMLXCHW3WHTffHRRHwJDXJd1IsUwo432zLQ2MkTQfv9M2m56LitoS5Dhff
         Jl18v99M09DvvNg0TdhKXAfBxn5+NmOcFW6Woeat1nRx8hk5UPCU/I6yDox+nwoSaRNc
         J7xVlhhoI6eiLercGgb3H4/f9JcOHsxRL8kD7mbGOawePTt2CFjFzIRduawFMLhxq3CQ
         aTjYQGSOMHyiDgZeS8R9vLC2xJS56Ok6bY/U60OrhyJmS1oH7bEqos6Hq3KBGsa5tumH
         JLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=8mow0SfmytEMKQtN8ioGDGYg4cG+kxQweZNjq89qOMw=;
        b=LE7JwesDG93NcFPzaf0uN/NFNlepnAautM64GHkMslVjulHB42+/i6Cyuyu1Nohqgl
         enfxrBYtEnl8R6Hi4VD1emMsWhbGMCJkCZe3nZWd6U8XzcI40CZBMZwhRI4rMcu81kqc
         vmk37WmWmw6dh57NjpuYD7e7ktvP2HRqIDHtQBHJCjONr+6G/V2xTRKfzay2z4D0quie
         x/2DETyeAPSCkrCXcRR+jQvNiuzbWGzBDqsyg5tAEGaX7zrGL5Gau5kB39nF33G1mBwh
         sh1JUnhlZqQg6k3s58YMtXZCO0jSzpCl4joDhzvdbKnx3iFMcsGMoHDlKTgfOqnr2s+x
         IDEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l27-v6si849245qtc.334.2018.04.23.13.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 13:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAhv9-0006ff-HN
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 16:18:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fAhuY-0006N6-1L
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 16:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fAhuU-0000Rn-Pm
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 16:18:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58252 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fAhuU-0000RJ-Kg; Mon, 23 Apr 2018 16:18:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E09A4072CFC;
	Mon, 23 Apr 2018 20:17:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB83A215CDC8;
	Mon, 23 Apr 2018 20:17:50 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-gwTH7DE4v5qzRpcBYtbWZpi0AMgVxPM7tX3Zsp-pLMQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3e8cd42f-8c96-3a68-c1cd-f20739f47a30@redhat.com>
Date: Mon, 23 Apr 2018 22:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gwTH7DE4v5qzRpcBYtbWZpi0AMgVxPM7tX3Zsp-pLMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 20:17:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 20:17:58 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v11 08/17] hw/arm/smmuv3: Event queue
 recording helper
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZG0xk6/bhpOz

Hi Peter,

On 04/16/2018 06:51 PM, Peter Maydell wrote:
> On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
>> Let's introduce a helper function aiming at recording an
>> event in the event queue.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v9 -> v10:
>> - rework SMMU_EVENT_STRING
>> - trigger a GERROR EVENTQ_ABT_ERR in case of eventq write failure
>>
>> v8 -> v9:
>> - add SMMU_EVENT_STRING
>>
>> v7 -> v8:
>> - use dma_addr_t instead of hwaddr in smmuv3_record_event()
>> - introduce struct SMMUEventInfo
>> - add event_stringify + helpers for all fields
>> ---
>>  hw/arm/smmuv3-internal.h | 142 ++++++++++++++++++++++++++++++++++++++++++++++-
>>  hw/arm/smmuv3.c          | 108 +++++++++++++++++++++++++++++++++--
>>  hw/arm/trace-events      |   1 +
>>  3 files changed, 243 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index 8550be0..8e546bf 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -205,8 +205,6 @@ static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
>>      s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>>  }
>>
>> -void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
>> -
>>  /* Commands */
>>
>>  typedef enum SMMUCommandType {
>> @@ -308,4 +306,144 @@ enum { /* Command completion notification */
>>
>>  #define SMMU_FEATURE_2LVL_STE (1 << 0)
>>
>> +/* Events */
>> +
>> +typedef enum SMMUEventType {
>> +    SMMU_EVT_OK                 = 0x00,
>> +    SMMU_EVT_F_UUT              = 0x01,
>> +    SMMU_EVT_C_BAD_STREAMID     = 0x02,
>> +    SMMU_EVT_F_STE_FETCH        = 0x03,
>> +    SMMU_EVT_C_BAD_STE          = 0x04,
>> +    SMMU_EVT_F_BAD_ATS_TREQ     = 0x05,
>> +    SMMU_EVT_F_STREAM_DISABLED  = 0x06,
>> +    SMMU_EVT_F_TRANS_FORBIDDEN  = 0x07,
>> +    SMMU_EVT_C_BAD_SUBSTREAMID  = 0x08,
>> +    SMMU_EVT_F_CD_FETCH         = 0x09,
>> +    SMMU_EVT_C_BAD_CD           = 0x0a,
>> +    SMMU_EVT_F_WALK_EABT        = 0x0b,
> 
> Most of the other enums you let the auto-increment deal
> with long runs of consecutive integers like this. I don't
> much care which but being consistent is generally nicer.
> 
>> +    SMMU_EVT_F_TRANSLATION      = 0x10,
>> +    SMMU_EVT_F_ADDR_SIZE        = 0x11,
>> +    SMMU_EVT_F_ACCESS           = 0x12,
>> +    SMMU_EVT_F_PERMISSION       = 0x13,
>> +    SMMU_EVT_F_TLB_CONFLICT     = 0x20,
>> +    SMMU_EVT_F_CFG_CONFLICT     = 0x21,
>> +    SMMU_EVT_E_PAGE_REQ         = 0x24,
>> +} SMMUEventType;
>> +
>> +static const char *event_stringify[] = {
>> +    [SMMU_EVT_OK]                       = "SMMU_EVT_OK",
>> +    [SMMU_EVT_F_UUT]                    = "SMMU_EVT_F_UUT",
>> +    [SMMU_EVT_C_BAD_STREAMID]           = "SMMU_EVT_C_BAD_STREAMID",
>> +    [SMMU_EVT_F_STE_FETCH]              = "SMMU_EVT_F_STE_FETCH",
>> +    [SMMU_EVT_C_BAD_STE]                = "SMMU_EVT_C_BAD_STE",
>> +    [SMMU_EVT_F_BAD_ATS_TREQ]           = "SMMU_EVT_F_BAD_ATS_TREQ",
>> +    [SMMU_EVT_F_STREAM_DISABLED]        = "SMMU_EVT_F_STREAM_DISABLED",
>> +    [SMMU_EVT_F_TRANS_FORBIDDEN]        = "SMMU_EVT_F_TRANS_FORBIDDEN",
>> +    [SMMU_EVT_C_BAD_SUBSTREAMID]        = "SMMU_EVT_C_BAD_SUBSTREAMID",
>> +    [SMMU_EVT_F_CD_FETCH]               = "SMMU_EVT_F_CD_FETCH",
>> +    [SMMU_EVT_C_BAD_CD]                 = "SMMU_EVT_C_BAD_CD",
>> +    [SMMU_EVT_F_WALK_EABT]              = "SMMU_EVT_F_WALK_EABT",
>> +    [SMMU_EVT_F_TRANSLATION]            = "SMMU_EVT_F_TRANSLATION",
>> +    [SMMU_EVT_F_ADDR_SIZE]              = "SMMU_EVT_F_ADDR_SIZE",
>> +    [SMMU_EVT_F_ACCESS]                 = "SMMU_EVT_F_ACCESS",
>> +    [SMMU_EVT_F_PERMISSION]             = "SMMU_EVT_F_PERMISSION",
>> +    [SMMU_EVT_F_TLB_CONFLICT]           = "SMMU_EVT_F_TLB_CONFLICT",
>> +    [SMMU_EVT_F_CFG_CONFLICT]           = "SMMU_EVT_F_CFG_CONFLICT",
>> +    [SMMU_EVT_E_PAGE_REQ]               = "SMMU_EVT_E_PAGE_REQ",
>> +};
>> +
>> +static inline const char *smmu_event_string(SMMUEventType type)
>> +{
>> +    return event_stringify[type] ? event_stringify[type] : "UNKNOWN";
> 
> Same remarks about being defensive about out of range values
> apply here, I expect.
I think this one is safe as called from smmuv3_record_event(). Type is
is sanitized in that case. Adding the check against ARRAY_SIZE though.

Thanks

Eric
> 
>> +}
>> +
>> +/*  Encode an event record */
>> +typedef struct SMMUEventInfo {
>> +    SMMUEventType type;
>> +    uint32_t sid;
>> +    bool recorded;
>> +    bool record_trans_faults;
>> +    union {
>> +        struct {
>> +            uint32_t ssid;
>> +            bool ssv;
>> +            dma_addr_t addr;
>> +            bool rnw;
>> +            bool pnu;
>> +            bool ind;
>> +       } f_uut;
>> +       struct ssid_info {
>> +            uint32_t ssid;
>> +            bool ssv;
>> +       } c_bad_streamid;
> 
> If we were being really picky about coding style these
> embedded struct names like ssid_info ought to be camelcase.
> 
>> +       struct ssid_addr_info {
>> +            uint32_t ssid;
>> +            bool ssv;
>> +            dma_addr_t addr;
>> +       } f_ste_fetch;
>> +       struct ssid_info c_bad_ste;
>> +       struct {
>> +            dma_addr_t addr;
>> +            bool rnw;
>> +       } f_transl_forbidden;
>> +       struct {
>> +            uint32_t ssid;
>> +       } c_bad_substream;
>> +       struct ssid_addr_info f_cd_fetch;
>> +       struct ssid_info c_bad_cd;
>> +       struct full_info {
>> +            bool stall;
>> +            uint16_t stag;
>> +            uint32_t ssid;
>> +            bool ssv;
>> +            bool s2;
>> +            dma_addr_t addr;
>> +            bool rnw;
>> +            bool pnu;
>> +            bool ind;
>> +            uint8_t class;
>> +            dma_addr_t addr2;
>> +       } f_walk_eabt;
>> +       struct full_info f_translation;
>> +       struct full_info f_addr_size;
>> +       struct full_info f_access;
>> +       struct full_info f_permission;
>> +       struct ssid_info f_cfg_conflict;
>> +       /**
>> +        * not supported yet:
>> +        * F_BAD_ATS_TREQ
>> +        * F_BAD_ATS_TREQ
>> +        * F_TLB_CONFLICT
>> +        * E_PAGE_REQUEST
>> +        * IMPDEF_EVENTn
>> +        */
>> +    } u;
>> +} SMMUEventInfo;
>> +
>> +/* EVTQ fields */
>> +
>> +#define EVT_Q_OVERFLOW        (1 << 31)
>> +
>> +#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 ,  v)
>> +#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 ,  v)
>> +#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
>> +#define EVT_SET_SID(x, v)               ((x)->word[1] =  v)
>> +#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
>> +#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
>> +#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
>> +#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
>> +#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
>> +#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
>> +#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)
> 
> There's some weird extra spaces in these macros.
> 
>> +#define EVT_SET_ADDR(x, addr) ({                    \
>> +            (x)->word[5] = (uint32_t)(addr >> 32);        \
>> +            (x)->word[4] = (uint32_t)(addr & 0xffffffff); \
>> +        })
>> +#define EVT_SET_ADDR2(x, addr) ({                    \
>> +            deposit32((x)->word[7], 3, 29, addr >> 16);        \
>> +            deposit32((x)->word[7], 0, 16, addr & 0xffff); \
>> +        })
> 
> These don't need the GCC ({ }) extension -- you can just do them
> as normal do { ... } while (0) macros.
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 
