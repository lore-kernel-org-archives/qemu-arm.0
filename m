Received: by 10.28.4.212 with SMTP id 203csp2853622wme;
        Mon, 16 Apr 2018 09:42:06 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49Bt5uZVM29mp0uxpB27hiAUAznx0d6bmy9gcGZrETfVJ3h6jV5vvTX6ZpL8/9o4OwJ9AWt
X-Received: by 10.55.20.135 with SMTP id 7mr17393683qku.236.1523896926759;
        Mon, 16 Apr 2018 09:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523896926; cv=none;
        d=google.com; s=arc-20160816;
        b=VYdnbtf4OM2l8g8bCgfcxrppVuJurxVcn7kwPCtkpHE0QRWjVZCdCCRUGzdXAcRWE+
         Eky9x+V0MguCi93a11HsrpDXLebs/seZfvKHlu0998tXBNKHURPWSz/R/9b1S4NMgZTY
         3giE/rSY8a8HzzLA4bQZ/hMVNLjGegTN6sJMRpokhXRxW5OSPKo1hm9FzRKTwgCj7BZF
         HaUJEtO2xtOb4G95cioNN3P/TW4VC2MfCgpAaKC6TnX2JxtLlTfTX0CpcIiOz+H8Ogzg
         FoThfi1mHEIzhEysgRUK3zIArRSMUq3JSWyrKKKZhS+vDo5yMle+c21s7ZJPrLAvbRAV
         Vo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dpWLnI7/y9ef2xcZLxjoDs25X7bmyi0xg9Od8qCCW2Q=;
        b=zyef2jCfLsbK0TEcemU1kb89H3rRtbjJy1oNCABuic6XInuohKQxI4Mu96dTmM5et0
         FWxTHMZHijSp3loiEhXvf69FhBe9HTcLdLVyFQ/nYFOeuzmcXAW4wSF70g3IhjYLzyXY
         P3MYUlfJ22px3dGTpc5Hir0gqgurVFIZM1jBGKhnfUO2l5cMjx/WRlMDNLVjhfhAwWlH
         EBXSydl/nRTaRIdpVN5UGWYFxS5VW2xcKsdwGi6OueB4MNMYacqiO/YPVKv1bf3yokID
         VoT3l9kMaPUIOu7HiVfWUc4gIvXWkJiDFnbYmRwWLgm7qe3vKbWjSaU9U1ljP4lR4ALg
         A8/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j38RQzmG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1si4676165qkd.297.2018.04.16.09.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 09:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j38RQzmG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87Cg-0002ou-6z
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 12:42:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87C6-0002mM-L7
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 12:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87C5-0007nE-7y
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 12:41:30 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87C5-0007mk-0M
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 12:41:29 -0400
Received: by mail-oi0-x244.google.com with SMTP id 126-v6so15139547oig.0
	for <qemu-devel@nongnu.org>; Mon, 16 Apr 2018 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dpWLnI7/y9ef2xcZLxjoDs25X7bmyi0xg9Od8qCCW2Q=;
	b=j38RQzmGG7t13OeXjhz80A8FcY1srsHYr7uGLbX15hIUMYRh4A6mWwp04ZCOtdN+/S
	W+foZwIyp4Fi5aKPNBNSol68sxmDDcJYGRSUjhI8Vr6v9nOloBq6/7SaN1q0FtNwsDa3
	P8bscsUevqNnrgWadeIbMRFBLl76OSZFfQllc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dpWLnI7/y9ef2xcZLxjoDs25X7bmyi0xg9Od8qCCW2Q=;
	b=dC7QT1MxT1dyDl17rX8Ti83YikezF2Ze7+jDnxbTQpl5Le4G6Y2qDBfUm7efvKvoad
	Rub4irRyCIisrq1ZWAKWwMZFLIr/pmE2BdGyyov8Vj9GNbn3M8npedJP/dowy08dPkOS
	RRCsnDJtH/EAJriUeJ5Ua3bYOmQrfdk0vQMxtg6juYTHzgpql4wWXm1QdLfuacy/rea9
	ZMD4HmX0snPBbw5zGOTHIF1QwdLUCCzBXgbGilyvy7kge7GJ4COrqm7aLchtT0XCw0DU
	TFIdYeQ11PeURf52j7cE2v3L5sM/Wcb3dvEF9vWKnYIuslukSGMLbex5hNhXxblUbrht
	Hwrw==
X-Gm-Message-State: ALQs6tAL8i3SoTgaaBYaBewu+Btdxq9eI8nm9fRluztSahVFEzDEV/Xo
	0rNHCi2VumzQvxUYGQyxCihIRqPvWgUc9/uahI4kNg==
X-Received: by 2002:aca:43d5:: with SMTP id
	q204-v6mr5256164oia.80.1523896888116; 
	Mon, 16 Apr 2018 09:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 09:41:07
	-0700 (PDT)
In-Reply-To: <1523518688-26674-7-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-7-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 17:41:07 +0100
Message-ID: <CAFEAcA913D3L_33GO_FZTxip0EZr6XBDvgaTYWGg_Vjmq3PrJA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v11 06/17] hw/arm/smmuv3: Queue helpers
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SlNwKNWGZZQW

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> We introduce helpers to read/write into the command and event
> circular queues.
>
> smmuv3_write_eventq and smmuv3_cmq_consume will become static
> in subsequent patches.
>
> Invalidation commands are not yet dealt with. We do not cache
> data that need to be invalidated. This will change with vhost
> integration.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> ---
> v9 -> v10:
> - simplified macros
> - s/BASE/Q_BASE
> - use log2size field
> - static inline functions replacing some macros
> - simplified queue_prod_incr/queue_cons_incr and use deposit32
> - trace for cmdq_consume failure
>
> v8 -> v9:
> - fix CMD_SSID & CMD_ADDR + some renamings
> - do cons increment after the execution of the command
> - add Q_INCONSISTENT()
>
> v7 -> v8
> - use address_space_rw
> - helpers inspired from spec
> ---
>  hw/arm/smmuv3-internal.h | 154 +++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c          | 136 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events      |   5 ++
>  3 files changed, 295 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 32f81d4..968fa25 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -156,4 +156,158 @@ static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
>  void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
>  void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
>
> +/* Queue Handling */
> +
> +#define Q_BASE(q)          ((q)->base & SMMU_BASE_ADDR_MASK)
> +#define WRAP_MASK(q)       (1 << (q)->log2size)
> +#define INDEX_MASK(q)      (((1 << (q)->log2size)) - 1)
> +#define WRAP_INDEX_MASK(q) ((1 << ((q)->log2size + 1)) - 1)
> +
> +#define Q_CONS(q) ((q)->cons & INDEX_MASK(q))
> +#define Q_PROD(q) ((q)->prod & INDEX_MASK(q))
> +
> +#define Q_CONS_ENTRY(q)  (Q_BASE(q) + (q)->entry_size * Q_CONS(q))
> +#define Q_PROD_ENTRY(q)  (Q_BASE(q) + (q)->entry_size * Q_PROD(q))
> +
> +#define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> (q)->log2size)
> +#define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> (q)->log2size)
> +
> +static inline bool smmuv3_q_full(SMMUQueue *q)
> +{
> +    return ((q->cons ^ q->prod) & WRAP_INDEX_MASK(q)) == WRAP_MASK(q);
> +}
> +
> +static inline bool smmuv3_q_empty(SMMUQueue *q)
> +{
> +    return (q->cons & WRAP_INDEX_MASK(q)) == (q->prod & WRAP_INDEX_MASK(q));
> +}
> +
> +static inline void queue_prod_incr(SMMUQueue *q)
> +{
> +    q->prod = (q->prod + 1) & WRAP_INDEX_MASK(q);
> +}
> +
> +static inline void queue_cons_incr(SMMUQueue *q)
> +{
> +    q->cons = deposit32(q->cons, 0, q->log2size + 1, q->cons + 1);
> +}

I was expecting these two functions to be implemented in
the same way. Worth a comment
    /* We have to use deposit for the CONS registers to preserve
     * the ERR field in the high bits.
     */

or if you prefer, instead a comment in queue_prod_incr saying
   /* We don't need to use deposit here because there are no
    * fields above WRAP in a PROD register
    */

(you don't need both comments).

> +
> +static inline bool smmuv3_cmdq_enabled(SMMUv3State *s)
> +{
> +    return FIELD_EX32(s->cr[0], CR0, CMDQEN);
> +}
> +
> +static inline bool smmuv3_eventq_enabled(SMMUv3State *s)
> +{
> +    return FIELD_EX32(s->cr[0], CR0, EVENTQEN);
> +}
> +
> +static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
> +{
> +    s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
> +}
> +
> +void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
> +
> +/* Commands */
> +
> +typedef enum SMMUCommandType {
> +    SMMU_CMD_PREFETCH_CONFIG = 0x01,
> +    SMMU_CMD_PREFETCH_ADDR,
> +    SMMU_CMD_CFGI_STE,
> +    SMMU_CMD_CFGI_STE_RANGE,
> +    SMMU_CMD_CFGI_CD,
> +    SMMU_CMD_CFGI_CD_ALL,
> +    SMMU_CMD_CFGI_ALL,
> +    SMMU_CMD_TLBI_NH_ALL     = 0x10,
> +    SMMU_CMD_TLBI_NH_ASID,
> +    SMMU_CMD_TLBI_NH_VA,
> +    SMMU_CMD_TLBI_NH_VAA,
> +    SMMU_CMD_TLBI_EL3_ALL    = 0x18,
> +    SMMU_CMD_TLBI_EL3_VA     = 0x1a,
> +    SMMU_CMD_TLBI_EL2_ALL    = 0x20,
> +    SMMU_CMD_TLBI_EL2_ASID,
> +    SMMU_CMD_TLBI_EL2_VA,
> +    SMMU_CMD_TLBI_EL2_VAA,  /* 0x23 */
> +    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
> +    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
> +    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
> +    SMMU_CMD_ATC_INV         = 0x40,
> +    SMMU_CMD_PRI_RESP,
> +    SMMU_CMD_RESUME          = 0x44,
> +    SMMU_CMD_STALL_TERM,
> +    SMMU_CMD_SYNC,          /* 0x46 */

I don't think the comments are very useful here (and they're
not consistent -- you don't bother to mark 0x13 or 0x07).

> +} SMMUCommandType;
> +
> +static const char *cmd_stringify[] = {
> +    [SMMU_CMD_PREFETCH_CONFIG] = "SMMU_CMD_PREFETCH_CONFIG",
> +    [SMMU_CMD_PREFETCH_ADDR]   = "SMMU_CMD_PREFETCH_ADDR",
> +    [SMMU_CMD_CFGI_STE]        = "SMMU_CMD_CFGI_STE",
> +    [SMMU_CMD_CFGI_STE_RANGE]  = "SMMU_CMD_CFGI_STE_RANGE",
> +    [SMMU_CMD_CFGI_CD]         = "SMMU_CMD_CFGI_CD",
> +    [SMMU_CMD_CFGI_CD_ALL]     = "SMMU_CMD_CFGI_CD_ALL",
> +    [SMMU_CMD_CFGI_ALL]        = "SMMU_CMD_CFGI_ALL",
> +    [SMMU_CMD_TLBI_NH_ALL]     = "SMMU_CMD_TLBI_NH_ALL",
> +    [SMMU_CMD_TLBI_NH_ASID]    = "SMMU_CMD_TLBI_NH_ASID",
> +    [SMMU_CMD_TLBI_NH_VA]      = "SMMU_CMD_TLBI_NH_VA",
> +    [SMMU_CMD_TLBI_NH_VAA]     = "SMMU_CMD_TLBI_NH_VAA",
> +    [SMMU_CMD_TLBI_EL3_ALL]    = "SMMU_CMD_TLBI_EL3_ALL",
> +    [SMMU_CMD_TLBI_EL3_VA]     = "SMMU_CMD_TLBI_EL3_VA",
> +    [SMMU_CMD_TLBI_EL2_ALL]    = "SMMU_CMD_TLBI_EL2_ALL",
> +    [SMMU_CMD_TLBI_EL2_ASID]   = "SMMU_CMD_TLBI_EL2_ASID",
> +    [SMMU_CMD_TLBI_EL2_VA]     = "SMMU_CMD_TLBI_EL2_VA",
> +    [SMMU_CMD_TLBI_EL2_VAA]    = "SMMU_CMD_TLBI_EL2_VAA",
> +    [SMMU_CMD_TLBI_S12_VMALL]  = "SMMU_CMD_TLBI_S12_VMALL",
> +    [SMMU_CMD_TLBI_S2_IPA]     = "SMMU_CMD_TLBI_S2_IPA",
> +    [SMMU_CMD_TLBI_NSNH_ALL]   = "SMMU_CMD_TLBI_NSNH_ALL",
> +    [SMMU_CMD_ATC_INV]         = "SMMU_CMD_ATC_INV",
> +    [SMMU_CMD_PRI_RESP]        = "SMMU_CMD_PRI_RESP",
> +    [SMMU_CMD_RESUME]          = "SMMU_CMD_RESUME",
> +    [SMMU_CMD_STALL_TERM]      = "SMMU_CMD_STALL_TERM",
> +    [SMMU_CMD_SYNC]            = "SMMU_CMD_SYNC",
> +};
> +
> +static inline const char *smmu_cmd_string(SMMUCommandType type)
> +{
> +    return cmd_stringify[type] ? cmd_stringify[type] : "UNKNOWN";
> +}

It looks like you use this function on unsanitized type field
values direct from the guest structure, so you need to handle
the possibility that the 'type' argument is larger than
ARRAY_SIZE(cmd_stringify). (And also the possibility that it's
negative, if you want to be robust about it; that's a little
trickier since an enum might be signed or unsigned and if
unsigned the compiler may warn about comparisons that are
always false. I forget the best approach here.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
