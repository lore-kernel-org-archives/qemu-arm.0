Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5019766wrq;
        Tue, 12 Jun 2018 01:13:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKCLV6xQYx8jhczRdpoBQrqE1FJ8yCXO9zoq7twD+GkD7dFbNdwmt2KpVKxbivr9pggve2d
X-Received: by 2002:a0c:b4a9:: with SMTP id c41-v6mr2404852qve.57.1528791234014;
        Tue, 12 Jun 2018 01:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528791234; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd122PFb9EGTx8vpy/dX6IQr2kmevXX9Iqo9s9/tol3SARuLAGQS/OJ9SIb5/+P5X3
         INbfrd02edrgEaXYGXKzXxDF3mPPbrP5Hqt86wtec3N0rSk07/2zi/p750VtZYJIdZf8
         qm9pb5+eamteylWyUUy1uEB/HlCKhJRyO5je1O/qY3chfWG/Jy/lE8s/YlFNjp4+iLLL
         WfL3qVVYmfxewQFowQa7mmS0SmPxZM3lFbcOEwswsSZtQOZO6ptQkct55jd8NgUvaVQF
         hkvEo0UO/kHHYyU487wPnTJKQtrt4zzI4YwdWEWlxCBSqwhz3kzwBAh7FXmIbagSBM5U
         cbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=qR1Dw4C8ITWonSXTlpbScI0vEb7VUXuWPct7QHS9kuU=;
        b=lleJSz4vVOSCKVpRpDzpFtY6UCi24r7BV6jIqVW4c2tN1zmLiAnUoiInFeFVgmcMqJ
         Qbr3khmBjhh2XP20CE7+DyPuwfL+/1TV0u29oHpVWLZwddNko317H6IdRP+I/pn3wnXP
         mg3CFFtwXPsmzwTRqLjjwJHW6+tTe0iN1zfcysTlRivGNQTDiNAXmwdVTaCIhujlegK+
         94tPc28hNfP0cegk2vmmRxzmsPfqkmXx1p1dlWeFox9A1CkXKC9Wj04L8uwllbQGoShE
         jK/6x3LQAAsqt3StFGSnv22iI4ceTCr5X66TePd2frt7Y9b1OKvSRkWSoQd0u1kktX3d
         APDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b129-v6si303928qkd.191.2018.06.12.01.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 01:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSeR7-0002fc-F0
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 04:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeQW-0002cL-4w
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 04:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeQU-0005ax-9Q
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 04:13:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43432 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fSeQO-0005YV-0Q; Tue, 12 Jun 2018 04:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BF2E68817;
	Tue, 12 Jun 2018 08:13:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8971C671;
	Tue, 12 Jun 2018 08:13:06 +0000 (UTC)
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, jia.he@hxt-semitech.com, hejianet@gmail.com
References: <1528441031-6518-1-git-send-email-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bc273622-1b20-7ad5-7436-ec39f32ba10e@redhat.com>
Date: Tue, 12 Jun 2018 10:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1528441031-6518-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 08:13:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 08:13:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH] hw/arm/smmuv3: Fix translate error handling
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8eczmsIkNGrW

Hi,

On 06/08/2018 08:57 AM, Eric Auger wrote:
> From: Jia He <hejianet@gmail.com>
> 
> In case the STE's config is "Bypass" we currently don't set the
> IOMMUTLBEntry perm flags and the access does not succeed. Also
> if the config is 0b0xx (Aborted/Reserved), decode_ste and
> smmuv3_decode_config currently returns -EINVAL and we don't enter
> the expected code path: we record an event whereas we should not.
> 
> This patch fixes those bugs and simplifies the error handling.
> decode_ste and smmuv3_decode_config now return 0 if aborted or
> bypassed config was found. Only bad config info produces negative
> error values. In smmuv3_translate we more clearly differentiate
> errors, bypass/smmu disabled, aborted and success cases. Also
> trace points are differentiated.
> 
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Reported-by: jia.he@hxt-semitech.com
> Signed-off-by: jia.he@hxt-semitech.com
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I resent this patch in
[PATCH v2 0/4] ARM SMMUv3: IOTLB Emulation and VHOST Support
with a fix regarding the addr_mask which was not properly set in case of
bypass and smmu disabled mode.

This bug was not visible without vhost integration. Even with vhost, it
was not observed before
a411c84b561baa94b28165c52f21c33517ee8f59 ("exec: extract
address_space_translate_iommu, fix page_mask corner case") which fixed
the addr_mask.

So please don't review that version, but look at the v2 instead in the
above series.

Thanks

Eric
> ---
>  hw/arm/smmuv3-internal.h | 12 +++++--
>  hw/arm/smmuv3.c          | 93 ++++++++++++++++++++++++++++++++----------------
>  hw/arm/trace-events      |  7 ++--
>  3 files changed, 77 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index a9d714b..bab25d6 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -23,6 +23,14 @@
>  
>  #include "hw/arm/smmu-common.h"
>  
> +typedef enum SMMUTranslationStatus {
> +    SMMU_TRANS_DISABLE,
> +    SMMU_TRANS_ABORT,
> +    SMMU_TRANS_BYPASS,
> +    SMMU_TRANS_ERROR,
> +    SMMU_TRANS_SUCCESS,
> +} SMMUTranslationStatus;
> +
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)
> @@ -315,7 +323,7 @@ enum { /* Command completion notification */
>  /* Events */
>  
>  typedef enum SMMUEventType {
> -    SMMU_EVT_OK                 = 0x00,
> +    SMMU_EVT_NONE               = 0x00,
>      SMMU_EVT_F_UUT                    ,
>      SMMU_EVT_C_BAD_STREAMID           ,
>      SMMU_EVT_F_STE_FETCH              ,
> @@ -337,7 +345,7 @@ typedef enum SMMUEventType {
>  } SMMUEventType;
>  
>  static const char *event_stringify[] = {
> -    [SMMU_EVT_OK]                       = "SMMU_EVT_OK",
> +    [SMMU_EVT_NONE]                     = "no recorded event",
>      [SMMU_EVT_F_UUT]                    = "SMMU_EVT_F_UUT",
>      [SMMU_EVT_C_BAD_STREAMID]           = "SMMU_EVT_C_BAD_STREAMID",
>      [SMMU_EVT_F_STE_FETCH]              = "SMMU_EVT_F_STE_FETCH",
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b3026de..c5e7a7c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -154,7 +154,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>      EVT_SET_SID(&evt, info->sid);
>  
>      switch (info->type) {
> -    case SMMU_EVT_OK:
> +    case SMMU_EVT_NONE:
>          return;
>      case SMMU_EVT_F_UUT:
>          EVT_SET_SSID(&evt, info->u.f_uut.ssid);
> @@ -312,12 +312,11 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> -/* Returns <0 if the caller has no need to continue the translation */
> +/* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> -    int ret = -EINVAL;
>  
>      if (!STE_VALID(ste)) {
>          goto bad_ste;
> @@ -326,13 +325,13 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>      config = STE_CONFIG(ste);
>  
>      if (STE_CFG_ABORT(config)) {
> -        cfg->aborted = true; /* abort but don't record any event */
> -        return ret;
> +        cfg->aborted = true;
> +        return 0;
>      }
>  
>      if (STE_CFG_BYPASS(config)) {
>          cfg->bypassed = true;
> -        return ret;
> +        return 0;
>      }
>  
>      if (STE_CFG_S2_ENABLED(config)) {
> @@ -509,7 +508,7 @@ bad_cd:
>   *       the different configuration decoding steps
>   * @event: must be zero'ed by the caller
>   *
> - * return < 0 if the translation needs to be aborted (@event is filled
> + * return < 0 in case of config decoding error (@event is filled
>   * accordingly). Return 0 otherwise.
>   */
>  static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
> @@ -518,19 +517,26 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      uint32_t sid = smmu_get_sid(sdev);
>      SMMUv3State *s = sdev->smmu;
> -    int ret = -EINVAL;
> +    int ret;
>      STE ste;
>      CD cd;
>  
> -    if (smmu_find_ste(s, sid, &ste, event)) {
> +    ret = smmu_find_ste(s, sid, &ste, event);
> +    if (ret) {
>          return ret;
>      }
>  
> -    if (decode_ste(s, cfg, &ste, event)) {
> +    ret = decode_ste(s, cfg, &ste, event);
> +    if (ret) {
>          return ret;
>      }
>  
> -    if (smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event)) {
> +    if (cfg->aborted || cfg->bypassed) {
> +        return 0;
> +    }
> +
> +    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
> +    if (ret) {
>          return ret;
>      }
>  
> @@ -543,8 +549,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      SMMUv3State *s = sdev->smmu;
>      uint32_t sid = smmu_get_sid(sdev);
> -    SMMUEventInfo event = {.type = SMMU_EVT_OK, .sid = sid};
> +    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid};
>      SMMUPTWEventInfo ptw_info = {};
> +    SMMUTranslationStatus status;
>      SMMUTransCfg cfg = {};
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
> @@ -553,23 +560,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          .addr_mask = ~(hwaddr)0,
>          .perm = IOMMU_NONE,
>      };
> -    int ret = 0;
>  
>      if (!smmu_enabled(s)) {
> -        goto out;
> +        status = SMMU_TRANS_DISABLE;
> +        goto epilogue;
>      }
>  
> -    ret = smmuv3_decode_config(mr, &cfg, &event);
> -    if (ret) {
> -        goto out;
> +    if (smmuv3_decode_config(mr, &cfg, &event)) {
> +        status = SMMU_TRANS_ERROR;
> +        goto epilogue;
>      }
>  
>      if (cfg.aborted) {
> -        goto out;
> +        status = SMMU_TRANS_ABORT;
> +        goto epilogue;
>      }
>  
> -    ret = smmu_ptw(&cfg, addr, flag, &entry, &ptw_info);
> -    if (ret) {
> +    if (cfg.bypassed) {
> +        status = SMMU_TRANS_BYPASS;
> +        goto epilogue;
> +    }
> +
> +    if (smmu_ptw(&cfg, addr, flag, &entry, &ptw_info)) {
>          switch (ptw_info.type) {
>          case SMMU_PTW_ERR_WALK_EABT:
>              event.type = SMMU_EVT_F_WALK_EABT;
> @@ -609,18 +621,39 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          default:
>              g_assert_not_reached();
>          }
> +        status = SMMU_TRANS_ERROR;
> +    } else {
> +        status = SMMU_TRANS_SUCCESS;
>      }
> -out:
> -    if (ret) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s translation failed for iova=0x%"PRIx64"(%d)\n",
> -                      mr->parent_obj.name, addr, ret);
> -        entry.perm = IOMMU_NONE;
> -        smmuv3_record_event(s, &event);
> -    } else if (!cfg.aborted) {
> +
> +epilogue:
> +    switch (status) {
> +    case SMMU_TRANS_SUCCESS:
>          entry.perm = flag;
> -        trace_smmuv3_translate(mr->parent_obj.name, sid, addr,
> -                               entry.translated_addr, entry.perm);
> +        trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
> +                                       entry.translated_addr, entry.perm);
> +        break;
> +    case SMMU_TRANS_DISABLE:
> +        entry.perm = flag;
> +        trace_smmuv3_translate_disable(mr->parent_obj.name, sid, addr,
> +                                      entry.perm);
> +        break;
> +    case SMMU_TRANS_BYPASS:
> +        entry.perm = flag;
> +        trace_smmuv3_translate_bypass(mr->parent_obj.name, sid, addr,
> +                                      entry.perm);
> +        break;
> +    case SMMU_TRANS_ABORT:
> +        /* no event is recorded on abort */
> +        trace_smmuv3_translate_abort(mr->parent_obj.name, sid, addr,
> +                                     entry.perm);
> +        break;
> +    case SMMU_TRANS_ERROR:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
> +                      mr->parent_obj.name, addr, smmu_event_string(event.type));
> +        smmuv3_record_event(s, &event);
> +        break;
>      }
>  
>      return entry;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 2d92727..0ab66bb 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -33,9 +33,10 @@ smmuv3_record_event(const char *type, uint32_t sid) "%s sid=%d"
>  smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "SID:0x%x features:0x%x, sid_split:0x%x"
>  smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_offset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max_l2_ste:%d"
>  smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
> -smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d bypass iova:0x%"PRIx64" is_write=%d"
> -smmuv3_translate_in(uint16_t sid, int pci_bus_num, uint64_t strtab_base) "SID:0x%x bus:%d strtab_base:0x%"PRIx64
> +smmuv3_translate_disable(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d bypass (smmu disabled) iova:0x%"PRIx64" is_write=%d"
> +smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d STE bypass iova:0x%"PRIx64" is_write=%d"
> +smmuv3_translate_abort(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=%d abort on iova:0x%"PRIx64" is_write=%d"
> +smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
>  smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
> -smmuv3_translate(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
>  smmuv3_decode_cd(uint32_t oas) "oas=%d"
>  smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
> 
