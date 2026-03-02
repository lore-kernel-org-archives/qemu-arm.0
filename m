Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF5EA4E38
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 16:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx5uC-0008Cx-F4; Mon, 02 Mar 2026 11:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx5u7-0008Bl-TN
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 11:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx5u6-0006Js-59
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 11:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772468032;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bX6RVGtztGuoQPbNESg7T1ee2z5glnur/UoVyx5h9s=;
 b=H8ARDL3xFhBbRXk+uZuj2MIFX9X3SRxL4BbZENrSeqyeBpIINrkuvnyqPiqvgIX4F27FyT
 +yVsXvqB0yO4oK/K2rnTDzXCakk5SZnaTGeyRIN4xBtevohcat2IZ8f01fmODHb9U4IR5h
 5+b2AKF3/XNhC66SKf9fYMh9153jtzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-Uw5BBykZMnGWOboBdDYINg-1; Mon, 02 Mar 2026 11:13:51 -0500
X-MC-Unique: Uw5BBykZMnGWOboBdDYINg-1
X-Mimecast-MFC-AGG-ID: Uw5BBykZMnGWOboBdDYINg_1772468030
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4837bfcfe0dso58737765e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 08:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772468030; x=1773072830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bX6RVGtztGuoQPbNESg7T1ee2z5glnur/UoVyx5h9s=;
 b=SmDiGJGz56mekAsr+qVl0TEP9Ixr6Ruqf8/+3bb3HKCxS4UnlVJ7h0B3S4jyzYx8/+
 R9c8rALkidt4TRUgQg+YCN/hxd+xXm8FXqW23jbPPQzK598aUv5g/sO1f+VDIeCbZyvL
 YrI2g49onnelL9HLn06B/ph3Mi5ozlvFCoo+gQw8I2cOG0vmfGj6InubuZXNBGhfbDIT
 HAjDVi/zKU+30eRho74scWrspvMO0UIAYvQKyiQTZt5W6RrjsPpz/0qVW+XVQi4mmjIQ
 EbqN8Fa3cDIBY2YCkEfkpeWXJhvCDKii/uDhybpjom+nlsr4ZF3PtptEELtI7+qsXchN
 GFhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcq6DE3+aHax9lz629ye4+apDV0H/hoUbalumYgCo2pwhYpSkCdY1otmubgGNK0VTF4xdnFkP5RQ==@nongnu.org
X-Gm-Message-State: AOJu0YzhTO2VbQSYPKAIOuvcKUJlASrIOxE8S/Hy41QE/Z5rDT0AtjEh
 tdqElcMcdKxzFavRI4SsiB0tftMat5AVBWcQRNQ00OMqSRxpx1Tprr/r6CYHxq0xPpacOyc9Zcx
 6gy3IYbrsE7K34TzGxvXfsoEQp+KFWgMMP4BPr6zfgWqocKgjKDOwuA==
X-Gm-Gg: ATEYQzwJxeLXBx0Q9DNN1bwIAVi/E3QHnk9ILD8ZEWH5LmK5jMjX/2KZFDhHqM/NMgw
 JBMDpWnmek+ePU8mJXBLTOvOlkcsNwz9u2W4/Yd+86SCBdn4v8ilHQ3DaVE6IWDqCZ/McFo+aDh
 fGwFDqXh6yc1yawz90d5xQGRYPGrLMiWXR2Xx131NsQyLN3jkKpzFrVHk7fpaT5boiR2qxpD7bv
 AreCbj6vjHmuid1+bXgaYYbeFEOCwgfLUKlbflxBziKs8WJsBmtjeUPXqZzyt5ErjYf4TGrTsFT
 khy9SYqgfKvjyYoIL1rN/5Vhv2AFBQ7r7gt9nySljCsxIhrGKmIgybNKLh6viNl6TUClyGUqXwE
 CpJqLfz/E1Mkl6F1R8e23JJfWURNDV8bCivdXSSRtCaYeeaz/FBfX6ebegEO0o9rO49RTVA==
X-Received: by 2002:a05:600c:8711:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-483c9b9701amr259659895e9.2.1772468030001; 
 Mon, 02 Mar 2026 08:13:50 -0800 (PST)
X-Received: by 2002:a05:600c:8711:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-483c9b9701amr259659015e9.2.1772468029481; 
 Mon, 02 Mar 2026 08:13:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbd781sm251974985e9.8.2026.03.02.08.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:13:48 -0800 (PST)
Message-ID: <ab60bb69-e3d9-461d-a353-e5dc2161d644@redhat.com>
Date: Mon, 2 Mar 2026 17:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 06/31] hw/arm/smmuv3: Track SEC_SID in configs and events
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-7-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221100250.2976287-7-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZEtLuAhDKzj3qmU8fDvq1OD21OBynHOdEV1gCXFJWAo_1772468030
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Tao,

On 2/21/26 11:02 AM, Tao Tang wrote:
> Cache the SEC_SID inside SMMUTransCfg to keep configuration lookups
> tied to the correct register bank.
>
> Plumb the SEC_SID through tracepoints and queue helpers so diagnostics
> and event logs always show which security interface emitted the record.
> To support this, the SEC_SID is placed in SMMUEventInfo so the bank is
> identified as soon as an event record is built.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h     |  1 +
>  hw/arm/smmuv3.c              | 20 +++++++++++++-------
>  hw/arm/trace-events          |  2 +-
>  include/hw/arm/smmu-common.h |  1 +
>  4 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 866d62257e3..a1071f7b689 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -274,6 +274,7 @@ static inline const char *smmu_event_string(SMMUEventType type)
>  
>  /*  Encode an event record */
>  typedef struct SMMUEventInfo {
> +    SMMUSecSID sec_sid;
>      SMMUEventType type;
>      uint32_t sid;
>      bool recorded;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2c107724e77..3438adcecd2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -148,9 +148,9 @@ static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
>      return MEMTX_OK;
>  }
>  
> -static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
> +static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
> +                                       Evt *evt)
>  {
> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUQueue *q = &bank->eventq;
>      MemTxResult r;
> @@ -178,7 +178,8 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  {
>      Evt evt = {};
>      MemTxResult r;
> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
> +    SMMUSecSID sec_sid = info->sec_sid;
> +    g_assert(sec_sid < SMMU_SEC_SID_NUM);
>  
>      if (!smmuv3_eventq_enabled(s, sec_sid)) {
>          return;
> @@ -258,8 +259,9 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>          g_assert_not_reached();
>      }
>  
> -    trace_smmuv3_record_event(smmu_event_string(info->type), info->sid);
> -    r = smmuv3_write_eventq(s, &evt);
> +    trace_smmuv3_record_event(sec_sid, smmu_event_string(info->type),
> +                              info->sid);
> +    r = smmuv3_write_eventq(s, sec_sid, &evt);
>      if (r != MEMTX_OK) {
>          smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_EVENTQ_ABT_ERR_MASK);
>      }
> @@ -917,6 +919,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>                              100 * sdev->cfg_cache_hits /
>                              (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
>          cfg = g_new0(SMMUTransCfg, 1);
> +        cfg->sec_sid = SMMU_SEC_SID_NS;
>  
>          if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
>              g_hash_table_insert(bc->configs, sdev, cfg);
> @@ -1074,7 +1077,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUEventInfo event = {.type = SMMU_EVT_NONE,
>                             .sid = sid,
> -                           .inval_ste_allowed = false};
> +                           .inval_ste_allowed = false,
> +                           .sec_sid = sec_sid};
>      SMMUTranslationStatus status;
>      SMMUTransCfg *cfg = NULL;
>      IOMMUTLBEntry entry = {
> @@ -1176,7 +1180,9 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                 uint64_t num_pages, int stage)
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> -    SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> +    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
> +    SMMUEventInfo eventinfo = {.sec_sid = sec_sid,
> +                               .inval_ste_allowed = true};
>      SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
>      IOMMUTLBEvent event;
>      uint8_t granule;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 8135c0c7344..9c2cc131ab4 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -40,7 +40,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>  smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
>  smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> -smmuv3_record_event(const char *type, uint32_t sid) "%s sid=0x%x"
> +smmuv3_record_event(int sec_sid, const char *type, uint32_t sid) "sec_sid=%d %s sid=0x%x"
>  smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "sid=0x%x features:0x%x, sid_split:0x%x"
>  smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_offset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max_l2_ste:%d"
>  smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 6ea40f6b074..ae1489717fe 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -107,6 +107,7 @@ typedef struct SMMUS2Cfg {
>  typedef struct SMMUTransCfg {
>      /* Shared fields between stage-1 and stage-2. */
>      SMMUStage stage;           /* translation stage */
> +    SMMUSecSID sec_sid;        /* cached sec sid */
I am now wondering if sec_sid shall be part of the TransCfg as this is
never decoded from STE/CD, sin't it.

Eric
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */


