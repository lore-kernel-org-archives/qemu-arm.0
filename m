Received: by 10.223.197.9 with SMTP id q9csp2689331wrf;
        Mon, 9 Oct 2017 10:39:46 -0700 (PDT)
X-Received: by 10.200.46.22 with SMTP id r22mr14616040qta.63.1507570786880;
        Mon, 09 Oct 2017 10:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507570786; cv=none;
        d=google.com; s=arc-20160816;
        b=VW70BFBqplEVRSkG6VT8HwBQ+wTMj+64KVAGEWX+ssiwL3rgoKZCJfl11Ygize6UQI
         l/DjINSQzGSSBJ422AysRH9X5yAyUHFLhVcUy1a7ipk1Adi4PMVjQGnZg/MCRrMFH7bw
         y4OCGq0IaExIkOvrgqCxIn9r6IPyHC07pURyjAMn4yCUtcdPb1+vh2L6IRZKkxm/Oh3x
         F7SwdYmBZIaLrdlfFhVbToRuW29gvCBqyLa/6ITN/16R8AMcCRSu7IuRtyif3UPJwesu
         VW4UI7WwYB5Lyx1Dd8z9HJ2U5nstU+UuCd+i6g6IH/MNR0M5GWFLKXK/CzJISoEd+JMY
         ZL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CQzgHWkp+6eXkDfZJW3OVSG2JPhPNVNCfctUEbAvCk8=;
        b=knAP1okcsB+Ndwud+lDAh0OiVSwiS5+953f0V7KN515H74WagRrkFHcftY+sve0hwH
         /Es7VCqGhgzhnYaqhGvh1dTRzxM0JoVYP8t9tIBHmGRfR7WaGtfJlC1q/EO712WhzEes
         tC+bLMNL/CQJVqMGBTDz41Or3BapGnMZaynLnJVb3VwidGmdSoCRpmbdMRmkVIjL9j+U
         x2wRWEd4ejts9NtAHYol0C+eFvkR5GPiElvPTA2ls2UhMTGps99S4fAvPbdeLp2mUlVG
         S7BVdadM9FbeN8jVjUKtlskNH1QyekoaI/2Te8sWCVAQfa84ZqXuTBKQIfYy/RybG/G3
         Dd/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JSNuL3tm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n18si1664946qtk.101.2017.10.09.10.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:39:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JSNuL3tm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1c1q-0002Hs-7c
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:39:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bwg-0006F6-Qw
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bwf-0007kb-M5
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:34:26 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:50488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bwf-0007kL-Dk
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:34:25 -0400
Received: by mail-wm0-x235.google.com with SMTP id u138so24530531wmu.5
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CQzgHWkp+6eXkDfZJW3OVSG2JPhPNVNCfctUEbAvCk8=;
	b=JSNuL3tmcL7oSUx+v9Q9JuN7qz1ETSILhlMn4dByncdmxczVTsvGM5g4rtwqo0j5T1
	GpmrQgy5DSpHj3jF1LBBOBJEEkZoAZKiLcHMCimCuNu956E/J5WHqj4Hj75lL1kKgm7c
	0CuqkIxIdkXG2td18odSXZCyf2WxNQYgNKuqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CQzgHWkp+6eXkDfZJW3OVSG2JPhPNVNCfctUEbAvCk8=;
	b=gA7j5GFjRKk+R3lkcSQJzOlr3eG83SOHHABUlT620/wsSpnRdx+hXod8WJXgwT7lOa
	bMzEx+p0hO3rEuG8MfmAGwsnhM31nptmHSw/c60KxYqhaU7gxPK+xGQmelHlzdpfMl0U
	9eYsbR92p6REbG8FJ6SYzw1C0irEVPUeq++dVbYU1OlsAEIpplDSDBRiMVhTWnt58mP6
	CCsElV7dM4DZCnOad7yRbYLXZPHxOS+2bPXo/mS5+M/CH0Cj40oducL1FN2rWEPfpCr4
	5rPdoEeAS/3wAbPB9466y3E5SmqESL/rAMUdyqij7h+UdQ0UhzA93P4SPysnHc0zTUgd
	DpMg==
X-Gm-Message-State: AMCzsaWBz/m0h3dsWzCftCB56tuAqwEoqUFfRj39hiErsbwYe9k4CpIO
	22G1RwjIhEeolAPZwGjQ46Qc+dVQqIsiwpb4jTUzUg==
X-Google-Smtp-Source: AOwi7QD8DrUsQGrJMBbxXotxkJnZ2JDFoUt/AEkdMyJXgHpHMVcpWpX2RBoaE5JEyeaNqP/Ir+hSXzKgYga/5abqalc=
X-Received: by 10.223.175.56 with SMTP id z53mr11543333wrc.177.1507570464228; 
	Mon, 09 Oct 2017 10:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:34:03 -0700 (PDT)
In-Reply-To: <1504286483-23327-10-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-10-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:34:03 +0100
Message-ID: <CAFEAcA81EjsJ_ZVjvCY-jAjzq_=CK1AVdwGTd_c_XPpC53+E9w@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [PATCH v7 09/20] hw/arm/smmuv3: Event queue
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
X-TUID: XQSKgdsBcb/n

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> Let's introduce a helper function aiming at recording an
> event in the event queue.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> At the moment, for some events we do not fill all the fields.
> Typically filling the FetchAddr field resulting of an abort
> on page table walk would require to return more information
> from this latter in case of error.
>
> However with enabled use cases I have not seen any event
> recorded yet.
> ---
>  hw/arm/smmuv3-internal.h | 45 ++++++++++++++++++++++++--
>  hw/arm/smmuv3.c          | 84 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 126 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index a5d60b4..e3e9828 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -259,8 +259,6 @@ static inline void smmu_write_cmdq_err(SMMUV3State *s, uint32_t err_type)
>                          regval | err_type << SMMU_CMD_CONS_ERR_SHIFT);
>  }
>
> -void smmuv3_write_evtq(SMMUV3State *s, Evt *evt);
> -
>  /*****************************
>   * Commands
>   *****************************/
> @@ -361,4 +359,47 @@ enum { /* Command completion notification */
>              addr;                                       \
>          })
>
> +/*****************************
> + * EVTQ fields
> + *****************************/
> +
> +#define EVT_Q_OVERFLOW        (1 << 31)
> +
> +#define EVT_SET_TYPE(x, t)    deposit32((x)->word[0], 0, 8, t)
> +#define EVT_SET_SID(x, s)     ((x)->word[1] =  s)
> +#define EVT_SET_INPUT_ADDR(x, addr) ({                    \
> +            (x)->word[5] = (uint32_t)(addr >> 32);        \
> +            (x)->word[4] = (uint32_t)(addr & 0xffffffff); \
> +        })
> +#define EVT_SET_RNW(x, rnw)     deposit32((x)->word[3], 3, 1, rnw)
> +
> +/*****************************
> + * Events
> + *****************************/
> +
> +typedef enum evt_err {
> +    SMMU_EVT_OK,
> +    SMMU_EVT_F_UUT,
> +    SMMU_EVT_C_BAD_SID,
> +    SMMU_EVT_F_STE_FETCH,
> +    SMMU_EVT_C_BAD_STE,
> +    SMMU_EVT_F_BAD_ATS_REQ,
> +    SMMU_EVT_F_STREAM_DISABLED,
> +    SMMU_EVT_F_TRANS_FORBIDDEN,
> +    SMMU_EVT_C_BAD_SSID,
> +    SMMU_EVT_F_CD_FETCH,
> +    SMMU_EVT_C_BAD_CD,
> +    SMMU_EVT_F_WALK_EXT_ABRT,
> +    SMMU_EVT_F_TRANS        = 0x10,
> +    SMMU_EVT_F_ADDR_SZ,
> +    SMMU_EVT_F_ACCESS,
> +    SMMU_EVT_F_PERM,
> +    SMMU_EVT_F_TLB_CONFLICT = 0x20,
> +    SMMU_EVT_F_CFG_CONFLICT = 0x21,
> +    SMMU_EVT_E_PAGE_REQ     = 0x24,
> +} SMMUEvtErr;
> +
> +void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
> +                         uint32_t sid, bool is_write, SMMUEvtErr type);
> +
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f35fadc..7470576 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -132,7 +132,7 @@ static MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
>      return ret;
>  }
>
> -void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
> +static void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
>  {
>      SMMUQueue *q = &s->evtq;
>      bool was_empty = smmu_is_q_empty(s, q);
> @@ -157,6 +157,88 @@ void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
>      }
>  }
>
> +/*
> + * smmuv3_record_event - Record an event
> + */
> +void smmuv3_record_event(SMMUV3State *s, hwaddr iova,

(Are you sure you want a hwaddr and not a uint64_t ?)

> +                         uint32_t sid, IOMMUAccessFlags perm,
> +                         SMMUEvtErr type)
> +{
> +    Evt evt;
> +    bool rnw = perm & IOMMU_RO;

This doesn't feel like a great way to structure this, because
every event has different fields and so you'll end up with
a huge number of parameters to this function, half of which
are unused for any given callsite.

I think a better approach is to have one utility function
per event type (the syn_aa64_* functions in target/arm/internals.h
for filling out syndrome register values are an example of this).

Or you could have a struct-and-union setup

typedef struct {
    uint8_t event_type;
    union {
        struct {
            hwaddr iova;
            bool rnw;
            // etc
        } f_uut;
        struct {
            // etc
        } c_bad_streamid;
        // etc
    } u;
} EventInfo;

and have callers fill that in for this function to then
marshal into the record structure. That might be a bit
heavyweight here compared to just having a function per
event -- depends a bit on whether your callsites are
going to find it helpful to construct an EventInfo in
one place and then hand it around/return it from a function
before recording it in the queue, or if you always have
all the info you need for the event right at the point
where you want to record it.

thanks
-- PMM
