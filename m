Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09EE67A8F
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 07:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxK92-0002ST-10; Tue, 03 Mar 2026 02:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxK90-0002S1-AN
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:26:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxK8y-0002Z6-Fc
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772522771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAotZgq8kUYS63eBht0WFqtOWiOtkdXwT12b4eKQIhE=;
 b=BTsUQsUlmN3+6DBeZkeNodFPsv9iNInYHGCSbtNQNu5VASgin8K5W0wez6eWaorP04Iuo5
 cT76T4jxC6MBJ2d2+S+oiEVVTZHuz+UpQiQQDGCW/YEe3wY1NQNp1DKY/vM2CiR4Jp8Hg0
 9+mFBdVcemftrORuyBZsfKP/wrfJLwk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-9eUzXMWCP36OPi8yJwgA8Q-1; Tue, 03 Mar 2026 02:26:09 -0500
X-MC-Unique: 9eUzXMWCP36OPi8yJwgA8Q-1
X-Mimecast-MFC-AGG-ID: 9eUzXMWCP36OPi8yJwgA8Q_1772522768
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48372facfedso45385275e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 23:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772522768; x=1773127568;
 h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAotZgq8kUYS63eBht0WFqtOWiOtkdXwT12b4eKQIhE=;
 b=SeILv82rLozY+jJfLv1FEppC7d8D2U/RO2sPNLGhcb7Yw0D8OnF9vZvytLYpZLbYDe
 M8OsImnlWD1Xy6n27IKF8noH3yOqAOMrOuDuqZcc36yY00fwY8a4r3OywyhdDJH0gi8h
 R6rOQD8F/H5urIrRkIr7Ilayg3VTU3Wav7v9qy4C4YTTEywPZ06MxyAqhdaFVX+XOwF0
 D5PVVhkk0L8uhv/E9xdcSC1ZtNshJ5Q0T7OYEp6IoaRymVNdjqVqihNcTioUQfjbclVM
 YxWJO4A4lvM+Z9pamKB4aNWwHO04fQ8OWKYCFQFtx0ZIZ/LH7FAxGDkitHTOigJ6UiIH
 K8BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyjdzQbbQs7gnu+jCYjbkW1VUPZtvRUe1mQ/46g046qEs1f/1J7yPJ6ENeqGh8H4/f0gUsifl1mg==@nongnu.org
X-Gm-Message-State: AOJu0YwaUrpiTFxPc+ZuU35yCViFqUpT7T/ecQEPh42mcrNvrYVeQaUS
 YHP3VbjVCkemdbiBmsvdjvJ5Kt+GG5jiWpy9uEM362tLh+hxAAKpUJ6sQRzgq6xvU4YQtKlAx16
 ywlYHlZ04JnjYLohDxpEjW1N21JJFCO6YMwP8DXwkmy9AfLO5EVE3Lw==
X-Gm-Gg: ATEYQzwzxZXmkVfnWnx2QHumDWArKB8remnIzIQeZTKVBpllRH7EMqdmy+oIDu2/Rjz
 wDoT+8uyvfo72uVf5k8qxVR9nb8c16P8EKGcIH4P7SxYlVO1DPqWHCvuyHar53OPWzxpoGcuvTc
 +UW4HVTo4tVsJ8lQyLu5lhYaEFcdes/6xDchQ3Im4XkyN2/DTs+5tfB4BVfVpA2WSevfpDSrSmK
 RiwnKrOOtQbqTP9TXyk2JA3lPU2KlMDyXWGVLKb+SbPZFLslUQUDySLrW19dCJGhVToth0DJqKe
 K7Wif0FLpqlpzyURgn0l608v8cN0ualvKShbW8PJOtQx0Cf/wTQ72+OZx5Dh3L6wcSL2Q+NPatA
 Z4kJ1WV3w9aPUvFrM4lPUQNd4PiX8bTpvjuJll6nijIXZ/9Iw/HllK7XqjW6ShTy4kET3VA==
X-Received: by 2002:a05:600c:444f:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-48513a56293mr16451975e9.4.1772522768354; 
 Mon, 02 Mar 2026 23:26:08 -0800 (PST)
X-Received: by 2002:a05:600c:444f:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-48513a56293mr16451565e9.4.1772522767835; 
 Mon, 02 Mar 2026 23:26:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135b5db1sm8800075e9.20.2026.03.02.23.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 23:26:07 -0800 (PST)
Message-ID: <436d5125-1118-48ba-a935-a7879daadd25@redhat.com>
Date: Tue, 3 Mar 2026 08:26:05 +0100
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
 <ab60bb69-e3d9-461d-a353-e5dc2161d644@redhat.com>
In-Reply-To: <ab60bb69-e3d9-461d-a353-e5dc2161d644@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BKP74N4sUpLAzW-xfht7PEUL48KzzyQpWi4NPydt0i8_1772522768
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
Reply-to:  eric.auger@redhat.com
X-ACL-Warn: ,  Eric Auger <eric.auger@redhat.com>
From:  Eric Auger via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/2/26 5:13 PM, Eric Auger wrote:
> Hi Tao,
> 
> On 2/21/26 11:02 AM, Tao Tang wrote:
>> Cache the SEC_SID inside SMMUTransCfg to keep configuration lookups
>> tied to the correct register bank.
>>
>> Plumb the SEC_SID through tracepoints and queue helpers so diagnostics
>> and event logs always show which security interface emitted the record.
>> To support this, the SEC_SID is placed in SMMUEventInfo so the bank is
>> identified as soon as an event record is built.
>>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3-internal.h     |  1 +
>>  hw/arm/smmuv3.c              | 20 +++++++++++++-------
>>  hw/arm/trace-events          |  2 +-
>>  include/hw/arm/smmu-common.h |  1 +
>>  4 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index 866d62257e3..a1071f7b689 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -274,6 +274,7 @@ static inline const char *smmu_event_string(SMMUEventType type)
>>  
>>  /*  Encode an event record */
>>  typedef struct SMMUEventInfo {
>> +    SMMUSecSID sec_sid;
>>      SMMUEventType type;
>>      uint32_t sid;
>>      bool recorded;
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 2c107724e77..3438adcecd2 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -148,9 +148,9 @@ static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
>>      return MEMTX_OK;
>>  }
>>  
>> -static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
>> +static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
>> +                                       Evt *evt)
>>  {
>> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>>      SMMUQueue *q = &bank->eventq;
>>      MemTxResult r;
>> @@ -178,7 +178,8 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>>  {
>>      Evt evt = {};
>>      MemTxResult r;
>> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>> +    SMMUSecSID sec_sid = info->sec_sid;
>> +    g_assert(sec_sid < SMMU_SEC_SID_NUM);
>>  
>>      if (!smmuv3_eventq_enabled(s, sec_sid)) {
>>          return;
>> @@ -258,8 +259,9 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>>          g_assert_not_reached();
>>      }
>>  
>> -    trace_smmuv3_record_event(smmu_event_string(info->type), info->sid);
>> -    r = smmuv3_write_eventq(s, &evt);
>> +    trace_smmuv3_record_event(sec_sid, smmu_event_string(info->type),
>> +                              info->sid);
>> +    r = smmuv3_write_eventq(s, sec_sid, &evt);
>>      if (r != MEMTX_OK) {
>>          smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_EVENTQ_ABT_ERR_MASK);
>>      }
>> @@ -917,6 +919,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>>                              100 * sdev->cfg_cache_hits /
>>                              (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
>>          cfg = g_new0(SMMUTransCfg, 1);
>> +        cfg->sec_sid = SMMU_SEC_SID_NS;
>>  
>>          if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
>>              g_hash_table_insert(bc->configs, sdev, cfg);
>> @@ -1074,7 +1077,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>>      SMMUEventInfo event = {.type = SMMU_EVT_NONE,
>>                             .sid = sid,
>> -                           .inval_ste_allowed = false};
>> +                           .inval_ste_allowed = false,
>> +                           .sec_sid = sec_sid};
>>      SMMUTranslationStatus status;
>>      SMMUTransCfg *cfg = NULL;
>>      IOMMUTLBEntry entry = {
>> @@ -1176,7 +1180,9 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>                                 uint64_t num_pages, int stage)
>>  {
>>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>> -    SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
>> +    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>> +    SMMUEventInfo eventinfo = {.sec_sid = sec_sid,
>> +                               .inval_ste_allowed = true};
>>      SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
>>      IOMMUTLBEvent event;
>>      uint8_t granule;
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 8135c0c7344..9c2cc131ab4 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -40,7 +40,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>>  smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
>>  smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
>> -smmuv3_record_event(const char *type, uint32_t sid) "%s sid=0x%x"
>> +smmuv3_record_event(int sec_sid, const char *type, uint32_t sid) "sec_sid=%d %s sid=0x%x"
>>  smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "sid=0x%x features:0x%x, sid_split:0x%x"
>>  smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_offset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max_l2_ste:%d"
>>  smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 6ea40f6b074..ae1489717fe 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -107,6 +107,7 @@ typedef struct SMMUS2Cfg {
>>  typedef struct SMMUTransCfg {
>>      /* Shared fields between stage-1 and stage-2. */
>>      SMMUStage stage;           /* translation stage */
>> +    SMMUSecSID sec_sid;        /* cached sec sid */
> I am now wondering if sec_sid shall be part of the TransCfg as this is
> never decoded from STE/CD, sin't it.

Having slept over it, caching sed_id here indicates whether the secure
stream table was used for decoding. So that can be considered as a
result of the config decode process.

a minor comment though, I think I would prefer having cfg->sec_sid
populated in smmuv3_decode_config as the other cfg fields. Meaning I
would rather add sed_sid to smmuv3_decode_config signature.

Thanks

Eric

> 
> Eric
>>      bool disabled;             /* smmu is disabled */
>>      bool bypassed;             /* translation is bypassed */
>>      bool aborted;              /* translation is aborted */
> 


