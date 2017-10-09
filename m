Received: by 10.223.197.9 with SMTP id q9csp2670381wrf;
        Mon, 9 Oct 2017 10:18:22 -0700 (PDT)
X-Received: by 10.237.32.76 with SMTP id 70mr14081061qta.191.1507569502887;
        Mon, 09 Oct 2017 10:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507569502; cv=none;
        d=google.com; s=arc-20160816;
        b=HrMvpPBuFDa0ISE2JcauDKpC9HkyyX4x4rcJJj2wW8fUPnfl0VRO+0buvViLjJ6XRi
         5zxtFqVaTPvzrBHWA9kKzODrdqmkKgS553RaXqpziOIyzwBnXD7do1GXy36kxndoDC4j
         4H/1FunRP9ULwcH7fwFkUGXJphHrAnpIhnoaaZfYqu2Cn/4NoPC0Tm7qLQiI0FBbCt0l
         oG04hfB6sBQ2Q+bT080XknRAQeZjidrDwm7138SgGe1ZedL1R40zgHXJahhNuZC8A0Su
         njLKtcwstGmUEYpg9rUGcwCeKw76My27ktnVqYCcW8n2zVExEOf81E3b8SXg5M8ExexG
         GKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XywMrvMUhs7xz+GG/htLQm8axpyqvWmNgoqAHVFa7dw=;
        b=SF7KW5qqjK9wKaEa0ZLMBv4OqhhpN/FVEfWOnFuBcZ0FCaEzmXIDSZi8kH9sccZTBP
         jIW/4mq008SG4HZVfYOheQDueIwzZbX1vdwWHkh6Y+ERD4LYxJl9DqfIHxknxBJeIyyF
         RtNJx/M+ZgFV5v2ZZgnbMqe2BZqt13NooND3ynEDiuuqkPdsdUoQGIgv9zwUH4siw0nf
         CCpzoV3EzrzgypQfFftK9MWgxPkeKwA9Lr3g+ipKDHh+1C5iTyGWewuYSDQv0SI244q1
         j43iwnXc67HOhV4lX6XreVfJG7xxUKPOmmgaE9y7hYQK3JttzPanz+fhj+SPheKOi0e4
         26Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiOZG2Et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129si2214755qkc.351.2017.10.09.10.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiOZG2Et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bh8-0006vN-C4
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bgy-0006vG-Uc
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bgx-00006s-53
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:18:12 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:55281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bgw-00006L-Rm
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:18:11 -0400
Received: by mail-wm0-x230.google.com with SMTP id i124so25389101wmf.3
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XywMrvMUhs7xz+GG/htLQm8axpyqvWmNgoqAHVFa7dw=;
	b=ZiOZG2EtQR4FjT3eZqEAmMFmXezo8RqMIs1MM1JjP5Wi65WCOXcvzay+DEMlezot4L
	gqqXpcEpQK6uZH1Y6KFoa2y9RngmX8AeyOSIgUHUWe1FRIEDE3nDlQFOwchCCGTyIRau
	OnaLptwtU2EO/O54140+iU8FHAWVDPC5IjAFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XywMrvMUhs7xz+GG/htLQm8axpyqvWmNgoqAHVFa7dw=;
	b=ent4nYKhANh8aYC3URMvpmHgen5KS2d5XvhlkP0X5ox/zFvdF9dgDaxnS/oLeZBMo6
	JyWdr1Lios6B+mS+zicXugWU2KhR+4grA62Qf8k3A0LH8WxLITTuxGHbDETIHu/puVYx
	AySmBzb7+JrF/U1iyLRQxmcCIOJmyFzFU4mhzkOmrEAinxjv+UKcBE55VAO0TlPQdlLq
	4uXjv4Ykiwy39pCd7lIQ5zjx9M+4JnzG0EpVjphdQjtzGs/GayC5QO2obEtd7AAOwDtP
	NWmjDsmNonC8Xsw1fvVF7wkCnOQPZtYaMxgVM42Ewn+sobsdRx+ZCV062jP0aT3aGhrl
	eSdg==
X-Gm-Message-State: AMCzsaXOPns4DZGwYINZKHmuXAaPsK4a1pSDELX4MHHM3g6Zy70wVtiX
	ZTXZHFs94AxY4RXLD/BrG4RGss8ifWWorMwGTWQqXg==
X-Google-Smtp-Source: AOwi7QAMiz3wwNQqdN3Yh1P0vAuKnpqkyskG1xhT3Rfko6MOi5p6hAGUlQNiFwHyqF4ZZ+BMHi+6fF3702qwiHHIQZ4=
X-Received: by 10.28.113.196 with SMTP id d65mr8035556wmi.151.1507569489512;
	Mon, 09 Oct 2017 10:18:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:17:48 -0700 (PDT)
In-Reply-To: <1504286483-23327-9-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-9-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:17:48 +0100
Message-ID: <CAFEAcA9_WHXEuqp0JPU8SVE6ULJHa3Kdq-38nj2Krf3KA90MQA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH v7 08/20] hw/arm/smmuv3: Implement MMIO write
 operations
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
X-TUID: +Ou28oDG91OE

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> Now we have relevant helpers for queue and irq
> management, let's implement MMIO write operations
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h | 103 +++++++++++++++++++++++-
>  hw/arm/smmuv3.c          | 204 ++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/trace-events      |  15 ++++
>  3 files changed, 317 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d88f141..a5d60b4 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -215,8 +215,6 @@ static inline int smmu_enabled(SMMUV3State *s)
>
>  #define SMMU_CMDQ_ERR(s) (SMMU_PENDING_GERRORS(s) & SMMU_GERROR_CMDQ)
>
> -void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn);
> -
>  /***************************
>   * Queue Handling
>   ***************************/
> @@ -261,7 +259,106 @@ static inline void smmu_write_cmdq_err(SMMUV3State *s, uint32_t err_type)
>                          regval | err_type << SMMU_CMD_CONS_ERR_SHIFT);
>  }
>
> -MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd);
>  void smmuv3_write_evtq(SMMUV3State *s, Evt *evt);
>
> +/*****************************
> + * Commands
> + *****************************/
> +
> +enum {
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
> +};
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
> +/*****************************
> + * CMDQ fields
> + *****************************/
> +
> +typedef enum {
> +    SMMU_CERROR_NONE = 0,
> +    SMMU_CERROR_ILL,
> +    SMMU_CERROR_ABT,
> +    SMMU_CERROR_ATC_INV_SYNC,
> +} SMMUCmdError;
> +
> +enum { /* Command completion notification */
> +    CMD_SYNC_SIG_NONE,
> +    CMD_SYNC_SIG_IRQ,
> +    CMD_SYNC_SIG_SEV,
> +};
> +
> +#define CMD_TYPE(x)  extract32((x)->word[0], 0, 8)
> +#define CMD_SEC(x)   extract32((x)->word[0], 9, 1)
> +#define CMD_SEV(x)   extract32((x)->word[0], 10, 1)
> +#define CMD_AC(x)    extract32((x)->word[0], 12, 1)
> +#define CMD_AB(x)    extract32((x)->word[0], 13, 1)
> +#define CMD_CS(x)    extract32((x)->word[0], 12, 2)
> +#define CMD_SSID(x)  extract32((x)->word[0], 16, 16)
> +#define CMD_SID(x)   ((x)->word[1])
> +#define CMD_VMID(x)  extract32((x)->word[1], 0, 16)
> +#define CMD_ASID(x)  extract32((x)->word[1], 16, 16)
> +#define CMD_STAG(x)  extract32((x)->word[2], 0, 16)
> +#define CMD_RESP(x)  extract32((x)->word[2], 11, 2)
> +#define CMD_GRPID(x) extract32((x)->word[3], 0, 8)
> +#define CMD_SIZE(x)  extract32((x)->word[3], 0, 16)
> +#define CMD_LEAF(x)  extract32((x)->word[3], 0, 1)
> +#define CMD_SPAN(x)  extract32((x)->word[3], 0, 5)
> +#define CMD_ADDR(x) ({                                  \
> +            uint64_t addr = (uint64_t)(x)->word[3];     \
> +            addr <<= 32;                                \
> +            addr |=  extract32((x)->word[3], 12, 20);   \
> +            addr;                                       \
> +        })

This definitely seems to be reimplementing some of the registerfields.h
functionality.

> +
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2f96463..f35fadc 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -72,7 +72,7 @@ static void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
>      }
>  }
>
> -void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
> +static void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
>  {
>      uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
>      uint32_t sanitized;
> @@ -116,7 +116,7 @@ static void smmu_q_write(SMMUQueue *q, void *data)
>      }
>  }
>
> -MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
> +static MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
>  {
>      SMMUQueue *q = &s->cmdq;
>      MemTxResult ret = smmu_q_read(q, cmd);
> @@ -224,6 +224,147 @@ static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
>      *base = val & ~(SMMU_BASE_RA | 0x3fULL);
>  }
>
> +static int smmuv3_cmdq_consume(SMMUV3State *s)
> +{
> +    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
> +
> +    trace_smmuv3_cmdq_consume(SMMU_CMDQ_ERR(s), smmu_cmd_q_enabled(s),
> +                              s->cmdq.prod, s->cmdq.cons,
> +                              s->cmdq.wrap.prod, s->cmdq.wrap.cons);
> +
> +    if (!smmu_cmd_q_enabled(s)) {
> +        return 0;
> +    }
> +
> +    while (!SMMU_CMDQ_ERR(s) && !smmu_is_q_empty(s, &s->cmdq)) {
> +        uint32_t type;
> +        Cmd cmd;
> +
> +        if (smmuv3_read_cmdq(s, &cmd) != MEMTX_OK) {
> +            cmd_error = SMMU_CERROR_ABT;
> +            break;
> +        }
> +
> +        type = CMD_TYPE(&cmd);
> +
> +        trace_smmuv3_cmdq_opcode(cmd_stringify[type]);
> +
> +        switch (CMD_TYPE(&cmd)) {
> +        case SMMU_CMD_SYNC:
> +            if (CMD_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
> +                smmuv3_irq_trigger(s, SMMU_IRQ_CMD_SYNC, 0);
> +            }
> +            break;
> +        case SMMU_CMD_PREFETCH_CONFIG:
> +        case SMMU_CMD_PREFETCH_ADDR:
> +            break;
> +        case SMMU_CMD_CFGI_STE:
> +        {
> +             uint32_t streamid = cmd.word[1];
> +
> +             trace_smmuv3_cmdq_cfgi_ste(streamid);
> +            break;
> +        }
> +        case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
> +        {
> +            uint32_t start = cmd.word[1], range, end;
> +
> +            range = extract32(cmd.word[2], 0, 5);
> +            end = start + (1 << (range + 1)) - 1;
> +            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
> +            break;
> +        }
> +        case SMMU_CMD_CFGI_CD:
> +        case SMMU_CMD_CFGI_CD_ALL:
> +            trace_smmuv3_unhandled_cmd(type);

Do we cache anything that actually needs to be invalidated?

> +            break;
> +        case SMMU_CMD_TLBI_NH_ALL:
> +        case SMMU_CMD_TLBI_NH_ASID:
> +            trace_smmuv3_unhandled_cmd(type);

Ditto.

> +            break;
> +        case SMMU_CMD_TLBI_NH_VA:
> +        {
> +            int asid = extract32(cmd.word[1], 16, 16);
> +            int vmid = extract32(cmd.word[1], 0, 16);
> +            uint64_t low = extract32(cmd.word[2], 12, 20);
> +            uint64_t high = cmd.word[3];
> +            uint64_t addr = high << 32 | (low << 12);
> +
> +            trace_smmuv3_cmdq_tlbi_nh_va(asid, vmid, addr);
> +            break;
> +        }
> +        case SMMU_CMD_TLBI_NH_VAA:
> +        case SMMU_CMD_TLBI_EL3_ALL:
> +        case SMMU_CMD_TLBI_EL3_VA:
> +        case SMMU_CMD_TLBI_EL2_ALL:
> +        case SMMU_CMD_TLBI_EL2_ASID:
> +        case SMMU_CMD_TLBI_EL2_VA:
> +        case SMMU_CMD_TLBI_EL2_VAA:
> +        case SMMU_CMD_TLBI_S12_VMALL:
> +        case SMMU_CMD_TLBI_S2_IPA:
> +        case SMMU_CMD_TLBI_NSNH_ALL:
> +            trace_smmuv3_unhandled_cmd(type);
> +            break;
> +        case SMMU_CMD_ATC_INV:
> +        case SMMU_CMD_PRI_RESP:
> +        case SMMU_CMD_RESUME:
> +        case SMMU_CMD_STALL_TERM:
> +            trace_smmuv3_unhandled_cmd(type);
> +            break;

You could merge these two sets of cases (or maybe the TLBI are
trivial nops?)

> +        default:
> +            cmd_error = SMMU_CERROR_ILL;
> +            error_report("Illegal command type: %d", CMD_TYPE(&cmd));
> +            break;
> +        }
> +    }
> +
> +    if (cmd_error) {
> +        error_report("GERROR_CMDQ: CONS.ERR=%d", cmd_error);
> +        smmu_write_cmdq_err(s, cmd_error);
> +        smmuv3_irq_trigger(s, SMMU_IRQ_GERROR, SMMU_GERROR_CMDQ);
> +    }
> +
> +    trace_smmuv3_cmdq_consume_out(s->cmdq.wrap.prod, s->cmdq.prod,
> +                                  s->cmdq.wrap.cons, s->cmdq.cons);
> +
> +    return 0;


>  {
> +    SMMUState *sys = opaque;
> +    SMMUV3State *s = SMMU_V3_DEV(sys);
> +
> +    smmu_write_mmio_fixup(s, &addr);
> +
> +    trace_smmuv3_write_mmio(addr, val, size);
> +
> +    switch (addr) {
> +    case 0xFDC ... 0xFFC:
> +    case SMMU_REG_IDR0 ... SMMU_REG_IDR5:
> +        trace_smmuv3_write_mmio_idr(addr, val);
> +        return;
> +    case SMMU_REG_GERRORN:
> +        smmuv3_write_gerrorn(s, val);
> +        /*
> +         * By acknowledging the CMDQ_ERR, SW may notify cmds can
> +         * be processed again
> +         */
> +        smmuv3_cmdq_consume(s);
> +        return;
> +    case SMMU_REG_CR0:
> +        smmu_write32_reg(s, SMMU_REG_CR0, val);
> +        /* immediatly reflect the changes in CR0_ACK */
> +        smmu_write32_reg(s, SMMU_REG_CR0_ACK, val);

"immediately"

thanks
-- PMM
