Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp927306wrq;
        Wed, 20 Jun 2018 08:57:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL6eOrjYUfJi/9y+2w+dxTo6mGm+9WThaw5SGWXX89MDdf/KLb1fXVUzEvvh0l37J/Z55+X
X-Received: by 2002:aed:24fa:: with SMTP id u55-v6mr18589882qtc.400.1529510232296;
        Wed, 20 Jun 2018 08:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529510232; cv=none;
        d=google.com; s=arc-20160816;
        b=uYS7qyDdCUXVWCPmzIUZeTzUGgcB0DEdHr/BoVVwKx1p11ykFugIkxq8t4X2A1ycTg
         gXbNzqiFr8kEm7w31VMNgnAjf6uDc9MsGaa9zjEt1b+I8M5kwVUyh+CJPlwj1xht/eVR
         jWxUsomKQJeKTgmuANYSH/M41QQm7vLVFY4Prv9ssatBIdqNn2W6tfk95HVlWsZgEpXg
         FSgINotnCK/z3d6b+6arwZVm5a+jJxwKGmfxe1YQyEMLyyK8ukYu+owIRNVO4wtxYpVf
         AIaRPPsTnnvhNfoc75rinBHSkNoCVyz1KLTSmTsW9lCP0y96JOO8Tkh+M/bIQ5zeDq9P
         ZNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=E/9icqjo52eZbQe5RPq5XmxZ5NrI7hfMDNsweR945vo=;
        b=PD82bIIAxwO50JM8pfJzwpA03f4YVq44C9LFtzD3YMr//rIz8JKJAdVioMqqMg7oRg
         gLDRYS/Wb1v5iyQFD3Frru3MpsbIiRK5PXRbC8b2Y9GxFua5HOL6AEsBv94TAifhJqv5
         +oKPIBPS0tMdaaaHDVrfGw0e3je9LDFNhHgabnQ7nXA9osVbvU0jtQdVxoDpQtDMTJyJ
         kzZJkyivrc66aTshnsTog3DDCv8GDGDgGctiNi2YQK8DG3trKbrL+jC6PiuLBOESXt/7
         hNs6vaerGsjlTLZFPPo0VPaknkxhJR5q1djyzKMN02mGxYWSpLXqamTrJ5BZAgpgl14U
         YaEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jKK0QYtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r123-v6si1087721qkd.135.2018.06.20.08.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 08:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jKK0QYtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfTr-0004eN-OK
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 11:57:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfTg-0004dM-8E
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfTe-0000a4-4w
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:57:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfTd-0000Yh-So
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:56:58 -0400
Received: by mail-ot0-x244.google.com with SMTP id 92-v6so52241otw.9
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E/9icqjo52eZbQe5RPq5XmxZ5NrI7hfMDNsweR945vo=;
	b=jKK0QYtkAoF87iqYVbpKGny6RpV///7CoBNcVKn6bZBVvtLG11f6qWavAD7BavHxDr
	AUzNnVofXTkpVZOkjm1iwAcxATV8v0aIc9oMmQUsz3CAdm7P8K+5UShwE7YOCICimrrL
	FCfdqWS5sFnGzRNVlZzQtfbbJyLJ+HmjWVvyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E/9icqjo52eZbQe5RPq5XmxZ5NrI7hfMDNsweR945vo=;
	b=ts/W1QeFEBzPvjB6TQ/qLzVWQHMr9O3hE4Sjrg3/OcW12p+hmPD/7vD/+HJ3i9nyNX
	A+htT1FgpoltpGWJOnAdJFPakUKXhzubBbeZp+xGgV+alvBySmbcmFDKYNUAKDeNMF65
	lFx1R7eTVLGajeFlSdG3Nz+QkbE2kk6mXkBMwCsCQV6Wao/b4oS+1wbYIVqjnRPCLg0k
	XvDPhLD8+HnVMwdxz5WpUlogRtpxunWv/4Tnsu1Zss61rk7/mV18n+xC5f/tWXJIqidm
	KIO0QvuuHUD0Zz0qCUb5qroa9/y0gZ9TpCQCw6sLOYjdBwfHn7t1FRozCxt5IGk4o/YO
	n1Vg==
X-Gm-Message-State: APt69E2mcYXQijKNxmxQcy6PeVtRNarSm2BDrJriAYL0w/7VEOWoOIU6
	htWqo2vNQSn/6PM6au6EszCsSpFWyaRfZKlFFLBeMA==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr12560438otb.258.1529510216739; 
	Wed, 20 Jun 2018 08:56:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 08:56:36
	-0700 (PDT)
In-Reply-To: <1528790908-23441-3-git-send-email-eric.auger@redhat.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 16:56:36 +0100
Message-ID: <CAFEAcA_rgm7KX+Tm+TkgoKEfAV0f-vAeoQ5dv_jBzfA47kAWNw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 2/4] hw/arm/smmuv3: Cache/invalidate
 config data
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xe++OyOw3ZyE

On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
> Let's cache config data to avoid fetching and parsing STE/CD
> structures on each translation. We invalidate them on data structure
> invalidation commands.
>
> We put in place a per-smmu mutex to protect the config cache. This
> will be useful too to protect the IOTLB cache. The caches can be
> accessed without BQL, ie. in IO dataplane. The same kind of mutex was
> put in place in the intel viommu.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - restore mutex
>
> v1:
> - only insert the new config if decode_cfg succeeds
> - use smmu_get_sid for trace_* and store hits/misses in the SMMUDevice
> - s/smmuv3_put_config/smmuv3_flush_config
> - document smmuv3_get_config
> - removing the mutex as BQL does the job
> ---
>  hw/arm/smmu-common.c         |  24 +++++++-
>  hw/arm/smmuv3.c              | 135 +++++++++++++++++++++++++++++++++++++++++--
>  hw/arm/trace-events          |   6 ++
>  include/hw/arm/smmu-common.h |   5 ++
>  include/hw/arm/smmuv3.h      |   1 +
>  5 files changed, 164 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 01c7be8..264e096 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -310,6 +310,24 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>      return &sdev->as;
>  }
>
> +IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
> +{
> +    uint8_t bus_n, devfn;
> +    SMMUPciBus *smmu_bus;
> +    SMMUDevice *smmu;
> +
> +    bus_n = PCI_BUS_NUM(sid);
> +    smmu_bus = smmu_find_smmu_pcibus(s, bus_n);
> +    if (smmu_bus) {
> +        devfn = sid & 0x7;
> +        smmu = smmu_bus->pbdev[devfn];
> +        if (smmu) {
> +            return &smmu->iommu;
> +        }
> +    }
> +    return NULL;
> +}
> +
>  static void smmu_base_realize(DeviceState *dev, Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
> @@ -321,7 +339,7 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> -
> +    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>
>      if (s->primary_bus) {
> @@ -333,7 +351,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>
>  static void smmu_base_reset(DeviceState *dev)
>  {
> -    /* will be filled later on */
> +    SMMUState *s = ARM_SMMU(dev);
> +
> +    g_hash_table_remove_all(s->configs);
>  }
>
>  static Property smmu_dev_properties[] = {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4e7833b..4c41f51 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -544,6 +544,58 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>      return decode_cd(cfg, &cd, event);
>  }
>
> +/**
> + * smmuv3_get_config - Look up for a cached copy of configuration data for
> + * @sdev and on cache miss performs a configuration structure decoding from
> + * guest RAM.
> + *
> + * @sdev: SMMUDevice handle
> + * @event: output event info
> + *
> + * The configuration cache contains data resulting from both STE and CD
> + * decoding under the form of an SMMUTransCfg struct. The hash table is indexed
> + * by the SMMUDevice handle.
> + */
> +static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
> +{
> +    SMMUv3State *s = sdev->smmu;
> +    SMMUState *bc = &s->smmu_state;
> +    SMMUTransCfg *cfg;
> +
> +    cfg = g_hash_table_lookup(bc->configs, sdev);
> +    if (cfg) {
> +        sdev->cfg_cache_hits += 1;

Increments are more usually written "++".

> +        trace_smmuv3_config_cache_hit(smmu_get_sid(sdev),
> +                            sdev->cfg_cache_hits, sdev->cfg_cache_misses,
> +                            100 * sdev->cfg_cache_hits /
> +                            (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
> +    } else {
> +        sdev->cfg_cache_misses += 1;

Ditto.

> +        trace_smmuv3_config_cache_miss(smmu_get_sid(sdev),
> +                            sdev->cfg_cache_hits, sdev->cfg_cache_misses,
> +                            100 * sdev->cfg_cache_hits /
> +                            (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
> +        cfg = g_new0(SMMUTransCfg, 1);
> +
> +        if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
> +            g_hash_table_insert(bc->configs, sdev, cfg);
> +        } else {
> +            g_free(cfg);
> +            cfg = NULL;
> +        }
> +    }
> +    return cfg;
> +}
> +
> +static void smmuv3_flush_config(SMMUDevice *sdev)
> +{
> +    SMMUv3State *s = sdev->smmu;
> +    SMMUState *bc = &s->smmu_state;
> +
> +    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
> +    g_hash_table_remove(bc->configs, sdev);
> +}
> +
>  static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                        IOMMUAccessFlags flag)
>  {
> @@ -553,7 +605,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid};
>      SMMUPTWEventInfo ptw_info = {};
>      SMMUTranslationStatus status;
> -    SMMUTransCfg cfg = {};
> +    SMMUTransCfg *cfg = NULL;
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
> @@ -562,27 +614,30 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          .perm = IOMMU_NONE,
>      };
>
> +    qemu_mutex_lock(&s->mutex);
> +
>      if (!smmu_enabled(s)) {
>          status = SMMU_TRANS_DISABLE;
>          goto epilogue;
>      }
>
> -    if (smmuv3_decode_config(mr, &cfg, &event)) {
> +    cfg = smmuv3_get_config(sdev, &event);
> +    if (!cfg) {
>          status = SMMU_TRANS_ERROR;
>          goto epilogue;
>      }
>
> -    if (cfg.aborted) {
> +    if (cfg->aborted) {
>          status = SMMU_TRANS_ABORT;
>          goto epilogue;
>      }
>
> -    if (cfg.bypassed) {
> +    if (cfg->bypassed) {
>          status = SMMU_TRANS_BYPASS;
>          goto epilogue;
>      }
>
> -    if (smmu_ptw(&cfg, addr, flag, &entry, &ptw_info)) {
> +    if (smmu_ptw(cfg, addr, flag, &entry, &ptw_info)) {
>          switch (ptw_info.type) {
>          case SMMU_PTW_ERR_WALK_EABT:
>              event.type = SMMU_EVT_F_WALK_EABT;
> @@ -628,6 +683,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      }
>
>  epilogue:
> +    qemu_mutex_unlock(&s->mutex);
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = flag;
> @@ -664,6 +720,7 @@ epilogue:
>
>  static int smmuv3_cmdq_consume(SMMUv3State *s)
>  {
> +    SMMUState *bs = ARM_SMMU(s);
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>      SMMUQueue *q = &s->cmdq;
>      SMMUCommandType type = 0;
> @@ -698,6 +755,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>
>          trace_smmuv3_cmdq_opcode(smmu_cmd_string(type));
>
> +        qemu_mutex_lock(&s->mutex);
>          switch (type) {
>          case SMMU_CMD_SYNC:
>              if (CMD_SYNC_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
> @@ -706,10 +764,74 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              break;
>          case SMMU_CMD_PREFETCH_CONFIG:
>          case SMMU_CMD_PREFETCH_ADDR:
> +            break;
>          case SMMU_CMD_CFGI_STE:
> +        {
> +            uint32_t sid = CMD_SID(&cmd);
> +            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
> +            SMMUDevice *sdev;
> +
> +            if (CMD_SSEC(&cmd)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
> +            if (!mr) {
> +                break;
> +            }
> +
> +            trace_smmuv3_cmdq_cfgi_ste(sid);
> +            sdev = container_of(mr, SMMUDevice, iommu);
> +            smmuv3_flush_config(sdev);
> +
> +            break;
> +        }
>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */

Comment says these two commands are the same, but their implementation
is different?

> +        {
> +            uint32_t start = CMD_SID(&cmd), end, i;
> +            uint8_t range = CMD_STE_RANGE(&cmd);
> +
> +            if (CMD_SSEC(&cmd)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
> +            end = start + (1 << (range + 1)) - 1;
> +            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
> +
> +            for (i = start; i <= end; i++) {
> +                IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, i);
> +                SMMUDevice *sdev;
> +
> +                if (!mr) {
> +                    continue;
> +                }
> +                sdev = container_of(mr, SMMUDevice, iommu);
> +                smmuv3_flush_config(sdev);
> +            }
> +            break;
> +        }
>          case SMMU_CMD_CFGI_CD:
>          case SMMU_CMD_CFGI_CD_ALL:
> +        {
> +            uint32_t sid = CMD_SID(&cmd);
> +            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
> +            SMMUDevice *sdev;
> +
> +            if (CMD_SSEC(&cmd)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
> +            if (!mr) {
> +                break;
> +            }
> +
> +            trace_smmuv3_cmdq_cfgi_cd(sid);
> +            sdev = container_of(mr, SMMUDevice, iommu);
> +            smmuv3_flush_config(sdev);
> +            break;
> +        }
>          case SMMU_CMD_TLBI_NH_ALL:
>          case SMMU_CMD_TLBI_NH_ASID:
>          case SMMU_CMD_TLBI_NH_VA:
> @@ -735,6 +857,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>                            "Illegal command type: %d\n", CMD_TYPE(&cmd));
>              break;
>          }
> +        qemu_mutex_unlock(&s->mutex);
>          if (cmd_error) {
>              break;
>          }
> @@ -1114,6 +1237,8 @@ static void smmu_realize(DeviceState *d, Error **errp)
>          return;
>      }
>
> +    qemu_mutex_init(&s->mutex);
> +
>      memory_region_init_io(&sys->iomem, OBJECT(s),
>                            &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
>
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 0ab66bb..5bddfeb 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -40,3 +40,9 @@ smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t tr
>  smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
>  smmuv3_decode_cd(uint32_t oas) "oas=%d"
>  smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
> +smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
> +smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
> +smmuv3_cmdq_cfgi_cd(uint32_t sid) "     |_ streamid = %d"

What are the underscores in the trace strings for ?

> +smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
> +smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"

Does our tracing infrastructure really support floats? There
is no other use of it in the tree. There is one instance of
'double', though, so maybe we do.

In general I think we should prefer 'double' over 'float' anyway,
though.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
