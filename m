Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6FBCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 15:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPMPO-0007mS-ES; Tue, 19 May 2026 11:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPMP3-0007gr-Ig
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPMOz-00026n-4A
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779204635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbFnpEON0Fz2Cokbg36/sVGM6cgSUagu+eJrzPU6cbE=;
 b=W4HC+md7lhoc6bQQynIqxbvD5b1ph3SwKtu3MB0C+vPhenCbPsu6orC7ZetYKNzdDnfLeX
 g0ayqaZn0TCXVJ0kZN4Emb6gTYZrR5JLlvx1stQ9X/y9ww73u9bimaPj08b++Z79g5G8cv
 JLac6NbMz27yMG4/7hxUMPYEUvOPqw4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Z4fC6kMZPNem2J3H3qCMCw-1; Tue, 19 May 2026 11:30:34 -0400
X-MC-Unique: Z4fC6kMZPNem2J3H3qCMCw-1
X-Mimecast-MFC-AGG-ID: Z4fC6kMZPNem2J3H3qCMCw_1779204633
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45e78dd7baaso2560252f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 08:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779204633; x=1779809433;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbFnpEON0Fz2Cokbg36/sVGM6cgSUagu+eJrzPU6cbE=;
 b=qIXvZhPqH5KkBIUJAwD/Jst1k1zFASLdFQWPVdhPmJs/pjMpbn9tJhK1PHBLVH9T08
 liZT0jpCLQKluf9azTmnMyioiaXhIr9rVMG82LNIxl79aW2eruE2Qm6QK4Zli1aWV8Du
 /Ifm/x2j2AEID7y9sOQ5LSj4/ghkR6JimXOL89M8I9E3WZqZ2VCBXIg4UXQGvzC9qZce
 2oij0zIhgzeyTndjl6bzTzcnpKUSlp+rCqeWUL60bArhP3ZIYYjsLRjwbmF7fwZg7p8b
 b/zxRyv4TMXUALtGrFBo/PwGJGCH9eZSWpRHpYsm70DZd4rWSAZluHE7ruV/TcnIh/wz
 rqKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8X5lLS4b9QkawOsQydJVCY0QD1w+NImMZf75yxI4vR/4XyMDcGbGdvB0bdOMGEctu5HvVIheShSA==@nongnu.org
X-Gm-Message-State: AOJu0YxwzICRL3ViSd3VYhN9XY8v/oIeIM5G9aw2e0lPM1W2qe7voCeT
 +FSsUhmYshR5RhUhCJG837TJXzNxZMF7WUDMIlq+xNoWRFllw8K9CeTuxWfqKqQAyYyQ1ar9/kD
 +3vo4UKC8l79ah612B6Z9J6g/dwIEvK6wbHsvZONb4s2zDQ++RntHOw==
X-Gm-Gg: Acq92OH4MSMVDPRWeOQegJkMO+/sat9wKn1YzEjZlX5fm67/IFu0HeqRr0D8TxcLoKo
 OHdQrN0U1gC040AhMQx7SK6VGitzx6Uzuyu/hZgsgPVc408jmZh8URxF6Q+dm0S4lc4XCMIr4yg
 DSQAg9lnkdnFz0sr14Z3Bs+JuqkmAxLoKvXAOt8EY8KJio5zprZCba7AfupC3TfGVZQmG7tn8vL
 x8iNEwTd/HnD7m8phTjkV+SMrvggMeta6CjgaEWCSdgpAdOFsB0XKmAmCq4jQgOxDi1hTJ1A4m7
 tO04OaNbd52Cl7S1VOYsuI6V/obQIGiaawSwwOfnhHCZsxhL7T+SwL9Xv5EOr+Ows6Ctv6sC5//
 dd4SJZRZoVULN7CWYGZcixU9O5oxN/V9poyNto0JZwSMITdrfNYWLVN1KC6cZ0cyosvcGBQ==
X-Received: by 2002:a05:600c:a102:b0:489:a4:e578 with SMTP id
 5b1f17b1804b1-48fe60da919mr234142785e9.14.1779204632961; 
 Tue, 19 May 2026 08:30:32 -0700 (PDT)
X-Received: by 2002:a05:600c:a102:b0:489:a4:e578 with SMTP id
 5b1f17b1804b1-48fe60da919mr234142345e9.14.1779204632561; 
 Tue, 19 May 2026 08:30:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm42999648f8f.11.2026.05.19.08.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 08:30:31 -0700 (PDT)
Message-ID: <13629ab2-f89c-42d9-9be1-8341e8146835@redhat.com>
Date: Tue, 19 May 2026 17:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] hw/arm/smmuv3-accel: Implement "auto" value for
 "ats"
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nathan Chen <nathanc@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260512193520.3109172-1-nathanc@nvidia.com>
 <20260512193520.3109172-3-nathanc@nvidia.com>
 <CH3PR12MB75488C9306659D939ACEE203AB072@CH3PR12MB7548.namprd12.prod.outlook.com>
 <cb3f2ace-be0d-4b5a-ad3e-9de541a2444a@nvidia.com>
 <CH3PR12MB75482526F3E2B515168A1E16AB042@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75482526F3E2B515168A1E16AB042@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bZV4qSFzrrAcSd0qEfsCle4ZGNGiiD63JMhbpg0Eix0_1779204633
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/15/26 9:55 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nathan Chen <nathanc@nvidia.com>
>> Sent: 14 May 2026 21:07
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: Eric Auger <eric.auger@redhat.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Philippe Mathieu-Daudé <philmd@linaro.org>;
>> Zhao Liu <zhao1.liu@intel.com>; Matt Ochs <mochs@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>
>> Subject: Re: [PATCH v3 2/7] hw/arm/smmuv3-accel: Implement "auto" value
>> for "ats"
> [...]
>  
>>>>       object_class_property_set_description(klass, "oas",
>>>>           "Specify Output Address Size (for accel=on). Supported values "
>>>>           "are 44 or 48 bits. Defaults to 44 bits. oas=auto is not "
>>> In smmuv3.c we have;
>>>
>>> case SMMU_CMD_ATC_INV:
>>>          {
>>>              SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
>>>
>>>              if (!sdev || !s->ats) {
>>>                  trace_smmuv3_unhandled_cmd(type);
>>>                  break;
>>>              }
>>>
>>>              if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, errp)) {
>>>                  cmd_error = SMMU_CERROR_ILL;
>>>                  break;
>>>              }
>>>              break;
>>>          }
>>>
>>> The above !s->ats will be true for AUTO case, right? I think
>>> we should change the above check with smmuv3_ats_enabled().
>>>
>>> Also, since we modified the ats to OnOffAuto in the previous
>>> series, I am not sure the above should be a fix patch or not.
>> I see, I will use smmuv3_ats_enabled() here to account for the AUTO
>> case. I am not sure if it should have the Fixes tag either but let's see
>> if we can get any guidance on that point.
> The default ats with previous series is ON_OFF_AUTO_OFF(=2). So even
> if ats is not visible to guest, a malicious guest issuing ats may end up
> getting forwarded to host. So, I think we should fix it.

good catch. Effectively you may add a preamble commit fixing this in
this series with the corresponding Fixes tag. Even can be Stable to
apply on previous 11.0. version

Eric
>
> Thanks,
> Shameer
>
>
>


