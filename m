Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FBEE7DEF0
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 15:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmvSl-0003Kj-Cr; Mon, 02 Feb 2026 10:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmvSk-0003Fh-9q
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmvSh-0005hz-SO
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770044614;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yn/KZSp/3OpzMS7JiLu6gWmreyeVVT9rIffbH8JPOr8=;
 b=HXnr+ZEXfuxl2PdmJvByFRyCzall++s4qOyRI4ql/eH3lCiC9m6b6CZybu85qZ1PG8wyXr
 sqqvBnykZPODwrqu0x46PCzLsVaSwuQYS1Oi2UoYJ+vLPJqE1JaM3gAYVejfurVKRczbKR
 SQizMm8BNpkaejyHSxZhxegFJ2U1aAs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-8egHo8X8Pmey1qRj_vkKhQ-1; Mon, 02 Feb 2026 10:02:53 -0500
X-MC-Unique: 8egHo8X8Pmey1qRj_vkKhQ-1
X-Mimecast-MFC-AGG-ID: 8egHo8X8Pmey1qRj_vkKhQ_1770044572
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b8de2b2ec8fso454297066b.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 07:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770044572; x=1770649372;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yn/KZSp/3OpzMS7JiLu6gWmreyeVVT9rIffbH8JPOr8=;
 b=u4qh34NxI40rsy0SlvvwhBfCDQjEssh8UABpdhf8mf/ge+dEMOXHqRKJjzGav30pap
 f07rDehXGIQ9bSQSZpUCwDRlxYI7/MwUsgHQXEoo3ntAHZ5gH69iT6q5m842SFyXE+yM
 lluadKCVUVD6Zexj0NfCQ3ezACbQYNqEIBOpIfe1UmOHwVZCdB5KMvMzobm7MIlDbCqr
 uE9p2tN2TGXPA1bz7E/wtyIDKzNWfJeeWqQTWqFkG7ZGJPLjPhGehd6ZqzKDqUCyS4pu
 RUxkClPJn7zoPl+P3Q03Bjay2EvfHOIVIBjR7b3wmwdThjzJPBiH0OHvwj4akHsjfEXY
 l2ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJiHUvnXGF1/2xblZ5KYjPym+nDxyJ3IZjtPLVPc2NUXhfiGDPjYZlXnw69rJ/O+SQZa6dRUZX4A==@nongnu.org
X-Gm-Message-State: AOJu0YwOqzH1JNouklkkdUQFp1oYcuF4jbtzLAkLdb9T34M4vYcLSXiL
 j+MwYUeBtwEqkkW9wuS1YWYVKxm4UCRC50RKpCyFujWE5Zli7DQ14S79C+IwZM7huIC/DpsZBFY
 I/KzQjP0nsJnoJtAf9w6B+yYAnWynnqWnKARyy64OtLLbqumKDX2/QQ==
X-Gm-Gg: AZuq6aIFTv4u5KqL2+Y/aufX9OkXitTpxQ+1Y9GMUnIRHLA24y2ozmWHxG1hHmOs0yG
 bfssTHLX0jH4ZnIFyk/IJP/9RzocVKuWc+B2V5z6Y7pZqveuPVxBZEkfc4aWfH78s68McPQmZQZ
 ZdeTt3/rAn6sR+K/Ud1vo7AlKYSynnzpr+fmoxIVG/Kyv7RYsWmbSO6jGJsK+xCOaWy3UBAFs1R
 Vn9EQyTn+HogzNlIZJNygm3xh227Uu4VvDBh/HTnQZnLeHw9scVGkGRAqEGSPVPE1/r55EGIG+A
 PF0+SaQEiKqm9KMwKh3vds/COeQIoOAaaKuCl/u6rZoNq6DM/VAeNpQjlzPfyJZ4rgq2ww3cRYG
 K9lS1UfTEm5Fa7KSSXetl5CDDXnH9LxPEXKRqDcOiL7iwEjNeKebfcPcRwg==
X-Received: by 2002:a17:907:3d56:b0:b87:3174:9bdd with SMTP id
 a640c23a62f3a-b8dff61c70amr800496166b.28.1770044571613; 
 Mon, 02 Feb 2026 07:02:51 -0800 (PST)
X-Received: by 2002:a17:907:3d56:b0:b87:3174:9bdd with SMTP id
 a640c23a62f3a-b8dff61c70amr800493166b.28.1770044571149; 
 Mon, 02 Feb 2026 07:02:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbefc6995sm867121866b.24.2026.02.02.07.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 07:02:50 -0800 (PST)
Message-ID: <d6899c99-de05-4c0d-abb8-97247fe3fbda@redhat.com>
Date: Mon, 2 Feb 2026 16:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260127103328.255382-1-skolothumtho@nvidia.com>
 <20260127103328.255382-5-skolothumtho@nvidia.com>
 <0bbdecdc-f997-4a3e-8023-f50ed629128f@redhat.com>
 <CH3PR12MB7548DB2591BCB7ABB47136D3AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548DB2591BCB7ABB47136D3AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HdW6PhOQvseMWBNP9ot71QCCcgMZWRCzkQFGpY2xgF8_1770044572
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/2/26 3:12 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 02 February 2026 12:59
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Nicolin Chen <nicolinc@nvidia.com>; Nathan
>> Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jason
>> Gunthorpe <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v3 4/4] hw/arm/smmuv3-accel: Read and propagate host
>> vIOMMU events
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 1/27/26 11:33 AM, Shameer Kolothum wrote:
>>> Install an event handler on the vEVENTQ fd to read and propagate host
>>> generated vIOMMU events to the guest.
>>>
>>> The handler runs in QEMU’s main loop, using a non-blocking fd registered
>>> via qemu_set_fd_handler().
>>>
>>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/smmuv3-accel.c | 60
>> +++++++++++++++++++++++++++++++++++++++++++
>>>  hw/arm/smmuv3-accel.h |  2 ++
>>>  2 files changed, 62 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>> index e8028d4be5..ab57eae575 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -390,6 +390,60 @@ bool
>> smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice
>> *sdev,
>>>                     sizeof(Cmd), &entry_num, cmd, errp);
>>>  }
>>>
>>> +static void smmuv3_accel_event_read(void *opaque)
>>> +{
>>> +    SMMUv3State *s = opaque;
>>> +    SMMUv3AccelState *accel = s->s_accel;
>>> +    struct {
>>> +        struct iommufd_vevent_header hdr;
>>> +        struct iommu_vevent_arm_smmuv3 vevent;
>>> +    } buf;
>>> +    ssize_t readsz = sizeof(buf);
>>> +    uint32_t last_seq = accel->last_event_seq;
>>> +    ssize_t bytes;
>>> +
>>> +    bytes = read(accel->veventq->veventq_fd, &buf, readsz);
>> in case we receive a header with LOST_EVENTS at the end of tail, no data
>> is expected. So I am not sure you will be able to handle that case.
> Good catch. We need to check bytes < sizeof(hdr) first to cover
> that.
>
>>> +    if (bytes <= 0) {
>>> +        if (errno == EAGAIN || errno == EINTR) {
>>> +            return;
>>> +        }
>>> +        error_report("vEVENTQ: read failed (%m)");
>> _once?
>>> +        return;
>>> +    }
>>> +
>>> +    if (bytes < readsz) {
>>> +        error_report("vEVENTQ: incomplete read (%zd/%zd bytes)", bytes,
>> readsz);
>>> +        return;
>>> +    }
>>> +
>>> +    if (buf.hdr.flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS) {
>>> +        error_report("vEVENTQ has lost events");
>>> +        accel->event_start = false;
>>> +        accel->last_event_seq = 0;
>> actually I read again the include/uapi/linux/iommufd.h and nothing tells
>> sequence == 0 after a LOST_EVENTS.
> Yes. Sequence looks to be continuous.
>
>>> +        return;
>>> +    }
>>> +
>>> +    /* Check sequence in hdr for lost events if any */
>>> +    if (accel->event_start) {
>>> +        uint32_t expected = (last_seq == INT_MAX) ? 0 : last_seq + 1;
>>> +
>>> +        if (buf.hdr.sequence != expected) {
>> But can this happen? Normally you should have a LOST_EVENTS reported by
>> the kernel, no?
> From the header:
> "
> And this sequence index is expected to be monotonic to the sequence index of
> the previous vEVENT. If two adjacent sequence indexes has a delta larger than
> 1, it means that delta - 1 number of vEVENTs has lost, e.g. two lost vEVENTs:
> "
>
> It doesn't say the FLAG_LOST_EVEN will be set for above.

agreed. I missed that. 

Thanks

Eric
>
> AFAICS,  the only case where the flag set is for below one:
> "
> If a vEVENT lost at the tail of the vEVENTQ and there is no following vEVENT
> providing the next sequence index, an IOMMU_VEVENTQ_FLAG_LOST_EVENTS
> header would be added to the tail, and no data would follow this header:
>  "
>
>  *
>>> +            uint32_t delta;
>>> +
>>> +            if (buf.hdr.sequence >= last_seq) {
>>> +                delta = buf.hdr.sequence - last_seq;
>>> +            } else {
>>> +                /* Handle wraparound from INT_MAX */
>>> +                delta = (INT_MAX - last_seq) + buf.hdr.sequence + 1;
>>> +            }
>>> +            error_report_once("vEVENTQ: detected lost %u event(s)", delta - 1);
>>> +        }
>>> +    }
>>> +    accel->last_event_seq = buf.hdr.sequence;
>>> +    accel->event_start = true;
>>> +    smmuv3_propagate_event(s, (Evt *)&buf.vevent);
>>> +}
>>> +
>>>  static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>>>  {
>>>      IOMMUFDVeventq *veventq = accel->veventq;
>>> @@ -397,6 +451,8 @@ static void
>> smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>>>      if (!veventq) {
>>>          return;
>>>      }
>>> +    qemu_set_fd_handler(veventq->veventq_fd, NULL, NULL, NULL);
>>> +    close(veventq->veventq_fd);
>>>      iommufd_backend_free_id(accel->viommu->iommufd, veventq-
>>> veventq_id);
>>>      g_free(veventq);
>>>      accel->veventq = NULL;
>>> @@ -439,6 +495,10 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State
>> *s, Error **errp)
>>>      veventq->veventq_fd = veventq_fd;
>>>      veventq->viommu = accel->viommu;
>>>      accel->veventq = veventq;
>>> +
>>> +    /* Set up event handler for veventq fd */
>>> +    fcntl(veventq_fd, F_SETFL, O_NONBLOCK);
>> Looks this can fail.
> Ok. Will add a check.
>
> Thanks,
> Shameer


