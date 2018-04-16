Received: by 10.28.4.212 with SMTP id 203csp2863808wme;
        Mon, 16 Apr 2018 09:52:33 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+Qh84LBe75GLQRom02QFJLCMeyi9Zxpjsmj+Lfhsu1pj/QHYLl1JElW405AF9xQKsg7b9X
X-Received: by 10.55.160.142 with SMTP id j136mr6200013qke.225.1523897553611;
        Mon, 16 Apr 2018 09:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523897553; cv=none;
        d=google.com; s=arc-20160816;
        b=E/yM7cBepy6PwXdu2BU1NCa0y4x99xLy5MSKQfJK7Ar17m+7gJLhVkvUrE7HhcGcDH
         03qh6ReH7qr+DUlnqyrK5InLSfhbv5iJZ/Md7zrc0wJg2wjzxHCRC02zB7xMQofFtiom
         CFLByFJELtjbNgzVDayLp0pDfemVNYhm+Jm8Jnno2tkFEgmqfSyznolfS0o9yVnCqLZA
         //RfSg1mI3fx3+pQ6jEeQgHMs0slXIgx2oiESgSBUUmO/hak6BH7qCgO/pbPnc2xDQAD
         /WLNO/0408O/YAFf/TpE+MFiiHddBz2YNPiehdemokiYZ1/iiRTtWGIJ8yHqcKhGCwWy
         4iOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=HDLI43Ghk5l5J8tO2NhtLvSLlnft8GuD12WAiyB30xQ=;
        b=gk3bQg/S7DeOBndYAXFvPycMeIpoetZzoFZ9RqaiVzyuMTjTk5sw4eX354FwvL545u
         Uf/gIF35jHF5ZqCN7rd0QMyvawfN8byXNnbZbxMcC1IKDO1ePUVqpYd3qf6xy8k6jbC5
         ER8hmivjy1gW1lyXPoTO4Ig4qamG5AYa0KCaUdBvd+Fe/3Up0BxIvSvbov697ytTW2Ot
         jOhahPenkxbI6tyGydZzoUVO+s0JOyVE2CykUOiFfubpUYLcOkfitZM/sqwAG12vqM7O
         39ztEt72N81kx4L8tqnwso06VPVCeTDE/koA9vAbmjz+qizRs6dH4QScKNjWojzOEiZ0
         rf9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGNSYG1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n9si5453960qte.274.2018.04.16.09.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 09:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NGNSYG1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87Mn-0001jZ-1b
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 12:52:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87MX-0001ha-C4
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:52:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87MW-0006px-1k
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:52:17 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87MV-0006pJ-S8
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:52:16 -0400
Received: by mail-oi0-x244.google.com with SMTP id e23-v6so3973673oiy.1
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HDLI43Ghk5l5J8tO2NhtLvSLlnft8GuD12WAiyB30xQ=;
	b=NGNSYG1W4/v/lU7hO220B8DETvLA7rsvGRlnRjlqUjCti73safWjrR7BruqVbRe2O7
	rR2Qf3wtXLONtHDJdchaxvq1X5Eup8wUx0a7PKyfShI4dQ0TW/MShBO1p0adxlAqF/M4
	ILrVjPvwVtO+YCSNyKuyG+GkvxnEqT2SK++ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HDLI43Ghk5l5J8tO2NhtLvSLlnft8GuD12WAiyB30xQ=;
	b=nRto7pUVR6kfKlAbMLuJwBrxdIzhf3GvVSHs1lP9NafSliuzYvL+Cxy11RowVY5oZv
	WHOKPR/s2d68tXrQg66K45eUKWpKmgzncZL0/psnzr/00i0QtrilVFAuniqFaUi3rWuW
	csjL9/ZnpAl29wgI7Y4N72l6ifN+JAoJvY3h+Y2wLoEBgqTJJ1+H0x9LvJ5sZkjEV52J
	YN0AGYgtioLEmY8U9S69yppnVBcHkm6YqxWwGje8EGmPyCmWA8d1m83QwZbLhMgYhCty
	HxuRVCRYbM7B5o9pnJWkhhEfVhF2nvAP7L0jWxGdFUTeD3QKbLJGbI9cnaUABjfts9Nm
	y4BA==
X-Gm-Message-State: ALQs6tBLngzhVJVjewV0NnauNQ6vYtLQMp2YwPhNqXMf9cPfaxXVvPf/
	2WrQAbUcQcxi95oiBeSi/JPFSoaPdCzGXuVbUtojvQ==
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr15581064oif.12.1523897535024; 
	Mon, 16 Apr 2018 09:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 09:51:54
	-0700 (PDT)
In-Reply-To: <1523518688-26674-9-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-9-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 17:51:54 +0100
Message-ID: <CAFEAcA-gwTH7DE4v5qzRpcBYtbWZpi0AMgVxPM7tX3Zsp-pLMQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
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
X-TUID: TW4ygkYt+ng2

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> Let's introduce a helper function aiming at recording an
> event in the event queue.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v9 -> v10:
> - rework SMMU_EVENT_STRING
> - trigger a GERROR EVENTQ_ABT_ERR in case of eventq write failure
>
> v8 -> v9:
> - add SMMU_EVENT_STRING
>
> v7 -> v8:
> - use dma_addr_t instead of hwaddr in smmuv3_record_event()
> - introduce struct SMMUEventInfo
> - add event_stringify + helpers for all fields
> ---
>  hw/arm/smmuv3-internal.h | 142 ++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmuv3.c          | 108 +++++++++++++++++++++++++++++++++--
>  hw/arm/trace-events      |   1 +
>  3 files changed, 243 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 8550be0..8e546bf 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -205,8 +205,6 @@ static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
>      s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>  }
>
> -void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
> -
>  /* Commands */
>
>  typedef enum SMMUCommandType {
> @@ -308,4 +306,144 @@ enum { /* Command completion notification */
>
>  #define SMMU_FEATURE_2LVL_STE (1 << 0)
>
> +/* Events */
> +
> +typedef enum SMMUEventType {
> +    SMMU_EVT_OK                 = 0x00,
> +    SMMU_EVT_F_UUT              = 0x01,
> +    SMMU_EVT_C_BAD_STREAMID     = 0x02,
> +    SMMU_EVT_F_STE_FETCH        = 0x03,
> +    SMMU_EVT_C_BAD_STE          = 0x04,
> +    SMMU_EVT_F_BAD_ATS_TREQ     = 0x05,
> +    SMMU_EVT_F_STREAM_DISABLED  = 0x06,
> +    SMMU_EVT_F_TRANS_FORBIDDEN  = 0x07,
> +    SMMU_EVT_C_BAD_SUBSTREAMID  = 0x08,
> +    SMMU_EVT_F_CD_FETCH         = 0x09,
> +    SMMU_EVT_C_BAD_CD           = 0x0a,
> +    SMMU_EVT_F_WALK_EABT        = 0x0b,

Most of the other enums you let the auto-increment deal
with long runs of consecutive integers like this. I don't
much care which but being consistent is generally nicer.

> +    SMMU_EVT_F_TRANSLATION      = 0x10,
> +    SMMU_EVT_F_ADDR_SIZE        = 0x11,
> +    SMMU_EVT_F_ACCESS           = 0x12,
> +    SMMU_EVT_F_PERMISSION       = 0x13,
> +    SMMU_EVT_F_TLB_CONFLICT     = 0x20,
> +    SMMU_EVT_F_CFG_CONFLICT     = 0x21,
> +    SMMU_EVT_E_PAGE_REQ         = 0x24,
> +} SMMUEventType;
> +
> +static const char *event_stringify[] = {
> +    [SMMU_EVT_OK]                       = "SMMU_EVT_OK",
> +    [SMMU_EVT_F_UUT]                    = "SMMU_EVT_F_UUT",
> +    [SMMU_EVT_C_BAD_STREAMID]           = "SMMU_EVT_C_BAD_STREAMID",
> +    [SMMU_EVT_F_STE_FETCH]              = "SMMU_EVT_F_STE_FETCH",
> +    [SMMU_EVT_C_BAD_STE]                = "SMMU_EVT_C_BAD_STE",
> +    [SMMU_EVT_F_BAD_ATS_TREQ]           = "SMMU_EVT_F_BAD_ATS_TREQ",
> +    [SMMU_EVT_F_STREAM_DISABLED]        = "SMMU_EVT_F_STREAM_DISABLED",
> +    [SMMU_EVT_F_TRANS_FORBIDDEN]        = "SMMU_EVT_F_TRANS_FORBIDDEN",
> +    [SMMU_EVT_C_BAD_SUBSTREAMID]        = "SMMU_EVT_C_BAD_SUBSTREAMID",
> +    [SMMU_EVT_F_CD_FETCH]               = "SMMU_EVT_F_CD_FETCH",
> +    [SMMU_EVT_C_BAD_CD]                 = "SMMU_EVT_C_BAD_CD",
> +    [SMMU_EVT_F_WALK_EABT]              = "SMMU_EVT_F_WALK_EABT",
> +    [SMMU_EVT_F_TRANSLATION]            = "SMMU_EVT_F_TRANSLATION",
> +    [SMMU_EVT_F_ADDR_SIZE]              = "SMMU_EVT_F_ADDR_SIZE",
> +    [SMMU_EVT_F_ACCESS]                 = "SMMU_EVT_F_ACCESS",
> +    [SMMU_EVT_F_PERMISSION]             = "SMMU_EVT_F_PERMISSION",
> +    [SMMU_EVT_F_TLB_CONFLICT]           = "SMMU_EVT_F_TLB_CONFLICT",
> +    [SMMU_EVT_F_CFG_CONFLICT]           = "SMMU_EVT_F_CFG_CONFLICT",
> +    [SMMU_EVT_E_PAGE_REQ]               = "SMMU_EVT_E_PAGE_REQ",
> +};
> +
> +static inline const char *smmu_event_string(SMMUEventType type)
> +{
> +    return event_stringify[type] ? event_stringify[type] : "UNKNOWN";

Same remarks about being defensive about out of range values
apply here, I expect.

> +}
> +
> +/*  Encode an event record */
> +typedef struct SMMUEventInfo {
> +    SMMUEventType type;
> +    uint32_t sid;
> +    bool recorded;
> +    bool record_trans_faults;
> +    union {
> +        struct {
> +            uint32_t ssid;
> +            bool ssv;
> +            dma_addr_t addr;
> +            bool rnw;
> +            bool pnu;
> +            bool ind;
> +       } f_uut;
> +       struct ssid_info {
> +            uint32_t ssid;
> +            bool ssv;
> +       } c_bad_streamid;

If we were being really picky about coding style these
embedded struct names like ssid_info ought to be camelcase.

> +       struct ssid_addr_info {
> +            uint32_t ssid;
> +            bool ssv;
> +            dma_addr_t addr;
> +       } f_ste_fetch;
> +       struct ssid_info c_bad_ste;
> +       struct {
> +            dma_addr_t addr;
> +            bool rnw;
> +       } f_transl_forbidden;
> +       struct {
> +            uint32_t ssid;
> +       } c_bad_substream;
> +       struct ssid_addr_info f_cd_fetch;
> +       struct ssid_info c_bad_cd;
> +       struct full_info {
> +            bool stall;
> +            uint16_t stag;
> +            uint32_t ssid;
> +            bool ssv;
> +            bool s2;
> +            dma_addr_t addr;
> +            bool rnw;
> +            bool pnu;
> +            bool ind;
> +            uint8_t class;
> +            dma_addr_t addr2;
> +       } f_walk_eabt;
> +       struct full_info f_translation;
> +       struct full_info f_addr_size;
> +       struct full_info f_access;
> +       struct full_info f_permission;
> +       struct ssid_info f_cfg_conflict;
> +       /**
> +        * not supported yet:
> +        * F_BAD_ATS_TREQ
> +        * F_BAD_ATS_TREQ
> +        * F_TLB_CONFLICT
> +        * E_PAGE_REQUEST
> +        * IMPDEF_EVENTn
> +        */
> +    } u;
> +} SMMUEventInfo;
> +
> +/* EVTQ fields */
> +
> +#define EVT_Q_OVERFLOW        (1 << 31)
> +
> +#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 ,  v)
> +#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 ,  v)
> +#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
> +#define EVT_SET_SID(x, v)               ((x)->word[1] =  v)
> +#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
> +#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
> +#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
> +#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
> +#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
> +#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
> +#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)

There's some weird extra spaces in these macros.

> +#define EVT_SET_ADDR(x, addr) ({                    \
> +            (x)->word[5] = (uint32_t)(addr >> 32);        \
> +            (x)->word[4] = (uint32_t)(addr & 0xffffffff); \
> +        })
> +#define EVT_SET_ADDR2(x, addr) ({                    \
> +            deposit32((x)->word[7], 3, 29, addr >> 16);        \
> +            deposit32((x)->word[7], 0, 16, addr & 0xffff); \
> +        })

These don't need the GCC ({ }) extension -- you can just do them
as normal do { ... } while (0) macros.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
