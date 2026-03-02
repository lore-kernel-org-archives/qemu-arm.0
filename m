Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F660EB362A
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 18:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx7yJ-0008TE-3F; Mon, 02 Mar 2026 13:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7yG-0008Rs-UP
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 13:26:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7yE-0000at-PB
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 13:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772475976;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LMPDnzTdQWb62mSQwVVw83c4qst9S9fTL7tQ9pE7qg=;
 b=hTaPSwNClO+8VIZ1rxox3tRS4Y0ppCQ8mZ13BiIFoSDb7TPXbSchgvOubMJ+Wm/6T++xkw
 UuufcgN59gteilvW1tYXl6VS2OQD2ECyznBqmY7akXGcuNjDy4DZvAMKeb8C05T//5OPVu
 QQUUt6KgJwE0dCTWotKQZMFBCTFZOQM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-m3vX2M7KM82CdK5PgHsJ8A-1; Mon, 02 Mar 2026 13:26:15 -0500
X-MC-Unique: m3vX2M7KM82CdK5PgHsJ8A-1
X-Mimecast-MFC-AGG-ID: m3vX2M7KM82CdK5PgHsJ8A_1772475974
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso39583735e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 10:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772475974; x=1773080774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2LMPDnzTdQWb62mSQwVVw83c4qst9S9fTL7tQ9pE7qg=;
 b=Z/3lTb6gwqdphLGrKxe8eGki0O438Sgdlhk1zTFYFJLw3S8pI103JG1B94Yx3jxyoM
 lQdhn8oRaWkKDb+INeoxTViC3YAlZylf3HXOQJB3sPPAtLVZMZu1Jpe4LfTLvc8laAHK
 x2gOkxNl4Rk4PGtP6x88vtutq8MjezpgeNRLBChTnS6VypmpjDQHaaWJRN4ipBHspXFS
 tYRX/K+RcOxIxoHshiqgEYgWEGvbISrHPuebYoRcx0PcZTu4kARK1Oz9dfTm/vD1M3uw
 BFhS8nyZUH43JqDCskpA6yNrPP1VvsCVa7BeCLihVNLjkHmijyoNgNsTyIFjlKqHm86F
 CyUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIlbqqHS0F4CUrgG0IGHO4how/H3+JuDyTkl0sDw4ZClD/MHoehQRjlLbj85dBjSvhQvujA/Dm3A==@nongnu.org
X-Gm-Message-State: AOJu0Yz9zaCoOR9nNB4fONCzdB2YVwz4xEwftG8f2G48wbW1b+yHHGAR
 r0FEkUwwwh5hGlsD2E4kjVm6jCHb9KG8uMobhQc6jOKsj+eUX8S90vrFg+EBNLkBq3vxUPWcZxd
 69F/1tNmlIliQSkZ8s+NQN0fDuy9p1B59c/uApEOJRXSm2k/8xv2ojA==
X-Gm-Gg: ATEYQzy8AxOu/zojqA7uX/4OUXZ4VldB7N9WEceDEQ+pB2DJBMI9Oki4fkvIVusQBz7
 hAHpN4yDL4gE5GOvGTRtclg/lu/w6nghW3RBHNLA2d/48rJ0WcoCRTrIukYbQ60mbFFB0awOFgv
 hq7FbiszyxF7+x+dj7q0Owb9MD1SP2BViZ1Fe9s08aMtTGmS7RL2tqmB0KxFuu3BGdmysECJnEZ
 cWYyrk6a/hhz9ji/8Bk/K752CDo/Hq23z8l7lD5R41BOpTRBlomtUXcxlnMHCiaYqsR32KmYosn
 ufMn220wpanBWzRAxpNaSQWUEiAqQ9/MP+h5iysfQomMagtijGpDl2+7rafAvrH11iW4MPoL1wI
 04vM5NVgyZpkz8N9unmH9ZJIXQTBQVOpkNazWLJhFDQDCrD92fzAalk5JfGvYCPD+rw7uPQ==
X-Received: by 2002:a05:600c:8106:b0:483:456a:5146 with SMTP id
 5b1f17b1804b1-483c9c24049mr207664855e9.25.1772475973876; 
 Mon, 02 Mar 2026 10:26:13 -0800 (PST)
X-Received: by 2002:a05:600c:8106:b0:483:456a:5146 with SMTP id
 5b1f17b1804b1-483c9c24049mr207664665e9.25.1772475973431; 
 Mon, 02 Mar 2026 10:26:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ba2a58dasm6094724f8f.27.2026.03.02.10.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 10:26:12 -0800 (PST)
Message-ID: <6a6144fe-3db3-4ce8-8a8c-c1391d7aa550@redhat.com>
Date: Mon, 2 Mar 2026 19:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 16/31] hw/arm/smmuv3: Plumb SEC_SID through IOMMU
 notifier path
To: Mostafa Saleh <smostafa@google.com>, Tao Tang <tangtao1634@phytium.com.cn>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101706.2994213-1-tangtao1634@phytium.com.cn>
 <aaGumxmrKRelouE7@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aaGumxmrKRelouE7@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nlYsizWhChunfX1Q3emN0A5uUipb4aLSGHhs_1oMiIo_1772475974
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 2/27/26 3:47 PM, Mostafa Saleh wrote:
> On Sat, Feb 21, 2026 at 06:17:06PM +0800, Tao Tang wrote:
>> Extend IOMMU notifier functions to be SEC_SID-aware, ensuring that
>> invalidation notifications are dispatched to the correct security-aware
>> address space.
>>
>> This ensures IOMMU notifier events (e.g., to VFIO) are correctly routed
>> to the appropriate security world's address space, maintaining isolation
>> between secure and non-secure DMA operations.
> I don’t think that VFIO cares about secure regime, my guess is to
> keep the functions as this and don’t call them for secure invalidations.

So do we want to prevent VFIO devices from working in secure mode along
with the SMMU?

Eric
>
> Thanks,
> Mostafa
>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> ---
>>  hw/arm/smmuv3.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 4a4de719a7c..e33a7babd1c 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1195,15 +1195,16 @@ epilogue:
>>   * @tg: translation granule (if communicated through range invalidation)
>>   * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
>>   * @stage: Which stage(1 or 2) is used
>> + * @sec_sid: StreamID Security state
>>   */
>>  static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>                                 IOMMUNotifier *n,
>>                                 int asid, int vmid,
>>                                 dma_addr_t iova, uint8_t tg,
>> -                               uint64_t num_pages, int stage)
>> +                               uint64_t num_pages, int stage,
>> +                               SMMUSecSID sec_sid)
>>  {
>>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>>      SMMUEventInfo eventinfo = {.sec_sid = sec_sid,
>>                                 .inval_ste_allowed = true};
>>      SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo, sec_sid);
>> @@ -1251,7 +1252,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>      }
>>  
>>      event.type = IOMMU_NOTIFIER_UNMAP;
>> -    event.entry.target_as = &address_space_memory;
>> +    event.entry.target_as = smmu_get_address_space(sdev->smmu, sec_sid);
>> +    g_assert(event.entry.target_as);
>>      event.entry.iova = iova;
>>      event.entry.addr_mask = num_pages * (1 << granule) - 1;
>>      event.entry.perm = IOMMU_NONE;
>> @@ -1262,7 +1264,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>  /* invalidate an asid/vmid/iova range tuple in all mr's */
>>  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>>                                        dma_addr_t iova, uint8_t tg,
>> -                                      uint64_t num_pages, int stage)
>> +                                      uint64_t num_pages, int stage,
>> +                                      SMMUSecSID sec_sid)
>>  {
>>      SMMUDevice *sdev;
>>  
>> @@ -1274,7 +1277,8 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>>                                          iova, tg, num_pages, stage);
>>  
>>          IOMMU_NOTIFIER_FOREACH(n, mr) {
>> -            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages, stage);
>> +            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg,
>> +                               num_pages, stage, sec_sid);
>>          }
>>      }
>>  }
>> @@ -1307,7 +1311,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage,
>>      if (!tg) {
>>          trace_smmuv3_range_inval(sec_sid, vmid, asid, addr,
>>                                   tg, 1, ttl, leaf, stage);
>> -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
>> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage, sec_sid);
>>          if (stage == SMMU_STAGE_1) {
>>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, sec_sid);
>>          } else {
>> @@ -1331,7 +1335,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage,
>>          trace_smmuv3_range_inval(sec_sid, vmid, asid, addr, tg,
>>                                   num_pages, ttl, leaf, stage);
>>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg,
>> -                                  num_pages, stage);
>> +                                  num_pages, stage, sec_sid);
>>          if (stage == SMMU_STAGE_1) {
>>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
>>                                  num_pages, ttl, sec_sid);
>> -- 
>> 2.34.1
>>


