Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED36C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:12:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYFq-000530-EO; Tue, 30 Jun 2026 09:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weYFn-00052O-JU
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weYFm-0003dY-0B
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782825109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xxmLSENPR1sSMK9+/aPMPjVkH+BvQrkMchhb6zfZx8=;
 b=NGuC8lwVzJB7V2FCwkp8aEEcKnDy9FsoDKso4dOvYzvgbF94IQXFEKnNUZ51C7/98Rwz85
 ge6lvb9CVv82aChPntX1jp6wiXy6VXyQ5qlVrldbBLlPsHNce8k3i5Rm0rDMGv68WgM0+n
 ZzoayCFtVJDSwRnS3lhPHoIVmUvIMqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-AUc_DSDGNzWXiYDx8J1NqA-1; Tue, 30 Jun 2026 09:11:47 -0400
X-MC-Unique: AUc_DSDGNzWXiYDx8J1NqA-1
X-Mimecast-MFC-AGG-ID: AUc_DSDGNzWXiYDx8J1NqA_1782825106
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-493bb6a4336so5720205e9.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825106; x=1783429906;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xxmLSENPR1sSMK9+/aPMPjVkH+BvQrkMchhb6zfZx8=;
 b=oWh2fwU4XvJFemMdrJOpSVDxf1NWFgpAheIUeySGTVj/V/U+nSaACkB1+z0i/pxAEB
 xjebAIKWTO+AFLqXuexGj+FkSaNFfEE4PHm/RXLxqKsF0QufYoKuWK+ngJaXK+LXsTGI
 V4nQDJDHW05wr5L1CJTBwOk7zvYkRVY8d3xoPwNqZibVPrDmPqId3H8CkQ6ZGYv9LtMb
 ZoXgxwZC/EkaxFsoaTMNXWn/Q6ELiE7zi2QoZxcrZYoZY9Tx0IIUmNb5BfxOi+nLINXd
 g9QLjtkP4fC7IMitaoDdFAw12JJYM380oqgdusekZMYc9Z0xG42AuBgzubcB/gg2XNuE
 YZbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/EDZTFDgaTVAdX5DIztAQfgL+ir4cpNq8JqvXd/EHg5yRTUgRe6yfZrHyACvNgXZ+QDSAmUH0/Yg==@nongnu.org
X-Gm-Message-State: AOJu0YybWDP41RRFWevv1fCgmtDl3Dbym3Mart7txBvddeasIqbAvcvv
 hWEF6QJvj+H2eUprua19OultC8k/fgVrD2YTJcQrmG/+3a7UK3xiUo/RvI437tT5RDiEFd9g/qP
 Uz6u/sLmee3T2CAG7+OFttfzDJcg8yQg9thy6cUSh9J6KJGZe6fhaoA==
X-Gm-Gg: AfdE7cnQzfL7EWaVWsVMmVW+byd3B6ftCYD2X7rs1bF0u+q9c6xjWaJwCtje+u10jQD
 Vli0ipdv3RDsYgWpmjbZbp/jSB9YGE7Zq93Fcl4sxQYxcZakX6kicQNghFY/VkQtZ35kA0OEFsd
 eRuB/TrxVnjNiReTqc06owUn62Iq3LprGE4K5TZQ6xNgUn0RP4Rloukaxmra+mzJH9J0d0PmA/V
 QppTx9SfRf12RoESZIPixhZVRuodyJtULZkcukQrBU3H03R2DD7E8zmK+hw1j5NtKQyzWHj2E7W
 UVOyJM//0Nw8zTLKHFhXizmjfH4m7mYvFK7JSMP2yr6TvsDSZuc2LLnFUn12KHEXGkraqzfvJTA
 U9Deq79L7k5cFsPxSPbMODaX34RvDYNCt3DadyzbRUMIn5lUzGHLWWS0oa5I=
X-Received: by 2002:a05:600c:c493:b0:493:b61c:72c3 with SMTP id
 5b1f17b1804b1-493b82b6360mr53630855e9.32.1782825106235; 
 Tue, 30 Jun 2026 06:11:46 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:493:b61c:72c3 with SMTP id
 5b1f17b1804b1-493b82b6360mr53630335e9.32.1782825105757; 
 Tue, 30 Jun 2026 06:11:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8c70aebsm77034265e9.4.2026.06.30.06.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:11:45 -0700 (PDT)
Message-ID: <d3840d33-5e34-4c23-8704-9e729559dc10@redhat.com>
Date: Tue, 30 Jun 2026 15:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Sanitize SMMU_S_STRTAB_BASE_CFG.SPLIT
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>
References: <20260630083042.2692392-1-eric.auger@redhat.com>
 <20260630083042.2692392-2-eric.auger@redhat.com>
 <SJ0PR12MB8614BCB8A6B565224E8468ABABF72@SJ0PR12MB8614.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR12MB8614BCB8A6B565224E8468ABABF72@SJ0PR12MB8614.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GvzSAFl8n8u0zVUqQe3kFnC9OXCTxOCLRhvL6Dh8c7A_1782825106
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Shameer,

On 6/30/26 11:11 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 30 June 2026 09:30
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>> berrange@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>; Nathan
>> Chen <nathanc@nvidia.com>
>> Subject: [PATCH 1/2] hw/arm/smmuv3: Sanitize
>> SMMU_S_STRTAB_BASE_CFG.SPLIT
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Currently the guest value for the SPLIT field is not checked.
>> Also the spec says that values different from 6, 8, 10, respectively
>> meaning 4KB, 16kB and 64kB leaf tables are reserved and behave as 6.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 5e5a6a960c9..0a8d2fbb6a7 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1688,6 +1688,13 @@ static MemTxResult smmu_writel(SMMUv3State
>> *s, hwaddr offset,
>>          s->strtab_base_cfg = data;
>>          if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
>>              s->sid_split = FIELD_EX32(data, STRTAB_BASE_CFG, SPLIT);
>> +            if (s->sid_split != 6 && s->sid_split != 8 && s->sid_split != 10) {
>> +                /* Other values are reserved, behave as 6 */
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "Invalid STRTAB_BASE_CFG.SPLIT=0x%b, use 0b0110\n",
>> +                              s->sid_split);
> 0x%b is confusing. I think either 0b%b or %u is better.
sure replaced by
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Invalid STRTAB_BASE_CFG.SPLIT=%u, use 6
instead\n",

Thanks

Eric
>
> Other than that,
>
> Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
>
> Thanks,
> Shameer
>


